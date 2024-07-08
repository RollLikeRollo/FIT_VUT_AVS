/**
 * @file BatchMandelCalculator.cc
 * @author Jan Zboril <xzbori20@stud.fit.vutbr.cz>
 * @brief Implementation of Mandelbrot calculator that uses SIMD paralelization over small batches
 * @date 7. 11. 2022
 */

#include <iostream>
#include <string>
#include <vector>
#include <algorithm>

#include <stdlib.h>
#include <stdexcept>

#include "BatchMandelCalculator.h"

BatchMandelCalculator::BatchMandelCalculator (unsigned matrixBaseSize, unsigned limit) :
	BaseMandelCalculator(matrixBaseSize, limit, "BatchMandelCalculator")
{
	// @TODO allocate & prefill memory
	data = (int *)(malloc(height * width * sizeof(int)));
}

BatchMandelCalculator::~BatchMandelCalculator() {
	// @TODO cleanup the memory
	free(data);
	data = NULL;
}

int * BatchMandelCalculator::calculateMandelbrot () {
	// @TODO implement the calculator & return array of integers

	const unsigned short BATCH_S = 128;

	int *pdata = data;
	// int t;

	float zReal = 0;
	float zImag = 0;
	float r2 = 0;
	float i2 = 0;
	int value[width];
	std::fill(value, value + width, limit);

	float x[width];

	float i_arr[width];
	float r_arr[width];
	std::fill(i_arr, i_arr + width, 0.0f);
	std::fill(r_arr, r_arr + width, 0.0f);
	bool flags_arr[width];
	std::fill(flags_arr, flags_arr + width, false);
	

	for (u_short i = 0; i < height/2; i++)
	{
		float y = y_start + i * dy; // current imaginary value
		std::fill(value, value + width, limit);
		std::fill(flags_arr, flags_arr + width, false);
		// std::fill(i_arr, i_arr + width, 0.0f);
		// std::fill(r_arr, r_arr + width, 0.0f);
		// x = x_start;
		
		for (u_short k = 0; k < limit; ++k)
		{
			for (u_short j = 0; j < width; j+=BATCH_S)
			{
				#pragma omp simd aligned(x, i_arr, r_arr, flags_arr: 64)
				for (u_short m = 0; m < BATCH_S; m++){
					if (flags_arr[j + m])
					{
						continue;
					}

					if( k == 0 ){
						x[j + m] = x_start + (j + m) * dx; // current real value
						zReal = x[j + m];
						zImag = y;
					}else{
						zImag = i_arr[j + m];
						zReal = r_arr[j + m];
					}

					r2 = zReal * zReal;
					i2 = zImag * zImag;
					if (r2 + i2 > 4.0f){
						flags_arr[j + m] = true;
						value[j + m] = k;
						continue;
					}

					zImag = 2.0f * zReal * zImag + y;
					zReal = r2 - i2 + x[j + m];

					r_arr[j + m] = zReal;
					i_arr[j + m] = zImag;
				}
			}
		}
		# pragma omp simd aligned(pdata: 64) linear(i, pdata: 1)
		for (int a = 0; a < width; a++)
		{	
			// std::cout << i << " " << a << " " << value[a] << "\n";
			pdata[a + width * i] = value[a];
		}
		// fscanf(stdin, "%d", &t);
	}

	for(u_short i = height/2; i < height; i++){
		#pragma omp simd aligned(pdata: 64) linear(i, pdata: 1)
		for(u_short j = 0; j < width; j++){
			pdata[j + width * i] = pdata[j + width * (height - i - 1)];
		}
	}

	return data;
}