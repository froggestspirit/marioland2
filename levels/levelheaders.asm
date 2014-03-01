Level_Header_01: ;$560B
	db $D4, $01 ;Mario Starting X
	db $22, $00 ;Mario Starting Y
	db $C0, $01 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $00, $58 ;Unknown
	db $00 ;Level Number
	db $00, $40 ;Tileset Pointer
	db $09 ;Level Bank
	db $01 ;Level Music
	db $E4, $D0, $38 ;Level Palettes
	db $00 ;Second Exit?
	db $04 ;Time (multiply by 0x64 to get time in decimal)

Level_Header_02:
	db $D4, $01 ;Mario Starting X
	db $22, $00 ;Mario Starting Y
	db $C0, $01 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $80, $5B ;Unknown
	db $01 ;Level Number
	db $00, $42 ;Tileset Pointer
	db $0A ;Level Bank
	db $14 ;Level Music
	db $E4, $D0, $38 ;Level Palettes
	db $00 ;Second Exit?
	db $05 ;Time

Level_Header_03:
	db $A4, $00 ;Mario Starting X
	db $2E, $00 ;Mario Starting Y
	db $B0, $00 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $00, $5F ;Unknown
	db $02 ;Level Number
	db $00, $44 ;Tileset Pointer
	db $0A ;Level Bank
	db $11 ;Level Music
	db $93, $D0, $38 ;Level Palettes
	db $01 ;Second Exit?
	db $06 ;Time

Level_Header_04:
	db $D4, $01 ;Mario Starting X
	db $31, $00 ;Mario Starting Y
	db $C0, $01 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $80, $62 ;Unknown
	db $03 ;Level Number
	db $00, $46 ;Tileset Pointer
	db $0A ;Level Bank
	db $28 ;Level Music
	db $E1, $D0, $38 ;Level Palettes
	db $02 ;Second Exit?
	db $04 ;Time

Level_Header_05:
	db $A4, $02 ;Mario Starting X
	db $3D, $00 ;Mario Starting Y
	db $A1, $02 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $00, $5F ;Unknown
	db $04 ;Level Number
	db $00, $48 ;Tileset Pointer
	db $0B ;Level Bank
	db $14 ;Level Music
	db $E1, $D0, $38 ;Level Palettes
	db $00 ;Second Exit?
	db $04 ;Time

Level_Header_06:
	db $C4, $02 ;Mario Starting X
	db $2E, $00 ;Mario Starting Y
	db $C0, $02 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $00, $66 ;Unknown
	db $05 ;Level Number
	db $00, $4A ;Tileset Pointer
	db $0B ;Level Bank
	db $01 ;Level Music
	db $E4, $D0, $38 ;Level Palettes
	db $01 ;Second Exit?
	db $05 ;Time

Level_Header_07:
	db $D4, $00 ;Mario Starting X
	db $35, $00 ;Mario Starting Y
	db $C0, $00 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $00, $5E ;Unknown
	db $06 ;Level Number
	db $00, $4C ;Tileset Pointer
	db $12 ;Level Bank
	db $11 ;Level Music
	db $E1, $D0, $38 ;Level Palettes
	db $00 ;Second Exit?
	db $05 ;Time

Level_Header_08:
	db $D4, $01 ;Mario Starting X
	db $2F, $00 ;Mario Starting Y
	db $C0, $01 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $80, $61 ;Unknown
	db $07 ;Level Number
	db $00, $4E ;Tileset Pointer
	db $12 ;Level Bank
	db $11 ;Level Music
	db $93, $D0, $38 ;Level Palettes
	db $01 ;Second Exit?
	db $04 ;Time

Level_Header_09:
	db $C4, $01 ;Mario Starting X
	db $37, $00 ;Mario Starting Y
	db $C1, $01 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $00, $65 ;Unknown
	db $08 ;Level Number
	db $00, $50 ;Tileset Pointer
	db $12 ;Level Bank
	db $1F ;Level Music
	db $93, $D0, $38 ;Level Palettes
	db $02 ;Second Exit?
	db $05 ;Time

Level_Header_10:
	db $D4, $01 ;Mario Starting X
	db $28, $00 ;Mario Starting Y
	db $C0, $01 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $80, $68 ;Unknown
	db $09 ;Level Number
	db $00, $52 ;Tileset Pointer
	db $12 ;Level Bank
	db $11 ;Level Music
	db $93, $D0, $38 ;Level Palettes
	db $03 ;Second Exit?
	db $05 ;Time

Level_Header_11:
	db $D4, $02 ;Mario Starting X
	db $37, $00 ;Mario Starting Y
	db $C0, $02 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $00, $5E ;Unknown
	db $0A ;Level Number
	db $00, $54 ;Tileset Pointer
	db $17 ;Level Bank
	db $14 ;Level Music
	db $E4, $D0, $38 ;Level Palettes
	db $00 ;Second Exit?
	db $04 ;Time

Level_Header_12:
	db $C4, $01 ;Mario Starting X
	db $38, $00 ;Mario Starting Y
	db $C0, $01 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $80, $61 ;Unknown
	db $0B ;Level Number
	db $00, $56 ;Tileset Pointer
	db $17 ;Level Bank
	db $14 ;Level Music
	db $E4, $D0, $38 ;Level Palettes
	db $01 ;Second Exit?
	db $04 ;Time

Level_Header_13:
	db $D4, $01 ;Mario Starting X
	db $2F, $00 ;Mario Starting Y
	db $C0, $01 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $00, $65 ;Unknown
	db $0C ;Level Number
	db $00, $58 ;Tileset Pointer
	db $17 ;Level Bank
	db $28 ;Level Music
	db $E4, $D0, $38 ;Level Palettes
	db $02 ;Second Exit?
	db $05 ;Time

Level_Header_14:
	db $D4, $01 ;Mario Starting X
	db $38, $00 ;Mario Starting Y
	db $C0, $01 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $80, $68 ;Unknown
	db $0D ;Level Number
	db $00, $5A ;Tileset Pointer
	db $17 ;Level Bank
	db $01 ;Level Music
	db $E4, $D0, $38 ;Level Palettes
	db $03 ;Second Exit?
	db $03 ;Time

Level_Header_15:
	db $34, $02 ;Mario Starting X
	db $22, $00 ;Mario Starting Y
	db $3D, $02 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $00, $58 ;Unknown
	db $0E ;Level Number
	db $00, $5C ;Tileset Pointer
	db $14 ;Level Bank
	db $17 ;Level Music
	db $E4, $D0, $38 ;Level Palettes
	db $00 ;Second Exit?
	db $04 ;Time

Level_Header_16:
	db $D4, $01 ;Mario Starting X
	db $31, $00 ;Mario Starting Y
	db $D0, $01 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $80, $5B ;Unknown
	db $0F ;Level Number
	db $00, $5E ;Tileset Pointer
	db $14 ;Level Bank
	db $28 ;Level Music
	db $E1, $D0, $38 ;Level Palettes
	db $01 ;Second Exit?
	db $06 ;Time

Level_Header_17:
	db $B4, $01 ;Mario Starting X
	db $24, $00 ;Mario Starting Y
	db $C0, $01 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $00, $5F ;Unknown
	db $10 ;Level Number
	db $00, $60 ;Tileset Pointer
	db $14 ;Level Bank
	db $11 ;Level Music
	db $93, $D0, $38 ;Level Palettes
	db $02 ;Second Exit?
	db $04 ;Time

Level_Header_18:
	db $B4, $00 ;Mario Starting X
	db $27, $00 ;Mario Starting Y
	db $B2, $00 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $00, $5A ;Unknown
	db $11 ;Level Number
	db $00, $5C ;Tileset Pointer
	db $13 ;Level Bank
	db $01 ;Level Music
	db $E4, $D0, $38 ;Level Palettes
	db $00 ;Second Exit?
	db $07 ;Time

Level_Header_19:
	db $B4, $01 ;Mario Starting X
	db $2D, $00 ;Mario Starting Y
	db $B0, $01 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $80, $5D ;Unknown
	db $12 ;Level Number
	db $00, $62 ;Tileset Pointer
	db $13 ;Level Bank
	db $13 ;Level Music
	db $93, $D0, $38 ;Level Palettes
	db $01 ;Second Exit?
	db $07 ;Time

Level_Header_20:
	db $D4, $00 ;Mario Starting X
	db $3F, $00 ;Mario Starting Y
	db $C0, $00 ;Camera Starting X
	db $60, $00 ;Camera Starting Y
	db $00, $61 ;Unknown
	db $13 ;Level Number
	db $00, $62 ;Tileset Pointer
	db $13 ;Level Bank
	db $1D ;Level Music
	db $93, $D0, $38 ;Level Palettes
	db $02 ;Second Exit?
	db $06 ;Time

Level_Header_21:
	db $94, $00 ;Mario Starting X
	db $28, $00 ;Mario Starting Y
	db $86, $00 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $00, $5E ;Unknown
	db $14 ;Level Number
	db $00, $64 ;Tileset Pointer
	db $15 ;Level Bank
	db $17 ;Level Music
	db $E4, $D0, $38 ;Level Palettes
	db $00 ;Second Exit?
	db $04 ;Time

Level_Header_22:
	db $D4, $01 ;Mario Starting X
	db $29, $00 ;Mario Starting Y
	db $C0, $01 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $80, $61 ;Unknown
	db $15 ;Level Number
	db $00, $66 ;Tileset Pointer
	db $15 ;Level Bank
	db $28 ;Level Music
	db $E4, $D0, $38 ;Level Palettes
	db $01 ;Second Exit?
	db $04 ;Time

Level_Header_23:
	db $D4, $01 ;Mario Starting X
	db $2E, $00 ;Mario Starting Y
	db $C0, $01 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $00, $65 ;Unknown
	db $16 ;Level Number
	db $00, $68 ;Tileset Pointer
	db $15 ;Level Bank
	db $17 ;Level Music
	db $E4, $D0, $38 ;Level Palettes
	db $02 ;Second Exit?
	db $04 ;Time

Level_Header_24:
	db $D4, $01 ;Mario Starting X
	db $2C, $00 ;Mario Starting Y
	db $C0, $01 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $80, $68 ;Unknown
	db $17 ;Level Number
	db $00, $6A ;Tileset Pointer
	db $15 ;Level Bank
	db $11 ;Level Music
	db $E1, $D0, $38 ;Level Palettes
	db $03 ;Second Exit?
	db $04 ;Time

Level_Header_25:
	db $D4, $02 ;Mario Starting X
	db $29, $09 ;Mario Starting Y
	db $C0, $02 ;Camera Starting X
	db $50, $09 ;Camera Starting Y
	db $80, $68 ;Unknown
	db $18 ;Level Number
	db $00, $6C ;Tileset Pointer
	db $13 ;Level Bank
	db $0B ;Level Music
	db $E4, $D0, $38 ;Level Palettes
	db $03 ;Second Exit?
	db $09 ;Time

Level_Header_26:
	db $D4, $01 ;Mario Starting X
	db $40, $00 ;Mario Starting Y
	db $C0, $01 ;Camera Starting X
	db $61, $00 ;Camera Starting Y
	db $00, $58 ;Unknown
	db $19 ;Level Number
	db $00, $40 ;Tileset Pointer
	db $09 ;Level Bank
	db $01 ;Level Music
	db $E4, $D0, $38 ;Level Palettes
	db $01 ;Second Exit?
	db $04 ;Time

Level_Header_27:
	db $C4, $01 ;Mario Starting X
	db $2F, $00 ;Mario Starting Y
	db $C0, $01 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $00, $58 ;Unknown
	db $1A ;Level Number
	db $00, $40 ;Tileset Pointer
	db $09 ;Level Bank
	db $01 ;Level Music
	db $E4, $D0, $38 ;Level Palettes
	db $02 ;Second Exit?
	db $02 ;Time

Level_Header_28:
	db $04, $01 ;Mario Starting X
	db $33, $00 ;Mario Starting Y
	db $F6, $00 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $00, $58 ;Unknown
	db $1B ;Level Number
	db $00, $42 ;Tileset Pointer
	db $09 ;Level Bank
	db $01 ;Level Music
	db $E4, $D0, $38 ;Level Palettes
	db $03 ;Second Exit?
	db $04 ;Time

Level_Header_29:
	db $C4, $01 ;Mario Starting X
	db $28, $00 ;Mario Starting Y
	db $B6, $01 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $00, $58 ;Unknown
	db $1C ;Level Number
	db $00, $62 ;Tileset Pointer
	db $0B ;Level Bank
	db $01 ;Level Music
	db $93, $D0, $38 ;Level Palettes
	db $04 ;Second Exit?
	db $04 ;Time

Level_Header_30:
	db $A4, $01 ;Mario Starting X
	db $36, $00 ;Mario Starting Y
	db $AF, $01 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $80, $5B ;Unknown
	db $1D ;Level Number
	db $00, $42 ;Tileset Pointer
	db $0B ;Level Bank
	db $01 ;Level Music
	db $E4, $D0, $38 ;Level Palettes
	db $03 ;Second Exit?
	db $04 ;Time

Level_Header_31:
	db $B4, $01 ;Mario Starting X
	db $22, $00 ;Mario Starting Y
	db $BE, $01 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $80, $5B ;Unknown
	db $1E ;Level Number
	db $00, $4A ;Tileset Pointer
	db $0B ;Level Bank
	db $01 ;Level Music
	db $E4, $D0, $38 ;Level Palettes
	db $02 ;Second Exit?
	db $04 ;Time

Level_Header_32:
	db $94, $00 ;Mario Starting X
	db $28, $00 ;Mario Starting Y
	db $A0, $00 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $80, $5B ;Unknown
	db $1F ;Level Number
	db $00, $6E ;Tileset Pointer
	db $0B ;Level Bank
	db $01 ;Level Music
	db $E4, $D0, $38 ;Level Palettes
	db $05 ;Second Exit?
	db $04 ;Time
