/**
 * @file    loop_mesh_builder.cpp
 *
 * @author  Jan Zbořil <xzbori20@stud.fit.vutbr.cz>
 *
 * @brief   Parallel Marching Cubes implementation using OpenMP loops
 *
 * @date    29. 11. 2022
 **/

#include <iostream>
#include <math.h>
#include <limits>
#include <omp.h>

#include "loop_mesh_builder.h"

LoopMeshBuilder::LoopMeshBuilder(unsigned gridEdgeSize)
    : BaseMeshBuilder(gridEdgeSize, "OpenMP Loop")
{

}

unsigned LoopMeshBuilder::marchCubes(const ParametricScalarField &field)
{
    // 1. Compute total number of cubes in the grid.
    size_t totalCubesCount = mGridSize*mGridSize*mGridSize;

    unsigned totalTriangles = 0;
    unsigned numThreads = omp_get_max_threads();
    // omp_set_nested(2);
    // std::cout << "Using " << threadCount << " threads." << std::endl;

    // 2. Loop over each coordinate in the 3D grid.
    # pragma omp parallel for  shared(totalCubesCount, field) reduction(+:totalTriangles) schedule(auto) num_threads(numThreads)
    for(size_t i = 0; i < totalCubesCount; ++i)
    {
        // 3. Compute 3D position in the grid.
        Vec3_t<float> cubeOffset( i % mGridSize,
                                 (i / mGridSize) % mGridSize,
                                  i / (mGridSize*mGridSize));

        // 4. Evaluate "Marching Cube" at given position in the grid and
        //    store the number of triangles generated.
        totalTriangles += buildCube(cubeOffset, field);
    }

    // 5. Return total number of triangles generated.
    return totalTriangles;
}

float LoopMeshBuilder::evaluateFieldAt(const Vec3_t<float> &pos, const ParametricScalarField &field)
{
   // NOTE: This method is called from "buildCube(...)"!

    // 1. Store pointer to and number of 3D points in the field
    //    (to avoid "data()" and "size()" call in the loop).
    const Vec3_t<float> *pPoints = field.getPoints().data();
    const unsigned count = unsigned(field.getPoints().size());

    float value = std::numeric_limits<float>::max();

    // 2. Find minimum square distance from points "pos" to any point in the
    //    field.
    // #pragma omp parallel for shared(count, pos, pPoints) reduction(min:value) schedule(guided:128) num_threads(omp_get_max_threads() / 2)
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

void LoopMeshBuilder::emitTriangle(const BaseMeshBuilder::Triangle_t &triangle)
{
    #pragma omp critical(triangle)
    {
        mTriangles.push_back(triangle);
    }
}
