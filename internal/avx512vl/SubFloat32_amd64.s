//go:build amd64
// +build amd64

// func SubFloat32(left, right, result []float32) int
TEXT ·SubFloat32(SB), 4, $0
    //Load slices lengths.
    MOVQ    leftLen+8(FP), AX
    MOVQ    rightLen+32(FP), BX
    MOVQ    resultLen+56(FP), CX
    //Get minimum length.
    CMPQ    AX, CX
    CMOVQLT AX, CX
    CMPQ    BX, CX
    CMOVQLT BX, CX
    //Load slices data pointers.
    MOVQ    leftData+0(FP), SI
    MOVQ    rightData+24(FP), DX
    MOVQ    resultData+48(FP), DI
    //Initialize loop index.
    MOVQ    $0, AX
multipleDataLoop:
    MOVQ    CX, BX
    SUBQ    AX, BX
    CMPQ    BX, $16
    JL      singleDataLoop
    //Sub sixteen float32 values.
    VMOVUPS (SI)(AX*4), Z0
    VMOVUPS (DX)(AX*4), Z1
    VSUBPS  Z1, Z0, Z2
    VMOVUPS Z2, (DI)(AX*4)
    ADDQ    $16, AX
    JMP     multipleDataLoop
singleDataLoop:
    CMPQ    AX, CX
    JGE     returnLength
    //Sub one float32 value.
    MOVSS   (SI)(AX*4), X0
    MOVSS   (DX)(AX*4), X1
    SUBSS   X1, X0
    MOVSS   X0, (DI)(AX*4)
    INCQ    AX
    JMP     singleDataLoop
returnLength:
    MOVQ    CX, int+72(FP)
    RET
