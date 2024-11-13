//go:build arm64
// +build arm64

// func AddFloat64(left, right, result []float64) int
TEXT ·AddFloat64(SB), 4, $0
    //Load slices lengths.
    MOVD    leftLen+8(FP), R0
    MOVD    rightLen+32(FP), R1
    MOVD    resultLen+56(FP), R2
    //Get minimum length.
    CMP     R0, R2
    CSEL    LT, R2, R0, R2
    CMP     R1, R2
    CSEL    LT, R2, R1, R2
    //Load slices data pointers.
    MOVD    leftData+0(FP), R3
    MOVD    rightData+24(FP), R4
    MOVD    resultData+48(FP), R5
    //Initialize loop index.
    MOVD    $0, R0
multipleDataLoop:
    SUB     R0, R2, R1
    CMP     $2, R1
    BLT     singleDataLoop
    //Add two float64 values.
    VLD1.P  16(R3), [V0.D2]
    VLD1.P  16(R4), [V1.D2]
    WORD    $0x4E61D402 //VFADD V1.D2, V0.D2, V2.D2
    VST1.P  [V2.D2], 16(R5)
    ADD     $2, R0, R0
    B       multipleDataLoop
singleDataLoop:
    CMP     R2, R0
    BGE     returnLength
    //Add one float64 value.
    FMOVD.P 8(R3), F0
    FMOVD.P 8(R4), F1
    FADDD   F1, F0, F2
    FMOVD.P F2, 8(R5)
    ADD     $1, R0, R0
    B       singleDataLoop
returnLength:
    MOVD    R2, int+72(FP)
    RET
