// +build amd64

TEXT ·sse2Supported(SB), $0
    MOVQ    $1, AX
    MOVQ    $0, CX
    CPUID
    TESTQ   $(1<<26), DX
    JZ      sse2False
sse2True:
    MOVQ    $1, AX
    RET
sse2False:
    MOVQ    $0, AX
    RET
