// +build amd64

// func AddFloat32(left, right, result []float32) int
TEXT ·AddFloat32(SB), 4, $0
    //Load slices lengths.
    MOVQ    leftLen+8(FP), AX
    MOVQ    rightLen+32(FP), BX
    MOVQ    resultLen+56(FP), CX
    CMPQ    AX, CX
    JGE     compareLengths
    MOVQ    AX, CX
compareLengths:
    CMPQ    BX, CX
    JGE     initializeLoops
    MOVQ    BX, CX
initializeLoops:
    MOVQ    $0, AX
    //Load slices data pointers.
    MOVQ    leftData+0(FP), SI
    MOVQ    rightData+24(FP), DX
    MOVQ    resultData+48(FP), DI
multipleDataLoop:
    MOVQ    CX, BX
    SUBQ    AX, BX
    CMPQ    BX, $8
    JL      singleDataLoop
    //Add eight float32 values.
    VMOVUPS (SI)(AX*4), Y0
    VMOVUPS (DX)(AX*4), Y1
    VADDPS  Y1, Y0, Y2
    VMOVUPS Y2, (DI)(AX*4)
    ADDQ    $8, AX
    JMP     multipleDataLoop
singleDataLoop:
    CMPQ    AX, CX
    JGE     returnLength
    //Add one float32 value.
    MOVSS   (SI)(AX*4), X0
    MOVSS   (DX)(AX*4), X1
    ADDSS   X1, X0
    MOVSS   X0, (DI)(AX*4)
    INCQ    AX
    JMP     singleDataLoop
returnLength:
    MOVQ    CX, int+72(FP)
    RET