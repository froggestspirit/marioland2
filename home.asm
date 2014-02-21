SECTION "bank00", ROM0


UnknownData_0x0000:
INCBIN "baserom.gb", $0000, $0028 - $0000

;rst28 jumps to address of address table, where a is the index
	add a
	pop hl
	ld e, a
	ld d, 0
	add de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	pop hl
	jp [hl]

UnknownData_0x0034:
INCBIN "baserom.gb", $0034, $0040 - $0034

	jp VBlank

UnknownData_0x0043:
INCBIN "baserom.gb", $0043, $0100 - $0043

	nop
	jp Start

SECTION "Header", ROM0[$134]
	db $4D, $41, $52, $49, $4F, $4C, $41, $4E, $44, $32, $00, $00, $00, $00, $00 ;MARIOLAND2
	db $00 ;Monochrome GameBoy
	db $00, $00 ;New Licence
	db $00 ;No Super GameBoy
	db $03 ;MBC1+RAM+Battery
	db $04 ;Rom size 512KB
	db $02 ;Ram size 8KB
	db $01 ;Non japanese
	db $01 ;No Super GameBoy
	db $00 ;Mask Rom Version

SECTION "Home", ROM0[$150]


Start: ;$0150
	jp Init

UnknownData_0x0153:
INCBIN "baserom.gb", $0153, $0154 - $0153


VBlank: ;$0154
	di
	push af
	push bc
	push de
	push hl
	ld a, [$A2B0]
	ld [$FF00+$42], a
	ld a, [$A2B1]
	ld [$FF00+$43], a
	ld a, [sBGPalette]
	ld [$FF00+$47], a
	ld a, [sOAMPalette1]
	ld [$FF00+$48], a
	ld a, [sOAMPalette2]
	ld [$FF00+$49], a
	ld a, [$A266]
	sub 1
	ld [$A266], a
	ld a, [$A267]
	sbc 0
	ld [$A267], a
	jr nc, UnknownRJump_0x018B
	xor a
	ld [$A266], a
	ld [$A267], a

UnknownRJump_0x018B:
	ld a, [$A2C9]
	and a
	jp nz, UnknownJump_0x2A4D
	ld a, [$FF00+$9B]
	cp $0C
	jp z, UnknownJump_0x2C18
	ld a, [$A248]
	and a
	jp nz, UnknownJump_0x26D7
	ld a, [$FF00+$9B]
	cp $13
	jp z, UnknownJump_0x2CA3
	ld a, [$A28E]
	and a
	jp nz, UnknownJump_0x26C3
	ld a, [$AA01]
	and a
	jr z, UnknownRJump_0x01BF
	ld a, [$A258] ;prepare bank switch
	ld [$2100], a
	call ScrollLevelMap
	jr UnknownRJump_0x01C5

UnknownRJump_0x01BF:
	call UnknownCall_0x3873
	call UnknownCall_0x076B

UnknownJump_0x01C5:
UnknownRJump_0x01C5:
	call $FFA0
	ld a, [$FF00+$9B]
	cp $04
	call z, UpdateSound
	ld a, [$FF00+$9B]
	cp $18
	call z, UpdateSound
	ld a, [$A24E] ;prepare bank switch
	ld [$2100], a
	ld a, 1
	ld [$FF00+$82], a
	pop hl
	pop de
	pop bc
	pop af
	reti

Init: ;$01E5
	ld a, 1
	di
	ld [$FF00+$0F], a
	ld [$FF00+$FF], a
	xor a
	ld [$FF00+$42], a
	ld [$FF00+$43], a
	ld [$FF00+$41], a
	ld [$FF00+$01], a
	ld [$FF00+$02], a
	ld a, 128
	ld [$FF00+$40], a

.wait
	ld a, [$FF00+$44]
	cp $94
	jr nz, .wait
	ld a, 3
	ld [$FF00+$40], a
	ld sp, $A8FF
	ld a, 10
	ld [$0000], a
	xor a
	ld hl, $DFFF
	ld c, 63
	ld b, 0

UnknownRJump_0x0215:
	ld [hld], a
	dec b
	jr nz, UnknownRJump_0x0215
	dec c
	jr nz, UnknownRJump_0x0215
	ld hl, $FEFF
	ld b, 0

UnknownRJump_0x0221:
	ld [hld], a
	dec b
	jr nz, UnknownRJump_0x0221
	ld hl, $FFFE
	ld b, 128

UnknownRJump_0x022A:
	ld [hld], a
	dec b
	jr nz, UnknownRJump_0x022A
	ld a, 147
	ld [sBGPalette], a
	ld a, 208
	ld [sOAMPalette1], a
	ld a, 56
	ld [sOAMPalette2], a
	ld c, 160
	ld b, 10
	ld hl, $2058

UnknownRJump_0x0244:
	ld a, [hli]
	ld [$FF00+c], a
	inc c
	dec b
	jr nz, UnknownRJump_0x0244
	call BlankBGMap1
	ld a, 1
	ld [$FF00+$FF], a
	ld a, 7
	ld [$FF00+$4B], a
	ld a, 128
	ld [$FF00+$40], a
	ei
	xor a
	ld [$FF00+$0F], a
	ld [$FF00+$4A], a
	ld [$FF00+$06], a
	call UnknownCall_0x207D

UnknownJump_0x0264:
	xor a
	ld [$AA01], a
	ld a, [$A20E]
	and a
	jr nz, UnknownRJump_0x0279
	ld a, [$A2DC]
	cp $03
	call nz, ReadJoypad
	call UnknownCall_0x38B9

UnknownRJump_0x0279:
	call UnknownCall_0x02AD
	ld a, [$FF00+$9B]
	cp $04
	jr z, UnknownRJump_0x028D
	cp $18
	jr z, UnknownRJump_0x028D
	cp $13
	jr z, UnknownRJump_0x028D
	call UpdateSound

UnknownRJump_0x028D:
	call UnknownCall_0x20A4
	ld a, [hKeysHeld]
	and $0F
	cp $0F
	jp z, UnknownJump_0x029F
	call UnknownCall_0x02FF
	jp UnknownJump_0x0264

UnknownJump_0x029F:
UnknownData_0x029F:
INCBIN "baserom.gb", $029F, $02AD - $029F


UnknownCall_0x02AD:
	ld a, [$FF00+$9B]
	rst $28

UnknownData_0x02B0:
INCBIN "baserom.gb", $02B0, $02FF - $02B0


UnknownCall_0x02FF:
	db $76 ;halt (rgbds adds a nop after)

UnknownRJump_0x0300:
	ld a, [$FF00+$82]
	and a
	jr z, UnknownRJump_0x0300
	ld a, [$FF00+$97]
	inc a
	ld [$FF00+$97], a
	ld a, [$A298]
	inc a
	ld [$A298], a
	xor a
	ld [$FF00+$82], a
	ld a, 192
	ld [$FF00+$8C], a
	xor a
	ld [$FF00+$8D], a
	ret

UnknownCall_0x031C:
	xor a
	ld hl, $C000
	ld b, 160

UnknownRJump_0x0322:
	ld [hli], a
	dec b
	jr nz, UnknownRJump_0x0322
	ret

BlankBGMap1: ;$0327
	ld hl, $9FFF
	ld bc, $0800

.continue
	ld a, 255
	ld [hld], a
	dec bc
	ld a, b
	or c
	jr nz, .continue
	ret

CopyMem: ;$0336 copies bc bytes from hl to de.
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, CopyMem
	ret

UnknownData_0x033F:
INCBIN "baserom.gb", $033F, $0348 - $033F


DisableVBlank: ;$0348
	ld a, [$FF00+$FF]
	ld [$FF00+$99], a
	res 0, a
	ld [$FF00+$FF], a

UnknownRJump_0x0350:
	ld a, [$FF00+$44]
	cp $91
	jr nz, UnknownRJump_0x0350
	ld a, [$FF00+$40]
	and $7F
	ld [$FF00+$40], a
	ld a, [$FF00+$99]
	ld [$FF00+$FF], a
	ret

UnknownCall_0x0361:
	ld hl, $42F0
	ld a, [$A812]
	and $0F
	sla a
	ld e, a
	ld d, 0
	add de
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	ld hl, $0000
	ld a, 10
	ld [hl], a
	ld h, 64
	ld a, 0
	ld [hl], a
	ld h, 96
	ld a, 1
	ld [hl], a
	ld hl, $B000

UnknownRJump_0x0386:
	ld a, [de]
	inc de
	bit 7, a
	jr nz, UnknownRJump_0x0393
	ld [hli], a
	ld a, l
	or a
	jr z, UnknownRJump_0x03A9
	jr UnknownRJump_0x0386

UnknownRJump_0x0393:
	and $7F
	ld [hli], a
	ld c, a
	ld a, l
	or a
	jr z, UnknownRJump_0x03A9
	ld a, [de]
	inc de
	ld b, a

UnknownRJump_0x039E:
	ld [hl], c
	inc hl
	ld a, l
	or a
	jr z, UnknownRJump_0x03A9
	dec b
	jr nz, UnknownRJump_0x039E
	jr UnknownRJump_0x0386

UnknownRJump_0x03A9:
	ld a, h
	cp $E0
	jr nz, UnknownRJump_0x0386
	ret
	ld a, [$A266]
	and $C0
	swap a
	ld e, a
	ld d, 0
	ld hl, $03E1
	add de
	ld a, [hli]
	ld [sBGPalette], a
	ld a, [hli]
	ld [sOAMPalette1], a
	ld a, [hli]
	ld [sOAMPalette2], a
	ld a, [$A267]
	ld b, a
	ld a, [$A266]
	or b
	ret nz
	ld a, 0
	ld [$A267], a
	ld a, 255
	ld [$A266], a
	ld a, 18
	ld [$FF00+$9B], a
	ret

UnknownData_0x03E1:
INCBIN "baserom.gb", $03E1, $03F1 - $03E1

	call UnknownCall_0x2D41
	call UnknownCall_0x0F2A
	ld a, 8 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ld a, [$A80B]
	ld l, a
	ld a, [$A80C]
	ld h, a
	ld de, $A600

UnknownRJump_0x040A:
	ld a, [hli]
	ld [de], a
	inc de
	ld a, d
	cp $A8
	jr nz, UnknownRJump_0x040A
	ld a, [$A80D] ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ld hl, $4000
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld h, a
	ld a, b
	ld l, a
	ld a, [$A812]
	and $0F
	ld b, a
	sla a
	add b
	ld b, a
	and $F0
	swap a
	ld d, a
	ld a, b
	and $0F
	swap a
	ld e, a
	add de
	ld de, $A960
	ld b, 48

UnknownRJump_0x043F:
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, UnknownRJump_0x043F
	ld a, [$A80D] ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ld hl, $4002
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld h, a
	ld a, b
	ld l, a
	ld a, [$A812]
	and $0F
	ld b, a
	sla a
	add b
	ld b, a
	and $F0
	swap a
	ld d, a
	ld a, b
	and $0F
	swap a
	ld e, a
	add de
	ld de, $A900
	ld b, 48

UnknownRJump_0x0472:
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, UnknownRJump_0x0472
	ld a, [$A80E]
	ld [$A292], a
	ld a, [$A80D]
	ld [$A258], a
	ld a, [$A812]
	and $F0
	ld [$A28B], a
	xor a
	ld [$A20E], a
	ld [$A2A7], a
	ld [$A248], a
	ld [$A26E], a
	ld hl, $AA80

UnknownRJump_0x049C:
	xor a
	ld [hl], a
	ld a, l
	add 16
	ld l, a
	jr nz, UnknownRJump_0x049C
	ld a, [$A813]
	ld [sTimerHigh], a
	xor a
	ld [sTimerLow], a
	ld [$A2B4], a
	ld a, 48
	ld [$A24B], a
	ld hl, $1F71
	ld a, [$A269]
	ld e, a
	ld d, 0
	add de
	ld a, [hl]
	ld [$A2C8], a
	ld a, [$A257]
	and a
	jr z, UnknownRJump_0x04DD

UnknownData_0x04CA:
INCBIN "baserom.gb", $04CA, $04DD - $04CA


UnknownRJump_0x04DD:
	ld hl, $1F91
	ld a, [$A269]
	ld e, a
	ld d, 0
	add de
	ld a, [hl]
	ld [$A287], a
	ld a, [$FF00+$9B]
	inc a
	ld [$FF00+$9B], a
	ret
	call DisableVBlank
	call LoadMarioGFX
	ld a, [$A258] ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x0361
	ld a, [$A80F]
	ld [sBGPalette], a
	ld [$FF00+$47], a
	ld a, [$A810]
	ld [sOAMPalette1], a
	ld [$FF00+$48], a
	ld a, [$A811]
	ld [sOAMPalette2], a
	ld [$FF00+$49], a
	ld a, [$A804]
	ld [$FF00+$C8], a
	ld a, [$A805]
	ld [$FF00+$C9], a
	ld a, [$A806]
	ld [$FF00+$CA], a
	ld a, [$A807]
	ld [$FF00+$CB], a

UnknownRJump_0x052F:
	ld a, 0
	ld [$FF00+$AF], a
	ld a, 170
	ld [$FF00+$B0], a
	call UnknownCall_0x08AD
	call ScrollLevelMap
	ld a, [$FF00+$C8]
	add 16
	ld [$FF00+$C8], a
	ld a, [$FF00+$C9]
	adc 0
	and $0F
	ld [$FF00+$C9], a
	ld a, [$FF00+$C8]
	ld b, a
	ld a, [$A804]
	cp b
	jr nz, UnknownRJump_0x052F
	ld a, [$A804]
	ld [$FF00+$C8], a
	ld a, [$A805]
	ld [$FF00+$C9], a
	ld a, [$A806]
	ld [$FF00+$CA], a
	ld a, [$A807]
	ld [$FF00+$CB], a
	ld a, [$FF00+$C8]
	sub 120
	ld [$A2B0], a
	ld a, [$FF00+$CA]
	sub 48
	ld [$A2B1], a
	call UnknownCall_0x07DB
	ld a, 3 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0xEBBB
	ld a, 227
	ld [$FF00+$40], a
	xor a
	ld [$A211], a
	ld a, [sSoundDisabled]
	and a
	jr nz, UnknownRJump_0x0598
	ld a, [$A80E]
	ld [$A468], a

UnknownRJump_0x0598:
	ld hl, $1F51
	ld a, [$A269]
	ld e, a
	ld d, 0
	add de
	ld a, [hl]
	ld [$A2D9], a
	xor a
	ld [$A266], a
	ld [$A267], a
	ld [$A217], a
	ld [$A880], a
	ld [$A890], a
	ld [$A2E0], a
	ld [$A2E3], a
	ld a, [$FF00+$9B]
	inc a
	ld [$FF00+$9B], a
	ld a, [$A2D5]
	and a
	ret z

UnknownData_0x05C6:
INCBIN "baserom.gb", $05C6, $05D5 - $05C6

	ld a, [$A266]
	ld b, a
	ld a, [$A267]
	or b
	jr z, UnknownRJump_0x05E4
	xor a
	ld [hKeysPressed], a
	ld [hKeysHeld], a

UnknownRJump_0x05E4:
	call UnknownCall_0x2C61
	ld a, [$A224]
	cp $FF
	jr z, UnknownRJump_0x0640
	ld a, [$FF00+$C0]
	ld [sMarioY], a
	ld a, [$FF00+$C1]
	ld [sMarioYU], a
	ld a, [$FF00+$C2]
	ld [sMarioX], a
	ld a, [$FF00+$C3]
	ld [sMarioXU], a
	ld a, [$A20E]
	and a
	jr nz, UnknownRJump_0x060F
	xor a
	ld [$A25C], a
	call UnknownCall_0x0F71

UnknownRJump_0x060F:
	call UnknownCall_0x0879
	call UnknownCall_0x0B2A
	call UnknownCall_0x2062
	call UnknownCall_0x2D0A
	call UnknownCall_0x2C82
	ld a, [sPipeTravelDirection]
	cp $10
	call c, UnknownCall_0x2D7D
	ld a, [$A287]
	bit 1, a
	call nz, UnknownCall_0x3753
	call UnknownCall_0x2A58
	ld a, [$FF00+$8D]
	ld [$A264], a
	call UnknownCall_0x0652
	call UnknownCall_0x2CFF
	call UnknownCall_0x273E
	ret

UnknownRJump_0x0640:
	call UnknownCall_0x315C
	ld a, [$FF00+$8D]
	ld [$A264], a
	call UnknownCall_0x0652
	call UnknownCall_0x2CFF
	call UnknownCall_0x273E
	ret

UnknownCall_0x0652:
	ld a, [$A28B]
	and $F0
	jr nz, UnknownRJump_0x0665
	ld a, 2 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x8000
	ret

UnknownRJump_0x0665:
	call UnknownCall_0x3C9F
	ret

LoadMarioGFX: ;$0669
	ld a, [$A269]
	ld hl, $360A
	ld e, a
	ld d, 0
	add de
	ld a, [hl]
	ld [$A2D2], a
	and $0F
	and a
	jr nz, .MarioDark
	ld a, 6 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ld bc, $0800
	ld hl, $4000
	ld de, $8000
	call CopyMem
	jr UnknownRJump_0x06C0

.MarioDark
	cp $01
	jr nz, .MarioMoon
	ld a, 6 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ld bc, $0800
	ld hl, $4800
	ld de, $8000
	call CopyMem
	jr UnknownRJump_0x06C0

.MarioMoon
	ld a, 6 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ld bc, $0800
	ld hl, $5000
	ld de, $8000
	call CopyMem

UnknownRJump_0x06C0:
	ld a, 7 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ld a, [$A2D2]
	and $F0
	swap a
	sla a
	ld e, a
	ld d, 0
	ld hl, $0763
	add de
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld h, a
	ld l, e
	ld bc, $0380
	ld de, $8E80
	call CopyMem
	ld a, 27 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ld a, [$A2D2]
	and $F0
	swap a
	ld b, a
	sla a
	add b
	ld d, a
	ld e, 0
	ld hl, $7000
	add de
	ld bc, $0300
	ld de, $8800
	call CopyMem
	ld a, [$A269]
	ld hl, $362A
	sla a
	sla a
	ld e, a
	ld d, 0
	add de
	ld a, [hli] ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	inc hl
	ld bc, $0380
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld h, a
	ld a, e
	ld l, a
	ld de, $8B00
	call CopyMem
	ld a, [$A269]
	ld hl, $36AA
	sla a
	sla a
	ld e, a
	ld d, 0
	add de
	ld a, [hli] ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	inc hl
	ld bc, $0600
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld h, a
	ld a, e
	ld l, a
	ld de, $9200
	call CopyMem
	ld hl, $35EA
	ld a, [$A269]
	ld e, a
	ld d, 0
	add de
	ld a, [hl]
	inc a
	ld [$A299], a
	ret

UnknownData_0x0763:
INCBIN "baserom.gb", $0763, $076B - $0763


UnknownCall_0x076B:
	ld a, [$FF00+$9B]
	cp $04
	ret nz
	ld a, [$A22C]
	and $F0
	swap a
	add 128
	ld [$9C02], a
	ld a, [$A22C]
	and $0F
	add 128
	ld [$9C03], a
	ld a, [sCoinHigh]
	and $0F
	add 128
	ld [$9C07], a
	ld a, [sCoinLow]
	and $F0
	swap a
	add 128
	ld [$9C08], a
	ld a, [sCoinLow]
	and $0F
	add 128
	ld [$9C09], a
	ld a, [$A28D]
	and $F0
	swap a
	add 128
	ld [$9C0D], a
	ld a, [$A28D]
	and $0F
	add 128
	ld [$9C0E], a
	ld a, [sTimerHigh]
	add 128
	ld [$9C11], a
	ld a, [sTimerLow]
	and $F0
	swap a
	add 128
	ld [$9C12], a
	ld a, [sTimerLow]
	and $0F
	add 128
	ld [$9C13], a
	ret

UnknownCall_0x07DB:
	ld hl, $07EA
	ld de, $9C00
	ld b, 20

UnknownRJump_0x07E3:
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, UnknownRJump_0x07E3
	ret

UnknownData_0x07EA:
INCBIN "baserom.gb", $07EA, $0879 - $07EA


UnknownCall_0x0879:
	ld a, [$A258] ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ld a, 0
	ld [$FF00+$AF], a
	ld a, 170
	ld [$FF00+$B0], a
	xor a
	ld [$A24C], a
	ld a, [$FF00+$97]
	and $03
	jr z, UnknownRJump_0x08A2
	cp $01
	jr z, UnknownRJump_0x08D4
	cp $02
	jr z, UnknownRJump_0x0905
	cp $03
	jp z, UnknownJump_0x0937

UnknownData_0x08A1:
INCBIN "baserom.gb", $08A1, $08A2 - $08A1


UnknownRJump_0x08A2:
	ld a, [$A223]
	bit 6, a
	ret z
	ld a, 255
	ld [$A24C], a

UnknownCall_0x08AD:
	ld a, [$FF00+$CA]
	sub 128
	ld [$FF00+$CE], a
	ld a, [$FF00+$CB]
	sbc 0
	and $0F
	ld [$FF00+$CF], a
	ld a, [$FF00+$C8]
	sub 120
	ld [$FF00+$CC], a
	ld a, [$FF00+$C9]
	sbc 0
	and $0F
	ld [$FF00+$CD], a
	ld a, [$A223]
	res 6, a
	ld [$A223], a
	jp UnknownJump_0x0969

UnknownRJump_0x08D4:
	ld a, [$A223]
	bit 7, a
	ret z
	ld a, 255
	ld [$A24C], a
	ld a, [$FF00+$CA]
	sub 128
	ld [$FF00+$CE], a
	ld a, [$FF00+$CB]
	sbc 0
	and $0F
	ld [$FF00+$CF], a
	ld a, [$FF00+$C8]
	add 120
	ld [$FF00+$CC], a
	ld a, [$FF00+$C9]
	adc 0
	and $0F
	ld [$FF00+$CD], a
	ld a, [$A223]
	res 7, a
	ld [$A223], a
	jr UnknownRJump_0x0969

UnknownRJump_0x0905:
	ld a, [$A223]
	bit 5, a
	ret z
	ld a, 255
	ld [$A24C], a
	ld a, [$FF00+$CA]
	sub 128
	ld [$FF00+$CE], a
	ld a, [$FF00+$CB]
	sbc 0
	and $0F
	ld [$FF00+$CF], a
	ld a, [$FF00+$C8]
	sub 120
	ld [$FF00+$CC], a
	ld a, [$FF00+$C9]
	sbc 0
	and $0F
	ld [$FF00+$CD], a
	ld a, [$A223]
	res 5, a
	ld [$A223], a
	jp UnknownJump_0x0A35

UnknownJump_0x0937:
	ld a, [$A223]
	bit 4, a
	ret z
	ld a, 255
	ld [$A24C], a
	ld a, [$FF00+$CA]
	add 112
	ld [$FF00+$CE], a
	ld a, [$FF00+$CB]
	adc 0
	and $0F
	ld [$FF00+$CF], a
	ld a, [$FF00+$C8]
	sub 120
	ld [$FF00+$CC], a
	ld a, [$FF00+$C9]
	sbc 0
	and $0F
	ld [$FF00+$CD], a
	ld a, [$A223]
	res 4, a
	ld [$A223], a
	jp UnknownJump_0x0A35

UnknownJump_0x0969:
UnknownRJump_0x0969:
UnknownCall_0x0969:
	ld a, [$A223]
	and $3F
	ld [$A223], a
	ld a, 16
	ld [$FF00+$AE], a
	ld hl, $9800
	ld a, [$FF00+$CC]
	and $F0
	ld e, a
	xor a
	ld d, a
	sla e
	rl d
	sla e
	rl d
	add de
	ld a, [$FF00+$CE]
	and $F0
	swap a
	sla a
	ld e, a
	ld d, 0
	add de
	ld a, l
	ld [$FF00+$AA], a
	ld a, h
	ld [$FF00+$AB], a
	ld a, [$FF00+$CD]
	and $0F
	swap a
	add 176
	ld h, a
	ld a, [$FF00+$CC]
	and $F0
	swap a
	or h
	ld [$A204], a
	ld a, [$FF00+$CF]
	and $0F
	swap a
	ld l, a
	ld a, [$FF00+$CE]
	and $F0
	swap a
	or l
	ld [$A203], a

UnknownRJump_0x09BE:
	ld a, [$A203]
	ld l, a
	ld a, [$A204]
	ld h, a
	ld a, [hl]
	ld e, a
	xor a
	ld d, a
	sla e
	rl d
	sla e
	rl d
	ld hl, $A600
	add de
	ld a, [hli]
	ld [$A208], a
	ld a, [hli]
	ld [$A209], a
	ld a, [hli]
	ld [$A20A], a
	ld a, [hli]
	ld [$A20B], a
	ld a, [$FF00+$AF]
	ld l, a
	ld a, [$FF00+$B0]
	ld h, a
	ld a, [$FF00+$AA]
	ld [hli], a
	ld a, [$FF00+$AB]
	ld [hli], a
	ld a, [$A208]
	ld [hli], a
	ld a, [$A209]
	ld [hli], a
	ld a, [$A20A]
	ld [hli], a
	ld a, [$A20B]
	ld [hli], a
	ld a, l
	ld [$FF00+$AF], a
	ld a, h
	ld [$FF00+$B0], a
	ld a, [$A203]
	inc a
	ld [$A203], a
	ld a, [$FF00+$AA]
	add 2
	ld [$FF00+$AA], a
	ld a, [$FF00+$AB]
	adc 0
	and $9B
	ld [$FF00+$AB], a
	ld a, [$FF00+$AA]
	and $DF
	ld [$FF00+$AA], a
	ld a, [$FF00+$AE]
	dec a
	ld [$FF00+$AE], a
	jr nz, UnknownRJump_0x09BE
	ld a, [$FF00+$AF]
	ld l, a
	ld a, [$FF00+$B0]
	ld h, a
	ld a, 0
	ld [hli], a
	ld [hl], a
	ret

UnknownJump_0x0A35:
UnknownCall_0x0A35:
	ld a, [$A223]
	and $CF
	ld [$A223], a
	ld a, 16
	ld [$FF00+$AE], a
	ld hl, $9800
	ld a, [$FF00+$CC]
	and $F0
	ld e, a
	xor a
	ld d, a
	sla e
	rl d
	sla e
	rl d
	add de
	ld a, [$FF00+$CE]
	and $F0
	swap a
	sla a
	ld e, a
	ld d, 0
	add de
	ld a, l
	ld [$FF00+$AA], a
	ld a, h
	ld [$FF00+$AB], a
	ld a, [$FF00+$CD]
	and $0F
	swap a
	add 176
	ld h, a
	ld a, [$FF00+$CC]
	and $F0
	swap a
	or h
	ld [$A204], a
	ld a, [$FF00+$CF]
	and $0F
	swap a
	ld l, a
	ld a, [$FF00+$CE]
	and $F0
	swap a
	or l
	ld [$A203], a

UnknownRJump_0x0A8A:
	ld a, [$A203]
	ld l, a
	ld a, [$A204]
	ld h, a
	ld a, [hl]
	ld e, a
	xor a
	ld d, a
	sla e
	rl d
	sla e
	rl d
	ld hl, $A600
	add de
	ld a, [hli]
	ld [$A208], a
	ld a, [hli]
	ld [$A209], a
	ld a, [hli]
	ld [$A20A], a
	ld a, [hli]
	ld [$A20B], a
	ld a, [$FF00+$AF]
	ld l, a
	ld a, [$FF00+$B0]
	ld h, a
	ld a, [$FF00+$AA]
	ld [hli], a
	ld a, [$FF00+$AB]
	ld [hli], a
	ld a, [$A208]
	ld [hli], a
	ld a, [$A209]
	ld [hli], a
	ld a, [$A20A]
	ld [hli], a
	ld a, [$A20B]
	ld [hli], a
	ld a, l
	ld [$FF00+$AF], a
	ld a, h
	ld [$FF00+$B0], a
	ld a, [$A204]
	inc a
	ld [$A204], a
	ld a, [$FF00+$AA]
	add 64
	ld [$FF00+$AA], a
	ld a, [$FF00+$AB]
	adc 0
	and $9B
	ld [$FF00+$AB], a
	ld a, [$FF00+$AE]
	dec a
	ld [$FF00+$AE], a
	jr nz, UnknownRJump_0x0A8A
	ld a, [$FF00+$AF]
	ld l, a
	ld a, [$FF00+$B0]
	ld h, a
	ld a, 0
	ld [hli], a
	ld [hl], a
	ret

ScrollLevelMap: ;$0AFB
	ld de, $A9FF

.continue
	inc de
	ld a, [de]
	ld l, a
	inc de
	ld a, [de]
	ld h, a
	and a
	jr z, .done
	inc de
	ld a, [de]
	ld [hli], a
	ld a, h
	and $9B
	ld h, a
	inc de
	ld a, [de]
	ld [hl], a
	ld bc, $001F
	add bc
	ld a, h
	and $9B
	ld h, a
	inc de
	ld a, [de]
	ld [hli], a
	ld a, h
	and $9B
	ld h, a
	inc de
	ld a, [de]
	ld [hl], a
	jr .continue

.done
	xor a
	ld [$AA01], a
	ret

UnknownCall_0x0B2A:
	ld a, [$A28B]
	and $F0
	ret nz
	ld a, [$A2E0]
	and a
	jr z, UnknownRJump_0x0B39
	and $F0
	ret z

UnknownRJump_0x0B39:
	ld a, [$A20E]
	and a
	jp nz, UnknownJump_0x0DED
	ld a, [$FF00+$C9]
	swap a
	ld b, a
	ld a, [$FF00+$CB]
	or b
	ld e, a
	ld d, 0
	ld hl, $A960
	add de
	ld a, [hl]
	ld [$FF00+$98], a
	ld a, [$A2C8]
	and a
	jr z, UnknownRJump_0x0B5E
	call UnknownCall_0x0DAF
	jp UnknownJump_0x0C7D

UnknownRJump_0x0B5E:
	ld a, [$FF00+$98]
	bit 0, a
	jr z, UnknownRJump_0x0B90
	ld a, [$FF00+$CA]
	cp $B0
	jp nz, UnknownJump_0x0B7D
	ld a, [sMarioScreenX]
	cp $A1
	jr c, UnknownRJump_0x0BE5
	ld a, 1
	ld [$A20E], a
	call UnknownCall_0x0F0B
	jp UnknownJump_0x0BE5

UnknownJump_0x0B7D:
	jr c, UnknownRJump_0x0B90
	ld a, [$FF00+$CA]
	sub 1
	ld [$FF00+$CA], a
	ld a, [$FF00+$CB]
	sbc 0
	and $0F
	ld [$FF00+$CB], a
	jp UnknownJump_0x0BE5

UnknownRJump_0x0B90:
	ld a, [$A235]
	and a
	jr z, UnknownRJump_0x0BE5
	ld a, [$A232]
	and a
	jr z, UnknownRJump_0x0BE5
	xor a
	ld [$A233], a
	ld a, [$A235]
	ld b, a
	ld a, [$FF00+$CA]
	add b
	ld [$FF00+$CA], a
	ld b, a
	ld a, [$FF00+$CB]
	adc 0
	and $0F
	ld [$FF00+$CB], a
	ld a, [$A223]
	set 4, a
	ld [$A223], a
	ld a, [$FF00+$C2]
	sub b
	add 96
	cp $40
	jr c, UnknownRJump_0x0BD3
	ld a, [$FF00+$CA]
	add 1
	ld [$FF00+$CA], a
	ld a, [$FF00+$CB]
	adc 0
	and $0F
	ld [$FF00+$CB], a
	jr UnknownRJump_0x0BE5

UnknownRJump_0x0BD3:
	cp $3F
	jr nc, UnknownRJump_0x0BE5
	ld a, [$FF00+$CA]
	sub 1
	ld [$FF00+$CA], a
	ld a, [$FF00+$CB]
	sbc 0
	and $0F
	ld [$FF00+$CB], a

UnknownJump_0x0BE5:
UnknownRJump_0x0BE5:
	ld a, [$FF00+$98]
	bit 1, a
	jr z, UnknownRJump_0x0C21
	ld a, [$FF00+$CA]
	cp $50
	jr nz, UnknownRJump_0x0C0F
	ld a, [sMarioScreenX]
	cp $0F
	jp nc, UnknownJump_0x0C76
	ld a, 2
	ld [$A20E], a
	ld a, 0
	ld [$FF00+$C2], a
	ld a, [$FF00+$C3]
	inc a
	and $0F
	ld [$FF00+$C3], a
	call UnknownCall_0x0F0B
	jp UnknownJump_0x0C76

UnknownRJump_0x0C0F:
	jr nc, UnknownRJump_0x0C21
	ld a, [$FF00+$CA]
	add 1
	ld [$FF00+$CA], a
	ld a, [$FF00+$CB]
	adc 0
	and $0F
	ld [$FF00+$CB], a
	jr UnknownRJump_0x0C76

UnknownRJump_0x0C21:
	ld a, [$A236]
	and a
	jr z, UnknownRJump_0x0C76
	ld a, [$A233]
	and a
	jr z, UnknownRJump_0x0C76
	xor a
	ld [$A232], a
	ld a, [$A236]
	ld b, a
	ld a, [$FF00+$CA]
	sub b
	ld [$FF00+$CA], a
	ld b, a
	ld a, [$FF00+$CB]
	sbc 0
	and $0F
	ld [$FF00+$CB], a
	ld a, [$A223]
	set 5, a
	ld [$A223], a
	ld a, [$FF00+$C2]
	sub b
	add 96
	cp $70
	jr nc, UnknownRJump_0x0C64
	ld a, [$FF00+$CA]
	sub 1
	ld [$FF00+$CA], a
	ld a, [$FF00+$CB]
	sbc 0
	and $0F
	ld [$FF00+$CB], a
	jr UnknownRJump_0x0C76

UnknownRJump_0x0C64:
	cp $71
	jr c, UnknownRJump_0x0C76
	ld a, [$FF00+$CA]
	add 1
	ld [$FF00+$CA], a
	ld a, [$FF00+$CB]
	adc 0
	and $0F
	ld [$FF00+$CB], a

UnknownJump_0x0C76:
UnknownRJump_0x0C76:
	xor a
	ld [$A235], a
	ld [$A236], a

UnknownJump_0x0C7D:
	ld a, [$FF00+$C8]
	ld b, a
	ld a, [$FF00+$C0]
	sub b
	add 96
	ld [$FF00+$99], a
	ld a, [$A20C]
	ld b, a
	ld a, [$FF00+$C0]
	sub b
	jp z, UnknownJump_0x0D97
	bit 7, a
	jp nz, UnknownJump_0x0D05
	ld [$A238], a
	ld a, [$A223]
	set 7, a
	ld [$A223], a
	ld a, [$FF00+$98]
	bit 3, a
	jr z, UnknownRJump_0x0CEC
	ld a, [$FF00+$C8]
	cp $C0
	jr nz, UnknownRJump_0x0CC0
	ld a, [sMarioScreenY]
	cp $90
	jp c, UnknownJump_0x0D97
	ld a, 8
	ld [$A20E], a
	call UnknownCall_0x0F0B
	jp UnknownJump_0x0D05

UnknownRJump_0x0CC0:
	jr c, UnknownRJump_0x0CD3
	ld a, [$FF00+$C8]
	sub 1
	ld [$FF00+$C8], a
	ld a, [$FF00+$C9]
	sbc 0
	and $0F
	ld [$FF00+$C9], a
	jp UnknownJump_0x0D97

UnknownRJump_0x0CD3:
	ld a, [$FF00+$99]
	cp $58
	jp c, UnknownJump_0x0D97
	ld a, [$A238]
	ld b, a
	ld a, [$FF00+$C8]
	add b
	ld [$FF00+$C8], a
	ld a, [$FF00+$C9]
	adc 0
	ld [$FF00+$C9], a
	jp UnknownJump_0x0D97

UnknownRJump_0x0CEC:
	ld a, [$FF00+$99]
	cp $50
	jp c, UnknownJump_0x0D97
	ld a, [$A238]
	ld b, a
	ld a, [$FF00+$C8]
	add b
	ld [$FF00+$C8], a
	ld a, [$FF00+$C9]
	adc 0
	ld [$FF00+$C9], a
	jp UnknownJump_0x0D97

UnknownJump_0x0D05:
	cpl
	inc a
	ld [$A237], a
	ld a, [$A223]
	set 6, a
	ld [$A223], a
	ld a, [$FF00+$98]
	bit 2, a
	jr z, UnknownRJump_0x0D74
	ld a, [$FF00+$C8]
	cp $48
	jr nz, UnknownRJump_0x0D3D
	ld a, [sMarioScreenY]
	cp $1B
	jr nc, UnknownRJump_0x0D97
	ld a, 4
	ld [$A20E], a
	ld a, 0
	ld [$FF00+$C0], a
	ld a, [$FF00+$C9]
	ld [$FF00+$C1], a
	ld a, [$A28B]
	and $F0
	call z, UnknownCall_0x0F0B
	jp UnknownJump_0x0D97

UnknownRJump_0x0D3D:
	jr nc, UnknownRJump_0x0D4F
	ld a, [$FF00+$C8]
	add 1
	ld [$FF00+$C8], a
	ld a, [$FF00+$C9]
	adc 0
	and $0F
	ld [$FF00+$C9], a
	jr UnknownRJump_0x0D97

UnknownRJump_0x0D4F:
	ld a, [$A2D9]
	and a
	jr z, UnknownRJump_0x0D5D
	ld a, [$FF00+$99]
	cp $40
	jr nc, UnknownRJump_0x0D97
	jr UnknownRJump_0x0D63

UnknownRJump_0x0D5D:
	ld a, [$FF00+$99]
	cp $38
	jr nc, UnknownRJump_0x0D97

UnknownRJump_0x0D63:
	ld a, [$A237]
	ld b, a
	ld a, [$FF00+$C8]
	sub b
	ld [$FF00+$C8], a
	ld a, [$FF00+$C9]
	sbc 0
	ld [$FF00+$C9], a
	jr UnknownRJump_0x0D97

UnknownRJump_0x0D74:
	ld a, [$A2D9]
	and a
	jr z, UnknownRJump_0x0D82
	ld a, [$FF00+$99]
	cp $40
	jr nc, UnknownRJump_0x0D97
	jr UnknownRJump_0x0D88

UnknownRJump_0x0D82:
	ld a, [$FF00+$99]
	cp $28
	jr nc, UnknownRJump_0x0D97

UnknownRJump_0x0D88:
	ld a, [$A237]
	ld b, a
	ld a, [$FF00+$C8]
	sub b
	ld [$FF00+$C8], a
	ld a, [$FF00+$C9]
	sbc 0
	ld [$FF00+$C9], a

UnknownJump_0x0D97:
UnknownRJump_0x0D97:
	xor a
	ld [$A238], a
	ld [$A237], a
	ld a, [$FF00+$C0]
	ld [$A20C], a
	ret

UnknownData_0x0DA4:
INCBIN "baserom.gb", $0DA4, $0DAF - $0DA4


UnknownCall_0x0DAF:
	ld a, [$FF00+$98]
	bit 0, a
	jr z, UnknownRJump_0x0DCA
	ld a, [$FF00+$CA]
	cp $B0
	jr c, UnknownRJump_0x0DCA
	ld a, [sMarioScreenX]
	cp $A1
	ret c
	ld a, 1
	ld [$A20E], a
	call UnknownCall_0x0F0B
	ret

UnknownRJump_0x0DCA:
	ld a, [$FF00+$97]
	and $01
	ret nz
	xor a
	ld [$A233], a
	ld a, 1
	ld b, a
	ld a, [$FF00+$CA]
	add b
	ld [$FF00+$CA], a
	ld b, a
	ld a, [$FF00+$CB]
	adc 0
	and $0F
	ld [$FF00+$CB], a
	ld a, [$A223]
	set 4, a
	ld [$A223], a
	ret

UnknownJump_0x0DED:
	ld a, [$A20E]
	bit 0, a
	jr z, UnknownRJump_0x0E20
	ld a, [$FF00+$CA]
	add 4
	ld [$FF00+$CA], a
	ld a, [$FF00+$CB]
	adc 0
	and $0F
	ld [$FF00+$CB], a
	ld b, 1
	call UnknownCall_0x14E3
	ld a, 16
	ld [$A223], a
	ld a, [$FF00+$C2]
	add 1
	ld [$FF00+$C2], a
	ld a, [$FF00+$C3]
	adc 0
	ld [$FF00+$C3], a
	ld a, [$FF00+$CA]
	cp $50
	ret nz
	jp UnknownJump_0x0EB0

UnknownRJump_0x0E20:
	bit 1, a
	jr z, UnknownRJump_0x0E4F
	ld a, [$FF00+$CA]
	sub 4
	ld [$FF00+$CA], a
	ld a, [$FF00+$CB]
	sbc 0
	and $0F
	ld [$FF00+$CB], a
	ld b, 1
	call UnknownCall_0x14E3
	ld a, 32
	ld [$A223], a
	ld a, [$FF00+$C2]
	sub 1
	ld [$FF00+$C2], a
	ld a, [$FF00+$C3]
	sbc 0
	ld [$FF00+$C3], a
	ld a, [$FF00+$CA]
	cp $B0
	ret nz
	jr UnknownRJump_0x0EB0

UnknownRJump_0x0E4F:
	bit 2, a
	jr z, UnknownRJump_0x0E7E
	ld a, [$FF00+$C8]
	sub 4
	ld [$FF00+$C8], a
	ld a, [$FF00+$C9]
	sbc 0
	and $0F
	ld [$FF00+$C9], a
	ld b, 1
	call UnknownCall_0x14E3
	ld a, 64
	ld [$A223], a
	ld a, [$FF00+$C0]
	sub 1
	ld [$FF00+$C0], a
	ld a, [$FF00+$C1]
	sbc 0
	ld [$FF00+$C1], a
	ld a, [$FF00+$C8]
	cp $B8
	ret nz
	jr UnknownRJump_0x0EB0

UnknownRJump_0x0E7E:
	bit 3, a
	ret z
	ld a, [$FF00+$C8]
	add 4
	ld [$FF00+$C8], a
	ld a, [$FF00+$C9]
	adc 0
	and $0F
	ld [$FF00+$C9], a
	ld b, 1
	call UnknownCall_0x14E3
	ld a, 128
	ld [$A223], a
	ld a, [$FF00+$97]
	and $01
	add 1
	ld b, a
	ld a, [$FF00+$C0]
	add b
	ld [$FF00+$C0], a
	ld a, [$FF00+$C1]
	adc 0
	ld [$FF00+$C1], a
	ld a, [$FF00+$C8]
	cp $48
	ret nz

UnknownJump_0x0EB0:
UnknownRJump_0x0EB0:
	xor a
	ld [$A20E], a
	ld a, [$A28B]
	and $0F
	jr z, UnknownRJump_0x0EE4
	ld a, 240
	ld [$A28B], a
	call DisableVBlank
	call UnknownCall_0x3C94
	ld a, 195
	ld [$FF00+$40], a
	ld a, 32
	ld [$A468], a
	ld [$A292], a
	ld a, [$A269]
	cp $18
	jr nz, UnknownRJump_0x0EE4
	ld a, [$A2DC]
	add 33
	ld [$A468], a
	ld [$A292], a

UnknownRJump_0x0EE4:
	ld a, [$A2E0]
	and $F0
	jr z, UnknownRJump_0x0EF3
	ld a, [$A2E0]
	and $0F
	ld [$A2E0], a

UnknownRJump_0x0EF3:
	ld a, 5
	ld [$A460], a
	ld a, [$A80F]
	ld [sBGPalette], a
	ld a, [$A810]
	ld [sOAMPalette1], a
	ld a, [$A811]
	ld [sOAMPalette2], a
	ret

UnknownCall_0x0F0B:
	ld a, 255
	ld [$A29E], a
	ld a, [$FF00+$C1]
	swap a
	ld e, a
	ld a, [$FF00+$C3]
	and $0F
	add e
	ld e, a
	ld d, 0
	ld hl, $A900
	add de
	ld a, [hl]
	ld [$A28E], a
	xor a
	ld [$A29B], a
	ret

UnknownCall_0x0F2A:
	ld a, [$A802]
	ld [$FF00+$C2], a
	ld a, [$A800]
	ld [$FF00+$C0], a
	ld [$A20C], a
	ld a, [$A803]
	ld [$FF00+$C3], a
	ld a, [$A801]
	ld [$FF00+$C1], a
	ld a, 128
	ld [sHVelocityIndex], a
	ld a, 24
	ld [sVVelocityIndex], a
	ld a, 1
	ld [sMarioDirection], a
	xor a
	ld [$A271], a
	ld [$A279], a
	ld [$A23D], a
	ld [$A24F], a
	ld [$A224], a
	ld a, 64
	ld [$A266], a
	ld [sMarioScreenY], a
	ld [sMarioScreenX], a
	ld a, 1
	ld [$A267], a
	ret

UnknownCall_0x0F71:
	call UnknownCall_0x307D
	call UnknownCall_0x13FE
	ld a, [sPipeTravelDirection]
	cp $10
	jr nc, UnknownRJump_0x0FBB
	call UnknownCall_0x0FF2
	call UnknownCall_0x1BFF
	call UnknownCall_0x129F
	call UnknownCall_0x1413
	call UnknownCall_0x14A6
	call UnknownCall_0x126F
	call UnknownCall_0x160A
	call UnknownCall_0x1090
	call UnknownCall_0x14FA
	call UnknownCall_0x1701
	call UnknownCall_0x16CC
	call UnknownCall_0x181C
	call UnknownCall_0x0FBF
	call UnknownCall_0x14BF
	call UnknownCall_0x1189
	call UnknownCall_0x319F
	call UnknownCall_0x3451
	call UnknownCall_0x32C1
	call UnknownCall_0x331C
	call UnknownCall_0x324F
	ret

UnknownRJump_0x0FBB:
	call UnknownCall_0x10EC
	ret

UnknownCall_0x0FBF:
	ld a, [$FF00+$CA]
	ld b, a
	ld a, [$FF00+$C2]
	sub b
	add 96
	ld b, a
	cp $10
	jr c, UnknownRJump_0x0FD1
	cp $A0
	jr nc, UnknownRJump_0x0FE3
	ret

UnknownRJump_0x0FD1:
	sub 16
	xor $FF
	inc a
	ld b, a
	ld a, [$FF00+$C2]
	add b
	ld [$FF00+$C2], a
	ld a, [$FF00+$C3]
	adc 0
	ld [$FF00+$C3], a
	ret

UnknownRJump_0x0FE3:
	sub 160
	ld b, a
	ld a, [$FF00+$C2]
	sub b
	ld [$FF00+$C2], a
	ld a, [$FF00+$C3]
	sbc 0
	ld [$FF00+$C3], a
	ret

UnknownCall_0x0FF2:
	ld a, [$A24F]
	and a
	ret nz
	ld a, [$A287]
	and a
	ret z
	bit 0, a
	jr nz, UnknownRJump_0x106F
	bit 1, a
	jr nz, UnknownRJump_0x1055
	bit 3, a
	jr nz, UnknownRJump_0x1029
	ld a, [sMarioOnGround]
	and a
	ret nz
	ld a, [hKeysHeld]
	bit 0, a
	ret z
	ld a, [hKeysPressed]
	bit 0, a
	jr z, UnknownRJump_0x101D
	ld a, 18
	ld [$A460], a

UnknownRJump_0x101D:
	ld a, [sVVelocityIndex]
	cp $4A
	ret nc
	add 2
	ld [sVVelocityIndex], a
	ret

UnknownRJump_0x1029:
	ld a, [sMarioOnGround]
	and a
	jr nz, UnknownRJump_0x104A
	ld a, [hKeysHeld]
	bit 0, a
	jr z, UnknownRJump_0x1050
	ld a, [$A2B2]
	and a
	ret z
	dec a
	ld [$A2B2], a
	ld a, [sVVelocityIndex]
	cp $4A
	ret nc
	add 2
	ld [sVVelocityIndex], a
	ret

UnknownRJump_0x104A:
	ld a, 50
	ld [$A2B2], a
	ret

UnknownRJump_0x1050:
	xor a
	ld [$A2B2], a
	ret

UnknownRJump_0x1055:
	ld a, [hKeysPressed]
	bit 0, a
	ret z
	ld a, 52
	ld [sVVelocityIndex], a
	ld a, [$A285]
	and a
	ret nz
	ld a, 8
	ld [$A285], a
	ld a, 3
	ld [$A460], a
	ret

UnknownRJump_0x106F:
	ld a, [sMarioOnGround]
	and a
	ret nz
	ld a, [hKeysHeld]
	bit 0, a
	ret z
	ld a, [hKeysPressed]
	bit 0, a
	jr z, UnknownRJump_0x1084
	ld a, 18
	ld [$A460], a

UnknownRJump_0x1084:
	ld a, [sVVelocityIndex]
	cp $48
	ret nc
	add 4
	ld [sVVelocityIndex], a
	ret

UnknownCall_0x1090:
	ld a, [$A24F]
	and a
	ret nz
	ld a, [$A2B3]
	and a
	ret nz
	ld a, [sCurPowerup]
	cp $02
	jr nz, UnknownRJump_0x10EB
	ld a, [$A287]
	and a
	jr nz, UnknownRJump_0x10EB
	ld a, [sVVelocityIndex]
	cp $48
	jr nc, UnknownRJump_0x10EB
	ld a, [hKeysPressed]
	bit 0, a
	jr nz, UnknownRJump_0x10D7
	ld a, [$A284]
	and a
	jr z, UnknownRJump_0x10EB
	ld a, [sMarioOnGround]
	and a
	jr nz, UnknownRJump_0x10EB
	ld a, [hKeysHeld]
	bit 0, a
	jr z, UnknownRJump_0x10EB
	ld a, [$A27C]
	inc a
	ld [$A27C], a
	cp $0C
	jr c, UnknownRJump_0x10EB
	xor a
	ld [$A27C], a
	jr UnknownRJump_0x10DC

UnknownRJump_0x10D7:
	ld a, 255
	ld [$A284], a

UnknownRJump_0x10DC:
	ld a, 8
	ld [$A24D], a
	ld a, 24
	ld [sVVelocityIndex], a
	ld a, 6
	ld [$A470], a

UnknownRJump_0x10EB:
	ret

UnknownCall_0x10EC:
	ld a, [sPipeTravelDirection]
	cp $10
	jr nz, UnknownRJump_0x1111
	ld a, [$FF00+$C0]
	add 2
	ld [$FF00+$C0], a
	ld a, [$FF00+$C1]
	adc 0
	ld [$FF00+$C1], a
	ld a, 1
	ld [$A237], a
	call UnknownCall_0x1DFE
	ret c
	call UnknownCall_0x1E36
	ret c
	xor a
	ld [sPipeTravelDirection], a
	ret

UnknownRJump_0x1111:
	ld a, [sPipeTravelDirection]
	cp $20
	jr nz, UnknownRJump_0x1136
	ld a, [$FF00+$C0]
	sub 2
	ld [$FF00+$C0], a
	ld a, [$FF00+$C1]
	sbc 0
	ld [$FF00+$C1], a
	ld a, 1
	ld [$A237], a
	call UnknownCall_0x1DFE
	ret c
	call UnknownCall_0x1E36
	ret c
	xor a
	ld [sPipeTravelDirection], a
	ret

UnknownRJump_0x1136:
	ld a, [sPipeTravelDirection]
	cp $30
	jr nz, UnknownRJump_0x1160
	ld a, [$FF00+$C2]
	add 2
	ld [$FF00+$C2], a
	ld a, [$FF00+$C3]
	adc 0
	ld [$FF00+$C3], a
	ld a, 1
	ld [$A235], a
	ld b, 1
	call UnknownCall_0x14E3
	call UnknownCall_0x1E8D
	ret c
	call UnknownCall_0x1E7C
	ret c
	xor a
	ld [sPipeTravelDirection], a
	ret

UnknownRJump_0x1160:
	ld a, [sPipeTravelDirection]
	cp $40
	ret nz
	ld a, [$FF00+$C2]
	sub 2
	ld [$FF00+$C2], a
	ld a, [$FF00+$C3]
	sbc 0
	ld [$FF00+$C3], a
	ld a, 1
	ld [$A236], a
	ld b, 1
	call UnknownCall_0x14E3
	call UnknownCall_0x1E8D
	ret c
	call UnknownCall_0x1E7C
	ret c
	xor a
	ld [sPipeTravelDirection], a
	ret

UnknownCall_0x1189:
	ld a, [sPipeTravelDirection]
	and a
	ret z
	cp $01
	jr nz, UnknownRJump_0x11C0
	ld a, [hKeysHeld]
	bit 7, a
	ret z
	ld a, [$FF00+$C2]
	bit 4, a
	ret z
	and $0F
	sub 5
	cp $07
	ret nc
	ld a, 16
	ld [sPipeTravelDirection], a
	ld a, 5
	ld [$A460], a
	xor a
	ld [$A291], a
	ld [$A880], a
	ld [$A890], a
	ld a, [sPipeTravelDirection]
	ld a, 128
	ld [sHVelocityIndex], a
	ret

UnknownRJump_0x11C0:
	cp $02
	jr nz, UnknownRJump_0x11FE
	ld a, [hKeysHeld]
	bit 6, a
	ret z
	ld a, [$FF00+$C2]
	bit 4, a
	ret z
	and $0F
	sub 5
	cp $07
	ret nc
	ld a, 32
	ld [sPipeTravelDirection], a
	ld a, [$FF00+$C0]
	sub 2
	ld [$FF00+$C0], a
	ld a, [$FF00+$C1]
	sbc 0
	ld [$FF00+$C1], a
	ld a, 5
	ld [$A460], a
	xor a
	ld [$A291], a
	ld [$A880], a
	ld [$A890], a
	ld a, [sPipeTravelDirection]
	ld a, 128
	ld [sHVelocityIndex], a
	ret

UnknownRJump_0x11FE:
	cp $03
	jr nz, UnknownRJump_0x1244
	ld a, [$A2C8]
	and a
	jr z, UnknownRJump_0x120E
	ld a, [$FF00+$CA]
	cp $B0
	jr c, UnknownRJump_0x1244

UnknownRJump_0x120E:
	ld a, [$A28A]
	cp $01
	jr z, UnknownRJump_0x1225
	ld a, [hKeysHeld]
	bit 4, a
	jr z, UnknownRJump_0x1244
	ld a, [sMarioOnGround]
	and a
	ret z
	ld a, [$A2E0]
	and a
	ret nz

UnknownRJump_0x1225:
	ld a, 48
	ld [sPipeTravelDirection], a
	xor a
	ld [$A291], a
	ld [$A880], a
	ld [$A890], a
	ld a, 128
	ld [sHVelocityIndex], a
	ld a, [$A2DC]
	and a
	ret nz
	ld a, 5
	ld [$A460], a
	ret

UnknownRJump_0x1244:
	ld a, [$A28A]
	cp $FF
	jr z, UnknownRJump_0x1255
	ld a, [hKeysHeld]
	bit 5, a
	ret z
	ld a, [sMarioOnGround]
	and a
	ret z

UnknownRJump_0x1255:
	ld a, 64
	ld [sPipeTravelDirection], a
	ld a, 5
	ld [$A460], a
	xor a
	ld [$A291], a
	ld [$A880], a
	ld [$A890], a
	ld a, 128
	ld [sHVelocityIndex], a
	ret

UnknownCall_0x126F:
	ld a, [hKeysHeld]
	bit 7, a
	jr z, UnknownRJump_0x129A
	ld a, [sCurPowerup]
	bit 0, a
	jr z, UnknownRJump_0x129A
	ld a, [sMarioOnGround]
	and a
	jr nz, UnknownRJump_0x129A
	ld a, [$A287]
	and $0F
	jr nz, UnknownRJump_0x129A
	ld a, [sSpinJump]
	and a
	jr nz, UnknownRJump_0x1294
	ld a, 14
	ld [$A460], a

UnknownRJump_0x1294:
	ld a, 255
	ld [sSpinJump], a
	ret

UnknownRJump_0x129A:
	xor a
	ld [sSpinJump], a
	ret

UnknownCall_0x129F:
	ld a, [sVVelocityIndex]
	cp $19
	ret nc
	xor a
	ld [$A2DE], a
	ld a, [$A26B]
	and a
	jp nz, UnknownJump_0x1378
	call UnknownCall_0x1E3B
	jr c, UnknownRJump_0x12CE
	ld a, [sMarioOnGround]
	and a
	jr z, UnknownRJump_0x12C9
	ld a, [sHVelocityIndex]
	sub 72
	cp $78
	jr c, UnknownRJump_0x12C9
	ld a, 28
	ld [sVVelocityIndex], a

UnknownRJump_0x12C9:
	xor a
	ld [sMarioOnGround], a
	ret

UnknownRJump_0x12CE:
	and $FE
	cp $04
	jr nz, UnknownRJump_0x1327
	ld a, [$A20D]
	cp $05
	jr z, UnknownRJump_0x1302
	ld a, [$FF00+$97]
	bit 0, a
	jr z, UnknownRJump_0x1327
	ld a, [$FF00+$C2]
	add 1
	ld [$FF00+$C2], a
	ld a, [$FF00+$C3]
	adc 0
	ld [$FF00+$C3], a
	ld a, 1
	ld [$A28A], a
	ld a, [sHVelocityIndex]
	cp $80
	jr c, UnknownRJump_0x1327
	ld a, [$A235]
	inc a
	ld [$A235], a
	jr UnknownRJump_0x1327

UnknownRJump_0x1302:
	ld a, [$FF00+$97]
	bit 0, a
	jr z, UnknownRJump_0x1327
	ld a, [$FF00+$C2]
	sub 1
	ld [$FF00+$C2], a
	ld a, [$FF00+$C3]
	sbc 0
	ld [$FF00+$C3], a
	ld a, 255
	ld [$A28A], a
	ld a, [sHVelocityIndex]
	cp $81
	jr nc, UnknownRJump_0x1327
	ld a, [$A236]
	inc a
	ld [$A236], a

UnknownRJump_0x1327:
	ld a, [sSpinJump]
	and a
	jr z, UnknownRJump_0x134F
	call UnknownCall_0x1993
	ld a, [$A220]
	and a
	jr z, UnknownRJump_0x134F
	ld a, 255
	ld [sMarioInAir], a
	ld a, 48
	ld [sVVelocityIndex], a
	ld a, [hKeysHeld]
	bit 0, a
	ret z
	ld a, 75
	ld [sVVelocityIndex], a
	xor a
	ld [sMarioOnGround], a
	ret

UnknownRJump_0x134F:
	ld a, 255
	ld [sMarioOnGround], a
	xor a
	ld [sPipeTravelDirection], a
	ld a, [$A20D]
	and $FE
	cp $08
	jr nz, UnknownRJump_0x1366
	ld a, 1
	ld [sPipeTravelDirection], a

UnknownRJump_0x1366:
	ld a, [$A283]
	ld b, a
	ld a, [$FF00+$C0]
	sub 4
	and $0F
	cp b
	ret z
	ld a, [$FF00+$C0]
	dec a
	ld [$FF00+$C0], a
	ret

UnknownJump_0x1378:
	ld a, 255
	ld [sMarioOnGround], a
	xor a
	ld [sPipeTravelDirection], a
	ret

UnknownData_0x1382:
INCBIN "baserom.gb", $1382, $13FE - $1382


UnknownCall_0x13FE:
	xor a
	ld [$A202], a
	ld [$A218], a
	ld [$A283], a
	ld a, [sPipeTravelDirection]
	cp $10
	ret nc
	xor a
	ld [sPipeTravelDirection], a
	ret

UnknownCall_0x1413:
	jr UnknownRJump_0x1432

UnknownData_0x1415:
INCBIN "baserom.gb", $1415, $1432 - $1415


UnknownRJump_0x1432:
	call UnknownCall_0x1E7C
	jr c, UnknownRJump_0x143D
	call UnknownCall_0x1E8D
	jr c, UnknownRJump_0x1464
	ret

UnknownRJump_0x143D:
	ld a, [$A20D]
	and $FC
	cp $0C
	jr nz, UnknownRJump_0x144B

UnknownData_0x1446:
INCBIN "baserom.gb", $1446, $144B - $1446


UnknownRJump_0x144B:
	ld a, [$FF00+$C2]
	add 1
	ld [$FF00+$C2], a
	ld a, [$FF00+$C3]
	adc 0
	ld [$FF00+$C3], a
	ld a, [$A202]
	inc a
	ld [$A202], a
	ld a, 255
	ld [$A218], a
	ret

UnknownRJump_0x1464:
	ld a, [$A2C8]
	and a
	jr z, UnknownRJump_0x147F
	ld a, [sMarioScreenX]
	cp $12
	jr nc, UnknownRJump_0x147F
	ld a, 128
	ld [$A224], a
	ld a, 15
	ld [$A460], a
	xor a
	ld [$A53F], a

UnknownRJump_0x147F:
	ld a, [$A20D]
	and $FC
	cp $0C
	jr nz, UnknownRJump_0x148D

UnknownData_0x1488:
INCBIN "baserom.gb", $1488, $148D - $1488


UnknownRJump_0x148D:
	ld a, [$FF00+$C2]
	sub 1
	ld [$FF00+$C2], a
	ld a, [$FF00+$C3]
	sbc 0
	ld [$FF00+$C3], a
	ld a, [$A202]
	dec a
	ld [$A202], a
	ld a, 255
	ld [$A218], a
	ret

UnknownCall_0x14A6:
	xor a
	ld [$A291], a
	ld a, [$A24F]
	and a
	ret nz
	ld a, [hKeysHeld]
	bit 7, a
	ret z
	ld a, [sMarioOnGround]
	and a
	ret z
	ld a, 255
	ld [$A291], a
	ret

UnknownCall_0x14BF:
	call UnknownCall_0x14D5
	ld a, [$A202]
	and a
	ret z
	cp $80
	jr nc, UnknownRJump_0x14CF
	ld [$A235], a
	ret

UnknownRJump_0x14CF:
	cpl
	inc a
	ld [$A236], a
	ret

UnknownCall_0x14D5:
	ld a, [$A287]
	and a
	jr nz, UnknownRJump_0x14E9
	ld a, [hKeysHeld]
	and $02
	srl a
	inc a
	ld b, a

UnknownCall_0x14E3:
	ld a, [$A24F]
	and a
	jr z, UnknownRJump_0x14EB

UnknownRJump_0x14E9:
	ld b, 1

UnknownRJump_0x14EB:
	ld a, [$A222]
	add b
	ld [$A222], a
	cp $0C
	ret c
	xor a
	ld [$A222], a
	ret

UnknownCall_0x14FA:
	ld a, [$A287]
	bit 1, a
	jr nz, UnknownRJump_0x150C
	ld a, [$A24D]
	and a
	jr z, UnknownRJump_0x150C
	dec a
	ld [$A24D], a
	ret

UnknownRJump_0x150C:
	ld a, [sMarioOnGround]
	and a
	ret nz
	ld a, [$FF00+$C0]
	ld [sMarioY], a
	ld a, [$FF00+$C1]
	ld [sMarioYU], a
	ld a, [sVVelocityIndex]
	cp $21
	jr c, UnknownRJump_0x1533
	ld a, [$A2DE]
	and a
	jr nz, UnknownRJump_0x1533
	ld a, [hKeysHeld]
	bit 0, a
	jr nz, UnknownRJump_0x1533
	ld a, 33
	ld [sVVelocityIndex], a

UnknownRJump_0x1533:
	ld a, [sVVelocityIndex]
	and a
	jr z, UnknownRJump_0x156B
	dec a
	ld [sVVelocityIndex], a
	cp $30
	jr nz, UnknownRJump_0x156B
	ld a, [$A287]
	and a
	jr nz, UnknownRJump_0x154E
	ld a, 24
	ld [sVVelocityIndex], a
	jr UnknownRJump_0x156B

UnknownRJump_0x154E:
	ld a, [sVVelocityIndex]
	dec a
	ld [sVVelocityIndex], a
	cp $19
	jr nc, UnknownRJump_0x156B

UnknownData_0x1559:
INCBIN "baserom.gb", $1559, $156B - $1559


UnknownRJump_0x156B:
	ld hl, MarioSpeedTableVSpace
	ld a, [$A287]
	and a
	jr nz, UnknownRJump_0x1580
	ld hl, MarioSpeedTableV
	ld a, [$A26D]
	and a
	jr z, UnknownRJump_0x1580
	ld hl, MarioSpeedTableVWater

UnknownRJump_0x1580:
	ld a, [sVVelocityIndex]
	ld e, a
	ld d, 0
	add de
	ld a, [hl]
	add 16
	ld b, a
	ld a, [$FF00+$C0]
	add b
	ld [$FF00+$C0], a
	ld a, [$FF00+$C1]
	adc 0
	ld [$FF00+$C1], a
	ld a, [$FF00+$C0]
	sub 16
	ld [$FF00+$C0], a
	ld a, [$FF00+$C1]
	sbc 0
	ld [$FF00+$C1], a
	ld a, [sVVelocityIndex]
	cp $19
	jr nc, UnknownRJump_0x15B6
	ld a, [sMarioOnGround]
	and a
	jr z, UnknownRJump_0x1609

UnknownData_0x15AF:
INCBIN "baserom.gb", $15AF, $15B6 - $15AF


UnknownRJump_0x15B6:
	call UnknownCall_0x1DFE
	jr c, UnknownRJump_0x15CF

UnknownRJump_0x15BB:
	ld a, [$FF00+$C1]
	cp $FF
	jr nz, UnknownRJump_0x1609
	ld a, [$FF00+$C0]
	add 1
	ld [$FF00+$C0], a
	ld a, [$FF00+$C1]
	adc 0
	ld [$FF00+$C1], a
	jr UnknownRJump_0x15BB

UnknownRJump_0x15CF:
	ld a, [sMarioY]
	ld [$FF00+$C0], a
	ld a, [sMarioYU]
	ld [$FF00+$C1], a
	xor a
	ld [$A2B2], a
	ld a, 24
	ld [sVVelocityIndex], a
	ld a, [$A287]
	and $0F
	jr nz, UnknownRJump_0x15F4
	ld a, [$A26D]
	and a
	jr nz, UnknownRJump_0x15F4
	ld a, 2
	ld [$A460], a

UnknownRJump_0x15F4:
	call UnknownCall_0x1993
	xor a
	ld [sPipeTravelDirection], a
	ld a, [$A20D]
	and $FE
	cp $0A
	jr nz, UnknownRJump_0x1609
	ld a, 2
	ld [sPipeTravelDirection], a

UnknownRJump_0x1609:
	ret

UnknownCall_0x160A:
	ld a, [$A2B3]
	and a
	ret nz
	ld a, [sMarioOnGround]
	and a
	jr nz, UnknownRJump_0x161E
	ld a, [$A26D]
	and a
	jp z, UnknownJump_0x16AE
	jr UnknownRJump_0x1622

UnknownRJump_0x161E:
	xor a
	ld [sMarioInAir], a

UnknownRJump_0x1622:
	ld a, [sCurPowerup]
	cp $02
	jr nz, UnknownRJump_0x1631
	ld a, [hKeysHeld]
	bit 0, a
	jr z, UnknownRJump_0x16AE
	jr UnknownRJump_0x1637

UnknownRJump_0x1631:
	ld a, [hKeysPressed]
	bit 0, a
	jr z, UnknownRJump_0x16AE

UnknownRJump_0x1637:
	ld a, [$A24F]
	and a
	jr nz, UnknownRJump_0x16AE
	ld a, 1
	ld [$A286], a
	ld a, 1
	ld [$A460], a
	ld a, [$A287]
	and $0F
	jr z, UnknownRJump_0x1659
	bit 1, a
	jr nz, UnknownRJump_0x165F
	ld a, 18
	ld [$A460], a
	jr UnknownRJump_0x1664

UnknownRJump_0x1659:
	ld a, [$A26D]
	and a
	jr z, UnknownRJump_0x1664

UnknownRJump_0x165F:
	ld a, 3
	ld [$A460], a

UnknownRJump_0x1664:
	ld a, [sCurPowerup]
	cp $02
	jr z, UnknownRJump_0x1675
	ld a, [hKeysHeld]
	bit 7, a
	jr z, UnknownRJump_0x1675
	xor a
	ld [$A460], a

UnknownRJump_0x1675:
	ld a, 255
	ld [sMarioInAir], a
	xor a
	ld [sMarioOnGround], a
	ld [$A284], a
	ld a, 75
	ld [sVVelocityIndex], a
	ld a, [sCurPowerup]
	cp $02
	jr z, UnknownRJump_0x16AE
	ld a, [sHVelocityIndex]
	cp $48
	jr c, UnknownRJump_0x16AE
	cp $C0
	jr nc, UnknownRJump_0x16AE
	ld a, [hKeysHeld]
	bit 6, a
	jr nz, UnknownRJump_0x16AE
	ld a, 48
	ld [sVVelocityIndex], a
	ld a, [$A26D]
	and a
	jr z, UnknownRJump_0x16AE
	ld a, 72
	ld [sVVelocityIndex], a

UnknownJump_0x16AE:
UnknownRJump_0x16AE:
	ret

UnknownData_0x16AF:
INCBIN "baserom.gb", $16AF, $16CC - $16AF


UnknownCall_0x16CC:
	ld a, [$A26D]
	and a
	jr nz, UnknownRJump_0x16DE
	ld a, [$A287]
	bit 1, a
	jr nz, UnknownRJump_0x16DE
	ld a, [sMarioOnGround]
	and a
	ret z

UnknownRJump_0x16DE:
	ld a, [sHVelocityIndex]
	and $FC
	cp $80
	jr z, UnknownRJump_0x16FB
	jr c, UnknownRJump_0x16F2
	ld a, [sHVelocityIndex]
	sub 4
	ld [sHVelocityIndex], a
	ret

UnknownRJump_0x16F2:
	ld a, [sHVelocityIndex]
	add 4
	ld [sHVelocityIndex], a
	ret

UnknownRJump_0x16FB:
	ld a, 128
	ld [sHVelocityIndex], a
	ret

UnknownCall_0x1701:
	ld a, [$A24F]
	and a
	jp nz, UnknownJump_0x17C5
	ld a, [$A2B3]
	and a
	ret nz
	ld a, [$A291]
	and a
	jp nz, UnknownJump_0x17C4
	ld a, [$A218]
	and a
	jp nz, UnknownJump_0x17C4
	ld a, [hKeysHeld]
	bit 4, a
	jr z, UnknownRJump_0x1771
	ld a, 1
	ld [sMarioDirection], a
	ld a, [sHVelocityIndex]
	add 8
	ld [sHVelocityIndex], a
	ld a, [$A26D]
	ld b, a
	ld a, [sMarioOnGround]
	or b
	jr nz, UnknownRJump_0x1749
	ld a, [sHVelocityIndex]
	and $F0
	cp $C0
	jr nz, UnknownRJump_0x1763
	ld a, 184
	ld [sHVelocityIndex], a
	jp UnknownJump_0x17C4

UnknownRJump_0x1749:
	ld a, [$A287]
	and a
	jr nz, UnknownRJump_0x1755
	ld a, [hKeysHeld]
	bit 1, a
	jr nz, UnknownRJump_0x1763

UnknownRJump_0x1755:
	ld a, [sHVelocityIndex]
	cp $C0
	jr c, UnknownRJump_0x17C4
	ld a, 191
	ld [sHVelocityIndex], a
	jr UnknownRJump_0x17C4

UnknownRJump_0x1763:
	ld a, [sHVelocityIndex]
	cp $F4
	jr c, UnknownRJump_0x17C4
	ld a, 243
	ld [sHVelocityIndex], a
	jr UnknownRJump_0x17C4

UnknownRJump_0x1771:
	ld a, [hKeysHeld]
	bit 5, a
	jr z, UnknownRJump_0x17C4
	ld a, 255
	ld [sMarioDirection], a
	ld a, [sHVelocityIndex]
	sub 8
	ld [sHVelocityIndex], a
	ld a, [$A26D]
	ld b, a
	ld a, [sMarioOnGround]
	or b
	jr nz, UnknownRJump_0x179E
	ld a, [sHVelocityIndex]
	and $F0
	cp $40
	jr nz, UnknownRJump_0x17B8
	ld a, 72
	ld [sHVelocityIndex], a
	jr UnknownRJump_0x17C4

UnknownRJump_0x179E:
	ld a, [$A287]
	and a
	jr nz, UnknownRJump_0x17AA
	ld a, [hKeysHeld]
	bit 1, a
	jr nz, UnknownRJump_0x17B8

UnknownRJump_0x17AA:
	ld a, [sHVelocityIndex]
	cp $48
	jr nc, UnknownRJump_0x17C4
	ld a, 72
	ld [sHVelocityIndex], a
	jr UnknownRJump_0x17C4

UnknownRJump_0x17B8:
	ld a, [sHVelocityIndex]
	cp $08
	jr nc, UnknownRJump_0x17C4
	ld a, 8
	ld [sHVelocityIndex], a

UnknownJump_0x17C4:
UnknownRJump_0x17C4:
	ret

UnknownJump_0x17C5:
	ld a, 1
	ld [sMarioDirection], a
	ld a, 128
	ld [sHVelocityIndex], a
	ld a, [sMarioOnGround]
	and a
	ret z
	ld a, 184
	ld [sHVelocityIndex], a
	ret

UnknownData_0x17DA:
INCBIN "baserom.gb", $17DA, $181C - $17DA


UnknownCall_0x181C:
	ld a, [$FF00+$C2]
	ld [sMarioX], a
	ld a, [$FF00+$C3]
	ld [sMarioXU], a
	ld a, [$A24F]
	and a
	jr nz, UnknownRJump_0x1842
	ld hl, MarioSpeedTableHWater
	ld a, [$A26D]
	and a
	jr nz, UnknownRJump_0x1845
	ld a, [$A287]
	bit 1, a
	jr z, UnknownRJump_0x1842
	ld a, [sMarioOnGround]
	and a
	jr nz, UnknownRJump_0x1845

UnknownRJump_0x1842:
	ld hl, MarioSpeedTableH

UnknownRJump_0x1845:
	ld a, [sHVelocityIndex]
	ld e, a
	ld a, [$FF00+$97]
	and $07
	add e
	ld e, a
	ld d, 0
	add de
	ld a, [hl]
	ld b, a
	ld a, [$A202]
	ld [$A219], a
	add b
	ld [$A202], a
	add 16
	ld b, a
	ld a, [$FF00+$C2]
	add b
	ld [$FF00+$C2], a
	ld a, [$FF00+$C3]
	adc 0
	ld [$FF00+$C3], a
	ld a, [$FF00+$C2]
	sub 16
	ld [$FF00+$C2], a
	ld a, [$FF00+$C3]
	sbc 0
	ld [$FF00+$C3], a
	ld a, [$A202]
	bit 7, a
	jr nz, UnknownRJump_0x1886
	call UnknownCall_0x1E8D
	jr nc, UnknownRJump_0x18AE
	jr UnknownRJump_0x188B

UnknownRJump_0x1886:
	call UnknownCall_0x1E7C
	jr nc, UnknownRJump_0x18AE

UnknownRJump_0x188B:
	ld a, [sMarioX]
	ld [$FF00+$C2], a
	ld a, [sMarioXU]
	ld [$FF00+$C3], a
	ld a, [$A219]
	ld [$A202], a
	ld a, 128
	ld [sHVelocityIndex], a
	ld a, [$A20D]
	and $FC
	cp $0C
	jr nz, UnknownRJump_0x18AE
	ld a, 3
	ld [sPipeTravelDirection], a

UnknownRJump_0x18AE:
	ret

MarioSpeedTableV: ;$18AF
	db $03, $03, $02, $02, $03, $02, $02, $02, $01, $02, $01, $01, $02, $01, $01, $01
	db $01, $00, $01, $00, $01, $00, $00, $01, $00, $FF, $00, $FF, $00, $FF, $FE, $FF
	db $FE, $FE, $FE, $FD, $FE, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FE, $FD, $FD, $FD
	db $FD, $FF, $FF, $FE, $FF, $FE, $FD, $FE, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD
	db $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $FD

MarioSpeedTableVWater: ;$18FB
	db $01, $01, $01, $00, $01, $00, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $FF, $00
	db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	db $FF, $00, $00, $FF, $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
		
MarioSpeedTableVSpace: ;$1947
	db $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
	db $01, $00, $01, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00, $00, $FF, $00
	db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF

UnknownCall_0x1993:
	xor a
	ld [$A220], a
	ld a, [$A20D]
	cp $7E
	jr z, UnknownRJump_0x19AC
	cp $04
	ret nc
	and a
	jr z, UnknownRJump_0x19B0
	cp $01
	jr z, UnknownRJump_0x19D2
	cp $03
	jr z, UnknownRJump_0x19C1

UnknownRJump_0x19AC:
	ld b, 3
	jr UnknownRJump_0x19F1

UnknownRJump_0x19B0:
	ld b, 2
	ld a, [sCurPowerup]
	and a
	jr z, UnknownRJump_0x19F1
	ld a, 1
	ld [$A478], a
	ld b, 1
	jr UnknownRJump_0x19F1

UnknownRJump_0x19C1:
	ld b, 6
	ld a, [sCurPowerup]
	and a
	jr z, UnknownRJump_0x19F1
	ld a, 1
	ld [$A478], a
	ld b, 5
	jr UnknownRJump_0x19F1

UnknownRJump_0x19D2:
	ld a, 255
	ld [$A220], a
	ld a, 2
	ld [$A460], a
	ld b, 3
	call UnknownCall_0x2C6C
	ld a, [$A256]
	and a
	ret nz
	ld b, 4
	call UnknownCall_0x2C77
	ld a, 7
	ld [$A460], a
	ret

UnknownRJump_0x19F1:
	ld a, 2
	ld [$A460], a
	call UnknownCall_0x2C6C
	ld a, 255
	ld [$A220], a
	ret

MarioSpeedTableH: ;$19FF
	db $FE, $FF, $FE, $FF, $FE, $FF, $FE, $FF, $FE, $FF, $FE, $FF, $FE, $FF, $FE, $FF
	db $FE, $FF, $FE, $FF, $FE, $FF, $FE, $FF, $FE, $FF, $FE, $FF, $FE, $FF, $FE, $FF
	db $FE, $FF, $FE, $FF, $FE, $FF, $FE, $FF, $FE, $FF, $FE, $FF, $FE, $FF, $FE, $FF
	db $FE, $FF, $FF, $FE, $FF, $FF, $FE, $FF, $FE, $FF, $FF, $FF, $FE, $FF, $FF, $FF
	db $FE, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	db $FF, $FF, $FF, $00, $FF, $FF, $FF, $00, $FF, $FF, $00, $FF, $FF, $00, $FF, $00
	db $FF, $00, $FF, $00, $FF, $00, $FF, $00, $FF, $00, $00, $FF, $00, $00, $FF, $00
	db $FF, $00, $00, $00, $FF, $00, $00, $00, $FF, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00, $00, $00
	db $01, $00, $00, $00, $01, $00, $00, $00, $01, $00, $00, $01, $00, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $01, $00, $01, $01, $00, $01, $00
	db $01, $01, $01, $00, $01, $01, $01, $00, $01, $01, $01, $01, $01, $01, $01, $01
	db $02, $01, $01, $01, $01, $01, $01, $01, $02, $01, $01, $01, $02, $01, $01, $01
	db $02, $01, $01, $02, $01, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01
	db $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01
	db $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01

MarioSpeedTableHWater: ;$1AFF
	db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $00, $FF, $FF, $FF, $00
	db $FF, $FF, $00, $FF, $FF, $00, $FF, $00, $FF, $00, $FF, $00, $FF, $00, $FF, $00
	db $FF, $00, $00, $FF, $00, $00, $FF, $00, $FF, $00, $00, $00, $FF, $00, $00, $00
	db $FF, $00, $00, $00, $FF, $00, $00, $00, $FF, $00, $00, $00, $FF, $00, $00, $00
	db $FF, $00, $00, $00, $FF, $00, $00, $00, $FF, $00, $00, $00, $00, $00, $00, $00
	db $FF, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00, $00, $00
	db $01, $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $01, $00, $00, $00
	db $01, $00, $00, $00, $01, $00, $00, $00, $01, $00, $00, $00, $01, $00, $00, $00
	db $01, $00, $00, $01, $00, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $01, $00, $01, $01, $00, $01, $00, $01, $01, $01, $00, $01, $01, $01, $00
	db $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01

UnknownCall_0x1BFF:
	push hl
	push de
	push bc
	ld a, [$A26D]
	ld [$A27B], a
	xor a
	ld [$A26D], a
	ld a, [$FF00+$C2]
	add 16
	ld [$FF00+$B9], a
	ld a, [$FF00+$C3]
	adc 0
	ld [$FF00+$BA], a
	ld a, [sCurPowerup]
	and a
	jr z, UnknownRJump_0x1C39
	ld a, [$A291]
	and a
	jr nz, UnknownRJump_0x1C39
	ld a, [$FF00+$C0]
	add 22
	ld [$FF00+$B7], a
	ld a, [$FF00+$C1]
	adc 0
	ld [$FF00+$B8], a
	call UnknownCall_0x1EFA
	and $FE
	cp $50
	jr z, UnknownRJump_0x1C4E

UnknownRJump_0x1C39:
	ld a, [$FF00+$C0]
	add 28
	ld [$FF00+$B7], a
	ld a, [$FF00+$C1]
	adc 0
	ld [$FF00+$B8], a
	call UnknownCall_0x1EFA
	and $FE
	cp $50
	jr nz, UnknownRJump_0x1C82

UnknownRJump_0x1C4E:
	ld a, [$A217]
	ld b, a
	ld a, [$A271]
	or b
	jr nz, UnknownRJump_0x1C6D
	ld a, 15
	ld [$A224], a
	ld a, 20
	ld [$A460], a
	ld a, [sCurPowerup]
	and a
	jr nz, UnknownRJump_0x1C6D
	ld a, 15
	ld [$A460], a

UnknownRJump_0x1C6D:
	ld a, [sMarioScreenY]
	cp $80
	jp c, UnknownJump_0x1D71
	ld a, 128
	ld [$A224], a
	ld a, 15
	ld [$A460], a
	jp UnknownJump_0x1D71

UnknownRJump_0x1C82:
	ld a, [$A20D]
	and $FC
	cp $4C
	jr nz, UnknownRJump_0x1CBA
	ld a, [$A27B]
	and a
	jr nz, UnknownRJump_0x1C9F
	ld a, [sVVelocityIndex]
	cp $18
	jr nc, UnknownRJump_0x1C9F
	ld a, 24
	ld [sVVelocityIndex], a
	jr UnknownRJump_0x1CAA

UnknownRJump_0x1C9F:
	ld a, [sVVelocityIndex]
	cp $18
	jr nc, UnknownRJump_0x1CAA
	xor a
	ld [sMarioInAir], a

UnknownRJump_0x1CAA:
	ld a, 255
	ld [$A26D], a
	ld a, [$A287]
	res 1, a
	ld [$A287], a
	jp UnknownJump_0x1D71

UnknownRJump_0x1CBA:
	ld a, [$A20D]
	and $FE
	cp $4A
	jr nz, UnknownRJump_0x1CFB
	xor a
	ld [$A53F], a
	xor a
	ld [$A2B4], a
	ld a, [$A20D]
	cp $4A
	jr z, UnknownRJump_0x1CD7
	ld a, 255
	ld [$A2B4], a

UnknownRJump_0x1CD7:
	ld a, 3
	ld [$A468], a
	xor a
	ld [$A460], a
	ld [$A478], a
	ld [$A470], a
	ld a, 24
	ld [$FF00+$9B], a
	ld a, 192
	ld [$A266], a
	xor a
	ld [$A267], a
	ld [$A2A0], a
	ld [$A299], a
	jr UnknownRJump_0x1D71

UnknownRJump_0x1CFB:
	ld a, [$A287]
	and $02
	ld b, a
	ld a, [$A287]
	res 1, a
	ld [$A287], a
	ld a, [$A20D]
	cp $52
	jr c, UnknownRJump_0x1D28
	cp $58
	jr nc, UnknownRJump_0x1D28
	ld a, [$A287]
	set 1, a
	ld [$A287], a
	xor a
	ld [$A284], a
	ld a, [$A287]
	res 2, a
	ld [$A287], a

UnknownRJump_0x1D28:
	ld a, [$A287]
	and $02
	cp b
	jr z, UnknownRJump_0x1D71
	ld a, [sHVelocityIndex]
	cp $C0
	jr c, UnknownRJump_0x1D3C
	ld a, 191
	ld [sHVelocityIndex], a

UnknownRJump_0x1D3C:
	ld a, [sHVelocityIndex]
	cp $48
	jr nc, UnknownRJump_0x1D48
	ld a, 72
	ld [sHVelocityIndex], a

UnknownRJump_0x1D48:
	call UnknownCall_0x3735
	ld a, [$A287]
	bit 1, a
	jr nz, UnknownRJump_0x1D71
	ld a, [hKeysHeld]
	bit 6, a
	jr nz, UnknownRJump_0x1D64
	ld a, 70
	ld [sVVelocityIndex], a
	ld a, 255
	ld [sMarioInAir], a
	jr UnknownRJump_0x1D71

UnknownRJump_0x1D64:
	ld a, 70
	ld [sVVelocityIndex], a
	ld a, 255
	ld [sMarioInAir], a
	ld [$A2DE], a

UnknownJump_0x1D71:
UnknownRJump_0x1D71:
	pop bc
	pop de
	pop hl
	ret

UnknownCall_0x1D75:
	ld a, [$A20D]
	and $FE
	cp $48
	jr nz, UnknownRJump_0x1DA4
	ld a, 7
	ld [$A460], a
	call UnknownCall_0x1DA5
	ld a, [sCoinLow]
	inc a
	daa
	ld [sCoinLow], a
	ld a, [sCoinHigh]
	adc 0
	ld [sCoinHigh], a
	cp $0A
	jr c, UnknownRJump_0x1DA4

UnknownData_0x1D9A:
INCBIN "baserom.gb", $1D9A, $1DA4 - $1D9A


UnknownRJump_0x1DA4:
	ret

UnknownCall_0x1DA5:
	ld a, [$A20D]
	cp $48
	jr nz, UnknownRJump_0x1DD5
	ld d, 96
	call UnknownCall_0x2C0D
	call UnknownCall_0x200C
	ld a, [$A205]
	and $DE
	ld l, a
	ld a, [$A206]
	ld h, a
	ld de, $001F

UnknownRJump_0x1DC1:
	ld a, [$FF00+$41]
	and $03
	jr nz, UnknownRJump_0x1DC1

UnknownRJump_0x1DC7:
	ld a, [$FF00+$41]
	and $03
	jr nz, UnknownRJump_0x1DC7
	ld a, 255
	ld [hli], a
	ld [hl], a
	add de
	ld [hli], a
	ld [hl], a
	ret

UnknownRJump_0x1DD5:
	ld d, 127
	call UnknownCall_0x2C0D
	call UnknownCall_0x200C
	ld a, [$A205]
	and $DE
	ld l, a
	ld a, [$A206]
	ld h, a
	ld de, $001F

UnknownRJump_0x1DEA:
	ld a, [$FF00+$41]
	and $03
	jr nz, UnknownRJump_0x1DEA

UnknownRJump_0x1DF0:
	ld a, [$FF00+$41]
	and $03
	jr nz, UnknownRJump_0x1DF0
	ld a, 127
	ld [hli], a
	ld [hl], a
	add de
	ld [hli], a
	ld [hl], a
	ret

UnknownCall_0x1DFE:
	push hl
	push de
	push bc
	ld a, [$FF00+$C2]
	add 16
	ld [$FF00+$B9], a
	ld a, [$FF00+$C3]
	adc 0
	ld [$FF00+$BA], a
	ld a, [sCurPowerup]
	and a
	jr nz, UnknownRJump_0x1E17
	ld b, 28
	jr UnknownRJump_0x1E19

UnknownRJump_0x1E17:
	ld b, 18

UnknownRJump_0x1E19:
	ld a, [$FF00+$C0]
	add b
	ld [$FF00+$B7], a
	ld a, [$FF00+$C1]
	adc 0
	ld [$FF00+$B8], a
	call UnknownCall_0x1EFA
	cp $7E
	jr z, UnknownRJump_0x1E31
	cp $38
	pop bc
	pop de
	pop hl
	ret

UnknownRJump_0x1E31:
	scf
	pop bc
	pop de
	pop hl
	ret

UnknownCall_0x1E36:
	push hl
	push de
	push bc
	jr UnknownRJump_0x1E48

UnknownCall_0x1E3B:
	push hl
	push de
	push bc
	ld a, [$FF00+$C0]
	sub 4
	and $0F
	cp $05
	jr nc, UnknownRJump_0x1E78

UnknownRJump_0x1E48:
	ld a, [$FF00+$C0]
	add 44
	ld [$FF00+$B7], a
	ld a, [$FF00+$C1]
	adc 0
	ld [$FF00+$B8], a
	ld a, [$FF00+$C2]
	add 12
	ld [$FF00+$B9], a
	ld a, [$FF00+$C3]
	adc 0
	ld [$FF00+$BA], a
	call UnknownCall_0x1EFA
	cp $48
	jr c, UnknownRJump_0x1E78
	ld a, [$FF00+$C2]
	add 20
	ld [$FF00+$B9], a
	ld a, [$FF00+$C3]
	adc 0
	ld [$FF00+$BA], a
	call UnknownCall_0x1EFA
	cp $48

UnknownRJump_0x1E78:
	pop bc
	pop de
	pop hl
	ret

UnknownCall_0x1E7C:
	push hl
	push de
	push bc
	ld a, [$FF00+$C2]
	add 11
	ld [$FF00+$B9], a
	ld a, [$FF00+$C3]
	adc 0
	ld [$FF00+$BA], a
	jr UnknownRJump_0x1E9C

UnknownCall_0x1E8D:
	push hl
	push de
	push bc
	ld a, [$FF00+$C2]
	add 20
	ld [$FF00+$B9], a
	ld a, [$FF00+$C3]
	adc 0
	ld [$FF00+$BA], a

UnknownRJump_0x1E9C:
	ld a, [sCurPowerup]
	and a
	jr z, UnknownRJump_0x1EBE
	ld a, [$A291]
	and a
	jr nz, UnknownRJump_0x1EBE
	ld a, [$FF00+$C0]
	add 20
	ld [$FF00+$B7], a
	ld a, [$FF00+$C1]
	adc 0
	ld [$FF00+$B8], a
	call UnknownCall_0x1EFA
	cp $38
	jr c, UnknownRJump_0x1EF0
	call UnknownCall_0x1D75

UnknownRJump_0x1EBE:
	ld a, [$FF00+$C0]
	add 32
	ld [$FF00+$B7], a
	ld a, [$FF00+$C1]
	adc 0
	ld [$FF00+$B8], a
	call UnknownCall_0x1EFA
	cp $38
	jr c, UnknownRJump_0x1EF0
	call UnknownCall_0x1D75
	ld a, [$FF00+$C0]
	add 40
	ld [$FF00+$B7], a
	ld a, [$FF00+$C1]
	adc 0
	ld [$FF00+$B8], a
	call UnknownCall_0x1EFA
	cp $38
	jr c, UnknownRJump_0x1EF0
	call UnknownCall_0x1D75
	scf
	ccf
	pop bc
	pop de
	pop hl
	ret

UnknownRJump_0x1EF0:
	scf
	pop bc
	pop de
	pop hl
	ret

UnknownData_0x1EF5:
INCBIN "baserom.gb", $1EF5, $1EFA - $1EF5


UnknownCall_0x1EFA:
	ld a, [$FF00+$B7]
	sub 16
	ld c, a
	ld a, [$FF00+$B8]
	sbc 0
	ld b, a
	ld a, b
	and $0F
	swap a
	ld h, a
	ld a, c
	and $F0
	swap a
	or h
	add 176
	ld h, a
	ld a, [$FF00+$B9]
	sub 8
	ld c, a
	ld a, [$FF00+$BA]
	sbc 0
	ld b, a
	ld a, b
	and $0F
	swap a
	ld l, a
	ld a, c
	and $F0
	swap a
	or l
	ld l, a
	ld a, [hl]
	ld [$A20D], a
	ret

UnknownCall_0x1F2F:
	ld a, [$FF00+$B8]
	and $0F
	swap a
	ld h, a
	ld a, [$FF00+$B7]
	and $F0
	swap a
	or h
	add 176
	ld h, a
	ld a, [$FF00+$BA]
	and $0F
	swap a
	ld l, a
	ld a, [$FF00+$B9]
	and $F0
	swap a
	or l
	ld l, a
	ld a, [hl]
	ret

UnknownData_0x1F51:
INCBIN "baserom.gb", $1F51, $1FD2 - $1F51


ReadJoypad: ;$1FD2
	ld a, [hKeysHeld]
	ld [$A2D0], a
	ld a, 32
	ld [$FF00+$00], a
	ld a, [$FF00+$00]
	ld a, [$FF00+$00]
	cpl
	and $0F
	swap a
	ld b, a
	ld a, 16
	ld [$FF00+$00], a
	ld a, [$FF00+$00]
	ld a, [$FF00+$00]
	ld a, [$FF00+$00]
	ld a, [$FF00+$00]
	ld a, [$FF00+$00]
	ld a, [$FF00+$00]
	ld a, [$FF00+$00]
	ld a, [$FF00+$00]
	cpl
	and $0F
	or b
	ld c, a
	ld a, [hKeysHeld]
	xor c
	and c
	ld [hKeysPressed], a
	ld a, c
	ld [hKeysHeld], a
	ld a, 48
	ld [$FF00+$00], a
	ret

UnknownCall_0x200C:
	ld a, [$FF00+$B7]
	sub 16
	ld b, 8
	ld de, $0020
	ld hl, $97E0

UnknownRJump_0x2018:
	add de
	sub b
	jr nc, UnknownRJump_0x2018
	ld a, [$FF00+$B9]
	sub b
	srl a
	srl a
	srl a
	add l
	ld l, a
	ld [$A205], a
	ld a, h
	ld [$A206], a
	ret

UnknownData_0x202F:
INCBIN "baserom.gb", $202F, $2062 - $202F


UnknownCall_0x2062:
	ld b, 0
	ld a, [$A2B3]
	and a
	jr z, UnknownRJump_0x206D
	and $03
	ld b, a

UnknownRJump_0x206D:
	ld a, [$FF00+$C8]
	sub 72
	sub b
	ld [$A2B0], a
	ld a, [$FF00+$CA]
	sub 80
	ld [$A2B1], a
	ret

UnknownCall_0x207D:
	ld a, 4 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x10000
	ret

UpdateSound: ;$2089
	ld a, [sSoundDisabled]
	and a
	ret nz
	ld a, 4 ;prepare bank switch
	ld [$2100], a
	call _UpdateSound
	ret

UnknownData_0x2097:
INCBIN "baserom.gb", $2097, $20A4 - $2097


UnknownCall_0x20A4:
	ld a, [$A28E]
	ld b, a
	ld a, [$A28F]
	or b
	jp z, UnknownJump_0x21EE
	ld a, [$A264]
	ld [$FF00+$8D], a
	call UnknownCall_0x2CFF
	call UnknownCall_0x2728
	call $FFA0
	ld a, 5 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ld a, [$A28E]
	ld e, a
	ld d, 0
	sla e
	rl d
	ld hl, $4125
	add de
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld h, a
	ld a, e
	ld l, a

UnknownJump_0x20D9:
	ld a, 5 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ld a, [hl]
	cp $FF
	jp nz, UnknownJump_0x20EB
	inc hl
	jp UnknownJump_0x21EE

UnknownJump_0x20EB:
	and $F0
	cp $20
	jr nz, UnknownRJump_0x210E
	ld a, 15
	ld [$A28B], a
	ld a, 1
	ld [$A267], a
	ld a, 96
	ld [$A266], a
	xor a
	ld [$A299], a
	ld [$A271], a
	ld [$A272], a
	inc hl
	jp UnknownJump_0x21E8

UnknownRJump_0x210E:
	cp $80
	jr nz, UnknownRJump_0x211E
	ld a, [hl]
	and $0F
	or $F0
	ld [$A2E0], a
	inc hl
	jp UnknownJump_0x21E8

UnknownRJump_0x211E:
	cp $30
	jr nz, UnknownRJump_0x214F
	ld a, [hl]
	and $0F
	jr nz, UnknownRJump_0x2131
	inc hl
	ld a, [hli]
	ld [$FF00+$C8], a
	ld a, [hli]
	ld [$FF00+$C0], a
	jp UnknownJump_0x21E8

UnknownRJump_0x2131:
UnknownData_0x2131:
INCBIN "baserom.gb", $2131, $214F - $2131


UnknownRJump_0x214F:
	cp $50
	jr nz, UnknownRJump_0x2162

UnknownData_0x2153:
INCBIN "baserom.gb", $2153, $2162 - $2153


UnknownRJump_0x2162:
	cp $60
	jr nz, UnknownRJump_0x216C
	call UnknownCall_0x25AF
	jp UnknownJump_0x21E8

UnknownRJump_0x216C:
	cp $B0
	jr nz, UnknownRJump_0x217E
	xor a
	ld [$A288], a
	ld a, 136
	ld [$FF00+$4A], a
	call UnknownCall_0x2202
	jp UnknownJump_0x21E8

UnknownRJump_0x217E:
	cp $00
	jr nz, UnknownRJump_0x218C

UnknownData_0x2182:
INCBIN "baserom.gb", $2182, $218C - $2182


UnknownRJump_0x218C:
	cp $10
	jr nz, UnknownRJump_0x2198

UnknownData_0x2190:
INCBIN "baserom.gb", $2190, $2198 - $2190


UnknownRJump_0x2198:
	cp $40
	jr nz, UnknownRJump_0x21A7
	call UnknownCall_0x2323
	ld a, 1
	ld [$A24A], a
	jp UnknownJump_0x21E8

UnknownRJump_0x21A7:
UnknownData_0x21A7:
INCBIN "baserom.gb", $21A7, $21E8 - $21A7


UnknownJump_0x21E8:
	call UnknownCall_0x2728
	jp UnknownJump_0x20D9

UnknownJump_0x21EE:
	ld a, [$A24A]
	ld [$A249], a
	xor a
	ld [$A28E], a
	ld [$A28F], a
	ld [$A24A], a
	ld [$A2A8], a
	ret

UnknownCall_0x2202:
	ld a, [hli]
	and $0F
	ld b, a
	cp $01
	jr z, UnknownRJump_0x224E
	cp $03
	jr z, UnknownRJump_0x222E
	ld a, [hli]
	ld [$A24E], a
	ld [$A265], a
	ld a, [hli]
	ld [$FF00+$B1], a
	ld a, [hli]
	ld [$FF00+$B2], a
	ld a, 0
	ld [$FF00+$B3], a
	ld a, 139
	ld [$FF00+$B4], a
	ld a, 128
	ld [$FF00+$B5], a
	ld a, 3
	ld [$FF00+$B6], a
	jp UnknownJump_0x22B9

UnknownRJump_0x222E:
UnknownData_0x222E:
INCBIN "baserom.gb", $222E, $224E - $222E


UnknownRJump_0x224E:
UnknownData_0x224E:
INCBIN "baserom.gb", $224E, $22B9 - $224E


UnknownJump_0x22B9:
	ld a, 255
	ld [$A248], a

UnknownRJump_0x22BE:
	ld a, [$A28C]
	and a
	jr z, UnknownRJump_0x22D5

UnknownData_0x22C4:
INCBIN "baserom.gb", $22C4, $22D5 - $22C4


UnknownRJump_0x22D5:
	call UnknownCall_0x2728
	ld a, [$A248]
	and a
	jr nz, UnknownRJump_0x22BE
	ret

UnknownData_0x22DF:
INCBIN "baserom.gb", $22DF, $2323 - $22DF


UnknownCall_0x2323:
	inc hl
	ld a, [hl]
	swap a
	and $0F
	ld [$FF00+$C9], a
	ld [$FF00+$C1], a
	ld a, [hli]
	and $0F
	ld [$FF00+$CB], a
	ld [$FF00+$C3], a
	push hl
	call UnknownCall_0x2728
	ld a, [$A20E]
	cp $01
	jr z, UnknownRJump_0x2359
	ld a, [$A20E]
	cp $02
	jp z, UnknownJump_0x23E4
	ld a, [$A20E]
	cp $04
	jp z, UnknownJump_0x2524
	ld a, [$A20E]
	cp $08
	jp z, UnknownJump_0x246F

UnknownData_0x2357:
INCBIN "baserom.gb", $2357, $2359 - $2357


UnknownRJump_0x2359:
	ld a, [$A258] ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ld a, 0
	ld [$FF00+$AF], a
	ld a, 170
	ld [$FF00+$B0], a
	ld a, 255
	ld [$A24C], a
	ld a, [$FF00+$CA]
	add 80
	ld [$FF00+$CE], a
	ld a, [$FF00+$CB]
	adc 0
	and $0F
	ld [$FF00+$CF], a
	ld a, [$FF00+$C8]
	sub 116
	ld [$FF00+$CC], a
	ld a, [$FF00+$C9]
	sbc 0
	and $0F
	ld [$FF00+$CD], a
	call UnknownCall_0x0A35
	call UnknownCall_0x2728
	ld a, [$A258] ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ld a, 0
	ld [$FF00+$AF], a
	ld a, 170
	ld [$FF00+$B0], a
	ld a, 255
	ld [$A24C], a
	ld a, [$FF00+$CA]
	add 96
	ld [$FF00+$CE], a
	ld a, [$FF00+$CB]
	adc 0
	and $0F
	ld [$FF00+$CF], a
	call UnknownCall_0x0A35
	call UnknownCall_0x2728
	ld a, [$A258] ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ld a, 0
	ld [$FF00+$AF], a
	ld a, 170
	ld [$FF00+$B0], a
	ld a, 255
	ld [$A24C], a
	ld a, [$FF00+$CA]
	add 112
	ld [$FF00+$CE], a
	ld a, [$FF00+$CB]
	adc 0
	and $0F
	ld [$FF00+$CF], a
	call UnknownCall_0x0A35
	pop hl
	ret

UnknownJump_0x23E4:
	ld a, [$A258] ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ld a, 0
	ld [$FF00+$AF], a
	ld a, 170
	ld [$FF00+$B0], a
	ld a, 255
	ld [$A24C], a
	ld a, [$FF00+$CA]
	sub 96
	ld [$FF00+$CE], a
	ld a, [$FF00+$CB]
	sbc 0
	and $0F
	ld [$FF00+$CF], a
	ld a, [$FF00+$C8]
	sub 116
	ld [$FF00+$CC], a
	ld a, [$FF00+$C9]
	sbc 0
	and $0F
	ld [$FF00+$CD], a
	call UnknownCall_0x0A35
	call UnknownCall_0x2728
	ld a, [$A258] ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ld a, 0
	ld [$FF00+$AF], a
	ld a, 170
	ld [$FF00+$B0], a
	ld a, 255
	ld [$A24C], a
	ld a, [$FF00+$CA]
	sub 112
	ld [$FF00+$CE], a
	ld a, [$FF00+$CB]
	sbc 0
	and $0F
	ld [$FF00+$CF], a
	call UnknownCall_0x0A35
	call UnknownCall_0x2728
	ld a, [$A258] ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ld a, 0
	ld [$FF00+$AF], a
	ld a, 170
	ld [$FF00+$B0], a
	ld a, 255
	ld [$A24C], a
	ld a, [$FF00+$CA]
	sub 128
	ld [$FF00+$CE], a
	ld a, [$FF00+$CB]
	sbc 0
	and $0F
	ld [$FF00+$CF], a
	call UnknownCall_0x0A35
	pop hl
	ret

UnknownJump_0x246F:
	ld a, [$A258] ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ld a, 0
	ld [$FF00+$AF], a
	ld a, 170
	ld [$FF00+$B0], a
	ld a, 255
	ld [$A24C], a
	ld a, [$FF00+$CA]
	sub 128
	ld [$FF00+$CE], a
	ld a, [$FF00+$CB]
	sbc 0
	and $0F
	ld [$FF00+$CF], a
	ld a, [$FF00+$C8]
	add 120
	ld [$FF00+$CC], a
	ld a, [$FF00+$C9]
	adc 0
	and $0F
	ld [$FF00+$CD], a
	call UnknownCall_0x0969
	call UnknownCall_0x2728
	ld a, [$A258] ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ld a, 0
	ld [$FF00+$AF], a
	ld a, 170
	ld [$FF00+$B0], a
	ld a, 255
	ld [$A24C], a
	ld a, [$FF00+$C8]
	add 104
	ld [$FF00+$CC], a
	ld a, [$FF00+$C9]
	adc 0
	and $0F
	ld [$FF00+$CD], a
	call UnknownCall_0x0969
	call UnknownCall_0x2728
	ld a, [$A258] ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ld a, 0
	ld [$FF00+$AF], a
	ld a, 170
	ld [$FF00+$B0], a
	ld a, 255
	ld [$A24C], a
	ld a, [$FF00+$C8]
	add 88
	ld [$FF00+$CC], a
	ld a, [$FF00+$C9]
	adc 0
	and $0F
	ld [$FF00+$CD], a
	call UnknownCall_0x0969
	call UnknownCall_0x2728
	ld a, [$A258] ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ld a, 0
	ld [$FF00+$AF], a
	ld a, 170
	ld [$FF00+$B0], a
	ld a, 255
	ld [$A24C], a
	ld a, [$FF00+$C8]
	add 72
	ld [$FF00+$CC], a
	ld a, [$FF00+$C9]
	adc 0
	and $0F
	ld [$FF00+$CD], a
	call UnknownCall_0x0969
	pop hl
	ret

UnknownJump_0x2524:
	ld a, [$A258] ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ld a, 0
	ld [$FF00+$AF], a
	ld a, 170
	ld [$FF00+$B0], a
	ld a, 255
	ld [$A24C], a
	ld a, [$FF00+$CA]
	sub 128
	ld [$FF00+$CE], a
	ld a, [$FF00+$CB]
	sbc 0
	and $0F
	ld [$FF00+$CF], a
	ld a, [$FF00+$C8]
	sub 120
	ld [$FF00+$CC], a
	ld a, [$FF00+$C9]
	sbc 0
	and $0F
	ld [$FF00+$CD], a
	call UnknownCall_0x0969
	call UnknownCall_0x2728
	ld a, [$A258] ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ld a, 0
	ld [$FF00+$AF], a
	ld a, 170
	ld [$FF00+$B0], a
	ld a, 255
	ld [$A24C], a
	ld a, [$FF00+$C8]
	sub 104
	ld [$FF00+$CC], a
	ld a, [$FF00+$C9]
	sbc 0
	and $0F
	ld [$FF00+$CD], a
	call UnknownCall_0x0969
	call UnknownCall_0x2728
	ld a, [$A258] ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ld a, 0
	ld [$FF00+$AF], a
	ld a, 170
	ld [$FF00+$B0], a
	ld a, 255
	ld [$A24C], a
	ld a, [$FF00+$C8]
	sub 88
	ld [$FF00+$CC], a
	ld a, [$FF00+$C9]
	sbc 0
	and $0F
	ld [$FF00+$CD], a
	call UnknownCall_0x0969
	pop hl
	ret

UnknownCall_0x25AF:
	ld a, [hli]
	and $0F
	ld [$A22D], a
	push hl
	call DisableVBlank
	ld a, 19 ;prepare bank switch
	ld [$A258], a
	ld [$2100], a
	ld a, 3
	ld [$A812], a
	call UnknownCall_0x0361
	ld a, 7 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ld bc, $0050
	ld hl, $7800
	ld de, $8E80
	call CopyMem
	ld hl, $268B
	ld a, [$A22D]
	sla a
	ld e, a
	ld d, 0
	add de
	ld a, [hli] ;prepare bank switch
	ld [$2100], a
	ld hl, $2699
	ld a, [$A22D]
	sla a
	sla a
	ld e, a
	ld d, 0
	add de
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld h, a
	ld a, e
	ld l, a
	ld bc, $0600
	ld de, $9200
	ld a, [$A269]
	cp $18
	jr nz, UnknownRJump_0x2614
	ld bc, $0800
	ld de, $9000

UnknownRJump_0x2614:
	call CopyMem
	ld hl, $268B
	ld a, [$A22D]
	sla a
	inc a
	ld e, a
	ld d, 0
	add de
	ld a, [hli] ;prepare bank switch
	ld [$2100], a
	ld hl, $269B
	ld a, [$A22D]
	sla a
	sla a
	ld e, a
	ld d, 0
	add de
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld h, a
	ld a, e
	ld l, a
	ld bc, $0400
	ld de, $8B00
	ld a, [$A269]
	cp $18
	jr nz, UnknownRJump_0x264F
	ld bc, $0700
	ld de, $8900

UnknownRJump_0x264F:
	call CopyMem
	ld a, 8 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ld hl, $26B5
	ld a, [$A22D]
	sla a
	ld e, a
	ld d, 0
	add de
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	ld hl, $A600

UnknownRJump_0x266D:
	ld a, [de]
	ld [hli], a
	inc de
	ld a, h
	cp $A8
	jr nz, UnknownRJump_0x266D
	xor a
	ld [$FF00+$47], a
	ld [sBGPalette], a
	ld [$FF00+$48], a
	ld [sOAMPalette1], a
	ld [$FF00+$49], a
	ld [sOAMPalette2], a
	ld a, 227
	ld [$FF00+$40], a
	pop hl
	ret

UnknownData_0x268B:
INCBIN "baserom.gb", $268B, $26C3 - $268B


UnknownJump_0x26C3:
	ld a, [$AA01]
	and a
	jr z, UnknownRJump_0x2712
	ld a, [$A258] ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call ScrollLevelMap
	jr UnknownRJump_0x2712

UnknownJump_0x26D7:
	ld a, [$A265] ;prepare bank switch
	ld [$2100], a
	ld a, [$FF00+$B5]
	ld c, a
	ld a, [$FF00+$B6]
	ld b, a
	ld a, [$FF00+$B1]
	ld l, a
	ld a, [$FF00+$B2]
	ld h, a
	ld a, [$FF00+$B3]
	ld e, a
	ld a, [$FF00+$B4]
	ld d, a

UnknownRJump_0x26EF:
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, c
	and $3F
	jr nz, UnknownRJump_0x26EF
	ld a, c
	ld [$FF00+$B5], a
	ld a, b
	ld [$FF00+$B6], a
	ld a, l
	ld [$FF00+$B1], a
	ld a, h
	ld [$FF00+$B2], a
	ld a, e
	ld [$FF00+$B3], a
	ld a, d
	ld [$FF00+$B4], a
	ld a, b
	or c
	jr nz, UnknownRJump_0x2712
	xor a
	ld [$A248], a

UnknownRJump_0x2712:
	ld a, [$FF00+$9B]
	cp $13
	call nz, UpdateSound
	ld a, 1
	ld [$FF00+$82], a
	ld a, [$A24E] ;prepare bank switch
	ld [$2100], a
	pop hl
	pop de
	pop bc
	pop af
	reti

UnknownCall_0x2728:
	db $76 ;halt (rgbds adds a nop after)

UnknownRJump_0x2729:
	ld a, [$FF00+$82]
	and a
	jr z, UnknownRJump_0x2729
	ld a, [$FF00+$97]
	inc a
	ld [$FF00+$97], a
	xor a
	ld [$FF00+$82], a
	ld a, 192
	ld [$FF00+$8C], a
	xor a
	ld [$FF00+$8D], a
	ret

UnknownCall_0x273E:
	ld a, [hKeysPressed]
	cp $08
	ret nz
	ld a, [$A20E]
	and a
	ret nz
	xor a
	ld [$A23D], a
	ld a, 8
	ld [$FF00+$9B], a
	ld a, 1
	ld [$A45E], a
	ret
	ld b, 231
	ld a, [$FF00+$97]
	bit 4, a
	jr z, UnknownRJump_0x2760
	ld b, 147

UnknownRJump_0x2760:
	ld a, b
	ld [sBGPalette], a
	ld [sOAMPalette1], a
	ld a, [hKeysPressed]
	cp $04
	jr nz, UnknownRJump_0x278E
	ld a, [$A27D]
	bit 7, a
	jr z, UnknownRJump_0x278E
	ld a, 2
	ld [$A45E], a
	ld [$A224], a
	xor a
	ld [$A2C8], a
	ld [$A299], a
	ld [$A2B4], a
	ld [sFastMusic], a
	ld a, 20
	ld [$FF00+$9B], a
	ret

UnknownRJump_0x278E:
	ld a, [hKeysPressed]
	bit 3, a
	ret z
	ld a, [$A80F]
	ld [sBGPalette], a
	ld a, [$A810]
	ld [sOAMPalette1], a
	ld a, [$A811]
	ld [sOAMPalette2], a
	ld a, 4
	ld [$FF00+$9B], a
	ld a, 2
	ld [$A45E], a
	ret
	call DisableVBlank
	xor a
	ld [$FF00+$8D], a
	call UnknownCall_0x2D41
	ld a, 12 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ld bc, $1800
	ld hl, $4C92
	ld de, $8000
	call CopyMem
	ld de, $9800
	ld hl, $6492

UnknownRJump_0x27D2:
	ld a, [hli]
	ld [de], a
	inc de
	ld a, d
	cp $9B
	jr nz, UnknownRJump_0x27D2
	xor a
	ld [$A2B0], a
	ld [$A2B1], a
	ld [$FF00+$42], a
	ld [$FF00+$43], a
	ld a, 228
	ld [sBGPalette], a
	ld a, 195
	ld [$A207], a
	ld [$FF00+$40], a
	ld a, 5
	ld [$A22C], a
	xor a
	ld [sCoinLow], a
	ld [sCoinHigh], a
	ld [$A28D], a
	ld b, a
	ld a, [$A84D]
	and $80
	sla a
	rl b
	ld a, [$A851]
	and $80
	sla a
	rl b
	ld a, [$A865]
	and $80
	sla a
	rl b
	ld a, [$A85F]
	and $80
	sla a
	rl b
	ld a, [$A859]
	and $80
	sla a
	rl b
	ld a, [$A856]
	and $80
	sla a
	rl b
	ld a, b
	ld [$A2B5], a
	ld b, 6
	ld c, 0

UnknownRJump_0x283F:
	srl a
	jr nc, UnknownRJump_0x2844
	inc c

UnknownRJump_0x2844:
	dec b
	jr nz, UnknownRJump_0x283F
	ld a, [$A2C5]
	sub c
	daa
	ld [$A2C5], a
	xor a
	ld [$A84D], a
	ld [$A851], a
	ld [$A865], a
	ld [$A85F], a
	ld [$A859], a
	ld [$A856], a
	call UnknownCall_0x2934
	ld a, 255
	ld [$A266], a
	ld a, 7
	ld [$A468], a
	ld a, 7
	ld [$FF00+$9B], a
	ret

UnknownData_0x2874:
INCBIN "baserom.gb", $2874, $287E - $2874

	ld a, 12 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x30884
	call UnknownCall_0x28A7
	call UnknownCall_0x2CFF
	ld a, [$A267]
	ld b, a
	ld a, [$A266]
	or b
	ret nz
	ld a, [hKeysPressed]
	cp $08
	ret nz
	ld a, 0
	ld [$FF00+$9B], a
	ld a, 255
	ld [$A468], a
	ret

UnknownCall_0x28A7:
	ld a, [$A267]
	and a
	ret nz
	ld a, [$FF00+$97]
	and $10
	swap a
	add 227
	ld [$FF00+$C6], a
	ld a, 68
	ld [$FF00+$C5], a
	ld a, 32
	ld [$FF00+$C4], a
	ld a, [$A266]
	sub 192
	jr c, UnknownRJump_0x28CD
	srl a
	ld b, a
	ld a, 32
	sub b
	ld [$FF00+$C4], a

UnknownRJump_0x28CD:
	ld a, 1 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x5297
	ret

UnknownCall_0x28D9:
	ld hl, $A000
	call UnknownCall_0x28EC
	ld hl, $A050
	call UnknownCall_0x28EC
	ld hl, $A0A0
	call UnknownCall_0x28EC
	ret

UnknownCall_0x28EC:
	push hl
	ld e, l
	ld d, h
	ld b, 69
	ld c, 0

UnknownRJump_0x28F3:
	ld a, [hli]
	add c
	ld c, a
	dec b
	jr nz, UnknownRJump_0x28F3
	ld a, [hli]
	cp c
	jr nz, UnknownRJump_0x2913
	ld a, [hli]
	cp $12
	jr nz, UnknownRJump_0x2913
	ld a, [hli]
	cp $34
	jr nz, UnknownRJump_0x2913
	ld a, [hli]
	cp $56
	jr nz, UnknownRJump_0x2913
	ld a, [hl]
	cp $78
	jr nz, UnknownRJump_0x2913
	pop hl
	ret

UnknownRJump_0x2913:
	pop hl
	ld b, 64
	xor a

UnknownRJump_0x2917:
	ld [hli], a
	dec b
	jr nz, UnknownRJump_0x2917
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, 5
	ld [hli], a
	xor a
	ld [hli], a
	ld a, 2
	ld [hli], a
	ld a, 18
	ld [hli], a
	ld a, 52
	ld [hli], a
	ld a, 86
	ld [hli], a
	ld a, 120
	ld [hl], a
	ret

UnknownCall_0x2934:
	ld hl, $A000
	ld a, [$A2A3]
	ld b, a
	sla a
	sla a
	add b
	swap a
	ld e, a
	ld d, 0
	add de
	ld c, 0
	ld de, $A840
	ld b, 64

UnknownRJump_0x294D:
	ld a, [de]
	ld [hli], a
	add c
	ld c, a
	inc de
	dec b
	jr nz, UnknownRJump_0x294D
	ld a, [sCoinLow]
	ld [hli], a
	add c
	ld c, a
	ld a, [sCoinHigh]
	ld [hli], a
	add c
	ld c, a
	ld a, [$A2C5]
	ld [hli], a
	add c
	ld c, a
	ld a, [$A22C]
	ld [hli], a
	add c
	ld c, a
	ld a, [$A28D]
	ld [hli], a
	add c
	ld [hl], a
	ret

UnknownData_0x2974:
INCBIN "baserom.gb", $2974, $29DD - $2974

	call DisableVBlank
	ld a, 17 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ld bc, $1800
	ld hl, $5800
	ld de, $8000
	call CopyMem
	ld a, 26 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ld hl, $9800
	ld de, $548E

UnknownRJump_0x2A02:
	ld a, [de]
	ld [hli], a
	inc de
	ld a, h
	cp $9C
	jr nz, UnknownRJump_0x2A02
	xor a
	ld [$A2B0], a
	ld [$A2B1], a
	ld a, 225
	ld [sBGPalette], a
	ld a, 210
	ld [sOAMPalette1], a
	ld a, 57
	ld [sOAMPalette2], a
	ld hl, $A100

UnknownRJump_0x2A23:
	xor a
	ld [hli], a
	ld a, l
	cp $A0
	jr c, UnknownRJump_0x2A23
	ld a, 195
	ld [$FF00+$40], a
	ld a, 1
	ld [$A267], a
	ld a, 0
	ld [$A266], a
	ld a, 44
	ld [$A2E1], a
	ld a, 26 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ld a, [$A2DD]
	inc a
	ld [$A2DD], a
	ret

UnknownJump_0x2A4D:
	ld a, 12 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_0x309CD

UnknownCall_0x2A58:
	ld a, 1 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_0x6485

UnknownData_0x2A63:
INCBIN "baserom.gb", $2A63, $2A96 - $2A63


UnknownCall_0x2A96:
	ld a, 4 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call _UpdateSound
	ld a, 26 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_0x2AAA:
	ld a, 4 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call _UpdateSound
	ld a, 15 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_0x2ABE:
	ld a, 5 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ld bc, $1800
	ld hl, $41E5
	ld de, $8000
	call CopyMem
	ret
	ld a, 12 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_0x305B6
	ld a, 12 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_0x3067A
	ld a, 12 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_0x3041D
	ld a, 12 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_0x30451

UnknownData_0x2AFF:
INCBIN "baserom.gb", $2AFF, $2B13 - $2AFF


UnknownCall_0x2B13:
	ld a, 1 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x5297
	ld a, 12 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_0x2B27:
	ld a, 1 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x5297
	ld a, 26 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_0x2B3B:
	ld a, 1 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x5267
	ld a, 12 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_0x2B4F:
	ld a, 1 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x52E7
	ld a, 26 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_0x2B63:
	ld a, 1 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x52E7
	ld a, 12 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_0x2B77:
	ld a, 1 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x5302
	ld a, 12 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_0x2B8B:
	ld a, 7 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ld bc, $0600
	ld hl, $5E00
	ld de, $9200
	call CopyMem
	ld bc, $0380
	ld hl, $6A00
	ld de, $8E80
	call CopyMem
	ld a, 6 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ld bc, $0800
	ld hl, $4000
	ld de, $8000
	call CopyMem
	ld a, 27 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ld hl, $7000
	ld bc, $0300
	ld de, $8800
	call CopyMem
	ld a, 12 ;prepare bank switch
	ld [$2100], a
	ld bc, $0380
	ld hl, $6ACA
	ld de, $8B00
	call CopyMem
	ret
	ld a, 12 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_0x30000
	ld a, 12 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_0x3005F

FarCopyMem: ;$2BFB copymem from bank a
	ld [$A24E], a
	ld [$2100], a
	call CopyMem
	ld a, 15 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_0x2C0D:
	ld a, 1 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_0x5CF2

UnknownJump_0x2C18:
	ld a, 15 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_0x3E73
	ld a, 15 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_0x3EF2B
	ld a, 15 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_0x3C000

UnknownData_0x2C39:
INCBIN "baserom.gb", $2C39, $2C61 - $2C39


UnknownCall_0x2C61:
	ld a, 1 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_0x5D25

UnknownCall_0x2C6C:
	ld a, 1 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_0x5960

UnknownCall_0x2C77:
	ld a, 1 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_0x591F

UnknownCall_0x2C82:
	ld a, 1 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_0x5997

UnknownData_0x2C8D:
INCBIN "baserom.gb", $2C8D, $2CA3 - $2C8D


UnknownJump_0x2CA3:
	ld a, 26 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_0x68528
	ld a, 26 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_0x68000
	ld a, 26 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_0x6800F
	call DisableVBlank
	call UnknownCall_0x031C
	xor a
	ld [$FF00+$8D], a
	call UnknownCall_0x2CFF
	ld a, 5 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_0x14043
	call UnknownCall_0x031C
	ld a, 5 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_0x1407C
	ld a, 1 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_0x5579

UnknownCall_0x2CF4:
	ld a, 1 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_0x5297

UnknownCall_0x2CFF:
	ld a, 1 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_0x52E7

UnknownCall_0x2D0A:
	ld a, 1 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_0x530D

UnknownCall_0x2D15:
	ld a, 1 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_0x5550

UnknownData_0x2D20:
INCBIN "baserom.gb", $2D20, $2D41 - $2D20


UnknownCall_0x2D41:
	ld a, 1 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_0x5302

UnknownData_0x2D4C:
INCBIN "baserom.gb", $2D4C, $2D7D - $2D4C


UnknownCall_0x2D7D:
	xor a
	ld [$A26B], a
	ld [$A2D4], a
	ld a, [$A224]
	and a
	ret nz
	ld hl, $AD00

UnknownRJump_0x2D8C:
	push hl
	ld a, l
	add 23
	ld l, a
	ld a, [hl]
	and $F7
	jr nz, UnknownRJump_0x2DA2
	call UnknownCall_0x2EDD
	ld a, [$A246]
	and a
	jr z, UnknownRJump_0x2DA2
	call UnknownCall_0x2DC6

UnknownRJump_0x2DA2:
	pop hl
	ld de, $0020
	add de
	ld a, h
	cp $AF
	jr nz, UnknownRJump_0x2D8C
	ld a, [$A2D4]
	and a
	ret z
	ld a, 255
	ld [sMarioInAir], a
	ld a, 48
	ld [sVVelocityIndex], a
	ld a, [hKeysHeld]
	bit 0, a
	ret z
	ld a, 75
	ld [sVVelocityIndex], a
	ret

UnknownCall_0x2DC6:
	xor a
	ld [sMarioOnGround], a
	ld a, l
	and $E0
	add 23
	ld l, a
	ld a, [hl]
	set 4, a
	ld [hl], a
	ld a, [$A2A9]
	bit 7, a
	jr z, UnknownRJump_0x2DE1
	and $7F
	ld [$A26C], a
	ret

UnknownRJump_0x2DE1:
	ld a, [$A244]
	ld b, a
	cp $0C
	jp nc, UnknownJump_0x2E6F
	ld a, [$A24D]
	and a
	jr nz, UnknownRJump_0x2DF7
	ld a, [sVVelocityIndex]
	cp $18
	jr nc, UnknownRJump_0x2E6F

UnknownRJump_0x2DF7:
	ld a, [$A2A9]
	and $23
	jr z, UnknownRJump_0x2E6F
	bit 5, a
	jr z, UnknownRJump_0x2E23
	ld a, 255
	ld [$A26B], a
	ld a, l
	and $E0
	add 23
	ld l, a
	ld a, 8
	ld [hl], a
	ld a, [$A244]
	cp $03
	ret c
	ld a, [$FF00+$C0]
	sub 1
	ld [$FF00+$C0], a
	ld a, [$FF00+$C1]
	sbc 0
	ld [$FF00+$C1], a
	ret

UnknownRJump_0x2E23:
	xor a
	ld [$A284], a
	ld a, [$A271]
	and a
	jr nz, UnknownRJump_0x2E6F
	ld a, l
	and $E0
	add 23
	ld l, a
	ld a, 1
	ld [hl], a
	inc b
	inc b
	inc b
	inc b
	inc b
	inc b
	ld a, [$FF00+$C0]
	sub b
	ld [$FF00+$C0], a
	ld a, [$FF00+$C1]
	sbc 0
	ld [$FF00+$C1], a
	ld a, 255
	ld [$A2D4], a
	call UnknownCall_0x1DFE
	jr nc, UnknownRJump_0x2E5C
	ld a, [$FF00+$C0]
	add b
	ld [$FF00+$C0], a
	ld a, [$FF00+$C1]
	adc 0
	ld [$FF00+$C1], a

UnknownRJump_0x2E5C:
	ld a, [$A28B]
	and a
	ret z
	ld a, 49
	ld [sVVelocityIndex], a
	ld a, 255
	ld [sMarioInAir], a
	ld [$A2DE], a
	ret

UnknownJump_0x2E6F:
UnknownRJump_0x2E6F:
	ld a, [$A271]
	and a
	jp nz, UnknownJump_0x2EAA
	ld a, [$A2A9]
	bit 6, a
	ret z
	ld a, [$A287]
	bit 2, a
	jr z, UnknownRJump_0x2E8E
	res 2, a
	ld [$A287], a
	ld a, 128
	ld [$A217], a
	ret

UnknownRJump_0x2E8E:
	ld a, [$A217]
	and a
	jp nz, UnknownJump_0x2F71
	ld a, 15
	ld [$A224], a
	ld a, 20
	ld [$A460], a
	ld a, [sCurPowerup]
	and a
	ret nz
	ld a, 15
	ld [$A460], a
	ret

UnknownJump_0x2EAA:
	ld a, [$A2A9]
	bit 5, a
	ret nz
	ld a, l
	and $E0
	add 23
	ld l, a
	ld a, 4
	ld [hl], a
	ld a, 32
	ld [$A27A], a
	ld a, [$A279]
	inc a
	daa
	ld [$A279], a
	cp $05
	ret c
	ld a, 9
	ld [$A460], a
	ld a, [$A22C]
	inc a
	daa
	ld [$A22C], a
	ret nz

UnknownData_0x2ED7:
INCBIN "baserom.gb", $2ED7, $2EDD - $2ED7


UnknownCall_0x2EDD:
	xor a
	ld [$A246], a
	ld a, l
	sub 5
	ld l, a
	ld a, [hl]
	bit 7, a
	jr z, UnknownRJump_0x2EF1
	and $7F
	jp z, UnknownJump_0x2F71
	jr UnknownRJump_0x2EF5

UnknownRJump_0x2EF1:
	and $63
	jr z, UnknownRJump_0x2F71

UnknownRJump_0x2EF5:
	ld a, [hli]
	ld [$A2A9], a
	ld a, [hli]
	ld [$A2AA], a
	ld a, [hli]
	ld [$A2AB], a
	ld a, [hli]
	ld [$A2AC], a
	ld a, [hli]
	ld [$A2AD], a
	ld a, [hl]
	and $F7
	ret nz
	ld a, l
	sub 14
	ld l, a
	ld a, [hli]
	ld [$A2AE], a
	ld b, a
	ld a, [hl]
	ld [$A2AF], a
	ld c, a
	ld a, [$A2AA]
	add b
	sub 20
	ld d, a
	ld a, [sCurPowerup]
	and a
	jr nz, UnknownRJump_0x2F34
	ld e, 0
	ld a, [$A291]
	and a
	jr z, UnknownRJump_0x2F3E
	ld e, 248
	jr UnknownRJump_0x2F3E

UnknownRJump_0x2F34:
	ld e, 8
	ld a, [$A291]
	and a
	jr z, UnknownRJump_0x2F3E
	ld e, 0

UnknownRJump_0x2F3E:
	ld a, [$A2AB]
	add b
	add e
	sub d
	ld e, a
	ld a, [sMarioScreenY]
	sub d
	ld [$A244], a
	cp e
	jr nc, UnknownRJump_0x2F71
	ld a, [$A2AC]
	add c
	add 11
	sub 16
	ld d, a
	ld a, [$A2AD]
	add c
	add 20
	sub 16
	sub d
	ld e, a
	ld a, [sMarioScreenX]
	sub d
	ld [$A245], a
	cp e
	jr nc, UnknownRJump_0x2F71
	ld a, 255
	ld [$A246], a

UnknownJump_0x2F71:
UnknownRJump_0x2F71:
	ret

UnknownCall_0x2F72:
	xor a
	ld [$A256], a
	ld a, [$A2B0]
	ld b, a
	ld a, [$FF00+$B7]
	and $F0
	add 8
	sub b
	sub 16
	ld [$FF00+$B7], a
	ld a, [$A2B1]
	ld b, a
	ld a, [$FF00+$B9]
	add 8
	and $F0
	sub b
	sub 8
	ld [$FF00+$B9], a
	ld hl, $AD00

UnknownRJump_0x2F97:
	push hl
	ld a, l
	add 23
	ld l, a
	ld a, [hl]
	and a
	jr nz, UnknownRJump_0x2FA3
	call UnknownCall_0x2FAE

UnknownRJump_0x2FA3:
	pop hl
	ld de, $0020
	add de
	ld a, h
	cp $AF
	jr nz, UnknownRJump_0x2F97
	ret

UnknownCall_0x2FAE:
	xor a
	ld [$A247], a
	ld a, l
	sub 5
	ld l, a
	ld a, [hli]
	ld [$A2A9], a
	and a
	jr z, UnknownRJump_0x2FEC
	ld a, l
	sub 10
	ld l, a
	ld a, [$FF00+$B7]
	ld b, a
	ld a, [hli]
	sub b
	cp $10
	jr nc, UnknownRJump_0x2FEC
	ld a, [$FF00+$B9]
	ld b, a
	ld a, [hl]
	sub b
	cp $14
	jr nc, UnknownRJump_0x2FEC
	ld a, 255
	ld [$A247], a
	ld a, l
	add 13
	ld l, a
	ld a, [hl]
	set 5, a
	ld [hl], a
	ld a, [$A2A9]
	cp $80
	jr nz, UnknownRJump_0x2FEC
	ld a, 255
	ld [$A256], a

UnknownRJump_0x2FEC:
	ret

UnknownCall_0x2FED:
	ld hl, $AD00

UnknownRJump_0x2FF0:
	push hl
	ld a, l
	add 23
	ld l, a
	ld a, [hl]
	and a
	jr nz, UnknownRJump_0x2FFC
	call UnknownCall_0x3007

UnknownRJump_0x2FFC:
	pop hl
	ld de, $0020
	add de
	ld a, h
	cp $AF
	jr nz, UnknownRJump_0x2FF0
	ret

UnknownCall_0x3007:
	ld a, l
	sub 5
	ld l, a
	ld a, [hl]
	ld [$FF00+$98], a
	bit 7, a
	ret nz
	and a
	ret z
	ld a, [hli]
	ld [$A2A9], a
	ld a, [hli]
	ld [$A2AA], a
	ld a, [hli]
	ld [$A2AB], a
	ld a, [hli]
	ld [$A2AC], a
	ld a, [hli]
	ld [$A2AD], a
	ld a, l
	sub 14
	ld l, a
	ld a, [hli]
	ld [$A2AE], a
	ld b, a
	ld a, [hl]
	ld [$A2AF], a
	ld c, a
	ld a, [$A2AA]
	sub 6
	add b
	ld d, a
	ld a, [$A2AB]
	add 6
	add b
	sub d
	ld e, a
	ld a, [$FF00+$C4]
	sub d
	cp e
	jp nc, UnknownJump_0x307C
	ld a, [$A2AC]
	sub 6
	add c
	ld d, a
	ld a, [$A2AD]
	add 6
	add c
	sub d
	ld e, a
	ld a, [$FF00+$C5]
	sub d
	cp e
	jp nc, UnknownJump_0x307C
	ld a, [$FF00+$98]
	bit 2, a
	jr nz, UnknownRJump_0x3071
	ld a, 2
	ld [$A460], a
	ld [$A246], a
	jr UnknownRJump_0x307C

UnknownRJump_0x3071:
	ld a, l
	add 13
	ld l, a
	ld a, [hl]
	set 1, a
	ld [hl], a
	ld [$A246], a

UnknownJump_0x307C:
UnknownRJump_0x307C:
	ret

UnknownCall_0x307D:
	ld a, [$A28B]
	and a
	ret nz
	ld a, [sMarioOnGround]
	ld b, a
	ld a, [$A26B]
	or b
	ret z
	ld a, [hKeysHeld]
	cp $82
	jr z, UnknownRJump_0x3098
	ld a, [hKeysHeld]
	cp $42
	jr z, UnknownRJump_0x30D9
	ret

UnknownRJump_0x3098:
	ld a, [sMarioScreenY]
	cp $20
	ret c
	ld a, [$A258] ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ld a, [$FF00+$C9]
	swap a
	ld b, a
	ld a, [$FF00+$CB]
	or b
	ld e, a
	ld d, 0
	ld hl, $A960
	add de
	ld a, [hl]
	ld [$FF00+$98], a
	ld a, [$A223]
	set 7, a
	ld [$A223], a
	ld a, [$FF00+$98]
	bit 3, a
	jr z, UnknownRJump_0x30CC
	ld a, [$FF00+$C8]
	cp $C0
	ret nc

UnknownRJump_0x30CC:
	ld a, [$FF00+$C8]
	add 1
	ld [$FF00+$C8], a
	ld a, [$FF00+$C9]
	adc 0
	ld [$FF00+$C9], a
	ret

UnknownRJump_0x30D9:
	ld a, [sMarioScreenY]
	cp $70
	ret nc
	ld a, [$A258] ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ld a, [$FF00+$C9]
	swap a
	ld b, a
	ld a, [$FF00+$CB]
	or b
	ld e, a
	ld d, 0
	ld hl, $A960
	add de
	ld a, [hl]
	ld [$FF00+$98], a
	ld a, [$A223]
	set 6, a
	ld [$A223], a
	ld a, [$FF00+$98]
	bit 2, a
	jr z, UnknownRJump_0x310D
	ld a, [$FF00+$C8]
	cp $49
	ret c

UnknownRJump_0x310D:
	ld a, [$FF00+$C8]
	sub 1
	ld [$FF00+$C8], a
	ld a, [$FF00+$C9]
	sbc 0
	ld [$FF00+$C9], a
	ret
	ld a, [$A266]
	and a
	jr z, UnknownRJump_0x3127

UnknownRJump_0x3120:
	ld a, [$FF00+$44]
	cp $50
	jr nc, UnknownRJump_0x3120
	ret

UnknownRJump_0x3127:
	xor a
	ld [$A299], a
	ld [$A2DC], a
	ld a, 20
	ld [$FF00+$9B], a
	call UnknownCall_0x2D41
	ld a, [sSoundDisabled]
	and a
	jp nz, UnknownJump_0x3150
	ld a, [$A22C]
	sub 1
	daa
	ld [$A22C], a
	jr c, UnknownRJump_0x314B
	call UnknownCall_0x2934
	ret

UnknownRJump_0x314B:
	ld a, 5
	ld [$FF00+$9B], a
	ret

UnknownJump_0x3150:
UnknownData_0x3150:
INCBIN "baserom.gb", $3150, $315C - $3150


UnknownCall_0x315C:
	ld hl, MarioSpeedTableDead
	ld a, [sVVelocityIndex]
	ld c, a
	ld b, 0
	add bc
	ld a, [hl]
	ld b, a
	ld a, [$FF00+$C0]
	add b
	ld [$FF00+$C0], a
	ld a, 1
	ld [$FF00+$BB], a
	call UnknownCall_0x2D15
	ld a, [sMarioScreenY]
	and $F0
	cp $B0
	jr z, UnknownRJump_0x3186
	ld a, [sVVelocityIndex]
	dec a
	ret z
	ld [sVVelocityIndex], a
	ret

UnknownRJump_0x3186:
	ld a, 2
	ld [$A468], a
	xor a
	ld [sCurPowerup], a
	ld [$A217], a
	ld [$A267], a
	ld a, 192
	ld [$A266], a
	ld a, 9
	ld [$FF00+$9B], a
	ret

UnknownCall_0x319F:
	ld a, [$A224]
	and a
	ret z
	ld a, [$A224]
	cp $80
	jr z, UnknownRJump_0x31D1
	ld a, [sCurPowerup]
	and a
	jr z, UnknownRJump_0x31D1
	cp $01
	jr nz, UnknownRJump_0x31C2
	xor a
	ld [$A224], a
	ld [sCurPowerup], a
	ld a, 128
	ld [$A217], a
	ret

UnknownRJump_0x31C2:
	xor a
	ld [$A224], a
	ld a, 1
	ld [sCurPowerup], a
	ld a, 128
	ld [$A217], a
	ret

UnknownRJump_0x31D1:
	ld a, 255
	ld [$A224], a
	xor a
	ld [$A222], a
	ld a, 95
	ld [sVVelocityIndex], a
	ret

UnknownASM_0x31E0:
INCBIN "baserom.gb", $31E0, $31EF - $31E0

MarioSpeedTableDead: ;$31EF
	db $03, $03, $03, $02, $02, $03, $02, $02, $02, $02, $01, $02, $01, $01, $01, $01
	db $01, $01, $00, $01, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $FF, $00, $FF, $00, $FF, $00, $FF, $FF, $FF, $FF, $FF, $FF, $FE, $FF, $FE, $FE
	db $FE, $FE, $FD, $FE, $FE, $FD, $FD, $FD, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

UnknownCall_0x324F:
	ld hl, $A880

UnknownRJump_0x3252:
	ld a, [hl]
	and a
	call nz, UnknownCall_0x3261
	ld bc, $0010
	add bc
	ld a, l
	cp $A0
	jr nz, UnknownRJump_0x3252
	ret

UnknownCall_0x3261:
	push hl
	inc hl
	ld a, [hli]
	ld [$A25D], a
	inc hl
	ld a, [hli]
	ld [$A25F], a
	inc hl
	ld a, [hl]
	ld [$A212], a
	ld a, [$FF00+$CA]
	ld b, a
	ld a, [$A25F]
	sub b
	add 80
	ld [$FF00+$C5], a
	and $F0
	cp $C0
	jr z, UnknownRJump_0x32BD
	ld a, [$FF00+$C8]
	ld b, a
	ld a, [$A25D]
	sub b
	add 70
	ld [$FF00+$C4], a
	and $F0
	cp $C0
	jr z, UnknownRJump_0x32BD
	ld b, 176
	ld a, [$A212]
	cp $FF
	jr z, UnknownRJump_0x329E
	ld b, 180

UnknownRJump_0x329E:
	ld a, [$FF00+$97]
	and $06
	srl a
	add b
	ld [$FF00+$C6], a
	ld a, 1
	ld [$FF00+$BB], a
	call UnknownCall_0x2CF4
	xor a
	ld [$A246], a
	call UnknownCall_0x2FED
	ld a, [$A246]
	and a
	jr nz, UnknownRJump_0x32BD
	pop hl
	ret

UnknownRJump_0x32BD:
	pop hl
	xor a
	ld [hl], a
	ret

UnknownCall_0x32C1:
	ld a, [hKeysPressed]
	bit 1, a
	ret z
	ld a, [sCurPowerup]
	cp $03
	ret nz
	ld a, [$A291]
	and a
	ret nz
	ld a, [$A24F]
	and a
	ret nz
	ld hl, $A880

UnknownRJump_0x32D9:
	ld a, [hl]
	and a
	jr z, UnknownRJump_0x32E7
	ld bc, $0010
	add bc
	ld a, l
	cp $A0
	jr nz, UnknownRJump_0x32D9
	ret

UnknownRJump_0x32E7:
	ld a, 1
	ld [hli], a
	ld a, [$FF00+$C0]
	add 28
	ld [hli], a
	ld a, [$FF00+$C1]
	adc 0
	ld [hli], a
	ld a, [$FF00+$C2]
	add 16
	ld [hli], a
	ld a, [$FF00+$C3]
	adc 0
	ld [hli], a
	ld a, [sMarioDirection]
	ld [hl], a
	ld a, [sSpinJump]
	and a
	jr z, UnknownRJump_0x330E
	ld a, [$FF00+$97]
	and $02
	dec a
	ld [hl], a

UnknownRJump_0x330E:
	inc hl
	xor a
	ld [hl], a
	ld a, 8
	ld [$A25A], a
	ld a, 11
	ld [$A460], a
	ret

UnknownCall_0x331C:
	ld hl, $A880

UnknownRJump_0x331F:
	ld a, [hl]
	and a
	call nz, UnknownCall_0x332E
	ld bc, $0010
	add bc
	ld a, l
	cp $A0
	jr nz, UnknownRJump_0x331F
	ret

UnknownCall_0x332E:
	ld [$A25B], a
	push hl
	inc hl
	ld a, [hli]
	ld [$A25D], a
	ld [$FF00+$B7], a
	ld a, [hli]
	ld [$A25E], a
	ld [$FF00+$B8], a
	ld a, [hli]
	ld [$A25F], a
	ld a, [hli]
	ld [$A260], a
	ld a, [hli]
	ld [$A212], a
	sla a
	ld b, a
	ld a, [hl]
	ld [$A259], a
	ld c, a
	ld a, b
	cp $80
	jr nc, UnknownRJump_0x336E
	inc b
	ld a, [$A25F]
	add b
	ld [$A25F], a
	ld [$FF00+$B9], a
	ld a, [$A260]
	adc 0
	ld [$A260], a
	ld [$FF00+$BA], a
	jr UnknownRJump_0x3386

UnknownRJump_0x336E:
	dec b
	ld a, b
	cpl
	inc a
	ld b, a
	ld a, [$A25F]
	sub b
	ld [$A25F], a
	ld [$FF00+$B9], a
	ld a, [$A260]
	sbc 0
	ld [$A260], a
	ld [$FF00+$BA], a

UnknownRJump_0x3386:
	call UnknownCall_0x1EFA
	cp $38
	jp c, UnknownJump_0x3415
	ld a, [$A259]
	ld c, a
	ld hl, $3439
	ld b, 0
	add bc
	ld a, [hl]
	ld b, a
	ld a, c
	cp $0C
	jr c, UnknownRJump_0x33B4
	ld a, [$A25D]
	sub b
	ld [$A25D], a
	ld [$FF00+$B7], a
	ld a, [$A25E]
	sbc 0
	ld [$A25E], a
	ld [$FF00+$B8], a
	jr UnknownRJump_0x33C7

UnknownRJump_0x33B4:
	ld a, [$A25D]
	add b
	ld [$A25D], a
	ld [$FF00+$B7], a
	ld a, [$A25E]
	adc 0
	ld [$A25E], a
	ld [$FF00+$B8], a

UnknownRJump_0x33C7:
	call UnknownCall_0x1EFA
	cp $48
	jr nc, UnknownRJump_0x33F1
	ld a, [$A259]
	cp $0C
	jr nc, UnknownRJump_0x33F1
	ld a, [$A20D]
	cp $06
	jr z, UnknownRJump_0x341C
	ld a, 24
	ld [$A259], a
	ld a, [$A25D]
	sub 3
	ld [$A25D], a
	ld a, [$A25E]
	sbc 0
	ld [$A25E], a

UnknownRJump_0x33F1:
	ld a, [$A259]
	and a
	jr z, UnknownRJump_0x33FB
	dec a
	ld [$A259], a

UnknownRJump_0x33FB:
	pop hl
	push hl
	inc hl
	ld a, [$A25D]
	ld [hli], a
	ld a, [$A25E]
	ld [hli], a
	ld a, [$A25F]
	ld [hli], a
	ld a, [$A260]
	ld [hli], a
	inc hl
	ld a, [$A259]
	ld [hl], a
	pop hl
	ret

UnknownJump_0x3415:
	ld a, [$A20D]
	cp $06
	jr nz, UnknownRJump_0x3430

UnknownRJump_0x341C:
	ld a, 1
	ld [$A478], a
	ld b, 1
	ld a, 2
	ld [$A460], a
	call UnknownCall_0x2C6C
	ld a, 255
	ld [$A220], a

UnknownRJump_0x3430:
	pop hl
	xor a
	ld [hl], a
	ld a, 2
	ld [$A460], a
	ret

UnknownData_0x3439:
INCBIN "baserom.gb", $3439, $3451 - $3439


UnknownCall_0x3451:
	ld a, [$A26C]
	and a
	ret z
	cp $01
	jr nz, UnknownRJump_0x3467
	ld a, 1
	ld [sCurPowerup], a
	ld a, 20
	ld [$A470], a
	jp UnknownJump_0x3534

UnknownRJump_0x3467:
	cp $02
	jr nz, UnknownRJump_0x3478
	ld a, 3
	ld [sCurPowerup], a
	ld a, 20
	ld [$A470], a
	jp UnknownJump_0x3534

UnknownRJump_0x3478:
	cp $03
	jr nz, UnknownRJump_0x3489
	ld a, 2
	ld [sCurPowerup], a
	ld a, 20
	ld [$A470], a
	jp UnknownJump_0x3534

UnknownRJump_0x3489:
	cp $04
	jr nz, UnknownRJump_0x34AF
	ld a, [$A271]
	ld b, a
	ld a, [$A272]
	xor $FF
	or b
	jr nz, UnknownRJump_0x349D
	xor a
	ld [$A279], a

UnknownRJump_0x349D:
	ld a, 4
	ld [$A271], a
	ld a, 64
	ld [$A272], a
	ld a, 4
	ld [$A468], a
	jp UnknownJump_0x3539

UnknownRJump_0x34AF:
	cp $05
	jr nz, UnknownRJump_0x34C9
	ld a, 9
	ld [$A460], a
	ld a, [$A22C]
	inc a
	daa
	ld [$A22C], a
	jr nz, UnknownRJump_0x3539

UnknownData_0x34C2:
INCBIN "baserom.gb", $34C2, $34C9 - $34C2


UnknownRJump_0x34C9:
	cp $07
	jr nz, UnknownRJump_0x34D9
	ld a, 21
	ld [$A460], a
	ld a, 255
	ld [$A2A0], a
	jr UnknownRJump_0x3539

UnknownRJump_0x34D9:
	cp $08
	jr nz, UnknownRJump_0x34EC
	ld a, 20
	ld [$A470], a
	ld a, [$A287]
	set 2, a
	ld [$A287], a
	jr UnknownRJump_0x3539

UnknownRJump_0x34EC:
	cp $06
	jr nz, UnknownRJump_0x350A
	ld a, 12
	ld [$A460], a
	ld [$A24F], a
	xor a
	ld [$A53F], a
	ld a, [sVVelocityIndex]
	cp $18
	jr nc, UnknownRJump_0x3539
	ld a, 24
	ld [sVVelocityIndex], a
	jr UnknownRJump_0x3539

UnknownRJump_0x350A:
	cp $09
	jr nz, UnknownRJump_0x3539
	ld a, 7
	ld [$A460], a
	ld a, [sCoinLow]
	add 80
	daa
	ld [sCoinLow], a
	ld a, [sCoinHigh]
	adc 0
	ld [sCoinHigh], a
	cp $0A
	jr c, UnknownRJump_0x3539
	ld a, 153
	ld [sCoinLow], a
	ld a, 9
	ld [sCoinHigh], a
	jr UnknownRJump_0x3539

UnknownJump_0x3534:
	ld a, 64
	ld [$A217], a

UnknownJump_0x3539:
UnknownRJump_0x3539:
	xor a
	ld [$A26C], a
	ret
	xor a
	ld [sCurPowerup], a
	ld a, 20
	ld [$FF00+$9B], a
	ret
	ld a, [$A266]
	ld b, a
	ld a, [$A267]
	or b
	jr z, UnknownRJump_0x3558

UnknownRJump_0x3551:
	ld a, [$FF00+$44]
	cp $50
	jr nc, UnknownRJump_0x3551
	ret

UnknownRJump_0x3558:
	ld a, [$A27D]
	bit 7, a
	jr nz, UnknownRJump_0x356E
	ld a, [$A2B4]
	and a
	jr nz, UnknownRJump_0x356E
	ld a, [$A2C5]
	add 1
	daa
	ld [$A2C5], a

UnknownRJump_0x356E:
	ld a, 20
	ld [$FF00+$9B], a
	ret
	ld a, [$A269]
	cp $FF
	jr nz, .CheckEasyMode
	ld a, 27
	ld [$FF00+$9B], a
	ret

.CheckEasyMode
	ld a, [sEasyMode]
	cp $01
	jr z, .EasyModeOn
	ld a, 11
	ld [$FF00+$9B], a
	ret

.EasyModeOn
	ld a, 208
	ld [sOAMPalette1], a
	call DisableVBlank
	ld a, 26 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ld hl, $4656
	ld bc, $0300
	ld de, $8800
	call CopyMem
	call UnknownCall_0x2D41
	ld a, 224
	ld [sBGPalette], a
	ld a, 210
	ld [sOAMPalette1], a
	ld a, 57
	ld [sOAMPalette2], a
	ld a, 226
	ld [$FF00+$40], a
	ld a, 0
	ld [$A267], a
	ld a, 64
	ld [$A266], a
	ld a, [$FF00+$9B]
	inc a
	ld [$FF00+$9B], a
	ret
	ld a, 80
	ld [$FF00+$C4], a
	ld a, 52
	ld [$FF00+$C5], a
	ld a, 240
	ld [$FF00+$C6], a
	call UnknownCall_0x2CF4
	ld a, [$A266]
	ld b, a
	ld a, [$A267]
	or b
	ret nz
	ld a, 11
	ld [$FF00+$9B], a
	ret

UnknownData_0x35EA:
INCBIN "baserom.gb", $35EA, $3735 - $35EA


UnknownCall_0x3735:
	ld a, 1
	ld [$A2B6], a
	xor a
	ld [$A2B7], a
	ld a, [$FF00+$C1]
	ld [$A2B8], a
	ld a, [$FF00+$C0]
	ld [$A2B9], a
	ld a, [$FF00+$C3]
	ld [$A2BA], a
	ld a, [$FF00+$C2]
	ld [$A2BB], a
	ret

UnknownCall_0x3753:
	ld a, [$FF00+$97]
	and $7F
	ret nz
	ld a, [$A2B6]
	and a
	ret nz
	ld a, 2
	ld [$A2B6], a
	xor a
	ld [$A2B7], a
	ld a, [$FF00+$C0]
	ld [$A2B9], a
	ld a, [$FF00+$C1]
	ld [$A2B8], a
	ld a, [$FF00+$C3]
	ld [$A2BA], a
	ld a, [$FF00+$C2]
	ld [$A2BB], a
	ret

UnknownData_0x377B:
INCBIN "baserom.gb", $377B, $3873 - $377B


UnknownCall_0x3873:
	ld a, [$A299]
	and a
	ret z
	dec a
	and $0F
	ld d, a
	ld a, [$A299]
	and $F0
	swap a
	sla a
	ld b, a
	ld a, 29 ;prepare bank switch
	ld [$2100], a
	ld a, [$A298]
	cp b
	ret c
	xor a
	ld [$A298], a
	ld e, 0
	ld hl, $6680
	add de
	ld a, [$A2CD]
	inc a
	and $03
	ld [$A2CD], a
	sla a
	sla a
	swap a
	ld e, a
	ld d, 0
	add de
	ld de, $9200
	ld b, 64

UnknownRJump_0x38B2:
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, UnknownRJump_0x38B2
	ret

UnknownCall_0x38B9:
	ld a, [sSoundDisabled]
	and $F0
	jr nz, UnknownRJump_0x3911
	ld a, [sSoundDisabled]
	and $0F
	jr nz, UnknownRJump_0x38C8
	ret

UnknownRJump_0x38C8:
	ld a, [hKeysPressed]
	and $08
	jr z, UnknownRJump_0x38E5

UnknownJump_0x38CE:
	ld a, 4 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x1002D
	ld a, [$A0F0]
	inc a
	and $03
	ld [$A0F0], a
	jp Init

UnknownRJump_0x38E5:
	ld a, 5 ;prepare bank switch
	ld [$2100], a
	ld a, [$A2D0]
	ld [hKeysHeld], a
	ld h, 163
	ld a, [$A2CF]
	ld l, a

UnknownRJump_0x38F5:
	ld a, [hli]
	cp $FF
	jp z, UnknownJump_0x38CE
	ld b, a
	ld a, [hli]
	sub 1
	jr c, UnknownRJump_0x38F5
	dec hl
	ld [hld], a
	ld a, [hKeysHeld]
	xor b
	and b
	ld [hKeysPressed], a
	ld a, b
	ld [hKeysHeld], a
	ld a, l
	ld [$A2CF], a
	ret

UnknownRJump_0x3911:
UnknownData_0x3911:
INCBIN "baserom.gb", $3911, $3A00 - $3911


UnknownCall_0x3A00:
	ld a, 3 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0xEC31
	ld a, 2 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_0x3A14:
	ld a, 25 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x66000
	ld a, 2 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_0x3A28:
	ld a, 3 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0xEC40
	ld a, 2 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownData_0x3A3C:
INCBIN "baserom.gb", $3A3C, $3A50 - $3A3C


UnknownCall_0x3A50:
	ld a, 22 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x58000
	ld a, 2 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_0x3A64:
	ld a, 22 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x3D3D
	ld a, 2 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_0x3A78:
	ld a, 22 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x5B31D
	ld a, 2 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_0x3A8C:
	ld a, 2 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x85AA
	ld a, 22 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_0x3AA0:
	ld a, 2 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x863C
	ld a, 22 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_0x3AB4:
	ld a, 2 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x85DC
	ld a, 22 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownData_0x3AC8:
INCBIN "baserom.gb", $3AC8, $3ADC - $3AC8


UnknownCall_0x3ADC:
	ld a, 2 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x85FC
	ld a, 22 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_0x3AF0:
	ld a, 2 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x83EC
	ld a, 22 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_0x3B04:
	ld a, 2 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x8403
	ld a, 22 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_0x3B18:
	ld a, 2 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x8318
	ld a, 22 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_0x3B2C:
	ld a, 2 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x8338
	ld a, 22 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_0x3B40:
	ld a, 2 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x8358
	ld a, 22 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_0x3B54:
	ld a, 2 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x8381
	ld a, 22 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_0x3B68:
	ld a, 2 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x8394
	ld a, 22 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_0x3B7C:
	ld a, 2 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x83B0
	ld a, 22 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_0x3B90:
	ld a, 2 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x83D0
	ld a, 22 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_0x3BA4:
	ld a, 2 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x841A
	ld a, 22 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_0x3BB8:
	ld a, 2 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x843C
	ld a, 22 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_0x3BCC:
	ld a, 2 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x8462
	ld a, 22 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_0x3BE0:
	ld a, 2 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x8484
	ld a, 22 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_0x3BF4:
	ld a, 2 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x84A6
	ld a, 22 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_0x3C08:
	ld a, 2 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x84C8
	ld a, 22 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_0x3C1C:
	ld a, 2 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x84EA
	ld a, 22 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_0x3C30:
	ld a, 2 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x8510
	ld a, 22 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_0x3C44:
	ld a, 2 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x8532
	ld a, 22 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_0x3C58:
	ld a, 2 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x8554
	ld a, 22 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_0x3C6C:
	ld a, 22 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x5B2D7
	ld a, 2 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_0x3C80:
	ld a, 3 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0xC000
	ld a, 2 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_0x3C94:
	ld a, 2 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_0x8D9C

UnknownCall_0x3C9F:
	ld a, 2 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_0x8DA9

UnknownRJump_0x3CAA:
UnknownCall_0x3CAA:
	ld a, [hli]
	ld [de], a
	inc e
	dec b
	jr nz, UnknownRJump_0x3CAA
	ret

UnknownCall_0x3CB1:
	ldh_a_n $DD
	bit 5, a
	ld a, 1
	jr z, UnknownRJump_0x3CBC
	ld a, 2

UnknownRJump_0x3CBC:
	ldh_n_a $DF
	ret

UnknownCall_0x3CC0:
	ldh_a_n $E7
	bit 3, a
	ret z
	ld hl, $FFC2
	ld a, [sHVelocityIndex]
	cp $80
	jr c, UnknownRJump_0x3CD7
	ld a, [$A235]
	add b
	ld [$A235], a

UnknownRJump_0x3CD7:
	ld a, [hl]
	add b
	ld [hli], a
	ld a, [hl]
	adc 0
	ld [hl], a
	ret

UnknownCall_0x3CDF:
	ldh_a_n $E7
	bit 3, a
	ret z
	ld a, [$A238]
	add b
	ld [$A238], a
	ld hl, $FFC0
	jr UnknownRJump_0x3CD7

UnknownCall_0x3CF1:
	ldh_a_n $E7
	bit 3, a
	ret z
	ld hl, $FFC2
	ld a, [sHVelocityIndex]
	cp $81
	jr nc, UnknownRJump_0x3D08
	ld a, [$A236]
	add b
	ld [$A236], a

UnknownRJump_0x3D08:
	ld a, [hl]
	sub b
	ld [hli], a
	ld a, [hl]
	sbc 0
	ld [hl], a
	ret

UnknownCall_0x3D10:
	ldh_a_n $E7
	bit 3, a
	ret z
	ld a, [$A237]
	add b
	ld [$A237], a
	ld hl, $FFC0
	jr UnknownRJump_0x3D08

UnknownCall_0x3D22:
	ld hl, $FFD1

UnknownRJump_0x3D25:
	ld a, [hl]
	sub b
	ld [hld], a
	ld a, [hl]
	sbc 0
	ld [hl], a
	ret

UnknownCall_0x3D2D:
	ld hl, $FFD4
	jr UnknownRJump_0x3D25

UnknownCall_0x3D32:
	ld hl, $FFD1

UnknownRJump_0x3D35:
	ld a, [hl]
	add b
	ld [hld], a
	ld a, [hl]
	adc 0
	ld [hl], a
	ret

UnknownCall_0x3D3D:
	ld hl, $FFD4
	jr UnknownRJump_0x3D35

UnknownData_0x3D42:
INCBIN "baserom.gb", $3D42, $3E00 - $3D42


UnknownCall_0x3E00:
	ld [$A24E], a
	ld [$3000], a
	jp [hl]

UnknownJump_0x3E07:
	ld a, 15
	ld [$A24E], a
	ld [$3000], a
	ret

UnknownCall_0x3E10:
	di
	ld [$A24E], a
	ld [$3000], a
	ld a, [hl]
	ld [bc], a
	ld a, 15
	ld [$A24E], a
	ld [$3000], a
	ret

UnknownCall_0x3E22:
	di
	ld [$A24E], a
	ld [$3000], a
	ld a, [hli]
	ld [bc], a
	ld a, 15
	ld [$A24E], a
	ld [$3000], a
	ret

UnknownCall_0x3E34:
	di
	ld [$A24E], a
	ld [$3000], a
	ld a, [hl]
	ld [de], a
	ld a, 15
	ld [$A24E], a
	ld [$3000], a
	ret

UnknownCall_0x3E46:
	ld hl, $A100

UnknownRJump_0x3E49:
	xor a
	ld [hli], a
	ld a, l
	cp $A0
	jr c, UnknownRJump_0x3E49
	ret

UnknownCall_0x3E51:
	ld a, 16
	ld [$A24E], a
	ld [$3000], a
	ld a, [hli]
	ld [bc], a
	inc bc
	ld a, [hli]
	ld [bc], a
	inc bc
	ld a, [hli]
	ld [bc], a
	inc bc
	ld a, [hli]
	ld [bc], a
	inc bc
	ld a, [hli]
	ld [bc], a
	inc bc
	ld a, [hli]
	ld [bc], a
	ld a, 15
	ld [$A24E], a
	ld [$3000], a
	ret

UnknownJump_0x3E73:
	ld a, 1
	ld [$A785], a
	jp UnknownJump_0x3EAFF

UnknownCall_0x3E7B:
	di
	push bc
	ld [$A24E], a
	ld [$3000], a
	ld b, [hl]
	ld a, 15
	ld [$A24E], a
	ld [$3000], a
	ld a, b
	pop bc
	ret

UnknownCall_0x3E8F:
	di
	push de
	ld [$A24E], a
	ld [$3000], a
	ld a, [bc]
	ld d, a
	ld a, 15
	ld [$A24E], a
	ld [$3000], a
	ld a, d
	pop de
	ret

UnknownCall_0x3EA4:
	ld a, 16
	ld [$A24E], a
	ld [$3000], a
	ld de, $88E0
	ld c, 32

UnknownRJump_0x3EB1:
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, UnknownRJump_0x3EB1
	ld de, $89E0
	ld c, 32

UnknownRJump_0x3EBC:
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, UnknownRJump_0x3EBC
	ld a, 15
	ld [$A24E], a
	ld [$3000], a
	ret

UnknownCall_0x3ECB:
	ld a, 14
	ld [$A24E], a
	ld [$3000], a
	ld de, $8820
	ld c, 32

UnknownRJump_0x3ED8:
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, UnknownRJump_0x3ED8
	ld de, $8920
	ld c, 32

UnknownRJump_0x3EE3:
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, UnknownRJump_0x3EE3
	ld a, 15
	ld [$A24E], a
	ld [$3000], a
	ret

UnknownCall_0x3EF2:
	ld a, 14
	ld [$A24E], a
	ld [$3000], a
	ld de, $9000
	ld c, 32

UnknownRJump_0x3EFF:
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, UnknownRJump_0x3EFF
	ld a, 15
	ld [$A24E], a
	ld [$3000], a
	ret

UnknownCall_0x3F0E:
	ld a, 25
	ld [$A24E], a
	ld [$3000], a
	ld b, 16

UnknownRJump_0x3F18:
	ld a, [hli]
	push hl
	ld hl, $FF41

UnknownRJump_0x3F1D:
	bit 1, [hl]
	jr nz, UnknownRJump_0x3F1D
	pop hl
	ld [de], a
	inc de
	dec b
	jr nz, UnknownRJump_0x3F18
	ld a, 24
	ld [$A24E], a
	ld [$3000], a
	ret

UnknownCall_0x3F30:
	ld a, 1 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x5297
	ld a, 15 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_0x3F44:
	ld a, 1 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x5297
	ld a, 24 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_0x3F58:
	ld a, 6 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ld bc, $0800
	ld hl, $4000
	ld de, $8000
	call CopyMem
	ld a, 15 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_0x3F75:
	push af
	ld a, 24 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ld hl, $62E6
	call UnknownCall_0x6109B
	ld a, 15 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	pop af
	ret

UnknownCall_0x3F8E:
	push af
	ld a, 24 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0x61147
	ld a, 15 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	pop af
	ret

UnknownCall_0x3FA4:
	ld a, 14 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a

UnknownRJump_0x3FAC:
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, UnknownRJump_0x3FAC
	ld a, 15 ;prepare bank switch
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownData_0x3FBD:
INCBIN "baserom.gb", $3FBD, $4000 - $3FBD

