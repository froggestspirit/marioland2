Level_Header_Pointers: ;$55CB
	dw Level_Header_01
	dw Level_Header_02
	dw Level_Header_03
	dw Level_Header_04
	dw Level_Header_05
	dw Level_Header_06
	dw Level_Header_07
	dw Level_Header_08
	dw Level_Header_09
	dw Level_Header_10
	dw Level_Header_11
	dw Level_Header_12
	dw Level_Header_13
	dw Level_Header_14
	dw Level_Header_15
	dw Level_Header_16
	dw Level_Header_17
	dw Level_Header_18
	dw Level_Header_19
	dw Level_Header_20
	dw Level_Header_21
	dw Level_Header_22
	dw Level_Header_23
	dw Level_Header_24
	dw Level_Header_25
	dw Level_Header_26
	dw Level_Header_27
	dw Level_Header_28
	dw Level_Header_29
	dw Level_Header_30
	dw Level_Header_31
	dw Level_Header_32

Level_Header_01: ;$560B
	db $D4, $01 ;Mario Starting X
	db $22, $00 ;Mario Starting Y
	db $C0, $01 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $00, $58 ;Unknown
	db $00 ;Level Number
	dw Level_TileMap_01 ;Tileset Mapping Pointer
	db BANK(Level_01) ;Level Bank
	db $01 ;Level Music
	db $E4, $D0, $38 ;Level Palettes
	db $00 ;Level number (in it's bank)
	db $04 ;Time (multiply by 0x64 to get time in decimal)

Level_Header_02:
	db $D4, $01 ;Mario Starting X
	db $22, $00 ;Mario Starting Y
	db $C0, $01 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $80, $5B ;Unknown
	db $01 ;Level Number
	dw Level_TileMap_02 ;Tileset Mapping Pointer
	db BANK(Level_02) ;Level Bank
	db $14 ;Level Music
	db $E4, $D0, $38 ;Level Palettes
	db $00 ;Level number (in it's bank)
	db $05 ;Time

Level_Header_03:
	db $A4, $00 ;Mario Starting X
	db $2E, $00 ;Mario Starting Y
	db $B0, $00 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $00, $5F ;Unknown
	db $02 ;Level Number
	dw Level_TileMap_03 ;Tileset Mapping Pointer
	db BANK(Level_03) ;Level Bank
	db $11 ;Level Music
	db $93, $D0, $38 ;Level Palettes
	db $01 ;Level number (in it's bank)
	db $06 ;Time

Level_Header_04:
	db $D4, $01 ;Mario Starting X
	db $31, $00 ;Mario Starting Y
	db $C0, $01 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $80, $62 ;Unknown
	db $03 ;Level Number
	dw Level_TileMap_04 ;Tileset Mapping Pointer
	db BANK(Level_04) ;Level Bank
	db $28 ;Level Music
	db $E1, $D0, $38 ;Level Palettes
	db $02 ;Level number (in it's bank)
	db $04 ;Time

Level_Header_05:
	db $A4, $02 ;Mario Starting X
	db $3D, $00 ;Mario Starting Y
	db $A1, $02 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $00, $5F ;Unknown
	db $04 ;Level Number
	dw Level_TileMap_05 ;Tileset Mapping Pointer
	db BANK(Level_05) ;Level Bank
	db $14 ;Level Music
	db $E1, $D0, $38 ;Level Palettes
	db $00 ;Level number (in it's bank)
	db $04 ;Time

Level_Header_06:
	db $C4, $02 ;Mario Starting X
	db $2E, $00 ;Mario Starting Y
	db $C0, $02 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $00, $66 ;Unknown
	db $05 ;Level Number
	dw Level_TileMap_06 ;Tileset Mapping Pointer
	db BANK(Level_06) ;Level Bank
	db $01 ;Level Music
	db $E4, $D0, $38 ;Level Palettes
	db $01 ;Level number (in it's bank)
	db $05 ;Time

Level_Header_07:
	db $D4, $00 ;Mario Starting X
	db $35, $00 ;Mario Starting Y
	db $C0, $00 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $00, $5E ;Unknown
	db $06 ;Level Number
	dw Level_TileMap_07 ;Tileset Mapping Pointer
	db BANK(Level_07) ;Level Bank
	db $11 ;Level Music
	db $E1, $D0, $38 ;Level Palettes
	db $00 ;Level number (in it's bank)
	db $05 ;Time

Level_Header_08:
	db $D4, $01 ;Mario Starting X
	db $2F, $00 ;Mario Starting Y
	db $C0, $01 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $80, $61 ;Unknown
	db $07 ;Level Number
	dw Level_TileMap_08 ;Tileset Mapping Pointer
	db BANK(Level_08) ;Level Bank
	db $11 ;Level Music
	db $93, $D0, $38 ;Level Palettes
	db $01 ;Level number (in it's bank)
	db $04 ;Time

Level_Header_09:
	db $C4, $01 ;Mario Starting X
	db $37, $00 ;Mario Starting Y
	db $C1, $01 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $00, $65 ;Unknown
	db $08 ;Level Number
	dw Level_TileMap_09 ;Tileset Mapping Pointer
	db BANK(Level_09) ;Level Bank
	db $1F ;Level Music
	db $93, $D0, $38 ;Level Palettes
	db $02 ;Level number (in it's bank)
	db $05 ;Time

Level_Header_10:
	db $D4, $01 ;Mario Starting X
	db $28, $00 ;Mario Starting Y
	db $C0, $01 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $80, $68 ;Unknown
	db $09 ;Level Number
	dw Level_TileMap_10 ;Tileset Mapping Pointer
	db BANK(Level_10) ;Level Bank
	db $11 ;Level Music
	db $93, $D0, $38 ;Level Palettes
	db $03 ;Level number (in it's bank)
	db $05 ;Time

Level_Header_11:
	db $D4, $02 ;Mario Starting X
	db $37, $00 ;Mario Starting Y
	db $C0, $02 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $00, $5E ;Unknown
	db $0A ;Level Number
	dw Level_TileMap_11 ;Tileset Mapping Pointer
	db BANK(Level_11) ;Level Bank
	db $14 ;Level Music
	db $E4, $D0, $38 ;Level Palettes
	db $00 ;Level number (in it's bank)
	db $04 ;Time

Level_Header_12:
	db $C4, $01 ;Mario Starting X
	db $38, $00 ;Mario Starting Y
	db $C0, $01 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $80, $61 ;Unknown
	db $0B ;Level Number
	dw Level_TileMap_12 ;Tileset Mapping Pointer
	db BANK(Level_12) ;Level Bank
	db $14 ;Level Music
	db $E4, $D0, $38 ;Level Palettes
	db $01 ;Level number (in it's bank)
	db $04 ;Time

Level_Header_13:
	db $D4, $01 ;Mario Starting X
	db $2F, $00 ;Mario Starting Y
	db $C0, $01 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $00, $65 ;Unknown
	db $0C ;Level Number
	dw Level_TileMap_13 ;Tileset Mapping Pointer
	db BANK(Level_13) ;Level Bank
	db $28 ;Level Music
	db $E4, $D0, $38 ;Level Palettes
	db $02 ;Level number (in it's bank)
	db $05 ;Time

Level_Header_14:
	db $D4, $01 ;Mario Starting X
	db $38, $00 ;Mario Starting Y
	db $C0, $01 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $80, $68 ;Unknown
	db $0D ;Level Number
	dw Level_TileMap_14 ;Tileset Mapping Pointer
	db BANK(Level_14) ;Level Bank
	db $01 ;Level Music
	db $E4, $D0, $38 ;Level Palettes
	db $03 ;Level number (in it's bank)
	db $03 ;Time

Level_Header_15:
	db $34, $02 ;Mario Starting X
	db $22, $00 ;Mario Starting Y
	db $3D, $02 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $00, $58 ;Unknown
	db $0E ;Level Number
	dw Level_TileMap_15 ;Tileset Mapping Pointer
	db BANK(Level_15) ;Level Bank
	db $17 ;Level Music
	db $E4, $D0, $38 ;Level Palettes
	db $00 ;Level number (in it's bank)
	db $04 ;Time

Level_Header_16:
	db $D4, $01 ;Mario Starting X
	db $31, $00 ;Mario Starting Y
	db $D0, $01 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $80, $5B ;Unknown
	db $0F ;Level Number
	dw Level_TileMap_16 ;Tileset Mapping Pointer
	db BANK(Level_16) ;Level Bank
	db $28 ;Level Music
	db $E1, $D0, $38 ;Level Palettes
	db $01 ;Level number (in it's bank)
	db $06 ;Time

Level_Header_17:
	db $B4, $01 ;Mario Starting X
	db $24, $00 ;Mario Starting Y
	db $C0, $01 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $00, $5F ;Unknown
	db $10 ;Level Number
	dw Level_TileMap_17 ;Tileset Mapping Pointer
	db BANK(Level_17) ;Level Bank
	db $11 ;Level Music
	db $93, $D0, $38 ;Level Palettes
	db $02 ;Level number (in it's bank)
	db $04 ;Time

Level_Header_18:
	db $B4, $00 ;Mario Starting X
	db $27, $00 ;Mario Starting Y
	db $B2, $00 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $00, $5A ;Unknown
	db $11 ;Level Number
	dw Level_TileMap_15 ;Tileset Mapping Pointer
	db BANK(Level_18) ;Level Bank
	db $01 ;Level Music
	db $E4, $D0, $38 ;Level Palettes
	db $00 ;Level number (in it's bank)
	db $07 ;Time

Level_Header_19:
	db $B4, $01 ;Mario Starting X
	db $2D, $00 ;Mario Starting Y
	db $B0, $01 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $80, $5D ;Unknown
	db $12 ;Level Number
	dw Level_TileMap_18 ;Tileset Mapping Pointer
	db BANK(Level_19) ;Level Bank
	db $13 ;Level Music
	db $93, $D0, $38 ;Level Palettes
	db $01 ;Level number (in it's bank)
	db $07 ;Time

Level_Header_20:
	db $D4, $00 ;Mario Starting X
	db $3F, $00 ;Mario Starting Y
	db $C0, $00 ;Camera Starting X
	db $60, $00 ;Camera Starting Y
	db $00, $61 ;Unknown
	db $13 ;Level Number
	dw Level_TileMap_18 ;Tileset Mapping Pointer
	db BANK(Level_20) ;Level Bank
	db $1D ;Level Music
	db $93, $D0, $38 ;Level Palettes
	db $02 ;Level number (in it's bank)
	db $06 ;Time

Level_Header_21:
	db $94, $00 ;Mario Starting X
	db $28, $00 ;Mario Starting Y
	db $86, $00 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $00, $5E ;Unknown
	db $14 ;Level Number
	dw Level_TileMap_19 ;Tileset Mapping Pointer
	db BANK(Level_21) ;Level Bank
	db $17 ;Level Music
	db $E4, $D0, $38 ;Level Palettes
	db $00 ;Level number (in it's bank)
	db $04 ;Time

Level_Header_22:
	db $D4, $01 ;Mario Starting X
	db $29, $00 ;Mario Starting Y
	db $C0, $01 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $80, $61 ;Unknown
	db $15 ;Level Number
	dw Level_TileMap_20 ;Tileset Mapping Pointer
	db BANK(Level_22) ;Level Bank
	db $28 ;Level Music
	db $E4, $D0, $38 ;Level Palettes
	db $01 ;Level number (in it's bank)
	db $04 ;Time

Level_Header_23:
	db $D4, $01 ;Mario Starting X
	db $2E, $00 ;Mario Starting Y
	db $C0, $01 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $00, $65 ;Unknown
	db $16 ;Level Number
	dw Level_TileMap_21 ;Tileset Mapping Pointer
	db BANK(Level_23) ;Level Bank
	db $17 ;Level Music
	db $E4, $D0, $38 ;Level Palettes
	db $02 ;Level number (in it's bank)
	db $04 ;Time

Level_Header_24:
	db $D4, $01 ;Mario Starting X
	db $2C, $00 ;Mario Starting Y
	db $C0, $01 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $80, $68 ;Unknown
	db $17 ;Level Number
	dw Level_TileMap_22 ;Tileset Mapping Pointer
	db BANK(Level_24) ;Level Bank
	db $11 ;Level Music
	db $E1, $D0, $38 ;Level Palettes
	db $03 ;Level number (in it's bank)
	db $04 ;Time

Level_Header_25:
	db $D4, $02 ;Mario Starting X
	db $29, $09 ;Mario Starting Y
	db $C0, $02 ;Camera Starting X
	db $50, $09 ;Camera Starting Y
	db $80, $68 ;Unknown
	db $18 ;Level Number
	dw Level_TileMap_23 ;Tileset Mapping Pointer
	db BANK(Level_25) ;Level Bank
	db $0B ;Level Music
	db $E4, $D0, $38 ;Level Palettes
	db $03 ;Level number (in it's bank)
	db $09 ;Time

Level_Header_26:
	db $D4, $01 ;Mario Starting X
	db $40, $00 ;Mario Starting Y
	db $C0, $01 ;Camera Starting X
	db $61, $00 ;Camera Starting Y
	db $00, $58 ;Unknown
	db $19 ;Level Number
	dw Level_TileMap_01 ;Tileset Mapping Pointer
	db BANK(Level_26) ;Level Bank
	db $01 ;Level Music
	db $E4, $D0, $38 ;Level Palettes
	db $01 ;Level number (in it's bank)
	db $04 ;Time

Level_Header_27:
	db $C4, $01 ;Mario Starting X
	db $2F, $00 ;Mario Starting Y
	db $C0, $01 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $00, $58 ;Unknown
	db $1A ;Level Number
	dw Level_TileMap_01 ;Tileset Mapping Pointer
	db BANK(Level_27) ;Level Bank
	db $01 ;Level Music
	db $E4, $D0, $38 ;Level Palettes
	db $02 ;Level number (in it's bank)
	db $02 ;Time

Level_Header_28:
	db $04, $01 ;Mario Starting X
	db $33, $00 ;Mario Starting Y
	db $F6, $00 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $00, $58 ;Unknown
	db $1B ;Level Number
	dw Level_TileMap_02 ;Tileset Mapping Pointer
	db BANK(Level_28) ;Level Bank
	db $01 ;Level Music
	db $E4, $D0, $38 ;Level Palettes
	db $03 ;Level number (in it's bank)
	db $04 ;Time

Level_Header_29:
	db $C4, $01 ;Mario Starting X
	db $28, $00 ;Mario Starting Y
	db $B6, $01 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $00, $58 ;Unknown
	db $1C ;Level Number
	dw Level_TileMap_18 ;Tileset Mapping Pointer
	db BANK(Level_29) ;Level Bank
	db $01 ;Level Music
	db $93, $D0, $38 ;Level Palettes
	db $04 ;Level number (in it's bank)
	db $04 ;Time

Level_Header_30:
	db $A4, $01 ;Mario Starting X
	db $36, $00 ;Mario Starting Y
	db $AF, $01 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $80, $5B ;Unknown
	db $1D ;Level Number
	dw Level_TileMap_02 ;Tileset Mapping Pointer
	db BANK(Level_30) ;Level Bank
	db $01 ;Level Music
	db $E4, $D0, $38 ;Level Palettes
	db $03 ;Level number (in it's bank)
	db $04 ;Time

Level_Header_31:
	db $B4, $01 ;Mario Starting X
	db $22, $00 ;Mario Starting Y
	db $BE, $01 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $80, $5B ;Unknown
	db $1E ;Level Number
	dw Level_TileMap_06 ;Tileset Mapping Pointer
	db BANK(Level_31) ;Level Bank
	db $01 ;Level Music
	db $E4, $D0, $38 ;Level Palettes
	db $02 ;Level number (in it's bank)
	db $04 ;Time

Level_Header_32:
	db $94, $00 ;Mario Starting X
	db $28, $00 ;Mario Starting Y
	db $A0, $00 ;Camera Starting X
	db $50, $00 ;Camera Starting Y
	db $80, $5B ;Unknown
	db $1F ;Level Number
	dw Level_TileMap_24 ;Tileset Mapping Pointer
	db BANK(Level_32) ;Level Bank
	db $01 ;Level Music
	db $E4, $D0, $38 ;Level Palettes
	db $05 ;Level number (in it's bank)
	db $04 ;Time
