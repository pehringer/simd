# SIMD (Single Instruction, Multiple Data)
Simd support via Go assembly for arithmetic and bitwise operations.
Allowing for parallel element-wise computations.
Resulting in **200 - 470%** speedup.
Currently only 64-bit x86 is supported.
Future 64-bit ARM support is planned.
## Function Documentation
- Online at [pkg.go.dev/github.com/pehringer/simd](https://pkg.go.dev/github.com/pehringer/simd).  
- Locally in ```simd.go``` GoDoc comments.
## AMD64 Simd Performance:
![Large Vectors](images/LargeVectorsFloat32Addition.png)
![Medium Vectors](images/MediumVectorsFloat32Addition.png)
![Large Vectors](images/SmallVectorsFloat32Addition.png)  
## AMD64 Simd Support
|          |SSE      |SSE2     |SSE4.1   |AVX      |AVX2     |
|----------|---------|---------|---------|---------|---------|
|AddFloat32|SUPPORTED|         |         |SUPPORTED|         |
|AddFloat64|         |SUPPORTED|         |SUPPORTED|         |
|AddInt32  |         |SUPPORTED|         |         |SUPPORTED|
|AddInt64  |         |SUPPORTED|         |         |SUPPORTED|
|AndInt32  |         |SUPPORTED|         |         |SUPPORTED|
|AndInt64  |         |SUPPORTED|         |         |SUPPORTED|
|DivFloat32|SUPPORTED|         |         |SUPPORTED|         |
|DivFloat64|         |SUPPORTED|         |SUPPORTED|         |
|DivInt32  |         |         |         |         |         |
|DivInt64  |         |         |         |         |         |
|MulFloat32|SUPPORTED|         |         |SUPPORTED|         |
|MulFloat64|         |SUPPORTED|         |SUPPORTED|         |
|MulInt32  |         |         |SUPPORTED|         |SUPPORTED|
|MulInt64  |         |         |         |         |         |
|OrInt32   |         |SUPPORTED|         |         |SUPPORTED|
|OrInt64   |         |SUPPORTED|         |         |SUPPORTED|
|SubFloat32|SUPPORTED|         |         |SUPPORTED|         |
|SubFloat64|         |SUPPORTED|         |SUPPORTED|         |
|SubInt32  |         |SUPPORTED|         |         |SUPPORTED|
|SubInt64  |         |SUPPORTED|         |         |SUPPORTED|
|XorInt32  |         |SUPPORTED|         |         |SUPPORTED|
|XorInt64  |         |SUPPORTED|         |         |SUPPORTED|
