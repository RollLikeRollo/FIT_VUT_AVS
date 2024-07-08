/**
 * @file    tree_mesh_builder.h
 *
 * @author  Jan Zbořil <xzbori20@stud.fit.vutbr.cz>
 *
 * @brief   Parallel Marching Cubes implementation using OpenMP tasks + octree early elimination
 *
 * @date    30. 11. 2022
 **/

#ifndef TREE_MESH_BUILDER_H
#define TREE_MESH_BUILDER_H

#include "base_mesh_builder.h"

class TreeMeshBuilder : public BaseMeshBuilder
{
public:
    TreeMeshBuilder(unsigned gridEdgeSize);

protected:
    unsigned marchCubes(const ParametricScalarField &field);
    float evaluateFieldAt(const Vec3_t<float> &pos, const ParametricScalarField &field);
    void emitTriangle(const Triangle_t &triangle);
    const Triangle_t *getTrianglesArray() const { return mTriangles.data(); }

    unsigned int recTree(const Vec3_t<float> &cube_vec, const ParametricScalarField &field, unsigned int);
    // unsigned evalTree(const Vec3_t<float> &position, const ParametricScalarField &field, size_t cubeSize);

    std::vector<Triangle_t> mTriangles; ///< Temporary array of triangles
    std::vector<std::vector<BaseMeshBuilder::Triangle_t>> tmp_vec;

};

#endif // TREE_MESH_BUILDER_H
