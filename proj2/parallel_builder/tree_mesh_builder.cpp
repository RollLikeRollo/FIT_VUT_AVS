/**
 * @file    tree_mesh_builder.cpp
 *
 * @author  Jan Zbořil <xzbori20@stud.fit.vutbr.cz>
 *
 * @brief   Parallel Marching Cubes implementation using OpenMP tasks + octree early elimination
 *
 * @date    30. 11. 2022
 **/

#include <iostream>
#include <math.h>
#include <limits>
#include <omp.h>

#include "tree_mesh_builder.h"

TreeMeshBuilder::TreeMeshBuilder(unsigned gridEdgeSize)
    : BaseMeshBuilder(gridEdgeSize, "Octree")
{
    unsigned short num_t = omp_get_max_threads();
    tmp_vec = std::vector<std::vector<BaseMeshBuilder::Triangle_t>>(num_t);
    
}

unsigned int TreeMeshBuilder::recTree(const Vec3_t<float> &cube_vec, const ParametricScalarField &field, unsigned int mGridSize){

    const unsigned CUT_OFF = 1;
    unsigned int triangle_count = 0;


    if (mGridSize <= 1 || mGridSize == CUT_OFF){
        
        auto built_cube = buildCube(cube_vec, field);
        
        # pragma omp critical(triangle_count)
        {
            triangle_count += built_cube;
        }
    }else{

        float fl_grid_size_half = ((float)mGridSize) / 2.0f;
        
        Vec3_t<float> cube_center(mGridResolution * (cube_vec.x + fl_grid_size_half),
                                mGridResolution * (cube_vec.y + fl_grid_size_half),
                                mGridResolution * (cube_vec.z + fl_grid_size_half));

        float f_empty_crit = mIsoLevel + (sqrt(3.0f) * (0.5f) * (float)mGridSize * mGridResolution);

        if(f_empty_crit >= evaluateFieldAt(cube_center, field)){
    
            for (int i = 0; i < 8; i++)
            {
                # pragma omp task shared(triangle_count, fl_grid_size_half, cube_vec, field)
                {
                    Vec3_t<float> new_cube_vec(0,0,0);
                    switch (i)
                    {
                    case 0:
                    case 1:
                        new_cube_vec = Vec3_t<float>(cube_vec.x + (i % 2) * fl_grid_size_half, cube_vec.y, cube_vec.z);
                        break;
                    case 2:
                    case 3:
                        new_cube_vec = Vec3_t<float>(cube_vec.x + (i % 2) * fl_grid_size_half, cube_vec.y + fl_grid_size_half, cube_vec.z);
                        break;
                    case 4:
                    case 5:
                        new_cube_vec = Vec3_t<float>(cube_vec.x + (i % 2) * fl_grid_size_half, cube_vec.y, cube_vec.z + fl_grid_size_half);
                        break;
                    case 6:
                    case 7:
                        new_cube_vec = Vec3_t<float>(cube_vec.x + (i % 2) * fl_grid_size_half, cube_vec.y + fl_grid_size_half, cube_vec.z + fl_grid_size_half);
                        break;

                    default:
                        break;
                    }
                    
                    auto child_tree = recTree(new_cube_vec, field, fl_grid_size_half);
                    
                    # pragma omp critical(triangle_count)
                    {
                        triangle_count += child_tree;
                    }
                }
            }
        }else{
            return 0;
        }
    }
    #pragma omp taskwait
    {
        return triangle_count;
    }
}

unsigned TreeMeshBuilder::marchCubes(const ParametricScalarField &field)
{

    unsigned totalTriangles = 0;

    # pragma omp parallel shared(field, mGridSize, totalTriangles) //reduction(+:totalTriangles)
    {
        # pragma omp single
        {
            totalTriangles = recTree(Vec3_t<float>(0.0f,0.0f,0.0f), field, mGridSize);
        }
    }
    
    for (auto &vec : tmp_vec)
    {
        mTriangles.insert(mTriangles.end(), vec.begin(), vec.end());
    }
    // totalTriangles = tmp_vec;
    return totalTriangles;
}

float TreeMeshBuilder::evaluateFieldAt(const Vec3_t<float> &pos, const ParametricScalarField &field)
{

    // NOTE: This method is called from "buildCube(...)"!

    // 1. Store pointer to and number of 3D points in the field
    //    (to avoid "data()" and "size()" call in the loop).
    const Vec3_t<float> *pPoints = field.getPoints().data();
    const unsigned count = unsigned(field.getPoints().size());

    float value = std::numeric_limits<float>::max();

    // 2. Find minimum square distance from points "pos" to any point in the
    //    field.
    for(unsigned i = 0; i < count; ++i)
    {
        float distanceSquared  = (pos.x - pPoints[i].x) * (pos.x - pPoints[i].x);
        distanceSquared       += (pos.y - pPoints[i].y) * (pos.y - pPoints[i].y);
        distanceSquared       += (pos.z - pPoints[i].z) * (pos.z - pPoints[i].z);

        // Comparing squares instead of real distance to avoid unnecessary
        // "sqrt"s in the loop.
        value = std::min(value, distanceSquared);
    }

    // 3. Finally take square root of the minimal square distance to get the real distance
    return sqrt(value);
}

void TreeMeshBuilder::emitTriangle(const BaseMeshBuilder::Triangle_t &triangle)
{
    // # pragma omp critical(triangle_push_back)
    // {
    //     mTriangles.push_back(triangle);
    // }

    tmp_vec[omp_get_thread_num()].push_back(triangle);
}
