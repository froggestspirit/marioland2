ldh_n_a: MACRO
    db $EA, \1, $FF
    ENDM

ldh_a_n: MACRO
    db $FA, \1, $FF
    ENDM
