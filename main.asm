SECTION "bank00", ROM0[0]


UnknownJump_0000:
UnknownCall_0000:
UnknownData_0000:
INCBIN "baserom.gb", $0000, $000F - $0000


UnknownJump_000F:
UnknownData_000F:
INCBIN "baserom.gb", $000F, $0028 - $000F

	add a
	pop hl
	ld e, a
	ld d, 0

UnknownCall_002D:
	add de
	ld e, [hl]
	inc hl

UnknownCall_0030:
	ld d, [hl]
	push de
	pop hl
	jp [hl]

UnknownData_0034:
INCBIN "baserom.gb", $0034, $0040 - $0034

	jp UnknownJump_0154

UnknownJump_0043:
UnknownData_0043:
INCBIN "baserom.gb", $0043, $005F - $0043


UnknownJump_005F:
UnknownData_005F:
INCBIN "baserom.gb", $005F, $007C - $005F


UnknownJump_007C:
UnknownData_007C:
INCBIN "baserom.gb", $007C, $0100 - $007C

	nop
	jp UnknownJump_0150

SECTION "Home", ROM0[$150]


UnknownJump_0150:
	jp UnknownJump_01E5

UnknownData_0153:
INCBIN "baserom.gb", $0153, $0154 - $0153


UnknownJump_0154:
	di
	push af
	push bc
	push de
	push hl
	ld a, [$A2B0]
	ld [$FF00+$42], a
	ld a, [$A2B1]
	ld [$FF00+$43], a
	ld a, [$A27E]
	ld [$FF00+$47], a
	ld a, [$A27F]
	ld [$FF00+$48], a
	ld a, [$A280]
	ld [$FF00+$49], a
	ld a, [$A266]
	sub 1
	ld [$A266], a
	ld a, [$A267]
	sbc 0
	ld [$A267], a
	jr nc, UnknownRJump_018B
	xor a
	ld [$A266], a
	ld [$A267], a

UnknownRJump_018B:
	ld a, [$A2C9]
	and a
	jp nz, UnknownJump_2A4D
	ld a, [$FF00+$9B]
	cp 12
	jp z, UnknownJump_2C18
	ld a, [$A248]
	and a
	jp nz, UnknownJump_26D7
	ld a, [$FF00+$9B]
	cp 19
	jp z, UnknownJump_2CA3
	ld a, [$A28E]
	and a
	jp nz, UnknownJump_26C3
	ld a, [$AA01]
	and a
	jr z, UnknownRJump_01BF
	ld a, [$A258]
	ld [$2100], a
	call UnknownCall_0AFB
	jr UnknownRJump_01C5

UnknownRJump_01BF:
	call UnknownCall_3873
	call UnknownCall_076B

UnknownJump_01C5:
UnknownRJump_01C5:
	call $FFA0
	ld a, [$FF00+$9B]
	cp 4
	call z, UnknownCall_2089
	ld a, [$FF00+$9B]
	cp 24
	call z, UnknownCall_2089
	ld a, [$A24E]
	ld [$2100], a
	ld a, 1
	ld [$FF00+$82], a
	pop hl
	pop de
	pop bc
	pop af
	reti

UnknownJump_01E5:
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

UnknownRJump_01FB:
	ld a, [$FF00+$44]
	cp 148
	jr nz, UnknownRJump_01FB
	ld a, 3
	ld [$FF00+$40], a
	ld sp, $A8FF
	ld a, 10
	ld [$0000], a
	xor a
	ld hl, $DFFF
	ld c, 63
	ld b, 0

UnknownRJump_0215:
	ld [hld], a
	dec b
	jr nz, UnknownRJump_0215
	dec c
	jr nz, UnknownRJump_0215
	ld hl, $FEFF
	ld b, 0

UnknownRJump_0221:
	ld [hld], a
	dec b
	jr nz, UnknownRJump_0221
	ld hl, $FFFE
	ld b, 128

UnknownRJump_022A:
	ld [hld], a
	dec b
	jr nz, UnknownRJump_022A
	ld a, 147
	ld [$A27E], a
	ld a, 208
	ld [$A27F], a
	ld a, 56
	ld [$A280], a
	ld c, 160
	ld b, 10
	ld hl, $2058

UnknownRJump_0244:
	ld a, [hli]
	ld [$FF00+c], a
	inc c
	dec b
	jr nz, UnknownRJump_0244
	call UnknownCall_0327
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
	call UnknownCall_207D

UnknownJump_0264:
	xor a
	ld [$AA01], a
	ld a, [$A20E]
	and a
	jr nz, UnknownRJump_0279
	ld a, [$A2DC]
	cp 3
	call nz, UnknownCall_1FD2
	call UnknownCall_38B9

UnknownRJump_0279:
	call UnknownCall_02AD
	ld a, [$FF00+$9B]
	cp 4
	jr z, UnknownRJump_028D
	cp 24
	jr z, UnknownRJump_028D
	cp 19
	jr z, UnknownRJump_028D
	call UnknownCall_2089

UnknownRJump_028D:
	call UnknownCall_20A4
	ld a, [$FF00+$80]
	and $0F
	cp 15
	jp z, UnknownJump_029F
	call UnknownCall_02FF
	jp UnknownJump_0264

UnknownJump_029F:
UnknownData_029F:
INCBIN "baserom.gb", $029F, $02AD - $029F


UnknownCall_02AD:
	ld a, [$FF00+$9B]
	rst $28

UnknownData_02B0:
INCBIN "baserom.gb", $02B0, $02FF - $02B0


UnknownCall_02FF:
	halt

UnknownRJump_0300:
	ld a, [$FF00+$82]
	and a
	jr z, UnknownRJump_0300
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

UnknownCall_0318:
	xor a
	ld [$FF00+$8D], a
	ret

UnknownCall_031C:
	xor a
	ld hl, $C000
	ld b, 160

UnknownRJump_0322:
	ld [hli], a
	dec b
	jr nz, UnknownRJump_0322
	ret

UnknownCall_0327:
	ld hl, $9FFF
	ld bc, $0800

UnknownRJump_032D:
	ld a, 255
	ld [hld], a
	dec bc
	ld a, b
	or c
	jr nz, UnknownRJump_032D
	ret

UnknownRJump_0336:
UnknownCall_0336:
	ld a, [hli]
	ld [de], a

UnknownCall_0338:
	inc de
	dec bc
	ld a, b
	or c
	jr nz, UnknownRJump_0336
	ret

UnknownData_033F:
INCBIN "baserom.gb", $033F, $0348 - $033F


UnknownCall_0348:
	ld a, [$FF00+$FF]
	ld [$FF00+$99], a
	res 0, a
	ld [$FF00+$FF], a

UnknownRJump_0350:
	ld a, [$FF00+$44]
	cp 145
	jr nz, UnknownRJump_0350
	ld a, [$FF00+$40]

UnknownCall_0358:
	and $7F
	ld [$FF00+$40], a
	ld a, [$FF00+$99]
	ld [$FF00+$FF], a
	ret

UnknownCall_0361:
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

UnknownRJump_0386:
	ld a, [de]
	inc de
	bit 7, a
	jr nz, UnknownRJump_0393
	ld [hli], a
	ld a, l
	or a
	jr z, UnknownRJump_03A9
	jr UnknownRJump_0386

UnknownRJump_0393:
	and $7F
	ld [hli], a
	ld c, a
	ld a, l
	or a
	jr z, UnknownRJump_03A9
	ld a, [de]
	inc de
	ld b, a

UnknownRJump_039E:
	ld [hl], c
	inc hl
	ld a, l
	or a
	jr z, UnknownRJump_03A9
	dec b
	jr nz, UnknownRJump_039E
	jr UnknownRJump_0386

UnknownRJump_03A9:
	ld a, h
	cp 224
	jr nz, UnknownRJump_0386
	ret
	ld a, [$A266]
	and $C0
	swap a
	ld e, a
	ld d, 0
	ld hl, $03E1
	add de
	ld a, [hli]
	ld [$A27E], a
	ld a, [hli]
	ld [$A27F], a
	ld a, [hli]
	ld [$A280], a
	ld a, [$A267]
	ld b, a
	ld a, [$A266]

UnknownCall_03D0:
	or b
	ret nz
	ld a, 0
	ld [$A267], a
	ld a, 255
	ld [$A266], a
	ld a, 18
	ld [$FF00+$9B], a
	ret

UnknownData_03E1:
INCBIN "baserom.gb", $03E1, $03EC - $03E1


UnknownCall_03EC:
UnknownData_03EC:
INCBIN "baserom.gb", $03EC, $03F1 - $03EC

	call UnknownCall_2D41
	call UnknownCall_0F2A
	ld a, 8
	ld [$A24E], a
	ld [$2100], a
	ld a, [$A80B]
	ld l, a

UnknownCall_0403:
	ld a, [$A80C]
	ld h, a
	ld de, $A600

UnknownRJump_040A:
	ld a, [hli]
	ld [de], a
	inc de
	ld a, d
	cp 168
	jr nz, UnknownRJump_040A
	ld a, [$A80D]
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

UnknownRJump_043F:
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, UnknownRJump_043F
	ld a, [$A80D]
	ld [$A24E], a
	ld [$2100], a
	ld hl, $4002

UnknownJump_0451:
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

UnknownRJump_0472:
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, UnknownRJump_0472
	ld a, [$A80E]
	ld [$A292], a
	ld a, [$A80D]
	ld [$A258], a

UnknownCall_0484:
	ld a, [$A812]
	and $F0
	ld [$A28B], a
	xor a
	ld [$A20E], a
	ld [$A2A7], a
	ld [$A248], a
	ld [$A26E], a
	ld hl, $AA80

UnknownRJump_049C:
	xor a
	ld [hl], a
	ld a, l
	add 16
	ld l, a
	jr nz, UnknownRJump_049C
	ld a, [$A813]
	ld [$A255], a
	xor a
	ld [$A254], a
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

UnknownCall_04C8:
	jr z, UnknownRJump_04DD

UnknownData_04CA:
INCBIN "baserom.gb", $04CA, $04DD - $04CA


UnknownRJump_04DD:
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
	call UnknownCall_0348
	call UnknownCall_0669
	ld a, [$A258]
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0361
	ld a, [$A80F]
	ld [$A27E], a
	ld [$FF00+$47], a
	ld a, [$A810]
	ld [$A27F], a
	ld [$FF00+$48], a
	ld a, [$A811]
	ld [$A280], a
	ld [$FF00+$49], a
	ld a, [$A804]
	ld [$FF00+$C8], a
	ld a, [$A805]
	ld [$FF00+$C9], a
	ld a, [$A806]

UnknownJump_0528:
	ld [$FF00+$CA], a
	ld a, [$A807]
	ld [$FF00+$CB], a

UnknownRJump_052F:
	ld a, 0
	ld [$FF00+$AF], a
	ld a, 170
	ld [$FF00+$B0], a
	call UnknownCall_08AD
	call UnknownCall_0AFB
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
	jr nz, UnknownRJump_052F

UnknownCall_0554:
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
	call UnknownCall_07DB
	ld a, 3
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_2BBB
	ld a, 227
	ld [$FF00+$40], a
	xor a
	ld [$A211], a
	ld a, [$A2CE]
	and a
	jr nz, UnknownRJump_0598
	ld a, [$A80E]
	ld [$A468], a

UnknownRJump_0598:
	ld hl, $1F51
	ld a, [$A269]
	ld e, a
	ld d, 0
	add de
	ld a, [hl]
	ld [$A2D9], a
	xor a
	ld [$A266], a

UnknownCall_05AA:
	ld [$A267], a
	ld [$A217], a
	ld [$A880], a
	ld [$A890], a

UnknownJump_05B6:
	ld [$A2E0], a
	ld [$A2E3], a
	ld a, [$FF00+$9B]
	inc a
	ld [$FF00+$9B], a
	ld a, [$A2D5]
	and a
	ret z

UnknownData_05C6:
INCBIN "baserom.gb", $05C6, $05D5 - $05C6

	ld a, [$A266]
	ld b, a
	ld a, [$A267]

UnknownCall_05DC:
	or b
	jr z, UnknownRJump_05E4
	xor a
	ld [$FF00+$81], a
	ld [$FF00+$80], a

UnknownRJump_05E4:
	call UnknownCall_2C61
	ld a, [$A224]
	cp 255
	jr z, UnknownRJump_0640
	ld a, [$FF00+$C0]
	ld [$A229], a
	ld a, [$FF00+$C1]
	ld [$A22A], a
	ld a, [$FF00+$C2]
	ld [$A227], a
	ld a, [$FF00+$C3]
	ld [$A228], a
	ld a, [$A20E]
	and a
	jr nz, UnknownRJump_060F
	xor a
	ld [$A25C], a
	call UnknownCall_0F71

UnknownRJump_060F:
	call UnknownCall_0879
	call UnknownCall_0B2A
	call UnknownCall_2062
	call UnknownCall_2D0A
	call UnknownCall_2C82
	ld a, [$A221]
	cp 16
	call c, UnknownCall_2D7D
	ld a, [$A287]
	bit 4, a
	call nz, UnknownCall_3753
	call UnknownCall_2A58
	ld a, [$FF00+$8D]
	ld [$A264], a
	call UnknownCall_0652
	call UnknownCall_2CFF

UnknownCall_063C:
	call UnknownCall_273E
	ret

UnknownRJump_0640:
	call UnknownCall_315C
	ld a, [$FF00+$8D]
	ld [$A264], a
	call UnknownCall_0652
	call UnknownCall_2CFF
	call UnknownCall_273E
	ret

UnknownCall_0652:
	ld a, [$A28B]
	and $F0
	jr nz, UnknownRJump_0665
	ld a, 2
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0000
	ret

UnknownRJump_0665:
	call UnknownCall_3C9F
	ret

UnknownCall_0669:
	ld a, [$A269]
	ld hl, $360A
	ld e, a
	ld d, 0
	add de
	ld a, [hl]
	ld [$A2D2], a
	and $0F
	and a

UnknownJump_067A:
	jr nz, UnknownRJump_0692
	ld a, 6
	ld [$A24E], a
	ld [$2100], a
	ld bc, $0800
	ld hl, $4000
	ld de, $8000
	call UnknownCall_0336
	jr UnknownRJump_06C0

UnknownRJump_0692:
	cp 1
	jr nz, UnknownRJump_06AC
	ld a, 6
	ld [$A24E], a
	ld [$2100], a
	ld bc, $0800
	ld hl, $4800
	ld de, $8000
	call UnknownCall_0336
	jr UnknownRJump_06C0

UnknownRJump_06AC:
	ld a, 6
	ld [$A24E], a
	ld [$2100], a
	ld bc, $0800
	ld hl, $5000
	ld de, $8000
	call UnknownCall_0336

UnknownRJump_06C0:
	ld a, 7
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
	call UnknownCall_0336
	ld a, 27
	ld [$A24E], a
	ld [$2100], a
	ld a, [$A2D2]
	and $F0
	swap a
	ld b, a
	sla a
	add b
	ld d, a
	ld b, 0
	ld hl, $7000
	add de
	ld bc, $0300
	ld de, $8800
	call UnknownCall_0336
	ld a, [$A269]
	ld hl, $362A
	sla a
	sla a
	ld e, a
	ld d, 0
	add de
	ld a, [hli]
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
	call UnknownCall_0336
	ld a, [$A269]
	ld hl, $36AA
	sla a
	sla a
	ld e, a
	ld d, 0
	add de
	ld a, [hli]
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
	call UnknownCall_0336
	ld hl, $35EA
	ld a, [$A269]
	ld e, a
	ld d, 0
	add de
	ld a, [hl]
	inc a
	ld [$A299], a
	ret

UnknownData_0763:
INCBIN "baserom.gb", $0763, $076B - $0763


UnknownCall_076B:
	ld a, [$FF00+$9B]
	cp 4
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
	ld a, [$A263]
	and $0F
	add 128
	ld [$9C07], a
	ld a, [$A262]
	and $F0
	swap a
	add 128
	ld [$9C08], a
	ld a, [$A262]
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
	ld a, [$A255]
	add 128
	ld [$9C11], a
	ld a, [$A254]
	and $F0
	swap a
	add 128
	ld [$9C12], a
	ld a, [$A254]
	and $0F
	add 128
	ld [$9C13], a
	ret

UnknownCall_07DB:
	ld hl, $07EA
	ld de, $9C00
	ld b, 20

UnknownRJump_07E3:
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, UnknownRJump_07E3
	ret

UnknownData_07EA:
INCBIN "baserom.gb", $07EA, $0879 - $07EA


UnknownCall_0879:
	ld a, [$A258]
	ld [$A24E], a
	ld [$2100], a
	ld a, 0

UnknownCall_0884:
	ld [$FF00+$AF], a
	ld a, 170
	ld [$FF00+$B0], a
	xor a
	ld [$A24C], a
	ld a, [$FF00+$97]
	and $03
	jr z, UnknownRJump_08A2
	cp 1
	jr z, UnknownRJump_08D4
	cp 2
	jr z, UnknownRJump_0905
	cp 3
	jp z, UnknownJump_0937

UnknownData_08A1:
INCBIN "baserom.gb", $08A1, $08A2 - $08A1


UnknownRJump_08A2:
	ld a, [$A223]
	bit 6, a
	ret z
	ld a, 255
	ld [$A24C], a

UnknownCall_08AD:
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
	jp UnknownJump_0969

UnknownRJump_08D4:
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
	jr UnknownRJump_0969

UnknownRJump_0905:
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
	jp UnknownJump_0A35

UnknownJump_0937:
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
	jp UnknownJump_0A35

UnknownJump_0969:
UnknownRJump_0969:
UnknownCall_0969:
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

UnknownRJump_09BE:
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
	jr nz, UnknownRJump_09BE
	ld a, [$FF00+$AF]
	ld l, a
	ld a, [$FF00+$B0]
	ld h, a
	ld a, 0
	ld [hli], a
	ld [hl], a
	ret

UnknownJump_0A35:
UnknownCall_0A35:
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

UnknownRJump_0A8A:
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
	jr nz, UnknownRJump_0A8A
	ld a, [$FF00+$AF]
	ld l, a
	ld a, [$FF00+$B0]
	ld h, a
	ld a, 0
	ld [hli], a
	ld [hl], a
	ret

UnknownCall_0AFB:
	ld de, $A9FF

UnknownRJump_0AFE:
	inc de
	ld a, [de]
	ld l, a
	inc de
	ld a, [de]
	ld h, a
	and a
	jr z, UnknownRJump_0B25
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
	jr UnknownRJump_0AFE

UnknownRJump_0B25:
	xor a
	ld [$AA01], a
	ret

UnknownCall_0B2A:
	ld a, [$A28B]
	and $F0
	ret nz
	ld a, [$A2E0]
	and a
	jr z, UnknownRJump_0B39
	and $F0
	ret z

UnknownRJump_0B39:
	ld a, [$A20E]
	and a
	jp nz, UnknownJump_0DED
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
	jr z, UnknownRJump_0B5E
	call UnknownCall_0DAF
	jp UnknownJump_0C7D

UnknownRJump_0B5E:
	ld a, [$FF00+$98]
	bit 0, a
	jr z, UnknownRJump_0B90
	ld a, [$FF00+$CA]
	cp 176
	jp nz, UnknownJump_0B7D
	ld a, [$A23C]
	cp 161
	jr c, UnknownRJump_0BE5
	ld a, 1
	ld [$A20E], a
	call UnknownCall_0F0B
	jp UnknownJump_0BE5

UnknownJump_0B7D:
	jr c, UnknownRJump_0B90
	ld a, [$FF00+$CA]
	sub 1
	ld [$FF00+$CA], a
	ld a, [$FF00+$CB]
	sbc 0
	and $0F
	ld [$FF00+$CB], a
	jp UnknownJump_0BE5

UnknownRJump_0B90:
	ld a, [$A235]
	and a
	jr z, UnknownRJump_0BE5
	ld a, [$A232]
	and a
	jr z, UnknownRJump_0BE5
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
	cp 64
	jr c, UnknownRJump_0BD3
	ld a, [$FF00+$CA]
	add 1
	ld [$FF00+$CA], a
	ld a, [$FF00+$CB]
	adc 0
	and $0F
	ld [$FF00+$CB], a
	jr UnknownRJump_0BE5

UnknownRJump_0BD3:
	cp 63
	jr nc, UnknownRJump_0BE5
	ld a, [$FF00+$CA]
	sub 1
	ld [$FF00+$CA], a
	ld a, [$FF00+$CB]
	sbc 0
	and $0F
	ld [$FF00+$CB], a

UnknownJump_0BE5:
UnknownRJump_0BE5:
	ld a, [$FF00+$98]
	bit 4, a
	jr z, UnknownRJump_0C21
	ld a, [$FF00+$CA]
	cp 80
	jr nz, UnknownRJump_0C0F
	ld a, [$A23C]
	cp 15
	jp nc, UnknownJump_0C76
	ld a, 2
	ld [$A20E], a
	ld a, 0
	ld [$FF00+$C2], a
	ld a, [$FF00+$C3]
	inc a
	and $0F
	ld [$FF00+$C3], a
	call UnknownCall_0F0B
	jp UnknownJump_0C76

UnknownRJump_0C0F:
	jr nc, UnknownRJump_0C21
	ld a, [$FF00+$CA]
	add 1
	ld [$FF00+$CA], a
	ld a, [$FF00+$CB]
	adc 0
	and $0F
	ld [$FF00+$CB], a
	jr UnknownRJump_0C76

UnknownRJump_0C21:
	ld a, [$A236]
	and a
	jr z, UnknownRJump_0C76
	ld a, [$A233]
	and a
	jr z, UnknownRJump_0C76
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
	cp 112
	jr nc, UnknownRJump_0C64
	ld a, [$FF00+$CA]
	sub 1
	ld [$FF00+$CA], a
	ld a, [$FF00+$CB]
	sbc 0
	and $0F
	ld [$FF00+$CB], a
	jr UnknownRJump_0C76

UnknownRJump_0C64:
	cp 113
	jr c, UnknownRJump_0C76
	ld a, [$FF00+$CA]
	add 1
	ld [$FF00+$CA], a
	ld a, [$FF00+$CB]
	adc 0
	and $0F
	ld [$FF00+$CB], a

UnknownJump_0C76:
UnknownRJump_0C76:
	xor a
	ld [$A235], a
	ld [$A236], a

UnknownJump_0C7D:
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
	jp z, UnknownJump_0D97
	bit 7, a
	jp nz, UnknownJump_0D05
	ld [$A238], a
	ld a, [$A223]
	set 7, a
	ld [$A223], a
	ld a, [$FF00+$98]
	bit 6, a
	jr z, UnknownRJump_0CEC
	ld a, [$FF00+$C8]
	cp 192
	jr nz, UnknownRJump_0CC0
	ld a, [$A23B]
	cp 144
	jp c, UnknownJump_0D97
	ld a, 8
	ld [$A20E], a
	call UnknownCall_0F0B
	jp UnknownJump_0D05

UnknownRJump_0CC0:
	jr c, UnknownRJump_0CD3
	ld a, [$FF00+$C8]
	sub 1
	ld [$FF00+$C8], a
	ld a, [$FF00+$C9]
	sbc 0
	and $0F
	ld [$FF00+$C9], a
	jp UnknownJump_0D97

UnknownRJump_0CD3:
	ld a, [$FF00+$99]
	cp 88
	jp c, UnknownJump_0D97
	ld a, [$A238]
	ld b, a
	ld a, [$FF00+$C8]
	add b
	ld [$FF00+$C8], a
	ld a, [$FF00+$C9]
	adc 0
	ld [$FF00+$C9], a
	jp UnknownJump_0D97

UnknownRJump_0CEC:
	ld a, [$FF00+$99]
	cp 80
	jp c, UnknownJump_0D97
	ld a, [$A238]
	ld b, a
	ld a, [$FF00+$C8]
	add b
	ld [$FF00+$C8], a
	ld a, [$FF00+$C9]
	adc 0
	ld [$FF00+$C9], a
	jp UnknownJump_0D97

UnknownJump_0D05:
	cpl
	inc a
	ld [$A237], a
	ld a, [$A223]
	set 6, a
	ld [$A223], a
	ld a, [$FF00+$98]
	bit 4, a
	jr z, UnknownRJump_0D74
	ld a, [$FF00+$C8]
	cp 72
	jr nz, UnknownRJump_0D3D
	ld a, [$A23B]
	cp 27
	jr nc, UnknownRJump_0D97
	ld a, 4
	ld [$A20E], a
	ld a, 0
	ld [$FF00+$C0], a
	ld a, [$FF00+$C9]
	ld [$FF00+$C1], a
	ld a, [$A28B]
	and $F0
	call z, UnknownCall_0F0B
	jp UnknownJump_0D97

UnknownRJump_0D3D:
	jr nc, UnknownRJump_0D4F
	ld a, [$FF00+$C8]
	add 1
	ld [$FF00+$C8], a
	ld a, [$FF00+$C9]
	adc 0
	and $0F
	ld [$FF00+$C9], a
	jr UnknownRJump_0D97

UnknownRJump_0D4F:
	ld a, [$A2D9]
	and a
	jr z, UnknownRJump_0D5D
	ld a, [$FF00+$99]
	cp 64
	jr nc, UnknownRJump_0D97
	jr UnknownRJump_0D63

UnknownRJump_0D5D:
	ld a, [$FF00+$99]
	cp 56
	jr nc, UnknownRJump_0D97

UnknownRJump_0D63:
	ld a, [$A237]
	ld b, a
	ld a, [$FF00+$C8]
	sub b
	ld [$FF00+$C8], a
	ld a, [$FF00+$C9]
	sbc 0
	ld [$FF00+$C9], a
	jr UnknownRJump_0D97

UnknownRJump_0D74:
	ld a, [$A2D9]
	and a
	jr z, UnknownRJump_0D82
	ld a, [$FF00+$99]
	cp 64
	jr nc, UnknownRJump_0D97
	jr UnknownRJump_0D88

UnknownRJump_0D82:
	ld a, [$FF00+$99]
	cp 40
	jr nc, UnknownRJump_0D97

UnknownRJump_0D88:
	ld a, [$A237]
	ld b, a
	ld a, [$FF00+$C8]
	sub b
	ld [$FF00+$C8], a
	ld a, [$FF00+$C9]
	sbc 0
	ld [$FF00+$C9], a

UnknownJump_0D97:
UnknownRJump_0D97:
	xor a
	ld [$A238], a
	ld [$A237], a
	ld a, [$FF00+$C0]
	ld [$A20C], a
	ret

UnknownData_0DA4:
INCBIN "baserom.gb", $0DA4, $0DA9 - $0DA4


UnknownJump_0DA9:
UnknownData_0DA9:
INCBIN "baserom.gb", $0DA9, $0DAF - $0DA9


UnknownCall_0DAF:
	ld a, [$FF00+$98]
	bit 0, a
	jr z, UnknownRJump_0DCA
	ld a, [$FF00+$CA]
	cp 176
	jr c, UnknownRJump_0DCA
	ld a, [$A23C]
	cp 161
	ret c
	ld a, 1
	ld [$A20E], a
	call UnknownCall_0F0B
	ret

UnknownRJump_0DCA:
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

UnknownJump_0DED:
	ld a, [$A20E]
	bit 0, a
	jr z, UnknownRJump_0E20
	ld a, [$FF00+$CA]
	add 4
	ld [$FF00+$CA], a
	ld a, [$FF00+$CB]
	adc 0
	and $0F
	ld [$FF00+$CB], a
	ld b, 1
	call UnknownCall_14E3
	ld a, 16
	ld [$A223], a
	ld a, [$FF00+$C2]
	add 1
	ld [$FF00+$C2], a
	ld a, [$FF00+$C3]
	adc 0
	ld [$FF00+$C3], a
	ld a, [$FF00+$CA]
	cp 80
	ret nz
	jp UnknownJump_0EB0

UnknownRJump_0E20:
	bit 4, a
	jr z, UnknownRJump_0E4F
	ld a, [$FF00+$CA]
	sub 4
	ld [$FF00+$CA], a
	ld a, [$FF00+$CB]
	sbc 0
	and $0F
	ld [$FF00+$CB], a
	ld b, 1
	call UnknownCall_14E3
	ld a, 32
	ld [$A223], a
	ld a, [$FF00+$C2]
	sub 1
	ld [$FF00+$C2], a
	ld a, [$FF00+$C3]
	sbc 0
	ld [$FF00+$C3], a
	ld a, [$FF00+$CA]
	cp 176
	ret nz
	jr UnknownRJump_0EB0

UnknownRJump_0E4F:
	bit 4, a
	jr z, UnknownRJump_0E7E
	ld a, [$FF00+$C8]
	sub 4
	ld [$FF00+$C8], a
	ld a, [$FF00+$C9]
	sbc 0
	and $0F
	ld [$FF00+$C9], a
	ld b, 1
	call UnknownCall_14E3
	ld a, 64
	ld [$A223], a
	ld a, [$FF00+$C0]
	sub 1
	ld [$FF00+$C0], a
	ld a, [$FF00+$C1]
	sbc 0
	ld [$FF00+$C1], a
	ld a, [$FF00+$C8]
	cp 184
	ret nz
	jr UnknownRJump_0EB0

UnknownRJump_0E7E:
	bit 6, a
	ret z
	ld a, [$FF00+$C8]
	add 4
	ld [$FF00+$C8], a
	ld a, [$FF00+$C9]
	adc 0
	and $0F
	ld [$FF00+$C9], a
	ld b, 1
	call UnknownCall_14E3
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
	cp 72
	ret nz

UnknownJump_0EB0:
UnknownRJump_0EB0:
	xor a
	ld [$A20E], a
	ld a, [$A28B]
	and $0F
	jr z, UnknownRJump_0EE4
	ld a, 240
	ld [$A28B], a
	call UnknownCall_0348
	call UnknownCall_3C94
	ld a, 195
	ld [$FF00+$40], a
	ld a, 32
	ld [$A468], a
	ld [$A292], a
	ld a, [$A269]
	cp 24
	jr nz, UnknownRJump_0EE4
	ld a, [$A2DC]
	add 33
	ld [$A468], a
	ld [$A292], a

UnknownRJump_0EE4:
	ld a, [$A2E0]
	and $F0
	jr z, UnknownRJump_0EF3
	ld a, [$A2E0]
	and $0F
	ld [$A2E0], a

UnknownRJump_0EF3:
	ld a, 5
	ld [$A460], a
	ld a, [$A80F]
	ld [$A27E], a
	ld a, [$A810]
	ld [$A27F], a
	ld a, [$A811]
	ld [$A280], a
	ret

UnknownCall_0F0B:
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

UnknownCall_0F2A:
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
	ld [$A200], a
	ld a, 24
	ld [$A201], a
	ld a, 1
	ld [$A22B], a
	xor a
	ld [$A271], a
	ld [$A279], a
	ld [$A23D], a
	ld [$A24F], a
	ld [$A224], a
	ld a, 64
	ld [$A266], a
	ld [$A23B], a
	ld [$A23C], a
	ld a, 1
	ld [$A267], a
	ret

UnknownCall_0F71:
	call UnknownCall_307D
	call UnknownCall_13FE
	ld a, [$A221]
	cp 16
	jr nc, UnknownRJump_0FBB
	call UnknownCall_0FF2
	call UnknownCall_1BFF
	call UnknownCall_129F
	call UnknownCall_1413
	call UnknownCall_14A6
	call UnknownCall_126F
	call UnknownCall_160A
	call UnknownCall_1090
	call UnknownCall_14FA
	call UnknownCall_1701
	call UnknownCall_16CC
	call UnknownCall_181C
	call UnknownCall_0FBF
	call UnknownCall_14BF
	call UnknownCall_1189
	call UnknownCall_319F
	call UnknownCall_3451
	call UnknownCall_32C1
	call UnknownCall_331C
	call UnknownCall_324F
	ret

UnknownRJump_0FBB:
	call UnknownCall_10EC
	ret

UnknownCall_0FBF:
	ld a, [$FF00+$CA]
	ld b, a
	ld a, [$FF00+$C2]
	sub b
	add 96
	ld b, a
	cp 16
	jr c, UnknownRJump_0FD1
	cp 160
	jr nc, UnknownRJump_0FE3
	ret

UnknownRJump_0FD1:
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

UnknownRJump_0FE3:
	sub 160
	ld b, a
	ld a, [$FF00+$C2]
	sub b
	ld [$FF00+$C2], a
	ld a, [$FF00+$C3]
	sbc 0
	ld [$FF00+$C3], a
	ret

UnknownCall_0FF2:
	ld a, [$A24F]
	and a
	ret nz
	ld a, [$A287]
	and a
	ret z
	bit 0, a
	jr nz, UnknownRJump_106F
	bit 4, a
	jr nz, UnknownRJump_1055
	bit 6, a
	jr nz, UnknownRJump_1029
	ld a, [$A214]
	and a
	ret nz
	ld a, [$FF00+$80]
	bit 0, a
	ret z
	ld a, [$FF00+$81]
	bit 0, a
	jr z, UnknownRJump_101D
	ld a, 18
	ld [$A460], a

UnknownRJump_101D:
	ld a, [$A201]
	cp 74
	ret nc
	add 2
	ld [$A201], a
	ret

UnknownRJump_1029:
	ld a, [$A214]
	and a
	jr nz, UnknownRJump_104A
	ld a, [$FF00+$80]
	bit 0, a
	jr z, UnknownRJump_1050
	ld a, [$A2B2]
	and a
	ret z
	dec a
	ld [$A2B2], a
	ld a, [$A201]
	cp 74
	ret nc
	add 2
	ld [$A201], a
	ret

UnknownRJump_104A:
	ld a, 50
	ld [$A2B2], a
	ret

UnknownRJump_1050:
	xor a
	ld [$A2B2], a
	ret

UnknownRJump_1055:
	ld a, [$FF00+$81]
	bit 0, a
	ret z
	ld a, 52
	ld [$A201], a
	ld a, [$A285]
	and a
	ret nz
	ld a, 8
	ld [$A285], a
	ld a, 3
	ld [$A460], a
	ret

UnknownRJump_106F:
	ld a, [$A214]
	and a
	ret nz
	ld a, [$FF00+$80]
	bit 0, a
	ret z
	ld a, [$FF00+$81]
	bit 0, a
	jr z, UnknownRJump_1084
	ld a, 18
	ld [$A460], a

UnknownRJump_1084:
	ld a, [$A201]
	cp 72
	ret nc
	add 4
	ld [$A201], a
	ret

UnknownCall_1090:
	ld a, [$A24F]
	and a
	ret nz
	ld a, [$A2B3]
	and a
	ret nz
	ld a, [$A216]
	cp 2
	jr nz, UnknownRJump_10EB
	ld a, [$A287]
	and a
	jr nz, UnknownRJump_10EB
	ld a, [$A201]
	cp 72
	jr nc, UnknownRJump_10EB
	ld a, [$FF00+$81]
	bit 0, a
	jr nz, UnknownRJump_10D7
	ld a, [$A284]
	and a
	jr z, UnknownRJump_10EB
	ld a, [$A214]
	and a
	jr nz, UnknownRJump_10EB
	ld a, [$FF00+$80]
	bit 0, a
	jr z, UnknownRJump_10EB
	ld a, [$A27C]
	inc a
	ld [$A27C], a
	cp 12
	jr c, UnknownRJump_10EB
	xor a
	ld [$A27C], a
	jr UnknownRJump_10DC

UnknownRJump_10D7:
	ld a, 255
	ld [$A284], a

UnknownRJump_10DC:
	ld a, 8
	ld [$A24D], a
	ld a, 24
	ld [$A201], a
	ld a, 6
	ld [$A470], a

UnknownRJump_10EB:
	ret

UnknownCall_10EC:
	ld a, [$A221]
	cp 16
	jr nz, UnknownRJump_1111
	ld a, [$FF00+$C0]
	add 2
	ld [$FF00+$C0], a
	ld a, [$FF00+$C1]
	adc 0
	ld [$FF00+$C1], a
	ld a, 1
	ld [$A237], a
	call UnknownCall_1DFE
	ret c
	call UnknownCall_1E36
	ret c
	xor a
	ld [$A221], a
	ret

UnknownRJump_1111:
	ld a, [$A221]
	cp 32
	jr nz, UnknownRJump_1136
	ld a, [$FF00+$C0]
	sub 2
	ld [$FF00+$C0], a
	ld a, [$FF00+$C1]
	sbc 0
	ld [$FF00+$C1], a
	ld a, 1
	ld [$A237], a
	call UnknownCall_1DFE
	ret c
	call UnknownCall_1E36
	ret c
	xor a
	ld [$A221], a
	ret

UnknownRJump_1136:
	ld a, [$A221]
	cp 48
	jr nz, UnknownRJump_1160
	ld a, [$FF00+$C2]
	add 2
	ld [$FF00+$C2], a
	ld a, [$FF00+$C3]
	adc 0

UnknownCall_1147:
	ld [$FF00+$C3], a
	ld a, 1
	ld [$A235], a
	ld b, 1
	call UnknownCall_14E3
	call UnknownCall_1E8D
	ret c
	call UnknownCall_1E7C
	ret c
	xor a
	ld [$A221], a
	ret

UnknownRJump_1160:
	ld a, [$A221]
	cp 64
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
	call UnknownCall_14E3
	call UnknownCall_1E8D
	ret c
	call UnknownCall_1E7C
	ret c
	xor a
	ld [$A221], a
	ret

UnknownCall_1189:
	ld a, [$A221]
	and a
	ret z
	cp 1
	jr nz, UnknownRJump_11C0
	ld a, [$FF00+$80]
	bit 7, a
	ret z
	ld a, [$FF00+$C2]
	bit 4, a
	ret z
	and $0F
	sub 5
	cp 7
	ret nc
	ld a, 16
	ld [$A221], a
	ld a, 5
	ld [$A460], a
	xor a
	ld [$A291], a
	ld [$A880], a
	ld [$A890], a
	ld a, [$A221]
	ld a, 128
	ld [$A200], a
	ret

UnknownRJump_11C0:
	cp 2
	jr nz, UnknownRJump_11FE
	ld a, [$FF00+$80]
	bit 6, a
	ret z
	ld a, [$FF00+$C2]
	bit 4, a
	ret z
	and $0F
	sub 5
	cp 7
	ret nc
	ld a, 32
	ld [$A221], a
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
	ld a, [$A221]
	ld a, 128
	ld [$A200], a
	ret

UnknownRJump_11FE:
	cp 3
	jr nz, UnknownRJump_1244
	ld a, [$A2C8]
	and a
	jr z, UnknownRJump_120E
	ld a, [$FF00+$CA]
	cp 176
	jr c, UnknownRJump_1244

UnknownRJump_120E:
	ld a, [$A28A]
	cp 1
	jr z, UnknownRJump_1225
	ld a, [$FF00+$80]
	bit 4, a
	jr z, UnknownRJump_1244
	ld a, [$A214]
	and a
	ret z
	ld a, [$A2E0]
	and a
	ret nz

UnknownRJump_1225:
	ld a, 48
	ld [$A221], a
	xor a
	ld [$A291], a
	ld [$A880], a
	ld [$A890], a
	ld a, 128
	ld [$A200], a
	ld a, [$A2DC]
	and a
	ret nz
	ld a, 5
	ld [$A460], a
	ret

UnknownRJump_1244:
	ld a, [$A28A]
	cp 255
	jr z, UnknownRJump_1255
	ld a, [$FF00+$80]
	bit 5, a
	ret z
	ld a, [$A214]
	and a
	ret z

UnknownRJump_1255:
	ld a, 64
	ld [$A221], a
	ld a, 5
	ld [$A460], a
	xor a
	ld [$A291], a
	ld [$A880], a
	ld [$A890], a
	ld a, 128
	ld [$A200], a
	ret

UnknownCall_126F:
	ld a, [$FF00+$80]
	bit 7, a
	jr z, UnknownRJump_129A
	ld a, [$A216]
	bit 0, a
	jr z, UnknownRJump_129A
	ld a, [$A214]
	and a
	jr nz, UnknownRJump_129A
	ld a, [$A287]
	and $0F
	jr nz, UnknownRJump_129A
	ld a, [$A268]
	and a
	jr nz, UnknownRJump_1294
	ld a, 14
	ld [$A460], a

UnknownRJump_1294:
	ld a, 255
	ld [$A268], a
	ret

UnknownRJump_129A:
	xor a
	ld [$A268], a
	ret

UnknownCall_129F:
	ld a, [$A201]
	cp 25
	ret nc
	xor a
	ld [$A2DE], a
	ld a, [$A26B]
	and a
	jp nz, UnknownJump_1378
	call UnknownCall_1E3B
	jr c, UnknownRJump_12CE
	ld a, [$A214]
	and a
	jr z, UnknownRJump_12C9
	ld a, [$A200]
	sub 72
	cp 120
	jr c, UnknownRJump_12C9
	ld a, 28
	ld [$A201], a

UnknownRJump_12C9:
	xor a
	ld [$A214], a
	ret

UnknownRJump_12CE:
	and $FE
	cp 4
	jr nz, UnknownRJump_1327
	ld a, [$A20D]
	cp 5
	jr z, UnknownRJump_1302
	ld a, [$FF00+$97]
	bit 0, a
	jr z, UnknownRJump_1327
	ld a, [$FF00+$C2]
	add 1
	ld [$FF00+$C2], a

UnknownJump_12E7:
UnknownCall_12E7:
	ld a, [$FF00+$C3]
	adc 0
	ld [$FF00+$C3], a
	ld a, 1
	ld [$A28A], a
	ld a, [$A200]
	cp 128
	jr c, UnknownRJump_1327
	ld a, [$A235]
	inc a
	ld [$A235], a
	jr UnknownRJump_1327

UnknownJump_1302:
UnknownRJump_1302:
UnknownCall_1302:
	ld a, [$FF00+$97]
	bit 0, a
	jr z, UnknownRJump_1327
	ld a, [$FF00+$C2]
	sub 1
	ld [$FF00+$C2], a
	ld a, [$FF00+$C3]
	sbc 0
	ld [$FF00+$C3], a
	ld a, 255
	ld [$A28A], a
	ld a, [$A200]
	cp 129
	jr nc, UnknownRJump_1327
	ld a, [$A236]
	inc a
	ld [$A236], a

UnknownRJump_1327:
	ld a, [$A268]
	and a
	jr z, UnknownRJump_134F
	call UnknownCall_1993
	ld a, [$A220]
	and a
	jr z, UnknownRJump_134F
	ld a, 255
	ld [$A215], a
	ld a, 48
	ld [$A201], a
	ld a, [$FF00+$80]
	bit 0, a
	ret z
	ld a, 75
	ld [$A201], a
	xor a
	ld [$A214], a
	ret

UnknownRJump_134F:
	ld a, 255
	ld [$A214], a
	xor a
	ld [$A221], a
	ld a, [$A20D]
	and $FE
	cp 8
	jr nz, UnknownRJump_1366
	ld a, 1
	ld [$A221], a

UnknownRJump_1366:
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

UnknownJump_1378:
	ld a, 255
	ld [$A214], a
	xor a
	ld [$A221], a
	ret

UnknownData_1382:
INCBIN "baserom.gb", $1382, $13FE - $1382


UnknownCall_13FE:
	xor a
	ld [$A202], a
	ld [$A218], a
	ld [$A283], a
	ld a, [$A221]
	cp 16
	ret nc
	xor a
	ld [$A221], a
	ret

UnknownCall_1413:
	jr UnknownRJump_1432

UnknownData_1415:
INCBIN "baserom.gb", $1415, $1432 - $1415


UnknownRJump_1432:
	call UnknownCall_1E7C
	jr c, UnknownRJump_143D
	call UnknownCall_1E8D
	jr c, UnknownRJump_1464
	ret

UnknownRJump_143D:
	ld a, [$A20D]
	and $FC
	cp 12
	jr nz, UnknownRJump_144B

UnknownData_1446:
INCBIN "baserom.gb", $1446, $144B - $1446


UnknownRJump_144B:
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

UnknownRJump_1464:
	ld a, [$A2C8]
	and a
	jr z, UnknownRJump_147F
	ld a, [$A23C]
	cp 18
	jr nc, UnknownRJump_147F
	ld a, 128
	ld [$A224], a
	ld a, 15
	ld [$A460], a
	xor a
	ld [$A53F], a

UnknownRJump_147F:
	ld a, [$A20D]
	and $FC
	cp 12
	jr nz, UnknownRJump_148D

UnknownData_1488:
INCBIN "baserom.gb", $1488, $148D - $1488


UnknownRJump_148D:
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

UnknownCall_14A6:
	xor a
	ld [$A291], a
	ld a, [$A24F]
	and a
	ret nz
	ld a, [$FF00+$80]
	bit 7, a
	ret z
	ld a, [$A214]
	and a
	ret z
	ld a, 255
	ld [$A291], a
	ret

UnknownCall_14BF:
	call UnknownCall_14D5
	ld a, [$A202]
	and a
	ret z
	cp 128
	jr nc, UnknownRJump_14CF
	ld [$A235], a
	ret

UnknownRJump_14CF:
	cpl
	inc a
	ld [$A236], a
	ret

UnknownCall_14D5:
	ld a, [$A287]
	and a
	jr nz, UnknownRJump_14E9
	ld a, [$FF00+$80]
	and $02
	srl a
	inc a
	ld b, a

UnknownCall_14E3:
	ld a, [$A24F]
	and a
	jr z, UnknownRJump_14EB

UnknownRJump_14E9:
	ld b, 1

UnknownRJump_14EB:
	ld a, [$A222]
	add b
	ld [$A222], a
	cp 12
	ret c
	xor a
	ld [$A222], a
	ret

UnknownCall_14FA:
	ld a, [$A287]
	bit 4, a
	jr nz, UnknownRJump_150C
	ld a, [$A24D]
	and a
	jr z, UnknownRJump_150C
	dec a
	ld [$A24D], a
	ret

UnknownRJump_150C:
	ld a, [$A214]
	and a
	ret nz
	ld a, [$FF00+$C0]
	ld [$A229], a
	ld a, [$FF00+$C1]
	ld [$A22A], a
	ld a, [$A201]
	cp 33
	jr c, UnknownRJump_1533
	ld a, [$A2DE]
	and a
	jr nz, UnknownRJump_1533
	ld a, [$FF00+$80]
	bit 0, a
	jr nz, UnknownRJump_1533
	ld a, 33
	ld [$A201], a

UnknownRJump_1533:
	ld a, [$A201]
	and a
	jr z, UnknownRJump_156B
	dec a
	ld [$A201], a
	cp 48
	jr nz, UnknownRJump_156B
	ld a, [$A287]
	and a
	jr nz, UnknownRJump_154E
	ld a, 24
	ld [$A201], a
	jr UnknownRJump_156B

UnknownRJump_154E:
	ld a, [$A201]
	dec a
	ld [$A201], a
	cp 25
	jr nc, UnknownRJump_156B

UnknownData_1559:
INCBIN "baserom.gb", $1559, $156B - $1559


UnknownRJump_156B:
	ld hl, $1947
	ld a, [$A287]
	and a
	jr nz, UnknownRJump_1580
	ld hl, $18AF
	ld a, [$A26D]
	and a
	jr z, UnknownRJump_1580
	ld hl, $18FB

UnknownRJump_1580:
	ld a, [$A201]
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
	ld a, [$A201]
	cp 25
	jr nc, UnknownRJump_15B6
	ld a, [$A214]
	and a
	jr z, UnknownRJump_1609

UnknownData_15AF:
INCBIN "baserom.gb", $15AF, $15B6 - $15AF


UnknownRJump_15B6:
	call UnknownCall_1DFE
	jr c, UnknownRJump_15CF

UnknownRJump_15BB:
	ld a, [$FF00+$C1]
	cp 255
	jr nz, UnknownRJump_1609
	ld a, [$FF00+$C0]
	add 1
	ld [$FF00+$C0], a
	ld a, [$FF00+$C1]
	adc 0
	ld [$FF00+$C1], a
	jr UnknownRJump_15BB

UnknownRJump_15CF:
	ld a, [$A229]
	ld [$FF00+$C0], a
	ld a, [$A22A]
	ld [$FF00+$C1], a
	xor a
	ld [$A2B2], a
	ld a, 24
	ld [$A201], a
	ld a, [$A287]
	and $0F
	jr nz, UnknownRJump_15F4
	ld a, [$A26D]
	and a
	jr nz, UnknownRJump_15F4
	ld a, 2
	ld [$A460], a

UnknownRJump_15F4:
	call UnknownCall_1993
	xor a
	ld [$A221], a
	ld a, [$A20D]
	and $FE
	cp 10
	jr nz, UnknownRJump_1609
	ld a, 2
	ld [$A221], a

UnknownRJump_1609:
	ret

UnknownCall_160A:
	ld a, [$A2B3]
	and a
	ret nz
	ld a, [$A214]
	and a
	jr nz, UnknownRJump_161E
	ld a, [$A26D]
	and a
	jp z, UnknownJump_16AE
	jr UnknownRJump_1622

UnknownRJump_161E:
	xor a
	ld [$A215], a

UnknownRJump_1622:
	ld a, [$A216]
	cp 2
	jr nz, UnknownRJump_1631
	ld a, [$FF00+$80]
	bit 0, a
	jr z, UnknownRJump_16AE
	jr UnknownRJump_1637

UnknownRJump_1631:
	ld a, [$FF00+$81]
	bit 0, a
	jr z, UnknownRJump_16AE

UnknownRJump_1637:
	ld a, [$A24F]
	and a
	jr nz, UnknownRJump_16AE
	ld a, 1
	ld [$A286], a
	ld a, 1
	ld [$A460], a
	ld a, [$A287]
	and $0F
	jr z, UnknownRJump_1659
	bit 4, a
	jr nz, UnknownRJump_165F
	ld a, 18
	ld [$A460], a
	jr UnknownRJump_1664

UnknownRJump_1659:
	ld a, [$A26D]
	and a
	jr z, UnknownRJump_1664

UnknownRJump_165F:
	ld a, 3
	ld [$A460], a

UnknownRJump_1664:
	ld a, [$A216]
	cp 2
	jr z, UnknownRJump_1675
	ld a, [$FF00+$80]
	bit 7, a
	jr z, UnknownRJump_1675
	xor a
	ld [$A460], a

UnknownRJump_1675:
	ld a, 255
	ld [$A215], a
	xor a
	ld [$A214], a
	ld [$A284], a
	ld a, 75
	ld [$A201], a
	ld a, [$A216]
	cp 2
	jr z, UnknownRJump_16AE
	ld a, [$A200]
	cp 72
	jr c, UnknownRJump_16AE
	cp 192
	jr nc, UnknownRJump_16AE
	ld a, [$FF00+$80]
	bit 6, a
	jr nz, UnknownRJump_16AE
	ld a, 48
	ld [$A201], a
	ld a, [$A26D]
	and a
	jr z, UnknownRJump_16AE
	ld a, 72
	ld [$A201], a

UnknownJump_16AE:
UnknownRJump_16AE:
	ret

UnknownData_16AF:
INCBIN "baserom.gb", $16AF, $16CC - $16AF


UnknownCall_16CC:
	ld a, [$A26D]
	and a
	jr nz, UnknownRJump_16DE
	ld a, [$A287]
	bit 4, a
	jr nz, UnknownRJump_16DE
	ld a, [$A214]
	and a
	ret z

UnknownRJump_16DE:
	ld a, [$A200]
	and $FC
	cp 128
	jr z, UnknownRJump_16FB
	jr c, UnknownRJump_16F2
	ld a, [$A200]
	sub 4
	ld [$A200], a
	ret

UnknownRJump_16F2:
	ld a, [$A200]
	add 4
	ld [$A200], a
	ret

UnknownRJump_16FB:
	ld a, 128
	ld [$A200], a
	ret

UnknownCall_1701:
	ld a, [$A24F]
	and a
	jp nz, UnknownJump_17C5
	ld a, [$A2B3]
	and a
	ret nz
	ld a, [$A291]
	and a
	jp nz, UnknownJump_17C4
	ld a, [$A218]
	and a
	jp nz, UnknownJump_17C4
	ld a, [$FF00+$80]
	bit 4, a
	jr z, UnknownRJump_1771
	ld a, 1
	ld [$A22B], a
	ld a, [$A200]
	add 8
	ld [$A200], a
	ld a, [$A26D]
	ld b, a
	ld a, [$A214]
	or b
	jr nz, UnknownRJump_1749
	ld a, [$A200]
	and $F0
	cp 192
	jr nz, UnknownRJump_1763
	ld a, 184
	ld [$A200], a
	jp UnknownJump_17C4

UnknownRJump_1749:
	ld a, [$A287]
	and a
	jr nz, UnknownRJump_1755
	ld a, [$FF00+$80]
	bit 4, a
	jr nz, UnknownRJump_1763

UnknownRJump_1755:
	ld a, [$A200]
	cp 192
	jr c, UnknownRJump_17C4
	ld a, 191
	ld [$A200], a
	jr UnknownRJump_17C4

UnknownRJump_1763:
	ld a, [$A200]
	cp 244
	jr c, UnknownRJump_17C4
	ld a, 243
	ld [$A200], a
	jr UnknownRJump_17C4

UnknownRJump_1771:
	ld a, [$FF00+$80]
	bit 5, a
	jr z, UnknownRJump_17C4
	ld a, 255
	ld [$A22B], a
	ld a, [$A200]
	sub 8
	ld [$A200], a
	ld a, [$A26D]
	ld b, a
	ld a, [$A214]
	or b
	jr nz, UnknownRJump_179E
	ld a, [$A200]
	and $F0
	cp 64
	jr nz, UnknownRJump_17B8
	ld a, 72
	ld [$A200], a
	jr UnknownRJump_17C4

UnknownRJump_179E:
	ld a, [$A287]
	and a
	jr nz, UnknownRJump_17AA
	ld a, [$FF00+$80]
	bit 4, a
	jr nz, UnknownRJump_17B8

UnknownRJump_17AA:
	ld a, [$A200]
	cp 72
	jr nc, UnknownRJump_17C4
	ld a, 72
	ld [$A200], a
	jr UnknownRJump_17C4

UnknownRJump_17B8:
	ld a, [$A200]
	cp 8
	jr nc, UnknownRJump_17C4
	ld a, 8
	ld [$A200], a

UnknownJump_17C4:
UnknownRJump_17C4:
	ret

UnknownJump_17C5:
	ld a, 1
	ld [$A22B], a
	ld a, 128
	ld [$A200], a
	ld a, [$A214]
	and a
	ret z
	ld a, 184
	ld [$A200], a
	ret

UnknownData_17DA:
INCBIN "baserom.gb", $17DA, $181C - $17DA


UnknownCall_181C:
	ld a, [$FF00+$C2]
	ld [$A227], a
	ld a, [$FF00+$C3]
	ld [$A228], a
	ld a, [$A24F]
	and a
	jr nz, UnknownRJump_1842
	ld hl, $1AFF
	ld a, [$A26D]
	and a
	jr nz, UnknownRJump_1845
	ld a, [$A287]
	bit 4, a
	jr z, UnknownRJump_1842
	ld a, [$A214]
	and a
	jr nz, UnknownRJump_1845

UnknownRJump_1842:
	ld hl, $19FF

UnknownRJump_1845:
	ld a, [$A200]
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
	jr nz, UnknownRJump_1886
	call UnknownCall_1E8D
	jr nc, UnknownRJump_18AE
	jr UnknownRJump_188B

UnknownRJump_1886:
	call UnknownCall_1E7C
	jr nc, UnknownRJump_18AE

UnknownRJump_188B:
	ld a, [$A227]
	ld [$FF00+$C2], a
	ld a, [$A228]
	ld [$FF00+$C3], a
	ld a, [$A219]
	ld [$A202], a
	ld a, 128
	ld [$A200], a
	ld a, [$A20D]
	and $FC
	cp 12
	jr nz, UnknownRJump_18AE
	ld a, 3
	ld [$A221], a

UnknownRJump_18AE:
	ret

UnknownData_18AF:
INCBIN "baserom.gb", $18AF, $191F - $18AF


UnknownJump_191F:
UnknownData_191F:
INCBIN "baserom.gb", $191F, $1960 - $191F


UnknownJump_1960:
UnknownData_1960:
INCBIN "baserom.gb", $1960, $1993 - $1960


UnknownCall_1993:
	xor a
	ld [$A220], a

UnknownJump_1997:
	ld a, [$A20D]
	cp 126
	jr z, UnknownRJump_19AC
	cp 4
	ret nc
	and a
	jr z, UnknownRJump_19B0
	cp 1
	jr z, UnknownRJump_19D2
	cp 3
	jr z, UnknownRJump_19C1

UnknownRJump_19AC:
	ld b, 3
	jr UnknownRJump_19F1

UnknownRJump_19B0:
	ld b, 2
	ld a, [$A216]
	and a
	jr z, UnknownRJump_19F1
	ld a, 1
	ld [$A478], a
	ld b, 1
	jr UnknownRJump_19F1

UnknownRJump_19C1:
	ld b, 6
	ld a, [$A216]
	and a
	jr z, UnknownRJump_19F1
	ld a, 1
	ld [$A478], a
	ld b, 5
	jr UnknownRJump_19F1

UnknownRJump_19D2:
	ld a, 255
	ld [$A220], a
	ld a, 2
	ld [$A460], a
	ld b, 3
	call UnknownCall_2C6C
	ld a, [$A256]
	and a
	ret nz
	ld b, 4
	call UnknownCall_2C77
	ld a, 7
	ld [$A460], a
	ret

UnknownRJump_19F1:
	ld a, 2
	ld [$A460], a
	call UnknownCall_2C6C
	ld a, 255
	ld [$A220], a
	ret

UnknownData_19FF:
INCBIN "baserom.gb", $19FF, $1BFF - $19FF


UnknownCall_1BFF:
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
	ld a, [$A216]
	and a
	jr z, UnknownRJump_1C39
	ld a, [$A291]
	and a
	jr nz, UnknownRJump_1C39
	ld a, [$FF00+$C0]
	add 22
	ld [$FF00+$B7], a
	ld a, [$FF00+$C1]
	adc 0
	ld [$FF00+$B8], a
	call UnknownCall_1EFA
	and $FE
	cp 80
	jr z, UnknownRJump_1C4E

UnknownRJump_1C39:
	ld a, [$FF00+$C0]
	add 28
	ld [$FF00+$B7], a
	ld a, [$FF00+$C1]
	adc 0
	ld [$FF00+$B8], a
	call UnknownCall_1EFA
	and $FE
	cp 80
	jr nz, UnknownRJump_1C82

UnknownRJump_1C4E:
	ld a, [$A217]
	ld b, a
	ld a, [$A271]
	or b
	jr nz, UnknownRJump_1C6D
	ld a, 15
	ld [$A224], a
	ld a, 20
	ld [$A460], a
	ld a, [$A216]
	and a
	jr nz, UnknownRJump_1C6D
	ld a, 15
	ld [$A460], a

UnknownRJump_1C6D:
	ld a, [$A23B]
	cp 128
	jp c, UnknownJump_1D71
	ld a, 128
	ld [$A224], a
	ld a, 15
	ld [$A460], a
	jp UnknownJump_1D71

UnknownRJump_1C82:
	ld a, [$A20D]
	and $FC
	cp 76
	jr nz, UnknownRJump_1CBA
	ld a, [$A27B]
	and a
	jr nz, UnknownRJump_1C9F
	ld a, [$A201]
	cp 24
	jr nc, UnknownRJump_1C9F
	ld a, 24
	ld [$A201], a
	jr UnknownRJump_1CAA

UnknownRJump_1C9F:
	ld a, [$A201]
	cp 24
	jr nc, UnknownRJump_1CAA
	xor a
	ld [$A215], a

UnknownRJump_1CAA:
	ld a, 255
	ld [$A26D], a
	ld a, [$A287]
	res 4, a
	ld [$A287], a
	jp UnknownJump_1D71

UnknownRJump_1CBA:
	ld a, [$A20D]
	and $FE
	cp 74
	jr nz, UnknownRJump_1CFB
	xor a
	ld [$A53F], a
	xor a
	ld [$A2B4], a
	ld a, [$A20D]
	cp 74
	jr z, UnknownRJump_1CD7
	ld a, 255
	ld [$A2B4], a

UnknownRJump_1CD7:
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
	jr UnknownRJump_1D71

UnknownRJump_1CFB:
	ld a, [$A287]
	and $02
	ld b, a
	ld a, [$A287]
	res 4, a
	ld [$A287], a
	ld a, [$A20D]
	cp 82
	jr c, UnknownRJump_1D28
	cp 88
	jr nc, UnknownRJump_1D28
	ld a, [$A287]
	set 4, a
	ld [$A287], a
	xor a
	ld [$A284], a
	ld a, [$A287]
	res 4, a

UnknownJump_1D25:
	ld [$A287], a

UnknownRJump_1D28:
	ld a, [$A287]
	and $02
	cp b
	jr z, UnknownRJump_1D71
	ld a, [$A200]
	cp 192
	jr c, UnknownRJump_1D3C
	ld a, 191
	ld [$A200], a

UnknownRJump_1D3C:
	ld a, [$A200]
	cp 72
	jr nc, UnknownRJump_1D48
	ld a, 72
	ld [$A200], a

UnknownRJump_1D48:
	call UnknownCall_3735
	ld a, [$A287]
	bit 4, a
	jr nz, UnknownRJump_1D71
	ld a, [$FF00+$80]
	bit 6, a
	jr nz, UnknownRJump_1D64
	ld a, 70
	ld [$A201], a
	ld a, 255
	ld [$A215], a
	jr UnknownRJump_1D71

UnknownRJump_1D64:
	ld a, 70
	ld [$A201], a
	ld a, 255
	ld [$A215], a
	ld [$A2DE], a

UnknownJump_1D71:
UnknownRJump_1D71:
	pop bc
	pop de
	pop hl
	ret

UnknownCall_1D75:
	ld a, [$A20D]
	and $FE
	cp 72
	jr nz, UnknownRJump_1DA4
	ld a, 7
	ld [$A460], a
	call UnknownCall_1DA5
	ld a, [$A262]
	inc a
	daa
	ld [$A262], a
	ld a, [$A263]
	adc 0
	ld [$A263], a
	cp 10
	jr c, UnknownRJump_1DA4

UnknownData_1D9A:
INCBIN "baserom.gb", $1D9A, $1DA4 - $1D9A


UnknownRJump_1DA4:
	ret

UnknownCall_1DA5:
	ld a, [$A20D]
	cp 72
	jr nz, UnknownRJump_1DD5
	ld d, 96
	call UnknownCall_2C0D
	call UnknownCall_200C
	ld a, [$A205]
	and $DE
	ld l, a
	ld a, [$A206]
	ld h, a
	ld de, $001F

UnknownRJump_1DC1:
	ld a, [$FF00+$41]
	and $03
	jr nz, UnknownRJump_1DC1

UnknownRJump_1DC7:
	ld a, [$FF00+$41]
	and $03
	jr nz, UnknownRJump_1DC7
	ld a, 255
	ld [hli], a
	ld [hl], a
	add de
	ld [hli], a
	ld [hl], a
	ret

UnknownRJump_1DD5:
	ld d, 127
	call UnknownCall_2C0D
	call UnknownCall_200C
	ld a, [$A205]
	and $DE
	ld l, a
	ld a, [$A206]
	ld h, a
	ld de, $001F

UnknownRJump_1DEA:
	ld a, [$FF00+$41]
	and $03
	jr nz, UnknownRJump_1DEA

UnknownRJump_1DF0:
	ld a, [$FF00+$41]
	and $03
	jr nz, UnknownRJump_1DF0
	ld a, 127
	ld [hli], a
	ld [hl], a
	add de
	ld [hli], a
	ld [hl], a
	ret

UnknownCall_1DFE:
	push hl
	push de
	push bc
	ld a, [$FF00+$C2]
	add 16
	ld [$FF00+$B9], a
	ld a, [$FF00+$C3]
	adc 0
	ld [$FF00+$BA], a
	ld a, [$A216]
	and a
	jr nz, UnknownRJump_1E17
	ld b, 28
	jr UnknownRJump_1E19

UnknownRJump_1E17:
	ld b, 18

UnknownRJump_1E19:
	ld a, [$FF00+$C0]
	add b
	ld [$FF00+$B7], a
	ld a, [$FF00+$C1]
	adc 0
	ld [$FF00+$B8], a
	call UnknownCall_1EFA
	cp 126
	jr z, UnknownRJump_1E31
	cp 56
	pop bc
	pop de
	pop hl
	ret

UnknownRJump_1E31:
	scf
	pop bc
	pop de
	pop hl
	ret

UnknownCall_1E36:
	push hl
	push de
	push bc
	jr UnknownRJump_1E48

UnknownCall_1E3B:
	push hl
	push de
	push bc
	ld a, [$FF00+$C0]
	sub 4
	and $0F
	cp 5
	jr nc, UnknownRJump_1E78

UnknownRJump_1E48:
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
	call UnknownCall_1EFA
	cp 72
	jr c, UnknownRJump_1E78
	ld a, [$FF00+$C2]
	add 20
	ld [$FF00+$B9], a
	ld a, [$FF00+$C3]
	adc 0
	ld [$FF00+$BA], a
	call UnknownCall_1EFA
	cp 72

UnknownRJump_1E78:
	pop bc
	pop de
	pop hl
	ret

UnknownCall_1E7C:
	push hl
	push de
	push bc
	ld a, [$FF00+$C2]
	add 11
	ld [$FF00+$B9], a
	ld a, [$FF00+$C3]
	adc 0
	ld [$FF00+$BA], a
	jr UnknownRJump_1E9C

UnknownCall_1E8D:
	push hl
	push de
	push bc
	ld a, [$FF00+$C2]
	add 20
	ld [$FF00+$B9], a
	ld a, [$FF00+$C3]
	adc 0
	ld [$FF00+$BA], a

UnknownRJump_1E9C:
	ld a, [$A216]
	and a
	jr z, UnknownRJump_1EBE
	ld a, [$A291]
	and a
	jr nz, UnknownRJump_1EBE
	ld a, [$FF00+$C0]
	add 20
	ld [$FF00+$B7], a
	ld a, [$FF00+$C1]
	adc 0
	ld [$FF00+$B8], a
	call UnknownCall_1EFA
	cp 56
	jr c, UnknownRJump_1EF0
	call UnknownCall_1D75

UnknownRJump_1EBE:
	ld a, [$FF00+$C0]
	add 32
	ld [$FF00+$B7], a
	ld a, [$FF00+$C1]
	adc 0
	ld [$FF00+$B8], a
	call UnknownCall_1EFA
	cp 56
	jr c, UnknownRJump_1EF0
	call UnknownCall_1D75
	ld a, [$FF00+$C0]
	add 40
	ld [$FF00+$B7], a
	ld a, [$FF00+$C1]
	adc 0
	ld [$FF00+$B8], a
	call UnknownCall_1EFA
	cp 56
	jr c, UnknownRJump_1EF0
	call UnknownCall_1D75
	scf
	ccf
	pop bc
	pop de
	pop hl
	ret

UnknownRJump_1EF0:
	scf
	pop bc
	pop de
	pop hl
	ret

UnknownData_1EF5:
INCBIN "baserom.gb", $1EF5, $1EFA - $1EF5


UnknownCall_1EFA:
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

UnknownCall_1F2F:
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

UnknownData_1F51:
INCBIN "baserom.gb", $1F51, $1FD2 - $1F51


UnknownCall_1FD2:
	ld a, [$FF00+$80]
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
	ld a, [$FF00+$80]

UnknownCall_2000:
	xor c
	and c
	ld [$FF00+$81], a
	ld a, c
	ld [$FF00+$80], a
	ld a, 48
	ld [$FF00+$00], a
	ret

UnknownCall_200C:
	ld a, [$FF00+$B7]
	sub 16
	ld b, 8
	ld de, $0020
	ld hl, $97E0

UnknownRJump_2018:
	add de
	sub b
	jr nc, UnknownRJump_2018
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

UnknownData_202F:
INCBIN "baserom.gb", $202F, $2062 - $202F


UnknownCall_2062:
	ld b, 0
	ld a, [$A2B3]
	and a
	jr z, UnknownRJump_206D
	and $03
	ld b, a

UnknownRJump_206D:
	ld a, [$FF00+$C8]
	sub 72
	sub b
	ld [$A2B0], a
	ld a, [$FF00+$CA]
	sub 80
	ld [$A2B1], a
	ret

UnknownCall_207D:
	ld a, 4
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0000
	ret

UnknownCall_2089:
	ld a, [$A2CE]
	and a
	ret nz
	ld a, 4
	ld [$2100], a
	call UnknownCall_0030
	ret

UnknownData_2097:
INCBIN "baserom.gb", $2097, $20A4 - $2097


UnknownCall_20A4:
	ld a, [$A28E]
	ld b, a
	ld a, [$A28F]
	or b
	jp z, UnknownJump_21EE
	ld a, [$A264]
	ld [$FF00+$8D], a
	call UnknownCall_2CFF
	call UnknownCall_2728
	call $FFA0
	ld a, 5
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

UnknownJump_20D9:
	ld a, 5
	ld [$A24E], a
	ld [$2100], a
	ld a, [hl]
	cp 255
	jp nz, UnknownJump_20EB
	inc hl
	jp UnknownJump_21EE

UnknownJump_20EB:
	and $F0
	cp 32
	jr nz, UnknownRJump_210E
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
	jp UnknownJump_21E8

UnknownRJump_210E:
	cp 128
	jr nz, UnknownRJump_211E
	ld a, [hl]
	and $0F
	or $F0
	ld [$A2E0], a
	inc hl
	jp UnknownJump_21E8

UnknownRJump_211E:
	cp 48
	jr nz, UnknownRJump_214F
	ld a, [hl]
	and $0F
	jr nz, UnknownRJump_2131
	inc hl
	ld a, [hli]
	ld [$FF00+$C8], a
	ld a, [hli]
	ld [$FF00+$C0], a
	jp UnknownJump_21E8

UnknownRJump_2131:
UnknownData_2131:
INCBIN "baserom.gb", $2131, $214F - $2131


UnknownRJump_214F:
	cp 80
	jr nz, UnknownRJump_2162

UnknownData_2153:
INCBIN "baserom.gb", $2153, $2162 - $2153


UnknownRJump_2162:
	cp 96
	jr nz, UnknownRJump_216C
	call UnknownCall_25AF
	jp UnknownJump_21E8

UnknownRJump_216C:
	cp 176
	jr nz, UnknownRJump_217E
	xor a
	ld [$A288], a
	ld a, 136
	ld [$FF00+$4A], a
	call UnknownCall_2202
	jp UnknownJump_21E8

UnknownRJump_217E:
	cp 0
	jr nz, UnknownRJump_218C

UnknownData_2182:
INCBIN "baserom.gb", $2182, $218C - $2182


UnknownRJump_218C:
	cp 16
	jr nz, UnknownRJump_2198

UnknownData_2190:
INCBIN "baserom.gb", $2190, $2198 - $2190


UnknownRJump_2198:
	cp 64
	jr nz, UnknownRJump_21A7
	call UnknownCall_2323
	ld a, 1
	ld [$A24A], a
	jp UnknownJump_21E8

UnknownRJump_21A7:
UnknownData_21A7:
INCBIN "baserom.gb", $21A7, $21E8 - $21A7


UnknownJump_21E8:
	call UnknownCall_2728
	jp UnknownJump_20D9

UnknownJump_21EE:
	ld a, [$A24A]
	ld [$A249], a
	xor a
	ld [$A28E], a
	ld [$A28F], a
	ld [$A24A], a
	ld [$A2A8], a
	ret

UnknownCall_2202:
	ld a, [hli]
	and $0F
	ld b, a
	cp 1
	jr z, UnknownRJump_224E
	cp 3
	jr z, UnknownRJump_222E
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
	jp UnknownJump_22B9

UnknownRJump_222E:
UnknownData_222E:
INCBIN "baserom.gb", $222E, $224E - $222E


UnknownRJump_224E:
UnknownData_224E:
INCBIN "baserom.gb", $224E, $22B9 - $224E


UnknownJump_22B9:
	ld a, 255
	ld [$A248], a

UnknownRJump_22BE:
	ld a, [$A28C]
	and a
	jr z, UnknownRJump_22D5

UnknownData_22C4:
INCBIN "baserom.gb", $22C4, $22D5 - $22C4


UnknownRJump_22D5:
	call UnknownCall_2728
	ld a, [$A248]
	and a
	jr nz, UnknownRJump_22BE
	ret

UnknownData_22DF:
INCBIN "baserom.gb", $22DF, $2323 - $22DF


UnknownCall_2323:
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
	call UnknownCall_2728
	ld a, [$A20E]
	cp 1
	jr z, UnknownRJump_2359
	ld a, [$A20E]
	cp 2
	jp z, UnknownJump_23E4
	ld a, [$A20E]
	cp 4
	jp z, UnknownJump_2524
	ld a, [$A20E]
	cp 8
	jp z, UnknownJump_246F

UnknownData_2357:
INCBIN "baserom.gb", $2357, $2359 - $2357


UnknownRJump_2359:
	ld a, [$A258]
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
	call UnknownCall_0A35
	call UnknownCall_2728
	ld a, [$A258]
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
	call UnknownCall_0A35
	call UnknownCall_2728
	ld a, [$A258]
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
	call UnknownCall_0A35
	pop hl
	ret

UnknownJump_23E4:
	ld a, [$A258]
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
	call UnknownCall_0A35
	call UnknownCall_2728
	ld a, [$A258]
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
	call UnknownCall_0A35
	call UnknownCall_2728
	ld a, [$A258]
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
	call UnknownCall_0A35
	pop hl
	ret

UnknownJump_246F:
	ld a, [$A258]
	ld [$A24E], a
	ld [$2100], a
	ld a, 0
	ld [$FF00+$AF], a
	ld a, 170
	ld [$FF00+$B0], a
	ld a, 255
	ld [$A24C], a

UnknownJump_2485:
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
	call UnknownCall_0969
	call UnknownCall_2728
	ld a, [$A258]
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
	call UnknownCall_0969
	call UnknownCall_2728
	ld a, [$A258]
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
	call UnknownCall_0969
	call UnknownCall_2728
	ld a, [$A258]
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
	call UnknownCall_0969
	pop hl
	ret

UnknownJump_2524:
	ld a, [$A258]
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
	call UnknownCall_0969
	call UnknownCall_2728
	ld a, [$A258]
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
	call UnknownCall_0969
	call UnknownCall_2728
	ld a, [$A258]
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
	call UnknownCall_0969
	pop hl
	ret

UnknownCall_25AF:
	ld a, [hli]
	and $0F
	ld [$A22D], a
	push hl
	call UnknownCall_0348
	ld a, 19
	ld [$A258], a
	ld [$2100], a
	ld a, 3
	ld [$A812], a
	call UnknownCall_0361
	ld a, 7
	ld [$A24E], a
	ld [$2100], a
	ld bc, $0050
	ld hl, $7800
	ld de, $8E80
	call UnknownCall_0336
	ld hl, $268B
	ld a, [$A22D]
	sla a
	ld e, a
	ld d, 0
	add de
	ld a, [hli]
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
	cp 24
	jr nz, UnknownRJump_2614
	ld bc, $0800
	ld de, $9000

UnknownRJump_2614:
	call UnknownCall_0336
	ld hl, $268B
	ld a, [$A22D]
	sla a
	inc a
	ld e, a
	ld d, 0
	add de
	ld a, [hli]
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
	cp 24
	jr nz, UnknownRJump_264F
	ld bc, $0700
	ld de, $8900

UnknownRJump_264F:
	call UnknownCall_0336
	ld a, 8
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

UnknownRJump_266D:
	ld a, [de]
	ld [hli], a
	inc de
	ld a, h
	cp 168
	jr nz, UnknownRJump_266D
	xor a
	ld [$FF00+$47], a
	ld [$A27E], a
	ld [$FF00+$48], a
	ld [$A27F], a
	ld [$FF00+$49], a
	ld [$A280], a
	ld a, 227
	ld [$FF00+$40], a
	pop hl
	ret

UnknownData_268B:
INCBIN "baserom.gb", $268B, $26C3 - $268B


UnknownJump_26C3:
	ld a, [$AA01]
	and a
	jr z, UnknownRJump_2712
	ld a, [$A258]
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0AFB
	jr UnknownRJump_2712

UnknownJump_26D7:
	ld a, [$A265]
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

UnknownRJump_26EF:
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, c
	and $3F
	jr nz, UnknownRJump_26EF
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
	jr nz, UnknownRJump_2712
	xor a
	ld [$A248], a

UnknownRJump_2712:
	ld a, [$FF00+$9B]
	cp 19
	call nz, UnknownCall_2089
	ld a, 1
	ld [$FF00+$82], a
	ld a, [$A24E]
	ld [$2100], a
	pop hl
	pop de
	pop bc
	pop af
	reti

UnknownCall_2728:
	halt

UnknownRJump_2729:
	ld a, [$FF00+$82]
	and a
	jr z, UnknownRJump_2729
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

UnknownCall_273E:
	ld a, [$FF00+$81]
	cp 8
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
	jr z, UnknownRJump_2760
	ld b, 147

UnknownRJump_2760:
	ld a, b
	ld [$A27E], a
	ld [$A27F], a
	ld a, [$FF00+$81]
	cp 4
	jr nz, UnknownRJump_278E
	ld a, [$A27D]
	bit 7, a
	jr z, UnknownRJump_278E
	ld a, 2
	ld [$A45E], a
	ld [$A224], a
	xor a
	ld [$A2C8], a
	ld [$A299], a
	ld [$A2B4], a
	ld [$A50D], a
	ld a, 20
	ld [$FF00+$9B], a
	ret

UnknownRJump_278E:
	ld a, [$FF00+$81]
	bit 6, a
	ret z
	ld a, [$A80F]
	ld [$A27E], a
	ld a, [$A810]
	ld [$A27F], a
	ld a, [$A811]
	ld [$A280], a
	ld a, 4
	ld [$FF00+$9B], a
	ld a, 2
	ld [$A45E], a
	ret
	call UnknownCall_0348
	xor a
	ld [$FF00+$8D], a
	call UnknownCall_2D41
	ld a, 12
	ld [$A24E], a
	ld [$2100], a
	ld bc, $1800
	ld hl, $4C92
	ld de, $8000
	call UnknownCall_0336
	ld de, $9800
	ld hl, $6492

UnknownRJump_27D2:
	ld a, [hli]
	ld [de], a
	inc de
	ld a, d
	cp 155
	jr nz, UnknownRJump_27D2
	xor a
	ld [$A2B0], a
	ld [$A2B1], a
	ld [$FF00+$42], a
	ld [$FF00+$43], a
	ld a, 228
	ld [$A27E], a
	ld a, 195
	ld [$A207], a
	ld [$FF00+$40], a
	ld a, 5
	ld [$A22C], a
	xor a
	ld [$A262], a
	ld [$A263], a
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

UnknownRJump_283F:
	srl a
	jr nc, UnknownRJump_2844
	inc c

UnknownRJump_2844:
	dec b
	jr nz, UnknownRJump_283F
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
	call UnknownCall_2934
	ld a, 255
	ld [$A266], a
	ld a, 7
	ld [$A468], a
	ld a, 7
	ld [$FF00+$9B], a
	ret

UnknownData_2874:
INCBIN "baserom.gb", $2874, $287E - $2874

	ld a, 12
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0884
	call UnknownCall_28A7
	call UnknownCall_2CFF
	ld a, [$A267]
	ld b, a
	ld a, [$A266]
	or b
	ret nz
	ld a, [$FF00+$81]
	cp 8
	ret nz
	ld a, 0
	ld [$FF00+$9B], a
	ld a, 255
	ld [$A468], a
	ret

UnknownCall_28A7:
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
	jr c, UnknownRJump_28CD
	srl a
	ld b, a
	ld a, 32
	sub b
	ld [$FF00+$C4], a

UnknownRJump_28CD:
	ld a, 1
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_1297
	ret

UnknownCall_28D9:
	ld hl, $A000
	call UnknownCall_28EC
	ld hl, $A050
	call UnknownCall_28EC
	ld hl, $A0A0
	call UnknownCall_28EC
	ret

UnknownCall_28EC:
	push hl
	ld e, l
	ld d, h
	ld b, 69
	ld c, 0

UnknownRJump_28F3:
	ld a, [hli]
	add c
	ld c, a
	dec b
	jr nz, UnknownRJump_28F3
	ld a, [hli]
	cp c
	jr nz, UnknownRJump_2913
	ld a, [hli]
	cp 18
	jr nz, UnknownRJump_2913
	ld a, [hli]
	cp 52
	jr nz, UnknownRJump_2913
	ld a, [hli]
	cp 86
	jr nz, UnknownRJump_2913
	ld a, [hl]
	cp 120
	jr nz, UnknownRJump_2913
	pop hl
	ret

UnknownRJump_2913:
	pop hl
	ld b, 64
	xor a

UnknownRJump_2917:
	ld [hli], a
	dec b
	jr nz, UnknownRJump_2917
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

UnknownCall_2934:
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

UnknownRJump_294D:
	ld a, [de]
	ld [hli], a
	add c
	ld c, a
	inc de
	dec b
	jr nz, UnknownRJump_294D
	ld a, [$A262]
	ld [hli], a
	add c
	ld c, a
	ld a, [$A263]
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

UnknownData_2974:
INCBIN "baserom.gb", $2974, $29DD - $2974

	call UnknownCall_0348
	ld a, 17
	ld [$A24E], a
	ld [$2100], a
	ld bc, $1800
	ld hl, $5800
	ld de, $8000
	call UnknownCall_0336
	ld a, 26
	ld [$A24E], a
	ld [$2100], a
	ld hl, $9800
	ld de, $548E

UnknownRJump_2A02:
	ld a, [de]
	ld [hli], a
	inc de
	ld a, h
	cp 156
	jr nz, UnknownRJump_2A02
	xor a
	ld [$A2B0], a
	ld [$A2B1], a
	ld a, 225
	ld [$A27E], a
	ld a, 210
	ld [$A27F], a
	ld a, 57
	ld [$A280], a
	ld hl, $A100

UnknownRJump_2A23:
	xor a
	ld [hli], a
	ld a, l
	cp 160
	jr c, UnknownRJump_2A23
	ld a, 195
	ld [$FF00+$40], a
	ld a, 1
	ld [$A267], a
	ld a, 0
	ld [$A266], a
	ld a, 44
	ld [$A2E1], a
	ld a, 26
	ld [$A24E], a
	ld [$2100], a
	ld a, [$A2DD]
	inc a
	ld [$A2DD], a
	ret

UnknownJump_2A4D:
	ld a, 12
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_09CD

UnknownCall_2A58:
	ld a, 1
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_2485

UnknownData_2A63:
INCBIN "baserom.gb", $2A63, $2A96 - $2A63


UnknownCall_2A96:
	ld a, 4
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0030
	ld a, 26
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_2AAA:
	ld a, 4
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0030
	ld a, 15
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_2ABE:
	ld a, 5
	ld [$A24E], a
	ld [$2100], a
	ld bc, $1800
	ld hl, $41E5
	ld de, $8000
	call UnknownCall_0336
	ret
	ld a, 12
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_05B6
	ld a, 12
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_067A
	ld a, 12
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_041D
	ld a, 12
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_0451

UnknownJump_2AFF:
UnknownData_2AFF:
INCBIN "baserom.gb", $2AFF, $2B13 - $2AFF


UnknownCall_2B13:
	ld a, 1
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_1297
	ld a, 12
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_2B27:
	ld a, 1
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_1297
	ld a, 26
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_2B3B:
	ld a, 1
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_1267
	ld a, 12
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_2B4F:
	ld a, 1
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_12E7
	ld a, 26
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_2B63:
	ld a, 1
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_12E7
	ld a, 12
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_2B77:
	ld a, 1
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_1302
	ld a, 12
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_2B8B:
	ld a, 7
	ld [$A24E], a
	ld [$2100], a
	ld bc, $0600
	ld hl, $5E00
	ld de, $9200
	call UnknownCall_0336
	ld bc, $0380
	ld hl, $6A00
	ld de, $8E80
	call UnknownCall_0336
	ld a, 6
	ld [$A24E], a
	ld [$2100], a
	ld bc, $0800
	ld hl, $4000
	ld de, $8000
	call UnknownCall_0336
	ld a, 27
	ld [$A24E], a
	ld [$2100], a
	ld hl, $7000
	ld bc, $0300
	ld de, $8800
	call UnknownCall_0336
	ld a, 12
	ld [$2100], a
	ld bc, $0380
	ld hl, $6ACA
	ld de, $8B00
	call UnknownCall_0336
	ret
	ld a, 12
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_0000
	ld a, 12
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_005F

UnknownCall_2BFB:
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0336
	ld a, 15
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_2C0D:
	ld a, 1
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_1CF2

UnknownJump_2C18:
	ld a, 15
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_3E73
	ld a, 15
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_2F2B
	ld a, 15
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_0000

UnknownData_2C39:
INCBIN "baserom.gb", $2C39, $2C40 - $2C39


UnknownCall_2C40:
UnknownData_2C40:
INCBIN "baserom.gb", $2C40, $2C61 - $2C40


UnknownCall_2C61:
	ld a, 1
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_1D25

UnknownCall_2C6C:
	ld a, 1
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_1960

UnknownCall_2C77:
	ld a, 1
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_191F

UnknownCall_2C82:
	ld a, 1
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_1997

UnknownData_2C8D:
INCBIN "baserom.gb", $2C8D, $2CA3 - $2C8D


UnknownJump_2CA3:
	ld a, 26
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_0528
	ld a, 26
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_0000
	ld a, 26
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_000F
	call UnknownCall_0348
	call UnknownCall_031C
	xor a
	ld [$FF00+$8D], a
	call UnknownCall_2CFF
	ld a, 5
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_0043
	call UnknownCall_031C
	ld a, 5
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_007C
	ld a, 1
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_1579

UnknownCall_2CF4:
	ld a, 1
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_1297

UnknownCall_2CFF:
	ld a, 1
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_12E7

UnknownCall_2D0A:
	ld a, 1
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_130D

UnknownCall_2D15:
	ld a, 1
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_1550

UnknownData_2D20:
INCBIN "baserom.gb", $2D20, $2D41 - $2D20


UnknownCall_2D41:
	ld a, 1
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_1302

UnknownData_2D4C:
INCBIN "baserom.gb", $2D4C, $2D7D - $2D4C


UnknownCall_2D7D:
	xor a
	ld [$A26B], a
	ld [$A2D4], a
	ld a, [$A224]
	and a
	ret nz
	ld hl, $AD00

UnknownRJump_2D8C:
	push hl
	ld a, l
	add 23
	ld l, a
	ld a, [hl]
	and $F7
	jr nz, UnknownRJump_2DA2
	call UnknownCall_2EDD
	ld a, [$A246]
	and a
	jr z, UnknownRJump_2DA2
	call UnknownCall_2DC6

UnknownRJump_2DA2:
	pop hl
	ld de, $0020
	add de
	ld a, h
	cp 175
	jr nz, UnknownRJump_2D8C
	ld a, [$A2D4]
	and a
	ret z
	ld a, 255
	ld [$A215], a
	ld a, 48
	ld [$A201], a
	ld a, [$FF00+$80]
	bit 0, a
	ret z
	ld a, 75
	ld [$A201], a
	ret

UnknownCall_2DC6:
	xor a
	ld [$A214], a
	ld a, l
	and $E0
	add 23
	ld l, a
	ld a, [hl]
	set 4, a
	ld [hl], a
	ld a, [$A2A9]
	bit 7, a
	jr z, UnknownRJump_2DE1
	and $7F
	ld [$A26C], a
	ret

UnknownRJump_2DE1:
	ld a, [$A244]
	ld b, a
	cp 12
	jp nc, UnknownJump_2E6F
	ld a, [$A24D]
	and a
	jr nz, UnknownRJump_2DF7
	ld a, [$A201]
	cp 24
	jr nc, UnknownRJump_2E6F

UnknownRJump_2DF7:
	ld a, [$A2A9]
	and $23
	jr z, UnknownRJump_2E6F
	bit 5, a
	jr z, UnknownRJump_2E23
	ld a, 255
	ld [$A26B], a
	ld a, l
	and $E0
	add 23
	ld l, a
	ld a, 8
	ld [hl], a
	ld a, [$A244]
	cp 3
	ret c
	ld a, [$FF00+$C0]
	sub 1
	ld [$FF00+$C0], a
	ld a, [$FF00+$C1]
	sbc 0
	ld [$FF00+$C1], a
	ret

UnknownRJump_2E23:
	xor a
	ld [$A284], a
	ld a, [$A271]
	and a
	jr nz, UnknownRJump_2E6F
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
	call UnknownCall_1DFE
	jr nc, UnknownRJump_2E5C
	ld a, [$FF00+$C0]
	add b
	ld [$FF00+$C0], a
	ld a, [$FF00+$C1]
	adc 0
	ld [$FF00+$C1], a

UnknownRJump_2E5C:
	ld a, [$A28B]
	and a
	ret z
	ld a, 49
	ld [$A201], a
	ld a, 255
	ld [$A215], a
	ld [$A2DE], a
	ret

UnknownJump_2E6F:
UnknownRJump_2E6F:
	ld a, [$A271]
	and a
	jp nz, UnknownJump_2EAA
	ld a, [$A2A9]
	bit 6, a
	ret z
	ld a, [$A287]
	bit 4, a
	jr z, UnknownRJump_2E8E
	res 4, a
	ld [$A287], a
	ld a, 128
	ld [$A217], a
	ret

UnknownRJump_2E8E:
	ld a, [$A217]
	and a
	jp nz, UnknownJump_2F71
	ld a, 15
	ld [$A224], a
	ld a, 20
	ld [$A460], a
	ld a, [$A216]
	and a
	ret nz
	ld a, 15
	ld [$A460], a
	ret

UnknownJump_2EAA:
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
	cp 5
	ret c
	ld a, 9
	ld [$A460], a
	ld a, [$A22C]
	inc a
	daa
	ld [$A22C], a
	ret nz

UnknownData_2ED7:
INCBIN "baserom.gb", $2ED7, $2EDD - $2ED7


UnknownCall_2EDD:
	xor a
	ld [$A246], a
	ld a, l
	sub 5
	ld l, a
	ld a, [hl]
	bit 7, a
	jr z, UnknownRJump_2EF1
	and $7F
	jp z, UnknownJump_2F71
	jr UnknownRJump_2EF5

UnknownRJump_2EF1:
	and $63
	jr z, UnknownRJump_2F71

UnknownRJump_2EF5:
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
	ld a, [$A216]
	and a
	jr nz, UnknownRJump_2F34
	ld b, 0
	ld a, [$A291]
	and a
	jr z, UnknownRJump_2F3E
	ld b, 248
	jr UnknownRJump_2F3E

UnknownRJump_2F34:
	ld b, 8
	ld a, [$A291]
	and a
	jr z, UnknownRJump_2F3E
	ld b, 0

UnknownRJump_2F3E:
	ld a, [$A2AB]
	add b
	add e
	sub d
	ld e, a
	ld a, [$A23B]
	sub d
	ld [$A244], a
	cp e
	jr nc, UnknownRJump_2F71
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
	ld a, [$A23C]
	sub d
	ld [$A245], a
	cp e
	jr nc, UnknownRJump_2F71
	ld a, 255
	ld [$A246], a

UnknownJump_2F71:
UnknownRJump_2F71:
	ret

UnknownCall_2F72:
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

UnknownRJump_2F97:
	push hl
	ld a, l
	add 23
	ld l, a
	ld a, [hl]
	and a
	jr nz, UnknownRJump_2FA3
	call UnknownCall_2FAE

UnknownRJump_2FA3:
	pop hl
	ld de, $0020
	add de
	ld a, h
	cp 175
	jr nz, UnknownRJump_2F97
	ret

UnknownCall_2FAE:
	xor a
	ld [$A247], a
	ld a, l
	sub 5
	ld l, a
	ld a, [hli]
	ld [$A2A9], a
	and a
	jr z, UnknownRJump_2FEC
	ld a, l
	sub 10
	ld l, a
	ld a, [$FF00+$B7]
	ld b, a
	ld a, [hli]
	sub b
	cp 16
	jr nc, UnknownRJump_2FEC
	ld a, [$FF00+$B9]
	ld b, a
	ld a, [hl]
	sub b
	cp 20
	jr nc, UnknownRJump_2FEC
	ld a, 255
	ld [$A247], a
	ld a, l
	add 13
	ld l, a
	ld a, [hl]
	set 5, a
	ld [hl], a
	ld a, [$A2A9]
	cp 128
	jr nz, UnknownRJump_2FEC
	ld a, 255
	ld [$A256], a

UnknownRJump_2FEC:
	ret

UnknownCall_2FED:
	ld hl, $AD00

UnknownRJump_2FF0:
	push hl
	ld a, l
	add 23
	ld l, a
	ld a, [hl]
	and a
	jr nz, UnknownRJump_2FFC
	call UnknownCall_3007

UnknownRJump_2FFC:
	pop hl
	ld de, $0020
	add de
	ld a, h
	cp 175
	jr nz, UnknownRJump_2FF0
	ret

UnknownCall_3007:
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
	jp nc, UnknownJump_307C
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
	jp nc, UnknownJump_307C
	ld a, [$FF00+$98]
	bit 4, a
	jr nz, UnknownRJump_3071
	ld a, 2
	ld [$A460], a
	ld [$A246], a
	jr UnknownRJump_307C

UnknownRJump_3071:
	ld a, l
	add 13
	ld l, a
	ld a, [hl]
	set 4, a
	ld [hl], a
	ld [$A246], a

UnknownJump_307C:
UnknownRJump_307C:
	ret

UnknownCall_307D:
	ld a, [$A28B]
	and a
	ret nz
	ld a, [$A214]
	ld b, a
	ld a, [$A26B]
	or b
	ret z
	ld a, [$FF00+$80]
	cp 130
	jr z, UnknownRJump_3098
	ld a, [$FF00+$80]
	cp 66
	jr z, UnknownRJump_30D9
	ret

UnknownRJump_3098:
	ld a, [$A23B]
	cp 32
	ret c
	ld a, [$A258]
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
	bit 6, a
	jr z, UnknownRJump_30CC
	ld a, [$FF00+$C8]
	cp 192
	ret nc

UnknownRJump_30CC:
	ld a, [$FF00+$C8]
	add 1
	ld [$FF00+$C8], a
	ld a, [$FF00+$C9]
	adc 0
	ld [$FF00+$C9], a
	ret

UnknownRJump_30D9:
	ld a, [$A23B]
	cp 112
	ret nc
	ld a, [$A258]
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
	bit 4, a
	jr z, UnknownRJump_310D
	ld a, [$FF00+$C8]
	cp 73
	ret c

UnknownRJump_310D:
	ld a, [$FF00+$C8]
	sub 1
	ld [$FF00+$C8], a
	ld a, [$FF00+$C9]
	sbc 0
	ld [$FF00+$C9], a
	ret
	ld a, [$A266]
	and a
	jr z, UnknownRJump_3127

UnknownRJump_3120:
	ld a, [$FF00+$44]
	cp 80
	jr nc, UnknownRJump_3120
	ret

UnknownRJump_3127:
	xor a
	ld [$A299], a
	ld [$A2DC], a
	ld a, 20
	ld [$FF00+$9B], a
	call UnknownCall_2D41
	ld a, [$A2CE]
	and a
	jp nz, UnknownJump_3150
	ld a, [$A22C]
	sub 1
	daa
	ld [$A22C], a
	jr c, UnknownRJump_314B
	call UnknownCall_2934
	ret

UnknownRJump_314B:
	ld a, 5
	ld [$FF00+$9B], a
	ret

UnknownJump_3150:
UnknownData_3150:
INCBIN "baserom.gb", $3150, $315C - $3150


UnknownCall_315C:
	ld hl, $31EF
	ld a, [$A201]
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
	call UnknownCall_2D15
	ld a, [$A23B]
	and $F0
	cp 176
	jr z, UnknownRJump_3186
	ld a, [$A201]
	dec a
	ret z
	ld [$A201], a
	ret

UnknownRJump_3186:
	ld a, 2
	ld [$A468], a
	xor a
	ld [$A216], a
	ld [$A217], a
	ld [$A267], a
	ld a, 192
	ld [$A266], a
	ld a, 9
	ld [$FF00+$9B], a
	ret

UnknownCall_319F:
	ld a, [$A224]
	and a
	ret z
	ld a, [$A224]
	cp 128
	jr z, UnknownRJump_31D1
	ld a, [$A216]
	and a
	jr z, UnknownRJump_31D1
	cp 1
	jr nz, UnknownRJump_31C2
	xor a
	ld [$A224], a
	ld [$A216], a
	ld a, 128
	ld [$A217], a
	ret

UnknownRJump_31C2:
	xor a
	ld [$A224], a
	ld a, 1
	ld [$A216], a
	ld a, 128
	ld [$A217], a
	ret

UnknownRJump_31D1:
	ld a, 255
	ld [$A224], a
	xor a
	ld [$A222], a
	ld a, 95
	ld [$A201], a
	ret

UnknownData_31E0:
INCBIN "baserom.gb", $31E0, $324F - $31E0


UnknownCall_324F:
	ld hl, $A880

UnknownRJump_3252:
	ld a, [hl]
	and a
	call nz, UnknownCall_3261
	ld bc, $0010
	add bc
	ld a, l
	cp 160
	jr nz, UnknownRJump_3252
	ret

UnknownCall_3261:
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
	cp 192
	jr z, UnknownRJump_32BD
	ld a, [$FF00+$C8]
	ld b, a
	ld a, [$A25D]
	sub b
	add 70
	ld [$FF00+$C4], a
	and $F0
	cp 192
	jr z, UnknownRJump_32BD
	ld b, 176
	ld a, [$A212]
	cp 255
	jr z, UnknownRJump_329E
	ld b, 180

UnknownRJump_329E:
	ld a, [$FF00+$97]
	and $06
	srl a
	add b
	ld [$FF00+$C6], a
	ld a, 1
	ld [$FF00+$BB], a
	call UnknownCall_2CF4
	xor a
	ld [$A246], a
	call UnknownCall_2FED
	ld a, [$A246]
	and a
	jr nz, UnknownRJump_32BD
	pop hl
	ret

UnknownRJump_32BD:
	pop hl
	xor a
	ld [hl], a
	ret

UnknownCall_32C1:
	ld a, [$FF00+$81]
	bit 4, a
	ret z
	ld a, [$A216]
	cp 3
	ret nz
	ld a, [$A291]
	and a
	ret nz
	ld a, [$A24F]
	and a
	ret nz
	ld hl, $A880

UnknownRJump_32D9:
	ld a, [hl]
	and a
	jr z, UnknownRJump_32E7
	ld bc, $0010
	add bc
	ld a, l
	cp 160
	jr nz, UnknownRJump_32D9
	ret

UnknownRJump_32E7:
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
	ld a, [$A22B]
	ld [hl], a
	ld a, [$A268]
	and a
	jr z, UnknownRJump_330E
	ld a, [$FF00+$97]
	and $02
	dec a
	ld [hl], a

UnknownRJump_330E:
	inc hl
	xor a
	ld [hl], a
	ld a, 8
	ld [$A25A], a
	ld a, 11
	ld [$A460], a
	ret

UnknownCall_331C:
	ld hl, $A880

UnknownRJump_331F:
	ld a, [hl]
	and a
	call nz, UnknownCall_332E
	ld bc, $0010
	add bc
	ld a, l
	cp 160
	jr nz, UnknownRJump_331F
	ret

UnknownCall_332E:
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
	cp 128
	jr nc, UnknownRJump_336E
	inc b
	ld a, [$A25F]
	add b
	ld [$A25F], a
	ld [$FF00+$B9], a
	ld a, [$A260]
	adc 0
	ld [$A260], a
	ld [$FF00+$BA], a
	jr UnknownRJump_3386

UnknownRJump_336E:
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

UnknownRJump_3386:
	call UnknownCall_1EFA
	cp 56
	jp c, UnknownJump_3415
	ld a, [$A259]
	ld c, a
	ld hl, $3439
	ld b, 0
	add bc
	ld a, [hl]
	ld b, a
	ld a, c
	cp 12
	jr c, UnknownRJump_33B4
	ld a, [$A25D]
	sub b
	ld [$A25D], a
	ld [$FF00+$B7], a
	ld a, [$A25E]
	sbc 0
	ld [$A25E], a
	ld [$FF00+$B8], a
	jr UnknownRJump_33C7

UnknownRJump_33B4:
	ld a, [$A25D]
	add b
	ld [$A25D], a
	ld [$FF00+$B7], a
	ld a, [$A25E]
	adc 0
	ld [$A25E], a
	ld [$FF00+$B8], a

UnknownRJump_33C7:
	call UnknownCall_1EFA
	cp 72
	jr nc, UnknownRJump_33F1
	ld a, [$A259]
	cp 12
	jr nc, UnknownRJump_33F1
	ld a, [$A20D]
	cp 6
	jr z, UnknownRJump_341C
	ld a, 24
	ld [$A259], a
	ld a, [$A25D]
	sub 3
	ld [$A25D], a
	ld a, [$A25E]
	sbc 0
	ld [$A25E], a

UnknownRJump_33F1:
	ld a, [$A259]
	and a
	jr z, UnknownRJump_33FB
	dec a
	ld [$A259], a

UnknownRJump_33FB:
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

UnknownJump_3415:
	ld a, [$A20D]
	cp 6
	jr nz, UnknownRJump_3430

UnknownRJump_341C:
	ld a, 1
	ld [$A478], a
	ld b, 1
	ld a, 2
	ld [$A460], a
	call UnknownCall_2C6C
	ld a, 255
	ld [$A220], a

UnknownRJump_3430:
	pop hl
	xor a
	ld [hl], a
	ld a, 2
	ld [$A460], a
	ret

UnknownData_3439:
INCBIN "baserom.gb", $3439, $3451 - $3439


UnknownCall_3451:
	ld a, [$A26C]
	and a
	ret z
	cp 1
	jr nz, UnknownRJump_3467
	ld a, 1
	ld [$A216], a
	ld a, 20
	ld [$A470], a
	jp UnknownJump_3534

UnknownRJump_3467:
	cp 2
	jr nz, UnknownRJump_3478
	ld a, 3
	ld [$A216], a
	ld a, 20
	ld [$A470], a
	jp UnknownJump_3534

UnknownRJump_3478:
	cp 3
	jr nz, UnknownRJump_3489
	ld a, 2
	ld [$A216], a
	ld a, 20
	ld [$A470], a
	jp UnknownJump_3534

UnknownRJump_3489:
	cp 4
	jr nz, UnknownRJump_34AF
	ld a, [$A271]
	ld b, a
	ld a, [$A272]
	xor $FF
	or b
	jr nz, UnknownRJump_349D
	xor a
	ld [$A279], a

UnknownRJump_349D:
	ld a, 4
	ld [$A271], a
	ld a, 64
	ld [$A272], a
	ld a, 4
	ld [$A468], a
	jp UnknownJump_3539

UnknownRJump_34AF:
	cp 5
	jr nz, UnknownRJump_34C9
	ld a, 9
	ld [$A460], a
	ld a, [$A22C]
	inc a
	daa
	ld [$A22C], a
	jr nz, UnknownRJump_3539

UnknownData_34C2:
INCBIN "baserom.gb", $34C2, $34C9 - $34C2


UnknownRJump_34C9:
	cp 7
	jr nz, UnknownRJump_34D9
	ld a, 21
	ld [$A460], a
	ld a, 255
	ld [$A2A0], a
	jr UnknownRJump_3539

UnknownRJump_34D9:
	cp 8
	jr nz, UnknownRJump_34EC
	ld a, 20
	ld [$A470], a
	ld a, [$A287]
	set 4, a
	ld [$A287], a
	jr UnknownRJump_3539

UnknownRJump_34EC:
	cp 6
	jr nz, UnknownRJump_350A
	ld a, 12
	ld [$A460], a
	ld [$A24F], a
	xor a
	ld [$A53F], a
	ld a, [$A201]
	cp 24
	jr nc, UnknownRJump_3539
	ld a, 24
	ld [$A201], a
	jr UnknownRJump_3539

UnknownRJump_350A:
	cp 9
	jr nz, UnknownRJump_3539
	ld a, 7
	ld [$A460], a
	ld a, [$A262]
	add 80
	daa
	ld [$A262], a
	ld a, [$A263]
	adc 0
	ld [$A263], a
	cp 10
	jr c, UnknownRJump_3539
	ld a, 153
	ld [$A262], a
	ld a, 9
	ld [$A263], a
	jr UnknownRJump_3539

UnknownJump_3534:
	ld a, 64
	ld [$A217], a

UnknownJump_3539:
UnknownRJump_3539:
	xor a
	ld [$A26C], a
	ret
	xor a
	ld [$A216], a
	ld a, 20
	ld [$FF00+$9B], a
	ret
	ld a, [$A266]
	ld b, a
	ld a, [$A267]
	or b
	jr z, UnknownRJump_3558

UnknownRJump_3551:
	ld a, [$FF00+$44]
	cp 80
	jr nc, UnknownRJump_3551
	ret

UnknownRJump_3558:
	ld a, [$A27D]
	bit 7, a
	jr nz, UnknownRJump_356E
	ld a, [$A2B4]
	and a
	jr nz, UnknownRJump_356E
	ld a, [$A2C5]
	add 1
	daa
	ld [$A2C5], a

UnknownRJump_356E:
	ld a, 20
	ld [$FF00+$9B], a
	ret
	ld a, [$A269]
	cp 255
	jr nz, UnknownRJump_357F
	ld a, 27
	ld [$FF00+$9B], a
	ret

UnknownRJump_357F:
	ld a, [$A2E4]
	cp 1
	jr z, UnknownRJump_358B
	ld a, 11
	ld [$FF00+$9B], a
	ret

UnknownRJump_358B:
	ld a, 208
	ld [$A27F], a
	call UnknownCall_0348
	ld a, 26
	ld [$A24E], a
	ld [$2100], a
	ld hl, $4656
	ld bc, $0300
	ld de, $8800
	call UnknownCall_0336
	call UnknownCall_2D41
	ld a, 224
	ld [$A27E], a
	ld a, 210
	ld [$A27F], a
	ld a, 57
	ld [$A280], a
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
	call UnknownCall_2CF4
	ld a, [$A266]
	ld b, a
	ld a, [$A267]
	or b
	ret nz
	ld a, 11
	ld [$FF00+$9B], a
	ret

UnknownData_35EA:
INCBIN "baserom.gb", $35EA, $3735 - $35EA


UnknownCall_3735:
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

UnknownCall_3753:
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

UnknownData_377B:
INCBIN "baserom.gb", $377B, $3873 - $377B


UnknownCall_3873:
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
	ld a, 29
	ld [$2100], a
	ld a, [$A298]
	cp b
	ret c
	xor a
	ld [$A298], a
	ld b, 0
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

UnknownRJump_38B2:
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, UnknownRJump_38B2
	ret

UnknownCall_38B9:
	ld a, [$A2CE]
	and $F0
	jr nz, UnknownRJump_3911
	ld a, [$A2CE]
	and $0F
	jr nz, UnknownRJump_38C8
	ret

UnknownRJump_38C8:
	ld a, [$FF00+$81]
	and $08
	jr z, UnknownRJump_38E5

UnknownJump_38CE:
	ld a, 4
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_002D
	ld a, [$A0F0]
	inc a
	and $03
	ld [$A0F0], a
	jp UnknownJump_01E5

UnknownRJump_38E5:
	ld a, 5
	ld [$2100], a
	ld a, [$A2D0]
	ld [$FF00+$80], a
	ld h, 163
	ld a, [$A2CF]
	ld l, a

UnknownRJump_38F5:
	ld a, [hli]
	cp 255
	jp z, UnknownJump_38CE
	ld b, a
	ld a, [hli]
	sub 1
	jr c, UnknownRJump_38F5
	dec hl
	ld [hld], a
	ld a, [$FF00+$80]
	xor b
	and b
	ld [$FF00+$81], a
	ld a, b
	ld [$FF00+$80], a
	ld a, l
	ld [$A2CF], a
	ret

UnknownRJump_3911:
UnknownData_3911:
INCBIN "baserom.gb", $3911, $3A00 - $3911


UnknownCall_3A00:
	ld a, 3
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_2C31
	ld a, 2
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_3A14:
	ld a, 25
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_2000
	ld a, 2
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_3A28:
	ld a, 3
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_2C40
	ld a, 2
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownData_3A3C:
INCBIN "baserom.gb", $3A3C, $3A50 - $3A3C


UnknownCall_3A50:
	ld a, 22
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0000
	ld a, 2
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_3A64:
	ld a, 22
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_3D3D
	ld a, 2
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_3A78:
	ld a, 22
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_331D
	ld a, 2
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_3A8C:
	ld a, 2
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_05AA
	ld a, 22
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_3AA0:
	ld a, 2
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_063C
	ld a, 22
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_3AB4:
	ld a, 2
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_05DC
	ld a, 22
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownData_3AC8:
INCBIN "baserom.gb", $3AC8, $3ADC - $3AC8


UnknownCall_3ADC:
	ld a, 2
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_05FC
	ld a, 22
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_3AF0:
	ld a, 2
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_03EC
	ld a, 22
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_3B04:
	ld a, 2
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0403
	ld a, 22
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_3B18:
	ld a, 2
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0318
	ld a, 22
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_3B2C:
	ld a, 2
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0338
	ld a, 22
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_3B40:
	ld a, 2
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0358
	ld a, 22
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_3B54:
	ld a, 2
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0381
	ld a, 22
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_3B68:
	ld a, 2
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0394
	ld a, 22
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_3B7C:
	ld a, 2
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_03B0
	ld a, 22
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_3B90:
	ld a, 2
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_03D0
	ld a, 22
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_3BA4:
	ld a, 2
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_041A
	ld a, 22
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_3BB8:
	ld a, 2
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_043C
	ld a, 22
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_3BCC:
	ld a, 2
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0462
	ld a, 22
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_3BE0:
	ld a, 2
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0484
	ld a, 22
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_3BF4:
	ld a, 2
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_04A6
	ld a, 22
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_3C08:
	ld a, 2
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_04C8
	ld a, 22
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_3C1C:
	ld a, 2
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_04EA
	ld a, 22
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_3C30:
	ld a, 2
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0510
	ld a, 22
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_3C44:
	ld a, 2
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0532
	ld a, 22
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_3C58:
	ld a, 2
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0554
	ld a, 22
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_3C6C:
	ld a, 22
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_32D7
	ld a, 2
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_3C80:
	ld a, 3
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_0000
	ld a, 2
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_3C94:
	ld a, 2
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_0D9C

UnknownCall_3C9F:
	ld a, 2
	ld [$A24E], a
	ld [$2100], a
	jp UnknownJump_0DA9

UnknownRJump_3CAA:
UnknownCall_3CAA:
	ld a, [hli]
	ld [de], a
	inc e
	dec b
	jr nz, UnknownRJump_3CAA
	ret

UnknownCall_3CB1:
	ld a, [$FFDD]
	bit 5, a
	ld a, 1
	jr z, UnknownRJump_3CBC
	ld a, 2

UnknownRJump_3CBC:
	ld [$FFDF], a
	ret

UnknownCall_3CC0:
	ld a, [$FFE7]
	bit 6, a
	ret z
	ld hl, $FFC2
	ld a, [$A200]
	cp 128
	jr c, UnknownRJump_3CD7
	ld a, [$A235]
	add b
	ld [$A235], a

UnknownRJump_3CD7:
	ld a, [hl]
	add b
	ld [hli], a
	ld a, [hl]
	adc 0
	ld [hl], a
	ret

UnknownCall_3CDF:
	ld a, [$FFE7]
	bit 6, a
	ret z
	ld a, [$A238]
	add b
	ld [$A238], a
	ld hl, $FFC0
	jr UnknownRJump_3CD7

UnknownCall_3CF1:
	ld a, [$FFE7]
	bit 6, a
	ret z
	ld hl, $FFC2
	ld a, [$A200]
	cp 129
	jr nc, UnknownRJump_3D08
	ld a, [$A236]
	add b
	ld [$A236], a

UnknownRJump_3D08:
	ld a, [hl]
	sub b
	ld [hli], a
	ld a, [hl]
	sbc 0
	ld [hl], a
	ret

UnknownCall_3D10:
	ld a, [$FFE7]
	bit 6, a
	ret z
	ld a, [$A237]
	add b
	ld [$A237], a
	ld hl, $FFC0
	jr UnknownRJump_3D08

UnknownCall_3D22:
	ld hl, $FFD1

UnknownRJump_3D25:
	ld a, [hl]
	sub b
	ld [hld], a
	ld a, [hl]
	sbc 0
	ld [hl], a
	ret

UnknownCall_3D2D:
	ld hl, $FFD4
	jr UnknownRJump_3D25

UnknownCall_3D32:
	ld hl, $FFD1

UnknownRJump_3D35:
	ld a, [hl]
	add b
	ld [hld], a
	ld a, [hl]
	adc 0
	ld [hl], a
	ret

UnknownCall_3D3D:
	ld hl, $FFD4
	jr UnknownRJump_3D35

UnknownData_3D42:
INCBIN "baserom.gb", $3D42, $3E00 - $3D42


UnknownCall_3E00:
	ld [$A24E], a
	ld [$3000], a
	jp [hl]

UnknownJump_3E07:
	ld a, 15
	ld [$A24E], a
	ld [$3000], a
	ret

UnknownCall_3E10:
	di
	ld [$A24E], a
	ld [$3000], a
	ld a, [hl]
	ld [bc], a
	ld a, 15
	ld [$A24E], a
	ld [$3000], a
	ret

UnknownCall_3E22:
	di
	ld [$A24E], a
	ld [$3000], a
	ld a, [hli]
	ld [bc], a
	ld a, 15
	ld [$A24E], a
	ld [$3000], a
	ret

UnknownCall_3E34:
	di
	ld [$A24E], a
	ld [$3000], a
	ld a, [hl]
	ld [de], a
	ld a, 15
	ld [$A24E], a
	ld [$3000], a
	ret

UnknownCall_3E46:
	ld hl, $A100

UnknownRJump_3E49:
	xor a
	ld [hli], a
	ld a, l
	cp 160
	jr c, UnknownRJump_3E49
	ret

UnknownCall_3E51:
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

UnknownJump_3E73:
	ld a, 1
	ld [$A785], a
	jp UnknownJump_2AFF

UnknownCall_3E7B:
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

UnknownCall_3E8F:
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

UnknownCall_3EA4:
	ld a, 16
	ld [$A24E], a
	ld [$3000], a
	ld de, $88E0
	ld c, 32

UnknownRJump_3EB1:
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, UnknownRJump_3EB1
	ld de, $89E0
	ld c, 32

UnknownRJump_3EBC:
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, UnknownRJump_3EBC
	ld a, 15
	ld [$A24E], a
	ld [$3000], a
	ret

UnknownCall_3ECB:
	ld a, 14
	ld [$A24E], a
	ld [$3000], a
	ld de, $8820
	ld c, 32

UnknownRJump_3ED8:
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, UnknownRJump_3ED8
	ld de, $8920
	ld c, 32

UnknownRJump_3EE3:
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, UnknownRJump_3EE3
	ld a, 15
	ld [$A24E], a
	ld [$3000], a
	ret

UnknownCall_3EF2:
	ld a, 14
	ld [$A24E], a
	ld [$3000], a
	ld de, $9000
	ld c, 32

UnknownRJump_3EFF:
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, UnknownRJump_3EFF
	ld a, 15
	ld [$A24E], a
	ld [$3000], a
	ret

UnknownCall_3F0E:
	ld a, 25
	ld [$A24E], a
	ld [$3000], a
	ld b, 16

UnknownRJump_3F18:
	ld a, [hli]
	push hl
	ld hl, $FF41

UnknownRJump_3F1D:
	bit 4, [hl]
	jr nz, UnknownRJump_3F1D
	pop hl
	ld [de], a
	inc de
	dec b
	jr nz, UnknownRJump_3F18
	ld a, 24
	ld [$A24E], a
	ld [$3000], a
	ret

UnknownCall_3F30:
	ld a, 1
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_1297
	ld a, 15
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_3F44:
	ld a, 1
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_1297
	ld a, 24
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_3F58:
	ld a, 6
	ld [$A24E], a
	ld [$2100], a
	ld bc, $0800
	ld hl, $4000
	ld de, $8000
	call UnknownCall_0336
	ld a, 15
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownCall_3F75:
	push af
	ld a, 24
	ld [$A24E], a
	ld [$2100], a
	ld hl, $62E6
	call UnknownCall_109B
	ld a, 15
	ld [$A24E], a
	ld [$2100], a
	pop af
	ret

UnknownCall_3F8E:
	push af
	ld a, 24
	ld [$A24E], a
	ld [$2100], a
	call UnknownCall_1147
	ld a, 15
	ld [$A24E], a
	ld [$2100], a
	pop af
	ret

UnknownCall_3FA4:
	ld a, 14
	ld [$A24E], a
	ld [$2100], a

UnknownRJump_3FAC:
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, UnknownRJump_3FAC
	ld a, 15
	ld [$A24E], a
	ld [$2100], a
	ret

UnknownData_3FBD:
INCBIN "baserom.gb", $3FBD, $4000 - $3FBD



SECTION "bank01", ROMX, BANK[$01]


UnknownData_4000:
INCBIN "baserom.gb", $4000, $5267 - $4000

	ld a, [$FF00+$C6]
	swap a
	and $0F
	add 128
	call UnknownCall_527C

UnknownCall_5272:
	ld a, [$FF00+$C6]
	and $0F
	add 128
	call UnknownCall_527C
	ret

UnknownCall_527C:
	ld [$FF00+$98], a
	ld h, 161
	ld a, [$FF00+$8D]
	ld l, a
	ld a, [$FF00+$C4]
	ld [hli], a
	ld a, [$FF00+$C5]
	ld [hli], a
	add 8
	ld [$FF00+$C5], a
	ld a, [$FF00+$98]
	ld [hli], a
	ld a, [$FF00+$C7]
	ld [hli], a
	ld a, l
	ld [$FF00+$8D], a
	ret

UnknownCall_5297:
	ld a, 1
	ld [$A24E], a
	ld [$2100], a
	ld a, [$FF00+$C6]
	ld d, 0
	ld e, a
	sla e
	rl d
	ld hl, $4000
	add de
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	ld h, 161
	ld a, [$FF00+$8D]
	ld l, a
	ld a, [$FF00+$C4]
	ld b, a
	ld a, [$FF00+$C5]
	ld c, a

UnknownRJump_52BB:
	ld a, [de]
	cp 128
	jr z, UnknownRJump_52E6
	add b
	ld [hli], a
	inc de
	ld a, [de]
	add c
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [$FF00+$C7]
	and a
	jr z, UnknownRJump_52D4
	ld a, [de]
	set 4, a
	jr UnknownRJump_52D5

UnknownRJump_52D4:
	ld a, [de]

UnknownRJump_52D5:
	ld [hl], a
	ld a, [$FF00+$BB]
	and a
	jr nz, UnknownRJump_52DF
	ld a, [hl]
	set 7, a
	ld [hl], a

UnknownRJump_52DF:
	inc hl
	ld a, l
	ld [$FF00+$8D], a
	inc de
	jr UnknownRJump_52BB

UnknownRJump_52E6:
	ret
	ld a, [$FF00+$8D]
	ld b, a
	ld a, [$A26E]
	ld c, a
	cp b
	jr c, UnknownRJump_52FC
	ld h, 161
	ld a, [$FF00+$8D]
	ld l, a

UnknownRJump_52F6:
	xor a
	ld [hli], a
	ld a, l
	cp c
	jr c, UnknownRJump_52F6

UnknownRJump_52FC:
	ld a, [$FF00+$8D]
	ld [$A26E], a
	ret
	ld hl, $A100

UnknownRJump_5305:
	xor a
	ld [hli], a
	ld a, l
	cp 160
	jr c, UnknownRJump_5305
	ret
	ld a, 1
	ld [$FF00+$BB], a
	ld a, [$A221]
	cp 16
	jr c, UnknownRJump_532D
	xor a
	ld [$FF00+$BB], a
	ld a, 16
	ld [$FF00+$C6], a
	ld a, [$A221]
	cp 48
	jp c, UnknownJump_5447
	jp z, UnknownJump_53AD
	jp UnknownJump_5426

UnknownRJump_532D:
	ld a, [$A268]
	and a
	jr z, UnknownRJump_534C
	ld hl, $5348
	ld a, [$FF00+$97]
	and $0C
	srl a
	srl a
	ld e, a
	ld d, 0
	add de
	ld a, [hl]
	ld [$FF00+$C6], a
	jp UnknownJump_5447

UnknownData_5348:
INCBIN "baserom.gb", $5348, $534C - $5348


UnknownRJump_534C:
	ld a, [$A22B]
	cp 1
	jp nz, UnknownJump_53CF
	ld a, [$A287]
	bit 4, a
	jr z, UnknownRJump_5377
	ld a, [$A214]
	and a
	jr nz, UnknownRJump_5377
	ld a, 18
	ld [$FF00+$C6], a
	ld a, [$A285]
	and a
	jp z, UnknownJump_5447
	dec a
	ld [$A285], a
	ld a, 19
	ld [$FF00+$C6], a
	jp UnknownJump_5447

UnknownRJump_5377:
	ld a, [$A291]
	and a
	jr z, UnknownRJump_5384
	ld a, 14
	ld [$FF00+$C6], a
	jp UnknownJump_5447

UnknownRJump_5384:
	ld a, [$A214]
	ld b, a
	ld a, [$A26B]
	or b
	jr z, UnknownRJump_53BD
	ld a, [$A200]
	cp 128
	jr nc, UnknownRJump_53A1
	ld a, 13
	ld [$FF00+$C6], a
	ld a, 4
	ld [$A460], a
	jp UnknownJump_5447

UnknownRJump_53A1:
	ld a, 0
	ld [$FF00+$C6], a
	ld a, [$A200]
	cp 128
	jp z, UnknownJump_5447

UnknownJump_53AD:
	ld a, [$A222]
	and $0C
	srl a
	srl a
	add 1
	ld [$FF00+$C6], a
	jp UnknownJump_5447

UnknownRJump_53BD:
	ld a, 8
	ld [$FF00+$C6], a
	ld a, [$A215]
	and a
	jp nz, UnknownJump_5447
	ld a, 10
	ld [$FF00+$C6], a
	jp UnknownJump_5447

UnknownJump_53CF:
	ld a, [$A287]
	bit 4, a
	jr z, UnknownRJump_53F2
	ld a, [$A214]
	and a
	jr nz, UnknownRJump_53F2
	ld a, 20
	ld [$FF00+$C6], a
	ld a, [$A285]
	and a
	jp z, UnknownJump_5447
	dec a
	ld [$A285], a
	ld a, 21
	ld [$FF00+$C6], a
	jp UnknownJump_5447

UnknownRJump_53F2:
	ld a, [$A291]
	and a
	jr z, UnknownRJump_53FE
	ld a, 15
	ld [$FF00+$C6], a
	jr UnknownRJump_5447

UnknownRJump_53FE:
	ld a, [$A214]
	ld b, a
	ld a, [$A26B]
	or b
	jr z, UnknownRJump_5436
	ld a, [$A200]
	cp 129
	jr c, UnknownRJump_541A
	ld a, 12
	ld [$FF00+$C6], a
	ld a, 4
	ld [$A460], a
	jr UnknownRJump_5447

UnknownRJump_541A:
	ld a, 4
	ld [$FF00+$C6], a
	ld a, [$A200]
	cp 128
	jp z, UnknownJump_5447

UnknownJump_5426:
	ld a, [$A222]
	and $0C
	srl a
	srl a
	add 5
	ld [$FF00+$C6], a
	jp UnknownJump_5447

UnknownRJump_5436:
	ld a, 9
	ld [$FF00+$C6], a
	ld a, [$A215]
	and a
	jr nz, UnknownRJump_5447
	ld a, 11
	ld [$FF00+$C6], a
	jp UnknownJump_5447

UnknownJump_5447:
UnknownRJump_5447:
	ld a, [$A217]
	and a
	jr z, UnknownRJump_545D
	dec a
	ld [$A217], a
	bit 4, a
	jr z, UnknownRJump_546B
	ld a, [$FF00+$C6]
	add 32
	ld [$FF00+$C6], a
	jr UnknownRJump_54A7

UnknownRJump_545D:
	ld a, [$A216]
	and a
	jr nz, UnknownRJump_546B
	ld a, [$FF00+$C6]
	add 32
	ld [$FF00+$C6], a
	jr UnknownRJump_54A7

UnknownRJump_546B:
	ld a, [$A216]
	cp 2
	jr nz, UnknownRJump_548A
	ld a, [$FF00+$C6]
	add 69
	ld [$FF00+$C6], a
	ld a, [$A24D]
	and a
	jr z, UnknownRJump_54A7
	bit 4, a
	jr z, UnknownRJump_54A7
	ld a, [$FF00+$C6]
	add 26
	ld [$FF00+$C6], a
	jr UnknownRJump_54A7

UnknownRJump_548A:
	ld a, [$A216]
	cp 3
	jr nz, UnknownRJump_54A7
	ld a, [$FF00+$C6]
	add 112
	ld [$FF00+$C6], a
	ld a, [$A25A]
	and a
	jr z, UnknownRJump_54A7
	dec a
	ld [$A25A], a
	ld a, [$FF00+$C6]
	add 32
	ld [$FF00+$C6], a

UnknownRJump_54A7:
	ld a, [$FF00+$CA]
	ld b, a
	ld a, [$FF00+$C2]
	sub b
	add 96
	ld [$FF00+$C5], a
	ld [$A23C], a
	cp 96
	jr c, UnknownRJump_54BF
	ld a, 255
	ld [$A232], a
	jr UnknownRJump_54C8

UnknownRJump_54BF:
	cp 96
	jr nc, UnknownRJump_54C8
	ld a, 255
	ld [$A233], a

UnknownJump_54C8:
UnknownRJump_54C8:
	ld a, [$FF00+$C8]
	ld b, a
	ld a, [$FF00+$C0]
	sub b
	add 98
	ld [$FF00+$C4], a
	ld [$A23B], a
	xor a
	ld [$FF00+$C7], a
	ld a, [$A271]
	and a
	jr z, UnknownRJump_54E9
	ld a, [$A272]
	bit 4, a
	jr z, UnknownRJump_54E9
	ld a, 1
	ld [$FF00+$C7], a

UnknownRJump_54E9:
	ld a, [$A2B3]
	and a
	jr z, UnknownRJump_54FB
	dec a
	ld [$A2B3], a
	and $03
	ld b, a
	ld a, [$FF00+$C4]
	sub b
	ld [$FF00+$C4], a

UnknownRJump_54FB:
	call UnknownCall_5297
	xor a
	ld [$FF00+$C7], a
	ld [$FF00+$BB], a
	ld a, [$A287]
	bit 4, a
	jr z, UnknownRJump_551E
	ld a, 1
	ld [$FF00+$BB], a
	ld a, [$FF00+$97]
	and $10
	swap a
	add 220
	ld [$FF00+$C6], a
	call UnknownCall_5297
	xor a
	ld [$FF00+$BB], a

UnknownRJump_551E:
	ld a, [$A27A]
	and a
	ret z
	dec a
	ld [$A27A], a
	srl a
	ld b, a
	ld a, [$FF00+$C4]
	sub 32
	add b
	ld [$FF00+$C4], a
	ld a, [$FF00+$C5]
	sub 4
	ld [$FF00+$C5], a
	ld a, 1
	ld [$FF00+$BB], a
	ld a, [$A279]
	cp 5
	jr nc, UnknownRJump_5548
	ld [$FF00+$C6], a
	call UnknownCall_5272
	ret

UnknownRJump_5548:
	ld a, 190
	ld [$FF00+$C6], a
	call UnknownCall_5297
	ret
	ld a, [$FF00+$C8]
	ld b, a
	ld a, [$FF00+$C0]
	sub b
	add 98
	ld [$FF00+$C4], a
	ld [$A23B], a
	and $E0
	cp 224
	ret z
	ld a, [$FF00+$CA]
	ld b, a
	ld a, [$FF00+$C2]
	sub b
	add 96
	ld [$FF00+$C5], a
	ld [$A23C], a
	ld a, 107
	ld [$FF00+$C6], a
	xor a
	ld [$FF00+$C7], a
	jp UnknownJump_54C8
	xor a
	ld [$A2A0], a
	ld a, [$A27D]
	bit 6, a
	jr z, UnknownRJump_5589
	ld a, 255
	ld [$A2A0], a

UnknownRJump_5589:
	ld hl, $55CB
	ld a, [$A269]
	ld e, a
	ld d, 0
	add de
	add de
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld h, a
	ld a, e
	ld l, a
	ld de, $A800
	ld b, 20

UnknownRJump_559F:
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, UnknownRJump_559F
	ld a, [$A2A0]
	and a
	jr z, UnknownRJump_55C6
	ld hl, $377B
	ld a, [$A269]
	sla a
	sla a
	sla a
	ld e, a
	ld d, 0
	add de
	ld de, $A800
	ld b, 8

UnknownRJump_55C0:
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, UnknownRJump_55C0

UnknownRJump_55C6:
	ld a, 2
	ld [$FF00+$9B], a
	ret

UnknownData_55CB:
INCBIN "baserom.gb", $55CB, $591F - $55CB

	ld a, [$A262]
	inc a
	daa
	ld [$A262], a
	ld a, [$A263]
	adc 0
	ld [$A263], a
	cp 10
	jr c, UnknownRJump_593D

UnknownData_5933:
INCBIN "baserom.gb", $5933, $593D - $5933


UnknownRJump_593D:
	ld a, [$FF00+$C2]
	add 16
	ld [$FF00+$B9], a
	ld a, [$FF00+$C3]
	adc 0
	ld [$FF00+$BA], a
	ld c, 8
	ld a, [$A216]
	and a
	jr nz, UnknownRJump_5955
	ld a, 10
	add c
	ld c, a

UnknownRJump_5955:
	ld a, [$FF00+$C0]
	add c
	ld [$FF00+$B7], a
	ld a, [$FF00+$C1]
	adc 0
	ld [$FF00+$B8], a
	ld hl, $AA80

UnknownRJump_5963:
	ld a, [hl]
	and a
	jr z, UnknownRJump_5970
	ld a, l
	add 16
	ld l, a
	cp 0
	ret z
	jr UnknownRJump_5963

UnknownRJump_5970:
	ld a, b
	ld [hl], a
	ld [$A23E], a
	inc hl
	ld a, 1
	ld [hli], a
	ld a, [$FF00+$B7]
	and $F0
	add 8
	ld [hli], a
	ld a, [$FF00+$B8]
	ld [hli], a
	inc hl
	ld a, [$FF00+$B9]
	add 8
	ld b, a
	ld a, [$FF00+$BA]
	adc 0
	ld [hld], a
	ld a, b
	and $F0
	ld [hli], a
	inc hl
	call UnknownCall_2F72
	ret
	ld hl, $AA80

UnknownJump_599A:
	push hl
	ld a, [hli]
	ld [$A23E], a
	and a
	jr z, UnknownRJump_59DF
	ld a, [hl]
	inc a
	ld [$A23F], a
	ld [hli], a
	ld a, [hli]
	ld [$A240], a
	ld [$FF00+$B7], a
	ld a, [hli]
	ld [$A241], a
	ld [$FF00+$B8], a
	ld a, [hli]
	ld [$A242], a
	ld [$FF00+$B9], a
	ld a, [hl]
	ld [$A243], a
	ld [$FF00+$BA], a
	ld a, [$A23E]
	cp 1
	jr z, UnknownRJump_59EB
	cp 2
	jp z, UnknownJump_5B70
	cp 3
	jp z, UnknownJump_5B06
	cp 4
	jp z, UnknownJump_5A9E
	cp 5
	jr z, UnknownRJump_59FA

UnknownData_59DA:
INCBIN "baserom.gb", $59DA, $59DF - $59DA


UnknownJump_59DF:
UnknownRJump_59DF:
	pop hl
	ld a, l
	and $F0
	add 16
	ld l, a
	and a
	jp nz, UnknownJump_599A
	ret

UnknownRJump_59EB:
	ld a, [$A23F]
	cp 2
	jp z, UnknownJump_5A72
	cp 40
	jp z, UnknownJump_5A82
	jr UnknownRJump_5A07

UnknownRJump_59FA:
	ld a, [$A23F]
	cp 2
	jp z, UnknownJump_5A7A
	cp 40
	jp z, UnknownJump_5A90

UnknownRJump_5A07:
	ld hl, $5A4A
	ld e, a
	ld d, 0
	add de
	ld a, [hl]
	ld c, a
	ld a, [$A2B0]
	ld b, a
	ld a, [$FF00+$B7]
	sub b
	add c
	ld [$FF00+$C4], a
	ld a, [$A23F]
	ld c, a
	ld a, [$A2B1]
	ld b, a
	ld a, [$FF00+$B9]
	sub b
	sub c
	ld [$FF00+$C5], a
	ld a, 101
	ld [$FF00+$C6], a
	ld a, 1
	ld [$FF00+$BB], a
	call UnknownCall_5297
	ld a, [$A23F]
	ld c, a
	ld a, [$A2B1]
	ld b, a
	ld a, [$FF00+$B9]
	sub b
	add c
	ld [$FF00+$C5], a
	ld a, 102
	ld [$FF00+$C6], a
	call UnknownCall_5297
	jr UnknownRJump_59DF

UnknownData_5A4A:
INCBIN "baserom.gb", $5A4A, $5A72 - $5A4A


UnknownJump_5A72:
	ld a, 96
	call UnknownCall_5CF1
	jp UnknownJump_5C01

UnknownJump_5A7A:
	ld a, 127
	call UnknownCall_5CF1
	jp UnknownJump_5C2C

UnknownJump_5A82:
	ld a, l
	and $F0
	ld l, a
	xor a
	ld [hl], a
	ld a, 96
	call UnknownCall_5CF1
	jp UnknownJump_59DF

UnknownJump_5A90:
	ld a, l
	and $F0
	ld l, a
	xor a
	ld [hl], a
	ld a, 127
	call UnknownCall_5CF1
	jp UnknownJump_59DF

UnknownJump_5A9E:
	ld a, [$A23F]
	cp 50
	jr z, UnknownRJump_5AFD
	ld hl, $5AE0
	srl a
	ld e, a
	ld d, 0
	add de
	ld a, [hl]
	ld c, a
	ld a, [$A2B0]
	ld b, a
	ld a, [$FF00+$B7]
	sub b
	add c
	ld [$FF00+$C4], a
	ld a, [$A2B1]
	ld b, a
	ld a, [$FF00+$B9]
	sub b
	ld [$FF00+$C5], a
	ld hl, $5AF9
	ld a, [$A23F]
	and $0C
	srl a
	srl a
	ld e, a
	ld d, 0
	add de
	ld a, [hl]
	ld [$FF00+$C6], a
	ld a, 1
	ld [$FF00+$BB], a
	call UnknownCall_5297
	jp UnknownJump_59DF

UnknownData_5AE0:
INCBIN "baserom.gb", $5AE0, $5AFD - $5AE0


UnknownRJump_5AFD:
	ld a, l
	and $F0
	ld l, a
	xor a
	ld [hl], a
	jp UnknownJump_59DF

UnknownJump_5B06:
	ld a, [$A23F]
	cp 2
	jp z, UnknownJump_5BFC
	cp 8
	jr z, UnknownRJump_5B3C
	ld hl, $5BB4
	ld e, a
	ld d, 0
	add de
	ld a, [hl]
	ld c, a
	ld a, [$A2B0]
	ld b, a
	ld a, [$FF00+$B7]
	sub b
	add c
	ld [$FF00+$C4], a
	ld a, [$A2B1]
	ld b, a
	ld a, [$FF00+$B9]
	sub b
	ld [$FF00+$C5], a
	ld a, 66
	ld [$FF00+$C6], a
	ld a, 1
	ld [$FF00+$BB], a
	call UnknownCall_5297
	jp UnknownJump_59DF

UnknownRJump_5B3C:
	ld a, l
	and $F0
	ld l, a
	xor a
	ld [hl], a
	ld a, 7
	call UnknownCall_5CF1
	call UnknownCall_200C
	ld a, [$A205]
	and $DE
	ld l, a
	ld a, [$A206]
	ld h, a
	ld de, $001F

UnknownRJump_5B57:
	ld a, [$FF00+$41]
	and $03
	jr nz, UnknownRJump_5B57

UnknownRJump_5B5D:
	ld a, [$FF00+$41]
	and $03
	jr nz, UnknownRJump_5B5D
	ld a, 248
	ld [hli], a
	inc a
	ld [hl], a
	add de
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	jp UnknownJump_59DF

UnknownJump_5B70:
	ld a, [$A23F]
	cp 2
	jp z, UnknownJump_5BFC
	cp 8
	jr z, UnknownRJump_5BBC
	jr UnknownRJump_5B8A

UnknownData_5B7E:
INCBIN "baserom.gb", $5B7E, $5B8A - $5B7E


UnknownRJump_5B8A:
	ld hl, $5BB4
	ld e, a
	ld d, 0
	add de
	ld a, [hl]
	ld c, a
	ld a, [$A2B0]
	ld b, a
	ld a, [$FF00+$B7]
	sub b
	add c
	ld [$FF00+$C4], a
	ld a, [$A2B1]
	ld b, a
	ld a, [$FF00+$B9]
	sub b
	ld [$FF00+$C5], a
	ld a, 66
	ld [$FF00+$C6], a
	ld a, 1
	ld [$FF00+$BB], a
	call UnknownCall_5297
	jp UnknownJump_59DF

UnknownData_5BB4:
INCBIN "baserom.gb", $5BB4, $5BBC - $5BB4


UnknownRJump_5BBC:
	ld a, l
	and $F0
	ld l, a
	xor a
	ld [hl], a
	xor a
	call UnknownCall_5CF1
	jr UnknownRJump_5BD3

UnknownData_5BC8:
INCBIN "baserom.gb", $5BC8, $5BD3 - $5BC8


UnknownRJump_5BD3:
	call UnknownCall_200C
	ld a, [$A205]
	and $DE
	ld l, a
	ld a, [$A206]
	ld h, a
	ld de, $001F

UnknownRJump_5BE3:
	ld a, [$FF00+$41]
	and $03
	jr nz, UnknownRJump_5BE3

UnknownRJump_5BE9:
	ld a, [$FF00+$41]
	and $03
	jr nz, UnknownRJump_5BE9
	ld a, 244
	ld [hli], a
	inc a
	ld [hl], a
	add de
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	jp UnknownJump_59DF

UnknownJump_5BFC:
	ld a, 24
	call UnknownCall_5CF1

UnknownJump_5C01:
	call UnknownCall_200C
	ld a, [$A205]
	and $DE
	ld l, a
	ld a, [$A206]
	ld h, a
	ld de, $001F

UnknownRJump_5C11:
	ld a, [$FF00+$41]
	and $03
	jr nz, UnknownRJump_5C11

UnknownRJump_5C17:
	ld a, [$FF00+$41]
	and $03
	jr nz, UnknownRJump_5C17
	ld a, 255
	ld [hli], a
	ld [hl], a
	add de
	ld [hli], a
	ld [hl], a
	jp UnknownJump_59DF

UnknownData_5C27:
INCBIN "baserom.gb", $5C27, $5C2C - $5C27


UnknownJump_5C2C:
	call UnknownCall_200C
	ld a, [$A205]
	and $DE
	ld l, a
	ld a, [$A206]
	ld h, a
	ld de, $001F

UnknownRJump_5C3C:
	ld a, [$FF00+$41]
	and $03
	jr nz, UnknownRJump_5C3C

UnknownRJump_5C42:
	ld a, [$FF00+$41]
	and $03
	jr nz, UnknownRJump_5C42
	ld a, 127
	ld [hli], a
	ld [hl], a
	add de
	ld [hli], a
	ld [hl], a
	jp UnknownJump_59DF

UnknownData_5C52:
INCBIN "baserom.gb", $5C52, $5CF1 - $5C52


UnknownCall_5CF1:
	ld d, a
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
	ld a, d
	ld [hl], a
	ret
	xor a
	ld [$A238], a
	ld [$A237], a
	ld [$A28A], a
	ld a, [$FF00+$40]
	bit 5, a
	jr nz, UnknownRJump_5D39
	set 5, a
	ld [$FF00+$40], a

UnknownRJump_5D39:
	ld a, 136
	ld [$FF00+$4A], a
	ld a, [$A29B]
	and a
	call nz, UnknownCall_6442
	ld a, [$A271]
	and a
	jr z, UnknownRJump_5D6A
	ld a, [$A272]
	sub 1
	ld [$A272], a
	ld a, [$A271]
	sbc 0
	ld [$A271], a
	and a
	jr nz, UnknownRJump_5D6A
	ld a, [$A469]
	cp 9
	jr z, UnknownRJump_5D6A
	ld a, [$A292]
	ld [$A468], a

UnknownRJump_5D6A:
	ld a, [$A224]
	ld b, a
	ld a, [$A2E3]
	ld c, a
	ld a, [$A24F]
	or b
	or c
	jp nz, UnknownJump_5E12
	ld a, [$A24B]
	dec a
	ld [$A24B], a
	jp nz, UnknownJump_5E12
	ld a, 48
	ld [$A24B], a
	ld a, [$A254]
	sub 1
	daa
	ld [$A254], a
	ld a, [$A255]
	sbc 0
	daa
	ld [$A255], a
	jr nc, UnknownRJump_5DB4
	ld a, 128
	ld [$A224], a
	xor a
	ld [$A254], a
	ld [$A255], a
	ld a, 15
	ld [$A460], a
	xor a
	ld [$A53F], a
	jr UnknownRJump_5E12

UnknownRJump_5DB4:
	ld a, [$A255]
	and a
	jr nz, UnknownRJump_5DCB
	ld a, [$A254]
	cp 17
	jr nc, UnknownRJump_5DCB
	ld a, 14
	ld [$A470], a
	ld a, 1
	ld [$A53F], a

UnknownRJump_5DCB:
	ld a, [$A24F]
	and a
	jr nz, UnknownRJump_5E12
	ld a, [$A255]
	and a
	jr nz, UnknownRJump_5E03
	ld a, [$A469]
	and a
	jr nz, UnknownRJump_5E12
	ld a, [$A292]
	and $FC
	cp 32
	jr z, UnknownRJump_5DF9
	ld a, [$A292]
	ld [$A468], a
	ld a, [$A271]
	and a
	jr z, UnknownRJump_5E12

UnknownData_5DF2:
INCBIN "baserom.gb", $5DF2, $5DF9 - $5DF2


UnknownRJump_5DF9:
UnknownData_5DF9:
INCBIN "baserom.gb", $5DF9, $5E03 - $5DF9


UnknownRJump_5E03:
	cp 1
	jr nz, UnknownRJump_5E12
	ld a, [$A254]
	and a
	jr nz, UnknownRJump_5E12
	ld a, 9
	ld [$A468], a

UnknownJump_5E12:
UnknownRJump_5E12:
	ld a, [$A2DC]
	cp 3
	ret nz
	xor a
	ld [$FF00+$81], a
	ld a, 18
	ld [$FF00+$80], a
	ld a, [$FF00+$C2]
	and $FE
	cp 160
	ret c
	jr nz, UnknownRJump_5E31
	ld a, 1
	ld [$FF00+$81], a
	ld a, 17
	ld [$FF00+$80], a
	ret

UnknownRJump_5E31:
	xor a
	ld [$FF00+$81], a
	ld a, 17
	ld [$FF00+$80], a
	ld a, [$FF00+$C0]
	cp 224
	ret c
	ld a, 35
	ld [$FF00+$9B], a
	ret

UnknownData_5E42:
INCBIN "baserom.gb", $5E42, $6442 - $5E42


UnknownCall_6442:
UnknownData_6442:
INCBIN "baserom.gb", $6442, $6485 - $6442

	ld a, [$A2B6]
	and a
	ret z
	cp 1
	jr z, UnknownRJump_64F9
	ld a, [$FF00+$97]
	and $01
	jr nz, UnknownRJump_64CB
	ld a, [$A2B9]
	sub 2
	ld [$A2B9], a
	ld a, [$A2B8]
	sbc 0
	ld [$A2B8], a
	ld a, [$A2BB]
	add 16
	ld [$FF00+$B9], a
	ld a, [$A2BA]
	adc 0
	ld [$FF00+$BA], a
	ld a, [$A2B9]
	add 24
	ld [$FF00+$B7], a
	ld a, [$A2B8]
	adc 0
	ld [$FF00+$B8], a
	call UnknownCall_1EFA
	cp 82
	jr c, UnknownRJump_64F4
	cp 88
	jr nc, UnknownRJump_64F4

UnknownRJump_64CB:
	ld a, [$FF00+$CA]
	ld b, a
	ld a, [$A2BB]
	sub b
	add 96
	ld [$FF00+$C5], a
	ld a, [$FF00+$C8]
	ld b, a
	ld a, [$A2B9]
	sub b
	add 98
	ld [$FF00+$C4], a
	cp 16
	jr c, UnknownRJump_64F4
	xor a
	ld [$FF00+$C7], a
	ld a, 1
	ld [$FF00+$BB], a
	ld a, 200
	ld [$FF00+$C6], a
	call UnknownCall_5297
	ret

UnknownRJump_64F4:
	xor a
	ld [$A2B6], a
	ret

UnknownRJump_64F9:
	ld a, [$A2B7]
	inc a
	ld [$A2B7], a
	cp 16
	jr nc, UnknownRJump_64F4
	ld a, [$FF00+$CA]
	ld b, a
	ld a, [$A2BB]
	sub b
	add 96
	ld [$FF00+$C5], a
	ld a, [$FF00+$C8]
	ld b, a
	ld a, [$A2B9]
	sub b
	add 98
	ld [$FF00+$C4], a
	xor a
	ld [$FF00+$C7], a
	ld a, 1
	ld [$FF00+$BB], a
	ld a, 199
	ld [$FF00+$C6], a
	call UnknownCall_5297
	ret

UnknownData_6529:
INCBIN "baserom.gb", $6529, $8000 - $6529



SECTION "bank02", ROMX, BANK[$02]

	ld de, $0060
	ld a, [$FFCA]
	ld l, a
	sub e
	ld [$AF0D], a
	ld a, [$FFCB]
	ld h, a
	sbc d
	ld [$AF0C], a
	jr nc, UnknownRJump_801C
	xor a
	ld [$AF0D], a
	ld [$AF0C], a

UnknownRJump_801C:
	add de
	ld a, h
	ld [$AF0A], a
	ld a, l
	ld [$AF0B], a
	ld b, 112
	ld a, [$FFCA]
	ld l, a
	sub e
	ld [$AF15], a
	ld a, [$FFCB]
	ld h, a
	sbc d
	ld [$AF14], a
	jr nc, UnknownRJump_8040
	xor a
	ld [$AF15], a
	ld [$AF14], a

UnknownRJump_8040:
	add de
	ld a, h
	ld [$AF12], a
	ld a, l
	ld [$AF13], a
	ld b, 160
	ld a, [$FFCA]
	ld l, a
	sub e
	ld [$AF1D], a
	ld a, [$FFCB]
	ld h, a
	sbc d
	ld [$AF1C], a
	jr nc, UnknownRJump_8064
	xor a
	ld [$AF1D], a
	ld [$AF1C], a

UnknownRJump_8064:
	add de
	ld a, h
	ld [$AF1A], a
	ld a, l
	ld [$AF1B], a
	ld a, [$AF24]
	ld b, a
	ld a, [$FFCB]
	cp b
	jr c, UnknownRJump_80A4
	jr nz, UnknownRJump_8085
	ld a, [$AF25]
	ld b, a
	ld a, [$FFCA]
	cp b
	jr c, UnknownRJump_80A4
	jr z, UnknownRJump_809A

UnknownRJump_8085:
	ld a, 1
	ld [$AF22], a
	ld a, [$AF12]
	ld [$AF00], a
	ld a, [$AF13]
	and $F8
	ld [$AF01], a
	jr UnknownRJump_80B7

UnknownRJump_809A:
	ld [$AF22], a
	ld a, 255
	ld [$AF00], a
	jr UnknownRJump_80B7

UnknownRJump_80A4:
	ld a, 255
	ld [$AF22], a
	ld a, [$AF14]
	ld [$AF00], a
	ld a, [$AF15]
	and $F8
	ld [$AF01], a

UnknownRJump_80B7:
	ld de, $0060
	ld a, [$FFC8]
	ld l, a
	sub e
	ld [$AF11], a
	ld a, [$FFC9]
	ld h, a
	sbc d
	ld [$AF10], a
	jr nc, UnknownRJump_80D3
	xor a
	ld [$AF11], a
	ld [$AF10], a

UnknownRJump_80D3:
	add de
	ld a, h
	ld [$AF0E], a
	ld a, l
	ld [$AF0F], a
	ld b, 160
	ld a, [$FFC8]
	ld l, a
	sub e
	ld [$AF19], a
	ld a, [$FFC9]
	ld h, a
	sbc d
	ld [$AF18], a
	jr nc, UnknownRJump_80F7
	xor a
	ld [$AF19], a
	ld [$AF18], a

UnknownRJump_80F7:
	add de
	ld a, h
	ld [$AF16], a
	ld a, l
	ld [$AF17], a
	ld a, [$FFC2]
	add 8
	ld [$AF30], a
	ld a, [$FFC3]
	adc 0
	ld [$AF31], a
	ld a, [$FFC0]
	add 32
	ld [$AF32], a
	ld a, [$FFC1]
	adc 0
	ld [$AF33], a
	ld a, [$AF08]
	xor $01
	ld [$AF08], a
	jr z, UnknownRJump_812E
	ld hl, $FFF0
	inc [hl]

UnknownRJump_812E:
	ld hl, $AD08

UnknownRJump_8131:
	xor a
	ld [$AF3E], a
	ld [$AF2E], a
	ld a, h
	ld [$AF28], a
	ld a, l
	ld [$AF29], a
	ld a, [hl]
	and a
	jr z, UnknownRJump_816A
	dec a
	jr z, UnknownRJump_815E
	call UnknownCall_826D
	ld a, [$AF3E]
	and a
	jr nz, UnknownRJump_816A
	call UnknownCall_828F
	ld a, [$AF3E]
	and a
	jr nz, UnknownRJump_816A
	call UnknownCall_818D
	jr UnknownRJump_816A

UnknownRJump_815E:
	call UnknownCall_826D
	ld a, [$AF3E]
	and a
	jr nz, UnknownRJump_816A
	call UnknownCall_81F7

UnknownRJump_816A:
	ld a, [$AF28]
	ld h, a
	ld a, [$AF29]
	ld l, a
	ld de, $0020
	add de
	ld a, h
	cp 175
	jr z, UnknownRJump_817D
	jr UnknownRJump_8131

UnknownRJump_817D:
	call UnknownCall_8C31
	ld a, [$FFCB]
	ld [$AF24], a
	ld a, [$FFCA]
	ld [$AF25], a
	ret

UnknownCall_818D:
	call UnknownCall_81A7
	call UnknownCall_3A50
	call UnknownCall_3C80
	ld a, [$AF09]
	and a
	jr z, UnknownRJump_819F
	xor a
	ld [$FF00+$E7], a

UnknownRJump_819F:
	xor a
	ld [$AF09], a
	call UnknownCall_81BA
	ret

UnknownCall_81A7:
	ld hl, $AF28
	ld a, [hli]
	ld b, a
	ld a, [hl]
	and $F0
	ld l, a
	ld h, b
	ld de, $FFD0
	ld b, 32
	call UnknownCall_3CAA
	ret

UnknownCall_81BA:
	call UnknownCall_81CF

UnknownCall_81BD:
	ld hl, $AF28
	ld a, [hli]
	ld d, a
	ld a, [hl]
	and $F0
	ld e, a
	ld hl, $FFD0
	ld b, 32
	call UnknownCall_3CAA
	ret

UnknownCall_81CF:
	ld hl, $4935
	ld a, [$AF06]
	and a
	jr nz, UnknownRJump_81DB
	ld hl, $4737

UnknownJump_81DB:
UnknownRJump_81DB:
	ld de, $FFE3
	ld b, 0
	ld a, [$FF00+$DB]
	add a
	ld c, a
	rl b
	add bc
	ld a, [hli]
	ld c, a
	ld h, [hl]
	ld l, c
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	ret

UnknownCall_81F7:
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld hl, $AF0A
	ld de, $AF02
	ld b, 4
	call UnknownCall_3CAA
	call UnknownCall_82D5
	ld a, [$AF2A]
	and a
	ret z
	ld hl, $AF0E
	ld de, $AF02
	ld b, 4
	call UnknownCall_3CAA
	call UnknownCall_8306
	ld a, [$AF2A]
	and a
	ret z
	ld a, [$AF28]
	ld h, a
	ld a, [$AF29]
	ld l, a
	ld [hl], 2
	ld a, l
	add 9
	ld l, a
	ld a, [hli]
	ld [hl], a
	ld hl, $AF40
	dec [hl]
	ld hl, $AF41
	inc [hl]
	ld a, 1
	ld [$AF3E], a
	ret

UnknownCall_8240:
	ld a, [$FF00+$D6]
	cp 173
	ret nc
	ld a, [$FF00+$D5]
	ld e, a
	ld d, 0
	ld hl, $4BC1
	ld a, [$AF06]
	and a
	jr nz, UnknownRJump_8256
	ld hl, $4B61

UnknownRJump_8256:
	add de
	ld a, [hl]
	ld hl, $FFDB
	ld [hli], a
	inc l
	ld a, [$AF38]
	ld [hli], a
	ld b, 17
	xor a

UnknownRJump_8264:
	ld [hli], a
	dec b
	jr nz, UnknownRJump_8264
	xor a
	ld [$AF38], a
	ret

UnknownCall_826D:
	ld a, [$FF00+$F0]
	and $01
	ret z
	ld hl, $AF1A
	ld de, $AF02
	ld b, 4
	call UnknownCall_3CAA
	call UnknownCall_82D5
	ld a, [$AF2A]
	and a
	ret nz

UnknownRJump_8285:
	call UnknownCall_81A7
	call UnknownCall_3C6C
	call UnknownCall_81BA
	ret

UnknownCall_828F:
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld hl, $AF16
	ld de, $AF02
	ld b, 4
	call UnknownCall_3CAA
	call UnknownCall_8306
	ld a, [$AF2A]
	and a
	ret nz
	ld a, [$FF00+$D5]
	cp 16
	jr z, UnknownRJump_8285
	ld a, [$AF28]
	ld h, a
	ld a, [$AF29]
	sub 2
	ld l, a
	ld a, [hli]
	cp 173
	jr nc, UnknownRJump_8285
	inc l
	ld [hl], 1
	ld a, l
	add 10
	ld l, a
	ld a, [hld]
	ld [hli], a
	ld [hl], 0
	ld a, 3
	ld [$AF3E], a
	ld hl, $AF41
	dec [hl]
	ld hl, $AF40
	inc [hl]
	ret

UnknownCall_82D5:
	xor a
	ld [$AF2A], a
	ld a, [$AF28]
	ld h, a
	ld a, [$AF29]
	and $F0
	ld l, a

UnknownRJump_82E3:
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld a, [$AF02]
	cp b
	ret c
	jr nz, UnknownRJump_82F2
	ld a, [$AF03]
	cp c
	ret c

UnknownRJump_82F2:
	ld a, [$AF04]
	cp b
	jr c, UnknownRJump_8300
	ret nz
	ld a, [$AF05]
	cp c
	jr z, UnknownRJump_8300
	ret nc

UnknownRJump_8300:
	ld a, 1
	ld [$AF2A], a
	ret

UnknownCall_8306:
	xor a
	ld [$AF2A], a
	ld a, [$AF28]
	ld h, a
	ld a, [$AF29]
	and $F0
	add 3
	ld l, a
	jr UnknownRJump_82E3
	ld a, 136
	ld [$AF2F], a
	ld a, [$FF00+$D4]
	ld [$FFB7], a
	and $0C
	jr nz, UnknownRJump_837B
	ld a, [$FF00+$D3]
	ld [$FFB8], a
	ld b, 16
	call UnknownCall_859D
	call UnknownCall_1F2F
	cp 72
	ret c
	jr UnknownRJump_837B
	ld a, 136
	ld [$AF2F], a
	ld a, [$FF00+$D4]
	ld [$FFB7], a
	and $0C
	jr nz, UnknownRJump_837B
	ld a, [$FF00+$D3]
	ld [$FFB8], a
	ld b, 16
	call UnknownCall_8590
	call UnknownCall_1F2F
	cp 72
	ret c
	jr UnknownRJump_837B
	ld a, 136
	ld [$AF2F], a
	ld a, [$FF00+$D4]
	ld [$FFB7], a
	and $0C
	jr nz, UnknownRJump_837B
	ld a, [$FF00+$D3]
	ld [$FFB8], a

UnknownRJump_836B:
	ld a, [$FF00+$D1]
	ld [$FFB9], a
	ld a, [$FF00+$D0]
	ld [$FFBA], a
	call UnknownCall_1F2F
	cp 72
	ret c

UnknownRJump_837B:
	ld hl, $AF2F
	res 6, [hl]
	ret
	ld a, 136
	ld [$AF2F], a
	ld b, 16
	call UnknownCall_8576
	ld a, [$FFB7]
	and $0C
	jr nz, UnknownRJump_837B
	jr UnknownRJump_836B
	ld a, 68
	ld [$AF2F], a
	ld b, 8
	call UnknownCall_8583
	ld a, [$FF00+$D1]
	ld [$FFB9], a
	ld a, [$FF00+$D0]
	ld [$FFBA], a
	call UnknownCall_1F2F
	cp 56
	ret c
	jr UnknownRJump_83CA
	ld a, 68
	ld [$AF2F], a
	ld b, 18
	call UnknownCall_8583
	ld a, [$FF00+$D1]
	ld [$FFB9], a
	ld a, [$FF00+$D0]
	ld [$FFBA], a
	call UnknownCall_1F2F
	cp 56
	ret c

UnknownRJump_83CA:
	ld hl, $AF2F
	res 4, [hl]
	ret
	ld a, 68
	ld [$AF2F], a
	ld b, 32
	call UnknownCall_8583
	ld a, [$FF00+$D1]
	ld [$FFB9], a
	ld a, [$FF00+$D0]
	ld [$FFBA], a
	call UnknownCall_1F2F
	cp 56
	ret c
	jr UnknownRJump_83CA
	ld a, 68
	ld [$AF2F], a
	ld b, 18
	call UnknownCall_8583
	ld b, 16
	call UnknownCall_859D
	call UnknownCall_1F2F
	cp 56
	ret c
	jr UnknownRJump_83CA
	ld a, 68
	ld [$AF2F], a
	ld b, 18
	call UnknownCall_8583
	ld b, 16
	call UnknownCall_8590
	call UnknownCall_1F2F
	cp 56
	ret c
	jr UnknownRJump_83CA

UnknownCall_841A:
	ld a, 17
	ld [$AF2F], a
	ld b, 8
	call UnknownCall_8583
	ld b, 7
	call UnknownCall_8590
	call UnknownCall_1F2F
	cp 56
	ret c
	ld b, 5
	call UnknownCall_8583
	call UnknownCall_1F2F
	cp 56
	ret c
	jr UnknownRJump_845C
	ld a, 17
	ld [$AF2F], a
	ld b, 11
	call UnknownCall_8583
	ld b, 7
	call UnknownCall_8590
	call UnknownCall_1F2F
	cp 56
	ret c
	ld b, 5
	call UnknownCall_8583
	call UnknownCall_1F2F
	cp 56
	ret c

UnknownRJump_845C:
	ld hl, $AF2F
	res 0, [hl]
	ret
	ld a, 17
	ld [$AF2F], a
	ld b, 11
	call UnknownCall_8583
	ld b, 11
	call UnknownCall_8590
	call UnknownCall_1F2F
	cp 56
	ret c
	ld b, 5
	call UnknownCall_8583
	call UnknownCall_1F2F
	cp 56
	ret c
	jr UnknownRJump_845C
	ld a, 17
	ld [$AF2F], a
	ld b, 11
	call UnknownCall_8583
	ld b, 19
	call UnknownCall_8590
	call UnknownCall_1F2F
	cp 56
	ret c
	ld b, 5
	call UnknownCall_8583
	call UnknownCall_1F2F
	cp 56
	ret c
	jr UnknownRJump_845C
	ld a, 17
	ld [$AF2F], a
	ld b, 19
	call UnknownCall_8583
	ld b, 11
	call UnknownCall_8590
	call UnknownCall_1F2F
	cp 56
	ret c
	ld b, 4
	call UnknownCall_8583
	call UnknownCall_1F2F
	cp 56
	ret c
	jr UnknownRJump_845C

UnknownCall_84C8:
	ld a, 34
	ld [$AF2F], a
	ld b, 8
	call UnknownCall_8583
	ld b, 7
	call UnknownCall_859D
	call UnknownCall_1F2F
	cp 56
	ret c
	ld b, 5
	call UnknownCall_8583
	call UnknownCall_1F2F
	cp 56
	ret c
	jr UnknownRJump_850A
	ld a, 34
	ld [$AF2F], a
	ld b, 11
	call UnknownCall_8583
	ld b, 7
	call UnknownCall_859D
	call UnknownCall_1F2F
	cp 56
	ret c
	ld b, 5
	call UnknownCall_8583
	call UnknownCall_1F2F
	cp 56
	ret c

UnknownRJump_850A:
	ld hl, $AF2F
	res 4, [hl]
	ret
	ld a, 34
	ld [$AF2F], a
	ld b, 11
	call UnknownCall_8583
	ld b, 11
	call UnknownCall_859D
	call UnknownCall_1F2F
	cp 56
	ret c
	ld b, 5
	call UnknownCall_8583
	call UnknownCall_1F2F
	cp 56
	ret c
	jr UnknownRJump_850A
	ld a, 34
	ld [$AF2F], a
	ld b, 11
	call UnknownCall_8583
	ld b, 19
	call UnknownCall_859D
	call UnknownCall_1F2F
	cp 56
	ret c
	ld b, 5
	call UnknownCall_8583
	call UnknownCall_1F2F
	cp 56
	ret c
	jr UnknownRJump_850A
	ld a, 34
	ld [$AF2F], a
	ld b, 19
	call UnknownCall_8583
	ld b, 11
	call UnknownCall_859D
	call UnknownCall_1F2F
	cp 56
	ret c
	ld b, 4
	call UnknownCall_8583
	call UnknownCall_1F2F
	cp 56
	ret c
	jr UnknownRJump_850A

UnknownCall_8576:
	ld hl, $FFB7
	ld a, [$FF00+$D4]
	add b
	ld [hli], a
	ld a, [$FF00+$D3]
	adc 0
	ld [hl], a
	ret

UnknownCall_8583:
	ld hl, $FFB7
	ld a, [$FF00+$D4]
	sub b
	ld [hli], a
	ld a, [$FF00+$D3]
	sbc 0
	ld [hl], a
	ret

UnknownCall_8590:
	ld hl, $FFB9
	ld a, [$FF00+$D1]
	add b
	ld [hli], a
	ld a, [$FF00+$D0]
	adc 0
	ld [hl], a
	ret

UnknownCall_859D:
	ld hl, $FFB9
	ld a, [$FF00+$D1]
	sub b
	ld [hli], a
	ld a, [$FF00+$D0]
	sbc 0
	ld [hl], a
	ret
	ld a, [$FF00+$E7]
	and a
	ret z
	bit 0, a
	jr nz, UnknownRJump_85C4
	bit 4, a
	jr nz, UnknownRJump_85F0
	bit 4, a
	jr nz, UnknownRJump_85E2
	bit 4, a
	jr nz, UnknownRJump_8611
	bit 5, a
	jp nz, UnknownJump_86A0
	ret

UnknownRJump_85C4:
	xor a
	ld [$FF00+$DF], a
	ld a, [$A268]
	and a
	jr nz, UnknownRJump_85F0
	ld a, [$FF00+$E2]
	bit 4, a
	jr z, UnknownRJump_85F0
	bit 0, a
	jr z, UnknownRJump_8633
	ld a, 3
	ld [$A460], a
	ld hl, $FFD5
	dec [hl]
	jr UnknownRJump_863C

UnknownRJump_85E2:
	ld a, [$A460]
	cp 9
	jr z, UnknownRJump_85FC
	ld a, 16
	ld [$A460], a
	jr UnknownRJump_85FC

UnknownJump_85F0:
UnknownRJump_85F0:
	ld a, [$A460]
	cp 9
	jr z, UnknownRJump_85FC
	ld a, 6
	ld [$A460], a

UnknownRJump_85FC:
	call UnknownCall_3A78
	xor a
	ld [$FF00+$D5], a
	ld [$FF00+$DF], a
	ld [$FF00+$DC], a
	ld [$FF00+$E2], a
	ld a, 1
	ld [$AF3E], a
	ld [$AF09], a
	ret

UnknownRJump_8611:
	ld a, [$FF00+$E2]
	bit 7, a
	jr nz, UnknownRJump_868A
	cp 6
	ret nz
	ld a, [$FF80]
	bit 4, a
	jr z, UnknownRJump_864A
	ld a, [$AF3A]
	and a
	ret nz
	ld a, 1
	ld [$AF3A], a
	ld a, [$FF00+$D5]
	add 2
	ld [$FF00+$D5], a
	jr UnknownRJump_863C

UnknownRJump_8633:
UnknownCall_8633:
	ld a, 3
	ld [$A460], a
	ld hl, $FFD5
	inc [hl]

UnknownJump_863C:
UnknownRJump_863C:
UnknownCall_863C:
	ld a, [$FF00+$DD]
	ld [$AF38], a
	call UnknownCall_8240
	ld a, 1
	ld [$AF3E], a
	ret

UnknownRJump_864A:
	call UnknownCall_8633
	ld b, 16
	ld a, [$A22B]
	cp 1
	jr z, UnknownRJump_8670
	call UnknownCall_3D22
	call UnknownCall_84C8
	ld a, [$AF2F]
	bit 4, a
	ret z
	ld b, 16
	call UnknownCall_3D32
	ld a, 95
	ld [$FF00+$E2], a
	ld a, 2
	ld [$FF00+$DF], a
	ret

UnknownRJump_8670:
	call UnknownCall_3D32
	call UnknownCall_841A
	ld a, [$AF2F]
	bit 0, a
	ret z

UnknownData_867C:
INCBIN "baserom.gb", $867C, $868A - $867C


UnknownRJump_868A:
	cp 133
	jr z, UnknownRJump_86DA
	cp 137
	jr z, UnknownRJump_8695
	cp 134
	ret nc

UnknownRJump_8695:
	xor a
	ld [$FF00+$DD], a
	call UnknownCall_863C
	ld a, 16
	ld [$FF00+$D5], a
	ret

UnknownJump_86A0:
	ld a, 1
	ld [$AF09], a
	ld a, [$FF00+$E2]
	bit 7, a
	jr nz, UnknownRJump_86E4
	xor a
	ld [$FF00+$DF], a
	ld a, [$FF00+$E2]
	bit 4, a
	jr nz, UnknownRJump_86C6
	bit 6, a
	jp nz, UnknownJump_85F0

UnknownData_86B9:
INCBIN "baserom.gb", $86B9, $86C6 - $86B9


UnknownRJump_86C6:
	bit 6, a
	jr nz, UnknownRJump_86D2
	call UnknownCall_8633
	ld a, 1
	ld [$FF00+$EB], a
	ret

UnknownRJump_86D2:
UnknownData_86D2:
INCBIN "baserom.gb", $86D2, $86DA - $86D2


UnknownRJump_86DA:
	ld a, 16
	ld [$FF00+$D5], a
	xor a
	ld [$FF00+$DD], a
	jp UnknownJump_863C

UnknownRJump_86E4:
	ld a, [$FF00+$E2]
	and $7F
	jr nz, UnknownRJump_8721
	ld a, [$FF00+$D5]
	cp 17
	jr nz, UnknownRJump_8708
	ld a, [$A216]
	and a
	jr z, UnknownRJump_8708
	ld a, [$FF00+$D6]
	ld h, a
	ld a, [$FF00+$D7]
	ld l, a
	inc hl
	inc hl
	inc hl
	ld a, 18
	ld [hl], a
	ld [$FF00+$D5], a
	ld a, 26
	ld [$FF00+$DB], a

UnknownRJump_8708:
	ld a, [$FF00+$D5]
	add 112
	ld [$FF00+$E2], a
	ld a, 1
	ld [$FF00+$DF], a
	ld b, 16
	call UnknownCall_3A64
	ld a, 8
	ld [$A460], a
	ld a, 16
	ld [$FF00+$D2], a
	ret

UnknownRJump_8721:
	ld a, [$FF00+$E2]
	ld [$AFCC], a
	call UnknownCall_863C
	ld a, [$AFCC]
	ld [$FF00+$E2], a
	xor a
	ld [$AFCC], a
	ld a, 2
	ld [$FF00+$EB], a
	ret

UnknownData_8737:
INCBIN "baserom.gb", $8737, $8C31 - $8737


UnknownCall_8C31:
	ld a, [$AF22]
	and a
	ret z
	dec a
	jr z, UnknownRJump_8C3C
	jp UnknownJump_8CEB

UnknownRJump_8C3C:
	ld a, [$AF00]
	cp 255
	ret z
	ld c, a
	ld a, [$AF1E]
	ld h, a
	ld a, [$AF1F]
	ld l, a
	ld a, [hl]
	cp 255
	ret z
	ld de, $0006

UnknownRJump_8C52:
	cp c
	jr z, UnknownRJump_8C6E
	ret nc

UnknownJump_8C56:
UnknownRJump_8C56:
	ld a, [$AF1E]
	ld h, a
	ld a, [$AF1F]
	ld l, a
	add de
	ld a, [hl]
	cp 255
	ret z
	ld a, h
	ld [$AF1E], a
	ld a, l
	ld [$AF1F], a
	ld a, [hl]
	jr UnknownRJump_8C52

UnknownRJump_8C6E:
	inc hl
	ld a, [$AF01]
	ld b, a
	ld a, [hl]
	cp b
	jr c, UnknownRJump_8C56
	ret nz
	ld a, [$A2E4]
	and $01
	jr nz, UnknownRJump_8C87
	inc hl
	ld a, [hl]
	and $0E
	jr nz, UnknownRJump_8C56
	jr UnknownRJump_8C8D

UnknownRJump_8C87:
	inc hl
	ld a, [hl]
	and $0F
	jr nz, UnknownRJump_8C56

UnknownRJump_8C8D:
	ld b, e
	ld hl, $ACE8
	ld b, 32

UnknownRJump_8C93:
	add de
	ld a, [hl]
	and a
	jr nz, UnknownRJump_8C93
	ld a, h
	cp 175
	ret z
	ld a, l
	and $F0
	ld l, a
	ld a, [$AF1E]
	ld d, a
	ld a, [$AF1F]
	ld e, a

UnknownRJump_8CA8:
	ld a, [de]
	ld [hli], a
	inc de
	dec b
	jr nz, UnknownRJump_8CA8
	ld a, [$AF1E]
	ld [hli], a
	ld a, [$AF1F]
	add 2
	ld [hli], a
	ld a, h
	ld [$AF28], a
	ld a, l
	ld [$AF29], a
	ld a, 1
	ld [hli], a
	ld b, 23
	xor a

UnknownRJump_8CC6:
	ld [hli], a
	dec b
	jr nz, UnknownRJump_8CC6
	ld a, [$AF1E]
	ld h, a
	ld a, [$AF1F]
	add 2
	ld l, a
	ld [hl], 2
	push bc
	call UnknownCall_81A7
	call UnknownCall_8240
	call UnknownCall_81BA
	pop bc
	ld hl, $AF40
	inc [hl]
	ld de, $0006
	jp UnknownJump_8C56

UnknownJump_8CEB:
	ld a, [$AF00]
	cp 255
	ret z
	ld c, a
	ld a, [$AF1E]
	ld h, a
	ld a, [$AF1F]
	ld l, a
	ld a, [hl]
	cp 255
	ret z
	ld de, $FFFA

UnknownRJump_8D01:
	cp c
	jr z, UnknownRJump_8D1D
	ret c

UnknownJump_8D05:
UnknownRJump_8D05:
	ld a, [$AF1E]
	ld h, a
	ld a, [$AF1F]
	ld l, a
	add de
	ld a, [hl]
	cp 255
	ret z
	ld a, h
	ld [$AF1E], a
	ld a, l
	ld [$AF1F], a
	ld a, [hl]
	jr UnknownRJump_8D01

UnknownRJump_8D1D:
	inc hl
	ld a, [$AF01]
	ld b, a
	ld a, [hl]
	cp b
	ret c
	jr nz, UnknownRJump_8D05
	ld a, [$A2E4]
	and $01
	jr nz, UnknownRJump_8D36
	inc hl
	ld a, [hl]
	and $0E
	jr nz, UnknownRJump_8D05
	jr UnknownRJump_8D3C

UnknownRJump_8D36:
	inc hl
	ld a, [hl]
	and $0F
	jr nz, UnknownRJump_8D05

UnknownRJump_8D3C:
	ld b, 6
	ld hl, $ACE8
	ld de, $0020

UnknownRJump_8D44:
	add de
	ld a, [hl]
	and a
	jr nz, UnknownRJump_8D44
	ld a, h
	cp 175
	ret z
	ld a, l
	and $F0
	ld l, a
	ld a, [$AF1E]
	ld d, a
	ld a, [$AF1F]
	ld e, a

UnknownRJump_8D59:
	ld a, [de]
	ld [hli], a
	inc de
	dec b
	jr nz, UnknownRJump_8D59
	ld a, [$AF1E]
	ld [hli], a
	ld a, [$AF1F]
	add 2
	ld [hli], a
	ld a, h
	ld [$AF28], a
	ld a, l
	ld [$AF29], a
	ld a, 1
	ld [hli], a
	ld b, 23
	xor a

UnknownRJump_8D77:
	ld [hli], a
	dec b
	jr nz, UnknownRJump_8D77
	ld a, [$AF1E]
	ld h, a
	ld a, [$AF1F]
	add 2
	ld l, a
	ld [hl], 2
	push bc
	call UnknownCall_81A7
	call UnknownCall_8240
	call UnknownCall_81BA
	pop bc
	ld hl, $AF40
	inc [hl]
	ld de, $FFFA
	jp UnknownJump_8D05
	call UnknownCall_3A28
	call UnknownCall_3A00
	call UnknownCall_8DFD
	call UnknownCall_8E6C
	ret
	ld a, [$AFC1]
	inc a
	ld [$AFC2], a
	ld a, 173
	ld [$AF28], a
	ld a, 0
	ld [$AF29], a
	ld hl, $FFF0
	inc [hl]

UnknownRJump_8DBE:
	xor a
	ld [$AF3E], a
	ld [$AFC3], a
	ld [$5290], a
	call UnknownCall_81A7
	ld a, [$FF00+$D5]
	and a
	jr z, UnknownRJump_8DDF
	call UnknownCall_92DF
	call UnknownCall_3A14
	xor a
	ld [$FF00+$E7], a
	call UnknownCall_9048
	call UnknownCall_81BD

UnknownRJump_8DDF:
	ld a, [$AFC2]
	dec a
	ret z
	ld [$AFC2], a
	ld a, [$AF28]
	ld h, a
	ld a, [$AF29]
	ld l, a
	ld de, $0020
	add de
	ld a, h
	ld [$AF28], a
	ld a, l
	ld [$AF29], a
	jr UnknownRJump_8DBE

UnknownCall_8DFD:
	ld b, 0
	ld a, [$A269]
	cp 5
	jr z, UnknownRJump_8E20
	inc b
	cp 9
	jr z, UnknownRJump_8E20
	inc b
	cp 13
	jr z, UnknownRJump_8E20
	inc b
	cp 16
	jr z, UnknownRJump_8E20
	inc b
	cp 19
	jr z, UnknownRJump_8E20
	inc b
	cp 23
	jr z, UnknownRJump_8E20
	inc b

UnknownRJump_8E20:
	ld a, [$A2DC]
	add b
	ld [$AFC0], a
	ld a, 80
	ld [$AFCD], a
	ld hl, $4E3F
	call UnknownCall_904E
	ld a, [hli]
	ld [$AFC1], a
	ld a, [hli]
	ld [$AFC5], a
	ld a, [hl]
	ld [$AFCA], a
	ret

UnknownData_8E3F:
INCBIN "baserom.gb", $8E3F, $8E6C - $8E3F


UnknownCall_8E6C:
	ld hl, $4E9A
	call UnknownCall_904E
	ld de, $AD05
	ld b, 18
	call UnknownCall_3CAA
	ld hl, $4EAC
	call UnknownCall_904E
	ld a, [$AFC1]
	and a
	ret z
	ld c, a
	ld de, $AD25

UnknownRJump_8E89:
	ld b, 18
	call UnknownCall_3CAA
	ld a, e
	add 16
	and $F0
	add 5
	ld e, a
	dec c
	jr nz, UnknownRJump_8E89
	ret

UnknownData_8E9A:
INCBIN "baserom.gb", $8E9A, $9048 - $8E9A


UnknownCall_9048:
	ld hl, $505B
	jp UnknownJump_81DB

UnknownCall_904E:
	ld a, [$AFC0]
	add a
	ld e, a
	ld d, 0
	add de
	ld a, [hli]
	ld e, a
	ld h, [hl]
	ld l, e
	ret

UnknownData_905B:
INCBIN "baserom.gb", $905B, $9285 - $905B


UnknownCall_9285:
	ld a, [$FF00+$E7]
	bit 0, a
	jr nz, UnknownRJump_92A5
	bit 4, a
	jr nz, UnknownRJump_9290
	ret

UnknownRJump_9290:
	ld a, 1
	ld [$AF3E], a
	ld a, [$AF29]
	and a
	ret nz

UnknownData_929A:
INCBIN "baserom.gb", $929A, $92A5 - $929A


UnknownRJump_92A5:
	ld a, 1
	ld [$AF3E], a
	ld [$AFC3], a
	ld a, [$AF29]
	and a
	ret nz
	ld a, 19
	ld [$A460], a
	ld a, [$AFC5]
	sub 2
	ld [$AFC5], a
	jr z, UnknownRJump_92C4
	jr c, UnknownRJump_92C4
	ret

UnknownRJump_92C4:
	ld a, 1
	ld [$AF26], a
	ld a, [$AFC0]
	cp 6
	ret nc
	ld a, 2
	ld [$A267], a
	ld a, 128
	ld [$A266], a
	ld a, 1
	ld [$A2E3], a
	ret

UnknownCall_92DF:
	ld a, [$A224]
	cp 255
	ret z
	ld a, [$FF00+$D5]
	rst $28

UnknownData_92E8:
INCBIN "baserom.gb", $92E8, $9323 - $92E8

	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_934C
	ld b, 32
	call UnknownCall_B270
	ld a, [$FF00+$DD]
	xor $40
	ld [$FF00+$DD], a
	xor a
	ld [$FF00+$E0], a
	ld [$FF00+$E2], a
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 13
	ld [$A460], a
	ld a, [$AF29]
	and a
	ret z
	ld a, 23
	ld [$A460], a
	ret

UnknownRJump_934C:
	dec a
	rst $28

UnknownData_934E:
INCBIN "baserom.gb", $934E, $9354 - $934E

	call UnknownCall_B1EB
	call UnknownCall_B270
	ld a, [$FF00+$E0]
	cp c
	ret nz
	ld a, 2
	ld [$FF00+$DF], a
	xor a
	ld [$FF00+$E0], a
	ret
	call UnknownCall_B18F
	call UnknownCall_B276
	ld a, [$FF00+$D9]
	cp 208
	ret c
	ld a, [$AF29]
	and a
	jr nz, UnknownRJump_9399
	ld a, 3
	ld [$FF00+$DF], a
	ld a, 208
	ld [$FF00+$EC], a
	ld a, 12
	ld [$A468], a
	ret
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	call UnknownCall_B15B
	ld a, 1
	ld [$AF3E], a
	ld a, 2
	ld [$AF26], a
	ret

UnknownRJump_9399:
	call UnknownCall_B157
	ld a, 1
	ld [$AF3E], a
	ld a, 2
	ld [$AF26], a
	ret
	call UnknownCall_9285
	ld a, [$AF3E]
	and a
	jr z, UnknownRJump_93D5
	ld a, [$FF00+$DB]
	ld [$AF37], a
	ld a, [$FF00+$DF]
	ld [$AFC4], a
	ld a, [$FF00+$E2]
	ld [$AFCC], a
	ld a, [$AFC3]
	and a
	jr z, UnknownRJump_93CD
	xor a
	ld [$FF00+$DB], a
	ld a, [$AFCD]
	ld [$FF00+$EC], a

UnknownRJump_93CD:
	xor a
	ld [$FF00+$E2], a
	ld a, 1
	ld [$FF00+$DF], a
	ret

UnknownRJump_93D5:
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_93EE
	call UnknownCall_B309
	call UnknownCall_B14E
	ret nz
	ld a, 69
	ld [$FF00+$E2], a
	ld a, 3
	ld [$FF00+$DB], a
	ld a, 3
	ld [$FF00+$DF], a
	ret

UnknownRJump_93EE:
	dec a
	rst $28

UnknownData_93F0:
INCBIN "baserom.gb", $93F0, $93FE - $93F0

	call UnknownCall_B40E
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_940F
	call UnknownCall_B2F6
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz

UnknownRJump_940F:
	ld a, [$AF26]
	and a
	jr nz, UnknownRJump_9435
	ld a, 4
	ld [$FF00+$DB], a
	ld a, [$FF00+$EA]
	inc a
	ld [$FF00+$EA], a
	cp 16
	ret nz
	xor a
	ld [$FF00+$EA], a
	ld [$FF00+$DE], a
	ld a, [$AF37]
	ld [$FF00+$DB], a
	ld a, [$AFC4]
	ld [$FF00+$DF], a
	ld a, 69
	ld [$FF00+$E2], a
	ret

UnknownJump_9435:
UnknownRJump_9435:
	ld a, 2
	ld [$FF00+$DF], a
	ld a, 32
	ld [$FF00+$EC], a
	ld a, [$AFCA]
	ld [$FF00+$DB], a
	ret

UnknownJump_9443:
UnknownCall_9443:
	call UnknownCall_B40E
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	xor a
	ld [$FF00+$DF], a
	ld a, 3
	ld [$FF00+$D5], a
	xor a
	ld [$FF00+$EA], a
	ld [$FF00+$DE], a
	ld a, [$AF29]
	and a
	ret nz
	ld a, 255
	ld [$A468], a
	ret
	call UnknownCall_B183
	call UnknownCall_B276
	ld a, [$FF00+$E0]
	cp c
	ret nz
	ld a, 1
	ld [$FF00+$E0], a
	ld a, 4
	ld [$FF00+$DF], a
	ld a, 2
	ld [$A478], a
	ret
	call UnknownCall_B2FD
	ld a, [$FF00+$E0]
	cp 12
	jr c, UnknownRJump_9489
	ld b, 1
	call UnknownCall_B270

UnknownRJump_9489:
	ld hl, $5595
	call UnknownCall_B16B
	call UnknownCall_B26A
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	cp 105
	ret nz
	ld a, 104
	ld [$FF00+$E0], a
	ld a, 5
	ld [$FF00+$DF], a
	ld a, 80
	ld [$FF00+$EC], a
	ld a, [$AFC5]
	cp 3
	ret nc

UnknownData_94AC:
INCBIN "baserom.gb", $94AC, $94B6 - $94AC

	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_94CD
	call UnknownCall_B2FD
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 5
	ld [$FF00+$DB], a
	ld a, 8
	ld [$A470], a

UnknownRJump_94CD:
	call UnknownCall_B309
	ld a, [$AFC6]
	and a
	jr nz, UnknownRJump_94DC
	ld a, [$FF00+$E0]
	cp 12
	jr c, UnknownRJump_94E1

UnknownRJump_94DC:
	ld b, 1
	call UnknownCall_B276

UnknownRJump_94E1:
	ld hl, $5595
	call UnknownCall_B16B
	call UnknownCall_B264
	ld a, [$FF00+$E0]
	dec a
	ld [$FF00+$E0], a
	ret nz
	ld a, 1
	ld [$FF00+$E0], a
	ld a, 6
	ld [$FF00+$DF], a
	ld a, 2
	ld [$FF00+$DB], a
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a
	ld a, 2
	ld [$A478], a
	ret
	call UnknownCall_B2FD
	ld a, [$FF00+$E0]
	cp 12
	jr c, UnknownRJump_9516
	ld b, 1
	call UnknownCall_B270

UnknownRJump_9516:
	ld hl, $5595
	call UnknownCall_B16B
	call UnknownCall_B264
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	cp 105
	ret nz
	ld a, 104
	ld [$FF00+$E0], a
	ld a, 7
	ld [$FF00+$DF], a
	ld a, 80
	ld [$FF00+$EC], a
	ld a, [$AFC5]
	cp 3
	ret nc
	ld a, 1
	ld [$AFC6], a
	ld a, 92
	ld [$FF00+$E0], a
	ret
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_955A
	call UnknownCall_B2FD
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 5
	ld [$FF00+$DB], a
	ld a, 8
	ld [$A470], a

UnknownRJump_955A:
	call UnknownCall_B309
	ld a, [$AFC6]
	and a
	jr nz, UnknownRJump_9569

UnknownData_9563:
INCBIN "baserom.gb", $9563, $9569 - $9563


UnknownRJump_9569:
	ld b, 1
	call UnknownCall_B276
	ld hl, $5595
	call UnknownCall_B16B
	call UnknownCall_B26A
	ld a, [$FF00+$E0]
	dec a
	ld [$FF00+$E0], a
	ret nz
	ld a, 1
	ld [$FF00+$E0], a
	ld a, 4
	ld [$FF00+$DF], a
	ld a, 2
	ld [$FF00+$DB], a
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a
	ld a, 2
	ld [$A478], a
	ret

UnknownData_9595:
INCBIN "baserom.gb", $9595, $9606 - $9595

	ld a, [$FF00+$DF]
	and a
	ret nz
	ld a, [$AF26]
	cp 2
	ret nz
	xor a
	ld [$FF00+$E2], a
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 4
	ld [$AF36], a
	ld a, 9
	ld [$AF37], a
	call UnknownCall_B224
	ld a, 7
	ld [$FF00+$DB], a
	ret
	call UnknownCall_B1D6
	call UnknownCall_B270
	ld a, [$FF00+$E0]
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, 2
	ld [$FF00+$DF], a
	ld a, [$FF00+$DD]
	xor $40
	ld [$FF00+$DD], a
	ret

UnknownData_9641:
INCBIN "baserom.gb", $9641, $9642 - $9641

	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_965E
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 5
	ld [$AF36], a
	ld a, 12
	ld [$AF37], a
	ld a, [$FF00+$DD]
	ld [$AF38], a
	call UnknownCall_B224
	ret

UnknownRJump_965E:
	call UnknownCall_B38C
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_966A:
INCBIN "baserom.gb", $966A, $9670 - $966A

	call UnknownCall_B18F
	call UnknownCall_B276
	ld a, [$FF00+$E0]
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, 3
	ld [$FF00+$DF], a
	ld a, [$FF00+$DD]
	xor $40
	ld [$FF00+$DD], a
	ret
	ld b, 4
	call UnknownCall_B270
	ld a, [$FF00+$D9]
	cp 8
	ret nc
	ld a, 29
	ld [$FF9B], a
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_96B2
	ld a, [$FF00+$EC]
	inc a
	ld [$FF00+$EC], a
	cp 8
	ret nz
	xor a
	ld [$FF00+$EC], a
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 24
	call UnknownCall_B276
	ret

UnknownRJump_96B2:
	call UnknownCall_B2EF
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_96BE:
INCBIN "baserom.gb", $96BE, $96C4 - $96BE

	call UnknownCall_B1D6
	call UnknownCall_B270
	ld a, [$FF00+$E0]
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, 2
	ld [$FF00+$DF], a
	ld a, [$FF00+$DD]
	xor $40
	ld [$FF00+$DD], a
	ld b, 16
	call UnknownCall_B270
	ret
	call UnknownCall_B18F
	call UnknownCall_B276
	ld a, [$FF00+$E0]
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, 3
	ld [$FF00+$DF], a
	ld a, [$FF00+$DD]
	xor $40
	ld [$FF00+$DD], a
	ld b, 16
	call UnknownCall_B276
	ret
	call UnknownCall_9285
	ld a, [$AF3E]
	and a
	jr z, UnknownRJump_972D
	ld a, [$FF00+$DB]
	ld [$AF37], a
	ld a, [$FF00+$DF]
	ld [$AFC4], a
	ld a, [$FF00+$E2]
	ld [$AFCC], a
	ld a, [$AFC3]
	and a
	jr z, UnknownRJump_9725
	ld a, 17
	ld [$FF00+$DB], a
	ld a, [$AFCD]
	ld [$FF00+$EC], a

UnknownJump_9725:
UnknownRJump_9725:
	xor a
	ld [$FF00+$E2], a
	ld a, 1
	ld [$FF00+$DF], a
	ret

UnknownRJump_972D:
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_9752
	call UnknownCall_B14E
	ret nz
	ld a, [$FF00+$EC]
	inc a
	ld [$FF00+$EC], a
	cp 112
	ret nz
	xor a
	ld [$FF00+$EC], a
	ld a, 3
	ld [$FF00+$DF], a
	ld a, 8
	ld [$FF00+$EA], a
	call UnknownCall_97FA
	ld a, 2
	ld [$A470], a
	ret

UnknownRJump_9752:
	dec a
	rst $28

UnknownData_9754:
INCBIN "baserom.gb", $9754, $9762 - $9754

	call UnknownCall_B40E
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_9770
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz

UnknownRJump_9770:
	ld a, [$AF26]
	and a
	jp nz, UnknownJump_9435
	xor a
	ld [$FF00+$DE], a
	ld a, 20
	ld [$FF00+$DB], a
	ld a, 5
	ld [$FF00+$DF], a
	xor a
	ld [$FF00+$E2], a
	ret
	call UnknownCall_9C19
	ld a, [$FF00+$EA]
	and a
	ret nz
	ld a, 4
	ld [$FF00+$DF], a
	ld a, 16
	ld [$FF00+$DB], a
	ld a, 69
	ld [$FF00+$E2], a
	ld a, 112
	ld [$FF00+$EC], a
	ld a, [$FF04]
	and $03
	ld [$AFC7], a
	ld a, 9
	ld [$AF36], a
	ld a, 26
	ld [$AF37], a
	ld a, [$FF00+$DD]
	ld [$AF38], a
	call UnknownCall_B224
	ld a, 6
	ld [$A478], a
	ret
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 20
	ld [$FF00+$DB], a
	ld a, 5
	ld [$FF00+$DF], a
	xor a
	ld [$FF00+$E2], a
	ret
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld a, [$FF00+$DB]
	inc a
	ld [$FF00+$DB], a
	cp 25
	ret nz
	ld a, 14
	ld [$FF00+$DB], a
	ld a, 6
	ld [$FF00+$DF], a
	ld a, 48
	ld [$FF00+$E8], a
	ret
	ld b, 2
	ld a, [$FF00+$E8]
	sub b
	ld [$FF00+$E8], a
	ret nz
	ld a, 7
	ld [$FF00+$DF], a
	ret
	xor a
	ld [$FF00+$DF], a
	ret

UnknownCall_97FA:
	ld a, 112
	ld [$FF00+$D9], a
	ld a, [$FF04]
	and $03
	jr z, UnknownRJump_980D
	ld a, [$AFC9]
	xor $01
	ld [$AFC9], a

UnknownRJump_980D:
	ld a, [$AFC9]
	and a
	jr nz, UnknownRJump_981B
	ld a, 152
	ld [$FF00+$DA], a
	xor a
	ld [$FF00+$DD], a
	ret

UnknownRJump_981B:
	ld a, 24
	ld [$FF00+$DA], a
	ld a, 32
	ld [$FF00+$DD], a
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_9862
	ld a, [$AFC8]
	and a
	ret z
	ld a, [$AFC7]
	bit 0, a
	ret z
	dec a
	jr z, UnknownRJump_9845
	ld a, [$AFC9]
	and a
	jr nz, UnknownRJump_984B

UnknownRJump_983D:
	ld a, [$AF29]
	cp 96
	ret nz
	jr UnknownRJump_9851

UnknownRJump_9845:
	ld a, [$AFC9]
	and a
	jr nz, UnknownRJump_983D

UnknownRJump_984B:
	ld a, [$AF29]
	cp 32
	ret nz

UnknownRJump_9851:
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 80
	ld [$FF00+$E8], a
	ld a, 64
	ld [$FF00+$EC], a
	ld a, 25
	ld [$FF00+$DB], a
	ret

UnknownRJump_9862:
	dec a
	rst $28

UnknownData_9864:
INCBIN "baserom.gb", $9864, $986C - $9864

	call UnknownCall_B3F4
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 2
	ld [$FF00+$DF], a
	ld a, 19
	ld [$FF00+$DB], a
	ld a, 5
	ld [$A478], a
	ret
	ld a, [$AF26]
	and a
	jr nz, UnknownRJump_98A0
	ld b, 2
	call UnknownCall_B270
	call UnknownCall_3D10
	ld a, [$FF00+$E8]
	sub b
	ld [$FF00+$E8], a
	ret nz
	ld a, 3
	ld [$FF00+$DF], a
	ld a, 32
	ld [$FF00+$EC], a
	ret

UnknownRJump_98A0:
	xor a
	ld [$FF00+$E2], a
	ret
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	xor a
	ld [$AFC8], a
	ld a, 4
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$D9]
	cp 132
	jr nc, UnknownRJump_98C0
	call UnknownCall_B18F
	call UnknownCall_B276
	ret

UnknownRJump_98C0:
	ld a, 132
	ld [$FF00+$D9], a
	xor a
	ld [$FF00+$DF], a
	ret
	ld a, [$AF26]
	cp 2
	jr z, UnknownRJump_98F0
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_9908
	ld a, [$AFC8]
	and a
	ret z
	ld a, [$AFC7]
	cp 2
	ret nz
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 64
	ld [$FF00+$E8], a
	ld a, 64
	ld [$FF00+$EC], a
	ld a, 25
	ld [$FF00+$DB], a
	ret

UnknownRJump_98F0:
	ld a, 116
	ld [$FF00+$D9], a
	ld a, 88
	ld [$FF00+$DA], a

UnknownJump_98F8:
	ld a, 4
	ld [$FF00+$D5], a
	ld a, 9
	ld [$FF00+$DB], a
	xor a
	ld [$FF00+$DF], a
	ld [$FF00+$E0], a
	ld [$FF00+$E2], a
	ret

UnknownRJump_9908:
	dec a
	rst $28

UnknownData_990A:
INCBIN "baserom.gb", $990A, $9912 - $990A

	ld a, [$FF00+$D9]
	cp 116
	jr nc, UnknownRJump_991F
	call UnknownCall_B18F
	call UnknownCall_B276
	ret

UnknownRJump_991F:
	ld a, 116
	ld [$FF00+$D9], a
	xor a
	ld [$FF00+$DF], a
	ret
	call UnknownCall_B2FD
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_994A
	ld a, 64
	ld [$FF00+$E2], a
	call UnknownCall_3CB1
	ld b, 28
	call UnknownCall_B270
	ld b, 16
	ld a, [$FF00+$DD]
	and a
	jr nz, UnknownRJump_9946
	call UnknownCall_B264
	ret

UnknownRJump_9946:
	call UnknownCall_B26A
	ret

UnknownRJump_994A:
	dec a
	rst $28

UnknownData_994C:
INCBIN "baserom.gb", $994C, $9954 - $994C

	call UnknownCall_997D
	jr z, UnknownRJump_996E
	call UnknownCall_B264
	jr UnknownRJump_9966
	call UnknownCall_997D
	jr z, UnknownRJump_996E
	call UnknownCall_B26A

UnknownRJump_9966:
	call UnknownCall_99A2
	ld hl, $FFE0
	inc [hl]
	ret

UnknownRJump_996E:
	ld a, [$FF00+$DB]
	add 2
	ld [$FF00+$DB], a
	ld a, 3
	ld [$FF00+$DF], a
	ld a, 32
	ld [$FF00+$EC], a
	ret

UnknownCall_997D:
	ld a, [$AFC7]
	dec a
	jr z, UnknownRJump_998E
	dec a
	jr z, UnknownRJump_9993
	dec a
	jr z, UnknownRJump_9998
	ld hl, $59E2
	jr UnknownRJump_999B

UnknownRJump_998E:
	ld hl, $5A63
	jr UnknownRJump_999B

UnknownRJump_9993:
	ld hl, $5AB4
	jr UnknownRJump_999B

UnknownRJump_9998:
	ld hl, $5AF1

UnknownRJump_999B:
	call UnknownCall_B16B
	ld a, b
	cp 128
	ret

UnknownCall_99A2:
	ld a, [$AFC7]
	dec a
	jr z, UnknownRJump_99AF
	dec a
	jr z, UnknownRJump_99B4
	dec a
	jr z, UnknownRJump_99B9
	ret

UnknownRJump_99AF:
	ld hl, $5B3E
	jr UnknownRJump_99BC

UnknownRJump_99B4:
	ld hl, $5B8F
	jr UnknownRJump_99BC

UnknownRJump_99B9:
	ld hl, $5BCC

UnknownRJump_99BC:
	call UnknownCall_B16B
	call UnknownCall_B276
	ret
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, [$AFC7]
	and a
	jr z, UnknownRJump_99DE
	ld a, 1
	ld [$AFC8], a
	ld a, 4
	ld [$FF00+$DF], a
	ret
	ld a, [$AFC8]
	and a
	ret nz

UnknownRJump_99DE:
	call UnknownCall_B157
	ret

UnknownData_99E2:
INCBIN "baserom.gb", $99E2, $9C19 - $99E2


UnknownCall_9C19:
	ld a, [$FF00+$EA]
	ld b, a
	ld a, [$FF00+$F0]
	and $07
	jr z, UnknownRJump_9C2B
	cp b
	ret nz
	ld a, [$FF00+$DB]
	xor $01
	ld [$FF00+$DB], a
	ret

UnknownRJump_9C2B:
	dec b
	ld a, b
	ld [$FF00+$EA], a
	ld a, [$FF00+$DB]
	res 0, a
	ld [$FF00+$DB], a
	ret
	call UnknownCall_9285
	ld a, [$AF3E]
	and a
	jr z, UnknownRJump_9C7F

UnknownJump_9C3F:
	ld a, [$FF00+$DB]
	ld [$AF37], a
	ld a, [$FF00+$DF]
	ld [$AFC4], a
	ld a, [$FF00+$E2]
	ld [$AFCC], a
	ld b, 1
	ld a, [$AFC3]
	and a
	jr z, UnknownRJump_9C67
	ld a, 19
	ld [$A460], a
	inc b
	ld a, 31
	ld [$FF00+$DB], a
	ld a, [$AFCD]
	ld [$FF00+$EC], a
	jr UnknownRJump_9C6C

UnknownRJump_9C67:
UnknownData_9C67:
INCBIN "baserom.gb", $9C67, $9C6C - $9C67


UnknownRJump_9C6C:
	xor a
	ld [$FF00+$E2], a
	ld a, [$FF00+$D8]
	sub b
	ld [$FF00+$D8], a
	jp z, UnknownJump_9435
	jp c, UnknownJump_9435
	ld a, 1
	ld [$FF00+$DF], a
	ret

UnknownRJump_9C7F:
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_9CA0
	call UnknownCall_B402
	call UnknownCall_B14E
	ret nz

UnknownJump_9C8B:
	ld a, 32
	ld [$FF00+$DB], a
	xor a
	ld [$FF00+$EC], a
	ld a, 3
	ld [$FF00+$DF], a
	ld a, 69
	ld [$FF00+$E2], a
	ld a, 4
	ld [$A470], a
	ret

UnknownRJump_9CA0:
	dec a
	rst $28

UnknownData_9CA2:
INCBIN "baserom.gb", $9CA2, $9CAC - $9CA2

	call UnknownCall_B40E
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_9CBA
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz

UnknownRJump_9CBA:
	ld a, [$AF26]
	and a
	jp nz, UnknownJump_9435
	xor a
	ld [$FF00+$DE], a
	ld a, [$AF37]
	ld [$FF00+$DB], a
	ld a, [$AFC4]
	ld [$FF00+$DF], a
	ld a, [$AFCC]
	ld [$FF00+$E2], a
	ret
	call UnknownCall_B2F6
	jp UnknownJump_9443
	ld b, 1
	call UnknownCall_B26A

UnknownJump_9CDF:
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_9CF6
	call UnknownCall_B1EB
	call UnknownCall_B270
	ld a, [$FF00+$E0]
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, 1
	ld [$FF00+$E8], a
	ret

UnknownRJump_9CF6:
	call UnknownCall_B18F
	call UnknownCall_B276
	ld a, [$FF00+$D9]
	cp 144
	ret c
	ld a, 144
	ld [$FF00+$D9], a
	xor a
	ld [$FF00+$E0], a
	ld [$FF00+$E8], a
	ld a, 4
	ld [$FF00+$DF], a
	ld a, 32
	ld [$FF00+$DD], a
	ret
	call UnknownCall_B3D7
	ld a, [$FF00+$D8]
	srl a
	ld b, a
	ld a, 4
	sub b
	ld b, a
	call UnknownCall_B26A
	ld a, [$FF00+$DA]
	cp 160
	ret c
	jr UnknownRJump_9D3D
	call UnknownCall_B3D7
	ld a, [$FF00+$D8]
	srl a
	ld b, a
	ld a, 4
	sub b
	ld b, a
	call UnknownCall_B264
	ld a, [$FF00+$DA]
	cp 16
	ret nc

UnknownJump_9D3D:
UnknownRJump_9D3D:
	ld a, [$FF00+$DF]
	xor $01
	ld [$FF00+$DF], a
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a
	ld a, [$FF00+$D5]
	ld [$A470], a
	ret
	call UnknownCall_9285
	ld a, [$AF3E]
	and a
	jr z, UnknownRJump_9D5B
	jp UnknownJump_9C3F

UnknownRJump_9D5B:
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_9D77
	call UnknownCall_B402
	ld a, [$AFC1]
	dec a
	ret nz
	xor a
	ld [$AF26], a
	ld a, [$FF00+$EC]
	inc a
	ld [$FF00+$EC], a
	cp 48
	ret nz
	jp UnknownJump_9C8B

UnknownRJump_9D77:
	dec a
	rst $28

UnknownData_9D79:
INCBIN "baserom.gb", $9D79, $9D83 - $9D79

	ld b, 1
	call UnknownCall_B264
	ld a, 8
	ld [$FF00+$EC], a
	jp UnknownJump_9CDF
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_9DA2
	ld a, 40
	ld [$FF00+$DB], a
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 32
	ld [$FF00+$DB], a

UnknownRJump_9DA2:
	ld a, [$FF00+$D8]
	srl a
	ld b, a
	ld a, 4
	sub b
	ld b, a
	call UnknownCall_B264
	ld a, [$FF00+$DA]
	cp 16
	jr c, UnknownRJump_9D3D

UnknownRJump_9DB4:
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_9DC1
	call UnknownCall_B1EB
	call UnknownCall_B270
	jr UnknownRJump_9DC7

UnknownRJump_9DC1:
	call UnknownCall_B187
	call UnknownCall_B276

UnknownJump_9DC7:
UnknownRJump_9DC7:
	ld a, [$FF00+$E0]
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$E8]
	xor $01
	ld [$FF00+$E8], a
	ret nz
	ld a, 8
	ld [$FF00+$EC], a
	ld a, [$FF00+$D5]
	ld [$A470], a
	ret
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_9DF2
	ld a, 40
	ld [$FF00+$DB], a
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 32
	ld [$FF00+$DB], a

UnknownRJump_9DF2:
	ld a, [$FF00+$D8]
	srl a
	ld b, a
	ld a, 4
	sub b
	ld b, a
	call UnknownCall_B26A
	ld a, [$FF00+$DA]
	cp 160
	jp nc, UnknownJump_9D3D
	jr UnknownRJump_9DB4
	call UnknownCall_9285
	ld a, [$AF3E]
	and a
	jr z, UnknownRJump_9E32
	ld a, [$FF00+$DB]
	ld [$AF37], a
	ld a, [$FF00+$DF]
	ld [$AFC4], a
	ld a, [$FF00+$E2]
	ld [$AFCC], a
	ld a, [$AFC3]
	and a
	jp z, UnknownJump_9725
	ld a, 31
	ld [$FF00+$DB], a
	ld a, [$AFCD]
	ld [$FF00+$EC], a
	jp UnknownJump_9725

UnknownRJump_9E32:
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_9E5B
	call UnknownCall_B402
	ld a, [$AFC1]
	and a
	ret nz
	xor a
	ld [$AF26], a
	ld a, [$FF00+$EC]
	inc a
	ld [$FF00+$EC], a
	cp 48
	ret nz
	ld a, 13
	ld [$AF36], a
	ld a, 14
	ld [$AF37], a
	call UnknownCall_B224
	jp UnknownJump_9C8B

UnknownRJump_9E5B:
	dec a
	rst $28

UnknownData_9E5D:
INCBIN "baserom.gb", $9E5D, $9E67 - $9E5D

	ld a, 8
	ld [$FF00+$EC], a
	jp UnknownJump_9CDF
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_9E81
	ld a, 40
	ld [$FF00+$DB], a
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 41
	ld [$FF00+$DB], a

UnknownRJump_9E81:
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$AFC5]
	srl a
	ld b, a
	ld a, 4
	sub b
	ld b, a
	call UnknownCall_B264
	ld a, [$FF00+$DA]
	cp 16
	jp c, UnknownJump_9D3D

UnknownRJump_9E9A:
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_9EAA
	call UnknownCall_B1EB
	inc b
	inc b
	call UnknownCall_B270
	jp UnknownJump_9DC7

UnknownRJump_9EAA:
	call UnknownCall_B187
	inc b
	inc b
	call UnknownCall_B276
	jp UnknownJump_9DC7
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_9EC8
	ld a, 40
	ld [$FF00+$DB], a
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 41
	ld [$FF00+$DB], a

UnknownRJump_9EC8:
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$AFC5]
	srl a
	ld b, a
	ld a, 4
	sub b
	ld b, a
	call UnknownCall_B26A
	ld a, [$FF00+$DA]
	cp 160
	jp nc, UnknownJump_9D3D
	jr UnknownRJump_9E9A
	ld a, [$AF26]
	cp 2
	ret nz
	ld a, 144
	ld [$FF00+$D9], a
	ld a, 88
	ld [$FF00+$DA], a
	jp UnknownJump_98F8
	call UnknownCall_9285
	ld a, [$AF3E]
	and a
	jr z, UnknownRJump_9F1E
	ld a, [$FF00+$DB]
	ld [$AF37], a
	ld a, [$FF00+$DF]
	ld [$AFC4], a
	ld a, [$FF00+$E2]
	ld [$AFCC], a
	ld a, [$AFC3]
	and a
	jp z, UnknownJump_9725
	ld a, 48
	ld [$FF00+$DB], a
	ld a, 104
	ld [$FF00+$EC], a
	jp UnknownJump_9725

UnknownRJump_9F1E:
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_9F36
	call UnknownCall_B14E
	ret nz
	ld a, 3
	ld [$FF00+$DF], a
	ld a, 69
	ld [$FF00+$E2], a
	ld a, 32
	ld [$FF00+$E8], a
	ld [$FF00+$E9], a
	ret

UnknownRJump_9F36:
	dec a
	rst $28

UnknownData_9F38:
INCBIN "baserom.gb", $9F38, $9F46 - $9F38

	ld b, 2
	call UnknownCall_B270
	ld a, [$FF00+$E8]
	sub b
	ld [$FF00+$E8], a
	ret nz
	ld [$FF00+$DC], a
	ld a, 4
	ld [$FF00+$DF], a
	ld a, [$FF00+$E9]
	ld [$FF00+$E8], a
	ld a, 46
	ld [$FF00+$DB], a
	ld a, 7
	ld [$A470], a
	ret
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld b, 1
	call UnknownCall_B270
	ld a, [$FF00+$E8]
	sub b
	ld [$FF00+$E8], a
	ret nz
	ld a, [$FF04]
	and $03
	jr nz, UnknownRJump_9FF2

UnknownJump_9F7C:
	ld a, 44
	ld [$FF00+$DB], a
	jr UnknownRJump_9FDF
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_9F8F
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 44
	ld [$FF00+$DB], a

UnknownRJump_9F8F:
	call UnknownCall_B2FD
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld a, [$FF00+$DA]
	cp 160
	jr nc, UnknownRJump_9FA4
	ld b, 1
	call UnknownCall_B26A
	jr UnknownRJump_9FD1

UnknownRJump_9FA4:
UnknownData_9FA4:
INCBIN "baserom.gb", $9FA4, $9FD1 - $9FA4


UnknownRJump_9FD1:
	inc b
	call UnknownCall_B276
	ld a, [$FF00+$E8]
	sub b
	ld [$FF00+$E8], a
	ret nz
	ld a, 46
	ld [$FF00+$DB], a

UnknownRJump_9FDF:
	ld a, [$FF00+$E9]
	ld [$FF00+$E8], a
	ld a, [$FF00+$DF]
	xor $01
	ld [$FF00+$DF], a
	bit 0, a
	ret nz
	ld a, 7
	ld [$A470], a
	ret

UnknownRJump_9FF2:
	ld a, [$AFCB]
	and a
	jr z, UnknownRJump_A004
	ld a, [$AD4F]
	and a
	jp nz, UnknownJump_9F7C
	ld hl, $AD49
	jr UnknownRJump_A00E

UnknownRJump_A004:
	ld a, [$AD2F]
	and a
	jp nz, UnknownJump_9F7C
	ld hl, $AD29

UnknownRJump_A00E:
	ld a, [$FF00+$D9]
	ld [hli], a
	ld a, [$FF00+$DA]
	ld [hli], a
	ld a, 49
	ld [hl], a
	ld a, [$AFCB]
	xor $01
	ld [$AFCB], a
	ld a, 47
	ld [$FF00+$DB], a
	ld a, 48
	ld [$FF00+$EC], a
	jr UnknownRJump_9FDF
	ld a, [$AF26]
	cp 2
	jr nz, UnknownRJump_A041
	ld a, [$AF29]
	cp 64
	ret nz
	ld a, 112
	ld [$FF00+$D9], a
	ld a, 88
	ld [$FF00+$DA], a
	jp UnknownJump_98F8

UnknownRJump_A041:
	call UnknownCall_9285
	ld a, [$AF3E]
	and a
	ret nz
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_A05C
	ld a, [$FF00+$DB]
	cp 14
	ret z
	ld a, 3
	ld [$FF00+$DF], a
	ld a, 69
	ld [$FF00+$E2], a
	ret

UnknownRJump_A05C:
	dec a
	rst $28

UnknownData_A05E:
INCBIN "baserom.gb", $A05E, $A064 - $A05E

	call UnknownCall_B1EB
	call UnknownCall_B276
	ld a, [$FF00+$E0]
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, 50
	ld [$FF00+$DB], a
	call UnknownCall_B27C
	ld a, 32
	ld [$FF00+$E9], a
	ret
	call UnknownCall_B2FD
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld b, 1
	call UnknownCall_B264
	jr UnknownRJump_A099

UnknownData_A08C:
INCBIN "baserom.gb", $A08C, $A099 - $A08C


UnknownRJump_A099:
	ld a, [$FF00+$DA]
	cp 184
	jr nc, UnknownRJump_A0B1
	call UnknownCall_B2C2
	dec a
	jr z, UnknownRJump_A0AB
	ld b, 1
	call UnknownCall_B270
	ret

UnknownRJump_A0AB:
	ld b, 1
	call UnknownCall_B276
	ret

UnknownRJump_A0B1:
	ld a, 14
	ld [$FF00+$DB], a
	xor a
	ld [$FF00+$DF], a
	ret
	call UnknownCall_9285
	ld a, [$AF3E]
	and a
	jr z, UnknownRJump_A0E8
	ld a, [$FF00+$DB]
	ld [$AF37], a
	ld a, [$FF00+$DF]
	ld [$AFC4], a
	ld a, [$FF00+$E2]
	ld [$AFCC], a
	ld a, [$AFC3]
	and a
	jp z, UnknownJump_9725
	ld a, 53
	ld [$FF00+$DB], a
	xor a
	ld [$FF00+$E2], a
	ld a, 9
	ld [$FF00+$DF], a
	ld a, 1
	ld [$FF00+$EC], a
	ret

UnknownRJump_A0E8:
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_A103
	call UnknownCall_B14E
	ret nz
	ld a, 3
	ld [$FF00+$DF], a
	ld a, 69
	ld [$FF00+$E2], a
	ld a, 4
	ld [$AFC7], a
	ld a, 1
	ld [$FF00+$EC], a
	ret

UnknownRJump_A103:
	dec a
	rst $28

UnknownData_A105:
INCBIN "baserom.gb", $A105, $A117 - $A105

	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 5
	ld [$A470], a
	ld a, 1
	ld [$FF00+$DF], a
	ld a, [$AFCD]
	ld [$FF00+$EC], a
	ret
	call UnknownCall_B3C0
	jp UnknownJump_9443
	ld a, [$AFC7]
	and a
	jr z, UnknownRJump_A17D
	call UnknownCall_A1B3
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, [$AD2F]
	and a
	jr nz, UnknownRJump_A159
	ld hl, $AD29
	ld a, [$FF00+$D9]
	ld [hli], a
	ld a, [$FF00+$DA]
	sub 8
	ld [hli], a
	ld a, 59
	ld [hli], a
	inc l
	ld a, [$FF00+$DD]
	ld [hl], a

UnknownRJump_A159:
	ld a, [$AD4F]
	and a
	jr nz, UnknownRJump_A171
	ld hl, $AD49
	ld a, [$FF00+$D9]
	add 16
	ld [hli], a
	ld a, [$FF00+$DA]
	ld [hli], a
	ld a, 60
	ld [hli], a
	inc l
	ld a, [$FF00+$DD]
	ld [hl], a

UnknownRJump_A171:
	ld a, [$AFC7]
	dec a
	ld [$AFC7], a
	ld a, 96
	ld [$FF00+$EC], a
	ret

UnknownRJump_A17D:
	xor a
	ld [$FF00+$E8], a
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	ld a, 92
	ld [$FF00+$E0], a
	ret
	ld a, [$AFC7]
	and a
	jr z, UnknownRJump_A17D
	call UnknownCall_A1B3
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, [$AD2F]
	and a
	jr nz, UnknownRJump_A159
	ld hl, $AD29
	ld a, [$FF00+$D9]
	ld [hli], a
	ld a, [$FF00+$DA]
	add 8
	ld [hli], a
	ld a, 59
	ld [hli], a
	inc l
	ld a, [$FF00+$DD]
	ld [hl], a
	jr UnknownRJump_A159

UnknownCall_A1B3:
	ld a, [$FF00+$E8]
	and a
	jr z, UnknownRJump_A1C0
	call UnknownCall_B183
	call UnknownCall_B270
	jr UnknownRJump_A1C6

UnknownRJump_A1C0:
	call UnknownCall_B1E4
	call UnknownCall_B276

UnknownRJump_A1C6:
	ld a, [$FF00+$E0]
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$E8]
	xor $01
	ld [$FF00+$E8], a
	ret
	ld b, 1
	call UnknownCall_B276
	ld hl, $5595
	call UnknownCall_B16B
	call UnknownCall_B264
	ld a, [$FF00+$E0]
	dec a
	ld [$FF00+$E0], a
	ret nz
	ld a, 1
	ld [$FF00+$E0], a
	ld a, 5
	ld [$FF00+$DF], a
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a
	ret
	ld b, 1
	call UnknownCall_B270
	ld hl, $5595
	call UnknownCall_B16B
	call UnknownCall_B264
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	cp 93
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, 6
	ld [$FF00+$DF], a
	ld a, 48
	ld [$FF00+$D9], a
	ld a, 32
	ld [$FF00+$DA], a
	ld a, 80
	ld [$FF00+$EC], a
	ld a, [$FF04]
	and $03
	ld [$AFC7], a
	ret
	ld b, 1
	call UnknownCall_B276
	ld hl, $5595
	call UnknownCall_B16B
	call UnknownCall_B26A
	ld a, [$FF00+$E0]
	dec a
	ld [$FF00+$E0], a
	ret nz
	ld a, 1
	ld [$FF00+$E0], a
	ld a, 8
	ld [$FF00+$DF], a
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a
	ret
	ld b, 1
	call UnknownCall_B270
	ld hl, $5595
	call UnknownCall_B16B
	call UnknownCall_B26A
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	cp 93
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, 3
	ld [$FF00+$DF], a
	ld a, 80
	ld [$FF00+$EC], a
	ld a, 48
	ld [$FF00+$D9], a
	ld a, 144
	ld [$FF00+$DA], a
	ld a, [$FF04]
	and $03
	ld [$AFC7], a
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_A295
	ld a, [$FF00+$DB]
	cp 14
	ret z
	ld a, 64
	ld [$FF00+$E2], a
	call UnknownCall_3CB1
	ld a, 9
	ld [$A478], a
	ret

UnknownRJump_A295:
	dec a
	rst $28

UnknownData_A297:
INCBIN "baserom.gb", $A297, $A29B - $A297

	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld b, 3
	call UnknownCall_B264
	jr UnknownRJump_A2B1
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld b, 3
	call UnknownCall_B26A

UnknownRJump_A2B1:
	ld a, [$FF00+$DA]
	cp 184
	ret c
	ld a, 14
	ld [$FF00+$DB], a
	xor a
	ld [$FF00+$DF], a
	ret
	ld a, [$AF26]
	cp 2
	jr nz, UnknownRJump_A2D0
	ld a, 128
	ld [$FF00+$D9], a
	ld a, 88
	ld [$FF00+$DA], a
	jp UnknownJump_98F8

UnknownRJump_A2D0:
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_A2E3
	ld a, [$FF00+$DB]
	cp 14
	ret z
	ld a, 3
	ld [$FF00+$DF], a
	ld a, 64
	ld [$FF00+$E2], a
	ret

UnknownRJump_A2E3:
	dec a
	rst $28

UnknownData_A2E5:
INCBIN "baserom.gb", $A2E5, $A2F1 - $A2E5

	call UnknownCall_B18F
	call UnknownCall_B276
	ld a, [$FF00+$D9]
	cp 128
	ret c
	call UnknownCall_3CB1
	ret
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld b, 3
	call UnknownCall_B264
	jr UnknownRJump_A316
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld b, 3
	call UnknownCall_B26A

UnknownRJump_A316:
	call UnknownCall_B2DB
	cp 16
	ret nc
	ld a, 4
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld a, [$FF00+$DB]
	inc a
	ld [$FF00+$DB], a
	cp 62
	ret nz
	ld a, 5
	ld [$FF00+$DF], a
	ld a, 48
	ld [$FF00+$E8], a
	ret
	call UnknownCall_B2FD
	ld b, 2
	call UnknownCall_B270
	ld a, [$FF00+$E8]
	sub b
	ld [$FF00+$E8], a
	ret nz
	ld a, 6
	ld [$FF00+$DF], a
	ld a, 6
	ld [$FF00+$EC], a
	ld a, 13
	ld [$A470], a
	ret
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld a, [$FF00+$DB]
	cp 65
	jr z, UnknownRJump_A362
	inc a
	ld [$FF00+$DB], a
	ret

UnknownRJump_A362:
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	xor a
	ld [$FF00+$DF], a
	ld [$FF00+$E2], a
	ld a, 14
	ld [$FF00+$DB], a
	ret
	call UnknownCall_9285
	ld a, [$AF3E]
	and a
	jr z, UnknownRJump_A39C
	ld a, [$FF00+$DB]
	ld [$AF37], a
	ld a, [$FF00+$DF]
	ld [$AFC4], a
	ld a, [$FF00+$E2]
	ld [$AFCC], a
	ld a, [$AFC3]
	and a
	jp z, UnknownJump_9725
	ld a, 74
	ld [$FF00+$DB], a
	ld a, 48
	ld [$FF00+$EC], a
	jp UnknownJump_9725

UnknownRJump_A39C:
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_A3B6
	call UnknownCall_B14E
	ret nz
	ld a, 3
	ld [$FF00+$DF], a
	ld a, 69
	ld [$FF00+$E2], a
	ld a, 36
	ld [$FF00+$E9], a
	ld a, 16
	ld [$FF00+$DE], a
	ret

UnknownRJump_A3B6:
	ld a, [$FF00+$DF]
	cp 3
	call nc, UnknownCall_A3FF
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_A3C1:
INCBIN "baserom.gb", $A3C1, $A3FF - $A3C1


UnknownCall_A3FF:
	ld a, 16
	ld [$FF00+$DE], a
	call UnknownCall_B339
	ld a, [$FF00+$DC]
	and a
	ret nz
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, 7
	ld [$A478], a
	ld a, [$FF04]
	and $3F
	ret nz
	ld a, 3
	ld [$A470], a
	ret
	call UnknownCall_B2FD
	call UnknownCall_9443
	ld a, 16
	ld [$FF00+$DE], a
	ret
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_A434
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_A434:
	ld b, 2
	call UnknownCall_B264
	ld a, [$FF00+$E9]
	sub b
	ld [$FF00+$E9], a
	ret nz
	xor a
	ld [$FF00+$DC], a
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	ret
	ld hl, $6472
	call UnknownCall_B16B
	ld a, b
	cp 128
	jr z, UnknownRJump_A465
	call UnknownCall_B276
	ld hl, $648C
	call UnknownCall_B16B
	call UnknownCall_B264
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	ret

UnknownRJump_A465:
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	ld a, 76
	ld [$FF00+$E9], a
	ret

UnknownData_A472:
INCBIN "baserom.gb", $A472, $A4A5 - $A472

	ld b, 2
	call UnknownCall_B264
	ld a, [$FF00+$E9]
	sub b
	ld [$FF00+$E9], a
	ret nz
	ld a, 6
	ld [$FF00+$DF], a
	ld a, 69
	ld [$FF00+$DB], a
	xor a
	ld [$FF00+$EA], a
	ld a, 68
	ld [$FF00+$E2], a
	ret
	ld hl, $64EA
	call UnknownCall_B16B
	ld a, b
	cp 128
	jr z, UnknownRJump_A4DD
	call UnknownCall_B270
	ld hl, $64F7
	call UnknownCall_B16B
	call UnknownCall_B264
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	ret

UnknownRJump_A4DD:
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	ld a, 28
	ld [$FF00+$E8], a
	ret

UnknownData_A4EA:
INCBIN "baserom.gb", $A4EA, $A504 - $A4EA

	ld b, 1
	call UnknownCall_B270
	ld a, [$FF00+$E8]
	sub b
	ld [$FF00+$E8], a
	ret nz
	ld a, 8
	ld [$FF00+$DF], a
	ld a, 66
	ld [$FF00+$DB], a
	xor a
	ld [$FF00+$EA], a
	ld a, 36
	ld [$FF00+$E9], a
	ld b, 4
	call UnknownCall_B26A
	ld a, 128
	ld [$FF00+$DC], a
	ld b, 2
	call UnknownCall_B264
	ld a, [$FF00+$E9]
	sub b
	ld [$FF00+$E9], a
	ret nz
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	ld a, 64
	ld [$FF00+$EC], a
	ld a, 69
	ld [$FF00+$E2], a
	ld a, 32
	ld [$FF00+$DD], a
	ld a, 36
	ld [$FF00+$E9], a
	ret
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_A551
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_A551:
	ld b, 2
	call UnknownCall_B26A
	ld a, [$FF00+$E9]
	sub b
	ld [$FF00+$E9], a
	ret nz
	xor a
	ld [$FF00+$DC], a
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	ret
	ld hl, $658F
	call UnknownCall_B16B
	ld a, b
	cp 128
	jr z, UnknownRJump_A582
	call UnknownCall_B276
	ld hl, $65A0
	call UnknownCall_B16B
	call UnknownCall_B26A
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	ret

UnknownRJump_A582:
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	ld a, 80
	ld [$FF00+$E9], a
	ret

UnknownData_A58F:
INCBIN "baserom.gb", $A58F, $A5B0 - $A58F

	ld b, 2
	call UnknownCall_B26A
	ld a, [$FF00+$E9]
	sub b
	ld [$FF00+$E9], a
	ret nz
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	ld a, 69
	ld [$FF00+$DB], a
	xor a
	ld [$FF00+$EA], a
	ld a, 68
	ld [$FF00+$E2], a
	ret
	ld hl, $64EA
	call UnknownCall_B16B
	ld a, b
	cp 128
	jr z, UnknownRJump_A5E9
	call UnknownCall_B270
	ld hl, $64F7
	call UnknownCall_B16B
	call UnknownCall_B26A
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	ret

UnknownRJump_A5E9:
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	ld a, 68
	ld [$FF00+$E8], a
	ret
	ld b, 1
	call UnknownCall_B270
	ld a, [$FF00+$E8]
	sub b
	ld [$FF00+$E8], a
	ret nz
	ld a, 14
	ld [$FF00+$DF], a
	ld a, 66
	ld [$FF00+$DB], a
	xor a
	ld [$FF00+$EA], a
	ld a, 64
	ld [$FF00+$DD], a
	ret
	ld hl, $64F7
	call UnknownCall_B16B
	ld a, b
	cp 128
	jr z, UnknownRJump_A62E
	call UnknownCall_B270
	ld hl, $64EA
	call UnknownCall_B16B
	call UnknownCall_B264
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	ret

UnknownRJump_A62E:
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	ld a, 28
	ld [$FF00+$E9], a
	ret
	ld b, 2
	call UnknownCall_B264
	ld a, [$FF00+$E9]
	sub b
	ld [$FF00+$E9], a
	ret nz
	ld a, 16
	ld [$FF00+$DF], a
	ld a, 96
	ld [$FF00+$E8], a
	ld a, 69
	ld [$FF00+$DB], a
	xor a
	ld [$FF00+$EA], a
	ld a, 69
	ld [$FF00+$E2], a
	ret
	ld b, 3
	call UnknownCall_B276
	ld a, [$FF00+$E8]
	sub b
	ld [$FF00+$E8], a
	ret nz
	ld a, 17
	ld [$FF00+$DF], a
	ld a, 28
	ld [$FF00+$E9], a
	ld a, 32
	ld [$FF00+$DD], a
	ld a, 66
	ld [$FF00+$DB], a
	xor a
	ld [$FF00+$EA], a
	ret
	ld b, 2
	call UnknownCall_B26A
	ld a, [$FF00+$E9]
	sub b
	ld [$FF00+$E9], a
	ret nz
	ld a, 18
	ld [$FF00+$DF], a
	ret
	ld hl, $66B7
	call UnknownCall_B16B
	ld a, b
	cp 128
	jr z, UnknownRJump_A6A6
	call UnknownCall_B270
	ld hl, $66C3
	call UnknownCall_B16B
	call UnknownCall_B26A
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	ret

UnknownRJump_A6A6:
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	ld a, 36
	ld [$FF00+$E9], a
	ld a, 128
	ld [$FF00+$DC], a
	ret

UnknownData_A6B7:
INCBIN "baserom.gb", $A6B7, $A6CE - $A6B7

	ld b, 2
	call UnknownCall_B26A
	ld a, [$FF00+$E9]
	sub b
	ld [$FF00+$E9], a
	ret nz
	ld a, 20
	ld [$FF00+$DF], a
	xor a
	ld [$FF00+$DD], a
	ld a, 64
	ld [$FF00+$EC], a
	ld a, 36
	ld [$FF00+$E9], a
	ret
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_A6F2
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_A6F2:
	ld b, 2
	call UnknownCall_B264
	ld a, [$FF00+$E9]
	sub b
	ld [$FF00+$E9], a
	ret nz
	xor a
	ld [$FF00+$DC], a
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	ret
	ld hl, $6730
	call UnknownCall_B16B
	ld a, b
	cp 128
	jr z, UnknownRJump_A723
	call UnknownCall_B276
	ld hl, $673C
	call UnknownCall_B16B
	call UnknownCall_B264
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	ret

UnknownRJump_A723:
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	ld a, 84
	ld [$FF00+$E9], a
	ret

UnknownData_A730:
INCBIN "baserom.gb", $A730, $A747 - $A730

	ld b, 2
	call UnknownCall_B264
	ld a, [$FF00+$E9]
	sub b
	ld [$FF00+$E9], a
	ret nz
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	ld a, 69
	ld [$FF00+$DB], a
	xor a
	ld [$FF00+$EA], a
	ld a, 68
	ld [$FF00+$E2], a
	ret
	ld hl, $64EA
	call UnknownCall_B16B
	ld a, b
	cp 128
	jr z, UnknownRJump_A780
	call UnknownCall_B270
	ld hl, $64F7
	call UnknownCall_B16B
	call UnknownCall_B264
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	ret

UnknownRJump_A780:
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	ld a, 68
	ld [$FF00+$E8], a
	ret
	ld b, 1
	call UnknownCall_B270
	ld a, [$FF00+$E8]
	sub b
	ld [$FF00+$E8], a
	ret nz
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	ld a, 66
	ld [$FF00+$DB], a
	xor a
	ld [$FF00+$EA], a
	ld a, 96
	ld [$FF00+$DD], a
	ret
	ld hl, $64F7
	call UnknownCall_B16B
	ld a, b
	cp 128
	jr z, UnknownRJump_A7C6
	call UnknownCall_B270
	ld hl, $64EA
	call UnknownCall_B16B
	call UnknownCall_B26A
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	ret

UnknownRJump_A7C6:
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	ld a, 28
	ld [$FF00+$E9], a
	ret
	ld b, 2
	call UnknownCall_B26A
	ld a, [$FF00+$E9]
	sub b
	ld [$FF00+$E9], a
	ret nz
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	ld a, 69
	ld [$FF00+$DB], a
	xor a
	ld [$FF00+$EA], a
	ld a, 64
	ld [$FF00+$DD], a
	ld a, 69
	ld [$FF00+$E2], a
	ld a, 96
	ld [$FF00+$E8], a
	ret
	ld b, 3
	call UnknownCall_B276
	ld a, [$FF00+$E8]
	sub b
	ld [$FF00+$E8], a
	ret nz
	ld a, 28
	ld [$FF00+$DF], a
	ld a, 66
	ld [$FF00+$DB], a
	xor a
	ld [$FF00+$EA], a
	ld a, 32
	ld [$FF00+$DD], a
	ld a, 56
	ld [$FF00+$E9], a
	ret
	ld b, 2
	call UnknownCall_B26A
	ld a, [$FF00+$E9]
	sub b
	ld [$FF00+$E9], a
	ret nz
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	ld a, 69
	ld [$FF00+$DB], a
	xor a
	ld [$FF00+$EA], a
	ld a, 68
	ld [$FF00+$E2], a
	ld a, 32
	ld [$FF00+$DD], a
	ld a, 96
	ld [$FF00+$E8], a
	ret
	ld hl, $64EA
	call UnknownCall_B16B
	ld a, b
	cp 128
	jr z, UnknownRJump_A857
	call UnknownCall_B270
	ld hl, $64F7
	call UnknownCall_B16B
	call UnknownCall_B26A
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	ret

UnknownRJump_A857:
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	ld a, 60
	ld [$FF00+$E8], a
	ret
	ld b, 1
	call UnknownCall_B270
	ld a, [$FF00+$E8]
	sub b
	ld [$FF00+$E8], a
	ret nz
	ld a, 31
	ld [$FF00+$DF], a
	ld a, 66
	ld [$FF00+$DB], a
	xor a
	ld [$FF00+$EA], a
	ld a, 32
	ld [$FF00+$DD], a
	ld a, 36
	ld [$FF00+$E9], a
	ld b, 4
	call UnknownCall_B264
	ld a, 128
	ld [$FF00+$DC], a
	ret
	ld b, 2
	call UnknownCall_B26A
	ld a, [$FF00+$E9]
	sub b
	ld [$FF00+$E9], a
	ret nz
	ld a, 3
	ld [$FF00+$DF], a
	xor a
	ld [$FF00+$DD], a
	ld a, 69
	ld [$FF00+$E2], a
	ld a, 36
	ld [$FF00+$E9], a
	ld a, 64
	ld [$FF00+$EC], a
	ret
	call UnknownCall_9285
	ld a, [$AF3E]
	and a
	jr z, UnknownRJump_A8D6
	ld a, [$FF00+$DB]
	ld [$AF37], a
	ld a, [$FF00+$DF]
	ld [$AFC4], a
	ld a, [$FF00+$E2]
	ld [$AFCC], a
	ld a, [$AFC3]
	and a
	jp z, UnknownJump_9725
	ld a, 82
	ld [$FF00+$DB], a
	ld a, [$AFCD]
	ld [$FF00+$EC], a
	jp UnknownJump_9725

UnknownRJump_A8D6:
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_A90A
	ld a, [$A266]
	cp 97
	call z, UnknownCall_A8FF
	ld a, [$AFCF]
	and a
	call nz, UnknownCall_B2EF
	call UnknownCall_B14E
	ret nz
	xor a
	ld [$AFCF], a
	ld a, 3
	ld [$FF00+$DF], a
	ld a, 65
	ld [$FF00+$E2], a
	ld a, 79
	ld [$FF00+$DB], a
	ret

UnknownCall_A8FF:
	ld a, 15
	ld [$A470], a
	ld a, 1
	ld [$AFCF], a
	ret

UnknownRJump_A90A:
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_A90E:
INCBIN "baserom.gb", $A90E, $A920 - $A90E

	call UnknownCall_B40E
	call UnknownCall_B18F
	call UnknownCall_B276
	ld a, [$FF00+$D9]
	cp 138
	ret c
	ld a, 6
	ld [$FF00+$DF], a
	ld a, 128
	ld [$FF00+$EC], a
	ret
	call UnknownCall_B40E
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	xor a
	ld [$FF00+$EA], a
	ld [$FF00+$DE], a
	ld a, 8
	ld [$FF00+$DF], a
	ld a, 76
	ld [$FF00+$DB], a
	ld a, 32
	ld [$FF00+$DD], a
	ret
	ld a, [$AFD0]
	and a
	ret z
	call UnknownCall_B321
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 11
	ld [$FF00+$DF], a
	ld a, 114
	ld [$FF00+$DB], a
	xor a
	ld [$AFD0], a
	ret
	ld a, 5
	ld [$A266], a
	call UnknownCall_B40E
	call UnknownCall_B339
	ld b, 2
	call UnknownCall_B26A
	ld a, [$FF00+$DA]
	cp 192
	ret c
	call UnknownCall_B15B
	ld a, 1
	ld [$A2DC], a
	xor a
	ld [$A28B], a
	ld hl, $AB00
	ld a, 255
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, 7
	ld [hli], a
	ld a, 200
	ld [hli], a
	ld a, 0
	ld [hli], a
	ld a, 0
	ld [hli], a
	ld a, 176
	ld [hli], a
	ld a, 29
	ld [hli], a
	ld [hl], 255
	ld a, 171
	ld [$AF1E], a
	ld a, 6
	ld [$AF1F], a
	ld a, 1
	ld [$AF06], a
	ret
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_A9D4
	call UnknownCall_B1E4
	call UnknownCall_B270
	ld a, [$FF00+$E0]
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, 1
	ld [$FF00+$E8], a
	ret

UnknownRJump_A9D4:
	call UnknownCall_B17F
	call UnknownCall_B276
	ld a, [$FF00+$D9]
	cp 138
	ret c
	xor a
	ld [$FF00+$E0], a
	ld [$FF00+$E8], a
	ld a, 9
	ld [$FF00+$DF], a
	ld a, 52
	ld [$A2B3], a
	ld a, 1
	ld [$AFCE], a
	ld a, 24
	ld [$A460], a
	ld a, 48
	ld [$FF00+$EC], a
	ret

UnknownRJump_A9FC:
	ld a, 5
	ld [$FF00+$DF], a
	ld a, 79
	ld [$FF00+$DB], a
	ret
	ld a, [$A254]
	and $07
	jr z, UnknownRJump_A9FC
	call UnknownCall_B339
	ld b, 2
	ld a, [$FF00+$E9]
	and a
	jr nz, UnknownRJump_AA20
	call UnknownCall_B264
	ld a, [$FF00+$DA]
	cp 16
	ret nc
	jr UnknownRJump_AA28

UnknownRJump_AA20:
	call UnknownCall_B26A
	ld a, [$FF00+$DA]
	cp 152
	ret c

UnknownRJump_AA28:
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a
	ld a, [$FF00+$E9]
	xor $01
	ld [$FF00+$E9], a
	ld a, 8
	ld [$FF00+$EC], a
	ret
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_AA46
	call UnknownCall_B1D6
	call UnknownCall_B270
	jr UnknownRJump_AA4C

UnknownRJump_AA46:
	call UnknownCall_B18F
	call UnknownCall_B276

UnknownRJump_AA4C:
	ld a, [$FF00+$E0]
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$E8]
	xor $01
	ld [$FF00+$E8], a
	ret nz
	ld a, 9
	ld [$FF00+$DF], a
	ld a, 56
	ld [$A2B3], a
	ld [$FF00+$EC], a
	ld a, 1
	ld [$AFCE], a
	ld a, 24
	ld [$A460], a
	ret
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_AA79
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_AA79:
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_AA86
	call UnknownCall_B1E4
	call UnknownCall_B270
	jr UnknownRJump_AA8C

UnknownRJump_AA86:
	call UnknownCall_B183
	call UnknownCall_B276

UnknownRJump_AA8C:
	ld a, [$FF00+$E0]
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld [$FF00+$EA], a
	ld a, 76
	ld [$FF00+$DB], a
	ld a, [$FF00+$E8]
	xor $01
	ld [$FF00+$E8], a
	ret nz
	ld a, 4
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$DF]
	rst $28

UnknownData_AAA8:
INCBIN "baserom.gb", $AAA8, $AAB0 - $AAA8

	ld a, 1
	ld [$FF00+$DF], a
	ret
	call UnknownCall_AACA
	ld a, [$AFCE]
	and a
	ret z
	xor a
	ld [$AFCE], a
	ld a, 2
	ld [$FF00+$DF], a
	ld a, 64
	ld [$FF00+$E2], a
	ret

UnknownCall_AACA:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld b, 3
	ld a, [$FF00+$E9]
	and a
	jr nz, UnknownRJump_AADB
	call UnknownCall_B264
	jr UnknownRJump_AADE

UnknownRJump_AADB:
	call UnknownCall_B26A

UnknownRJump_AADE:
	ld a, [$FF00+$DA]
	cp 176
	ret c
	ld a, [$FF00+$E9]
	xor $01
	ld [$FF00+$E9], a
	ret
	call UnknownCall_B40E
	call UnknownCall_B177
	call UnknownCall_B276
	ld a, [$FF00+$E0]
	cp c
	ret nz
	xor a
	ld [$FF00+$DE], a
	ld [$FF00+$E0], a
	ld a, 3
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$F0]
	and $07
	ret nz
	ld a, [$FF00+$DB]
	inc a
	ld [$FF00+$DB], a
	cp 99
	ret nz
	ld a, 56
	ld [$FF00+$D9], a
	ld a, 96
	ld [$FF00+$DB], a
	xor a
	ld [$FF00+$E2], a
	ld [$FF00+$DF], a
	ld [$FF00+$E9], a
	ld a, [$FF04]
	and $01
	jr z, UnknownRJump_AB29
	ld a, 167
	ld [$FF00+$DA], a
	ret

UnknownRJump_AB29:
	xor a
	ld [$FF00+$DA], a
	inc a
	ld [$FF00+$E9], a
	ret
	ld a, [$FF00+$DF]
	rst $28

UnknownData_AB33:
INCBIN "baserom.gb", $AB33, $AB37 - $AB33

	ld a, 112
	ld [$FF00+$DB], a
	ld a, [$AD0A]
	ld [$FF00+$DA], a
	ld a, 16
	ld [$FF00+$D9], a
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 16
	ld [$FF00+$DE], a
	ret
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld b, 1
	call UnknownCall_B276
	ld a, [$AD09]
	and $F0
	ld c, a
	ld a, [$FF00+$D9]
	and $F0
	add 32
	cp c
	ret nz
	ld a, 1
	ld [$AFD0], a
	call UnknownCall_B157
	ret
	ld a, [$FF00+$DF]
	rst $28

UnknownData_AB71:
INCBIN "baserom.gb", $AB71, $AB75 - $AB71

	ld a, 113
	ld [$FF00+$DB], a
	ld a, [$AD0A]
	ld [$FF00+$DA], a
	ld a, 16
	ld [$FF00+$D9], a
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 16
	ld [$FF00+$DE], a
	ret
	call UnknownCall_9285
	ld a, [$AF3E]
	and a
	jr z, UnknownRJump_ABB6
	ld a, [$FF00+$DB]
	ld [$AF37], a
	ld a, [$FF00+$DF]
	ld [$AFC4], a
	ld a, [$FF00+$E2]
	ld [$AFCC], a
	ld a, [$AFC3]
	and a
	jp z, UnknownJump_9725
	ld a, 82
	ld [$FF00+$DB], a
	ld a, [$AFCD]
	ld [$FF00+$EC], a
	jp UnknownJump_9725

UnknownRJump_ABB6:
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_AC00
	ld a, 7
	ld [$FF00+$DF], a
	ld a, 32
	ld [$FF00+$EC], a
	ld a, 22
	ld [$AF36], a
	ld a, 14
	ld [$AF37], a
	call UnknownCall_B224
	ret
	ld a, [$A266]
	cp 97
	call z, UnknownCall_ABF5
	ld a, [$AFCF]
	and a
	call nz, UnknownCall_B2EF
	call UnknownCall_B14E
	ret nz
	xor a
	ld [$AFCF], a
	ld a, 3
	ld [$FF00+$DF], a
	ld a, 65
	ld [$FF00+$E2], a
	ld a, 86
	ld [$FF00+$DB], a
	ret

UnknownCall_ABF5:
	ld a, 1
	ld [$A470], a
	ld a, 1
	ld [$AFCF], a
	ret

UnknownRJump_AC00:
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_AC04:
INCBIN "baserom.gb", $AC04, $AC1A - $AC04

	ld a, 5
	ld [$A266], a
	call UnknownCall_B40E
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	xor a
	ld [$FF00+$EA], a
	ld [$FF00+$DE], a
	ld a, 8
	ld [$FF00+$DF], a
	ld a, 83
	ld [$FF00+$DB], a
	ld a, 32
	ld [$FF00+$DD], a
	ret
	ld a, [$AFD0]
	and a
	ret z
	call UnknownCall_B315
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 11
	ld [$FF00+$DF], a
	ld a, 116
	ld [$FF00+$DB], a
	xor a
	ld [$AFD0], a
	ret
	ld a, 5
	ld [$A266], a
	call UnknownCall_B339
	call UnknownCall_B40E
	ld b, 2
	call UnknownCall_B26A
	ld a, [$FF00+$DA]
	cp 192
	ret c
	call UnknownCall_B15B
	ld a, 2
	ld [$A2DC], a
	xor a
	ld [$A28B], a
	ld a, 171
	ld [$AF1E], a
	ld a, 6
	ld [$AF1F], a
	ld a, 1
	ld [$AF06], a
	ld hl, $AB00
	ld a, 255
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, 8
	ld [hli], a
	ld a, 200
	ld [hli], a
	ld a, 0
	ld [hli], a
	ld a, 0
	ld [hli], a
	ld a, 176
	ld [hli], a
	ld a, [$A2E4]
	and $01
	jr nz, UnknownRJump_ACAC
	ld a, 27
	ld [hli], a
	ld [hl], 255
	ret

UnknownRJump_ACAC:
	ld a, 29
	ld [hli], a
	ld [hl], 255
	ret
	call UnknownCall_B1C8
	call UnknownCall_B270
	ld a, [$FF00+$E0]
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	call UnknownCall_B27C
	ld a, [$FF00+$DF]
	add 3
	ld [$FF00+$DF], a
	ld a, 2
	ld [$A478], a
	ret
	call UnknownCall_B2EF
	ld b, 1
	call UnknownCall_B264
	ld a, [$FF00+$DA]
	cp 32
	jr c, UnknownRJump_ACDE
	jr UnknownRJump_ACFE

UnknownRJump_ACDE:
	ld a, [$FF00+$DF]
	xor $01
	ld [$FF00+$DF], a
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a
	ld a, 2
	ld [$A478], a
	ret
	call UnknownCall_B2EF
	ld b, 1
	call UnknownCall_B26A
	ld a, [$FF00+$DA]
	cp 144
	jr nc, UnknownRJump_ACDE

UnknownRJump_ACFE:
	ld a, [$FF00+$F0]
	and $07
	ret nz
	call UnknownCall_B2DB
	cp 32
	jr nc, UnknownRJump_AD1E
	ld a, [$A254]
	and $03
	jr nz, UnknownRJump_AD1E
	ld a, 10
	ld [$FF00+$DF], a
	ld a, 86
	ld [$FF00+$DB], a
	ld a, 32
	ld [$FF00+$EC], a
	ret

UnknownRJump_AD1E:
	ld b, 1
	call UnknownCall_B276
	ld a, [$FF00+$D9]
	cp 138
	ret c

UnknownJump_AD28:
	ld a, 3
	ld [$FF00+$DF], a
	ld a, 86
	ld [$FF00+$DB], a
	ret
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_AD3A
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_AD3A:
	call UnknownCall_B18F
	call UnknownCall_B276
	ld a, [$FF00+$D9]
	cp 138
	ret c
	xor a
	ld [$FF00+$E0], a
	ld a, 9
	ld [$FF00+$DF], a
	ld a, 56
	ld [$A2B3], a
	ld a, 48
	ld [$FF00+$EC], a
	ld a, 1
	ld [$AFCE], a
	ld a, 24
	ld [$A460], a
	ret
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_AD69
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_AD69:
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_AD76
	call UnknownCall_B1E4
	call UnknownCall_B270
	jr UnknownRJump_AD7C

UnknownRJump_AD76:
	call UnknownCall_B183
	call UnknownCall_B276

UnknownRJump_AD7C:
	ld a, [$FF00+$E0]
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld [$FF00+$EA], a
	ld a, 83
	ld [$FF00+$DB], a
	ld a, [$FF00+$E8]
	xor $01
	ld [$FF00+$E8], a
	ret nz
	jp UnknownJump_AD28
	call UnknownCall_9285
	ld a, [$AF3E]
	and a
	jr z, UnknownRJump_ADBE
	ld a, [$FF00+$DB]
	ld [$AF37], a
	ld a, [$FF00+$DF]
	ld [$AFC4], a
	ld a, [$FF00+$E2]
	ld [$AFCC], a
	ld a, [$AFC3]
	and a
	jp z, UnknownJump_9725
	ld a, 82
	ld [$FF00+$DB], a
	ld a, [$AFCD]
	ld [$FF00+$EC], a
	jp UnknownJump_9725

UnknownRJump_ADBE:
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_ADF9
	ld a, 12
	ld [$FF00+$DF], a
	ld a, 32
	ld [$FF00+$EC], a
	ld a, 25
	ld [$AF36], a
	ld a, 14
	ld [$AF37], a
	call UnknownCall_B224
	ret
	ld a, [$A266]
	cp 97
	call z, UnknownCall_ABF5
	ld a, [$AFCF]
	and a
	call nz, UnknownCall_B2EF
	call UnknownCall_B14E
	ret nz
	xor a
	ld [$AFCF], a
	ld a, 3
	ld [$FF00+$DF], a
	ld a, 65
	ld [$FF00+$E2], a
	ret

UnknownRJump_ADF9:
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_ADFD:
INCBIN "baserom.gb", $ADFD, $AE17 - $ADFD

	ld a, 1
	ld [$A2E3], a
	call UnknownCall_B32D
	call UnknownCall_B18F
	call UnknownCall_B276
	ld a, [$FF00+$D9]
	cp 138
	ret c
	ld a, 13
	ld [$FF00+$DF], a
	ld a, 128
	ld [$FF00+$EC], a
	ld a, 2
	ld [$FF00+$E0], a
	ld a, 24
	ld [$A468], a
	ret
	call UnknownCall_B32D
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, [$FF00+$E0]
	dec a
	ld [$FF00+$E0], a
	ret nz
	ld a, 8
	ld [$FF00+$DF], a
	ld a, 255
	ld [$FF00+$EC], a
	ld a, 100
	ld [$FF00+$DB], a
	ret
	ld a, 5
	ld [$A266], a
	call UnknownCall_B2E8
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	jr z, UnknownRJump_AE6F
	cp 32
	ret nc
	ld a, 99
	ld [$FF00+$DB], a
	ret

UnknownRJump_AE6F:
	ld a, 48
	ld [$FF00+$EC], a
	call UnknownCall_B27C
	ld a, 9
	ld [$FF00+$DF], a
	ld a, 99
	ld [$FF00+$DB], a
	ld a, 28
	ld [$AF36], a
	ld a, 108
	ld [$AF37], a
	ld a, [$FF00+$DD]
	ld [$AF38], a
	call UnknownCall_B224
	ret
	ld a, 5
	ld [$A266], a
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 10
	ld [$FF00+$DF], a
	ld a, 102
	ld [$FF00+$DB], a
	xor a
	ld [$FF00+$DD], a
	ld [$FF00+$EA], a
	ld a, 48
	ld [$FF00+$EC], a
	ret
	ld a, 5
	ld [$A266], a
	call UnknownCall_B35A
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_AEBF
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_AEBF:
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld b, 3
	call UnknownCall_B26A
	ld a, [$FF00+$DA]
	cp 192
	ret c
	call UnknownCall_B15B
	ld a, 3
	ld [$A2DC], a
	xor a
	ld [$A28B], a
	ret
	xor a
	ld [$FF00+$EA], a
	ld a, 92
	ld [$FF00+$DB], a
	call UnknownCall_B27C
	ld a, [$FF00+$DF]
	add 3
	ld [$FF00+$DF], a
	ld a, 27
	ld [$AF36], a
	ld a, 14
	ld [$AF37], a
	ld a, [$FF00+$DD]
	ld [$AF38], a
	call UnknownCall_B224
	ld a, 8
	ld [$A478], a
	ld a, 80
	ld [$FF00+$EC], a
	ret
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_AF15
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 88
	ld [$FF00+$DB], a
	ret

UnknownRJump_AF15:
	call UnknownCall_B339
	ld b, 2
	call UnknownCall_B264
	ld a, [$FF00+$DA]
	cp 24
	jr c, UnknownRJump_AF25
	jr UnknownRJump_AF4E

UnknownRJump_AF25:
	ld a, [$FF00+$DF]
	xor $01
	ld [$FF00+$DF], a
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a
	ret
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_AF40
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 88
	ld [$FF00+$DB], a
	ret

UnknownRJump_AF40:
	call UnknownCall_B339
	ld b, 2
	call UnknownCall_B26A
	ld a, [$FF00+$DA]
	cp 152
	jr nc, UnknownRJump_AF25

UnknownRJump_AF4E:
	call UnknownCall_B2DB
	cp 48
	jr c, UnknownRJump_AF66
	ld a, [$A254]
	and $03
	ret nz
	ld a, [$AD2B]
	cp 14
	ret nc
	ld a, 3
	ld [$FF00+$DF], a
	ret

UnknownRJump_AF66:
	ld a, [$FF00+$DF]
	add 2
	ld [$FF00+$DF], a
	ld a, 91
	ld [$FF00+$DB], a
	ld a, [$A216]
	sub 2
	ld [$AFD1], a
	ret
	ld b, 1
	call UnknownCall_B264
	ld a, [$FF00+$DA]
	cp 24
	jr c, UnknownRJump_AF25
	jr UnknownRJump_AF91
	ld b, 1
	call UnknownCall_B26A
	ld a, [$FF00+$DA]
	cp 152
	jr nc, UnknownRJump_AF25

UnknownRJump_AF91:
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_AFA9
	ld a, [$AFD1]
	and a
	jr z, UnknownRJump_AFA1
	call UnknownCall_B1EB
	jr UnknownRJump_AFA4

UnknownRJump_AFA1:
	call UnknownCall_B1CF

UnknownRJump_AFA4:
	call UnknownCall_B270
	jr UnknownRJump_AFBA

UnknownRJump_AFA9:
	ld a, [$AFD1]
	and a
	jr z, UnknownRJump_AFB4
	call UnknownCall_B187
	jr UnknownRJump_AFB7

UnknownRJump_AFB4:
	call UnknownCall_B17B

UnknownRJump_AFB7:
	call UnknownCall_B276

UnknownRJump_AFBA:
	ld a, [$FF00+$E0]
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$E8]
	xor $01
	ld [$FF00+$E8], a
	ret nz
	ld a, [$FF00+$DF]
	sub 2
	ld [$FF00+$DF], a
	ld a, 88
	ld [$FF00+$DB], a
	xor a
	ld [$FF00+$EA], a
	ld a, [$AD2B]
	cp 14
	ret nc
	ld a, 3
	ld [$FF00+$DF], a
	ret
	call UnknownCall_B3B9
	ld a, [$FF00+$DF]
	rst $28

UnknownData_AFE6:
INCBIN "baserom.gb", $AFE6, $AFEC - $AFE6

	ld a, 64
	ld [$FF00+$E2], a
	call UnknownCall_3CB1
	ld a, 104
	ld [$FF00+$DB], a
	xor a
	ld [$FF00+$EA], a
	ld b, 16
	call UnknownCall_B270
	ret
	ld hl, $7039
	call UnknownCall_B16B
	ld a, b
	cp 128
	jr z, UnknownRJump_B010
	call UnknownCall_B264
	jr UnknownRJump_B023

UnknownRJump_B010:
	ld a, 58
	ld [$FF00+$E0], a
	ret
	ld hl, $7039
	call UnknownCall_B16B
	ld a, b
	cp 128
	jr z, UnknownRJump_B010
	call UnknownCall_B26A

UnknownRJump_B023:
	ld a, [$FF00+$DA]
	cp 176
	jp nc, UnknownJump_B157
	ld hl, $707E
	call UnknownCall_B16B
	call UnknownCall_B276
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	ret

UnknownData_B039:
INCBIN "baserom.gb", $B039, $B0C2 - $B039

	ld a, [$FF00+$DF]
	rst $28

UnknownData_B0C5:
INCBIN "baserom.gb", $B0C5, $B0CF - $B0C5

	call UnknownCall_3CB1
	ret
	ld b, 2
	call UnknownCall_B264
	jr UnknownRJump_B0DF
	ld b, 2
	call UnknownCall_B26A

UnknownRJump_B0DF:
	call UnknownCall_B3C0
	ld a, [$FF00+$F0]
	and $03
	ret nz
	call UnknownCall_B2DB
	cp 8
	jr c, UnknownRJump_B10F
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_B0FB
	call UnknownCall_B1EB
	call UnknownCall_B270
	jr UnknownRJump_B101

UnknownRJump_B0FB:
UnknownData_B0FB:
INCBIN "baserom.gb", $B0FB, $B101 - $B0FB


UnknownRJump_B101:
	ld a, [$FF00+$E0]
	cp c
	ret nz

UnknownData_B105:
INCBIN "baserom.gb", $B105, $B10F - $B105


UnknownRJump_B10F:
	ld a, 3
	ld [$FF00+$DF], a
	xor a
	ld [$FF00+$E0], a
	ld [$FF00+$E8], a
	ld a, 6
	ld [$A460], a
	ret
	call UnknownCall_B3C0
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_B138
	call UnknownCall_B1E4
	call UnknownCall_B270
	ld a, [$FF00+$E0]
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, 1
	ld [$FF00+$E8], a
	ret

UnknownRJump_B138:
	ld a, [$FF00+$D9]
	cp 144
	jr nc, UnknownRJump_B145
	call UnknownCall_B18F
	call UnknownCall_B276
	ret

UnknownRJump_B145:
	ld a, 108
	ld [$FF00+$DB], a
	ld a, 4
	ld [$FF00+$DF], a
	ret

UnknownCall_B14E:
	ld a, [$A266]
	ld b, a
	ld a, [$A267]
	or b
	ret

UnknownJump_B157:
UnknownCall_B157:
	ld hl, $AFC1
	dec [hl]

UnknownCall_B15B:
	ld hl, $FFD0
	xor a
	ld b, 32

UnknownRJump_B161:
	ld [hli], a
	dec b
	jr nz, UnknownRJump_B161
	ld a, 1
	ld [$AF3E], a
	ret

UnknownCall_B16B:
	ld a, [$FF00+$E0]
	ld e, a
	ld d, 0
	add de
	ld b, [hl]
	ret

UnknownData_B173:
INCBIN "baserom.gb", $B173, $B177 - $B173


UnknownCall_B177:
	ld c, 36
	jr UnknownRJump_B191

UnknownCall_B17B:
	ld c, 27
	jr UnknownRJump_B191

UnknownCall_B17F:
	ld c, 24
	jr UnknownRJump_B191

UnknownCall_B183:
	ld c, 12
	jr UnknownRJump_B191

UnknownCall_B187:
	ld c, 15
	jr UnknownRJump_B191

UnknownData_B18B:
INCBIN "baserom.gb", $B18B, $B18F - $B18B


UnknownCall_B18F:
	ld c, 21

UnknownRJump_B191:
	ld hl, $71A3
	ld a, [$FF00+$E0]
	ld e, a
	ld d, 0
	add de
	ld b, [hl]
	ld hl, $FFE0
	ld a, [hl]
	cp c
	ret z
	inc [hl]
	ret

UnknownData_B1A3:
INCBIN "baserom.gb", $B1A3, $B1C8 - $B1A3


UnknownCall_B1C8:
	ld c, 36
	ld hl, $71FF
	jr UnknownRJump_B1F0

UnknownCall_B1CF:
	ld c, 27
	ld hl, $7208
	jr UnknownRJump_B1F0

UnknownCall_B1D6:
	ld c, 21
	ld hl, $720E
	jr UnknownRJump_B1F0

UnknownData_B1DD:
INCBIN "baserom.gb", $B1DD, $B1E4 - $B1DD


UnknownCall_B1E4:
	ld c, 12
	ld hl, $7217
	jr UnknownRJump_B1F0

UnknownCall_B1EB:
	ld c, 15
	ld hl, $7214

UnknownRJump_B1F0:
	ld a, [$FF00+$E0]
	ld e, a
	ld d, 0
	add de
	ld b, [hl]
	ld hl, $FFE0
	ld a, [hl]
	cp c
	ret z
	inc [hl]
	ret

UnknownData_B1FF:
INCBIN "baserom.gb", $B1FF, $B224 - $B1FF


UnknownCall_B224:
	ld a, [$AFC1]
	inc a
	cp 16
	jr z, UnknownRJump_B259
	ld hl, $AD05
	ld de, $0020

UnknownRJump_B232:
	add de
	dec a
	jr nz, UnknownRJump_B232
	ld d, h
	ld e, l
	ld a, [$AF36]
	ld [de], a
	inc e
	ld hl, $FFD6
	ld b, 5
	call UnknownCall_3CAA
	ld h, d
	ld l, e
	ld a, [$AF37]
	ld [hli], a
	inc l
	ld a, [$AF38]
	ld [hl], a
	ld a, l
	add 6
	ld e, a
	ld d, h
	ld hl, $AFC1
	inc [hl]

UnknownRJump_B259:
	xor a
	ld [$AF36], a
	ld [$AF37], a
	ld [$AF38], a
	ret

UnknownCall_B264:
	ld a, [$FF00+$DA]
	sub b
	ld [$FF00+$DA], a
	ret

UnknownCall_B26A:
	ld a, [$FF00+$DA]
	add b
	ld [$FF00+$DA], a
	ret

UnknownCall_B270:
	ld a, [$FF00+$D9]
	sub b
	ld [$FF00+$D9], a
	ret

UnknownCall_B276:
	ld a, [$FF00+$D9]
	add b
	ld [$FF00+$D9], a
	ret

UnknownCall_B27C:
	call UnknownCall_B296
	ld a, [$AF2C]
	dec a
	jr z, UnknownRJump_B28D
	ld a, 1
	ld [$FF00+$DF], a
	xor a
	ld [$FF00+$DD], a
	ret

UnknownRJump_B28D:
	ld a, 2
	ld [$FF00+$DF], a
	ld a, 32
	ld [$FF00+$DD], a
	ret

UnknownCall_B296:
	xor a
	ld [$AF2C], a
	ld a, [$FF00+$DA]
	ld b, a
	ld a, [$A23C]
	cp b
	jr c, UnknownRJump_B2A9
	ld a, 1
	ld [$AF2C], a
	ret

UnknownRJump_B2A9:
	ld a, 255
	ld [$AF2C], a
	ret

UnknownData_B2AF:
INCBIN "baserom.gb", $B2AF, $B2C2 - $B2AF


UnknownCall_B2C2:
	xor a
	ld [$AF2C], a
	ld a, [$FF00+$D9]
	ld b, a
	ld a, [$A23B]
	cp b
	jr c, UnknownRJump_B2D5
	ld a, 1
	ld [$AF2C], a
	ret

UnknownRJump_B2D5:
	ld a, 255
	ld [$AF2C], a
	ret

UnknownCall_B2DB:
	ld hl, $FFDA
	ld a, [$A23C]
	sub [hl]
	bit 7, a
	ret z
	cpl
	inc a
	ret

UnknownCall_B2E8:
	ld a, [$FF00+$F0]
	and $0F
	ret nz
	jr UnknownRJump_B302

UnknownCall_B2EF:
	ld a, [$FF00+$F0]
	and $07
	ret nz
	jr UnknownRJump_B302

UnknownCall_B2F6:
	ld a, [$FF00+$F0]
	and $01
	ret nz
	jr UnknownRJump_B302

UnknownCall_B2FD:
	ld a, [$FF00+$F0]
	and $03
	ret nz

UnknownRJump_B302:
	ld a, [$FF00+$DB]
	xor $01
	ld [$FF00+$DB], a
	ret

UnknownCall_B309:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld a, [$FF00+$DB]
	xor $06
	ld [$FF00+$DB], a
	ret

UnknownCall_B315:
	ld a, [$FF00+$F0]
	and $07
	ret nz
	ld a, [$FF00+$DB]
	xor $0B
	ld [$FF00+$DB], a
	ret

UnknownCall_B321:
	ld a, [$FF00+$F0]
	and $07
	ret nz
	ld a, [$FF00+$DB]
	xor $1F
	ld [$FF00+$DB], a
	ret

UnknownCall_B32D:
	ld a, [$FF00+$F0]
	and $07
	ret nz
	ld a, [$FF00+$DB]
	xor $31
	ld [$FF00+$DB], a
	ret

UnknownCall_B339:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld hl, $FFEA
	inc [hl]
	ld a, [hl]
	cp 4
	jr nz, UnknownRJump_B349
	xor a
	ld [hl], a

UnknownRJump_B349:
	ld hl, $7356
	ld e, a
	ld d, 0
	add de
	ld a, [$FF00+$DB]
	add [hl]
	ld [$FF00+$DB], a
	ret

UnknownData_B356:
INCBIN "baserom.gb", $B356, $B35A - $B356


UnknownCall_B35A:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld hl, $FFEA
	inc [hl]
	ld a, [hl]
	cp 4
	jr nz, UnknownRJump_B370
	xor a
	ld [hl], a
	ld a, [$FF00+$DD]
	res 5, a
	ld [$FF00+$DD], a

UnknownRJump_B370:
	ld hl, $7388
	ld e, a
	ld d, 0
	add de
	ld a, [$FF00+$DB]
	add [hl]
	ld [$FF00+$DB], a
	ld a, [$FF00+$EA]
	cp 3
	ret nz
	ld a, [$FF00+$DD]
	set 5, a
	ld [$FF00+$DD], a
	ret

UnknownData_B388:
INCBIN "baserom.gb", $B388, $B38C - $B388


UnknownCall_B38C:
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld hl, $FFEA
	inc [hl]
	ld a, [hl]
	ld e, a
	cp 3
	jr z, UnknownRJump_B3A2
	cp 5
	jr nz, UnknownRJump_B3A8
	xor a
	ld [hl], a
	ld e, a

UnknownRJump_B3A2:
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a

UnknownRJump_B3A8:
	ld hl, $73B4
	ld d, 0
	add de
	ld a, [$FF00+$DB]
	add [hl]
	ld [$FF00+$DB], a
	ret

UnknownData_B3B4:
INCBIN "baserom.gb", $B3B4, $B3B9 - $B3B4


UnknownCall_B3B9:
	ld a, [$FF00+$F0]
	and $01
	ret nz
	jr UnknownRJump_B3C5

UnknownCall_B3C0:
	ld a, [$FF00+$F0]
	and $03
	ret nz

UnknownRJump_B3C5:
	ld hl, $FFEA
	inc [hl]
	ld a, [hl]
	cp 4
	jr nz, UnknownRJump_B3EE
	xor a
	ld [hl], a
	ld a, [$FF00+$DB]
	sub 3
	ld [$FF00+$DB], a
	ret

UnknownCall_B3D7:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld hl, $FFEA
	inc [hl]
	ld a, [hl]
	cp 8
	jr nz, UnknownRJump_B3EE
	xor a
	ld [hl], a
	ld a, [$FF00+$DB]
	sub 7
	ld [$FF00+$DB], a
	ret

UnknownRJump_B3EE:
	ld a, [$FF00+$DB]
	inc a
	ld [$FF00+$DB], a
	ret

UnknownCall_B3F4:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	jr UnknownRJump_B407

UnknownData_B3FB:
INCBIN "baserom.gb", $B3FB, $B402 - $B3FB


UnknownCall_B402:
	ld a, [$FF00+$F0]
	and $0F
	ret nz

UnknownRJump_B407:
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a
	ret

UnknownCall_B40E:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld a, [$FF00+$DE]
	xor $10
	ld [$FF00+$DE], a
	ret

UnknownData_B41A:
INCBIN "baserom.gb", $B41A, $C000 - $B41A



SECTION "bank03", ROMX, BANK[$03]

	ld a, [$FF00+$D8]
	cp 2
	ret nz
	call UnknownCall_C090
	ld hl, $4F11
	ld a, [$AF06]
	and a
	jr nz, UnknownRJump_C014
	ld hl, $40B1

UnknownRJump_C014:
	ld a, [$AF3E]
	and a
	ret nz
	ld a, [$FF00+$E2]
	cp 128
	ret z
	ld a, [$FF00+$D9]
	cp 184
	ret nc
	ld a, [$FF00+$DA]
	cp 184
	ret nc
	ld a, [$FF00+$DB]
	ld d, 0
	ld e, a
	sla e
	rl d
	add de
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	ld h, 161
	ld a, [$FF8D]
	ld l, a
	ld a, [$FF00+$D9]
	ld b, a
	ld a, [$FF00+$DA]
	ld c, a

UnknownRJump_C042:
	ld a, [de]
	cp 128
	ret z
	ld a, [$AF2B]
	bit 6, a
	jr z, UnknownRJump_C053
	ld a, [de]
	cpl
	sub 7
	jr UnknownRJump_C054

UnknownRJump_C053:
	ld a, [de]

UnknownRJump_C054:
	add b
	cp 160
	jr nc, UnknownRJump_C068
	ld [hli], a
	inc de
	ld a, [$AF2B]
	bit 5, a
	jr z, UnknownRJump_C076
	ld a, [de]
	cpl
	sub 7
	jr UnknownRJump_C077

UnknownRJump_C068:
	inc de
	inc de
	inc de
	inc de
	jr UnknownRJump_C042

UnknownRJump_C06E:
	dec l
	ld [hl], 0
	inc de
	inc de
	inc de
	jr UnknownRJump_C042

UnknownRJump_C076:
	ld a, [de]

UnknownRJump_C077:
	add c
	cp 168
	jr nc, UnknownRJump_C06E
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	push hl
	ld hl, $AF2B
	ld a, [de]
	xor [hl]
	pop hl
	ld [hli], a
	ld a, l
	ld [$FF8D], a
	inc de
	jr UnknownRJump_C042

UnknownCall_C090:
	ld a, [$A2B0]
	ld b, a
	ld a, [$FF00+$D4]
	add 16
	sub b
	ld [$FF00+$D9], a
	ld a, [$A2B1]
	ld b, a
	ld a, [$FF00+$D1]
	add 8
	sub b
	ld [$FF00+$DA], a
	ld hl, $FFDC
	ld a, [hli]
	xor [hl]
	inc l
	xor [hl]
	ld [$AF2B], a
	ret

UnknownData_C0B1:
INCBIN "baserom.gb", $C0B1, $EBB6 - $C0B1


UnknownRJump_EBB6:
	ld a, 255
	ld [hli], a
	ld [hl], a
	ret
	call UnknownCall_EC40
	call UnknownCall_EC17
	call UnknownCall_EC31
	call UnknownCall_EC4B
	ld a, [$A269]
	add a
	ld e, a
	ld d, 0
	ld hl, $6037
	add de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld hl, $AB06

UnknownRJump_EBD8:
	ld a, [de]
	cp 255
	jr z, UnknownRJump_EBB6
	ld b, a
	and $0F
	ld [hli], a
	inc de
	ld a, [de]
	ld c, a
	and $1F
	rlca
	rlca
	rlca
	ld [hli], a
	inc de
	ld a, [de]
	rlca
	rl [hl]
	inc hl
	rlca
	rl [hl]
	rlca
	rl [hl]
	inc hl
	ld a, [de]
	and $1F
	rlca
	rlca
	rlca
	ld [hli], a
	ld a, b
	rrca
	rrca
	and $3C
	bit 4, a
	jr z, UnknownRJump_EC0B
	set 6, a
	res 4, a

UnknownRJump_EC0B:
	ld b, a
	ld a, c
	rrca
	swap a
	and $07
	add b
	ld [hli], a
	inc de
	jr UnknownRJump_EBD8

UnknownCall_EC17:
	ld hl, $AB00
	ld bc, $0200
	xor a

UnknownRJump_EC1E:
	ld [hli], a
	dec c
	jr nz, UnknownRJump_EC1E
	dec b
	jr nz, UnknownRJump_EC1E
	ld hl, $AB00
	ld a, 255
	ld b, 6

UnknownRJump_EC2C:
	ld [hli], a
	dec b
	jr nz, UnknownRJump_EC2C
	ret

UnknownCall_EC31:
	ld hl, $AD00
	ld bc, $0200
	xor a

UnknownRJump_EC38:
	ld [hli], a
	dec c
	jr nz, UnknownRJump_EC38
	dec b
	jr nz, UnknownRJump_EC38
	ret

UnknownCall_EC40:
	ld hl, $AF00
	ld b, 0
	xor a

UnknownRJump_EC46:
	ld [hli], a
	dec b
	jr nz, UnknownRJump_EC46
	ret

UnknownCall_EC4B:
	ld a, 171
	ld [$AF1E], a
	ld a, 6
	ld [$AF1F], a
	ld a, [$A269]
	cp 10
	ret c
	ld a, 1
	ld [$AF06], a
	ret

UnknownData_EC61:
INCBIN "baserom.gb", $EC61, $FFA0 - $EC61


UnknownCall_FFA0:
UnknownData_FFA0:
INCBIN "baserom.gb", $FFA0, $10000 - $FFA0



SECTION "bank04", ROMX, BANK[$04]

	ld hl, $A400

UnknownRJump_10003:
	ld [hl], 0
	inc l
	jr nz, UnknownRJump_10003
	ld hl, $A500

UnknownRJump_1000B:
	ld [hl], 0
	inc l
	jr nz, UnknownRJump_1000B
	ld a, 128
	ld [$FF00+$26], a
	ld a, 119
	ld [$FF00+$24], a
	ld a, 255
	ld [$FF00+$25], a
	ret

UnknownData_1001D:
INCBIN "baserom.gb", $1001D, $1002D - $1001D

	jp UnknownJump_13F5E
	ld a, [$A45E]
	cp 1
	jp z, UnknownJump_118F7
	cp 2
	jp z, UnknownJump_11926
	ld a, [$A45D]
	and a
	jp nz, UnknownJump_11936

UnknownJump_10044:
	ld hl, $A468
	ld a, [hli]
	and a
	jr nz, UnknownRJump_10078
	ld a, [$A53F]
	and a
	jr z, UnknownRJump_10057
	ld a, 51
	ld [$FF00+$24], a
	jr UnknownRJump_1005B

UnknownRJump_10057:
	ld a, 119
	ld [$FF00+$24], a

UnknownRJump_1005B:
	call UnknownCall_100DE
	call UnknownCall_106D3
	call UnknownCall_10E90

UnknownRJump_10064:
	call UnknownCall_11638

UnknownJump_10067:
	xor a
	ld [$A460], a
	ld [$A468], a
	ld [$A470], a
	ld [$A478], a
	ld [$A45E], a
	ret

UnknownRJump_10078:
	ld [hl], a
	call UnknownCall_112E0
	jr UnknownRJump_10064

UnknownData_1007E:
INCBIN "baserom.gb", $1007E, $100DE - $1007E


UnknownCall_100DE:
	ld hl, $A460
	ld a, [hl]
	and a
	jr z, UnknownRJump_10116
	cp 9
	jr z, UnknownRJump_10110
	cp 12
	jr z, UnknownRJump_10110
	cp 15
	jr z, UnknownRJump_10110
	cp 16
	jr z, UnknownRJump_10110
	cp 17
	jr z, UnknownRJump_10110
	cp 19
	jr z, UnknownRJump_10110
	cp 20
	jr z, UnknownRJump_10110
	cp 23
	jr z, UnknownRJump_10110
	ld a, [$A520]
	and a
	jr nz, UnknownRJump_10110
	ld a, [$A536]
	and a
	ret nz

UnknownRJump_10110:
	ld a, [hl]
	ld hl, $407E
	jr UnknownRJump_1011D

UnknownRJump_10116:
	inc hl
	ld a, [hl]
	and a
	ret z
	ld hl, $40AE

UnknownRJump_1011D:
	call UnknownCall_111A6
	ld de, $A500
	ld bc, $A504
	jp [hl]
	ld hl, $4134
	jp UnknownJump_1068A
	call UnknownCall_111B3
	ret nz
	jp UnknownJump_106A8

UnknownData_10134:
INCBIN "baserom.gb", $10134, $1013A - $10134

	ld hl, $4152
	jp UnknownJump_1068A
	call UnknownCall_111B3
	ret nz
	call UnknownCall_111B7
	cp 2
	jp z, UnknownJump_106A8
	ld hl, $4158
	jp UnknownJump_111BB

UnknownData_10152:
INCBIN "baserom.gb", $10152, $1015E - $10152

	ld a, [$A461]
	cp 3
	ret z
	ld hl, $417C
	jp UnknownJump_1068A
	call UnknownCall_111B3
	ret nz
	call UnknownCall_111B7
	cp 2
	jp z, UnknownJump_106A8
	ld hl, $4182
	jp UnknownJump_111BB

UnknownData_1017C:
INCBIN "baserom.gb", $1017C, $10188 - $1017C

	ld a, 5
	ld [$A52D], a
	ld hl, $41A3
	jp UnknownJump_1068A
	call UnknownCall_111B3
	ret nz
	call UnknownCall_111DC
	jp z, UnknownJump_106A8
	ld hl, $41A3
	jp UnknownJump_111BB

UnknownData_101A3:
INCBIN "baserom.gb", $101A3, $101A9 - $101A3

	ld a, 2
	ld [$A52D], a
	ld hl, $46C6
	jp UnknownJump_10685
	call UnknownCall_111B3
	ret nz
	call UnknownCall_111B7
	cp 5
	jr z, UnknownRJump_101C8

UnknownRJump_101BF:
	ld hl, $41D3
	call UnknownCall_111A6
	jp UnknownJump_111BB

UnknownRJump_101C8:
	call UnknownCall_111DC
	jp z, UnknownJump_106A8
	ld a, 1
	ld [bc], a
	jr UnknownRJump_101BF

UnknownData_101D3:
INCBIN "baserom.gb", $101D3, $101F3 - $101D3

	ld hl, $420B
	jp UnknownJump_1068A
	call UnknownCall_111B3
	ret nz
	call UnknownCall_111B7
	cp 2
	jp z, UnknownJump_106A8
	ld hl, $4211
	jp UnknownJump_111BB

UnknownData_1020B:
INCBIN "baserom.gb", $1020B, $10217 - $1020B

	ld hl, $422F
	jp UnknownJump_1068A
	call UnknownCall_111B3
	ret nz
	call UnknownCall_111B7
	cp 2
	jp z, UnknownJump_106A8
	ld hl, $4235
	jp UnknownJump_106CC

UnknownData_1022F:
INCBIN "baserom.gb", $1022F, $10238 - $1022F

	ld hl, $4259
	jp UnknownJump_10685
	call UnknownCall_111B3
	ret nz
	call UnknownCall_111B7
	cp 4
	jp z, UnknownJump_106A8
	ld hl, $4253
	call UnknownCall_111A6
	jp UnknownJump_111BB

UnknownData_10253:
INCBIN "baserom.gb", $10253, $10271 - $10253

	ld a, 3
	ld [$A52D], a
	ld hl, $42AA
	call UnknownCall_111F9
	jp UnknownJump_10685
	call UnknownCall_111B3
	ret nz
	ld a, 5
	ld [de], a
	call UnknownCall_111B7
	cp 7
	jr z, UnknownRJump_10293

UnknownRJump_1028D:
	ld hl, $429E
	jp UnknownJump_11214

UnknownRJump_10293:
	call UnknownCall_111DC
	jp z, UnknownJump_106A8
	ld a, 1
	ld [bc], a
	jr UnknownRJump_1028D

UnknownData_1029E:
INCBIN "baserom.gb", $1029E, $102B2 - $1029E

	ld hl, $42D3
	jp UnknownJump_1068A
	call UnknownCall_111B3
	ret nz
	call UnknownCall_111B7
	cp 4
	jp z, UnknownJump_106A2
	ld hl, $42CD
	call UnknownCall_111A6
	jp UnknownJump_106CC

UnknownData_102CD:
INCBIN "baserom.gb", $102CD, $102E2 - $102CD

	call UnknownCall_13F5E
	ld a, 6
	ld [$A52D], a
	ld hl, $4343
	jp UnknownJump_10685
	call UnknownCall_111B3
	ret nz
	ld a, [$A535]
	inc a
	ld [$A535], a
	cp 3
	jr z, UnknownRJump_10321

UnknownRJump_102FF:
	ld hl, $433F
	call UnknownCall_111A6
	ld a, [$A535]
	cp 1
	jr z, UnknownRJump_1032E
	call UnknownCall_111BB

UnknownRJump_1030F:
	ld bc, $A504
	call UnknownCall_111B7
	dec a
	ld c, a
	ld b, 0
	ld hl, $4333
	add bc
	ld a, [hl]
	jp UnknownJump_111DA

UnknownRJump_10321:
	call UnknownCall_111DC
	jp z, UnknownJump_106A8
	ld a, 1
	ld [$A535], a
	jr UnknownRJump_102FF

UnknownRJump_1032E:
	call UnknownCall_111C1
	jr UnknownRJump_1030F

UnknownData_10333:
INCBIN "baserom.gb", $10333, $1034E - $10333

	ld a, 12
	ld [$A52D], a
	ld hl, $4388
	call UnknownCall_111F9
	jp UnknownJump_10685
	call UnknownCall_111B7
	cp 11
	jr z, UnknownRJump_10369

UnknownRJump_10363:
	ld hl, $4374
	jp UnknownJump_11214

UnknownRJump_10369:
	call UnknownCall_111DC
	jp z, UnknownJump_106A8
	ld a, 1
	ld [bc], a
	jr UnknownRJump_10363

UnknownData_10374:
INCBIN "baserom.gb", $10374, $1038E - $10374

	ld a, 4
	ld [$A52D], a
	ld hl, $43CA
	jp UnknownJump_1068A
	call UnknownCall_111B3
	ret nz
	call UnknownCall_111B7
	cp 2
	jr z, UnknownRJump_103B2
	cp 6
	jp z, UnknownJump_106A8

UnknownJump_103A9:
	ld hl, $43C0
	call UnknownCall_111A6
	jp UnknownJump_111BB

UnknownRJump_103B2:
	call UnknownCall_111DC
	ld a, 2
	jp z, UnknownJump_103A9
	ld a, 1
	ld [bc], a
	jp UnknownJump_103A9

UnknownData_103C0:
INCBIN "baserom.gb", $103C0, $103DC - $103C0

	call UnknownCall_13F5E
	ld hl, $4402
	jp UnknownJump_10680
	call UnknownCall_111B3
	ret nz
	call UnknownCall_111B7
	cp 5
	jp z, UnknownJump_106A8
	ld hl, $43FA
	call UnknownCall_111A6
	jp UnknownJump_111BB

UnknownData_103FA:
INCBIN "baserom.gb", $103FA, $10408 - $103FA

	ld a, [$A279]
	and a
	ret z
	cp 5
	ret nc
	ld hl, $4431
	call UnknownCall_111A6
	jp UnknownJump_10680
	call UnknownCall_111B3
	ret nz
	call UnknownCall_111B7
	cp 2
	jp z, UnknownJump_106A8
	ld a, [$A279]
	ld hl, $4439
	call UnknownCall_111A6
	jp UnknownJump_106CC

UnknownData_10431:
INCBIN "baserom.gb", $10431, $10465 - $10431

	call UnknownCall_13F5E
	jp UnknownJump_1049C
	ld hl, $448A
	jp UnknownJump_1068A
	call UnknownCall_111B3
	ret nz
	call UnknownCall_111B7
	cp 3
	jp z, UnknownJump_106A8
	ld hl, $4486
	call UnknownCall_111A6
	jp UnknownJump_111BB

UnknownData_10486:
INCBIN "baserom.gb", $10486, $1049C - $10486


UnknownJump_1049C:
	ld a, 10
	ld [$A52D], a
	ld hl, $44D2
	call UnknownCall_111F9
	jp UnknownJump_10685
	call UnknownCall_111B7
	cp 9
	jr z, UnknownRJump_104B7

UnknownRJump_104B1:
	ld hl, $44C2
	jp UnknownJump_11214

UnknownRJump_104B7:
	call UnknownCall_111DC
	jp z, UnknownJump_106A8
	ld a, 1
	ld [bc], a
	jr UnknownRJump_104B1

UnknownData_104C2:
INCBIN "baserom.gb", $104C2, $104D8 - $104C2

	ld hl, $4542
	jp UnknownJump_10685
	call UnknownCall_111B3
	ret nz
	call UnknownCall_111B7
	cp 24
	jp z, UnknownJump_106A8
	cp 16
	jr nc, UnknownRJump_1050E
	cp 8
	jr nc, UnknownRJump_10508
	ld a, 160
	ld [$FF00+$12], a

UnknownRJump_104F6:
	ld a, 47
	ld [$FF00+$10], a
	ld a, 187
	ld [$FF00+$11], a
	ld a, [bc]
	ld hl, $4514
	call UnknownCall_111A6
	jp UnknownJump_106CC

UnknownRJump_10508:
	ld a, 64
	ld [$FF00+$12], a
	jr UnknownRJump_104F6

UnknownRJump_1050E:
	ld a, 32
	ld [$FF00+$12], a
	jr UnknownRJump_104F6

UnknownData_10514:
INCBIN "baserom.gb", $10514, $10560 - $10514

	ld a, 4
	ld [$A52D], a
	ld hl, $4595
	call UnknownCall_111F9
	jp UnknownJump_10685
	call UnknownCall_111B3
	ret nz
	ld a, 4
	ld [de], a
	call UnknownCall_111B7
	cp 5
	jr z, UnknownRJump_10582

UnknownRJump_1057C:
	ld hl, $458D
	jp UnknownJump_11214

UnknownRJump_10582:
	call UnknownCall_111DC
	jp z, UnknownJump_106A8
	ld a, 1
	ld [bc], a
	jr UnknownRJump_1057C

UnknownData_1058D:
INCBIN "baserom.gb", $1058D, $1059B - $1058D

	ld hl, $45DC
	jp UnknownJump_1068A
	call UnknownCall_111B3
	ret nz
	call UnknownCall_111B7
	cp 9
	jp z, UnknownJump_106A2
	ld hl, $45CC
	call UnknownCall_111A6
	ld a, [$A504]
	cp 8
	jp z, UnknownJump_111BB
	and $01
	jr z, UnknownRJump_105C6
	ld a, 48
	ld [$FF00+$12], a

UnknownRJump_105C3:
	jp UnknownJump_106CC

UnknownRJump_105C6:
	ld a, 176
	ld [$FF00+$12], a
	jr UnknownRJump_105C3

UnknownData_105CC:
INCBIN "baserom.gb", $105CC, $105F1 - $105CC

	ld a, 4
	ld [$A52D], a
	ld hl, $4626
	call UnknownCall_111F9
	jp UnknownJump_10685
	call UnknownCall_111B3
	ret nz
	ld a, 4
	ld [de], a
	call UnknownCall_111B7
	cp 5
	jr z, UnknownRJump_10613

UnknownRJump_1060D:
	ld hl, $461E
	jp UnknownJump_11214

UnknownRJump_10613:
	call UnknownCall_111DC
	jp z, UnknownJump_106A8
	ld a, 1
	ld [bc], a
	jr UnknownRJump_1060D

UnknownData_1061E:
INCBIN "baserom.gb", $1061E, $1062C - $1061E

	ld a, 8
	ld [$A52D], a
	ld hl, $467A
	call UnknownCall_111F9
	jp UnknownJump_10685
	call UnknownCall_111B7
	cp 21
	jr z, UnknownRJump_10647

UnknownRJump_10641:
	ld hl, $4652
	jp UnknownJump_11214

UnknownRJump_10647:
	call UnknownCall_111DC
	jp z, UnknownJump_106A8
	ld a, 9
	ld [bc], a
	jr UnknownRJump_10641

UnknownData_10652:
INCBIN "baserom.gb", $10652, $10680 - $10652


UnknownJump_10680:
	ld a, 1
	ld [$A520], a

UnknownJump_10685:
	ld a, 1
	ld [$A536], a

UnknownJump_1068A:
	ld a, [$A460]
	ld [$A461], a
	xor a
	ld [$A500], a
	ld [$A504], a
	ld a, [$A41F]
	set 7, a
	ld [$A41F], a
	jp UnknownJump_111BB

UnknownJump_106A2:
	ld hl, $46C6
	call UnknownCall_111BB

UnknownJump_106A8:
	xor a
	ld [$A461], a
	ld [$A500], a
	ld [$FF00+$10], a
	ld [$A504], a
	ld [$A52D], a
	ld [$A520], a
	ld [$A536], a
	ld a, [$A41F]
	res 7, a
	ld [$A41F], a
	ret

UnknownData_106C6:
INCBIN "baserom.gb", $106C6, $106CC - $106C6


UnknownJump_106CC:
	ld b, 2
	ld c, 19
	jp UnknownJump_111D3

UnknownCall_106D3:
	ld hl, $A470
	ld a, [hl]
	and a
	jr z, UnknownRJump_106E9
	cp 20
	jr z, UnknownRJump_106E3
	ld a, [$A538]
	and a
	ret nz

UnknownRJump_106E3:
	ld a, [hl]
	ld hl, $46FA
	jr UnknownRJump_106F0

UnknownRJump_106E9:
	inc hl
	ld a, [hl]
	and a
	ret z
	ld hl, $472A

UnknownRJump_106F0:
	call UnknownCall_111A6
	ld de, $A502
	ld bc, $A506
	jp [hl]

UnknownData_106FA:
INCBIN "baserom.gb", $106FA, $1075A - $106FA

	ld a, 2
	ld [$A52F], a
	call UnknownCall_10E49
	ld hl, $47D1
	jp UnknownJump_10DF8
	call UnknownCall_111B3
	ret nz
	call UnknownCall_111B7
	cp 24
	jr z, UnknownRJump_10798

UnknownRJump_10773:
	ld hl, $47A3
	call UnknownCall_111A6
	ld a, [$A506]
	cp 4
	jp z, UnknownJump_111C7
	cp 8
	jp z, UnknownJump_111C7
	cp 12
	jp z, UnknownJump_111C7
	cp 16
	jp z, UnknownJump_111C7
	cp 20
	jp z, UnknownJump_111C7
	jp UnknownJump_10E5D

UnknownRJump_10798:
	call UnknownCall_111E8
	jp z, UnknownJump_10E1D
	ld a, 12
	ld [bc], a
	jr UnknownRJump_10773

UnknownData_107A3:
INCBIN "baserom.gb", $107A3, $1080A - $107A3

	call UnknownCall_10E4E
	ld hl, $4866
	jp UnknownJump_10DF8
	call UnknownCall_111B3
	ret nz
	call UnknownCall_111B7
	cp 18
	jp z, UnknownJump_10E1D
	ld hl, $4844
	call UnknownCall_111A6
	ld a, [$A506]
	cp 3
	jp z, UnknownJump_111C7
	cp 6
	jp z, UnknownJump_111C7
	cp 9
	jp z, UnknownJump_111C7
	cp 12
	jp z, UnknownJump_111C7
	cp 15
	jp z, UnknownJump_111C7
	jp UnknownJump_10E5D

UnknownData_10844:
INCBIN "baserom.gb", $10844, $1089C - $10844

	ld a, 2
	ld [$A52F], a
	call UnknownCall_10E4E
	ld hl, $48E2
	jp UnknownJump_10DF8
	call UnknownCall_111B3
	ret nz
	call UnknownCall_111B7
	cp 8
	jr z, UnknownRJump_108C6
	ld hl, $48D4
	call UnknownCall_111A6
	ld a, [$A506]
	cp 4
	jp z, UnknownJump_111C7
	jp UnknownJump_10E5D

UnknownRJump_108C6:
	call UnknownCall_111E8
	jp z, UnknownJump_10E1D
	xor a
	ld [bc], a
	ld hl, $48E2
	jp UnknownJump_111C7

UnknownData_108D4:
INCBIN "baserom.gb", $108D4, $108F7 - $108D4

	ld a, 36
	ld [$A52F], a
	call UnknownCall_10E53
	ld hl, $4926
	call UnknownCall_111FF
	jp UnknownJump_10DF8
	call UnknownCall_111E8
	jp z, UnknownJump_10E17
	cp 18
	jr z, UnknownRJump_1091B
	ld a, 1
	ld [bc], a
	ld hl, $4924
	jp UnknownJump_1121E

UnknownRJump_1091B:
	ld hl, $492C
	call UnknownCall_111FF
	jp UnknownJump_111C7

UnknownData_10924:
INCBIN "baserom.gb", $10924, $10932 - $10924

	ld a, 2
	ld [$A52F], a
	call UnknownCall_10E4E
	ld hl, $4988
	call UnknownCall_111FF
	jp UnknownJump_10DF8
	call UnknownCall_111B3
	ret nz
	call UnknownCall_111B7
	cp 17
	jr z, UnknownRJump_10957
	ld a, 2
	ld [de], a
	ld hl, $4968
	jp UnknownJump_1121E

UnknownRJump_10957:
	call UnknownCall_111E8
	jp z, UnknownJump_10E17
	xor a
	ld [bc], a
	ld hl, $498E
	call UnknownCall_111FF
	jp UnknownJump_111C7

UnknownData_10968:
INCBIN "baserom.gb", $10968, $10994 - $10968

	ld a, [$A471]
	cp 6
	ret z
	call UnknownCall_10E58
	ld hl, $A53E
	ld a, [hl]
	and a
	jr z, UnknownRJump_109AB
	dec [hl]
	ld hl, $49E1
	jp UnknownJump_10DF8

UnknownRJump_109AB:
	inc [hl]
	ld hl, $49ED
	jp UnknownJump_10DF8
	call UnknownCall_111B3
	ret nz
	call UnknownCall_111B7
	cp 3
	jp z, UnknownJump_10E1D
	ld a, [$A53E]
	and a
	ld a, [$A506]
	jr z, UnknownRJump_109D0
	ld hl, $49DD
	call UnknownCall_111A6
	jp UnknownJump_111C7

UnknownRJump_109D0:
	ld hl, $49D9
	call UnknownCall_111A6
	jp UnknownJump_111C7

UnknownData_109D9:
INCBIN "baserom.gb", $109D9, $109F9 - $109D9

	ld a, 48
	ld [$A52F], a
	call UnknownCall_10E58
	ld hl, $4A28
	call UnknownCall_111FF
	jp UnknownJump_10DF8
	call UnknownCall_111E8
	jp z, UnknownJump_10E17
	cp 24
	jr z, UnknownRJump_10A1D
	ld a, 1
	ld [bc], a
	ld hl, $4A26
	jp UnknownJump_1121E

UnknownRJump_10A1D:
	ld hl, $4A2E
	call UnknownCall_111FF
	jp UnknownJump_111C7

UnknownData_10A26:
INCBIN "baserom.gb", $10A26, $10A34 - $10A26

	ld a, 2
	ld [$A52F], a
	call UnknownCall_10E4E
	ld hl, $4AA3
	call UnknownCall_111FF
	jp UnknownJump_10DF8
	call UnknownCall_111B3
	ret nz
	call UnknownCall_111B7
	cp 29
	jr z, UnknownRJump_10A5A
	ld a, 1
	ld [de], a
	ld a, [bc]
	ld hl, $4A6B
	jp UnknownJump_1121E

UnknownRJump_10A5A:
	call UnknownCall_111E8
	jp z, UnknownJump_10E17
	xor a
	ld [bc], a
	ld hl, $4AA9
	call UnknownCall_111FF
	jp UnknownJump_111C7

UnknownData_10A6B:
INCBIN "baserom.gb", $10A6B, $10AEA - $10A6B


UnknownJump_10AEA:
	call UnknownCall_10E58
	ld hl, $4B14
	call UnknownCall_111FF
	jp UnknownJump_10DF8
	call UnknownCall_111B7
	cp 11
	jp z, UnknownJump_10E17
	ld hl, $4B04
	jp UnknownJump_1121E

UnknownData_10B04:
INCBIN "baserom.gb", $10B04, $10B1A - $10B04

	ld a, 3
	ld [$A52F], a
	call UnknownCall_10E53
	ld hl, $4B83
	call UnknownCall_111FF
	jp UnknownJump_10DF8
	call UnknownCall_111B3
	ret nz
	ld a, 2
	ld [de], a
	call UnknownCall_111B7
	cp 21
	jr z, UnknownRJump_10B3F
	ld hl, $4B5B
	jp UnknownJump_1121E

UnknownRJump_10B3F:
	call UnknownCall_111E8
	jp z, UnknownJump_10E17
	cp 1
	jp z, UnknownJump_10B56
	ld hl, $4B89

UnknownRJump_10B4D:
	ld a, 4
	ld [bc], a
	call UnknownCall_111FF
	jp UnknownJump_111C7

UnknownJump_10B56:
	ld hl, $4B8F
	jr UnknownRJump_10B4D

UnknownData_10B5B:
INCBIN "baserom.gb", $10B5B, $10B95 - $10B5B

	ld a, 2
	ld [$A52F], a
	jp UnknownJump_10AEA
	call UnknownCall_111B7
	cp 11
	jp z, UnknownJump_10BAB
	ld hl, $4B04
	jp UnknownJump_1121E

UnknownJump_10BAB:
	call UnknownCall_111E8
	jp z, UnknownJump_10E17
	xor a
	ld [bc], a
	ld hl, $4BBC
	call UnknownCall_111FF
	jp UnknownJump_111C7

UnknownData_10BBC:
INCBIN "baserom.gb", $10BBC, $10BC2 - $10BBC

	ld a, 2
	ld [$A52F], a
	ld hl, $5B86
	call UnknownCall_10E43
	ld hl, $4C13
	call UnknownCall_111FF
	jp UnknownJump_10DF8
	call UnknownCall_111B3
	ret nz
	ld a, 2
	ld [de], a
	call UnknownCall_111B7
	cp 11
	jr z, UnknownRJump_10BEA
	ld hl, $4BFB
	jp UnknownJump_1121E

UnknownRJump_10BEA:
	call UnknownCall_111E8
	jp z, UnknownJump_10E17
	xor a
	ld [bc], a
	ld hl, $4C19
	call UnknownCall_111FF
	jp UnknownJump_111C7

UnknownData_10BFB:
INCBIN "baserom.gb", $10BFB, $10C2F - $10BFB

	ld hl, $4C1F
	call UnknownCall_10E43
	ld hl, $4C42
	jp UnknownJump_10DF8
	call UnknownCall_111B3
	ret nz
	jp UnknownJump_10E1D

UnknownData_10C42:
INCBIN "baserom.gb", $10C42, $10C48 - $10C42

	ld hl, $4C6C
	push hl

UnknownRJump_10C4C:
	ld a, 8
	ld [$A52F], a
	call UnknownCall_10E58
	pop hl
	call UnknownCall_111FF
	jp UnknownJump_10DF8
	call UnknownCall_111E8
	jp z, UnknownJump_10E1D
	ld a, 1
	ld [bc], a
	ld hl, $4C6A
	jp UnknownJump_1121E

UnknownData_10C6A:
INCBIN "baserom.gb", $10C6A, $10C72 - $10C6A

	ld hl, $4C89
	push hl
	jr UnknownRJump_10C4C
	call UnknownCall_111E8
	jp z, UnknownJump_10E1D
	ld a, 1
	ld [bc], a
	ld hl, $4C87
	jp UnknownJump_1121E

UnknownData_10C87:
INCBIN "baserom.gb", $10C87, $10C8F - $10C87

	call UnknownCall_10E4E
	ld hl, $4CB9
	jp UnknownJump_10DF8
	call UnknownCall_111B3
	ret nz
	call UnknownCall_111B7
	cp 7
	jp z, UnknownJump_10E1D
	ld hl, $4CAD
	call UnknownCall_111A6
	jp UnknownJump_111C7

UnknownData_10CAD:
INCBIN "baserom.gb", $10CAD, $10CE1 - $10CAD

	ld a, 7
	ld [$A52F], a
	ld hl, $4CD1
	call UnknownCall_10E43
	ld hl, $4D32
	call UnknownCall_111FF
	jp UnknownJump_10DF3
	call UnknownCall_111B7
	cp 9
	jp z, UnknownJump_10D08
	cp 17
	jp z, UnknownJump_10E17

UnknownRJump_10D02:
	ld hl, $4D12
	jp UnknownJump_1121E

UnknownJump_10D08:
	call UnknownCall_111E8
	jr z, UnknownRJump_10D02
	ld a, 1
	ld [bc], a
	jr UnknownRJump_10D02

UnknownData_10D12:
INCBIN "baserom.gb", $10D12, $10D38 - $10D12


UnknownJump_10D38:
	call UnknownCall_10E58
	ld hl, $4D60
	jp UnknownJump_10DF8
	call UnknownCall_111B3
	ret nz
	call UnknownCall_111B7
	cp 6
	jp z, UnknownJump_10E1D
	ld hl, $4D56
	call UnknownCall_111A6
	jp UnknownJump_111C7

UnknownData_10D56:
INCBIN "baserom.gb", $10D56, $10D6C - $10D56

	ld a, 10
	ld [$A52F], a
	call UnknownCall_10E58
	ld hl, $4DA8
	call UnknownCall_111FF
	jp UnknownJump_10DF8
	call UnknownCall_111B7
	cp 3
	jr z, UnknownRJump_10D8A

UnknownRJump_10D84:
	ld hl, $4DA4
	jp UnknownJump_1121E

UnknownRJump_10D8A:
	call UnknownCall_111E8
	jp z, UnknownJump_10E1D
	cp 5
	jr z, UnknownRJump_10D99
	ld a, 1
	ld [bc], a
	jr UnknownRJump_10D84

UnknownRJump_10D99:
	xor a
	ld [bc], a
	ld hl, $4DA8
	call UnknownCall_111FF
	jp UnknownJump_111C7

UnknownData_10DA4:
INCBIN "baserom.gb", $10DA4, $10DAE - $10DA4

	ld a, 7
	ld [$A52F], a
	ld hl, $5BA6
	call UnknownCall_10E43
	ld hl, $4DE5
	call UnknownCall_111FF
	jp UnknownJump_10DF8
	call UnknownCall_111B3
	ret nz
	ld a, 2
	ld [de], a
	call UnknownCall_111B7
	cp 3
	jr z, UnknownRJump_10DD6

UnknownRJump_10DD0:
	ld hl, $4DE1
	jp UnknownJump_1121E

UnknownRJump_10DD6:
	call UnknownCall_111E8
	jp z, UnknownJump_10E17
	ld a, 1
	ld [bc], a
	jr UnknownRJump_10DD0

UnknownData_10DE1:
INCBIN "baserom.gb", $10DE1, $10DEB - $10DE1

	ld a, [$A471]
	and a
	ret nz
	jp UnknownJump_10D38

UnknownJump_10DF3:
	ld a, 1
	ld [$A538], a

UnknownJump_10DF8:
	ld a, [$A470]
	ld [$A471], a
	push hl
	ld hl, $A43F
	set 7, [hl]
	pop hl
	xor a
	ld [$A502], a
	ld [$A506], a
	ld [$FF00+$1A], a
	jp UnknownJump_111C7

UnknownData_10E11:
INCBIN "baserom.gb", $10E11, $10E17 - $10E11


UnknownJump_10E17:
	ld hl, $4E3C
	call UnknownCall_111C7

UnknownJump_10E1D:
	xor a
	ld [$A502], a
	ld [$A506], a
	ld [$A471], a
	ld [$FF00+$1A], a
	ld [$A538], a
	ld hl, $A43F
	res 7, [hl]
	ld a, [$A436]
	ld l, a
	ld a, [$A437]
	ld h, a
	jp UnknownJump_112A7

UnknownData_10E3C:
INCBIN "baserom.gb", $10E3C, $10E43 - $10E3C


UnknownRJump_10E43:
UnknownCall_10E43:
	xor a
	ld [$FF00+$1A], a
	jp UnknownJump_112A7

UnknownCall_10E49:
	ld hl, $5BD6
	jr UnknownRJump_10E43

UnknownCall_10E4E:
	ld hl, $5BE6
	jr UnknownRJump_10E43

UnknownCall_10E53:
	ld hl, $5BF6
	jr UnknownRJump_10E43

UnknownCall_10E58:
	ld hl, $5B96
	jr UnknownRJump_10E43

UnknownJump_10E5D:
	ld c, 29
	ld b, 2
	jp UnknownJump_111D3

UnknownData_10E64:
INCBIN "baserom.gb", $10E64, $10E90 - $10E64


UnknownCall_10E90:
	ld hl, $A478
	ld a, [hl]
	and a
	jr z, UnknownRJump_10EA2
	ld a, [$A539]
	and a
	ret nz
	ld a, [hl]
	ld hl, $4E64
	jr UnknownRJump_10EA9

UnknownRJump_10EA2:
	inc hl
	ld a, [hl]
	and a
	ret z
	ld hl, $4E7A

UnknownRJump_10EA9:
	call UnknownCall_111A6
	ld de, $A503
	ld bc, $A508
	jp [hl]
	ld hl, $4EDC
	jp UnknownJump_11163
	call UnknownCall_111B3
	ret nz
	call UnknownCall_111B7
	cp 8
	jp z, UnknownJump_11181
	ld hl, $4ECE
	call UnknownCall_111A6
	jp UnknownJump_111CD

UnknownData_10ECE:
INCBIN "baserom.gb", $10ECE, $10EEB - $10ECE

	ld a, 3
	ld [$A530], a
	ld hl, $4F34
	jp UnknownJump_11163
	call UnknownCall_111B3
	ret nz
	call UnknownCall_111B7
	cp 12
	jp z, UnknownJump_11181
	and $01
	jr nz, UnknownRJump_10F18
	ld a, 73
	ld [$FF00+$21], a

UnknownRJump_10F0A:
	ld a, 47
	ld [$FF00+$20], a
	ld a, [bc]
	ld hl, $4F1E
	call UnknownCall_111A6
	jp UnknownJump_1119F

UnknownRJump_10F18:
	ld a, 32
	ld [$FF00+$21], a
	jr UnknownRJump_10F0A

UnknownData_10F1E:
INCBIN "baserom.gb", $10F1E, $10F4B - $10F1E

	ld a, 3
	ld [$A479], a
	ld hl, $4F60
	jp UnknownJump_111CD
	xor a
	ld [$A479], a
	ld hl, $4F65
	jp UnknownJump_111CD

UnknownData_10F60:
INCBIN "baserom.gb", $10F60, $10F6A - $10F60

	ld a, [$A479]
	cp 4
	ret z
	ld hl, $4F7D
	jp UnknownJump_11163
	call UnknownCall_111B3
	ret nz
	jp UnknownJump_11181

UnknownData_10F7D:
INCBIN "baserom.gb", $10F7D, $10F82 - $10F7D

	ld hl, $4FAB
	jp UnknownJump_11163
	call UnknownCall_111B3
	ret nz
	call UnknownCall_111B7
	cp 8
	jp z, UnknownJump_11181
	ld hl, $4F9D
	call UnknownCall_111A6
	jp UnknownJump_1119F

UnknownData_10F9D:
INCBIN "baserom.gb", $10F9D, $10FC5 - $10F9D

	ld hl, $4FEA
	jp UnknownJump_11163
	call UnknownCall_111B3
	ret nz
	call UnknownCall_111B7
	cp 6
	jp z, UnknownJump_11181
	ld hl, $4FE0
	call UnknownCall_111A6
	jp UnknownJump_111CD

UnknownData_10FE0:
INCBIN "baserom.gb", $10FE0, $11008 - $10FE0

	ld a, [$A479]
	cp 7
	ret z
	ld hl, $5026
	jp UnknownJump_11163
	call UnknownCall_111B3
	ret nz
	call UnknownCall_111B7
	cp 2
	jp z, UnknownJump_11181
	ld hl, $502B
	jp UnknownJump_111CD

UnknownData_11026:
INCBIN "baserom.gb", $11026, $11030 - $11026

	ld hl, $506D
	jp UnknownJump_11163
	call UnknownCall_111B3
	ret nz
	call UnknownCall_111B7
	cp 10
	jp z, UnknownJump_1117B
	ld hl, $505B
	call UnknownCall_111A6
	ld a, [$A508]
	cp 5
	jr nc, UnknownRJump_11052
	jp UnknownJump_111CD

UnknownRJump_11052:
	inc hl
	inc hl
	ld a, 32
	ld [$FF00+$21], a
	jp UnknownJump_1119F

UnknownData_1105B:
INCBIN "baserom.gb", $1105B, $11086 - $1105B

	ld hl, $50C4
	jp UnknownJump_11163
	call UnknownCall_111B3
	ret nz
	call UnknownCall_111B7
	cp 12
	jp z, UnknownJump_11181
	ld hl, $50AE
	call UnknownCall_111A6
	ld a, [$A508]
	cp 4
	jp z, UnknownJump_111CD
	cp 8
	jp z, UnknownJump_111CD
	jp UnknownJump_1119F

UnknownData_110AE:
INCBIN "baserom.gb", $110AE, $110DC - $110AE

	ld a, 5
	ld [$A530], a
	ld hl, $5108
	jp UnknownJump_11163
	call UnknownCall_111B3
	ret nz
	call UnknownCall_111B7
	cp 7
	jp z, UnknownJump_1117B
	ld hl, $50FC
	call UnknownCall_111A6
	jp UnknownJump_1119F

UnknownData_110FC:
INCBIN "baserom.gb", $110FC, $1111C - $110FC

	ld hl, $5145
	jp UnknownJump_11163
	call UnknownCall_111B3
	ret nz
	call UnknownCall_111B7
	cp 8
	jp z, UnknownJump_11181
	ld hl, $5137
	call UnknownCall_111A6
	jp UnknownJump_111CD

UnknownData_11137:
INCBIN "baserom.gb", $11137, $11163 - $11137


UnknownJump_11163:
	ld a, [$A478]
	ld [$A479], a
	xor a
	ld [$A503], a
	ld [$A508], a
	ld a, [$A44F]
	set 7, a
	ld [$A44F], a
	jp UnknownJump_111CD

UnknownJump_1117B:
	ld hl, $519A
	call UnknownCall_111CD

UnknownJump_11181:
	xor a
	ld [$A479], a
	ld [$A503], a
	ld [$A508], a
	ld [$A530], a
	ld [$A539], a
	ld a, [$A44F]
	res 7, a
	ld [$A44F], a
	ret

UnknownData_1119A:
INCBIN "baserom.gb", $1119A, $1119F - $1119A


UnknownJump_1119F:
	ld b, 2
	ld c, 34
	jp UnknownJump_111D3

UnknownCall_111A6:
	dec a
	sla a
	ld c, a
	ld b, 0
	add bc
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld h, b
	ld l, c
	ret

UnknownCall_111B3:
	ld a, [de]
	dec a
	ld [de], a
	ret

UnknownCall_111B7:
	ld a, [bc]
	inc a
	ld [bc], a
	ret

UnknownJump_111BB:
UnknownCall_111BB:
	ld b, 5
	ld c, 16
	jr UnknownRJump_111D3

UnknownCall_111C1:
	ld b, 4
	ld c, 22
	jr UnknownRJump_111D3

UnknownJump_111C7:
UnknownCall_111C7:
	ld b, 5
	ld c, 26
	jr UnknownRJump_111D3

UnknownJump_111CD:
UnknownCall_111CD:
	ld b, 4
	ld c, 32
	jr UnknownRJump_111D3

UnknownJump_111D3:
UnknownRJump_111D3:
	ld a, [hli]
	ld [$FF00+c], a
	inc c
	dec b
	jr nz, UnknownRJump_111D3
	ld a, [hl]

UnknownJump_111DA:
	ld [de], a
	ret

UnknownCall_111DC:
	push de
	ld de, $A52D
	jr UnknownRJump_111F4

UnknownData_111E2:
INCBIN "baserom.gb", $111E2, $111E8 - $111E2


UnknownCall_111E8:
	push de
	ld de, $A52F
	jr UnknownRJump_111F4

UnknownData_111EE:
INCBIN "baserom.gb", $111EE, $111F4 - $111EE


UnknownRJump_111F4:
	call UnknownCall_111B3
	pop de
	ret

UnknownCall_111F9:
	push de
	ld de, $A531
	jr UnknownRJump_11205

UnknownCall_111FF:
	push de
	ld de, $A533
	jr UnknownRJump_11205

UnknownRJump_11205:
	inc hl
	inc hl
	inc hl
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hld]
	and $0F
	ld [de], a
	dec hl
	dec hl
	dec hl
	pop de
	ret

UnknownJump_11214:
	push de
	ld de, $A532
	ld a, [bc]
	ld c, 19
	push bc
	jr UnknownRJump_11228

UnknownJump_1121E:
	push de
	ld de, $A534
	ld a, [bc]
	ld c, 29
	push bc
	jr UnknownRJump_11228

UnknownRJump_11228:
	dec a
	sla a
	ld c, a
	ld b, 0
	add bc
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	ld a, [de]
	dec e
	ld h, a
	ld a, [de]
	ld l, a
	add bc
	pop bc
	ld a, l
	ld [$FF00+c], a
	ld [de], a
	inc c
	inc e
	ld a, h
	ld [$FF00+c], a
	ld [de], a
	pop de
	ret

UnknownData_11244:
INCBIN "baserom.gb", $11244, $11298 - $11244


UnknownCall_11298:
	inc e
	dec a
	sla a
	ld c, a
	ld b, 0
	add bc
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld l, c
	ld h, b
	ld a, h
	ret

UnknownJump_112A7:
UnknownCall_112A7:
	push bc
	ld c, 48

UnknownRJump_112AA:
	ld a, [hli]
	ld [$FF00+c], a
	inc c
	ld a, c
	cp 64
	jr nz, UnknownRJump_112AA
	pop bc
	ret

UnknownData_112B4:
INCBIN "baserom.gb", $112B4, $112DD - $112B4


UnknownRJump_112DD:
	jp UnknownJump_13F5E

UnknownCall_112E0:
	cp 255
	jr z, UnknownRJump_112DD
	cp 43
	ret nc
	ld [hl], a
	ld b, a
	ld hl, $5244
	and $3F
	call UnknownCall_11298
	call UnknownCall_1145A
	jp UnknownJump_113F3

UnknownData_112F7:
INCBIN "baserom.gb", $112F7, $113F3 - $112F7


UnknownJump_113F3:
	ld a, [$A469]
	ld hl, $52F7

UnknownRJump_113F9:
	dec a
	jr z, UnknownRJump_11404
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	jr UnknownRJump_113F9

UnknownRJump_11404:
	ld bc, $A455
	ld a, [hli]
	ld [bc], a
	inc c
	xor a
	ld [bc], a
	inc c
	ld a, [hli]
	ld [bc], a
	inc c
	xor a
	ld [bc], a
	inc c
	ld a, [hli]
	ld [bc], a
	ld [$FF00+$25], a
	inc c
	ld a, [hli]
	ld [bc], a
	inc c
	ld a, [hli]
	ld [bc], a
	inc c
	ld a, [hli]
	ld [bc], a
	ret

UnknownCall_11421:
	ld hl, $A455
	ld a, [hli]
	cp 1
	ret z

UnknownData_11428:
INCBIN "baserom.gb", $11428, $11449 - $11428


UnknownCall_11449:
	ld a, [hli]
	ld c, a
	ld a, [hl]
	ld b, a
	ld a, [bc]
	ld [de], a
	inc e
	inc bc
	ld a, [bc]
	ld [de], a
	ret

UnknownCall_11454:
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	ret

UnknownCall_1145A:
	call UnknownCall_13F6B
	ld a, [$A468]
	cp 2
	jr z, UnknownRJump_1147F
	cp 3
	jr z, UnknownRJump_1147F
	cp 12
	jr z, UnknownRJump_1147F
	cp 15
	jr z, UnknownRJump_1147F
	cp 24
	jr z, UnknownRJump_1147F
	cp 9
	jr nz, UnknownRJump_11483
	ld a, 1
	ld [$A50D], a
	jr UnknownRJump_11483

UnknownRJump_1147F:
	xor a
	ld [$A50D], a

UnknownRJump_11483:
	ld de, $A400
	ld b, 0
	ld a, [hli]
	ld [de], a
	ld a, [$A50D]
	and a
	jr z, UnknownRJump_11497
	ld b, 4
	ld a, [de]
	add b
	ld [de], a
	ld b, 0

UnknownRJump_11497:
	inc e
	call UnknownCall_11454
	ld a, [$A50D]
	and a
	jr z, UnknownRJump_114A7
	dec e
	call UnknownCall_11454
	jr UnknownRJump_114A9

UnknownRJump_114A7:
	inc hl
	inc hl

UnknownRJump_114A9:
	ld de, $A410
	call UnknownCall_11454
	ld de, $A420
	call UnknownCall_11454
	ld de, $A430
	call UnknownCall_11454
	ld de, $A440
	call UnknownCall_11454
	ld hl, $A410
	ld de, $A414
	call UnknownCall_11449
	ld hl, $A420
	ld de, $A424
	call UnknownCall_11449
	ld hl, $A430
	ld de, $A434
	call UnknownCall_11449
	ld hl, $A440
	ld de, $A444
	call UnknownCall_11449
	ld bc, $0410
	ld hl, $A412

UnknownRJump_114EB:
	ld [hl], 1
	ld a, c
	add l
	ld l, a
	dec b
	jr nz, UnknownRJump_114EB
	xor a
	ld [$A41E], a
	ld [$A42E], a
	ld [$A43E], a
	ret

UnknownRJump_114FE:
	push hl
	ld a, [$A471]
	and a
	jr nz, UnknownRJump_1150D
	xor a
	ld [$FF00+$1A], a
	ld l, e
	ld h, d
	call UnknownCall_112A7

UnknownRJump_1150D:
	pop hl
	jr UnknownRJump_11540

UnknownJump_11510:
	call UnknownCall_11546
	call UnknownCall_1155B
	ld e, a
	call UnknownCall_11546
	call UnknownCall_1155B
	ld d, a
	call UnknownCall_11546
	call UnknownCall_1155B
	ld c, a
	ld a, [$A48D]
	and a
	jr nz, UnknownRJump_11536
	inc l
	inc l
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	ld [hl], c
	dec l
	dec l
	dec l
	dec l

UnknownRJump_11536:
	push hl
	ld hl, $A450
	ld a, [hl]
	pop hl
	cp 3
	jr z, UnknownRJump_114FE

UnknownRJump_11540:
	call UnknownCall_11546
	jp UnknownJump_11655

UnknownCall_11546:
	push de
	ld a, [hli]
	ld e, a
	ld a, [hld]
	ld d, a
	inc de

UnknownRJump_1154C:
	ld a, e
	ld [hli], a
	ld a, d
	ld [hld], a
	pop de
	ret

UnknownCall_11552:
	push de
	ld a, [hli]
	ld e, a
	ld a, [hld]
	ld d, a
	inc de
	inc de
	jr UnknownRJump_1154C

UnknownCall_1155B:
	ld a, [hli]
	ld c, a
	ld a, [hld]
	ld b, a
	ld a, [bc]
	ld b, a
	ret

UnknownRJump_11562:
	pop hl
	jr UnknownRJump_11596

UnknownJump_11565:
	ld a, [$A450]
	cp 3
	jr nz, UnknownRJump_1157C
	ld a, [$A438]
	bit 7, a
	jr z, UnknownRJump_1157C

UnknownData_11573:
INCBIN "baserom.gb", $11573, $1157C - $11573


UnknownRJump_1157C:
	push hl
	ld a, l
	add 9
	ld l, a
	ld a, [hl]
	and a
	jr nz, UnknownRJump_11562
	ld a, l
	add 4
	ld l, a
	bit 7, [hl]
	jr nz, UnknownRJump_11562
	pop hl
	call UnknownCall_11817
	push hl
	call UnknownCall_11899
	pop hl

UnknownJump_11596:
UnknownRJump_11596:
	dec l
	dec l
	jp UnknownJump_117F7

UnknownJump_1159B:
	dec l
	dec l
	dec l
	dec l
	call UnknownCall_11552

UnknownRJump_115A2:
	ld a, l
	add 4
	ld e, a
	ld d, h
	call UnknownCall_11449
	cp 0
	jr z, UnknownRJump_115CD
	cp 255
	jr z, UnknownRJump_115B6
	inc l
	jp UnknownJump_11653

UnknownRJump_115B6:
	dec l
	push hl
	call UnknownCall_11552
	call UnknownCall_1155B
	ld e, a
	call UnknownCall_11546
	call UnknownCall_1155B
	ld d, a
	pop hl
	ld a, e
	ld [hli], a
	ld a, d
	ld [hld], a
	jr UnknownRJump_115A2

UnknownRJump_115CD:
	ld hl, $A469
	ld [hl], 0
	call UnknownCall_13F5E
	ret

UnknownJump_115D6:
	call UnknownCall_11546
	call UnknownCall_1155B
	ld [$A401], a
	call UnknownCall_11546
	call UnknownCall_1155B
	ld [$A402], a
	jr UnknownRJump_115F3

UnknownJump_115EA:
UnknownData_115EA:
INCBIN "baserom.gb", $115EA, $115F3 - $115EA


UnknownRJump_115F3:
	call UnknownCall_11546
	jr UnknownRJump_11655

UnknownJump_115F8:
	call UnknownCall_11546
	call UnknownCall_1155B
	push hl
	ld a, l
	add 11
	ld l, a
	ld c, [hl]
	ld a, b
	or c
	ld [hl], a
	ld b, h
	ld c, l
	dec c
	dec c
	pop hl
	ld a, [hli]
	ld e, a
	ld a, [hld]
	ld d, a
	inc de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hld], a
	ld a, d
	ld [bc], a
	dec c
	ld a, e
	ld [bc], a
	jr UnknownRJump_11655

UnknownJump_1161C:
	push hl
	ld a, l
	add 11
	ld l, a
	ld a, [hl]
	dec [hl]
	ld a, [hl]
	and $7F
	jr z, UnknownRJump_11635
	ld b, h
	ld c, l
	dec c
	dec c
	dec c
	pop hl
	ld a, [bc]
	ld [hli], a
	inc c
	ld a, [bc]
	ld [hld], a
	jr UnknownRJump_11655

UnknownRJump_11635:
	pop hl
	jr UnknownRJump_115F3

UnknownCall_11638:
	ld hl, $A469
	ld a, [hl]
	and a
	ret z
	call UnknownCall_11421
	ld a, 1
	ld [$A450], a
	ld hl, $A410

UnknownJump_11649:
	inc l
	ld a, [hli]
	and a
	jp z, UnknownJump_11596
	dec [hl]
	jp nz, UnknownJump_11565

UnknownJump_11653:
	inc l
	inc l

UnknownJump_11655:
UnknownRJump_11655:
	call UnknownCall_1155B
	cp 0
	jp z, UnknownJump_1159B
	cp 157
	jp z, UnknownJump_11510
	cp 158
	jp z, UnknownJump_115D6
	cp 159
	jp z, UnknownJump_115EA
	cp 155
	jp z, UnknownJump_115F8
	cp 156
	jp z, UnknownJump_1161C
	cp 153
	jp z, UnknownJump_11989
	cp 154
	jp z, UnknownJump_11994
	cp 151
	jp z, UnknownJump_119CC
	cp 152
	jp z, UnknownJump_119DB
	cp 149
	jp z, UnknownJump_119FF
	cp 150
	jp z, UnknownJump_11A0E
	and $F0
	cp 160
	jr nz, UnknownRJump_116E7
	ld a, b
	and $0F
	ld c, a
	ld b, 0
	push hl
	ld de, $A401
	ld a, [de]
	ld l, a
	inc e
	ld a, [de]
	ld h, a
	add bc
	ld a, [hl]
	pop hl
	push hl
	ld d, a
	inc l
	inc l
	inc l
	ld a, [hl]
	and $F0
	jr nz, UnknownRJump_116B9
	ld a, d
	jr UnknownRJump_116DE

UnknownRJump_116B9:
	ld e, a
	ld a, d
	push af
	srl a
	sla e
	jr c, UnknownRJump_116CA
	ld d, a
	srl a
	sla e
	jr c, UnknownRJump_116CA
	add d

UnknownRJump_116CA:
	ld c, a
	and a
	jr nz, UnknownRJump_116D0
	ld c, 2

UnknownRJump_116D0:
	ld de, $A450
	ld a, [de]
	dec a
	ld e, a
	ld d, 0
	ld hl, $A407
	add de
	ld [hl], c
	pop af

UnknownRJump_116DE:
	pop hl
	dec l
	ld [hli], a
	call UnknownCall_11546
	call UnknownCall_1155B

UnknownRJump_116E7:
	ld a, [$A450]
	cp 4
	jr z, UnknownRJump_11728
	push de
	ld de, $A51A
	call UnknownCall_11A71
	ld a, [de]
	and a
	jr z, UnknownRJump_116FF
	ld a, 1
	ld [de], a
	inc e
	xor a
	ld [de], a

UnknownRJump_116FF:
	ld de, $A520
	call UnknownCall_11A71
	xor a
	ld [de], a
	inc e
	ld [de], a
	ld de, $A526
	call UnknownCall_11A71
	inc e
	xor a
	ld [de], a
	ld a, [$A450]
	cp 3
	jr nz, UnknownRJump_11727
	ld de, $A50E
	ld a, [de]
	and a
	jr z, UnknownRJump_11727
	ld a, 1
	ld [de], a
	xor a
	ld [$A51F], a

UnknownRJump_11727:
	pop de

UnknownRJump_11728:
	ld c, b
	ld b, 0
	call UnknownCall_11546
	ld a, [$A450]
	cp 4
	jp z, UnknownJump_1176A
	push hl
	ld a, l
	add 5
	ld l, a
	ld e, l
	ld d, h
	inc l
	inc l
	ld a, c
	cp 1
	jr z, UnknownRJump_11765
	ld [hl], 0
	ld a, [$A400]
	and a
	jr z, UnknownRJump_11758
	ld l, a
	ld h, 0
	bit 7, l
	jr z, UnknownRJump_11755

UnknownData_11753:
INCBIN "baserom.gb", $11753, $11755 - $11753


UnknownRJump_11755:
	add bc
	ld b, h
	ld c, l

UnknownRJump_11758:
	ld hl, $5AF4
	add bc
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	jp UnknownJump_1179B

UnknownRJump_11765:
	ld [hl], 1
	pop hl
	jr UnknownRJump_1179B

UnknownJump_1176A:
	push hl
	ld a, c
	cp 31
	jr z, UnknownRJump_11788
	ld de, $A446
	ld hl, $5C06
	add bc

UnknownRJump_11777:
	ld a, [hli]
	ld [de], a
	inc e
	ld a, e
	cp 75
	jr nz, UnknownRJump_11777
	ld c, 32
	ld hl, $A444
	ld b, 0
	jr UnknownRJump_117C9

UnknownRJump_11788:
	ld a, [$A44F]
	bit 7, a
	jp nz, UnknownJump_117F2
	ld a, 3
	ld [$A478], a
	call UnknownCall_10E90
	jp UnknownJump_117F2

UnknownJump_1179B:
UnknownRJump_1179B:
	push hl
	ld b, 0
	ld a, [$A450]
	cp 1
	jr z, UnknownRJump_117C6
	cp 2
	jr z, UnknownRJump_117C2
	ld c, 26
	ld a, [$A43F]
	bit 7, a
	jr nz, UnknownRJump_117B7
	xor a
	ld [$FF00+c], a
	ld a, 128
	ld [$FF00+c], a

UnknownRJump_117B7:
	inc c
	inc l
	inc l
	inc l
	inc l
	ld a, [hli]
	ld e, a
	ld d, 0
	jr UnknownRJump_117D0

UnknownRJump_117C2:
	ld c, 22
	jr UnknownRJump_117C9

UnknownRJump_117C6:
	ld c, 16
	inc c

UnknownRJump_117C9:
	inc l
	inc l
	ld a, [hli]
	ld e, a
	inc l
	ld a, [hli]
	ld d, a

UnknownRJump_117D0:
	push hl
	inc l
	inc l
	ld a, [hli]
	and a
	jr z, UnknownRJump_117D9
	ld b, 8

UnknownRJump_117D9:
	inc l
	inc l
	ld [hl], 0
	inc l
	ld a, [hl]
	pop hl
	bit 7, a
	jr nz, UnknownRJump_117F2
	ld a, d
	or b
	ld [$FF00+c], a
	inc c
	ld a, e
	ld [$FF00+c], a
	inc c
	ld a, [hli]
	ld [$FF00+c], a
	inc c
	ld a, [hl]
	or $80
	ld [$FF00+c], a

UnknownJump_117F2:
UnknownRJump_117F2:
	pop hl
	dec l
	ld a, [hld]
	ld [hld], a
	dec l

UnknownJump_117F7:
	ld de, $A450
	ld a, [de]
	cp 4
	jr z, UnknownRJump_11808
	inc a
	ld [de], a
	ld a, 16
	add l
	ld l, a
	jp UnknownJump_11649

UnknownRJump_11808:
	ld hl, $A41E
	inc [hl]
	ld hl, $A42E
	inc [hl]
	ld hl, $A43E
	inc [hl]
	ret

UnknownJump_11815:
	pop hl
	ret

UnknownCall_11817:
	push hl
	ld a, l
	add 6
	ld l, a
	ld a, [hl]
	and $0F
	jr z, UnknownRJump_11839
	ld [$A451], a
	ld a, [$A450]
	ld c, 19
	cp 1
	jr z, UnknownRJump_11879
	ld c, 24
	cp 2
	jr z, UnknownRJump_11879
	ld c, 29
	cp 3
	jr z, UnknownRJump_11879

UnknownJump_11839:
UnknownRJump_11839:
	ld a, [$A450]
	cp 4
	jp z, UnknownJump_11815
	ld c, 19
	cp 1
	jp z, UnknownJump_11851
	ld c, 24
	cp 2
	jp z, UnknownJump_11851
	ld c, 29

UnknownJump_11851:
	ld de, $A51A
	call UnknownCall_11A71
	ld a, [de]
	and a
	jp nz, UnknownJump_11A18
	ld de, $A526
	call UnknownCall_11A71
	ld a, [de]
	and a
	jp nz, UnknownJump_119E4
	ld a, [$A450]
	cp 3
	jp nz, UnknownJump_11815
	ld a, [$A50E]
	and a
	jp nz, UnknownJump_1199A
	jp UnknownJump_11815

UnknownRJump_11879:
	inc l
	ld a, [hli]
	ld e, a
	ld a, [hl]
	and $0F
	ld d, a
	push de
	ld a, l
	add 4
	ld l, a
	ld b, [hl]
	ld a, [$A451]
	cp 1
	jp z, UnknownJump_11A87
	ld hl, $FFFF
	pop de
	add de
	call UnknownCall_11A60
	jp UnknownJump_11839

UnknownCall_11899:
	ld a, [$A41B]
	and a
	jr nz, UnknownRJump_118C0
	ld a, [$A417]
	and a
	jr z, UnknownRJump_118C0
	and $0F
	ld b, a
	ld hl, $A407
	ld a, [$A41E]
	cp [hl]
	jr nz, UnknownRJump_118C0
	ld c, 18
	ld de, $A41A
	ld a, [$A41F]
	bit 7, a
	jr nz, UnknownRJump_118C0
	call UnknownCall_118E4

UnknownRJump_118C0:
	ld a, [$A42B]
	and a
	ret nz
	ld a, [$A427]
	and a
	ret z
	and $0F
	ld b, a
	ld hl, $A408
	ld a, [$A42E]
	cp [hl]
	ret nz
	ld a, [$A42F]
	bit 7, a
	ret nz
	ld c, 23
	ld de, $A42A
	call UnknownCall_118E4
	ret

UnknownCall_118E4:
	push bc
	dec b
	ld c, b
	ld b, 0
	ld hl, $5CAC
	add bc
	ld a, [hl]
	pop bc
	ld [$FF00+c], a
	inc c
	inc c
	ld a, [de]
	or $80
	ld [$FF00+c], a
	ret

UnknownJump_118F7:
	call UnknownCall_13FE7
	xor a
	ld [$A461], a
	ld [$A471], a
	ld [$A479], a
	ld [$A505], a
	ld a, 1
	ld [$A45D], a
	ld b, 4
	ld hl, $A41F
	ld de, $0010

UnknownRJump_11914:
	res 7, [hl]
	add de
	dec b
	jr nz, UnknownRJump_11914
	ld hl, $5970
	ld de, $A501
	call UnknownCall_111C1
	jp UnknownJump_10067

UnknownJump_11926:
	xor a
	ld [$A45D], a
	ld [$A536], a
	ld [$A538], a
	ld [$A539], a
	jp UnknownJump_10044

UnknownJump_11936:
	ld de, $A501
	call UnknownCall_111B3
	jp nz, UnknownJump_10067
	ld bc, $A505
	call UnknownCall_111B7
	cp 6
	jp z, UnknownJump_11959
	ld hl, $5966
	call UnknownCall_111A6
	ld de, $A501
	call UnknownCall_111C1
	jp UnknownJump_10067

UnknownJump_11959:
	ld a, 240
	ld [$A501], a
	ld a, 5
	ld [$A505], a
	jp UnknownJump_10067

UnknownData_11966:
INCBIN "baserom.gb", $11966, $11989 - $11966


UnknownJump_11989:
	ld a, 1

UnknownRJump_1198B:
	ld [$A50E], a
	call UnknownCall_11546
	jp UnknownJump_11655

UnknownJump_11994:
	xor a
	ld [$A50E], a
	jr UnknownRJump_1198B

UnknownJump_1199A:
	cp 2
	jp z, UnknownJump_11815
	ld bc, $A51F
	call UnknownCall_111B7
	ld c, 28
	ld b, 64
	cp 3
	jr z, UnknownRJump_119C7
	ld b, 96
	cp 5
	jr z, UnknownRJump_119C7
	cp 10
	jr z, UnknownRJump_119C7
	ld b, 0
	cp 7
	jr z, UnknownRJump_119C7
	cp 13
	jp nz, UnknownJump_11815
	ld a, 2
	ld [$A50E], a

UnknownRJump_119C7:
	ld a, b
	ld [$FF00+c], a
	jp UnknownJump_11815

UnknownJump_119CC:
	ld de, $A526
	call UnknownCall_11A71
	ld a, 1

UnknownRJump_119D4:
	ld [de], a
	call UnknownCall_11546
	jp UnknownJump_11655

UnknownJump_119DB:
	ld de, $A526
	call UnknownCall_11A71
	xor a
	jr UnknownRJump_119D4

UnknownJump_119E4:
	inc e
	ld a, [de]
	and a
	jr nz, UnknownRJump_119FA
	inc a
	ld [de], a
	pop hl
	push hl
	call UnknownCall_11A55

UnknownRJump_119F0:
	ld hl, $FF9C
	add de
	call UnknownCall_11A60
	jp UnknownJump_11815

UnknownRJump_119FA:
	call UnknownCall_11A7A
	jr UnknownRJump_119F0

UnknownJump_119FF:
	ld de, $A51A
	call UnknownCall_11A71
	ld a, 1

UnknownJump_11A07:
	ld [de], a
	call UnknownCall_11546
	jp UnknownJump_11655

UnknownJump_11A0E:
	ld de, $A51A
	call UnknownCall_11A71
	xor a
	jp UnknownJump_11A07

UnknownJump_11A18:
	cp 2
	jp z, UnknownJump_11815
	inc e
	ld a, [de]
	and a
	jr z, UnknownRJump_11A44
	cp 5
	jr z, UnknownRJump_11A35
	inc a
	ld [de], a
	call UnknownCall_11A7A
	ld hl, $0001
	add de
	call UnknownCall_11A60
	jp UnknownJump_11815

UnknownRJump_11A35:
	ld de, $A51A
	call UnknownCall_11A71
	ld a, 2
	ld [de], a
	inc e
	xor a
	ld [de], a
	jp UnknownJump_11815

UnknownRJump_11A44:
	inc a
	ld [de], a
	pop hl
	push hl
	call UnknownCall_11A55
	ld hl, $FFFC
	add de
	call UnknownCall_11A60
	jp UnknownJump_11815

UnknownCall_11A55:
	ld a, 7
	add l
	ld l, a
	ld a, [hli]
	ld e, a
	ld a, [hl]
	and $0F
	ld d, a
	ret

UnknownCall_11A60:
	ld de, $A514
	call UnknownCall_11A71
	ld a, l
	ld [$FF00+c], a
	ld [de], a
	inc c
	inc e
	ld a, h
	and $0F
	ld [$FF00+c], a
	ld [de], a
	ret

UnknownCall_11A71:
	ld a, [$A450]
	dec a
	sla a
	add e
	ld e, a
	ret

UnknownCall_11A7A:
	ld de, $A514
	call UnknownCall_11A71
	ld a, [de]
	ld l, a
	inc e
	ld a, [de]
	ld d, a
	ld e, l
	ret

UnknownJump_11A87:
	pop de
	ld de, $A520
	call UnknownCall_11A71
	ld a, [de]
	inc a
	ld [de], a
	inc e
	cp 25
	jr z, UnknownRJump_11AC7
	cp 45
	jr z, UnknownRJump_11AC0
	ld a, [de]
	and a
	jp z, UnknownJump_11839

UnknownRJump_11A9F:
	dec e
	ld a, [de]
	sub 25
	sla a
	ld l, a
	ld h, 0
	ld de, $5ACC
	add de
	ld a, [hli]
	ld d, a
	ld a, [hl]
	ld e, a
	pop hl
	push hl
	push de
	call UnknownCall_11A55
	ld h, d
	ld l, e
	pop de
	add de
	call UnknownCall_11A60
	jp UnknownJump_11839

UnknownRJump_11AC0:
	dec e
	ld a, 25
	ld [de], a
	inc e
	jr UnknownRJump_11A9F

UnknownRJump_11AC7:
	ld a, 1
	ld [de], a
	jr UnknownRJump_11A9F

UnknownData_11ACC:
INCBIN "baserom.gb", $11ACC, $13F5E - $11ACC


UnknownJump_13F5E:
UnknownCall_13F5E:
	ld a, 255
	ld [$FF00+$25], a
	ld a, 3
	ld [$A455], a
	xor a
	ld [$A469], a

UnknownCall_13F6B:
	xor a
	ld [$A461], a
	ld [$A471], a
	ld [$A479], a
	ld [$A41F], a
	ld [$A42F], a
	ld [$A43F], a
	ld [$A44F], a
	ld [$A45E], a
	ld [$A50E], a
	ld [$A51F], a
	ld [$A52C], a
	ld [$A51A], a
	ld [$A51C], a
	ld [$A51E], a
	ld [$A51B], a
	ld [$A51D], a
	ld [$A51F], a
	ld [$A526], a
	ld [$A527], a
	ld [$A528], a
	ld [$A529], a
	ld [$A52A], a
	ld [$A52B], a
	ld [$A504], a
	ld [$A505], a
	ld [$A506], a
	ld [$A508], a
	ld [$A500], a
	ld [$A501], a
	ld [$A502], a
	ld [$A503], a
	ld [$A535], a
	ld [$A536], a
	ld [$A537], a
	ld [$A538], a
	ld [$A539], a
	ld [$A520], a
	ld [$A521], a
	ld [$A522], a
	ld [$A523], a
	ld [$A53F], a

UnknownCall_13FE7:
	ld a, 8
	ld [$FF00+$12], a
	ld [$FF00+$17], a
	ld [$FF00+$21], a
	ld a, 128
	ld [$FF00+$14], a
	ld [$FF00+$19], a
	ld [$FF00+$23], a
	xor a
	ld [$FF00+$10], a
	ld [$FF00+$1A], a
	ret

UnknownData_13FFD:
INCBIN "baserom.gb", $13FFD, $14000 - $13FFD



SECTION "bank05", ROMX, BANK[$05]


UnknownData_14000:
INCBIN "baserom.gb", $14000, $14043 - $14000

	call UnknownCall_2ABE
	ld de, $9800
	ld hl, $59E5

UnknownRJump_1404C:
	ld a, [hli]
	ld [de], a
	inc de
	ld a, d
	cp 156
	jr nz, UnknownRJump_1404C
	ld a, 7
	ld [$FF4B], a
	ld a, 136
	ld [$FF4A], a
	xor a
	ld [$A2B0], a
	ld a, 195
	ld [$FF40], a
	ld a, 5
	ld [$A267], a
	ld a, 64
	ld [$A266], a
	ld a, 255
	ld [$A468], a
	ld a, 1
	ld [$FF9B], a
	ret
	call UnknownCall_031C
	ld a, 228
	ld [$A27E], a
	ld a, 208
	ld [$A27F], a
	call UnknownCall_14113
	ld a, [$A267]
	cp 5
	ret nc
	and a
	jr z, UnknownRJump_140D6
	ld a, [$FF81]
	cp 4
	jr z, UnknownRJump_140A8
	ld a, [$FF81]
	cp 8
	ret nz
	ld a, 25
	ld [$FF9B], a
	ret

UnknownRJump_140A8:
UnknownData_140A8:
INCBIN "baserom.gb", $140A8, $140D6 - $140A8


UnknownRJump_140D6:
	ld a, [$A0F0]
	and $03
	ld b, a
	ld a, 127
	sub b
	ld h, a
	ld l, 0
	ld de, $A300

UnknownRJump_140E5:
	ld a, [hli]
	ld [de], a
	inc de
	ld a, l
	and a
	jr nz, UnknownRJump_140E5
	ld a, 15
	ld [$A2CE], a
	xor a
	ld [$A2CF], a
	ld [$FF97], a
	ld hl, $4121
	ld a, [$A0F0]
	and $03
	ld e, a
	ld d, 0
	add de
	ld a, [hl]
	ld [$A269], a
	ld a, 255
	ld [$A468], a
	ld a, 11
	ld [$FF9B], a
	ret

UnknownCall_14113:
	ld h, 161
	ld a, [$FF8D]
	ld l, a

UnknownRJump_14119:
	xor a
	ld [hli], a
	ld a, l
	cp 160
	jr c, UnknownRJump_14119
	ret

UnknownData_14121:
INCBIN "baserom.gb", $14121, $18000 - $14121



SECTION "bank06", ROMX, BANK[$06]


UnknownData_18000:
INCBIN "baserom.gb", $18000, $1C000 - $18000



SECTION "bank07", ROMX, BANK[$07]


UnknownData_1C000:
INCBIN "baserom.gb", $1C000, $20000 - $1C000



SECTION "bank08", ROMX, BANK[$08]


UnknownData_20000:
INCBIN "baserom.gb", $20000, $24000 - $20000



SECTION "bank09", ROMX, BANK[$09]


UnknownData_24000:
INCBIN "baserom.gb", $24000, $28000 - $24000



SECTION "bank0A", ROMX, BANK[$0A]


UnknownData_28000:
INCBIN "baserom.gb", $28000, $2C000 - $28000



SECTION "bank0B", ROMX, BANK[$0B]


UnknownData_2C000:
INCBIN "baserom.gb", $2C000, $30000 - $2C000



SECTION "bank0C", ROMX, BANK[$0C]

	call UnknownCall_0348
	call UnknownCall_2B8B
	ld de, $9800
	ld hl, $4A52

UnknownRJump_3000C:
	ld a, [hli]
	ld [de], a
	inc de
	ld a, d
	cp 156
	jr nz, UnknownRJump_3000C
	ld a, 228
	ld [$A27E], a
	ld [$FF47], a
	ld a, 208
	ld [$A27F], a
	ld [$FF48], a
	ld a, 56
	ld [$A280], a
	ld [$FF49], a
	ld a, 40
	ld [$FF00+$C2], a
	ld a, 16
	ld [$FF00+$C0], a
	call UnknownCall_28D9
	xor a
	ld [$A277], a
	ld [$A2B0], a
	ld [$A2B1], a
	ld [$A2C6], a
	ld a, 131
	ld [$FF40], a
	ld a, 5
	ld [$A460], a
	ld a, 13
	ld [$A468], a
	xor a
	ld [$A2E4], a
	ld a, [$FF9B]
	inc a
	ld [$FF9B], a
	ret
	ld a, 1
	ld [$FF00+$BB], a
	xor a
	ld [$A2C7], a
	ld a, [$A2E4]
	cp 1
	jr nz, UnknownRJump_3007D
	ld a, 68
	ld [$FF00+$C5], a
	ld a, 48
	ld [$FF00+$C4], a
	ld a, 241
	ld [$FF00+$C6], a
	call UnknownCall_2B13

UnknownRJump_3007D:
	call UnknownCall_3012E
	ld a, [$A2C7]
	and a
	jr nz, UnknownRJump_300E6
	ld a, [$FF00+$C0]
	ld [$FF00+$C4], a
	ld a, [$FF00+$C2]
	ld [$FF00+$C5], a
	ld a, [$A2E4]
	cp 1
	jr nz, UnknownRJump_3009B
	ld a, [$FF00+$C6]
	add 32
	ld [$FF00+$C6], a

UnknownRJump_3009B:
	ld a, [$A2C6]
	and a
	jr z, UnknownRJump_300E1
	ld a, [$A277]
	cp 4
	jr z, UnknownRJump_300B4
	ld a, [$FF97]
	and $01
	jr nz, UnknownRJump_300B4
	ld a, 4
	ld [$A478], a

UnknownRJump_300B4:
	ld hl, $412A
	ld a, [$FF97]
	and $0C
	srl a
	srl a
	ld e, a
	ld d, 0
	add de
	ld a, [hl]
	ld b, a
	ld a, 201
	add b
	ld [$FF00+$C6], a
	ld a, b
	and $01
	ld c, a
	ld a, [$FF00+$C4]
	inc a
	sub c
	ld [$FF00+$C4], a
	ld a, [$A22B]
	cp 1
	jr z, UnknownRJump_300E1
	ld a, 204
	add b
	ld [$FF00+$C6], a

UnknownRJump_300E1:
	call UnknownCall_2B13
	jr UnknownRJump_300FE

UnknownRJump_300E6:
	ld a, [$FF00+$C0]
	ld [$FF00+$C4], a
	ld a, [$FF00+$C2]
	ld [$FF00+$C5], a
	ld a, [$FF97]
	and $0C
	srl a
	srl a
	add 207
	ld [$FF00+$C6], a
	call UnknownCall_2B13

UnknownRJump_300FE:
	ld a, 88
	ld [$FF00+$C4], a
	ld a, 32
	ld [$FF00+$C5], a
	ld a, [$A042]
	ld [$FF00+$C6], a
	call UnknownCall_2B3B
	ld a, 64
	ld [$FF00+$C5], a
	ld a, [$A092]
	ld [$FF00+$C6], a
	call UnknownCall_2B3B
	ld a, 96
	ld [$FF00+$C5], a
	ld a, [$A0E2]
	ld [$FF00+$C6], a
	call UnknownCall_2B3B
	call UnknownCall_2B63
	ret

UnknownData_3012A:
INCBIN "baserom.gb", $3012A, $3012E - $3012A


UnknownCall_3012E:
	ld a, [$A277]
	rst $28

UnknownData_30132:
INCBIN "baserom.gb", $30132, $30140 - $30132

	ld a, [$A278]
	dec a
	ld [$A278], a
	jr nz, UnknownRJump_30159

UnknownRJump_30149:
	ld a, 124
	ld [$FF00+$C0], a
	ld a, 1
	ld [$A277], a
	xor a
	ld [$A2C6], a
	ld [$FF00+$BB], a
	ret

UnknownRJump_30159:
	srl a
	and $F0
	swap a
	add 211
	ld [$FF00+$C6], a
	ld a, [$FF00+$C2]
	ld [$FF00+$C5], a
	xor a
	ld [$FF00+$BB], a
	ld a, [$A278]
	cp 64
	jr c, UnknownRJump_3017C
	srl a
	srl a
	add 112
	ld [$FF00+$C4], a
	call UnknownCall_2B13

UnknownRJump_3017C:
	ld a, [$A278]
	and $F0
	swap a
	sub 4
	ld b, a
	ld a, [$A2D1]
	sub b
	ld [$A2D1], a
	ld a, [$A278]
	cp 64
	jr nc, UnknownRJump_301A6
	ld a, [$A2D1]
	cp 124
	jr c, UnknownRJump_301A6
	ld a, 124
	ld [$A2D1], a
	ld a, 16
	ld [$FF00+$C6], a
	jr UnknownRJump_30149

UnknownRJump_301A6:
	ld a, [$A2D1]
	ld [$FF00+$C4], a
	ld a, [$A278]
	and $18
	sla a
	swap a
	ld e, a
	ld d, 0
	ld hl, $41C2
	add de
	ld a, [hl]
	ld [$FF00+$C6], a
	call UnknownCall_2B13
	ret

UnknownData_301C2:
INCBIN "baserom.gb", $301C2, $301C6 - $301C2

	xor a
	ld [$FF00+$BB], a
	ld a, 16
	ld [$FF00+$C6], a
	ld a, [$FF00+$C0]
	add 1
	ld [$FF00+$C0], a
	ld a, [$A278]
	dec a
	ld [$A278], a
	ret nz
	ld a, 21
	ld [$A224], a
	ld a, [$FF00+$C2]
	and $60
	srl a
	swap a
	dec a
	ld [$A2A3], a
	ld a, [$A2C6]
	and a
	jr nz, UnknownRJump_30227
	ld a, 21
	ld [$FF9B], a
	ld a, [$A2A3]
	ld b, a
	sla a
	sla a
	add b
	swap a
	ld e, a
	ld d, 160
	ld hl, $A840
	ld b, 64

UnknownRJump_3020A:
	ld a, [de]
	ld [hli], a
	inc de
	dec b
	jr nz, UnknownRJump_3020A
	ld l, e
	ld h, d
	ld a, [hli]
	ld [$A262], a
	ld a, [hli]
	ld [$A263], a
	ld a, [hli]
	ld [$A2C5], a
	ld a, [hli]
	ld [$A22C], a
	ld a, [hli]
	ld [$A28D], a
	ret

UnknownRJump_30227:
	ld a, [$A2A3]
	ld b, a
	sla a
	sla a
	add b
	swap a
	ld l, a
	ld h, 160
	ld b, 64
	xor a

UnknownRJump_30238:
	ld [hli], a
	dec b
	jr nz, UnknownRJump_30238
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
	ld a, 128
	ld [$A278], a
	ld a, 6
	ld [$A277], a
	xor a
	ld [$A2C6], a
	ld a, 144
	ld [$A2D1], a
	ld a, 5
	ld [$A478], a
	ret
	ld a, 9
	ld [$FF00+$C6], a
	ld a, [$A278]
	dec a
	ld [$A278], a
	cp 43
	call z, UnknownCall_30291
	ld a, [$A278]
	cp 43
	jr nc, UnknownRJump_3028A
	cp 11
	jr nc, UnknownRJump_302C2
	jr UnknownRJump_302AD

UnknownRJump_3028A:
	ld a, [$FF00+$C0]
	dec a
	dec a
	ld [$FF00+$C0], a
	ret

UnknownCall_30291:
	ld a, [$A2C6]
	xor $FF
	ld [$A2C6], a
	ld a, 255
	ld [$A22B], a
	ld a, 8
	ld [$A460], a
	ld a, [$A2C6]
	and a
	ret z
	xor a
	ld [$A2E4], a
	ret

UnknownRJump_302AD:
	ld a, [$FF00+$C0]
	inc a
	inc a
	ld [$FF00+$C0], a
	ld a, [$A278]
	and a
	ret nz
	ld a, 1
	ld [$A277], a
	ld a, 124
	ld [$FF00+$C0], a
	ret

UnknownRJump_302C2:
	ld a, 255
	ld [$A2C7], a
	ret
	ld a, 255
	ld [$A22B], a
	call UnknownCall_3040D
	ld a, [$A222]
	and $0C
	srl a
	srl a
	add 5
	ld [$FF00+$C6], a
	ld a, [$FF00+$C2]
	sub 1
	ld [$FF00+$C2], a
	ld a, [$A278]
	dec a
	ld [$A278], a
	ret nz
	ld a, 1
	ld [$A277], a
	ret
	ld a, 1
	ld [$A22B], a
	call UnknownCall_3040D
	ld a, [$A222]
	and $0C
	srl a
	srl a
	add 1
	ld [$FF00+$C6], a
	ld a, [$FF00+$C2]
	add 1
	ld [$FF00+$C2], a
	ld a, [$A278]
	dec a
	ld [$A278], a
	ret nz
	ld a, 1
	ld [$A277], a
	ret

UnknownJump_3031A:
UnknownRJump_3031A:
	ld a, [$A22B]
	xor $FF
	add 2
	sla a
	ld [$FF00+$C6], a
	ret
	ld a, [$FF81]
	cp 4
	jp z, UnknownJump_3037D
	ld a, [$FF80]
	and $30
	jr z, UnknownRJump_30342
	ld a, [$FF80]
	cp 16
	jp z, UnknownJump_30398
	cp 32
	jp z, UnknownJump_303B7

UnknownRJump_30342:
	ld a, [$FF81]
	cp 128
	jr z, UnknownRJump_30367
	cp 8
	jr z, UnknownRJump_30367
	cp 1
	jr nz, UnknownRJump_3031A
	ld a, [$FF00+$C2]
	cp 136
	jr nz, UnknownRJump_3031A
	ld a, 4
	ld [$A277], a
	ld a, 55
	ld [$A278], a
	ld a, 1
	ld [$A460], a
	ret

UnknownRJump_30367:
	ld a, [$FF00+$C2]
	cp 128
	jr nc, UnknownRJump_3031A
	ld a, 5
	ld [$A277], a
	ld a, 64
	ld [$A278], a
	ld a, 5
	ld [$A460], a
	ret

UnknownJump_3037D:
	ld a, [$A2C6]
	and a
	ret nz
	ld a, [$A2E4]
	xor $FF
	and $01
	ld [$A2E4], a
	ld a, [$A22B]
	xor $FF
	add 2
	sla a
	ld [$FF00+$C6], a
	ret

UnknownJump_30398:
	ld a, [$FF00+$C2]
	cp 136
	jp nc, UnknownJump_3031A
	ld a, 2
	ld [$A277], a
	ld a, 32
	ld [$A278], a
	ld a, [$A222]
	and $0C
	srl a
	srl a
	add 1
	ld [$FF00+$C6], a
	ret

UnknownJump_303B7:
	ld a, [$FF00+$C2]
	cp 48
	jp c, UnknownJump_3031A
	ld a, 3
	ld [$A277], a
	ld a, 32
	ld [$A278], a
	ld a, [$A222]
	and $0C
	srl a
	srl a
	add 5
	ld [$FF00+$C6], a
	ret
	ld a, 16
	ld [$FF00+$C6], a
	xor a
	ld [$FF00+$BB], a
	ld a, [$FF00+$C0]
	cp 48
	jr c, UnknownRJump_303EB
	ld a, 10
	ld [$FF00+$C6], a
	ld a, 1
	ld [$FF00+$BB], a

UnknownRJump_303EB:
	ld a, [$FF00+$C0]
	cp 124
	jr nc, UnknownRJump_30400
	add 2
	ld [$FF00+$C0], a
	cp 64
	jr c, UnknownRJump_303FF
	ld a, [$FF00+$C0]
	add 1
	ld [$FF00+$C0], a

UnknownRJump_303FF:
	ret

UnknownRJump_30400:
	ld a, 1
	ld [$A277], a
	ld [$A22B], a
	ld a, 124
	ld [$FF00+$C0], a
	ret

UnknownCall_3040D:
	ld a, [$A222]
	add 1
	ld [$A222], a
	cp 12
	ret c
	xor a
	ld [$A222], a
	ret
	ld a, [$A27D]
	bit 7, a
	jr nz, UnknownRJump_3042D
	ld a, [$A2C5]
	add 1
	daa
	ld [$A2C5], a

UnknownRJump_3042D:
	xor a
	ld [$A299], a
	ld a, 192
	ld [$FF00+$C0], a
	ld hl, $4985
	ld a, [$A269]
	ld e, a
	ld d, 0
	add de
	ld a, [hl]
	ld [$FF00+$C2], a
	xor a
	ld [$A277], a
	ld [$A222], a
	ld a, [$FF9B]
	inc a
	ld [$FF9B], a
	ret
	call UnknownCall_3046B
	call UnknownCall_307BC
	call UnknownCall_2B63
	ret

UnknownJump_3045B:
	ld a, [$FF00+$C0]
	ld [$FF00+$C4], a
	ld a, [$FF00+$C2]
	ld [$FF00+$C5], a
	ld a, 1
	ld [$FF00+$BB], a
	call UnknownCall_2B13
	ret

UnknownCall_3046B:
	ld a, [$A277]
	rst $28

UnknownData_3046F:
INCBIN "baserom.gb", $3046F, $30477 - $3046F

	ld a, [$A266]
	and a
	ret nz
	ld a, [$A2CA]
	ld [$A2C9], a
	and a
	jr z, UnknownRJump_30494
	dec a
	ld [$A2CA], a
	ld a, 64
	ld [$A266], a
	ld a, 10
	ld [$A478], a
	ret

UnknownRJump_30494:
	ld a, [$A277]
	inc a
	ld [$A277], a
	ld a, 255
	ld [$A266], a
	ret
	ld a, [$A266]
	and a
	ret nz
	ld a, 20
	ld [$FF9B], a
	ret
	ld a, [$A267]
	ld b, a
	ld a, [$A266]
	or b
	jr nz, UnknownRJump_3050A
	ld a, 208
	ld [$A27F], a
	ld hl, $44F1
	ld a, [$A269]
	ld e, a
	ld d, 0
	add de
	ld a, [hl]
	ld e, a
	ld d, 0
	ld hl, $A848
	add de
	ld a, 128
	ld [hl], a
	ld a, [$A2CB]
	cp 5
	jr z, UnknownRJump_304DD
	ld a, 20
	ld [$FF9B], a
	ret

UnknownRJump_304DD:
	ld a, [$A277]
	inc a
	ld [$A277], a
	ld a, 64
	ld [$A266], a
	ld a, 5
	ld [$A2CA], a
	jp UnknownJump_3045B

UnknownData_304F1:
INCBIN "baserom.gb", $304F1, $3050A - $304F1


UnknownRJump_3050A:
	ld hl, $499D
	ld a, [$A269]
	ld e, a
	ld d, 0
	add de
	ld a, [hl]
	ld [$FF00+$C0], a
	ld hl, $49B5
	ld a, [$A269]
	ld e, a
	ld d, 0
	add de
	ld a, [hl]
	ld [$FF00+$C6], a
	ld a, 208
	ld [$A27F], a
	ld a, [$FF97]
	and $1F
	cp 4
	jp nc, UnknownJump_3045B
	ld a, 0
	ld [$A27F], a
	jp UnknownJump_3045B
	ld a, [$FF00+$C0]
	ld [$FF00+$C4], a
	ld a, [$FF00+$C2]
	ld [$FF00+$C5], a
	ld a, 1
	ld [$FF00+$BB], a
	ld a, [$FF97]
	and $04
	srl a
	srl a
	add 197
	ld [$FF00+$C6], a
	call UnknownCall_2B13
	ld a, [$A222]
	add 8
	ld [$A222], a
	cp 80
	jr c, UnknownRJump_30567
	xor a
	ld [$A222], a

UnknownRJump_30567:
	ld a, [$A222]
	and $F0
	swap a
	add 191
	ld [$FF00+$C6], a
	ld hl, $499D
	ld a, [$A269]
	ld e, a
	ld d, 0
	add de
	ld a, [hl]
	ld b, a
	ld a, [$FF00+$C0]
	cp b
	jr z, UnknownRJump_30593
	ld a, [$FF97]
	bit 0, a
	jp nz, UnknownJump_3045B
	ld a, [$FF00+$C0]
	inc a
	ld [$FF00+$C0], a
	jp UnknownJump_3045B

UnknownRJump_30593:
	ld a, 15
	ld [$A468], a
	ld a, [$A2CB]
	cp 5
	jr nz, UnknownRJump_305A4
	ld a, 26
	ld [$A468], a

UnknownRJump_305A4:
	ld a, 1
	ld [$A277], a
	ld a, 1
	ld [$A267], a
	ld a, 255
	ld [$A266], a
	jp UnknownJump_3045B
	call UnknownCall_0348
	ld bc, $1800
	ld hl, $4C92
	ld de, $8000
	call UnknownCall_0336
	ld de, $9800
	ld hl, $6492

UnknownRJump_305CB:
	ld a, [hli]
	ld [de], a
	inc de
	ld a, d
	cp 155
	jr nz, UnknownRJump_305CB
	xor a
	ld [$A2CC], a
	ld a, [$A84D]
	bit 7, a
	jr z, UnknownRJump_30629
	ld a, [$A851]
	bit 7, a
	jr z, UnknownRJump_30629
	ld a, [$A865]
	bit 7, a
	jr z, UnknownRJump_30629
	ld a, [$A85F]
	bit 7, a
	jr z, UnknownRJump_30629
	ld a, [$A859]
	bit 7, a
	jr z, UnknownRJump_30629
	ld a, [$A856]
	bit 7, a
	jr z, UnknownRJump_30629
	ld a, 116
	ld hl, $99C8
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, $99A8
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, $9988
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, $9968
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, $9948
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld [$A2CC], a

UnknownRJump_30629:
	ld a, 228
	ld [$A27E], a
	ld [$FF47], a
	ld a, 208
	ld [$A27F], a
	ld [$FF48], a
	ld a, 56
	ld [$A280], a
	ld [$FF49], a
	xor a
	ld [$A2B0], a
	ld [$FF42], a
	ld [$A2B1], a
	ld [$FF43], a
	ld [$A26E], a
	ld a, 64
	ld [$A278], a
	xor a
	ld [$A277], a
	ld a, 88
	ld [$FF00+$C2], a
	ld a, [$FF9B]
	cp 29
	jr z, UnknownRJump_3066A
	ld a, 255
	ld [$A468], a

UnknownRJump_3066A:
	call UnknownCall_2B77
	ld a, 195
	ld [$FF40], a
	ld a, [$FF9B]
	inc a
	ld [$FF9B], a
	ret
	call UnknownCall_30693
	ld a, [$FF00+$C0]
	ld [$FF00+$C4], a
	ld a, [$FF00+$C2]
	ld [$FF00+$C5], a
	ld a, 1
	ld [$FF00+$BB], a
	call UnknownCall_2B13
	call UnknownCall_307BC
	call UnknownCall_2B63
	ret

UnknownCall_30693:
	ld a, [$A277]
	rst $28

UnknownData_30697:
INCBIN "baserom.gb", $30697, $3069F - $30697

	ld hl, $46D1
	ld a, [$A266]
	and $F0
	swap a
	sla a
	sla a
	ld e, a
	ld d, 0
	add de
	ld a, [hli]
	ld [$A27E], a
	ld a, [hli]
	ld [$A27F], a
	ld a, [hl]
	ld [$A280], a
	ld a, 187
	ld [$FF00+$C6], a
	ld a, [$A266]
	and a
	ret nz
	ld a, 24
	ld [$A269], a
	ld a, 22
	ld [$FF9B], a
	ret

UnknownData_306D1:
INCBIN "baserom.gb", $306D1, $306E1 - $306D1

	ld a, 187
	ld [$FF00+$C6], a
	ld a, [$A2CB]
	cp 6
	jr nz, UnknownRJump_30700
	ld a, [$FF81]
	and $49
	jr z, UnknownRJump_30700
	ld a, [$A277]
	inc a
	ld [$A277], a
	ld a, 64
	ld [$A266], a
	ret

UnknownRJump_30700:
	ld a, [$FF81]
	cp 128
	ret nz
	ld a, 1
	ld [$A277], a
	ld a, 64
	ld [$A278], a
	ret
	ld a, [$FF97]
	and $0C
	srl a
	srl a
	ld e, a
	ld d, 0
	ld hl, $4748
	add de
	ld a, [hl]
	ld [$FF00+$C6], a
	ld a, [$A278]
	dec a
	ld [$A278], a
	jr z, UnknownRJump_30736
	srl a
	ld b, a
	ld a, 168
	sub b
	ld [$FF00+$C0], a
	ret

UnknownRJump_30736:
	ld a, 20
	ld [$FF9B], a
	xor a
	ld [$A266], a
	ld [$A267], a
	ld a, 1
	ld [$A224], a
	ret

UnknownData_30748:
INCBIN "baserom.gb", $30748, $3074C - $30748

	ld a, [$FF97]
	and $0C
	srl a
	srl a
	ld e, a
	ld d, 0
	ld hl, $4777
	add de
	ld a, [hl]
	ld [$FF00+$C6], a
	ld a, [$A278]
	dec a
	ld [$A278], a
	jr z, UnknownRJump_30771
	srl a
	ld b, a
	ld a, 136
	add b
	ld [$FF00+$C0], a
	ret

UnknownRJump_30771:
	ld a, 2
	ld [$A277], a
	ret

UnknownData_30777:
INCBIN "baserom.gb", $30777, $307BC - $30777


UnknownCall_307BC:
	xor a
	ld [$A2CB], a
	ld a, 1
	ld [$FF00+$BB], a
	ld a, [$A84D]
	bit 7, a
	jr z, UnknownRJump_307E4
	ld a, [$498A]
	ld [$FF00+$C5], a
	ld a, [$49A2]
	ld [$FF00+$C4], a
	ld a, [$49BA]
	ld [$FF00+$C6], a
	call UnknownCall_2B13
	ld a, [$A2CB]
	inc a
	ld [$A2CB], a

UnknownRJump_307E4:
	ld a, [$A851]
	bit 7, a
	jr z, UnknownRJump_30804
	ld a, [$498E]
	ld [$FF00+$C5], a
	ld a, [$49A6]
	ld [$FF00+$C4], a
	ld a, [$49BE]
	ld [$FF00+$C6], a
	call UnknownCall_2B13
	ld a, [$A2CB]
	inc a
	ld [$A2CB], a

UnknownRJump_30804:
	ld a, [$A865]
	bit 7, a
	jr z, UnknownRJump_30824
	ld a, [$4992]
	ld [$FF00+$C5], a
	ld a, [$49AA]
	ld [$FF00+$C4], a
	ld a, [$49C2]
	ld [$FF00+$C6], a
	call UnknownCall_2B13
	ld a, [$A2CB]
	inc a
	ld [$A2CB], a

UnknownRJump_30824:
	ld a, [$A85F]
	bit 7, a
	jr z, UnknownRJump_30844
	ld a, [$4995]
	ld [$FF00+$C5], a
	ld a, [$49AD]
	ld [$FF00+$C4], a
	ld a, [$49C5]
	ld [$FF00+$C6], a
	call UnknownCall_2B13
	ld a, [$A2CB]
	inc a
	ld [$A2CB], a

UnknownRJump_30844:
	ld a, [$A859]
	bit 7, a
	jr z, UnknownRJump_30864
	ld a, [$4998]
	ld [$FF00+$C5], a
	ld a, [$49B0]
	ld [$FF00+$C4], a
	ld a, [$49C8]
	ld [$FF00+$C6], a
	call UnknownCall_2B13
	ld a, [$A2CB]
	inc a
	ld [$A2CB], a

UnknownRJump_30864:
	ld a, [$A856]
	bit 7, a
	ret z
	ld a, [$499C]
	ld [$FF00+$C5], a
	ld a, [$49B4]
	ld [$FF00+$C4], a
	ld a, [$49CC]
	ld [$FF00+$C6], a
	call UnknownCall_2B13
	ld a, [$A2CB]
	inc a
	ld [$A2CB], a
	ret
	xor a
	ld [$A2D3], a
	ld a, [$A267]
	and a
	jr nz, UnknownRJump_3089A
	ld a, [$A266]
	cp 128
	jr nc, UnknownRJump_3089A
	sub 128
	ld [$A2D3], a

UnknownRJump_3089A:
	ld a, 1
	ld [$FF00+$BB], a
	ld a, [$A2B5]
	bit 5, a
	jr z, UnknownRJump_308C3
	ld a, [$498A]
	ld [$FF00+$C5], a
	ld a, [$A2D3]
	ld b, a
	ld a, [$49A2]
	add b
	ld [$FF00+$C4], a
	ld a, [$49BA]
	ld [$FF00+$C6], a
	ld a, b
	and a
	jr z, UnknownRJump_308C0
	call UnknownCall_3097C

UnknownRJump_308C0:
	call UnknownCall_2B13

UnknownRJump_308C3:
	ld a, [$A2B5]
	bit 4, a
	jr z, UnknownRJump_308E8
	ld a, [$498E]
	ld [$FF00+$C5], a
	ld a, [$A2D3]
	ld b, a
	ld a, [$49A6]
	add b
	ld [$FF00+$C4], a
	ld a, [$49BE]
	ld [$FF00+$C6], a
	ld a, b
	and a
	jr z, UnknownRJump_308E5
	call UnknownCall_3097C

UnknownRJump_308E5:
	call UnknownCall_2B13

UnknownRJump_308E8:
	ld a, [$A2B5]
	bit 6, a
	jr z, UnknownRJump_3090D
	ld a, [$4992]
	ld [$FF00+$C5], a
	ld a, [$A2D3]
	ld b, a
	ld a, [$49AA]
	add b
	ld [$FF00+$C4], a
	ld a, [$49C2]
	ld [$FF00+$C6], a
	ld a, b
	and a
	jr z, UnknownRJump_3090A
	call UnknownCall_3097C

UnknownRJump_3090A:
	call UnknownCall_2B13

UnknownRJump_3090D:
	ld a, [$A2B5]
	bit 4, a
	jr z, UnknownRJump_30932
	ld a, [$4995]
	ld [$FF00+$C5], a
	ld a, [$A2D3]
	ld b, a
	ld a, [$49AD]
	add b
	ld [$FF00+$C4], a
	ld a, [$49C5]
	ld [$FF00+$C6], a
	ld a, b
	and a
	jr z, UnknownRJump_3092F
	call UnknownCall_3097C

UnknownRJump_3092F:
	call UnknownCall_2B13

UnknownRJump_30932:
	ld a, [$A2B5]
	bit 4, a
	jr z, UnknownRJump_30957
	ld a, [$4998]
	ld [$FF00+$C5], a
	ld a, [$A2D3]
	ld b, a
	ld a, [$49B0]
	add b
	ld [$FF00+$C4], a
	ld a, [$49C8]
	ld [$FF00+$C6], a
	ld a, b
	and a
	jr z, UnknownRJump_30954
	call UnknownCall_3097C

UnknownRJump_30954:
	call UnknownCall_2B13

UnknownRJump_30957:
	ld a, [$A2B5]
	bit 0, a
	ret z
	ld a, [$499C]
	ld [$FF00+$C5], a
	ld a, [$A2D3]
	ld b, a
	ld a, [$49B4]
	add b
	ld [$FF00+$C4], a
	ld a, [$49CC]
	ld [$FF00+$C6], a
	ld a, b
	and a
	jr z, UnknownRJump_30978
	call UnknownCall_3097C

UnknownRJump_30978:
	call UnknownCall_2B13
	ret

UnknownCall_3097C:
	and $06
	srl a
	add 222
	ld [$FF00+$C6], a
	ret

UnknownData_30985:
INCBIN "baserom.gb", $30985, $309CD - $30985

	ld a, [$A2C9]
	dec a
	sla a
	sla a
	ld e, a
	ld d, 0
	ld hl, $4A2A
	add de
	ld de, $99C8
	ld b, 4

UnknownRJump_309E1:
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, UnknownRJump_309E1
	ld de, $99A8
	ld b, 4

UnknownRJump_309EC:
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, UnknownRJump_309EC
	ld de, $9988
	ld b, 4

UnknownRJump_309F7:
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, UnknownRJump_309F7
	ld de, $9968
	ld b, 4

UnknownRJump_30A02:
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, UnknownRJump_30A02
	ld de, $9948
	ld b, 4

UnknownRJump_30A0D:
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, UnknownRJump_30A0D
	xor a
	ld [$A2C9], a
	call $FFA0
	ld a, [$A24E]
	ld [$2100], a
	ld a, 1
	ld [$FF82], a
	pop hl
	pop de
	pop bc
	pop af
	reti

UnknownData_30A2A:
INCBIN "baserom.gb", $30A2A, $34000 - $30A2A



SECTION "bank0D", ROMX, BANK[$0D]


UnknownData_34000:
INCBIN "baserom.gb", $34000, $38000 - $34000



SECTION "bank0E", ROMX, BANK[$0E]


UnknownData_38000:
INCBIN "baserom.gb", $38000, $3C000 - $38000



SECTION "bank0F", ROMX, BANK[$0F]

	ld a, [$A68B]
	or a
	jp z, UnknownJump_3C04D
	cp 1
	jp z, UnknownJump_3C063
	cp 2
	jp z, UnknownJump_3C06F
	cp 3
	jp z, UnknownJump_3C07B
	cp 4
	jp z, UnknownJump_3C087
	cp 5
	jp z, UnknownJump_3C093
	cp 6
	jp z, UnknownJump_3C09F
	cp 7
	jp z, UnknownJump_3C0AB
	cp 8
	jp z, UnknownJump_3C0B7
	cp 9
	jp z, UnknownJump_3C0C3
	cp 10
	jp z, UnknownJump_3C0CA
	cp 11
	jp z, UnknownJump_3C0D1
	cp 12
	jp z, UnknownJump_3C0D8
	cp 13
	jp z, UnknownJump_3C0DF
	cp 14
	jp z, UnknownJump_3C10E

UnknownJump_3C04D:
	call UnknownCall_3ED4C
	call UnknownCall_3C38C
	ld a, [$A68B]
	or a
	jp nz, UnknownJump_3C169
	call UnknownCall_3C13E
	call UnknownCall_3CFC8
	jp UnknownJump_3C169

UnknownJump_3C063:
	call UnknownCall_3C13E
	call UnknownCall_3D8E6
	call UnknownCall_3C38C
	jp UnknownJump_3C169

UnknownJump_3C06F:
	call UnknownCall_3C13E
	call UnknownCall_3DA2D
	call UnknownCall_3C38C
	jp UnknownJump_3C169

UnknownJump_3C07B:
	call UnknownCall_3C13E
	call UnknownCall_3DB12
	call UnknownCall_3C38C
	jp UnknownJump_3C169

UnknownJump_3C087:
	call UnknownCall_3C13E
	call UnknownCall_3DB40
	call UnknownCall_3C38C
	jp UnknownJump_3C169

UnknownJump_3C093:
	call UnknownCall_3C13E
	call UnknownCall_3DDD3
	call UnknownCall_3C38C
	jp UnknownJump_3C169

UnknownJump_3C09F:
	call UnknownCall_3C13E
	call UnknownCall_3DEC7
	call UnknownCall_3C38C
	jp UnknownJump_3C169

UnknownJump_3C0AB:
	call UnknownCall_3C13E
	call UnknownCall_3DFE8
	call UnknownCall_3C38C
	jp UnknownJump_3C169

UnknownJump_3C0B7:
	call UnknownCall_3C13E
	call UnknownCall_3DD8C
	call UnknownCall_3C38C
	jp UnknownJump_3C169

UnknownJump_3C0C3:
	call UnknownCall_3C13E
	call UnknownCall_3DDC3
	ret

UnknownJump_3C0CA:
	call UnknownCall_3C13E
	call UnknownCall_3DDC7
	ret

UnknownJump_3C0D1:
	call UnknownCall_3C13E
	call UnknownCall_3DDCB
	ret

UnknownJump_3C0D8:
	call UnknownCall_3C13E
	call UnknownCall_3DDCF
	ret

UnknownJump_3C0DF:
	call UnknownCall_3C13E
	ld a, 24
	ld hl, $4512
	call UnknownCall_3E00
	ld a, [$A7A6]
	cp 4
	jr c, UnknownRJump_3C101
	cp 7
	jr nc, UnknownRJump_3C101
	ld a, [$FF80]
	and $20
	jr z, UnknownRJump_3C101

UnknownData_3C0FC:
INCBIN "baserom.gb", $3C0FC, $3C101 - $3C0FC


UnknownRJump_3C101:
	ld a, [$A7A6]
	cp 10
	ret nz
	call UnknownCall_3E9FB
	call UnknownCall_3EF2B
	ret

UnknownJump_3C10E:
	call UnknownCall_3C13E
	ld a, 24
	ld hl, $4028
	call UnknownCall_3E00
	ld a, [$A7A6]
	cp 5
	jr nz, UnknownRJump_3C131
	ld a, [$FF80]
	and $20
	jr z, UnknownRJump_3C131

UnknownData_3C127:
INCBIN "baserom.gb", $3C127, $3C131 - $3C127


UnknownRJump_3C131:
	ld a, [$A7A6]
	cp 10
	ret nz
	call UnknownCall_3E9FB
	call UnknownCall_3EF2B
	ret

UnknownCall_3C13E:
	ld c, 4
	ld a, [$FF00+c]
	ld d, a
	ld a, [$A6B2]
	xor d
	ld [$A6B2], a
	ld a, [$A69A]
	inc a
	ld [$A69A], a
	ld a, [$A697]
	dec a
	ld [$A697], a
	ret nz
	ld a, 40
	ld [$A697], a
	ld c, 4
	ld a, [$FF00+c]
	ld d, a
	ld a, [$A696]
	xor d
	ld [$A696], a
	ret

UnknownJump_3C169:
	ei
	ld a, [$A690]
	or a
	ret nz
	ld a, [$FF81]
	and $09
	ret z
	ld a, [$A7A0]
	or a
	ret nz
	ld a, [$A840]
	ld hl, $650E
	ld d, 0
	ld e, a
	add de
	ld a, [hl]
	ld e, a
	ld hl, $A848
	add de
	ld c, [hl]
	bit 7, c
	jr z, UnknownRJump_3C1A2
	ld a, e
	cp 5
	ret z
	cp 9
	ret z
	cp 14
	ret z
	cp 23
	ret z
	cp 29
	ret z
	cp 17
	ret z

UnknownRJump_3C1A2:
	xor a
	ld [$A27D], a
	ld a, [$A840]
	ld hl, $4218
	ld d, 0
	ld e, a
	add de
	ld a, [hl]
	cp 254
	jr z, UnknownRJump_3C201
	ld [$A269], a
	ld a, c
	ld [$A27D], a
	ld a, 255
	ld [$A468], a
	call UnknownCall_2AAA
	ld a, [$A68B]
	cp 3
	jr z, UnknownRJump_3C1EC
	ld hl, $A102
	ld a, 27
	ld [hli], a
	ld a, 0
	ld [hl], a
	ld l, 6
	ld a, 10
	ld [hli], a
	ld a, 32
	ld [hl], a
	ld l, 10
	ld a, 28
	ld [hli], a
	ld a, 0
	ld [hl], a
	ld l, 14
	ld a, 11
	ld [hli], a
	ld a, 32
	ld [hl], a

UnknownRJump_3C1EC:
	ld a, 22
	ld [$A460], a
	call UnknownCall_3E9FB
	call UnknownCall_2934
	ld a, 7
	ld [$FF00+$4B], a
	ld a, 22
	ld [$FF9B], a
	ret

UnknownRJump_3C201:
	ld a, [$FF81]
	and $01
	ret z
	ld a, 16
	ld [$A7B8], a
	ld a, [$A840]
	cp 110
	ret c
	ld a, 2
	ld [$A460], a
	ret

UnknownData_3C218:
INCBIN "baserom.gb", $3C218, $3C29A - $3C218


UnknownCall_3C29A:
	ld a, 16
	ld [$FF81], a
	ret

UnknownCall_3C2A0:
	ld a, 32
	ld [$FF81], a
	ret

UnknownCall_3C2A6:
	ld a, 128
	ld [$FF81], a
	ret

UnknownCall_3C2AC:
	ld a, 64
	ld [$FF81], a
	ret

UnknownCall_3C2B2:
	ld a, 8
	ld [$FF81], a
	ret

UnknownCall_3C2B8:
	ld a, [$FF81]
	bit 4, a
	jr z, UnknownRJump_3C2D0
	ld a, [$A855]
	bit 7, a
	ret z
	ld a, 54
	ld [$A840], a
	ld a, 16
	ld [$FF81], a
	ret

UnknownRJump_3C2D0:
	ld a, [$FF81]
	bit 5, a
	ret z
	ld a, [$A86B]
	bit 7, a
	ret z
	ld a, 55
	ld [$A840], a
	ld a, 32
	ld [$FF81], a
	ret

UnknownCall_3C2E7:
	ld a, [$FF81]
	bit 6, a
	ret z
	ld a, [$A853]
	bit 0, a
	ret z
	ld a, 57
	ld [$A840], a
	ld a, 64
	ld [$FF81], a
	ret

UnknownCall_3C2FE:
	ld a, [$FF81]
	bit 4, a
	ret z
	ld a, [$A86B]
	bit 7, a
	ret z
	ld a, 108
	ld [$A840], a
	ld a, 16
	ld [$FF81], a
	ret

UnknownData_3C315:
INCBIN "baserom.gb", $3C315, $3C316 - $3C315


UnknownJump_3C316:
	ld a, [$A690]
	or a
	jp nz, UnknownJump_3C4CC
	ld a, [$A848]
	bit 7, a
	jp z, UnknownJump_3C4CC

UnknownData_3C325:
INCBIN "baserom.gb", $3C325, $3C32D - $3C325


UnknownCall_3C32D:
	ld a, [$A690]
	or a
	ret nz
	ld a, [$A224]
	or a
	ret nz
	ld a, 255
	ld [$A224], a
	ld a, [$A840]
	ld hl, $650E
	ld d, 0
	ld e, a
	add de
	ld a, [hl]
	cp 254
	ret nc
	ld b, a
	ld e, a
	ld hl, $4364
	add de
	ld a, [hl]
	ld e, a
	ld hl, $A848
	add de
	ld a, [hl]
	bit 7, a
	ret nz
	ld e, b
	ld hl, $6591
	add de
	ld a, [hl]
	ld [$FF81], a
	ret

UnknownData_3C364:
INCBIN "baserom.gb", $3C364, $3C38C - $3C364


UnknownCall_3C38C:
	ei
	ld a, [$A840]
	cp 20
	call z, UnknownCall_3C2AC
	ld a, [$A840]
	cp 53
	call z, UnknownCall_3C2B8
	ld a, [$A840]
	cp 50
	call z, UnknownCall_3C2E7
	ld a, [$A840]
	cp 106
	call z, UnknownCall_3C2FE
	ld a, [$A840]
	cp 23
	call z, UnknownCall_3C2A0
	ld a, [$A840]
	cp 75
	call z, UnknownCall_3C2A6
	ld a, [$A840]
	cp 44
	call z, UnknownCall_3C2A6
	ld a, [$A840]
	cp 74
	call z, UnknownCall_3C2AC
	ld a, [$A840]
	cp 47
	call z, UnknownCall_3C2AC
	ld a, [$A840]
	cp 49
	call z, UnknownCall_3C2A6
	ld a, [$A840]
	cp 56
	call z, UnknownCall_3C2A6
	ld a, [$A840]
	cp 46
	call z, UnknownCall_3C2AC
	ld a, [$A840]
	cp 107
	call z, UnknownCall_3C2AC
	ld a, [$A840]
	cp 71
	call z, UnknownCall_3C2AC
	ld a, [$A840]
	cp 101
	call z, UnknownCall_3C2A0
	ld a, [$A840]
	cp 69
	call z, UnknownCall_3C2A0
	ld a, [$A840]
	cp 39
	call z, UnknownCall_3C2A0
	ld a, [$A840]
	cp 103
	call z, UnknownCall_3C2B2
	ld a, [$A840]
	cp 91
	call z, UnknownCall_3C2B2
	ld a, [$A840]
	cp 90
	call z, UnknownCall_3C2AC
	ld a, [$A840]
	cp 104
	call z, UnknownCall_3C29A
	ld a, [$A840]
	cp 37
	call z, UnknownCall_3C29A
	ld a, [$A840]
	cp 108
	call z, UnknownCall_3C29A
	ld a, [$A840]
	cp 67
	call z, UnknownCall_3C29A
	ld a, [$A840]
	cp 121
	call z, UnknownCall_3C29A
	ld a, [$A840]
	cp 105
	call z, UnknownCall_3C2A6
	ld a, [$A840]
	cp 115
	call z, UnknownCall_3C2A0
	ld a, [$A840]
	cp 114
	call z, UnknownCall_3C29A
	ld a, [$A840]
	cp 63
	call z, UnknownCall_3C29A
	ld a, [$A840]
	cp 116
	call z, UnknownCall_3C2A0
	ld a, [$A840]
	cp 117
	call z, UnknownCall_3C29A
	ld a, [$A840]
	cp 17
	call z, UnknownCall_3C2B2
	ld a, [$A840]
	cp 2
	call z, UnknownCall_3C2B2
	ld a, [$A840]
	cp 12
	call z, UnknownCall_3C2B2
	ld a, [$A840]
	cp 11
	call z, UnknownCall_3C2B2
	ld a, [$A840]
	cp 9
	call z, UnknownCall_3C2B2
	ld a, [$A840]
	cp 6
	call z, UnknownCall_3C2B2
	ld a, [$A840]
	cp 100
	call z, UnknownCall_3C29A
	ld a, [$A840]
	cp 30
	call nc, UnknownCall_3C32D
	ld a, [$A840]
	or a
	jp z, UnknownJump_3C316

UnknownJump_3C4CC:
	ld a, [$A690]
	or a
	jp nz, UnknownJump_3C7EC
	call UnknownCall_3E1D7
	or a
	jp z, UnknownJump_3C5DA
	ld a, [$A840]
	cp 12
	jr z, UnknownRJump_3C4E7
	cp 30
	jr z, UnknownRJump_3C4E7
	jr UnknownRJump_3C505

UnknownRJump_3C4E7:
	ld a, [$FF81]
	and $F6
	jr nz, UnknownRJump_3C505
	ld a, [$FF81]
	and $09
	jr z, UnknownRJump_3C505
	ld a, 1
	ld [$A789], a
	ld a, 25
	ld [$A468], a
	ld bc, $5BF6
	jp UnknownJump_3C588

UnknownRJump_3C505:
	ld a, [$A68B]
	or a
	jr nz, UnknownRJump_3C52B
	ld a, [$FF80]
	bit 4, a
	jp nz, UnknownJump_3C5B2
	ld a, [$A7A0]
	or a
	jr z, UnknownRJump_3C52B
	ld a, [$A840]
	ld [$A840], a
	call UnknownCall_3EEA4
	call UnknownCall_3ED4C
	call UnknownCall_3F156
	call UnknownCall_3EA9A

UnknownRJump_3C52B:
	xor a
	ld [$A7A0], a
	ld a, [$FF81]
	and $F0
	jp z, UnknownJump_3C5DA
	ld a, [$FF81]
	and $F0
	swap a
	ld d, a
	ld a, [$A840]
	ld hl, $563A
	ld b, 0
	sla a
	rl b
	sla a
	rl b
	sla a
	rl b
	ld c, a
	add bc
	ld bc, $0000
	bit 4, d
	jr z, UnknownRJump_3C560
	ld c, 2
	jr UnknownRJump_3C56E

UnknownRJump_3C560:
	bit 4, d
	jr z, UnknownRJump_3C568
	ld c, 4
	jr UnknownRJump_3C56E

UnknownRJump_3C568:
	bit 6, d
	jr z, UnknownRJump_3C56E
	ld c, 6

UnknownRJump_3C56E:
	add bc
	ld a, 24
	call UnknownCall_3E7B
	ei
	ld c, a
	inc hl
	ld a, 24
	call UnknownCall_3E7B
	ei
	ld b, a
	ld a, b
	xor $FF
	ld d, a
	ld a, c
	xor $FF
	or d
	jr z, UnknownRJump_3C5DA

UnknownJump_3C588:
	ld hl, $A692
	ld [hl], c
	inc hl
	ld [hl], b
	ld a, 24
	call UnknownCall_3E8F
	ei
	ld d, a
	ld [$A844], a
	ld a, 255
	ld [$A690], a
	ld a, 9
	ld [$A694], a
	ld a, d
	and $F0
	cp 16
	jp nz, UnknownJump_3C7EC
	ld a, 5
	ld [$A694], a
	jp UnknownJump_3C7EC

UnknownJump_3C5B2:
	ld a, 255
	ld [$A7A0], a
	ld a, [$FF80]
	bit 4, a
	call nz, UnknownCall_3CA37
	ld a, [$FF80]
	bit 5, a
	call nz, UnknownCall_3CA63
	ld a, [$FF80]
	bit 6, a
	call nz, UnknownCall_3CA8A
	ld a, [$FF80]
	bit 7, a
	call nz, UnknownCall_3CAB1
	jp UnknownJump_3C9F4

UnknownJump_3C5DA:
UnknownRJump_3C5DA:
	ld a, [$A840]
	cp 21
	call z, UnknownCall_3C2B2
	ld a, [$A840]
	cp 13
	jr nz, UnknownRJump_3C5F4
	call UnknownCall_3C2B2
	ld a, [$A789]
	or a
	jr z, UnknownRJump_3C5F4
	jr UnknownRJump_3C60B

UnknownRJump_3C5F4:
	ld a, [$FF81]
	and $09
	jp z, UnknownJump_3C66C
	ld a, [$A68B]
	or a
	jp z, UnknownJump_3C60B
	cp 8
	jp z, UnknownJump_3C60B
	jp UnknownJump_3C66C

UnknownJump_3C60B:
UnknownRJump_3C60B:
	ld a, [$A840]
	cp 2
	jp z, UnknownJump_3D0D7
	cp 25
	jp z, UnknownJump_3D0D7
	cp 9
	jp z, UnknownJump_3D1E0
	cp 28
	jp z, UnknownJump_3D1E0
	cp 6
	jp z, UnknownJump_3D33A
	cp 27
	jp z, UnknownJump_3D33A
	cp 18
	jp z, UnknownJump_3D477
	cp 13
	jp z, UnknownJump_3D5EC
	cp 103
	jp z, UnknownJump_3D5D0
	cp 11
	jp z, UnknownJump_3D760
	cp 29
	jp z, UnknownJump_3D760
	cp 21
	jp z, UnknownJump_3D848
	cp 110
	jp z, UnknownJump_3F45E
	cp 111
	jp z, UnknownJump_3F427
	cp 112
	jp z, UnknownJump_3F3F0
	cp 113
	jp z, UnknownJump_3F3B9
	cp 17
	jr nz, UnknownRJump_3C66C
	ld a, [$A68B]
	or a
	jp nz, UnknownJump_3C66C
	jp UnknownJump_3D6C3

UnknownJump_3C66C:
UnknownRJump_3C66C:
	ld a, [$A68B]
	or a
	jp z, UnknownJump_3C7D9
	ld a, [$A840]
	cp 35
	jp z, UnknownJump_3C6B0
	cp 40
	jp z, UnknownJump_3C6CA
	cp 45
	jp z, UnknownJump_3C6E4
	cp 48
	jp z, UnknownJump_3C6F6
	cp 50
	jp z, UnknownJump_3C708
	cp 64
	jp z, UnknownJump_3C731
	cp 70
	jp z, UnknownJump_3C743
	cp 74
	jp z, UnknownJump_3C75D
	cp 80
	jp z, UnknownJump_3C76F
	cp 92
	jp z, UnknownJump_3C789
	cp 116
	jp z, UnknownJump_3C7A3
	jp UnknownJump_3C7D9

UnknownJump_3C6B0:
	ld a, [$FF81]
	cp 128
	jp nz, UnknownJump_3C7D9
	ld a, 8
	call UnknownCall_3E2F7

UnknownJump_3C6BD:
	ld a, 25
	call UnknownCall_3C7CA
	ld a, 8
	ld [$A844], a
	jp UnknownJump_3C7BD

UnknownJump_3C6CA:
	ld a, [$FF81]
	cp 128
	jp nz, UnknownJump_3C7D9
	ld a, 8
	call UnknownCall_3E2F7

UnknownJump_3C6D7:
	ld a, 28
	call UnknownCall_3C7CA
	ld a, 8
	ld [$A844], a
	jp UnknownJump_3C7BD

UnknownJump_3C6E4:
	ld a, 8
	call UnknownCall_3E2F7
	ld a, 121
	call UnknownCall_3C7CA
	ld a, 8
	ld [$A844], a
	jp UnknownJump_3C7BD

UnknownJump_3C6F6:
	ld a, 4
	call UnknownCall_3E2F7
	ld a, 122
	call UnknownCall_3C7CA
	ld a, 8
	ld [$A844], a
	jp UnknownJump_3C7BD

UnknownJump_3C708:
	ld a, [$FF81]
	cp 32
	jp nz, UnknownJump_3C7D9
	ld a, 34
	ld [$A844], a
	ld a, 255
	ld [$A690], a
	ld a, 2
	call UnknownCall_3E2F7
	ld a, 0
	ld [$A690], a

UnknownJump_3C724:
	ld a, 27
	call UnknownCall_3C7CA
	ld a, 34
	ld [$A844], a
	jp UnknownJump_3C7BD

UnknownJump_3C731:
	ld a, 2
	call UnknownCall_3E2F7

UnknownJump_3C736:
	ld a, 26
	call UnknownCall_3C7CA
	ld a, 2
	ld [$A844], a
	jp UnknownJump_3C7BD

UnknownJump_3C743:
	ld a, [$FF81]
	cp 64
	jp nz, UnknownJump_3C7D9
	ld a, 4
	call UnknownCall_3E2F7

UnknownJump_3C750:
	ld a, 30
	call UnknownCall_3C7CA
	ld a, 4
	ld [$A844], a
	jp UnknownJump_3C7BD

UnknownJump_3C75D:
	ld a, 4
	call UnknownCall_3E2F7
	ld a, 101
	call UnknownCall_3C7CA
	ld a, 4
	ld [$A844], a
	jp UnknownJump_3C7BD

UnknownJump_3C76F:
	ld a, [$FF81]
	cp 32
	jp nz, UnknownJump_3C7D9
	ld a, 2
	call UnknownCall_3E2F7

UnknownJump_3C77C:
	ld a, 29
	call UnknownCall_3C7CA
	ld a, 2
	ld [$A844], a
	jp UnknownJump_3C7BD

UnknownJump_3C789:
	ld a, [$FF81]
	and $90
	jp z, UnknownJump_3C7D9
	ld a, 1
	call UnknownCall_3E2F7
	ld a, 100
	call UnknownCall_3C7CA
	ld a, 1
	ld [$A844], a
	jp UnknownJump_3C7BD

UnknownJump_3C7A3:
	ld a, [$FF81]
	cp 32
	jp nz, UnknownJump_3C7D9
	ld a, 2
	call UnknownCall_3E2F7
	ld a, 23
	call UnknownCall_3C7CA
	ld a, 2
	ld [$A844], a
	jp UnknownJump_3C7BD

UnknownJump_3C7BD:
	call UnknownCall_3F156
	ld a, 12
	ld [$FF9B], a
	call UnknownCall_3EA9A
	ei
	ret

UnknownCall_3C7CA:
	ld [$A840], a
	call UnknownCall_3EEA4
	call UnknownCall_3ED4C
	ld a, 0
	ld [$A68B], a
	ret

UnknownJump_3C7D9:
	xor a
	ld [$A690], a
	ld a, 8
	ld [$A694], a
	ld a, [$A68C]
	inc a
	ld [$A68C], a
	jp UnknownJump_3C8F4

UnknownJump_3C7EC:
	ld a, [$A878]
	rrca
	ld [$A878], a
	jr nc, UnknownRJump_3C7F8
	jp UnknownJump_3C901

UnknownRJump_3C7F8:
	ld a, [$A694]
	dec a
	ld [$A694], a
	jr nz, UnknownRJump_3C83C
	ld a, 8
	ld [$A694], a
	ld hl, $A692
	ld c, [hl]
	inc hl
	ld b, [hl]
	inc bc
	ld [hl], b
	dec hl
	ld [hl], c
	ld a, 24
	call UnknownCall_3E8F
	ei
	or a
	jr nz, UnknownRJump_3C82D
	xor a
	ld [$A690], a
	inc bc
	ld a, 24
	call UnknownCall_3E8F
	ei
	ld [$A840], a
	ld [$A840], a
	jp UnknownJump_3C901

UnknownRJump_3C82D:
	ld [$A844], a
	ld a, [$A844]
	bit 4, a
	jr z, UnknownRJump_3C83C
	ld a, 4
	ld [$A694], a

UnknownRJump_3C83C:
	ld a, [$A68C]
	inc a
	ld [$A68C], a
	ld a, [$A844]
	and $0F
	jp z, UnknownJump_3C8F4
	ld a, [$A844]
	bit 4, a
	jr z, UnknownRJump_3C872
	ld a, [$A68C]
	and $0C
	rrca
	rrca
	add 8
	ld [$A695], a
	ld a, [$A843]
	cp 8
	ccf
	sbc 0
	ld [$A843], a
	ld a, [$A68B]
	or a
	call z, UnknownCall_3CA84
	jr UnknownRJump_3C893

UnknownRJump_3C872:
	bit 6, a
	jr z, UnknownRJump_3C893
	ld a, [$A68C]
	and $0C
	rrca
	rrca
	add 12
	ld [$A695], a
	ld a, [$A843]
	cp 138
	adc 0
	ld [$A843], a
	ld a, [$A68B]
	or a
	call z, UnknownCall_3CAAB

UnknownRJump_3C893:
	ld a, [$A844]
	bit 0, a
	jr z, UnknownRJump_3C8C1
	ld a, [$A68C]
	and $0C
	cp 12
	jr nz, UnknownRJump_3C8A7
	xor a
	ld [$A68C], a

UnknownRJump_3C8A7:
	rrca
	rrca
	add 4
	ld [$A695], a
	ld a, [$A842]
	cp 148
	adc 0
	ld [$A842], a
	ld a, [$A68B]
	or a
	call z, UnknownCall_3CA31
	jr UnknownRJump_3C901

UnknownRJump_3C8C1:
	bit 4, a
	jr z, UnknownRJump_3C8EB
	ld a, [$A68C]
	and $0C
	cp 12
	jr nz, UnknownRJump_3C8D2
	xor a
	ld [$A68C], a

UnknownRJump_3C8D2:
	rrca
	rrca
	ld [$A695], a
	ld a, [$A842]
	cp 8
	ccf
	sbc 0
	ld [$A842], a
	ld a, [$A68B]
	or a
	call z, UnknownCall_3CA5D
	jr UnknownRJump_3C901

UnknownRJump_3C8EB:
	ld a, [$A844]
	and $0F
	jr nz, UnknownRJump_3C901

UnknownData_3C8F2:
INCBIN "baserom.gb", $3C8F2, $3C8F4 - $3C8F2


UnknownJump_3C8F4:
	ld a, [$A68C]
	and $18
	rrca
	rrca
	rrca
	add 12
	ld [$A695], a

UnknownJump_3C901:
UnknownRJump_3C901:
UnknownCall_3C901:
	ld a, [$A695]
	add a
	ld d, 0
	ld e, a
	ld hl, $4AD7
	add de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [$A844]
	and $F0
	swap a
	cp 8
	jr nz, UnknownRJump_3C92A
	ld de, $4B77
	ld a, [$A68C]
	and $08
	ld l, a
	ld h, 0
	add de
	ld d, h
	ld e, l
	jr UnknownRJump_3C990

UnknownRJump_3C92A:
	bit 4, a
	jr z, UnknownRJump_3C933
	ld de, $4B87
	jr UnknownRJump_3C990

UnknownRJump_3C933:
	cp 10
	jr z, UnknownRJump_3C990
	and $02
	jr z, UnknownRJump_3C990
	ld a, [$A690]
	or a
	jr z, UnknownRJump_3C971
	ld a, [$A844]
	bit 4, a
	jr z, UnknownRJump_3C959
	ld de, $4B8F
	ld a, [$A68C]
	and $0C
	rlca
	ld l, a
	ld h, 0
	add de
	ld d, h
	ld e, l
	jr UnknownRJump_3C990

UnknownRJump_3C959:
	ld a, [$A844]
	bit 0, a
	jr z, UnknownRJump_3C971
	ld de, $4BAF
	ld a, [$A68C]
	and $0C
	rlca
	ld l, a
	ld h, 0
	add de
	ld d, h
	ld e, l
	jr UnknownRJump_3C990

UnknownRJump_3C971:
	ld a, [$A68C]
	and $18
	rrca
	rrca
	rrca
	ld l, a
	ld h, 0
	ld bc, $498C
	add bc
	ld a, [hl]
	ld h, 0
	ld l, a
	ld de, $4BCF
	add de
	ld d, h
	ld e, l
	jr UnknownRJump_3C990

UnknownData_3C98C:
INCBIN "baserom.gb", $3C98C, $3C990 - $3C98C


UnknownRJump_3C990:
	ld hl, $A102
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a
	inc de
	ld l, 6
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a
	inc de
	ld l, 10
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a
	inc de
	ld l, 14
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a
	call UnknownCall_3C9B5
	ei
	ret

UnknownCall_3C9B5:
	ld bc, $0000
	ld a, [$A844]
	and $0F
	jr z, UnknownRJump_3C9CA
	ld a, [$A844]
	bit 5, a
	jr z, UnknownRJump_3C9CA
	ld b, 4
	ld c, 8

UnknownRJump_3C9CA:
	ld a, [$A842]
	add b
	ld d, a
	ld a, [$A843]
	add c
	ld e, a
	ld hl, $A100
	ld [hl], e
	inc hl
	ld [hl], d
	ld l, 4
	ld a, d
	add 8
	ld [hl], e
	inc hl
	ld [hl], a
	ld l, 8
	ld a, e
	add 8
	ld [hli], a
	ld [hl], d
	ld l, 12
	ld a, e
	add 8
	ld [hli], a
	ld a, d
	add 8
	ld [hl], a
	ret

UnknownJump_3C9F4:
	ld a, [$FF97]
	swap a
	and $01
	jr nz, UnknownRJump_3CA02
	ld bc, $4A11
	jr UnknownRJump_3CA05

UnknownRJump_3CA02:
	ld bc, $4A21

UnknownRJump_3CA05:
	ld hl, $A100
	ld d, 16

UnknownRJump_3CA0A:
	ld a, [bc]
	ld [hli], a
	inc bc
	dec d
	jr nz, UnknownRJump_3CA0A
	ret

UnknownData_3CA11:
INCBIN "baserom.gb", $3CA11, $3CA31 - $3CA11


UnknownCall_3CA31:
	ld a, [$A842]
	cp 76
	ret nz

UnknownCall_3CA37:
	ld hl, $FFB9
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	or a
	jr z, UnknownRJump_3CA45
	ld a, e
	cp 96
	ret nc

UnknownRJump_3CA45:
	inc de
	ld a, d
	ld [hld], a
	ld [hl], e
	ld a, [$A2B1]
	inc a
	ld [$A2B1], a
	ld a, [$A7A0]
	or a
	ret nz
	ld a, [$A842]
	dec a
	ld [$A842], a
	ret

UnknownCall_3CA5D:
	ld a, [$A842]
	cp 74
	ret nz

UnknownCall_3CA63:
	ld hl, $FFB9
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	or e
	ret z
	dec de
	ld a, d
	ld [hld], a
	ld [hl], e
	ld a, [$A2B1]
	dec a
	ld [$A2B1], a
	ld a, [$A7A0]
	or a
	ret nz
	ld a, [$A842]
	inc a
	ld [$A842], a
	ret

UnknownCall_3CA84:
	ld a, [$A843]
	cp 75
	ret nz

UnknownCall_3CA8A:
	ld hl, $FFB7
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	or e
	ret z
	dec de
	ld a, d
	ld [hld], a
	ld [hl], e
	ld a, [$A2B0]
	dec a
	ld [$A2B0], a
	ld a, [$A7A0]
	or a
	ret nz
	ld a, [$A843]
	inc a
	ld [$A843], a
	ret

UnknownCall_3CAAB:
	ld a, [$A843]
	cp 77
	ret nz

UnknownCall_3CAB1:
	ld hl, $FFB7
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	or a
	jr z, UnknownRJump_3CABF
	ld a, e
	cp 112
	ret nc

UnknownRJump_3CABF:
	inc de
	ld a, d
	ld [hld], a
	ld [hl], e
	ld a, [$A2B0]
	inc a
	ld [$A2B0], a
	ld a, [$A7A0]
	or a
	ret nz
	ld a, [$A843]
	dec a
	ld [$A843], a
	ret

UnknownData_3CAD7:
INCBIN "baserom.gb", $3CAD7, $3CBE7 - $3CAD7


UnknownCall_3CBE7:
	xor a
	ld [$A781], a
	ld hl, $A6B5
	ld c, 72
	ld de, $4BFD

UnknownRJump_3CBF3:
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, UnknownRJump_3CBF3
	call UnknownCall_3CFC8
	ret

UnknownData_3CBFD:
INCBIN "baserom.gb", $3CBFD, $3CE43 - $3CBFD


UnknownCall_3CE43:
	ld hl, $4E37
	ld de, $A6C8
	ld b, 6

UnknownRJump_3CE4B:
	push bc
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	push hl
	ld h, b
	ld l, c
	ld a, [hl]
	bit 7, a
	jr z, UnknownRJump_3CE5C
	ld a, 2
	jr UnknownRJump_3CE5E

UnknownRJump_3CE5C:
	ld a, 255

UnknownRJump_3CE5E:
	ld h, d
	ld l, e
	ld [hl], a
	inc de
	inc de
	inc de
	inc de
	pop hl
	pop bc
	dec b
	jr nz, UnknownRJump_3CE4B
	ret

UnknownCall_3CE6B:
	ld a, [$A69A]
	and $07
	jr nz, UnknownRJump_3CE93
	ld a, [$A780]
	inc a
	cp 3
	jr c, UnknownRJump_3CE7B
	xor a

UnknownRJump_3CE7B:
	ld [$A780], a
	add 2
	ld hl, $A6C8
	ld de, $0004
	ld b, 6
	ld c, a

UnknownRJump_3CE89:
	ld a, [hl]
	cp 255
	jr z, UnknownRJump_3CE8F
	ld [hl], c

UnknownRJump_3CE8F:
	add de
	dec b
	jr nz, UnknownRJump_3CE89

UnknownRJump_3CE93:
	ld a, [$A69A]
	and $03
	jr nz, UnknownRJump_3CEB7
	ld hl, $A6BA
	ld de, $0004
	ld a, [$A781]
	inc a
	ld [$A781], a
	bit 6, a
	jr z, UnknownRJump_3CEB2
	inc [hl]
	add de
	inc [hl]
	add de
	inc [hl]
	jr UnknownRJump_3CEB7

UnknownRJump_3CEB2:
	dec [hl]
	add de
	dec [hl]
	add de
	dec [hl]

UnknownRJump_3CEB7:
	ld a, [$A69A]
	and $03
	jr nz, UnknownRJump_3CF16
	ld a, [$A7A9]
	or a
	jr z, UnknownRJump_3CF09

UnknownRJump_3CEC4:
	ld a, 255
	ld [$A6F8], a
	ld [$A6FC], a
	ld a, [$A7A9]
	dec a
	ld [$A7A9], a
	bit 0, a
	jr z, UnknownRJump_3CF16
	ld a, 10
	ld [$A6F8], a
	ld [$A6FC], a
	ld a, [$FF00+$04]
	and $0E
	ld d, 0
	ld e, a
	ld hl, $4FA8
	add de
	ld a, [hli]
	ld [$A6F6], a
	ld a, [hl]
	ld [$A6F7], a
	ld a, [$FF00+$04]
	and $E0
	swap a
	ld d, 0
	ld e, a
	ld hl, $4FB8
	add de
	ld a, [hli]
	ld [$A6FA], a
	ld a, [hl]
	ld [$A6FB], a
	jr UnknownRJump_3CF16

UnknownRJump_3CF09:
	ld a, [$FF00+$04]
	and $72
	jr nz, UnknownRJump_3CF16
	ld a, 4
	ld [$A7A9], a
	jr UnknownRJump_3CEC4

UnknownRJump_3CF16:
	ld a, [$A789]
	or a
	ret z
	inc a
	ld [$A789], a
	ld d, a
	ld c, 0
	cp 16
	jr c, UnknownRJump_3CF2E
	sub 2
	and $18
	rlca
	swap a
	ld c, a

UnknownRJump_3CF2E:
	ld a, d
	cp 88
	jr c, UnknownRJump_3CF3A
	ld hl, $A6F0
	ld a, 5
	ld [hl], a
	ret

UnknownRJump_3CF3A:
	cp 44
	jr nc, UnknownRJump_3CF48
	ld a, [$A6EE]
	dec a
	ld [$A6EE], a
	ld e, a
	jr UnknownRJump_3CF52

UnknownRJump_3CF48:
	ld a, [$A6EE]
	inc a
	ld [$A6EE], a
	ld e, a
	ld c, 0

UnknownRJump_3CF52:
	ld hl, $A6F0
	ld a, c
	add 5
	ld [hl], a
	ld a, 255
	ld [$A6E0], a
	ld [$A6E4], a
	ld [$A6E8], a
	ld [$A6EC], a
	ld [$A6F4], a
	ld a, e
	sub 88
	srl a
	srl a
	srl a
	and $07
	ld e, a
	cp 6
	jr nc, UnknownRJump_3CF80
	ld a, 11
	ld [$A6E0], a
	ld a, e

UnknownRJump_3CF80:
	cp 5
	jr nc, UnknownRJump_3CF8A
	ld a, 11
	ld [$A6E4], a
	ld a, e

UnknownRJump_3CF8A:
	cp 4
	jr nc, UnknownRJump_3CF94
	ld a, 11
	ld [$A6E8], a
	ld a, e

UnknownRJump_3CF94:
	cp 3
	jr nc, UnknownRJump_3CF9E
	ld a, 11
	ld [$A6EC], a
	ld a, e

UnknownRJump_3CF9E:
	cp 2
	jr nc, UnknownRJump_3CFA7
	ld a, 11
	ld [$A6F4], a

UnknownRJump_3CFA7:
	ret

UnknownData_3CFA8:
INCBIN "baserom.gb", $3CFA8, $3CFC8 - $3CFA8


UnknownCall_3CFC8:
	call UnknownCall_3CE6B
	xor a
	ld hl, $A134
	ld d, 108

UnknownRJump_3CFD1:
	ld [hli], a
	dec d
	jr nz, UnknownRJump_3CFD1
	ld a, 13
	ld [$A6B3], a
	ld hl, $A6B5
	ld a, 18

UnknownRJump_3CFDF:
	push af
	push hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	cp 255
	jr z, UnknownRJump_3CFF7
	dec hl
	dec hl
	dec hl
	call UnknownCall_3D044
	ld e, a
	ld a, [$A6B4]
	or a
	call z, UnknownCall_3D001

UnknownRJump_3CFF7:
	pop hl
	ld bc, $0004
	add bc
	pop af
	dec a
	jr nz, UnknownRJump_3CFDF
	ret

UnknownCall_3D001:
	ld hl, $4C4D
	sla e
	ld d, 0
	add de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [$A6B3]
	cp 40
	ret nc
	add a
	add a
	ld de, $A100
	add e
	ld e, a
	ld a, d
	adc 0
	ld d, a

UnknownRJump_3D01D:
	ld a, [$A6B3]
	cp 40
	ret nc
	ld a, [hli]
	add c
	ld [de], a
	inc de
	ld a, [hli]
	add b
	ld [de], a
	inc de
	ld a, [hli]
	cp 255
	jr z, UnknownRJump_3D03E
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [$A6B3]
	inc a
	ld [$A6B3], a
	jr UnknownRJump_3D01D

UnknownRJump_3D03E:
	dec de
	xor a
	ld [de], a
	dec de
	ld [de], a
	ret

UnknownCall_3D044:
	ld a, [hli]
	ld d, a
	and $F0
	swap a
	or $06
	ld b, a
	ld a, [hli]
	ld c, a
	ld a, d
	and $0F
	or $06
	ld d, a
	ld a, [hli]
	ld e, a
	push hl
	xor a
	ld [$A6B4], a
	push de
	ld a, [$A680]
	ld l, a
	ld a, [$A681]
	or $06
	ld h, a
	push hl
	ld de, $FFD0
	add de
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
	jr c, UnknownRJump_3D079
	ld a, 255
	ld [$A6B4], a

UnknownRJump_3D079:
	pop hl
	ld de, $00D0
	add de
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
	jr nc, UnknownRJump_3D08B
	ld a, 255
	ld [$A6B4], a

UnknownRJump_3D08B:
	pop de
	push bc
	ld a, [$A682]
	ld l, a
	ld a, [$A683]
	or $06
	ld h, a
	push hl
	ld bc, $FFC8
	add bc
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	jr c, UnknownRJump_3D0A9
	ld a, 255
	ld [$A6B4], a

UnknownRJump_3D0A9:
	pop hl
	ld bc, $00C8
	add bc
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	jr nc, UnknownRJump_3D0BB
	ld a, 255
	ld [$A6B4], a

UnknownRJump_3D0BB:
	pop bc
	ld a, [$A6B4]
	or a
	jr nz, UnknownRJump_3D0D4
	ld a, [$A680]
	ld b, a
	ld a, c
	sub b
	add 8
	ld b, a
	ld a, [$A682]
	ld d, a
	ld a, e
	sub d
	add 16
	ld c, a

UnknownRJump_3D0D4:
	pop hl
	ld a, [hl]
	ret

UnknownJump_3D0D7:
	ld a, 48
	ld [$A842], a
	ld a, 158
	ld [$A843], a
	ld a, 35
	ld [$A840], a
	ld a, 255
	ld [$A224], a
	call UnknownCall_3E9FB
	ld a, 255
	ld [$A468], a
	call UnknownCall_2AAA
	call UnknownCall_3D0FF
	ld a, 4
	call UnknownCall_3E3BA
	ret

UnknownCall_3D0FF:
	call UnknownCall_0348
	ld a, 13
	ld bc, $0200
	ld hl, $4000
	ld de, $8000
	call UnknownCall_2BFB
	ld a, 14
	ld bc, $1600
	ld hl, $5A00
	ld de, $8200
	call UnknownCall_2BFB
	ld a, 14
	ld bc, $0400
	ld hl, $7240
	ld de, $9800
	call UnknownCall_2BFB
	ld a, 0
	ld [$A2B1], a
	ld [$A2B0], a
	ld [$A690], a
	ld a, 2
	ld [$A68B], a
	call UnknownCall_3E46
	ld de, $65BA
	call UnknownCall_3E2A2
	ld a, [$A84D]
	bit 7, a
	jr z, UnknownRJump_3D151
	ld a, 255
	ld [$A6B7], a

UnknownRJump_3D151:
	ld hl, $A849
	ld de, $A6C3
	ld b, 5
	call UnknownCall_3DB00
	call UnknownCall_3E277
	call UnknownCall_3D1C9
	call UnknownCall_3D18E
	call UnknownCall_3D1B5
	ld a, 195
	ld [$FF40], a
	xor a
	ld [$FF81], a
	ld [$A69A], a
	ld [$A6B0], a
	ld [$A6B1], a
	ld [$A7BE], a
	ld [$A7BF], a
	ld a, 16
	ld [$A783], a
	ld a, 16
	ld [$A468], a
	call UnknownCall_2AAA
	ret

UnknownCall_3D18E:
	ld a, [$A2B4]
	or a
	ret z
	ld a, [$A224]
	or a
	ret nz
	ld a, [$A84A]
	and $01
	jr nz, UnknownRJump_3D1A4
	ld a, 106
	ld [$A6D2], a

UnknownRJump_3D1A4:
	ld a, 37
	ld [$A840], a
	call UnknownCall_3EEA4
	ld a, [$A84A]
	set 0, a
	ld [$A84A], a
	ret

UnknownCall_3D1B5:
	ld a, [$A840]
	cp 38
	ret nz
	ld a, 39
	ld [$A840], a
	call UnknownCall_3EEA4
	ld a, 255
	ld [$A224], a
	ret

UnknownCall_3D1C9:
	ld a, [$A84A]
	and $01
	ret z
	ld a, 109
	ld [$A6D2], a
	ld a, [$A86C]
	bit 7, a
	ret z
	ld a, 124
	ld [$A6D2], a
	ret

UnknownJump_3D1E0:
	ld a, 83
	ld [$A842], a
	ld a, 137
	ld [$A843], a
	ld a, 40
	ld [$A840], a
	ld a, 255
	ld [$A224], a
	ld a, 255
	ld [$A468], a
	call UnknownCall_2AAA
	call UnknownCall_3E9FB
	call UnknownCall_3D208
	ld a, 4
	call UnknownCall_3E3BA
	ret

UnknownCall_3D208:
	call UnknownCall_0348
	ld a, 13
	ld bc, $0200
	ld hl, $4000
	ld de, $8000
	call UnknownCall_2BFB
	ld a, 14
	ld bc, $1600
	ld hl, $4200
	ld de, $8200
	call UnknownCall_2BFB
	ld a, 14
	ld bc, $0400
	ld hl, $7000
	ld de, $9800
	call UnknownCall_2BFB
	ld a, 0
	ld [$A2B1], a
	ld [$A2B0], a
	ld [$A690], a
	ld a, 1
	ld [$A68B], a
	call UnknownCall_3E46
	ld de, $65DE
	call UnknownCall_3E2A2
	ld a, [$A851]
	bit 7, a
	jr z, UnknownRJump_3D25A
	ld a, 255
	ld [$A6BD], a

UnknownRJump_3D25A:
	call UnknownCall_3D2FC
	call UnknownCall_3D324
	call UnknownCall_3D29F
	ld hl, $A84E
	ld de, $A6C0
	ld b, 4
	call UnknownCall_3DB00
	call UnknownCall_3E277
	xor a
	ld [$A6A8], a
	ld [$A6A7], a
	ld [$A6AD], a
	ld [$A6AC], a
	ld [$A6A6], a
	ld [$A6A5], a
	ld [$A7BE], a
	ld [$A7BF], a
	ld a, 195
	ld [$FF40], a
	xor a
	ld [$FF81], a
	ld [$A69A], a
	ld a, 30
	ld [$A468], a
	call UnknownCall_2AAA
	ret

UnknownCall_3D29F:
	xor a
	ld [$A7BA], a
	ld a, [$A2B4]
	or a
	ret z
	ld a, [$A224]
	or a
	ret nz
	ld a, [$A840]
	cp 44
	jr nz, UnknownRJump_3D2D5
	ld a, 31
	ld [$A7D2], a
	call UnknownCall_3F8E
	ld a, 44
	ld [$A840], a
	call UnknownCall_3EEA4
	ld a, [$A84F]
	bit 0, a
	ret nz
	set 0, a
	ld [$A84F], a
	ld a, 255
	ld [$A7BA], a
	ret

UnknownRJump_3D2D5:
	ld a, [$A840]
	cp 47
	ret nz
	ld a, 39
	ld [$A7D5], a
	call UnknownCall_3F8E
	ld a, 47
	ld [$A840], a
	call UnknownCall_3EEA4
	ld a, [$A850]
	bit 0, a
	ret nz
	set 0, a
	ld [$A850], a
	ld a, 255
	ld [$A7BA], a
	ret

UnknownCall_3D2FC:
	ld a, [$A84F]
	and $01
	ret z
	ld a, 31

UnknownRJump_3D304:
	ld [$A7D2], a
	push af
	call UnknownCall_3F8E
	pop af
	inc a
	cp 39
	jr nz, UnknownRJump_3D304
	ld a, [$A86E]
	bit 7, a
	ret z
	ld hl, $4500
	ld de, $8800
	ld bc, $0220
	call UnknownCall_3FA4
	ret

UnknownCall_3D324:
	ld a, [$A850]
	and $01
	ret z
	ld a, 39

UnknownRJump_3D32C:
	ld [$A7D2], a
	push af
	call UnknownCall_3F8E
	pop af
	inc a
	cp 47
	jr nz, UnknownRJump_3D32C
	ret

UnknownJump_3D33A:
	ld a, 226
	ld [$A842], a
	ld a, 118
	ld [$A843], a
	ld a, 33
	ld [$A844], a
	ld a, 50
	ld [$A840], a
	ld a, 255
	ld [$A224], a
	call UnknownCall_3E9FB
	ld a, 255
	ld [$A468], a
	call UnknownCall_2AAA
	call UnknownCall_3D371
	ld a, 255
	ld [$A690], a
	ld a, 1
	call UnknownCall_3E3BA
	ld a, 0
	ld [$A690], a
	ret

UnknownCall_3D371:
	call UnknownCall_0348
	ld a, 13
	ld bc, $0200
	ld hl, $4000
	ld de, $8000
	call UnknownCall_2BFB
	ld a, 13
	ld bc, $1600
	ld hl, $5A00
	ld de, $8200
	call UnknownCall_2BFB
	ld a, 14
	ld bc, $0400
	ld hl, $76C0
	ld de, $9800
	call UnknownCall_2BFB
	ld a, 0
	ld [$A2B1], a
	ld [$A2B0], a
	ld [$A690], a
	ld a, 33
	ld [$A844], a
	ld a, 3
	ld [$A68B], a
	call UnknownCall_3E46
	ld de, $662C
	call UnknownCall_3E2A2
	call UnknownCall_3D45D
	call UnknownCall_3D409
	call UnknownCall_3D43D
	ld a, [$A844]
	or $20
	ld [$A844], a
	ld a, 0
	ld [$A690], a
	ld hl, $A853
	ld de, $A6C3
	ld b, 4
	call UnknownCall_3DB00
	ld hl, $A86B
	ld de, $A6B7
	ld b, 1
	call UnknownCall_3DB00
	call UnknownCall_3E277
	ld a, 195
	ld [$FF40], a
	xor a
	ld [$FF81], a
	ld [$A69A], a
	ld [$A6B0], a
	ld [$A6B1], a
	ld [$A783], a
	ld a, 5
	ld [$A468], a
	call UnknownCall_2AAA
	ret

UnknownCall_3D409:
	ld a, [$A840]
	cp 50
	ret nz
	ld a, [$A2B4]
	or a
	ret z
	ld a, [$A224]
	or a
	ret nz
	ld a, 16
	ld [$A7D2], a
	ld a, 107
	ld [$A840], a
	call UnknownCall_3EEA4
	ld a, [$A853]
	bit 0, a
	jr z, UnknownRJump_3D432

UnknownData_3D42D:
INCBIN "baserom.gb", $3D42D, $3D432 - $3D42D


UnknownRJump_3D432:
	set 0, a
	ld [$A853], a
	ld a, 255
	ld [$A7BA], a
	ret

UnknownCall_3D43D:
	ld a, [$A840]
	cp 106
	ret nz
	ld a, [$A224]
	or a
	jr nz, UnknownRJump_3D45C
	ld a, 108
	ld [$A840], a
	call UnknownCall_3EEA4
	ld hl, $A86B
	set 7, [hl]
	ld a, 255
	ld [$A224], a
	ret

UnknownRJump_3D45C:
	ret

UnknownCall_3D45D:
	xor a
	ld [$A7BA], a
	ld a, [$A853]
	and $01
	ret z
	ld a, 16

UnknownRJump_3D469:
	ld [$A7D2], a
	push af
	call UnknownCall_3F8E
	pop af
	inc a
	cp 31
	jr nz, UnknownRJump_3D469
	ret

UnknownJump_3D477:
UnknownData_3D477:
INCBIN "baserom.gb", $3D477, $3D49F - $3D477


UnknownCall_3D49F:
	call UnknownCall_0348
	ld a, 13
	ld bc, $0200
	ld hl, $4000
	ld de, $8000
	call UnknownCall_2BFB
	ld a, 16
	ld bc, $1600
	ld hl, $4200
	ld de, $8200
	call UnknownCall_2BFB
	ld a, 14
	ld bc, $0240
	ld hl, $7480
	ld de, $9800
	call UnknownCall_2BFB
	ld hl, $9B00
	ld a, 126
	ld c, 255

UnknownRJump_3D4D3:
	ld [hli], a
	dec c
	jr nz, UnknownRJump_3D4D3
	ld a, 0
	ld [$A2B1], a
	ld [$A2B0], a
	ld [$A690], a
	ld a, 4
	ld [$A68B], a
	call UnknownCall_3E46
	ld de, $65FF
	call UnknownCall_3E2A2
	call UnknownCall_3D58D
	call UnknownCall_3D533
	call UnknownCall_3D56B
	ld hl, $A858
	ld de, $A6C3
	ld b, 2
	call UnknownCall_3DB00
	ld hl, $A871
	ld de, $A6D5
	ld b, 1
	call UnknownCall_3DB00
	call UnknownCall_3E277
	ld a, 195
	ld [$FF40], a
	xor a
	ld [$FF81], a
	ld [$A69A], a
	ld [$A6B0], a
	ld [$A6B1], a
	ld [$A783], a
	ld [$A7BD], a
	ld a, 28
	ld [$A468], a
	call UnknownCall_2AAA
	ret

UnknownCall_3D533:
	ld a, [$A2B4]
	or a
	ret z
	ld a, [$A224]
	or a
	ret nz
	ld a, 47
	ld [$A7D2], a
	ld a, 67
	ld [$A840], a
	call UnknownCall_3EEA4
	ld a, [$A858]
	bit 0, a
	jr nz, UnknownRJump_3D562
	ld e, a
	ld a, 1
	ld [$A7BB], a
	ld a, 60
	ld [$A7BC], a
	ld a, 117
	ld [$A6D2], a
	ld a, e

UnknownRJump_3D562:
	set 0, a
	ld [$A858], a
	call UnknownCall_3F8E
	ret

UnknownCall_3D56B:
	ld a, [$A840]
	cp 68
	ret nz
	ld a, 69
	ld [$A840], a
	call UnknownCall_3EEA4
	ld a, 255
	ld [$A224], a
	ld a, [$A871]
	bit 7, a
	ret z
	ld a, 57
	ld [$A7D2], a
	call UnknownCall_3F8E
	ret

UnknownCall_3D58D:
	ld a, 0
	ld [$A7BB], a
	ld a, [$A858]
	and $01
	ret z
	ld a, 56
	ld [$A7D2], a
	call UnknownCall_3F8E
	ld a, 51
	ld [$A7D2], a
	ld a, 52
	ld [$A7D5], a
	call UnknownCall_3F8E
	ld a, 112
	ld [$A6CC], a
	ld a, 3
	ld [$A7BB], a
	ld a, 0
	ld [$A7BC], a
	ld a, 123
	ld [$A6D2], a
	ld a, [$A871]
	bit 7, a
	ret z
	ld a, 57
	ld [$A7D2], a
	call UnknownCall_3F8E
	ret

UnknownJump_3D5D0:
	ld a, [$A844]
	and $0F
	ld [$A844], a
	ld a, 146
	ld [$A842], a
	ld a, 234
	ld [$A843], a
	ld a, 75
	ld [$A840], a
	ld [$A840], a
	jr UnknownRJump_3D606

UnknownJump_3D5EC:
	ld a, [$A844]
	and $0F
	ld [$A844], a
	ld a, 75
	ld [$A842], a
	ld a, 242
	ld [$A843], a
	ld a, 70
	ld [$A840], a
	ld [$A840], a

UnknownRJump_3D606:
	ld a, 255
	ld [$A224], a
	call UnknownCall_3E9FB
	ld a, 255
	ld [$A468], a
	call UnknownCall_2AAA
	call UnknownCall_3D61F
	ld a, 8
	call UnknownCall_3E3BA
	ret

UnknownCall_3D61F:
	call UnknownCall_0348
	ld a, 13
	ld bc, $0200
	ld hl, $4000
	ld de, $8000
	call UnknownCall_2BFB
	ld a, 14
	ld bc, $1600
	ld hl, $5A00
	ld de, $8200
	call UnknownCall_2BFB
	ld a, 14
	ld bc, $0400
	ld hl, $7900
	ld de, $9800
	call UnknownCall_2BFB
	ld a, 0
	ld [$A2B1], a
	ld [$A2B0], a
	ld [$A690], a
	ld a, 5
	ld [$A68B], a
	call UnknownCall_3E46
	ld de, $6680
	call UnknownCall_3E2A2
	call UnknownCall_3D6B7
	call UnknownCall_3D69C
	ld hl, $A85D
	ld de, $A6C3
	ld b, 3
	call UnknownCall_3DB00
	call UnknownCall_3E277
	ld a, 195
	ld [$FF40], a
	xor a
	ld [$FF81], a
	ld [$A69A], a
	ld [$A6B0], a
	ld [$A6B1], a
	ld [$A783], a
	ld a, 160
	ld [$A6A7], a
	ld a, 18
	ld [$A468], a
	call UnknownCall_2AAA
	ret

UnknownCall_3D69C:
	ld a, [$A2B4]
	or a
	ret z
	ld a, [$A224]
	or a
	ret nz
	ld a, [$A85E]
	bit 0, a
	ret nz
	set 0, a
	ld [$A85E], a
	ld a, 125
	ld [$A6D5], a
	ret

UnknownCall_3D6B7:
	ld a, [$A85E]
	and $01
	ret z
	ld a, 129
	ld [$A6D5], a
	ret

UnknownJump_3D6C3:
	ld a, 129
	ld [$A842], a
	ld a, 137
	ld [$A843], a
	ld a, 90
	ld [$A840], a
	ld a, 255
	ld [$A224], a
	ld a, 255
	ld [$A468], a
	call UnknownCall_2AAA
	call UnknownCall_3E9FB
	call UnknownCall_3D6EB
	ld a, 2
	call UnknownCall_3E3BA
	ret

UnknownCall_3D6EB:
	call UnknownCall_0348
	ld a, 13
	ld bc, $0200
	ld hl, $4000
	ld de, $8000
	call UnknownCall_2BFB
	ld a, 17
	ld bc, $1600
	ld hl, $5A00
	ld de, $8200
	call UnknownCall_2BFB
	ld a, 14
	ld bc, $0400
	ld hl, $7D80
	ld de, $9800
	call UnknownCall_2BFB
	ld a, 0
	ld [$A2B1], a
	ld [$A2B0], a
	ld [$A690], a
	ld a, 7
	ld [$A68B], a
	call UnknownCall_3E46
	ld a, 225
	ld [$A27E], a
	ld a, 57
	ld [$A280], a
	ld de, $66AA
	call UnknownCall_3E2A2
	ld a, 195
	ld [$FF40], a
	xor a
	ld [$FF81], a
	ld [$A69A], a
	ld [$A79E], a
	ld [$A79D], a
	ld a, 1
	ld [$A79F], a
	ld a, 23
	ld [$A78B], a
	ld a, 14
	ld [$A468], a
	call UnknownCall_2AAA
	ret

UnknownJump_3D760:
	ld a, 12
	ld [$A842], a
	ld a, 112
	ld [$A843], a
	ld a, 80
	ld [$A840], a
	ld [$A840], a
	ld a, 255
	ld [$A224], a
	call UnknownCall_3E9FB
	ld a, 255
	ld [$A468], a
	call UnknownCall_2AAA
	call UnknownCall_3D79A
	ld a, [$A862]
	and $80
	swap a
	ld b, a
	rlca
	or b
	add 56
	ld [$A6C4], a
	ld a, 1
	call UnknownCall_3E3BA
	ret

UnknownCall_3D79A:
	call UnknownCall_0348
	ld a, 13
	ld bc, $0200
	ld hl, $4000
	ld de, $8000
	call UnknownCall_2BFB
	ld a, 17
	ld bc, $1600
	ld hl, $4200
	ld de, $8200
	call UnknownCall_2BFB
	ld a, 14
	ld bc, $0400
	ld hl, $7B40
	ld de, $9800
	call UnknownCall_2BFB
	ld a, 0
	ld [$A2B1], a
	ld [$A2B0], a
	ld [$A690], a
	ld a, 6
	ld [$A68B], a
	call UnknownCall_3E46
	ld de, $664D
	call UnknownCall_3E2A2
	ld a, 74
	ld [$A6C4], a
	ld a, [$A865]
	and $80
	swap a
	sla a
	add 76
	ld [$A6BB], a
	ld a, [$A865]
	and $80
	rlca
	ld b, a
	rlca
	or b
	add 16
	ld [$A6BC], a
	ld a, [$A863]
	and $80
	rlca
	rlca
	add 6
	ld [$A7D8], a
	ld a, [$A864]
	and $80
	rlca
	rlca
	add 9
	ld [$A7DB], a
	call UnknownCall_3F8E
	ld hl, $A862
	ld de, $A6CC
	ld b, 4
	call UnknownCall_3DB00
	call UnknownCall_3E277
	ld a, 195
	ld [$FF40], a
	xor a
	ld [$FF81], a
	ld [$A69A], a
	ld [$A6B0], a
	ld [$A6B1], a
	ld [$A783], a
	ld a, 27
	ld [$A468], a
	call UnknownCall_2AAA
	ret

UnknownJump_3D848:
	ld a, 255
	ld [$A468], a
	call UnknownCall_2AAA
	call UnknownCall_3E9FB
	call UnknownCall_3D880
	ld a, [$A844]
	and $0F
	ld [$A844], a
	ld a, 212
	ld [$A842], a
	ld a, 131
	ld [$A843], a
	ld a, 114
	ld [$A840], a
	ld [$A840], a
	ld a, 255
	ld [$A224], a
	ld a, 0
	ld [$A27E], a
	ld a, 1
	call UnknownCall_3E3BA
	ret

UnknownCall_3D880:
	call UnknownCall_0348
	ld a, 13
	ld bc, $0200
	ld hl, $4000
	ld de, $8000
	call UnknownCall_2BFB
	ld a, 14
	ld bc, $1600
	ld hl, $4200
	ld de, $8200
	call UnknownCall_2BFB
	ld a, 16
	ld bc, $0400
	ld hl, $7000
	ld de, $9800
	call UnknownCall_2BFB
	ld a, 0
	ld [$A2B1], a
	ld [$A2B0], a
	ld [$A690], a
	ld a, 8
	ld [$A68B], a
	call UnknownCall_3E46
	ld de, $66BC
	call UnknownCall_3E2A2
	ld a, 195
	ld [$FF40], a
	xor a
	ld [$FF81], a
	ld [$A69A], a
	ld [$A7AA], a
	ld a, 13
	ld [$A468], a
	call UnknownCall_2AAA
	call UnknownCall_3EEA4
	ld a, 228
	ld [$A27E], a
	ret

UnknownCall_3D8E6:
	ld a, [$A699]
	inc a
	ld [$A699], a
	and $38
	rlca
	swap a
	ld d, 0
	ld e, a
	ld hl, $5A21
	add de
	ld a, [hl]
	ld [$A6B7], a
	ld a, [$A699]
	and $0C
	rrca
	rrca
	ld e, a
	ld d, 0
	ld hl, $5A29
	add de
	ld a, [hl]
	ld [$A6BA], a
	ld a, [$A6B9]
	ld b, a
	ld a, [$A69A]
	ld c, a
	and $07
	jr nz, UnknownRJump_3D927
	bit 5, c
	jr nz, UnknownRJump_3D922
	inc b
	jr UnknownRJump_3D923

UnknownRJump_3D922:
	dec b

UnknownRJump_3D923:
	ld a, b
	ld [$A6B9], a

UnknownRJump_3D927:
	ld a, [$A697]
	and $01
	jr z, UnknownRJump_3D96F
	ld a, [$A6BC]
	ld b, a
	ld a, [$A6A2]
	inc a
	cp 80
	jr c, UnknownRJump_3D93B
	xor a

UnknownRJump_3D93B:
	ld [$A6A2], a
	ld hl, $6227
	ld d, 0
	ld e, a
	add de
	ld a, [hl]
	ld [$A6A5], a
	ld d, a
	and $07
	bit 6, d
	jr nz, UnknownRJump_3D953
	add b
	jr UnknownRJump_3D956

UnknownRJump_3D953:
	ld c, a
	ld a, b
	sub c

UnknownRJump_3D956:
	ld [$A6BC], a
	ld a, [$A6BB]
	ld b, a
	ld a, d
	swap a
	and $07
	bit 7, d
	jr nz, UnknownRJump_3D969
	add b
	jr UnknownRJump_3D96C

UnknownRJump_3D969:
	ld c, a
	ld a, b
	sub c

UnknownRJump_3D96C:
	ld [$A6BB], a

UnknownRJump_3D96F:
	ld a, [$A6A2]
	and $78
	rrca
	rrca
	rrca
	ld hl, $5A16
	ld d, 0
	ld e, a
	add de
	ld a, [hl]
	add 22
	ld e, a
	ld a, [$A6A5]
	bit 7, a
	jr nz, UnknownRJump_3D98D
	ld a, e
	add 3
	ld e, a

UnknownRJump_3D98D:
	ld a, e
	ld [$A6BD], a
	ld a, [$A851]
	bit 7, a
	jr z, UnknownRJump_3D99D
	ld a, 255
	ld [$A6BD], a

UnknownRJump_3D99D:
	ld a, [$A69A]
	and $07
	jr nz, UnknownRJump_3DA12
	ld a, [$A7BA]
	or a
	jr z, UnknownRJump_3DA12
	ld a, [$A840]
	cp 44
	jr nz, UnknownRJump_3D9DE
	ld a, [$A86E]
	bit 7, a
	jr nz, UnknownRJump_3D9DE
	ld a, [$A7D2]
	cp 39
	jr nc, UnknownRJump_3D9DE
	inc a
	cp 39
	jr c, UnknownRJump_3D9D3
	ld a, 21
	ld [$A460], a
	ld a, 255
	ld [$A7D2], a
	call UnknownCall_3F8E
	jr UnknownRJump_3D9DE

UnknownRJump_3D9D3:
	ld [$A7D2], a
	call UnknownCall_3F8E
	ld a, 6
	ld [$A460], a

UnknownRJump_3D9DE:
	ld a, [$A840]
	cp 47
	jr nz, UnknownRJump_3DA12
	ld a, [$A86F]
	bit 7, a
	jr nz, UnknownRJump_3DA12
	ld a, [$A7D5]
	cp 47
	jr nc, UnknownRJump_3DA12
	inc a
	cp 47
	jr c, UnknownRJump_3DA07
	ld a, 21
	ld [$A460], a
	ld a, 255
	ld [$A7D5], a
	call UnknownCall_3F8E
	jr UnknownRJump_3DA12

UnknownRJump_3DA07:
	ld [$A7D5], a
	call UnknownCall_3F8E
	ld a, 6
	ld [$A460], a

UnknownRJump_3DA12:
	call UnknownCall_3E277
	ret

UnknownData_3DA16:
INCBIN "baserom.gb", $3DA16, $3DA2D - $3DA16


UnknownCall_3DA2D:
	ld a, [$A784]
	inc a
	ld [$A784], a
	cp 10
	jr c, UnknownRJump_3DA66
	xor a
	ld [$A784], a
	ld a, [$A783]
	inc a
	ld [$A783], a
	ld d, a
	and $03
	ld e, a
	ld a, d
	and $10
	swap a
	rlca
	rlca
	or e
	add 87
	ld [$A6BD], a
	bit 4, d
	jr nz, UnknownRJump_3DA60
	ld hl, $A6BB
	inc [hl]
	inc hl
	dec [hl]
	jr UnknownRJump_3DA66

UnknownRJump_3DA60:
	ld hl, $A6BB
	dec [hl]
	inc hl
	inc [hl]

UnknownRJump_3DA66:
	ld a, [$A697]
	and $02
	srl a
	add 4
	ld [$A6BA], a
	ld a, [$A697]
	and $01
	jr z, UnknownRJump_3DAB7
	ld a, [$A6B9]
	ld b, a
	ld a, [$A6B0]
	inc a
	cp 80
	jr c, UnknownRJump_3DA86
	xor a

UnknownRJump_3DA86:
	ld [$A6B0], a
	ld hl, $6227
	ld d, 0
	ld e, a
	add de
	ld a, [hl]
	ld d, a
	and $07
	bit 6, d
	jr nz, UnknownRJump_3DA9B
	add b
	jr UnknownRJump_3DA9E

UnknownRJump_3DA9B:
	ld c, a
	ld a, b
	sub c

UnknownRJump_3DA9E:
	ld [$A6B9], a
	ld a, [$A6B8]
	ld b, a
	ld a, d
	swap a
	and $07
	bit 7, d
	jr nz, UnknownRJump_3DAB1
	add b
	jr UnknownRJump_3DAB4

UnknownRJump_3DAB1:
	ld c, a
	ld a, b
	sub c

UnknownRJump_3DAB4:
	ld [$A6B8], a

UnknownRJump_3DAB7:
	ld a, [$A696]
	and $30
	swap a
	ld [$A6B7], a
	ld a, [$A84D]
	bit 7, a
	jr z, UnknownRJump_3DACD
	ld a, 255
	ld [$A6B7], a

UnknownRJump_3DACD:
	call UnknownCall_3DADF
	ld hl, $A849
	ld de, $A6C3
	ld b, 5
	call UnknownCall_3DB00
	call UnknownCall_3E277
	ret

UnknownCall_3DADF:
	ld a, [$A69A]
	and $0F
	ret nz
	ld a, [$A6D2]
	cp 109
	ret nc
	inc a
	ld [$A6D2], a
	ld a, 6
	ld [$A460], a
	ld a, [$A6D2]
	cp 109
	ret c
	ld a, 21
	ld [$A460], a
	ret

UnknownRJump_3DB00:
UnknownCall_3DB00:
	ld a, [hli]
	bit 7, a
	jr z, UnknownRJump_3DB09
	ld a, 14
	jr UnknownRJump_3DB0B

UnknownRJump_3DB09:
	ld a, 255

UnknownRJump_3DB0B:
	ld [de], a
	inc de
	inc de
	inc de
	dec b
	jr nz, UnknownRJump_3DB00

UnknownCall_3DB12:
	ld a, [$A7BA]
	or a
	ret z
	ld a, [$A69A]
	and $07
	ret nz
	ld a, [$A7D2]
	cp 31
	ret nc
	inc a
	cp 31
	jr c, UnknownRJump_3DB34
	ld a, 21
	ld [$A460], a
	ld a, 255
	ld [$A7D2], a
	jr UnknownRJump_3DB3C

UnknownRJump_3DB34:
	ld [$A7D2], a
	ld a, 6
	ld [$A460], a

UnknownRJump_3DB3C:
	call UnknownCall_3F8E
	ret

UnknownCall_3DB40:
	ld a, [$A69A]
	and $03
	jr nz, UnknownRJump_3DB7A
	ld a, [$A7BD]
	or a
	jr nz, UnknownRJump_3DB68
	push bc
	ld a, [$FF00+$04]
	ld b, a
	swap a
	add b
	ld b, a
	ld a, [$A7B7]
	add b
	ld b, a
	ld a, [$FF97]
	add b
	ld [$A7B7], a
	pop bc
	and $07
	jr nz, UnknownRJump_3DB7A
	ld a, 5

UnknownRJump_3DB68:
	dec a
	ld [$A7BD], a
	dec a
	and $03
	ld hl, $5D58
	ld d, 0
	ld e, a
	add de
	ld a, [hl]
	ld [$A6B7], a

UnknownRJump_3DB7A:
	ld a, [$A69A]
	and $18
	srl a
	srl a
	srl a
	ld hl, $5D5C
	ld d, 0
	ld e, a
	add de
	ld a, [hl]
	ld [$A6C9], a
	ld a, [$A6C7]
	dec a
	ld [$A6C7], a
	ld a, [$A69A]
	and $03
	jr nz, UnknownRJump_3DBAD
	ld a, [$A6C8]
	inc a
	ld [$A6C8], a
	or a
	jr nz, UnknownRJump_3DBAD
	ld a, [$FF00+$04]
	ld [$A6C7], a

UnknownRJump_3DBAD:
	ld a, [$A69A]
	ld d, a
	and $07
	jp nz, UnknownJump_3DC3D
	ld a, d
	and $18
	srl a
	srl a
	srl a
	ld hl, $5D60
	ld d, 0
	ld e, a
	add de
	ld a, [hl]
	ld [$A6BA], a
	ld a, e
	or a
	jr nz, UnknownRJump_3DBE1
	ld a, [$FF00+$04]
	and $1E
	ld d, 0
	ld e, a
	ld hl, $5D6C
	add de
	ld a, [hli]
	ld [$A6B8], a
	ld a, [hl]
	ld [$A6B9], a

UnknownRJump_3DBE1:
	ld a, [$A69A]
	and $18
	srl a
	srl a
	srl a
	ld hl, $5D64
	ld d, 0
	ld e, a
	add de
	ld a, [hl]
	ld [$A6BD], a
	ld a, e
	cp 1
	jr nz, UnknownRJump_3DC0F
	ld a, [$FF00+$04]
	and $1E
	ld d, 0
	ld e, a
	ld hl, $5D6C
	add de
	ld a, [hli]
	ld [$A6BB], a
	ld a, [hl]
	ld [$A6BC], a

UnknownRJump_3DC0F:
	ld a, [$A69A]
	and $18
	srl a
	srl a
	srl a
	ld hl, $5D68
	ld d, 0
	ld e, a
	add de
	ld a, [hl]
	ld [$A6C0], a
	ld a, e
	cp 2
	jr nz, UnknownRJump_3DC3D
	ld a, [$FF00+$04]
	and $1E
	ld d, 0
	ld e, a
	ld hl, $5D6C
	add de
	ld a, [hli]
	ld [$A6BE], a
	ld a, [hl]
	ld [$A6BF], a

UnknownJump_3DC3D:
UnknownRJump_3DC3D:
	call UnknownCall_3DC62
	call UnknownCall_3E277
	ld a, [$A6D2]
	cp 123
	ret nc
	ld a, [$A69A]
	and $07
	ret nz
	ld a, [$A6D2]
	inc a
	cp 124
	jr c, UnknownRJump_3DC59

UnknownData_3DC57:
INCBIN "baserom.gb", $3DC57, $3DC59 - $3DC57


UnknownRJump_3DC59:
	ld [$A6D2], a
	ld a, 6
	ld [$A460], a
	ret

UnknownCall_3DC62:
	ld a, [$A7BB]
	or a
	jr nz, UnknownRJump_3DC71
	ld a, 255
	ld [$A6CC], a
	ld [$A6CF], a
	ret

UnknownRJump_3DC71:
	cp 1
	jr nz, UnknownRJump_3DCC4
	ld a, [$A69A]
	and $01
	ret z
	ld a, 111
	ld [$A6CC], a
	ld a, [$A69A]
	and $0C
	rrca
	rrca
	add 113
	ld [$A6CF], a
	ld a, [$A6CA]
	add 3
	ld [$A6CA], a
	ld [$A6CD], a
	ld a, [$A6CB]
	sub 3
	ld [$A6CB], a
	ld [$A6CE], a
	ld a, [$A7BC]
	dec a
	ld [$A7BC], a
	ret nz
	ld a, 2
	ld [$A7BB], a
	ld a, 168
	ld [$A6CA], a
	ld a, 14
	ld [$A6CB], a
	ld a, 255
	ld [$A6CF], a
	ld a, 10
	ld [$A7BC], a
	ret

UnknownRJump_3DCC4:
	cp 2
	jr nz, UnknownRJump_3DD16
	ld a, [$A6CA]
	sub 2
	ld [$A6CA], a
	ld a, [$A6CB]
	add 2
	ld [$A6CB], a
	ld a, 111
	ld [$A6CC], a
	ld a, [$A7BC]
	dec a
	ld [$A7BC], a
	ret nz
	ld a, 3
	ld [$A7BB], a
	ld a, 156
	ld [$A6CA], a
	ld a, 36
	ld [$A6CB], a
	ld a, 112
	ld [$A6CC], a
	ld a, 255
	ld [$A6CF], a
	ld a, 56
	ld [$A7D2], a
	ld a, 52
	ld [$A7D5], a
	call UnknownCall_3F8E
	ld a, 20
	ld [$A7BC], a
	ld a, 24
	ld [$A460], a
	ret

UnknownRJump_3DD16:
	ld a, 140
	ld [$A6CA], a
	ld a, 36
	ld [$A6CB], a
	ld a, 255
	ld [$A6CC], a
	ld a, 255
	ld [$A6CF], a
	ld a, 0
	ld [$A2B1], a
	ld [$A2B0], a
	ld a, [$A7BC]
	or a
	ret z
	dec a
	ld [$A7BC], a
	ld a, [$A69A]
	bit 4, a
	ret z
	ld a, [$A7BC]
	srl a
	ld [$A2B1], a
	cpl
	ld [$A2B0], a
	ld a, [$A7BC]
	or a
	ret nz

UnknownData_3DD52:
INCBIN "baserom.gb", $3DD52, $3DD8C - $3DD52


UnknownCall_3DD8C:
	ld a, [$A6B5]
	ld e, a
	ld a, [$A69A]
	ld d, a
	and $07
	jr nz, UnknownRJump_3DDA0
	bit 7, d
	jr z, UnknownRJump_3DD9F
	inc e
	jr UnknownRJump_3DDA0

UnknownRJump_3DD9F:
	dec e

UnknownRJump_3DDA0:
	ld a, e
	ld [$A6B5], a
	ld a, [$A6B8]
	ld e, a
	ld a, [$A69A]
	ld d, a
	and $07
	jr nz, UnknownRJump_3DDB8
	bit 7, d
	jr z, UnknownRJump_3DDB7
	dec e
	jr UnknownRJump_3DDB8

UnknownRJump_3DDB7:
	inc e

UnknownRJump_3DDB8:
	ld a, e
	ld [$A6B8], a
	call UnknownCall_3E4EB
	call UnknownCall_3E277
	ret

UnknownCall_3DDC3:
	call UnknownCall_3F4A0
	ret

UnknownCall_3DDC7:
	call UnknownCall_3F4A0
	ret

UnknownCall_3DDCB:
	call UnknownCall_3F4A0
	ret

UnknownCall_3DDCF:
	call UnknownCall_3F4A0
	ret

UnknownCall_3DDD3:
	ld a, [$A69A]
	and $30
	swap a
	add 42
	ld [$A6BA], a
	ld [$A6BD], a
	ld [$A6C0], a
	ld a, [$A69A]
	and $30
	swap a
	add 46
	ld [$A6CC], a
	ld [$A6CF], a
	ld a, [$A69A]
	and $7C
	srl a
	srl a
	ld c, a
	ld a, 80
	sub c
	ld [$A6CE], a
	ld a, c
	and $0F
	ld c, a
	ld a, 64
	sub c
	ld [$A6CB], a
	ld a, [$A86D]
	bit 7, a
	jr nz, UnknownRJump_3DE25
	ld a, [$A69A]
	and $60
	srl a
	swap a
	add 38
	ld [$A6B7], a
	jr UnknownRJump_3DE4E

UnknownRJump_3DE25:
	ld a, [$A69A]
	and $0F
	jr nz, UnknownRJump_3DE4E
	push bc
	ld a, [$FF00+$04]
	ld b, a
	swap a
	add b
	ld b, a
	ld a, [$A7B7]
	add b
	ld b, a
	ld a, [$FF97]
	add b
	ld [$A7B7], a
	pop bc
	ld a, [$A7B7]
	and $01
	add 53
	ld [$A7D2], a
	call UnknownCall_3F8E

UnknownRJump_3DE4E:
	ld a, [$A69A]
	ld d, a
	and $02
	srl a
	and d
	ld d, a
	ld a, [$A6A8]
	bit 0, a
	jr nz, UnknownRJump_3DE7F
	ld a, [$A6A7]
	sub d
	ld c, a
	ld [$A6A7], a
	cp 192
	jr nz, UnknownRJump_3DE78
	ld a, [$A6A8]
	xor $FF
	ld [$A6A8], a
	ld a, 120
	ld [$A6D1], a

UnknownRJump_3DE78:
	ld a, 50
	ld [$A6D2], a
	jr UnknownRJump_3DE9D

UnknownRJump_3DE7F:
	ld a, [$A6A7]
	add d
	ld c, a
	ld [$A6A7], a
	cp 176
	jr nz, UnknownRJump_3DE98
	ld a, [$A6A8]
	xor $FF
	ld [$A6A8], a
	ld a, 64
	ld [$A6D1], a

UnknownRJump_3DE98:
	ld a, 51
	ld [$A6D2], a

UnknownRJump_3DE9D:
	ld a, c
	ld [$A6D0], a
	ld a, [$A69A]
	and $0F
	jr nz, UnknownRJump_3DEC3
	ld a, [$A6D5]
	cp 129
	jr nc, UnknownRJump_3DEC3
	inc a
	ld c, a
	ld [$A6D5], a
	ld a, 6
	ld [$A460], a
	ld a, c
	cp 129
	jr nz, UnknownRJump_3DEC3
	ld a, 21
	ld [$A460], a

UnknownRJump_3DEC3:
	call UnknownCall_3E277
	ret

UnknownCall_3DEC7:
	ld a, [$A69A]
	and $03
	jr nz, UnknownRJump_3DEF2
	ld a, [$A865]
	bit 7, a
	jr nz, UnknownRJump_3DEF2
	ld a, [$A864]
	bit 7, a
	jr z, UnknownRJump_3DEF2
	ld a, [$A6BB]
	cp 92
	jr nc, UnknownRJump_3DEF2
	inc a
	ld [$A6BB], a
	ld a, [$A6BC]
	cp 19
	jr nc, UnknownRJump_3DEF2
	inc a
	ld [$A6BC], a

UnknownRJump_3DEF2:
	ld a, [$A69A]
	and $01
	jr nz, UnknownRJump_3DF0B
	ld a, [$A842]
	cp 46
	jr c, UnknownRJump_3DF0B
	ld a, [$A6C4]
	cp 74
	jr nc, UnknownRJump_3DF0B
	inc a
	ld [$A6C4], a

UnknownRJump_3DF0B:
	ld a, [$A69A]
	and $70
	swap a
	ld d, 0
	ld e, a
	ld hl, $5FA0
	add de
	ld a, [hl]
	ld [$A6C9], a
	ld a, [$A69A]
	and $70
	swap a
	ld d, 0
	ld e, a
	ld hl, $5FA8
	add de
	ld a, [hl]
	ld [$A6B6], a
	ld hl, $5FB0
	add de
	ld a, [hl]
	ld [$A6B9], a
	ld hl, $5FB8
	add de
	ld a, [hl]
	ld [$A6BE], a
	ld hl, $5FC0
	add de
	ld a, [hl]
	ld [$A6C1], a
	call UnknownCall_3E277
	ld a, [$A69A]
	ld c, a
	and $0F
	ret nz
	ld a, c
	and $E0
	rrca
	swap a
	ld d, 0
	ld e, a
	ld hl, $5FC8
	add de
	ld a, [hl]
	ld [$A7D2], a
	ld hl, $5FD0
	add de
	ld a, [hl]
	ld [$A7D5], a
	ld a, [$A863]
	bit 7, a
	jr nz, UnknownRJump_3DF83
	ld a, [$A862]
	bit 7, a
	jr z, UnknownRJump_3DF83
	ld a, [$A7D8]
	cp 8
	jr nc, UnknownRJump_3DF83
	inc a
	ld [$A7D8], a

UnknownRJump_3DF83:
	ld a, [$A864]
	bit 7, a
	jr nz, UnknownRJump_3DF9C
	ld a, [$A863]
	bit 7, a
	jr z, UnknownRJump_3DF9C
	ld a, [$A7DB]
	cp 11
	jr nc, UnknownRJump_3DF9C
	inc a
	ld [$A7DB], a

UnknownRJump_3DF9C:
	call UnknownCall_3F8E
	ret

UnknownData_3DFA0:
INCBIN "baserom.gb", $3DFA0, $3DFE8 - $3DFA0


UnknownCall_3DFE8:
	ld a, [$A69A]
	and $07
	jr nz, UnknownRJump_3E003
	ld a, [$A796]
	inc a
	ld [$A796], a
	cp 3
	jr c, UnknownRJump_3DFFE
	xor a
	ld [$A796], a

UnknownRJump_3DFFE:
	add 53
	ld [$A6BA], a

UnknownRJump_3E003:
	ld a, [$A69A]
	and $03
	jr nz, UnknownRJump_3E02E
	ld a, 255
	ld [$A6BD], a
	ld a, [$FF00+$04]
	and $7E
	jr nz, UnknownRJump_3E02E
	ld a, 56
	ld [$A6BD], a
	ld a, [$A799]
	inc a
	and $03
	ld [$A799], a
	ld d, 0
	ld e, a
	ld hl, $61D3
	add de
	ld a, [hl]
	ld [$A6BB], a

UnknownRJump_3E02E:
	ld a, [$A79D]
	or a
	jr nz, UnknownRJump_3E08F
	ld a, [$A69A]
	and $03
	jr nz, UnknownRJump_3E08F
	ld a, [$A797]
	cp 1
	jr nz, UnknownRJump_3E053
	ld a, 2
	ld [$A797], a
	ld a, 225
	ld [$A27E], a
	ld a, 57
	ld [$A280], a
	jr UnknownRJump_3E08F

UnknownRJump_3E053:
	cp 2
	jr nz, UnknownRJump_3E06B
	xor a
	ld [$A797], a
	ld a, 225
	xor $FF
	ld [$A27E], a
	ld a, 57
	xor $FF
	ld [$A280], a
	jr UnknownRJump_3E08F

UnknownRJump_3E06B:
	ld a, 225
	ld [$A27E], a
	ld a, 57
	ld [$A280], a
	ld a, [$A6BD]
	cp 56
	jr nz, UnknownRJump_3E08F
	ld a, 225
	xor $FF
	ld [$A27E], a
	ld a, 57
	xor $FF
	ld [$A280], a
	ld a, 1
	ld [$A797], a

UnknownRJump_3E08F:
	ld a, [$A69A]
	and $01
	jr nz, UnknownRJump_3E0C7
	ld a, [$A798]
	inc a
	ld [$A798], a
	ld a, [$A79E]
	cp 1
	jr nz, UnknownRJump_3E0A9
	call UnknownCall_3E0CB
	jr UnknownRJump_3E0C7

UnknownRJump_3E0A9:
	cp 2
	jr nz, UnknownRJump_3E0B2
	call UnknownCall_3E0FD
	jr UnknownRJump_3E0C7

UnknownRJump_3E0B2:
	cp 3
	jr nz, UnknownRJump_3E0BB
	call UnknownCall_3E12F
	jr UnknownRJump_3E0C7

UnknownRJump_3E0BB:
	cp 4
	jr nz, UnknownRJump_3E0C4
	call UnknownCall_3E147
	jr UnknownRJump_3E0C7

UnknownRJump_3E0C4:
	call UnknownCall_3E15F

UnknownRJump_3E0C7:
	call UnknownCall_3E277
	ret

UnknownCall_3E0CB:
	ld a, [$A798]
	and $03
	ld d, 0
	ld e, a
	ld hl, $61CB
	add de
	ld a, [hl]
	add 57
	ld [$A6C0], a
	ld a, [$A6BE]
	cp 40
	jp c, UnknownJump_3E17E
	res 4, e
	sub e
	ld [$A6BE], a
	cp 64
	ret c
	cp 96
	ret nc
	ld a, [$A6BF]
	cp 80
	ret c
	ld a, 255
	ld [$A6C0], a
	ret

UnknownCall_3E0FD:
	ld a, [$A798]
	and $03
	ld d, 0
	ld e, a
	ld hl, $61CB
	add de
	ld a, [hl]
	add 60
	ld [$A6C0], a
	ld a, [$A6BE]
	cp 120
	jp nc, UnknownJump_3E17E
	res 4, e
	add e
	ld [$A6BE], a
	cp 64
	ret c
	cp 96
	ret nc
	ld a, [$A6BF]
	cp 80
	ret c

UnknownData_3E129:
INCBIN "baserom.gb", $3E129, $3E12F - $3E129


UnknownCall_3E12F:
	ld a, 63
	ld [$A6C0], a
	ld a, [$A6BF]
	cp 54
	jp c, UnknownJump_3E1B3
	sub 4
	ld [$A6BF], a
	ld a, 255
	ld [$A6C0], a
	ret

UnknownCall_3E147:
	ld a, 63
	ld [$A6C0], a
	ld a, [$A6BF]
	cp 98
	jp nc, UnknownJump_3E1B3
	add 4
	ld [$A6BF], a
	ld a, 255
	ld [$A6C0], a
	ret

UnknownCall_3E15F:
	ld a, [$A798]
	and $0C
	rrca
	rrca
	ld d, 0
	ld e, a
	ld hl, $61CF
	add de
	ld a, [hl]
	add 63
	ld [$A6C0], a
	ld a, [$A79F]
	or a
	jr z, UnknownRJump_3E17E
	dec a
	ld [$A79F], a
	ret

UnknownJump_3E17E:
UnknownRJump_3E17E:
	ld a, [$FF00+$04]
	ld e, a
	ld a, [$FF00+$05]
	add e
	and $07
	ld e, a
	ld a, [$A79E]
	ld d, a
	cp e
	jr z, UnknownRJump_3E17E
	ld a, e
	or a
	jr z, UnknownRJump_3E1A9
	cp 5
	jr c, UnknownRJump_3E199
	sub 4
	ld e, a

UnknownRJump_3E199:
	cp 3
	jr nc, UnknownRJump_3E1A4
	ld a, d
	cp 3
	jr c, UnknownRJump_3E17E

UnknownData_3E1A2:
INCBIN "baserom.gb", $3E1A2, $3E1A4 - $3E1A2


UnknownRJump_3E1A4:
	ld a, d
	cp 3
	jr nc, UnknownRJump_3E17E

UnknownRJump_3E1A9:
	ld a, e
	ld [$A79E], a
	ld a, 30
	ld [$A79F], a
	ret

UnknownJump_3E1B3:
	ld a, [$A6BE]
	cp 50
	jr c, UnknownRJump_3E1C0
	ld a, 1
	ld [$A79E], a
	ret

UnknownRJump_3E1C0:
	ld a, 2
	ld [$A79E], a
	ld a, 30
	ld [$A79F], a
	ret

UnknownData_3E1CB:
INCBIN "baserom.gb", $3E1CB, $3E1D7 - $3E1CB


UnknownCall_3E1D7:
	ld a, [$A68B]
	or a
	jr z, UnknownRJump_3E210
	ld a, [$FF80]
	and $F0
	ld e, a
	ld hl, $4218
	ld a, [$A840]
	ld b, 0
	ld c, a
	add bc
	ld a, [hl]
	cp 254
	jr z, UnknownRJump_3E210
	ld hl, $650E
	add bc
	ld a, [hl]
	ld b, 0
	ld c, a
	ld hl, $6591
	add bc
	ld a, [hl]
	and e
	jr z, UnknownRJump_3E210
	ld hl, $A848
	add bc
	ld a, [hl]
	bit 7, a
	jr z, UnknownRJump_3E20D
	jr UnknownRJump_3E210

UnknownRJump_3E20D:
	ld a, 0
	ret

UnknownRJump_3E210:
	ld a, 255
	ret

UnknownData_3E213:
INCBIN "baserom.gb", $3E213, $3E277 - $3E213


UnknownCall_3E277:
	xor a
	ld hl, $A110
	ld d, 144

UnknownRJump_3E27D:
	ld [hli], a
	dec d
	jr nz, UnknownRJump_3E27D
	ld a, 4
	ld [$A782], a
	ld hl, $A6B5
	ld a, 16

UnknownRJump_3E28B:
	push af
	push hl
	ld b, [hl]
	inc hl
	ld c, [hl]
	inc hl
	ld a, [hl]
	ld e, a
	cp 255
	call nz, UnknownCall_3F75
	pop hl
	ld bc, $0003
	add bc
	pop af
	dec a
	jr nz, UnknownRJump_3E28B
	ret

UnknownCall_3E2A2:
	xor a
	ld [$A781], a
	ld a, 255
	ld c, 48
	ld hl, $A6B7

UnknownRJump_3E2AD:
	ld [hli], a
	dec c
	jr nz, UnknownRJump_3E2AD
	ld a, 255
	ld c, 48
	ld hl, $A7D0

UnknownRJump_3E2B8:
	ld [hli], a
	dec c
	jr nz, UnknownRJump_3E2B8
	ld hl, $A6B5
	ld c, 16

UnknownRJump_3E2C1:
	ld a, [de]
	cp 255
	jr z, UnknownRJump_3E2D1
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, UnknownRJump_3E2C1

UnknownRJump_3E2D1:
	push de
	call UnknownCall_3E277
	pop de
	inc de
	inc de
	inc de
	ld hl, $A7D0
	ld c, 16

UnknownRJump_3E2DE:
	ld a, [de]
	cp 255
	jr z, UnknownRJump_3E2EE
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, UnknownRJump_3E2DE

UnknownRJump_3E2EE:
	ld a, [$A68B]
	cp 13
	call c, UnknownCall_3F8E
	ret

UnknownCall_3E2F7:
	ld [$A786], a
	ld a, 2
	ld [$A79D], a
	ld a, 40

UnknownRJump_3E301:
	push af
	call UnknownCall_3E426
	call UnknownCall_3E367
	call UnknownCall_3E9EC
	call UnknownCall_3E367
	call UnknownCall_3E9EC
	pop af
	dec a
	jr nz, UnknownRJump_3E301
	ld d, 228
	ld b, 4

UnknownRJump_3E319:
	call UnknownCall_3E9EC
	ld a, d
	ld [$A27E], a
	push de
	ld hl, $6A53
	ld d, 0
	add de
	ld a, [hl]
	ld [$A27F], a
	ld [$A280], a
	pop de
	ld b, 2

UnknownRJump_3E331:
	call UnknownCall_3E426
	call UnknownCall_3E367
	call UnknownCall_3E9EC
	call UnknownCall_3E367
	call UnknownCall_3E9EC
	dec b
	jr nz, UnknownRJump_3E331
	sla d
	sla d
	dec e
	jr nz, UnknownRJump_3E319
	ld hl, $9800
	ld bc, $0400
	ld d, 255

UnknownRJump_3E352:
	push hl
	ld hl, $FF41

UnknownRJump_3E356:
	bit 4, [hl]
	jr nz, UnknownRJump_3E356
	pop hl
	ld a, d
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, UnknownRJump_3E352
	xor a
	ld [$A79D], a
	ret

UnknownCall_3E367:
	push af
	push bc
	push de
	push hl
	call UnknownCall_3C13E
	ld a, [$A68B]
	cp 1
	jr nz, UnknownRJump_3E37A
	call UnknownCall_3D8E6
	jr UnknownRJump_3E3B5

UnknownRJump_3E37A:
	cp 2
	jr nz, UnknownRJump_3E383
	call UnknownCall_3DA2D
	jr UnknownRJump_3E3B5

UnknownRJump_3E383:
	cp 3
	jr nz, UnknownRJump_3E38C
	call UnknownCall_3DB12
	jr UnknownRJump_3E3B5

UnknownRJump_3E38C:
	cp 4
	jr nz, UnknownRJump_3E395
	call UnknownCall_3DB40
	jr UnknownRJump_3E3B5

UnknownRJump_3E395:
	cp 5
	jr nz, UnknownRJump_3E39E
	call UnknownCall_3DDD3
	jr UnknownRJump_3E3B5

UnknownRJump_3E39E:
	cp 6
	jr nz, UnknownRJump_3E3A7
	call UnknownCall_3DEC7
	jr UnknownRJump_3E3B5

UnknownRJump_3E3A7:
	cp 7
	jr nz, UnknownRJump_3E3B0
	call UnknownCall_3DFE8
	jr UnknownRJump_3E3B5

UnknownRJump_3E3B0:
	cp 8
	call z, UnknownCall_3DD8C

UnknownRJump_3E3B5:
	pop hl
	pop de
	pop bc
	pop af
	ret

UnknownCall_3E3BA:
	ld [$A786], a
	ld a, 1
	ld [$A79D], a
	ld a, 146
	ld [$A878], a
	ld d, 228
	ld a, [$A68B]
	cp 7
	jp z, UnknownJump_3E4C1
	ld b, 1

UnknownRJump_3E3D3:
	call UnknownCall_3E9EC
	ld a, [$A27E]
	srl d
	rra
	srl d
	rra
	ld [$A27E], a
	push de
	ld hl, $6A53
	ld d, 0
	add de
	ld a, [hl]
	ld [$A27F], a
	ld [$A280], a
	pop de
	ld b, 2

UnknownRJump_3E3F3:
	call UnknownCall_3E426
	call UnknownCall_3E367
	call UnknownCall_3E9EC
	call UnknownCall_3E367
	call UnknownCall_3E9EC
	dec b
	jr nz, UnknownRJump_3E3F3
	inc e
	ld a, e
	cp 5
	jr nz, UnknownRJump_3E3D3
	ld a, 40

UnknownRJump_3E40D:
	push af
	call UnknownCall_3E426
	call UnknownCall_3E367
	call UnknownCall_3E9EC
	call UnknownCall_3E367
	call UnknownCall_3E9EC
	pop af
	dec a
	jr nz, UnknownRJump_3E40D
	xor a
	ld [$A79D], a
	ret

UnknownCall_3E426:
	ld a, [$A786]
	cp 1
	jr z, UnknownRJump_3E49F
	cp 2
	jr z, UnknownRJump_3E47F
	cp 4
	jr z, UnknownRJump_3E43A
	cp 8
	jr z, UnknownRJump_3E45D

UnknownData_3E439:
INCBIN "baserom.gb", $3E439, $3E43A - $3E439


UnknownRJump_3E43A:
	push af
	push bc
	push de
	push hl
	ld a, [$A68C]
	inc a
	ld [$A68C], a
	and $0C
	rrca
	rrca
	add 8
	ld [$A695], a
	ld a, [$A843]
	dec a
	ld [$A843], a
	call UnknownCall_3C901
	pop hl
	pop de
	pop bc
	pop af
	ret

UnknownRJump_3E45D:
	push af
	push bc
	push de
	push hl
	ld a, [$A68C]
	inc a
	ld [$A68C], a
	and $06
	rrca
	add 12
	ld [$A695], a
	ld a, [$A843]
	inc a
	ld [$A843], a
	call UnknownCall_3C901
	pop hl
	pop de
	pop bc
	pop af
	ret

UnknownRJump_3E47F:
	push af
	push bc
	push de
	push hl
	ld a, [$A68C]
	inc a
	ld [$A68C], a
	and $06
	rrca
	ld [$A695], a
	ld a, [$A842]
	dec a
	ld [$A842], a
	call UnknownCall_3C901
	pop hl
	pop de
	pop bc
	pop af
	ret

UnknownRJump_3E49F:
	push af
	push bc
	push de
	push hl
	ld a, [$A68C]
	inc a
	ld [$A68C], a
	and $06
	rrca
	add 4
	ld [$A695], a
	ld a, [$A842]
	inc a
	ld [$A842], a
	call UnknownCall_3C901
	pop hl
	pop de
	pop bc
	pop af
	ret

UnknownJump_3E4C1:
	ld a, 225
	ld [$A27E], a
	ld a, 208
	ld [$A27F], a
	ld a, 57
	ld [$A280], a
	ld a, 48

UnknownRJump_3E4D2:
	push af
	call UnknownCall_3E426
	call UnknownCall_3E367
	call UnknownCall_3E9EC
	call UnknownCall_3E367
	call UnknownCall_3E9EC
	pop af
	dec a
	jr nz, UnknownRJump_3E4D2
	xor a
	ld [$A79D], a
	ret

UnknownCall_3E4EB:
	ld a, [$A262]
	ld l, a
	ld a, [$A263]
	ld h, a
	ld a, h
	and $0F
	add 96
	ld [$A6C0], a
	ld a, l
	swap a
	and $0F
	add 96
	ld [$A6C3], a
	ld a, l
	and $0F
	add 96
	ld [$A6C6], a
	ret

UnknownData_3E50E:
INCBIN "baserom.gb", $3E50E, $3E7BE - $3E50E


UnknownCall_3E7BE:
	ld hl, $88E0
	ld de, $A700
	ld c, 32
	call UnknownCall_3E7EB
	ld hl, $89E0
	ld de, $A720
	ld c, 32
	call UnknownCall_3E7EB
	ld hl, $8CE0
	ld de, $A740
	ld c, 32
	call UnknownCall_3E7EB
	ld hl, $8DE0
	ld de, $A760
	ld c, 32
	call UnknownCall_3E7EB
	ret

UnknownRJump_3E7EB:
UnknownCall_3E7EB:
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, UnknownRJump_3E7EB
	ret

UnknownCall_3E7F2:
	ld a, [$A689]
	inc a
	ld [$A689], a
	ld e, a
	and $03
	jr nz, UnknownRJump_3E823
	ld a, [$A78A]
	dec a
	ld [$A78A], a
	ld a, e
	and $04
	jr nz, UnknownRJump_3E823
	ld a, [$A78B]
	dec a
	cp 24
	jr c, UnknownRJump_3E814
	ld a, 23

UnknownRJump_3E814:
	ld [$A78B], a
	ld a, e
	and $08
	jr nz, UnknownRJump_3E823
	ld a, [$A78C]
	dec a
	ld [$A78C], a

UnknownRJump_3E823:
	ld b, 255

UnknownRJump_3E825:
	ld a, [$FF00+$44]
	cp 15
	jr nc, UnknownRJump_3E832
	ld a, [$A78A]
	ld [$FF00+$43], a
	jr UnknownRJump_3E84B

UnknownRJump_3E832:
	cp 23
	jr nc, UnknownRJump_3E83D
	ld a, [$A78B]
	ld [$FF00+$43], a
	jr UnknownRJump_3E84B

UnknownRJump_3E83D:
	cp 31
	jr nc, UnknownRJump_3E848
	ld a, [$A78C]
	ld [$FF00+$43], a
	jr UnknownRJump_3E84B

UnknownRJump_3E848:
	xor a
	ld [$FF00+$43], a

UnknownRJump_3E84B:
	nop
	nop
	nop
	nop
	dec e
	jr nz, UnknownRJump_3E825
	ret

UnknownCall_3E853:
	ld a, [$A689]
	inc a
	ld b, a
	ld [$A689], a
	and $07
	rlca
	ld e, a
	ld d, 0
	bit 0, b
	jp z, UnknownJump_3E929
	ld h, 136
	ld bc, $A700
	ld a, e
	or $F0
	ld l, a
	ld a, c
	add e
	ld c, a
	ld a, [bc]
	ld d, a
	set 4, c
	ld a, [bc]
	srl a
	rr d
	rla
	rrca
	ld [hl], a
	ld [bc], a
	res 4, c
	res 4, l
	ld a, d
	ld [hl], a
	ld [bc], a
	ld h, 137
	ld bc, $A720
	ld a, e
	or $F0
	ld l, a
	ld a, c
	add e
	ld c, a
	ld a, [bc]
	ld d, a
	set 4, c
	ld a, [bc]
	srl a
	rr d
	rla
	rrca
	ld [hl], a
	ld [bc], a
	res 4, c
	res 4, l
	ld a, d
	ld [hl], a
	ld [bc], a
	ld h, 140
	ld bc, $A740
	ld a, e
	or $F0
	ld l, a
	ld a, c
	add e
	ld c, a
	ld a, [bc]
	ld d, a
	set 4, c
	ld a, [bc]
	srl a
	rr d
	rla
	rrca
	ld [hl], a
	ld [bc], a
	res 4, c
	res 4, l
	ld a, d
	ld [hl], a
	ld [bc], a
	ld h, 141
	ld bc, $A760
	ld a, e
	or $F0
	ld l, a
	ld a, c
	add e
	ld c, a
	ld a, [bc]
	ld d, a
	set 4, c
	ld a, [bc]
	srl a
	rr d
	rla
	rrca
	ld [hl], a
	ld [bc], a
	res 4, c
	res 4, l
	ld a, d
	ld [hl], a
	ld [bc], a
	set 0, e
	ld h, 140
	ld bc, $A740
	ld a, e
	or $F0
	ld l, a
	ld a, c
	add e
	ld c, a
	ld a, [bc]
	ld d, a
	set 4, c
	ld a, [bc]
	srl a
	rr d
	rla
	rrca
	ld [hl], a
	ld [bc], a
	res 4, c
	res 4, l
	ld a, d
	ld [hl], a
	ld [bc], a
	ld h, 141
	ld bc, $A760
	ld a, e
	or $F0
	ld l, a
	ld a, c
	add e
	ld c, a
	ld a, [bc]
	ld d, a
	set 4, c
	ld a, [bc]
	srl a
	rr d
	rla
	rrca
	ld [hl], a
	ld [bc], a
	res 4, c
	res 4, l
	ld a, d
	ld [hl], a
	ld [bc], a
	ret

UnknownJump_3E929:
	ld h, 136
	ld bc, $A700
	ld a, e
	or $F0
	ld l, a
	ld a, c
	add e
	ld c, a
	ld a, [bc]
	ld d, a
	set 4, c
	ld a, [bc]
	sla a
	rl d
	rra
	rlca
	ld [hl], a
	ld [bc], a
	res 4, c
	res 4, l
	ld a, d
	ld [hl], a
	ld [bc], a
	ld h, 137
	ld bc, $A720
	ld a, e
	or $F0
	ld l, a
	ld a, c
	add e
	ld c, a
	ld a, [bc]
	ld d, a
	set 4, c
	ld a, [bc]
	sla a
	rl d
	rra
	rlca
	ld [hl], a
	ld [bc], a
	res 4, c
	res 4, l
	ld a, d
	ld [hl], a
	ld [bc], a
	ld h, 140
	ld bc, $A740
	ld a, e
	or $F0
	ld l, a
	ld a, c
	add e
	ld c, a
	ld a, [bc]
	ld d, a
	set 4, c
	ld a, [bc]
	sla a
	rl d
	rra
	rlca
	ld [hl], a
	ld [bc], a
	res 4, c
	res 4, l
	ld a, d
	ld [hl], a
	ld [bc], a
	ld h, 141
	ld bc, $A760
	ld a, e
	or $F0
	ld l, a
	ld a, c
	add e
	ld c, a
	ld a, [bc]
	ld d, a
	set 4, c
	ld a, [bc]
	sla a
	rl d
	rra
	rlca
	ld [hl], a
	ld [bc], a
	res 4, c
	res 4, l
	ld a, d
	ld [hl], a
	ld [bc], a
	set 0, e
	ld h, 140
	ld bc, $A740
	ld a, e
	or $F0
	ld l, a
	ld a, c
	add e
	ld c, a
	ld a, [bc]
	ld d, a
	set 4, c
	ld a, [bc]
	sla a
	rl d
	rra
	rlca
	ld [hl], a
	ld [bc], a
	res 4, c
	res 4, l
	ld a, d
	ld [hl], a
	ld [bc], a
	ld h, 141
	ld bc, $A760
	ld a, e
	or $F0
	ld l, a
	ld a, c
	add e
	ld c, a
	ld a, [bc]
	ld d, a
	set 4, c
	ld a, [bc]
	sla a
	rl d
	rra
	rlca
	ld [hl], a
	ld [bc], a
	res 4, c
	res 4, l
	ld a, d
	ld [hl], a
	ld [bc], a
	ret

UnknownCall_3E9EC:
	ei
	xor a
	ld [$A785], a

UnknownRJump_3E9F1:
	ld a, [$A785]
	or a
	jr z, UnknownRJump_3E9F1
	call UnknownCall_3EAD7
	ret

UnknownCall_3E9FB:
	ld d, 228
	ld b, 4

UnknownRJump_3E9FF:
	call UnknownCall_3E9EC
	call UnknownCall_3E9EC
	call UnknownCall_3E9EC
	call UnknownCall_3E9EC
	call UnknownCall_3E9EC
	call UnknownCall_3E9EC
	call UnknownCall_3E9EC
	call UnknownCall_3E9EC
	call UnknownCall_3E9EC
	call UnknownCall_3E9EC
	call UnknownCall_3E9EC
	call UnknownCall_3E9EC
	ld a, d
	ld [$A27E], a
	push de
	ld hl, $6A53
	ld d, 0
	add de
	ld a, [hl]
	ld [$A27F], a
	ld [$A280], a
	pop de
	sla d
	sla d
	dec e
	jr nz, UnknownRJump_3E9FF
	ld hl, $9800
	ld bc, $0400
	ld d, 255

UnknownRJump_3EA45:
	ld a, [$FF00+$41]
	and $03
	jr nz, UnknownRJump_3EA45
	ld a, d
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, UnknownRJump_3EA45
	ret

UnknownData_3EA53:
INCBIN "baserom.gb", $3EA53, $3EA9A - $3EA53


UnknownCall_3EA9A:
	ld a, 6
	ld [$A468], a
	ld a, 0
	ld [$A878], a
	ld d, 228
	ld b, 1

UnknownRJump_3EAA8:
	call UnknownCall_3E9EC
	call UnknownCall_3E9EC
	call UnknownCall_3E9EC
	ld a, [$A27E]
	srl d
	rra
	srl d
	rra
	ld [$A27E], a
	push de
	ld hl, $6A5A
	ld d, 0
	sla e
	add de
	ld a, [hli]
	ld [$A27F], a
	ld a, [hl]
	ld [$A280], a
	pop de
	inc e
	ld a, e
	cp 5
	jr nz, UnknownRJump_3EAA8
	ei
	ret

UnknownCall_3EAD7:
	push af
	push bc
	push de
	push hl
	di
	call UnknownCall_2AAA
	ei
	pop hl
	pop de
	pop bc
	pop af
	ret

UnknownRJump_3EAE5:
UnknownCall_3EAE5:
	ld a, 13
	call UnknownCall_3E22
	inc bc
	dec d
	jr nz, UnknownRJump_3EAE5
	ld d, 32
	ld a, c
	add d
	ld c, a
	ld a, b
	adc 0
	and $0F
	or $B0
	ld b, a
	dec e
	jr nz, UnknownRJump_3EAE5
	ret
	ld a, [$A68B]
	or a
	call z, UnknownCall_3E853
	ld a, [$A68B]
	cp 7
	call z, UnknownCall_3E7F2
	ld a, [$A68B]
	cp 13
	jr nc, UnknownRJump_3EB1A
	cp 9
	call nc, UnknownCall_3EBD5

UnknownRJump_3EB1A:
	ld a, [$A68B]
	cp 1
	call z, UnknownCall_3EC7D
	ld a, [$A68B]
	cp 2
	call z, UnknownCall_3ECF5
	ld a, [$A68B]
	cp 5
	call z, UnknownCall_3ED35
	ld a, [$A68B]
	or a
	jp nz, UnknownJump_01C5
	ld a, [$FF97]
	and $03
	cp 1
	jr nz, UnknownRJump_3EB48
	call UnknownCall_3EBAE
	jp UnknownJump_01C5

UnknownRJump_3EB48:
	cp 2
	jr nz, UnknownRJump_3EB52
	call UnknownCall_3EB94
	jp UnknownJump_01C5

UnknownRJump_3EB52:
	cp 3
	jr nz, UnknownRJump_3EB5C
	call UnknownCall_3EB7B
	jp UnknownJump_01C5

UnknownRJump_3EB5C:
	call UnknownCall_3EB62
	jp UnknownJump_01C5

UnknownCall_3EB62:
	ld hl, $A600
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld d, 20

UnknownRJump_3EB6B:
	ld a, [hli]
	ld [bc], a
	ld a, c
	inc a
	and $1F
	ld e, a
	ld a, c
	and $E0
	or e
	ld c, a
	dec d
	jr nz, UnknownRJump_3EB6B
	ret

UnknownCall_3EB7B:
	ld hl, $A620
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld d, 20

UnknownRJump_3EB84:
	ld a, [hli]
	ld [bc], a
	ld a, c
	inc a
	and $1F
	ld e, a
	ld a, c
	and $E0
	or e
	ld c, a
	dec d
	jr nz, UnknownRJump_3EB84
	ret

UnknownCall_3EB94:
	ld hl, $A640
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld d, 20
	ld b, 32

UnknownRJump_3EB9F:
	ld a, [hli]
	ld [bc], a
	ld a, c
	add e
	ld c, a
	ld a, b
	adc 0
	res 4, a
	ld b, a
	dec d
	jr nz, UnknownRJump_3EB9F
	ret

UnknownCall_3EBAE:
	ld hl, $A660
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld d, 20
	ld b, 32

UnknownRJump_3EBB9:
	ld a, [hli]
	ld [bc], a
	ld a, c
	add e
	ld c, a
	ld a, b
	adc 0
	res 4, a
	ld b, a
	dec d
	jr nz, UnknownRJump_3EBB9
	ret

UnknownCall_3EBC8:
	call UnknownCall_3EB62
	call UnknownCall_3EB7B
	call UnknownCall_3EB94
	call UnknownCall_3EBAE
	ret

UnknownCall_3EBD5:
	ld a, [$A840]
	sub 110
	ld d, a
	add a
	ld b, 0
	ld c, a
	ld hl, $6C75
	add bc
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld a, [$A7A5]
	and $7C
	srl a
	srl a
	cp 30
	jr c, UnknownRJump_3EBFD
	ld a, [$A7A5]
	and $77
	ld [$A7A5], a
	ld a, 29

UnknownRJump_3EBFD:
	ld d, 0
	ld e, a
	ld h, d
	ld l, e
	add de
	add de
	sla l
	rl h
	add bc
	ld d, 9
	ld bc, $988A

UnknownRJump_3EC0E:
	call UnknownCall_3E51
	push hl
	ld hl, $001B
	add bc
	ld b, h
	ld c, l
	pop hl
	dec d
	jr nz, UnknownRJump_3EC0E
	ld bc, $9825
	ld a, [$A262]
	ld d, a
	and $0F
	add 128
	ld [bc], a
	dec bc
	ld a, d
	swap a
	and $0F
	add 128
	ld [bc], a
	dec bc
	ld a, [$A263]
	and $0F
	add 128
	ld [bc], a
	ld bc, $9864
	ld a, [$A22C]
	ld d, a
	and $0F
	add 128
	ld [bc], a
	dec bc
	ld a, d
	swap a
	and $0F
	add 128
	ld [bc], a
	ld a, [$A7AA]
	bit 7, a
	ret z
	and $0F
	ld hl, $988C
	ld b, 0
	ld c, a
	swap c
	sla c
	rl b
	add bc
	ld a, 212
	ld [hli], a
	ld a, 213
	ld [hl], a
	ld bc, $001F
	add bc
	ld a, 216
	ld [hli], a
	ld a, 217
	ld [hl], a
	ret

UnknownData_3EC75:
INCBIN "baserom.gb", $3EC75, $3EC7D - $3EC75


UnknownCall_3EC7D:
	ld a, [$A86F]
	bit 7, a
	ret z
	ld a, [$A7BE]
	inc a
	cp 14
	jr c, UnknownRJump_3EC8C
	xor a

UnknownRJump_3EC8C:
	ld [$A7BE], a
	or a
	ret nz
	ld a, [$A7BF]
	inc a
	ld [$A7BF], a
	and $3F
	ld d, 0
	ld e, a
	ld hl, $6CB5
	add de
	ld a, [hl]
	ld b, 0
	srl a
	rr e
	srl a
	rr e
	ld d, a
	ld hl, $5300
	add de
	call UnknownCall_3EA4
	ret

UnknownData_3ECB5:
INCBIN "baserom.gb", $3ECB5, $3ECF5 - $3ECB5


UnknownCall_3ECF5:
	ld a, [$A86C]
	bit 7, a
	ret z
	ld a, [$A7BE]
	inc a
	cp 14
	jr c, UnknownRJump_3ED04
	xor a

UnknownRJump_3ED04:
	ld [$A7BE], a
	or a
	ret nz
	ld a, [$A7BF]
	inc a
	ld [$A7BF], a
	and $07
	ld d, 0
	ld e, a
	ld hl, $6D2D
	add de
	ld a, [hl]
	ld b, 0
	srl a
	rr e
	srl a
	rr e
	ld d, a
	ld hl, $5800
	add de
	call UnknownCall_3ECB
	ret

UnknownData_3ED2D:
INCBIN "baserom.gb", $3ED2D, $3ED35 - $3ED2D


UnknownCall_3ED35:
	ld a, [$A69A]
	ld e, a
	and $0F
	ret z
	ld a, e
	and $30
	sla a
	ld hl, $5C00
	ld d, 0
	ld e, a
	add de
	call UnknownCall_3EF2
	ret

UnknownCall_3ED4C:
	di
	ld hl, $A680
	ld a, [$FFB9]
	ld [hli], a
	ld a, [$FFBA]
	ld [hl], a
	ld hl, $A682
	ld a, [$FFB7]
	ld [hli], a
	ld a, [$FFB8]
	ld [hl], a
	ld a, [$A680]
	srl a
	srl a
	srl a
	ld b, a
	ld [$A600], a
	ld [$A620], a
	dec a
	and $1F
	ld [$A640], a
	ld a, b
	add 20
	and $1F
	ld [$A660], a
	ld a, [$A682]
	srl a
	srl a
	srl a
	ld b, a
	dec a
	and $1F
	ld [$A641], a
	ld [$A661], a
	ld [$A601], a
	ld a, b
	add 18
	and $1F
	ld [$A621], a
	ld hl, $A600
	call UnknownCall_3EE8C
	ld hl, $A620
	call UnknownCall_3EE8C
	ld hl, $A640
	call UnknownCall_3EE8C
	ld hl, $A660
	call UnknownCall_3EE8C
	ld a, [$A680]
	ld l, a
	ld a, [$A681]
	ld h, a
	srl h
	rr l
	srl l
	srl l
	ld h, 0
	ld a, [$A682]
	and $F8
	ld c, a
	ld a, [$A683]
	ld b, a
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	add bc
	ld d, h
	ld e, l
	ld hl, $FFC0
	add de
	ld a, h
	and $0F
	or $B0
	ld h, a
	ld b, 20
	push de
	ld de, $A602

UnknownRJump_3EDF2:
	ld a, 13
	call UnknownCall_3E34
	inc de
	ld a, l
	inc a
	and $3F
	ld c, a
	ld a, l
	and $C0
	or c
	ld l, a
	dec b
	jr nz, UnknownRJump_3EDF2
	pop de
	ld hl, $0480
	add de
	ld a, h
	and $0F
	or $B0
	ld h, a
	ld b, 20
	push de
	ld de, $A622

UnknownRJump_3EE16:
	ld a, 13
	call UnknownCall_3E34
	inc de
	ld a, l
	inc a
	and $3F
	ld c, a
	ld a, l
	and $C0
	or c
	ld l, a
	dec b
	jr nz, UnknownRJump_3EE16
	pop de
	ld hl, $FFC0
	add de
	ld a, h
	and $0F
	or $B0
	ld h, a
	ld a, l
	dec a
	and $3F
	ld b, a
	ld a, l
	and $C0
	or b
	ld l, a
	ld b, 20
	push de
	ld de, $A642

UnknownRJump_3EE44:
	ld a, 13
	call UnknownCall_3E34
	inc de
	ld a, l
	add 64
	ld l, a
	ld a, h
	adc 0
	and $0F
	or $B0
	ld h, a
	dec b
	jr nz, UnknownRJump_3EE44
	pop de
	ld hl, $FFC0
	add de
	ld a, h
	and $0F
	or $B0
	ld h, a
	ld a, l
	add 20
	and $3F
	ld b, a
	ld a, l
	and $C0
	or b
	ld l, a
	ld b, 20
	push de
	ld de, $A662

UnknownRJump_3EE75:
	ld a, 13
	call UnknownCall_3E34
	inc de
	ld a, l
	add 64
	ld l, a
	ld a, h
	adc 0
	and $0F
	or $B0
	ld h, a
	dec b
	jr nz, UnknownRJump_3EE75
	pop de
	ret

UnknownCall_3EE8C:
	ld a, [hli]
	ld b, [hl]
	ld c, 0
	srl b
	rr c
	srl b
	rr c
	srl b
	rr c
	or c
	ld c, a
	ld a, 152
	or b
	ld [hld], a
	ld [hl], c
	ret

UnknownCall_3EEA4:
	ld a, [$A840]
	ld hl, $5EE6
	ld d, 0
	sla a
	rl d
	sla a
	rl d
	sla a
	rl d
	ld e, a
	add de
	ld a, 24
	call UnknownCall_3E7B
	inc hl
	ld [$FFBA], a
	ld a, 24
	call UnknownCall_3E7B
	inc hl
	ld [$FFB9], a
	ld a, 24
	call UnknownCall_3E7B
	inc hl
	ld [$FFB8], a
	ld a, 24
	call UnknownCall_3E7B
	inc hl
	ld [$FFB7], a
	ld a, 24
	call UnknownCall_3E7B
	inc hl
	ld [$A842], a
	ld a, 24
	call UnknownCall_3E7B
	ld [$A843], a
	ret

UnknownCall_3EEF0:
	ld a, [$A840]
	ld d, 0
	ld e, a
	ld hl, $650E
	add de
	ld a, [hl]
	cp 254
	ret nc
	ld d, 0
	ld e, a
	ld hl, $A848
	add de
	ld a, [$A224]
	or a
	jr nz, UnknownRJump_3EF19
	ld a, [$A2B4]
	or a
	jr nz, UnknownRJump_3EF25
	set 7, [hl]
	res 6, [hl]
	call UnknownCall_2934
	ret

UnknownRJump_3EF19:
	ld a, [$A2A0]
	cp 255
	ret nz
	set 6, [hl]
	call UnknownCall_2934
	ret

UnknownRJump_3EF25:
	res 6, [hl]
	call UnknownCall_2934
	ret

UnknownCall_3EF2B:
	ld a, 228
	ld [$A27E], a
	ld a, 208
	ld [$A27F], a
	ld a, 57
	ld [$A280], a
	ld a, [$A24F]
	or a
	jr z, UnknownRJump_3EF56
	ld a, [$A840]
	bit 0, a
	jr nz, UnknownRJump_3EF4C
	call UnknownCall_3F4B1
	jr UnknownRJump_3EF4F

UnknownRJump_3EF4C:
	call UnknownCall_3F5A4

UnknownRJump_3EF4F:
	ld a, 12
	ld [$FF9B], a
	ei
	ret

UnknownRJump_3EF56:
	ld a, [$A2B4]
	or a
	jr z, UnknownRJump_3EFB2
	ld a, [$A224]
	or a
	jr nz, UnknownRJump_3EFB2
	ld a, [$A840]
	cp 72
	jr nz, UnknownRJump_3EF70
	ld a, 71
	ld [$A840], a
	jr UnknownRJump_3EFB2

UnknownRJump_3EF70:
	ld a, [$A840]
	cp 26
	jr z, UnknownRJump_3EF81
	cp 5
	jr z, UnknownRJump_3EF81
	cp 18
	jr z, UnknownRJump_3EF81
	jr UnknownRJump_3EF88

UnknownRJump_3EF81:
	ld a, 105
	ld [$A840], a
	jr UnknownRJump_3EFB2

UnknownRJump_3EF88:
	ld a, [$A840]
	cp 41
	jr nz, UnknownRJump_3EF96
	ld a, 44
	ld [$A840], a
	jr UnknownRJump_3EFB2

UnknownRJump_3EF96:
	ld a, [$A840]
	cp 42
	jr nz, UnknownRJump_3EFA4
	ld a, 47
	ld [$A840], a
	jr UnknownRJump_3EFB2

UnknownRJump_3EFA4:
	ld a, [$A840]
	cp 60
	jr nz, UnknownRJump_3EFB2
	ld a, 64
	ld [$A840], a
	jr UnknownRJump_3EFB2

UnknownRJump_3EFB2:
	call UnknownCall_3EEF0
	ld a, 13
	ld bc, $0200
	ld hl, $4000
	ld de, $8000
	di
	call UnknownCall_2BFB
	call UnknownCall_3EEA4
	ld a, 8
	ld [$A844], a
	xor a
	ld [$A68B], a
	ld a, [$A224]
	or a
	jr nz, UnknownRJump_3F003
	ld a, [$A840]
	ld hl, $650E
	ld d, 0
	ld e, a
	add de
	ld a, [hl]
	cp 254
	jr nc, UnknownRJump_3F003
	cp 5
	jp z, UnknownJump_3C6BD
	cp 9
	jp z, UnknownJump_3C6D7
	cp 14
	jp z, UnknownJump_3C724
	cp 17
	jp z, UnknownJump_3C736
	cp 23
	jp z, UnknownJump_3C750
	cp 29
	jp z, UnknownJump_3C77C

UnknownRJump_3F003:
	ld a, [$A840]
	cp 30
	jr nc, UnknownRJump_3F04D
	cp 5
	jr z, UnknownRJump_3F014
	cp 26
	jr z, UnknownRJump_3F014
	jr UnknownRJump_3F024

UnknownRJump_3F014:
	ld a, [$A224]
	or a
	jr nz, UnknownRJump_3F03D
	ld a, 63
	ld [$A840], a
	call UnknownCall_3EEA4
	jr UnknownRJump_3F07E

UnknownRJump_3F024:
	or a
	jr nz, UnknownRJump_3F03D
	ld a, [$A224]
	or a
	jr nz, UnknownRJump_3F03D
	ld a, [$A848]
	set 7, a
	ld [$A848], a
	ld a, 20
	ld [$A840], a
	call UnknownCall_3EEA4

UnknownJump_3F03D:
UnknownRJump_3F03D:
	call UnknownCall_3F156
	call UnknownCall_2934
	ld a, 12
	ld [$FF9B], a
	call UnknownCall_3EA9A
	ei
	ret

UnknownRJump_3F04D:
	cp 40
	jr nc, UnknownRJump_3F05C
	call UnknownCall_3D0FF
	ld a, 2
	ld [$A68B], a
	jp UnknownJump_3F147

UnknownRJump_3F05C:
	cp 50
	jr nc, UnknownRJump_3F06B

UnknownJump_3F060:
	call UnknownCall_3D208
	ld a, 1
	ld [$A68B], a
	jp UnknownJump_3F147

UnknownRJump_3F06B:
	cp 60
	jr nc, UnknownRJump_3F07A

UnknownJump_3F06F:
	call UnknownCall_3D371
	ld a, 3
	ld [$A68B], a
	jp UnknownJump_3F147

UnknownRJump_3F07A:
	cp 70
	jr nc, UnknownRJump_3F089

UnknownRJump_3F07E:
	call UnknownCall_3D49F
	ld a, 4
	ld [$A68B], a
	jp UnknownJump_3F147

UnknownRJump_3F089:
	cp 80
	jr nc, UnknownRJump_3F098
	call UnknownCall_3D61F
	ld a, 5
	ld [$A68B], a
	jp UnknownJump_3F147

UnknownRJump_3F098:
	cp 90
	jr nc, UnknownRJump_3F0A7
	call UnknownCall_3D79A
	ld a, 6
	ld [$A68B], a
	jp UnknownJump_3F147

UnknownRJump_3F0A7:
	cp 100
	jr nc, UnknownRJump_3F0C2
	cp 91
	jr nz, UnknownRJump_3F0B7
	ld a, 92
	ld [$A840], a
	call UnknownCall_3EEA4

UnknownRJump_3F0B7:
	call UnknownCall_3D6EB
	ld a, 7
	ld [$A68B], a
	jp UnknownJump_3F147

UnknownRJump_3F0C2:
	cp 110
	jr nc, UnknownRJump_3F0F6
	cp 102
	jr nz, UnknownRJump_3F0E4
	ld a, 104
	ld [$A840], a
	call UnknownCall_3EEA4
	ld a, [$A224]
	or a
	jp nz, UnknownJump_3F03D
	ld a, [$A86D]
	set 7, a
	ld [$A86D], a
	jp UnknownJump_3F03D

UnknownRJump_3F0E4:
	cp 106
	jp z, UnknownJump_3F06F
	cp 107
	jp z, UnknownJump_3F06F
	cp 108
	jp z, UnknownJump_3F06F
	jp UnknownJump_3F03D

UnknownRJump_3F0F6:
	cp 120
	jr nc, UnknownRJump_3F104
	call UnknownCall_3D880
	ld a, 8
	ld [$A68B], a
	jr UnknownRJump_3F147

UnknownRJump_3F104:
	cp 120
	jp nz, UnknownJump_3F123
	ld a, 46
	ld [$A840], a
	call UnknownCall_3EEA4
	ld a, [$A224]
	or a
	jp nz, UnknownJump_3F060
	ld a, [$A86E]
	set 7, a
	ld [$A86E], a
	jp UnknownJump_3F060

UnknownJump_3F123:
	cp 122
	jp nz, UnknownJump_3F142
	ld a, 49
	ld [$A840], a
	call UnknownCall_3EEA4
	ld a, [$A224]
	or a
	jp nz, UnknownJump_3F060
	ld a, [$A86F]
	set 7, a
	ld [$A86F], a
	jp UnknownJump_3F060

UnknownJump_3F142:
UnknownData_3F142:
INCBIN "baserom.gb", $3F142, $3F147 - $3F142


UnknownJump_3F147:
UnknownRJump_3F147:
	ld a, 146
	ld [$A878], a
	ei
	call UnknownCall_2934
	ld a, 12
	ld [$FF9B], a
	ret

UnknownCall_3F156:
	di
	xor a
	ld [$A27E], a
	call UnknownCall_0348
	ld a, 255
	ld [$A468], a
	call UnknownCall_2AAA
	di
	ld a, [$FFB7]
	ld [$A2B0], a
	ld a, [$FFB9]
	ld [$A2B1], a
	ld a, 0
	ld [$A690], a
	ld [$A789], a
	ld [$A68B], a
	ld hl, $7800
	ld bc, $B800
	ld de, $2020
	call UnknownCall_3EAE5
	ld hl, $7C00
	ld bc, $B820
	ld de, $2020
	call UnknownCall_3EAE5
	ld hl, $7000
	ld bc, $B000
	ld de, $2020
	call UnknownCall_3EAE5
	ld hl, $7400
	ld bc, $B020
	ld de, $2020
	call UnknownCall_3EAE5
	call UnknownCall_3ED4C
	call UnknownCall_3E46
	ld a, [$A840]
	cp 23
	jr z, UnknownRJump_3F1C2
	cp 24
	jr z, UnknownRJump_3F1C2
	call UnknownCall_3C901

UnknownRJump_3F1C2:
	ld a, 13
	ld bc, $1800
	ld hl, $4000
	ld de, $8000
	di
	call UnknownCall_2BFB
	call UnknownCall_3E7BE
	call UnknownCall_3F275
	call UnknownCall_3EBC8
	call UnknownCall_3F203
	ld a, 136
	ld [$FF00+$4A], a
	ld a, 80
	ld [$FF00+$4B], a
	ld a, 227
	ld [$FF40], a
	call UnknownCall_3CBE7
	call UnknownCall_3CE43
	xor a
	ld [$A7A0], a
	ld [$A7A9], a
	ld a, 0
	ld [$A878], a
	ld a, 6
	ld [$A468], a
	ei
	ret

UnknownCall_3F203:
	ld hl, $A110
	ld de, $7251
	ld c, 36

UnknownRJump_3F20B:
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, UnknownRJump_3F20B
	ld a, [$A22C]
	ld b, a
	and $F0
	swap a
	or $70
	ld [$A11A], a
	ld a, b
	and $0F
	or $70
	ld [$A11E], a
	ld a, [$A263]
	and $0F
	or $70
	ld [$A12A], a
	ld a, [$A262]
	ld b, a
	and $F0
	swap a
	or $70
	ld [$A12E], a
	ld a, b
	and $0F
	or $70
	ld [$A132], a
	ld a, 225
	ld c, 64
	ld hl, $9C00

UnknownRJump_3F24C:
	ld [hli], a
	dec c
	jr nz, UnknownRJump_3F24C
	ret

UnknownData_3F251:
INCBIN "baserom.gb", $3F251, $3F275 - $3F251


UnknownCall_3F275:
	ld a, [$A683]
	ld h, a
	ld a, [$A682]
	and $F8
	ld l, a
	sla l
	rl h
	sla l
	rl h
	sla l
	rl h
	ld a, [$A681]
	ld b, a
	ld a, [$A680]
	srl b
	rr a
	srl a
	srl a
	or l
	ld l, a
	ld a, h
	or $B0
	ld h, a
	ld a, [$A682]
	and $F8
	ld c, a
	ld b, 0
	sla c
	rl b
	sla c
	rl b
	ld a, [$A680]
	srl a
	srl a
	srl a
	or c
	ld c, a
	ld a, 152
	or b
	ld b, a
	ld d, 32

UnknownRJump_3F2C1:
	ld b, 0
	push bc

UnknownRJump_3F2C4:
	push hl
	ld a, l
	add e
	and $3F
	push af
	ld a, l
	and $C0
	ld l, a
	pop af
	or l
	ld l, a
	ld a, 13
	call UnknownCall_3E10
	pop hl
	ld a, c
	inc a
	and $1F
	push af
	ld a, c
	and $E0
	ld c, a
	pop af
	or c
	ld c, a
	inc e
	ld a, e
	cp 32
	jr nz, UnknownRJump_3F2C4
	ld bc, $0040
	add bc
	ld a, h
	and $0F
	or $B0
	ld h, a
	pop bc
	push hl
	ld h, b
	ld l, c
	ld bc, $0020
	add bc
	ld a, h
	and $03
	or $98
	ld b, a
	ld c, l
	pop hl
	dec d
	jr nz, UnknownRJump_3F2C1
	ret

UnknownCall_3F307:
	ld a, 255
	ld [$A468], a
	call UnknownCall_2AAA
	call UnknownCall_0348
	ld a, 25
	ld bc, $1000
	ld hl, $4000
	ld de, $8800
	call UnknownCall_2BFB
	call UnknownCall_3F58
	xor a
	ld [$A2B1], a
	ld [$A2B0], a
	ld [$A690], a
	ld [$FF81], a
	ld [$A69A], a
	ld [$A795], a
	ld [$A796], a
	ld [$A797], a
	ld [$A798], a
	ld [$A799], a
	ld [$A79A], a
	ld [$A79B], a
	ld [$A79C], a
	ld [$A7A7], a
	ld [$A7A8], a
	ld a, 4
	ld [$A7A6], a
	call UnknownCall_3E46
	ret

UnknownCall_3F35A:
	ld a, 40
	ld [$FFC5], a
	ld a, 156
	ld [$FFC4], a
	call UnknownCall_3F37F
	add 16
	ld [$FFC6], a
	ld a, 0
	ld [$FFC7], a
	ld a, 0
	ld [$FFBB], a
	call UnknownCall_3F30
	ld a, 5
	ld [$A460], a
	ret

UnknownCall_3F37F:
	ld a, [$A216]
	ld d, 0
	ld e, a
	ld hl, $738B
	add de
	ld a, [hl]
	ret

UnknownData_3F38B:
INCBIN "baserom.gb", $3F38B, $3F38F - $3F38B


UnknownCall_3F38F:
	ld a, [$A262]
	sub l
	daa
	ld a, [$A263]
	sbc h
	daa
	jr c, UnknownRJump_3F3B1
	ld a, [$A262]
	sub l
	daa
	ld [$A262], a
	ld a, [$A263]
	sbc h
	daa
	ld [$A263], a
	call UnknownCall_2934
	ld a, 0
	ret

UnknownRJump_3F3B1:
	ld a, 19
	ld [$A460], a
	ld a, 1
	ret

UnknownJump_3F3B9:
	ld hl, $0999
	call UnknownCall_3F38F
	or a
	jp nz, UnknownJump_3C7D9
	call UnknownCall_3F307
	ld a, 16
	ld bc, $0400
	ld hl, $7240
	ld de, $9800
	call UnknownCall_2BFB
	ld a, 9
	ld [$A68B], a
	ld de, $66D4
	call UnknownCall_3E2A2
	call UnknownCall_3F35A
	ld a, 225
	ld [$A27E], a
	ld a, 195
	ld [$FF40], a
	call UnknownCall_3F495
	ret

UnknownJump_3F3F0:
	ld hl, $0200
	call UnknownCall_3F38F
	or a
	jp nz, UnknownJump_3C7D9
	call UnknownCall_3F307
	ld a, 16
	ld bc, $0400
	ld hl, $7480
	ld de, $9800
	call UnknownCall_2BFB
	ld a, 10
	ld [$A68B], a
	ld de, $671C
	call UnknownCall_3E2A2
	call UnknownCall_3F35A
	ld a, 225
	ld [$A27E], a
	ld a, 195
	ld [$FF40], a
	call UnknownCall_3F495
	ret

UnknownJump_3F427:
	ld hl, $0050
	call UnknownCall_3F38F
	or a
	jp nz, UnknownJump_3C7D9
	call UnknownCall_3F307
	ld a, 16
	ld bc, $0400
	ld hl, $76C0
	ld de, $9800
	call UnknownCall_2BFB
	ld a, 11
	ld [$A68B], a
	ld de, $6704
	call UnknownCall_3E2A2
	call UnknownCall_3F35A
	ld a, 225
	ld [$A27E], a
	ld a, 195
	ld [$FF40], a
	call UnknownCall_3F495
	ret

UnknownJump_3F45E:
	ld hl, $0030
	call UnknownCall_3F38F
	or a
	jp nz, UnknownJump_3C7D9
	call UnknownCall_3F307
	ld a, 16
	ld bc, $0400
	ld hl, $7900
	ld de, $9800
	call UnknownCall_2BFB
	ld a, 12
	ld [$A68B], a
	ld de, $66EC
	call UnknownCall_3E2A2
	call UnknownCall_3F35A
	ld a, 225
	ld [$A27E], a
	ld a, 195
	ld [$FF40], a
	call UnknownCall_3F495
	ret

UnknownCall_3F495:
	ld a, 21
	ld [$A468], a
	ld a, 5
	ld [$A460], a
	ret

UnknownCall_3F4A0:
	ld a, 24
	ld hl, $4A81
	call UnknownCall_3E00
	ld a, [$A7A6]
	cp 3
	call z, UnknownCall_3D880
	ret

UnknownCall_3F4B1:
	ld a, 255
	ld [$A468], a
	call UnknownCall_2AAA
	call UnknownCall_0348
	ld a, 25
	ld bc, $1000
	ld hl, $5000
	ld de, $8800
	call UnknownCall_2BFB
	call UnknownCall_3F58
	xor a
	ld [$A2B1], a
	ld [$A2B0], a
	ld [$A690], a
	ld [$FF81], a
	ld [$A69A], a
	ld [$A795], a
	ld [$A796], a
	ld [$A797], a
	ld [$A798], a
	ld [$A799], a
	ld [$A79A], a
	ld [$A79B], a
	ld [$A79C], a
	ld [$A7A6], a
	ld [$A7A7], a
	ld a, [$A255]
	and $0F
	jr nz, UnknownRJump_3F507

UnknownData_3F502:
INCBIN "baserom.gb", $3F502, $3F507 - $3F502


UnknownRJump_3F507:
	cp 1
	jr nz, UnknownRJump_3F510

UnknownData_3F50B:
INCBIN "baserom.gb", $3F50B, $3F510 - $3F50B


UnknownRJump_3F510:
	ld hl, $4A58
	ld a, l
	ld [$A7AE], a
	ld [$A7B5], a
	ld a, h
	ld [$A7AF], a
	ld [$A7B6], a
	call UnknownCall_3E46
	ld a, 17
	ld bc, $0400
	ld hl, $7800
	ld de, $9800
	call UnknownCall_2BFB
	ld a, 13
	ld [$A68B], a
	ld de, $6734
	call UnknownCall_3E2A2
	ld a, 240
	ld [$FFC5], a
	ld a, 124
	ld [$FFC4], a
	call UnknownCall_3F37F
	ld [$FFC6], a
	ld a, 0
	ld [$FFC7], a
	ld a, 1
	ld [$FFBB], a
	call UnknownCall_3F30
	ld a, 5
	ld [$A460], a
	ld a, 144
	ld hl, $A7D5
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld a, 96
	ld hl, $A7DA
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld a, 3
	ld hl, $A7D0
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld a, 2
	ld hl, $A7DF
	ld [hli], a
	add 24
	ld [hli], a
	add 24
	ld [hli], a
	add 24
	ld [hli], a
	add 24
	ld [hl], a
	ld a, 0
	ld [$A7E9], a
	ld a, 195
	ld [$FF40], a
	ld a, 21
	ld [$A468], a
	ld a, 0
	ld [$A24F], a
	ret

UnknownCall_3F5A4:
	ld a, 255
	ld [$A468], a
	call UnknownCall_2AAA
	call UnknownCall_0348
	ld a, 25
	ld bc, $1000
	ld hl, $5000
	ld de, $8800
	call UnknownCall_2BFB
	call UnknownCall_3F58
	xor a
	ld [$A2B1], a
	ld [$A2B0], a
	ld [$A690], a
	ld [$FF81], a
	ld [$A69A], a
	ld [$A795], a
	ld [$A796], a
	ld [$A797], a
	ld [$A798], a
	ld [$A799], a
	ld [$A79A], a
	ld [$A79B], a
	ld [$A79C], a
	ld [$A7A6], a
	ld [$A7A7], a
	ld [$A7B0], a
	ld [$A7B1], a
	ld [$A7B3], a
	ld [$A7A8], a
	call UnknownCall_3E46
	ld a, 17
	ld bc, $0240
	ld hl, $7A40
	ld de, $9800
	call UnknownCall_2BFB
	ld a, 14
	ld [$A68B], a
	ld de, $6761
	call UnknownCall_3E2A2
	ld a, 240
	ld [$FFC5], a
	ld a, 124
	ld [$FFC4], a
	call UnknownCall_3F37F
	ld [$FFC6], a
	ld a, 0
	ld [$FFC7], a
	ld a, 1
	ld [$FFBB], a
	call UnknownCall_3F30
	ld a, 5
	ld [$A460], a
	ld a, 57
	ld [$A280], a
	ld a, 195
	ld [$FF40], a
	ld a, 21
	ld [$A468], a
	ld a, 0
	ld [$A24F], a
	ret

UnknownData_3F64D:
INCBIN "baserom.gb", $3F64D, $40000 - $3F64D



SECTION "bank10", ROMX, BANK[$10]


UnknownData_40000:
INCBIN "baserom.gb", $40000, $44000 - $40000



SECTION "bank11", ROMX, BANK[$11]


UnknownData_44000:
INCBIN "baserom.gb", $44000, $48000 - $44000



SECTION "bank12", ROMX, BANK[$12]


UnknownData_48000:
INCBIN "baserom.gb", $48000, $4C000 - $48000



SECTION "bank13", ROMX, BANK[$13]


UnknownData_4C000:
INCBIN "baserom.gb", $4C000, $50000 - $4C000



SECTION "bank14", ROMX, BANK[$14]


UnknownData_50000:
INCBIN "baserom.gb", $50000, $54000 - $50000



SECTION "bank15", ROMX, BANK[$15]


UnknownData_54000:
INCBIN "baserom.gb", $54000, $58000 - $54000



SECTION "bank16", ROMX, BANK[$16]

	ld a, [$A224]
	cp 255
	ret z
	ld a, [$A24F]
	and a
	jr z, UnknownRJump_5800F
	xor a
	ld [$FF00+$E2], a

UnknownRJump_5800F:
	call UnknownCall_3A8C
	ld a, [$AF3E]
	and a
	ret nz
	ld a, [$FF00+$DF]
	and a
	jr z, UnknownRJump_5802B
	ld a, [$AF08]
	ld b, a
	ld a, [$AF29]
	swap a
	and $03
	srl a
	xor b
	ret nz

UnknownRJump_5802B:
	ld a, 1
	ld [$AF09], a
	ld a, [$FF00+$EB]
	and a
	jp nz, UnknownJump_58101
	ld a, [$AF06]
	and a
	jp nz, UnknownJump_59C04
	ld a, [$FF00+$D5]
	rst $28

UnknownData_58040:
INCBIN "baserom.gb", $58040, $58101 - $58040


UnknownJump_58101:
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_58110
	call UnknownCall_5B3C6
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a
	ret

UnknownRJump_58110:
	dec a
	rst $28

UnknownData_58112:
INCBIN "baserom.gb", $58112, $5811A - $58112

	ld b, 1
	call UnknownCall_3D32
	call UnknownCall_3BB8
	ld a, [$AF2F]
	bit 0, a
	jr z, UnknownRJump_5812E
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a

UnknownRJump_5812E:
	call UnknownCall_5B481
	call UnknownCall_3D2D
	ld a, [$FF00+$E0]
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$DF]
	add 2
	ld [$FF00+$DF], a
	ret
	ld b, 1
	call UnknownCall_3D22
	call UnknownCall_3C1C
	ld a, [$AF2F]
	bit 4, a
	jr z, UnknownRJump_5812E
	ld a, [$FF00+$DF]
	dec a
	ld [$FF00+$DF], a
	jr UnknownRJump_5812E
	ld b, 1
	call UnknownCall_3D32
	call UnknownCall_3BB8
	ld a, [$AF2F]
	bit 0, a
	jr z, UnknownRJump_5816C
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a

UnknownRJump_5816C:
	call UnknownCall_5B451
	call UnknownCall_3D3D
	call UnknownCall_3B40
	ld a, [$AF2F]
	bit 6, a
	ret z
	ld a, [$FF00+$EB]
	cp 2
	jr z, UnknownRJump_5819B
	call UnknownCall_3AA0
	ret
	ld b, 1
	call UnknownCall_3D22
	call UnknownCall_3C1C
	ld a, [$AF2F]
	bit 4, a
	jr z, UnknownRJump_5816C
	ld a, [$FF00+$DF]
	dec a
	ld [$FF00+$DF], a
	jr UnknownRJump_5816C

UnknownRJump_5819B:
	ld a, [$FF00+$E2]
	ld [$AFCC], a
	call UnknownCall_3AA0
	ld a, [$AFCC]
	ld [$FF00+$E2], a
	call UnknownCall_3CB1
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$DF]
	dec a
	jr z, UnknownRJump_581CE
	dec a
	jr z, UnknownRJump_581E2

UnknownJump_581B9:
	ld b, 20
	call UnknownCall_3D2D
	ld a, [$FF00+$DD]
	xor $40
	ld [$FF00+$DD], a
	xor a
	ld [$FF00+$E0], a
	ld [$FF00+$E2], a
	ld a, 1
	ld [$FF00+$DF], a
	ret

UnknownRJump_581CE:
	call UnknownCall_5B465
	sla b
	call UnknownCall_3D2D
	ld a, [$FF00+$E0]
	cp c
	ret nz
	ld a, 2
	ld [$FF00+$DF], a
	xor a
	ld [$FF00+$E0], a
	ret

UnknownRJump_581E2:
	call UnknownCall_5B451
	sla b
	call UnknownCall_3D3D
	ld a, [$FF00+$D9]
	cp 160
	ret c
	ld a, 2
	ld [$AF26], a
	call UnknownCall_5B2D7
	ld a, [$A2E0]
	and a
	ret z
	dec a
	ld [$A2E0], a
	ret
	call UnknownCall_5B51A
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_58215
	call UnknownCall_5B3C6
	ld a, 16
	ld [$FF00+$DE], a
	ld a, 78
	ld [$FF00+$E2], a
	ret

UnknownJump_58215:
UnknownRJump_58215:
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_5821E:
INCBIN "baserom.gb", $5821E, $58226 - $5821E


UnknownJump_58226:
	call UnknownCall_3C1C
	ld a, [$AF2F]
	bit 4, a
	jr nz, UnknownRJump_58237
	ld b, 1
	call UnknownCall_3D22
	jr UnknownRJump_58243

UnknownRJump_58237:
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a
	ret

UnknownRJump_58243:
	call UnknownCall_3B40
	ld a, [$AF2F]
	bit 6, a
	ret nz
	ld a, [$FF00+$DF]
	add 2
	ld [$FF00+$DF], a
	ret

UnknownJump_58253:
	call UnknownCall_3BB8
	ld a, [$AF2F]
	bit 0, a
	jr nz, UnknownRJump_58264
	ld b, 1
	call UnknownCall_3D32
	jr UnknownRJump_58243

UnknownRJump_58264:
	ld a, [$FF00+$DF]
	sub 1
	ld [$FF00+$DF], a
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a
	ret

UnknownJump_58271:
	call UnknownCall_3C1C
	ld a, [$AF2F]
	bit 4, a
	jr nz, UnknownRJump_58237
	ld b, 1
	call UnknownCall_3D22
	jr UnknownRJump_58293

UnknownJump_58282:
	call UnknownCall_3BB8
	ld a, [$AF2F]
	bit 0, a
	jr nz, UnknownRJump_58264
	ld b, 1
	call UnknownCall_3D32
	jr UnknownRJump_58293

UnknownRJump_58293:
	call UnknownCall_5B451
	call UnknownCall_3D3D
	call UnknownCall_3B40
	ld a, [$AF2F]
	bit 6, a
	ret z
	ld a, [$FF00+$DF]
	sub 2
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$DF]
	dec a
	jr z, UnknownRJump_582C3
	ld a, 16
	ld [$FF00+$DE], a
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 32
	ld [$FF00+$E0], a
	xor a
	ld [$FF00+$E2], a
	ld a, 3
	ld [$A460], a
	ret

UnknownRJump_582C3:
	ld hl, $FFE0
	dec [hl]
	ret nz
	ld a, 1
	ld [$AF26], a
	call UnknownCall_5B2D7
	ret
	call UnknownCall_5B585
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_582F5
	ld a, 86
	ld [$FF00+$E2], a

UnknownJump_582DD:
	call UnknownCall_3B40
	ld a, [$AF2F]
	bit 6, a
	jr nz, UnknownRJump_582EE

UnknownData_582E7:
INCBIN "baserom.gb", $582E7, $582EE - $582E7


UnknownRJump_582EE:
	xor a
	ld [$FF00+$E0], a
	call UnknownCall_5B3C6
	ret

UnknownJump_582F5:
UnknownRJump_582F5:
	dec a
	rst $28

UnknownData_582F7:
INCBIN "baserom.gb", $582F7, $582FB - $582F7


UnknownJump_582FB:
UnknownCall_582FB:
	ld a, [$FF00+$F0]
	and $01
	jr nz, UnknownRJump_58339
	ld b, 1
	call UnknownCall_3D22
	call UnknownCall_3C1C
	ld a, [$AF2F]
	bit 4, a
	ret z
	ld a, 2
	ld [$FF00+$DF], a
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a
	ret

UnknownJump_5831A:
UnknownCall_5831A:
	ld a, [$FF00+$F0]
	and $01
	jr nz, UnknownRJump_58339
	ld b, 1
	call UnknownCall_3D32
	call UnknownCall_3BB8
	ld a, [$AF2F]
	bit 0, a
	ret z
	ld a, 1
	ld [$FF00+$DF], a
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a
	ret

UnknownRJump_58339:
	call UnknownCall_3B40
	ld a, [$AF2F]
	bit 6, a
	ret nz
	ld a, [$FF00+$DF]
	xor $03
	ld [$FF00+$DF], a
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a
	ret
	ld a, [$FF00+$DF]
	dec a
	jr z, UnknownRJump_58364
	dec a
	jr z, UnknownRJump_58380
	ld a, 6
	ld [$FF00+$E2], a
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 192
	ld [$FF00+$EC], a
	ret

UnknownRJump_58364:
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	jr z, UnknownRJump_5837B
	call UnknownCall_3B40
	ld a, [$AF2F]
	bit 6, a
	ret nz
	call UnknownCall_5B451
	call UnknownCall_3D3D
	ret

UnknownRJump_5837B:
	ld a, 2
	ld [$FF00+$DF], a
	ret

UnknownRJump_58380:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld a, [$FF00+$DB]
	xor $0B
	ld [$FF00+$DB], a
	ld a, [$FF00+$EC]
	inc a
	ld [$FF00+$EC], a
	cp 8
	ret nz
	ld a, 1
	ld [$FF00+$D5], a
	call UnknownCall_3AA0
	ret
	ld a, [$FF00+$E2]
	bit 6, a
	call nz, UnknownCall_5B697
	call UnknownCall_5B607
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_583B2
	call UnknownCall_5B3C6
	ld a, 95
	ld [$FF00+$E2], a
	ret

UnknownRJump_583B2:
	dec a
	rst $28

UnknownData_583B4:
INCBIN "baserom.gb", $583B4, $583BC - $583B4

	call UnknownCall_3BA4
	ld a, [$AF2F]
	bit 0, a
	jr nz, UnknownRJump_583DB
	ld b, 3
	call UnknownCall_3D32

UnknownRJump_583CB:
	call UnknownCall_3B40
	ld a, [$AF2F]
	bit 6, a
	ret nz
	ld a, [$FF00+$DF]
	add 2
	ld [$FF00+$DF], a
	ret

UnknownRJump_583DB:
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	ld a, 2
	ld [$A460], a
	ret
	call UnknownCall_3C08
	ld a, [$AF2F]
	bit 4, a
	jr nz, UnknownRJump_583F7
	ld b, 3
	call UnknownCall_3D22
	jr UnknownRJump_583CB

UnknownRJump_583F7:
	ld a, [$FF00+$DF]
	dec a
	ld [$FF00+$DF], a
	ld a, 2
	ld [$A460], a
	ret
	call UnknownCall_3BA4
	ld a, [$AF2F]
	bit 0, a
	jr nz, UnknownRJump_583DB
	ld b, 3
	call UnknownCall_3D32

UnknownRJump_58411:
	call UnknownCall_3B40
	ld a, [$AF2F]
	bit 6, a
	jr nz, UnknownRJump_58423
	call UnknownCall_5B451
	inc b
	call UnknownCall_3D3D
	ret

UnknownRJump_58423:
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$DF]
	sub 2
	ld [$FF00+$DF], a
	ld a, [$FF00+$D4]
	and $F0
	ld [$FF00+$D4], a
	ret
	call UnknownCall_3C08
	ld a, [$AF2F]
	bit 4, a
	jr nz, UnknownRJump_583F7
	ld b, 3
	call UnknownCall_3D22
	jr UnknownRJump_58411
	ld a, [$A221]
	and $F0
	jr z, UnknownRJump_58452
	xor a
	ld [$AF3A], a
	jp UnknownJump_5B2D7

UnknownRJump_58452:
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_5845F
	xor a
	ld [$FF00+$E2], a
	ld a, 1
	ld [$FF00+$DF], a
	ret

UnknownRJump_5845F:
	dec a
	rst $28

UnknownData_58461:
INCBIN "baserom.gb", $58461, $58463 - $58461

	call UnknownCall_5B4C1
	call UnknownCall_5B697
	ld a, [$AF2E]
	and a
	jr nz, UnknownRJump_584C3
	call UnknownCall_3B68
	ld a, [$AF2F]
	bit 4, a
	jr nz, UnknownRJump_584C3
	ld a, [$FF80]
	bit 4, a
	ret nz
	xor a
	ld [$AF3A], a
	call UnknownCall_3AB4
	ld b, 16
	ld a, [$A22B]
	cp 1
	jr z, UnknownRJump_584A9
	call UnknownCall_3D22
	call UnknownCall_3C08
	ld a, [$AF2F]
	bit 4, a
	ret z

UnknownData_5849B:
INCBIN "baserom.gb", $5849B, $584A9 - $5849B


UnknownRJump_584A9:
	call UnknownCall_3D32
	call UnknownCall_3BA4
	ld a, [$AF2F]
	bit 0, a
	ret z
	ld b, 16
	call UnknownCall_3D22
	ld a, 95
	ld [$FF00+$E2], a
	ld a, 1
	ld [$FF00+$DF], a
	ret

UnknownRJump_584C3:
	xor a
	ld [$AF3A], a
	call UnknownCall_3ADC
	ret
	ld a, [$A221]
	and $F0
	jp nz, UnknownJump_5B2D7
	ld a, [$FF00+$DF]
	dec a
	jr z, UnknownRJump_5851C
	dec a
	jr z, UnknownRJump_5850C
	dec a
	jr z, UnknownRJump_58537
	jr UnknownRJump_584F3
	ld a, [$A221]
	and $F0
	jp nz, UnknownJump_5B2D7
	ld a, [$FF00+$DF]
	dec a
	jr z, UnknownRJump_5850C
	dec a
	jr z, UnknownRJump_5851C
	dec a
	jr z, UnknownRJump_58537

UnknownRJump_584F3:
	ld a, 128
	ld [$FF00+$DC], a
	call UnknownCall_5B4B4
	cp 24
	ret c
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 32
	ld [$FF00+$E8], a
	ld [$FF00+$E9], a
	ld a, 68
	ld [$FF00+$E2], a
	ret

UnknownRJump_5850C:
	call UnknownCall_5B51A
	ld b, 1
	call UnknownCall_3D2D
	ld a, [$FF00+$E8]
	sub b
	ld [$FF00+$E8], a
	ret nz
	jr UnknownRJump_5852A

UnknownRJump_5851C:
	call UnknownCall_5B51A
	ld b, 1
	call UnknownCall_3D3D
	ld a, [$FF00+$E8]
	sub b
	ld [$FF00+$E8], a
	ret nz

UnknownRJump_5852A:
	ld a, [$FF00+$E9]
	ld [$FF00+$E8], a
	ld hl, $FFDF
	inc [hl]
	ld a, 24
	ld [$FF00+$EC], a
	ret

UnknownRJump_58537:
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	xor a
	ld [$FF00+$DF], a
	ret
	ld a, [$A221]
	and $F0
	jp nz, UnknownJump_5B2D7
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_5855A
	call UnknownCall_5B3E0
	inc a
	jr z, UnknownRJump_58556
	ld a, 32

UnknownRJump_58556:
	ld [$FF00+$DD], a
	jr UnknownRJump_584F3

UnknownRJump_5855A:
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_5855E:
INCBIN "baserom.gb", $5855E, $58566 - $5855E

	call UnknownCall_585DA
	ld b, 1
	call UnknownCall_3D2D
	ld a, [$FF00+$E8]
	dec a
	ld [$FF00+$E8], a
	ret nz
	ld a, [$FF00+$DB]
	inc a
	ld [$FF00+$DB], a
	ld a, 14
	ld [$AF36], a
	ld a, 22
	ld [$AF37], a
	ld a, [$FF00+$DD]
	ld [$AF38], a
	ld a, [$FF00+$DB]
	cp 19
	jr z, UnknownRJump_58596
	ld a, [$AF38]
	set 6, a
	ld [$AF38], a

UnknownRJump_58596:
	call UnknownCall_5B36D
	ld a, 2
	ld [$FF00+$DF], a
	ld a, 48
	ld [$FF00+$EC], a
	ret
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 3
	ld [$FF00+$DF], a
	ld a, [$FF00+$E9]
	ld [$FF00+$E8], a
	ld a, [$FF00+$DB]
	dec a
	ld [$FF00+$DB], a
	ret
	call UnknownCall_585DA
	ld b, 1
	call UnknownCall_3D3D
	ld a, [$FF00+$E8]
	dec a
	ld [$FF00+$E8], a
	ret nz
	ld a, 4
	ld [$FF00+$DF], a
	ld [$FF00+$EC], a
	ret
	ld a, [$FF00+$F0]
	and $07
	ret nz
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	xor a
	ld [$FF00+$DF], a
	ret

UnknownCall_585DA:
	call UnknownCall_5B41A
	ld a, [$AF2C]
	dec a
	jr z, UnknownRJump_585E8
	ld a, 18
	ld [$FF00+$DB], a
	ret

UnknownRJump_585E8:
	ld a, 20
	ld [$FF00+$DB], a
	ret
	call UnknownCall_5B521
	ld a, [$FF00+$DF]
	dec a
	jr z, UnknownRJump_58613
	dec a
	jr z, UnknownRJump_5861A
	ld a, 64
	ld [$FF00+$E2], a
	ld b, 12
	call UnknownCall_3D2D
	ld a, [$FF00+$DD]
	bit 6, a
	jr z, UnknownRJump_5860F
	res 6, a
	ld [$FF00+$DD], a
	ld a, 1
	ld [$FF00+$E8], a

UnknownRJump_5860F:
	call UnknownCall_3CB1
	ret

UnknownRJump_58613:
	ld b, 2
	call UnknownCall_3D22
	jr UnknownRJump_5861F

UnknownRJump_5861A:
	ld b, 2
	call UnknownCall_3D32

UnknownRJump_5861F:
	ld b, 1
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_5862A
	call UnknownCall_3D2D
	ret

UnknownRJump_5862A:
	call UnknownCall_3D3D
	ret
	call UnknownCall_5B521
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_58642
	call UnknownCall_5B3C6
	ld a, 16
	ld [$FF00+$DE], a
	ld a, 86
	ld [$FF00+$E2], a
	ret

UnknownJump_58642:
UnknownRJump_58642:
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_58646:
INCBIN "baserom.gb", $58646, $5864E - $58646

	ld a, [$FF00+$F0]
	and $01
	jr nz, UnknownRJump_5868C
	ld b, 1
	call UnknownCall_3D22
	call UnknownCall_3C1C
	ld a, [$AF2F]
	bit 4, a
	ret z
	ld a, 2
	ld [$FF00+$DF], a
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a
	ret
	ld a, [$FF00+$F0]
	and $01
	jr nz, UnknownRJump_5868C
	ld b, 1
	call UnknownCall_3D32
	call UnknownCall_3BB8
	ld a, [$AF2F]
	bit 0, a
	ret z
	ld a, 1
	ld [$FF00+$DF], a
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a
	ret

UnknownRJump_5868C:
	ld a, [$FF00+$E8]
	dec a
	jr z, UnknownRJump_586AD
	call UnknownCall_5B47A
	ld a, [$FF00+$E0]
	cp c
	jr z, UnknownRJump_586A5
	call UnknownCall_3D2D
	call UnknownCall_3B7C
	ld a, [$AF2F]
	bit 4, a
	ret z

UnknownRJump_586A5:
	xor a
	ld [$FF00+$E0], a
	ld a, 1
	ld [$FF00+$E8], a
	ret

UnknownRJump_586AD:
	call UnknownCall_5B451
	call UnknownCall_3D3D
	call UnknownCall_3B40
	ld a, [$AF2F]
	bit 6, a
	ret z
	xor a
	ld [$FF00+$E8], a
	ld a, [$FF00+$E9]
	inc a
	cp 4
	jr z, UnknownRJump_586D6
	ld [$FF00+$E9], a
	ld a, 10
	ld [$FF00+$E0], a
	ld a, [$FF00+$DF]
	cp 3
	ret nc
	add 2
	ld [$FF00+$DF], a
	ret

UnknownRJump_586D6:
	xor a
	ld [$FF00+$E0], a
	ld [$FF00+$E8], a
	ld [$FF00+$E9], a
	call UnknownCall_5B3C6
	ret
	ld a, 133
	ld [$FF00+$E2], a
	ret
	ld a, 137
	ld [$FF00+$E2], a
	ret

UnknownData_586EB:
INCBIN "baserom.gb", $586EB, $586EE - $586EB

	ld a, [$FF00+$D5]
	add 102
	ld [$FF00+$E2], a
	ret
	ld a, 1
	ld [$FF00+$DF], a
	call UnknownCall_5B68B
	ld b, 2
	call UnknownCall_3D2D
	ld a, [$FF00+$E8]
	add b
	ld [$FF00+$E8], a
	cp 32
	ret nz
	ld a, 2
	ld [$AF26], a
	call UnknownCall_5B2D7
	ret
	ld a, [$FF00+$DF]
	dec a
	jr z, UnknownRJump_58734
	dec a
	jr z, UnknownRJump_58749
	dec a
	jr z, UnknownRJump_5874C
	dec a
	jr z, UnknownRJump_5874F
	dec a
	jr z, UnknownRJump_58752
	ld a, 128
	ld [$FF00+$E2], a
	xor a
	ld [$FF00+$E8], a
	ld a, 128
	ld [$FF00+$DC], a
	ld a, 1
	ld [$AF3E], a
	ret

UnknownRJump_58734:
	ld b, 1
	call UnknownCall_3D2D
	ld a, [$FF00+$E8]
	inc a
	ld [$FF00+$E8], a
	cp 8
	ret nz
	ld a, 3
	ld [$FF00+$DF], a
	xor a
	ld [$FF00+$DC], a
	ret

UnknownRJump_58749:
	jp UnknownJump_58226

UnknownRJump_5874C:
	jp UnknownJump_58253

UnknownRJump_5874F:
	jp UnknownJump_58271

UnknownRJump_58752:
	jp UnknownJump_58282
	call UnknownCall_5B68B
	ld a, [$FF00+$DF]
	dec a
	jr z, UnknownRJump_58787
	dec a
	ret z
	ld a, 128
	ld [$FF00+$E2], a
	ld a, [$FF00+$D2]
	cp 16
	jr z, UnknownRJump_58777
	ld a, 128
	ld [$FF00+$DC], a
	ld a, 1
	ld [$AF3E], a
	ld a, 2
	ld [$FF00+$DF], a
	ret

UnknownRJump_58777:
	ld a, [$FF00+$D5]
	add 112
	ld [$FF00+$E2], a
	ld a, 2
	ld [$FF00+$DF], a
	ld b, 8
	call UnknownCall_3D3D
	ret

UnknownRJump_58787:
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld b, 1
	call UnknownCall_3D2D
	ld a, [$FF00+$E8]
	inc a
	ld [$FF00+$E8], a
	cp 8
	ret nz
	ld a, 2
	ld [$FF00+$DF], a
	xor a
	ld [$FF00+$DC], a
	ret
	call UnknownCall_5B68B
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_587B7
	ld a, 132
	ld [$FF00+$E2], a
	ld b, 56
	call UnknownCall_3D2D
	ld a, 1
	ld [$FF00+$DF], a
	ret

UnknownRJump_587B7:
	ld b, 1
	call UnknownCall_3D3D
	ret
	ld a, [$FF00+$DF]
	dec a
	jr z, UnknownRJump_587D3
	ld a, 134
	ld [$FF00+$E2], a
	ld a, [$FF00+$E7]
	bit 4, a
	ret z
	ld a, 1
	ld [$FF00+$DF], a
	xor a
	ld [$FF00+$E2], a
	ret

UnknownRJump_587D3:
	call UnknownCall_5B545
	ret
	ld a, [$FF00+$DF]
	dec a
	jr z, UnknownRJump_587D3
	dec a
	jr z, UnknownRJump_587EE
	ld a, [$A2A0]
	and a
	jr nz, UnknownRJump_587FB
	ld a, 135
	ld [$FF00+$E2], a
	ld a, 2
	ld [$FF00+$DF], a
	ret

UnknownRJump_587EE:
	ld a, [$FF00+$E7]
	bit 4, a
	ret z
	ld a, 1
	ld [$FF00+$DF], a
	xor a
	ld [$FF00+$E2], a
	ret

UnknownRJump_587FB:
	ld a, 2
	ld [$AF26], a
	call UnknownCall_5B2D7
	ret
	ld a, [$FF00+$DF]
	rst $28

UnknownData_58807:
INCBIN "baserom.gb", $58807, $5880F - $58807

	ld a, 1
	ld [$FF00+$DF], a
	ret
	call UnknownCall_5B4B4
	cp 48
	ret nc
	ld a, 2
	ld [$FF00+$DF], a
	ld a, 136
	ld [$FF00+$E2], a
	ret
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld a, [$FF00+$DB]
	inc a
	ld [$FF00+$DB], a
	cp 136
	ret nz
	ld a, 3
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$E7]
	bit 4, a
	jr nz, UnknownRJump_58844
	call UnknownCall_5B511
	ld b, 1
	call UnknownCall_3D2D
	ret

UnknownRJump_58844:
	call UnknownCall_5B2D7
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_58859
	call UnknownCall_5B3C6
	ld a, 77
	ld [$FF00+$E2], a
	ld a, 1
	ld [$FF00+$EC], a
	ret

UnknownRJump_58859:
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_5885D:
INCBIN "baserom.gb", $5885D, $58865 - $5885D

	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_58872
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 56
	ld [$FF00+$DB], a

UnknownRJump_58872:
	call UnknownCall_3C1C
	ld a, [$AF2F]
	bit 4, a
	jr nz, UnknownRJump_588E2
	ld b, 1
	call UnknownCall_3D22
	jr UnknownRJump_5889F
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_58890
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 56
	ld [$FF00+$DB], a

UnknownRJump_58890:
	call UnknownCall_3BB8
	ld a, [$AF2F]
	bit 0, a
	jr nz, UnknownRJump_588E2
	ld b, 1
	call UnknownCall_3D32

UnknownRJump_5889F:
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_588B9
	call UnknownCall_5B46C
	call UnknownCall_3D2D
	ld a, [$FF00+$E0]
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	inc a
	ld [$FF00+$E8], a
	ld a, 52
	ld [$FF00+$DB], a
	ret

UnknownRJump_588B9:
	call UnknownCall_3B40
	ld a, [$AF2F]
	bit 6, a
	jr nz, UnknownRJump_588CA
	call UnknownCall_5B445
	call UnknownCall_3D3D
	ret

UnknownRJump_588CA:
	xor a
	ld [$FF00+$E0], a
	ld [$FF00+$E8], a
	ld a, 8
	ld [$FF00+$EC], a
	call UnknownCall_5B4B4
	cp 48
	jr c, UnknownRJump_588E8
	ld a, [$FF00+$E9]
	inc a
	ld [$FF00+$E9], a
	cp 3
	ret nz

UnknownJump_588E2:
UnknownRJump_588E2:
	xor a
	ld [$FF00+$E9], a
	jp UnknownJump_59D2D

UnknownRJump_588E8:
	ld a, 8
	ld [$FF00+$EC], a
	call UnknownCall_5B3E0
	bit 7, a
	jr z, UnknownRJump_58900
	ld b, 1
	ld a, [$FF00+$DF]
	xor b
	jr z, UnknownRJump_5891D

UnknownData_588FA:
INCBIN "baserom.gb", $588FA, $58900 - $588FA


UnknownRJump_58900:
	ld b, 2
	ld a, [$FF00+$DF]
	xor b
	jr z, UnknownRJump_5891D
	ld a, 4
	ld [$FF00+$DF], a
	ld a, [$FF00+$E9]
	inc a
	ld [$FF00+$E9], a
	ld b, a
	ld a, 3
	sub b
	ld [$FF00+$E9], a
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a
	ret

UnknownRJump_5891D:
	ld a, [$FF00+$E9]
	inc a
	ld [$FF00+$E9], a
	ld a, [$FF00+$DF]
	add 2
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_58932
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_58932:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld a, [$FF00+$EA]
	cp 3
	jr nc, UnknownRJump_5894B
	inc a
	ld [$FF00+$EA], a
	ld a, [$FF00+$DB]
	inc a
	ld [$FF00+$DB], a
	ld b, 4
	call UnknownCall_3D22
	ret

UnknownRJump_5894B:
	cp 6
	jr z, UnknownRJump_5895D
	inc a
	ld [$FF00+$EA], a
	ld a, [$FF00+$DB]
	dec a
	ld [$FF00+$DB], a
	ld b, 4
	call UnknownCall_3D32
	ret

UnknownRJump_5895D:
	xor a
	ld [$FF00+$EA], a
	ld a, 8
	ld [$FF00+$EC], a
	ld a, [$FF00+$DF]
	sub 2
	ld [$FF00+$DF], a
	ld a, [$FF00+$E9]
	cp 3
	jp z, UnknownJump_588E2
	ret
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_5897B
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_5897B:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld a, [$FF00+$EA]
	cp 3
	jr nc, UnknownRJump_58994
	inc a
	ld [$FF00+$EA], a
	ld a, [$FF00+$DB]
	inc a
	ld [$FF00+$DB], a
	ld b, 4
	call UnknownCall_3D32
	ret

UnknownRJump_58994:
	cp 6
	jr z, UnknownRJump_5895D
	inc a
	ld [$FF00+$EA], a
	ld a, [$FF00+$DB]
	dec a
	ld [$FF00+$DB], a
	ld b, 4
	call UnknownCall_3D22
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_589BA
	ld a, 32
	ld [$FF00+$E2], a
	call UnknownCall_5B4B4
	cp 64
	ret nc
	ld a, 5
	ld [$FF00+$DF], a
	ret

UnknownRJump_589BA:
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_589BE:
INCBIN "baserom.gb", $589BE, $589CA - $589BE

	call UnknownCall_5B521
	ld a, [$FF00+$F0]
	and $01
	jr nz, UnknownRJump_589E7
	ld b, 1
	call UnknownCall_3D22
	call UnknownCall_3C30
	ld a, [$AF2F]
	bit 4, a
	ret z

UnknownData_589E1:
INCBIN "baserom.gb", $589E1, $589E7 - $589E1


UnknownRJump_589E7:
	call UnknownCall_3B40
	ld a, [$AF2F]
	bit 6, a
	ret nz

UnknownData_589F0:
INCBIN "baserom.gb", $589F0, $589F7 - $589F0

	call UnknownCall_5B521
	ld a, [$FF00+$F0]
	and $01
	jr nz, UnknownRJump_589E7
	ld b, 1
	call UnknownCall_3D32
	call UnknownCall_3BCC
	ld a, [$AF2F]
	bit 0, a
	ret z

UnknownData_58A0E:
INCBIN "baserom.gb", $58A0E, $58A3D - $58A0E

	call UnknownCall_5B521
	ld a, [$FF00+$EA]
	inc a
	ld [$FF00+$EA], a
	cp 32
	ret nz
	xor a
	ld [$FF00+$EA], a
	ld a, 6
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$F0]
	and $07
	ret nz
	ld a, [$FF00+$DB]
	inc a
	ld [$FF00+$DB], a
	cp 62
	ret nz
	call UnknownCall_5B3C6
	ld a, 77
	ld [$FF00+$E2], a
	ld a, [$FF00+$E7]
	bit 6, a
	ret z
	ld a, 8
	call UnknownCall_3D10
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_58A76
	jr UnknownRJump_58ABE

UnknownRJump_58A76:
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_58A7A:
INCBIN "baserom.gb", $58A7A, $58A82 - $58A7A

	call UnknownCall_5B68B
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_58A96
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 64
	ld [$FF00+$DB], a
	ld a, 76
	ld [$FF00+$E2], a

UnknownRJump_58A96:
	call UnknownCall_5B5E6
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$FF04]
	and $3F
	jr z, UnknownRJump_58ABE
	ld b, 1
	call UnknownCall_3D22
	call UnknownCall_3C1C
	ld a, [$AF2F]
	bit 4, a
	ret z
	ld a, 2
	ld [$FF00+$DF], a
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a
	ret

UnknownRJump_58ABE:
	call UnknownCall_5B3C6
	ld a, [$FF00+$DF]
	add 2
	ld [$FF00+$DF], a
	ld a, 68
	ld [$FF00+$DB], a
	xor a
	ld [$FF00+$DE], a
	ld a, 77
	ld [$FF00+$E2], a
	ret
	call UnknownCall_5B68B
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_58AE7

UnknownData_58ADB:
INCBIN "baserom.gb", $58ADB, $58AE7 - $58ADB


UnknownRJump_58AE7:
	call UnknownCall_5B5E6
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$FF04]
	and $3F
	jr z, UnknownRJump_58ABE
	ld b, 1
	call UnknownCall_3D32
	call UnknownCall_3BB8
	ld a, [$AF2F]
	bit 0, a
	ret z
	ld a, 1
	ld [$FF00+$DF], a
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a
	ret
	call UnknownCall_5B521
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$FF00+$E9]
	inc a
	ld [$FF00+$E9], a
	cp 40
	jr z, UnknownRJump_58B21
	ret

UnknownRJump_58B21:
	xor a
	ld [$FF00+$E9], a
	ld [$FF00+$EA], a
	ld a, [$FF00+$DF]
	sub 2
	ld [$FF00+$DF], a
	ld a, 36
	ld [$FF00+$EC], a
	ret

UnknownData_58B31:
INCBIN "baserom.gb", $58B31, $58B43 - $58B31

	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_58B50
	call UnknownCall_5B3C6
	ld a, 77
	ld [$FF00+$E2], a
	ret

UnknownRJump_58B50:
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_58B54:
INCBIN "baserom.gb", $58B54, $58B58 - $58B54

	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_58B66
	call UnknownCall_5B5B6
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz

UnknownRJump_58B66:
	call UnknownCall_5B5B4
	ld a, [$FF00+$F0]
	and $01
	ret nz
	call UnknownCall_5B451
	call UnknownCall_3D22

UnknownRJump_58B74:
	ld b, 1
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_58B80
	call UnknownCall_3D3D
	jr UnknownRJump_58B83

UnknownRJump_58B80:
	call UnknownCall_3D2D

UnknownRJump_58B83:
	ld a, [$FF00+$E0]
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	call UnknownCall_5B3C6
	call UnknownCall_5B41A
	dec a
	jr z, UnknownRJump_58B95
	ld a, 1

UnknownRJump_58B95:
	ld [$FF00+$E8], a
	ld a, 40
	ld [$FF00+$EC], a
	ret
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_58BAA
	call UnknownCall_5B5B6
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz

UnknownRJump_58BAA:
	call UnknownCall_5B5B4
	ld a, [$FF00+$F0]
	and $01
	ret nz
	call UnknownCall_5B451
	call UnknownCall_3D32
	jr UnknownRJump_58B74
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_58BDC
	ld a, 32
	ld [$FF00+$E2], a
	call UnknownCall_5B407
	ld a, 44
	ld [$FF00+$E8], a
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_58BDC
	ld a, 32
	ld [$FF00+$E2], a
	call UnknownCall_5B407
	ld a, 20
	ld [$FF00+$E8], a
	ret

UnknownRJump_58BDC:
	dec a
	rst $28

UnknownData_58BDE:
INCBIN "baserom.gb", $58BDE, $58BE6 - $58BDE

	ld a, [$FF00+$E8]
	ld c, a
	ld b, 1
	call UnknownCall_3D2D
	call UnknownCall_3D10
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, 4
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$E8]
	ld c, a
	ld b, 1
	call UnknownCall_3D3D
	call UnknownCall_3CDF
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, 3
	ld [$FF00+$DF], a
	ret
	ld b, 1
	call UnknownCall_3D2D
	call UnknownCall_3D10

UnknownRJump_58C22:
	ld a, [$FF00+$E8]
	add a
	ld c, a
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$DF]
	xor $07
	ld [$FF00+$DF], a
	ret
	ld b, 1
	call UnknownCall_3D3D
	call UnknownCall_3CDF
	jr UnknownRJump_58C22
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_58C7B
	ld a, 32
	ld [$FF00+$E2], a
	call UnknownCall_5B3C6
	ld a, 60
	ld [$FF00+$E8], a
	ret
	call UnknownCall_5B51A
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_58C7B
	ld a, 32
	ld [$FF00+$E2], a
	ld a, 16
	ld [$FF00+$DE], a
	call UnknownCall_5B3C6
	ld a, 36
	ld [$FF00+$E8], a
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_58C7B
	ld a, 32
	ld [$FF00+$E2], a
	call UnknownCall_5B3C6
	ld a, 36
	ld [$FF00+$E8], a
	ret

UnknownRJump_58C7B:
	dec a
	rst $28

UnknownData_58C7D:
INCBIN "baserom.gb", $58C7D, $58C85 - $58C7D

	ld a, [$FF00+$E8]
	ld c, a
	ld b, 1
	call UnknownCall_3D22
	call UnknownCall_3CF1
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, 4
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$E8]
	ld c, a
	ld b, 1
	call UnknownCall_3D32
	call UnknownCall_3CC0
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, 3
	ld [$FF00+$DF], a
	ret
	ld b, 1
	call UnknownCall_3D22
	call UnknownCall_3CF1

UnknownRJump_58CC1:
	ld a, [$FF00+$E8]
	add a
	ld c, a
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$DF]
	xor $07
	ld [$FF00+$DF], a
	ret
	ld b, 1
	call UnknownCall_3D32
	call UnknownCall_3CC0
	jr UnknownRJump_58CC1
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_58CF4
	ld a, 32
	ld [$FF00+$E2], a
	call UnknownCall_5B3C6
	ld a, 24
	ld [$FF00+$E8], a
	add a
	ld [$FF00+$E9], a
	ret

UnknownRJump_58CF4:
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_58CFD:
INCBIN "baserom.gb", $58CFD, $58D01 - $58CFD

	ld b, 1
	call UnknownCall_3D22
	call UnknownCall_3CF1
	ld b, 1
	call UnknownCall_3D3D
	call UnknownCall_3CDF

UnknownRJump_58D11:
	ld a, [$FF00+$E8]
	dec a
	ld [$FF00+$E8], a
	ret nz
	ld a, [$FF00+$E9]
	ld [$FF00+$E8], a
	ld a, [$FF00+$DF]
	xor $03
	ld [$FF00+$DF], a
	ret
	ld b, 1
	call UnknownCall_3D32
	call UnknownCall_3CC0
	ld b, 1
	call UnknownCall_3D2D
	call UnknownCall_3D10
	jr UnknownRJump_58D11
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_58D45
	ld a, 32
	ld [$FF00+$E2], a
	call UnknownCall_5B3C6
	ld a, 24
	ld [$FF00+$E8], a
	ret

UnknownRJump_58D45:
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_58D4E:
INCBIN "baserom.gb", $58D4E, $58D78 - $58D4E

	ld a, [$FF00+$E8]
	ld c, a
	ld b, 1
	call UnknownCall_3D32
	call UnknownCall_3CC0
	ld b, 1
	call UnknownCall_3D3D
	call UnknownCall_3CDF
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, 3
	ld [$FF00+$DF], a
	ret
	ld b, 1
	call UnknownCall_3D22
	call UnknownCall_3CF1
	ld b, 1
	call UnknownCall_3D2D
	call UnknownCall_3D10

UnknownRJump_58DAA:
	ld a, [$FF00+$E8]
	add a
	ld c, a
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$DF]
	xor $07
	ld [$FF00+$DF], a
	ret
	ld b, 1
	call UnknownCall_3D32
	call UnknownCall_3CC0
	ld b, 1
	call UnknownCall_3D3D
	call UnknownCall_3CDF
	jr UnknownRJump_58DAA
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_58DDF
	ld a, 32
	ld [$FF00+$E2], a
	ld a, 2
	ld [$FF00+$DF], a
	ret

UnknownRJump_58DDF:
	dec a
	rst $28

UnknownData_58DE1:
INCBIN "baserom.gb", $58DE1, $58DE5 - $58DE1

	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_58DEE
	dec a
	ld [$FF00+$EC], a
	ret nz

UnknownRJump_58DEE:
	call UnknownCall_5B451
	call UnknownCall_3D3D
	call UnknownCall_3CDF
	call UnknownCall_3B40
	ld a, [$AF2F]
	bit 6, a
	ret z
	call UnknownCall_5B2D7
	ret
	ld a, [$FF00+$E7]
	bit 6, a
	ret z
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 28
	ld [$FF00+$EC], a
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_58E30
	ld a, 32
	ld [$FF00+$E2], a
	ld a, 3
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$E7]
	bit 6, a
	ret z
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 64
	ld [$FF00+$E8], a
	ld [$FF00+$E9], a
	ret

UnknownRJump_58E30:
	dec a
	rst $28

UnknownData_58E32:
INCBIN "baserom.gb", $58E32, $58E38 - $58E32


UnknownJump_58E38:
	ld a, [$FF00+$E7]
	bit 6, a
	jr z, UnknownRJump_58E4E
	ld a, [$FF00+$E8]
	and a
	ret z
	dec a
	ld [$FF00+$E8], a
	ld b, 1
	call UnknownCall_3D2D
	call UnknownCall_3D10
	ret

UnknownRJump_58E4E:
	ld a, 2
	ld [$FF00+$DF], a
	ld a, 16
	ld [$FF00+$EC], a
	ret

UnknownJump_58E57:
	ld a, [$FF00+$E7]
	bit 6, a
	jr nz, UnknownRJump_58E76
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_58E66
	dec a
	ld [$FF00+$EC], a
	ret nz

UnknownRJump_58E66:
	ld a, [$FF00+$E9]
	ld c, a
	ld a, [$FF00+$E8]
	cp c
	ret z
	inc a
	ld [$FF00+$E8], a
	ld b, 1
	call UnknownCall_3D3D
	ret

UnknownRJump_58E76:
	ld a, 1
	ld [$FF00+$DF], a
	xor a
	ld [$FF00+$EC], a
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_58E99
	ld b, 32
	call UnknownCall_3D2D
	call UnknownCall_5B3C6
	ld a, 32
	ld [$FF00+$E2], a
	ld a, 40
	ld [$FF00+$E9], a
	add a
	ld [$FF00+$E8], a
	ld [$FF00+$E0], a
	ret

UnknownRJump_58E99:
	dec a
	rst $28

UnknownData_58E9B:
INCBIN "baserom.gb", $58E9B, $58EA7 - $58E9B

	ld b, 1
	call UnknownCall_3D22
	call UnknownCall_3CF1
	ld a, [$FF00+$E9]
	dec a
	ld [$FF00+$E9], a
	ret nz
	ld a, 3
	ld [$FF00+$DF], a
	ld a, [$FF00+$E0]
	ld [$FF00+$E9], a
	ret

UnknownData_58EBE:
INCBIN "baserom.gb", $58EBE, $58EC8 - $58EBE

	ld b, 1
	call UnknownCall_3D3D
	call UnknownCall_3CDF
	ld a, [$FF00+$E8]
	dec a
	ld [$FF00+$E8], a
	ret nz
	ld a, [$FF00+$E0]
	ld [$FF00+$E8], a
	ld a, [$FF00+$DD]
	and a
	jr nz, UnknownRJump_58EE4
	ld a, 4
	ld [$FF00+$DF], a
	ret

UnknownRJump_58EE4:
UnknownData_58EE4:
INCBIN "baserom.gb", $58EE4, $58EE9 - $58EE4

	ld b, 1
	call UnknownCall_3D32
	call UnknownCall_3CC0
	ld a, [$FF00+$E9]
	dec a
	ld [$FF00+$E9], a
	ret nz
	ld a, [$FF00+$E0]
	ld [$FF00+$E9], a
	ld a, [$FF00+$DD]
	and a
	jr nz, UnknownRJump_58F05
	ld a, 5
	ld [$FF00+$DF], a
	ret

UnknownRJump_58F05:
UnknownData_58F05:
INCBIN "baserom.gb", $58F05, $58F0A - $58F05

	ld b, 1
	call UnknownCall_3D2D
	call UnknownCall_3D10
	ld a, [$FF00+$E8]
	dec a
	ld [$FF00+$E8], a
	ret nz
	ld a, [$FF00+$E0]
	ld [$FF00+$E8], a
	ld a, [$FF00+$DD]
	and a
	jr nz, UnknownRJump_58F26
	ld a, 6
	ld [$FF00+$DF], a
	ret

UnknownRJump_58F26:
UnknownData_58F26:
INCBIN "baserom.gb", $58F26, $58F2B - $58F26

	ld b, 1
	call UnknownCall_3D22
	call UnknownCall_3CF1
	ld a, [$FF00+$E9]
	dec a
	ld [$FF00+$E9], a
	ret nz

UnknownData_58F39:
INCBIN "baserom.gb", $58F39, $58F4C - $58F39

	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_58F5D
	call UnknownCall_5B3C6
	ld a, 77
	ld [$FF00+$E2], a
	ld a, 16
	ld [$FF00+$DE], a
	ret

UnknownRJump_58F5D:
	dec a
	rst $28

UnknownData_58F5F:
INCBIN "baserom.gb", $58F5F, $58F69 - $58F5F

	call UnknownCall_5B54C
	ld a, [$FF00+$F0]
	and $01
	jr nz, UnknownRJump_58FA5
	ld b, 1
	call UnknownCall_3D22
	call UnknownCall_3C1C
	ld a, [$AF2F]
	bit 4, a
	ret z

UnknownRJump_58F80:
	ld a, 5
	ld [$FF00+$DF], a
	ld a, 88
	ld [$FF00+$DB], a
	xor a
	ld [$FF00+$EA], a
	ret

UnknownData_58F8C:
INCBIN "baserom.gb", $58F8C, $58FA5 - $58F8C


UnknownRJump_58FA5:
	call UnknownCall_3B40
	ld a, [$AF2F]
	bit 6, a
	ret nz
	jr UnknownRJump_58F80
	call UnknownCall_5B521
	ld b, 1
	call UnknownCall_3D2D
	ld a, [$FF00+$E8]
	inc a
	ld [$FF00+$E8], a
	cp 40
	ret nz

UnknownData_58FC0:
INCBIN "baserom.gb", $58FC0, $5902D - $58FC0

	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_59078

UnknownJump_59032:
	xor a
	ld [$FF00+$E2], a
	ld [$FF00+$DD], a
	ld a, 16
	ld [$FF00+$DE], a
	call UnknownCall_59136
	ld a, [$AF3E]
	and a
	ret nz
	ld d, 0
	ld hl, $5082
	add de
	ld a, [hl]
	bit 7, a
	jr z, UnknownRJump_59056
	cpl
	inc a
	ld b, a
	call UnknownCall_3D2D
	jr UnknownRJump_5905A

UnknownRJump_59056:
	ld b, a
	call UnknownCall_3D3D

UnknownRJump_5905A:
	ld hl, $508A
	add de
	ld a, [hl]
	bit 7, a
	jr z, UnknownRJump_5906B
	cpl
	inc a
	ld b, a
	call UnknownCall_3D22
	jr UnknownRJump_5906F

UnknownRJump_5906B:
	ld b, a
	call UnknownCall_3D32

UnknownRJump_5906F:
	ld a, 3
	ld [$FF00+$DF], a
	ld a, 48
	ld [$FF00+$EC], a
	ret

UnknownRJump_59078:
	dec a
	rst $28

UnknownData_5907A:
INCBIN "baserom.gb", $5907A, $59092 - $5907A

	call UnknownCall_5B518
	ld a, [$FF00+$F0]
	and $03
	ret nz
	call UnknownCall_590E9
	ld a, 3
	sub b
	ld b, a
	call UnknownCall_3D22
	call UnknownCall_5B3C6
	ret
	call UnknownCall_5B518
	ld a, [$FF00+$F0]
	and $03
	ret nz
	call UnknownCall_590E9
	ld a, 3
	sub b
	ld b, a
	call UnknownCall_3D32
	call UnknownCall_5B3C6
	ret
	call UnknownCall_5B511
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 4
	ld [$FF00+$DF], a
	ld a, 82
	ld [$FF00+$E2], a
	ld a, 110
	ld [$FF00+$DB], a
	ld a, 24
	ld [$FF00+$EC], a
	ret
	call UnknownCall_5B51A
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	call UnknownCall_5B3C6
	ld a, 8
	ld [$FF00+$E8], a
	ret

UnknownCall_590E9:
	call UnknownCall_5B41A
	ld hl, $FFE8
	ld a, [$AF2C]
	inc a
	jr z, UnknownRJump_59100
	ld hl, $FFE8
	ld a, [hl]
	cp 16
	jr z, UnknownRJump_5910A
	inc [hl]
	jr UnknownRJump_59105

UnknownRJump_59100:
	ld a, [hl]
	and a
	jr z, UnknownRJump_59116
	dec [hl]

UnknownRJump_59105:
	ld a, [hl]
	cp 8
	jr c, UnknownRJump_59116

UnknownRJump_5910A:
	ld e, a
	ld d, 0
	ld hl, $5125
	add de
	ld b, [hl]
	call UnknownCall_3D3D
	ret

UnknownRJump_59116:
	ld e, a
	ld d, 0
	ld hl, $5125
	add de
	ld a, [hl]
	cpl
	inc a
	ld b, a
	call UnknownCall_3D2D
	ret

UnknownData_59125:
INCBIN "baserom.gb", $59125, $59136 - $59125


UnknownCall_59136:
	ld hl, $AF4E
	xor a
	ld [hl], a
	ld a, [$FF04]
	and $07
	ld e, a
	ld [$AF4F], a
	ld d, a
	inc d
	ld a, 8
	ld b, a
	sub e
	ld c, a
	ld a, [$FF00+$EF]

UnknownRJump_5914D:
	rrca
	inc [hl]
	dec d
	jr nz, UnknownRJump_5914D
	jr nc, UnknownRJump_59166

UnknownData_59154:
INCBIN "baserom.gb", $59154, $59166 - $59154


UnknownRJump_59166:
	dec b
	set 7, a
	ld d, a
	ld a, b
	add c
	ld b, a
	ld a, d

UnknownRJump_5916E:
	rrca
	inc [hl]
	dec b
	jr nz, UnknownRJump_5916E
	ld [$FF00+$EF], a
	ld a, e
	and $07
	ld e, a
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_59189
	ld a, 16
	ld [$FF00+$DE], a
	call UnknownCall_5B31D
	jp UnknownJump_581B9

UnknownJump_59189:
UnknownRJump_59189:
	dec a
	rst $28

UnknownData_5918B:
INCBIN "baserom.gb", $5918B, $5918F - $5918B

	call UnknownCall_5B451
	call UnknownCall_3D3D
	ld a, [$FF00+$D9]
	cp 160
	ret c
	ld a, [$FF00+$D5]
	dec a
	ld [$FF00+$D5], a
	call UnknownCall_5B2BF
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_591CC
	call UnknownCall_5B511
	ld a, 32
	ld [$FF00+$E2], a
	ld a, 16
	ld [$FF00+$DE], a
	ld a, [$FF00+$E7]
	bit 6, a
	ret z
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 96
	ld [$FF00+$E8], a
	ld [$FF00+$E9], a
	ld a, 98
	ld [$FF00+$DB], a
	ld a, 22
	ld [$A470], a
	ret

UnknownRJump_591CC:
	dec a
	rst $28

UnknownData_591CE:
INCBIN "baserom.gb", $591CE, $591D2 - $591CE

	call UnknownCall_5B5B6
	jp UnknownJump_58E38
	call UnknownCall_5B5B6
	jp UnknownJump_58E57
	call UnknownCall_5B5B6
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_591EF
	ld a, 77
	ld [$FF00+$E2], a
	ld a, 1
	ld [$FF00+$DF], a
	ret

UnknownRJump_591EF:
	dec a
	rst $28

UnknownData_591F1:
INCBIN "baserom.gb", $591F1, $591F3 - $591F1

	ld b, 1
	call UnknownCall_3D22
	ret
	call UnknownCall_5B521
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_5920D
	ld a, 86
	ld [$FF00+$E2], a
	ld a, 16
	ld [$FF00+$DE], a
	call UnknownCall_5B407
	ret

UnknownRJump_5920D:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_59216:
INCBIN "baserom.gb", $59216, $5921E - $59216

	call UnknownCall_5B481
	call UnknownCall_3D2D

UnknownRJump_59224:
	ld a, [$FF00+$E0]
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$DF]
	add 2
	ld [$FF00+$DF], a
	ret
	call UnknownCall_5B481
	call UnknownCall_3D3D
	jr UnknownRJump_59224
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_59243

UnknownData_5923F:
INCBIN "baserom.gb", $5923F, $59243 - $5923F


UnknownRJump_59243:
	call UnknownCall_5B449
	call UnknownCall_3D3D

UnknownRJump_59249:
	ld a, [$FF00+$E0]
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$DF]
	cp 4
	jr z, UnknownRJump_5925A
	dec a
	ld [$FF00+$DF], a
	ret

UnknownRJump_5925A:
	ld a, 1
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_59268

UnknownData_59264:
INCBIN "baserom.gb", $59264, $59268 - $59264


UnknownRJump_59268:
	call UnknownCall_5B449
	call UnknownCall_3D2D
	jr UnknownRJump_59249
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_59285
	ld a, 32
	ld [$FF00+$E2], a
	ld a, 16
	ld [$FF00+$DE], a
	call UnknownCall_5B3C6
	ld a, 20
	ld [$FF00+$E8], a
	ret

UnknownRJump_59285:
	call UnknownCall_5B5B6
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_5928C:
INCBIN "baserom.gb", $5928C, $59298 - $5928C

	ld a, [$FF00+$E8]
	ld c, a
	ld b, 1
	call UnknownCall_3D22
	call UnknownCall_3CF1
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld b, 1
	call UnknownCall_3D3D
	call UnknownCall_3CDF
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, 3
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$E8]
	ld c, a
	ld b, 1
	call UnknownCall_3D32
	call UnknownCall_3CC0
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld b, 1
	call UnknownCall_3D3D
	call UnknownCall_3CDF
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, 5
	ld [$FF00+$DF], a
	ret
	ld b, 1
	call UnknownCall_3D2D
	call UnknownCall_3D10

UnknownRJump_592EE:
	ld a, [$FF00+$E8]
	add a
	ld c, a
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	bit 0, a
	ret nz
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a
	ret
	ld b, 1
	call UnknownCall_3D32
	call UnknownCall_3CC0
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld b, 1
	call UnknownCall_3D3D
	call UnknownCall_3CDF
	jr UnknownRJump_592EE
	ld b, 1
	call UnknownCall_3D22
	call UnknownCall_3CF1
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld b, 1
	call UnknownCall_3D3D
	call UnknownCall_3CDF
	ld a, [$FF00+$E8]
	add a
	ld c, a
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	cp c
	ret nz

UnknownData_59342:
INCBIN "baserom.gb", $59342, $5934A - $59342

	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_59352
	jp UnknownJump_59032

UnknownRJump_59352:
	dec a
	rst $28

UnknownData_59354:
INCBIN "baserom.gb", $59354, $5935C - $59354

	call UnknownCall_5B511
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 4
	ld [$FF00+$DF], a

UnknownJump_59369:
	ld a, 82
	ld [$FF00+$E2], a
	ld a, 112
	ld [$FF00+$DB], a
	ld a, 48
	ld [$FF00+$EC], a
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_5938C
	xor a
	ld [$FF00+$E2], a
	ld a, 16
	ld [$FF00+$DE], a
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 1
	ld [$A478], a
	ret

UnknownRJump_5938C:
	dec a
	rst $28

UnknownData_5938E:
INCBIN "baserom.gb", $5938E, $59394 - $5938E

	call UnknownCall_3B40
	ld a, [$AF2F]
	bit 6, a
	jr nz, UnknownRJump_593A5
	call UnknownCall_5B451
	call UnknownCall_3D3D
	ret

UnknownRJump_593A5:
	ld a, 2
	ld [$FF00+$DF], a
	ld a, 128
	ld [$FF00+$EC], a
	ret
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 3
	ld [$FF00+$DF], a
	ld a, 64
	ld [$FF00+$EC], a
	call UnknownCall_5B539
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 62
	ld [$FF00+$D5], a
	call UnknownCall_3AA0
	call UnknownCall_5B3C6
	ld a, 8
	ld [$FF00+$E8], a
	ld a, 16
	ld [$FF00+$DE], a
	jp UnknownJump_59369
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_593F2
	ld a, 16
	ld [$FF00+$DE], a
	ld a, 72
	ld [$FF00+$E2], a
	call UnknownCall_5B4B4
	cp 48
	ret nc
	ld a, 1
	ld [$FF00+$DF], a
	ret

UnknownRJump_593F2:
	dec a
	rst $28

UnknownData_593F4:
INCBIN "baserom.gb", $593F4, $593F8 - $593F4

	call UnknownCall_5B518

UnknownJump_593FB:
	call UnknownCall_3B40
	ld a, [$AF2F]
	bit 6, a
	jr nz, UnknownRJump_5940D
	call UnknownCall_5B451
	inc b
	call UnknownCall_3D3D
	ret

UnknownRJump_5940D:
	xor a
	ld [$FF00+$E0], a
	ld a, 2
	ld [$FF00+$DF], a
	ld a, 10
	ld [$A470], a
	ret
	call UnknownCall_5B51A
	call UnknownCall_3B7C
	ld a, [$AF2F]
	bit 4, a
	jr nz, UnknownRJump_5942D
	ld b, 1
	call UnknownCall_3D2D
	ret

UnknownRJump_5942D:
	xor a
	ld [$FF00+$DF], a
	ret
	call UnknownCall_5B511
	ld a, [$FF00+$DF]
	dec a
	jp z, UnknownJump_582FB
	dec a
	jp z, UnknownJump_5831A
	call UnknownCall_3B40
	ld a, [$AF2F]
	bit 6, a
	jr nz, UnknownRJump_5944F

UnknownData_59448:
INCBIN "baserom.gb", $59448, $5944F - $59448


UnknownRJump_5944F:
	xor a
	ld [$FF00+$E0], a
	call UnknownCall_5B3C6
	ld a, 77
	ld [$FF00+$E2], a
	ret
	call UnknownCall_5B511
	ld a, [$FF00+$DF]
	dec a
	jp z, UnknownJump_582FB
	dec a
	jp z, UnknownJump_5831A
	ld a, 16
	ld [$FF00+$DE], a
	call UnknownCall_3B40
	ld a, [$AF2F]
	bit 6, a
	jr nz, UnknownRJump_5947C

UnknownData_59475:
INCBIN "baserom.gb", $59475, $5947C - $59475


UnknownRJump_5947C:
	xor a
	ld [$FF00+$E0], a
	call UnknownCall_5B3C6
	ld a, 72
	ld [$FF00+$E2], a
	ret
	call UnknownCall_5B5DF
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_5949E
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 77
	ld [$FF00+$E2], a
	ld a, 128
	ld [$FF00+$DC], a
	ld [$FF00+$EC], a
	ret

UnknownRJump_5949E:
	dec a
	rst $28

UnknownData_594A0:
INCBIN "baserom.gb", $594A0, $594A4 - $594A0

	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_594AD
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_594AD:
UnknownData_594AD:
INCBIN "baserom.gb", $594AD, $594EB - $594AD

	call UnknownCall_5B585
	ld a, [$FF00+$DF]
	and a
	jp nz, UnknownJump_582F5
	ld a, 82
	ld [$FF00+$E2], a
	jp UnknownJump_582DD
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_5950C
	xor a
	ld [$FF00+$E2], a
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 48
	ld [$FF00+$EC], a
	ret

UnknownRJump_5950C:
	dec a
	rst $28

UnknownData_5950E:
INCBIN "baserom.gb", $5950E, $59512 - $5950E

	call UnknownCall_5B521
	call UnknownCall_5B68B
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 2
	ld [$FF00+$DF], a
	ld a, 16
	ld [$FF00+$DE], a
	ld a, 72
	ld [$FF00+$E2], a
	ld a, 130
	ld [$FF00+$DB], a
	ld a, 13
	ld [$A470], a
	ret
	call UnknownCall_5B5A6
	ld a, [$FF00+$DB]
	cp 132
	ret nz
	ld a, 1
	ld [$AF26], a
	call UnknownCall_5B2D7
	ret
	ld a, [$FF00+$F0]
	and $03
	ret nz
	call UnknownCall_5B3E0
	ld hl, $A22B
	ld a, [$AF2C]
	cp [hl]
	jr nz, UnknownRJump_5957F
	ld a, [$FF00+$DF]
	dec a
	jr z, UnknownRJump_59587
	dec a
	jr z, UnknownRJump_5959D
	ld a, 13
	ld [$FF00+$DB], a
	ld a, 32
	ld [$FF00+$DD], a
	ld a, [$AF2C]
	cp 1
	jr z, UnknownRJump_59572
	xor a
	ld [$FF00+$DD], a
	ld a, 2

UnknownRJump_59572:
	ld [$FF00+$DF], a
	ld a, 8
	ld [$FF00+$E8], a
	ld [$FF00+$E9], a
	ld a, 72
	ld [$FF00+$E2], a
	ret

UnknownRJump_5957F:
	ld a, 14
	ld [$FF00+$DB], a
	xor a
	ld [$FF00+$DF], a
	ret

UnknownRJump_59587:
	call UnknownCall_590E9
	ld a, [$FF00+$E9]
	ld e, a
	ld d, 0
	ld b, 1
	call UnknownCall_3D32
	ld hl, $FFE9
	ld a, [hl]
	cp 16
	ret z
	inc [hl]
	ret

UnknownRJump_5959D:
	call UnknownCall_590E9
	ld a, [$FF00+$E9]
	ld e, a
	ld d, 0
	ld b, 1
	call UnknownCall_3D22
	ld hl, $FFE9
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_595CF
	ld a, 72
	ld [$FF00+$E2], a
	call UnknownCall_5B4B4
	cp 56
	ret nc
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 16
	ld [$FF00+$EC], a
	ld a, 21
	ld [$A470], a
	ret

UnknownRJump_595CF:
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_595D3:
INCBIN "baserom.gb", $595D3, $595D7 - $595D3

	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	jr z, UnknownRJump_595F0
	ld b, 3
	ld a, [$FF00+$E9]
	xor $01
	ld [$FF00+$E9], a
	jr nz, UnknownRJump_595EC
	call UnknownCall_3D22
	ret

UnknownRJump_595EC:
	call UnknownCall_3D32
	ret

UnknownRJump_595F0:
	ld a, 2
	ld [$FF00+$DF], a
	ret
	call UnknownCall_5B451
	sla b
	call UnknownCall_3D3D
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_59619
	ld a, 72
	ld [$FF00+$E2], a
	ld a, 1
	ld [$FF00+$DF], a
	ld b, 4
	call UnknownCall_3D22
	ld a, 64
	ld [$FF00+$E8], a
	ld a, 32
	ld [$FF00+$EC], a
	ret

UnknownRJump_59619:
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_5961D:
INCBIN "baserom.gb", $5961D, $59621 - $5961D

	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_59633
	call UnknownCall_5B68B
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 16
	ld [$FF00+$DE], a

UnknownRJump_59633:
	ld b, 2
	call UnknownCall_3D3D
	ld a, [$FF00+$E8]
	sub b
	ld [$FF00+$E8], a
	ret nz

UnknownRJump_5963E:
	ld a, 64
	ld [$FF00+$E8], a
	ld a, 32
	ld [$FF00+$EC], a
	ld a, [$FF00+$DF]
	xor $03
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_5965F
	call UnknownCall_5B68B
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 16
	ld [$FF00+$DE], a

UnknownRJump_5965F:
	ld b, 2
	call UnknownCall_3D2D
	ld a, [$FF00+$E8]
	sub b
	ld [$FF00+$E8], a
	ret nz
	jr UnknownRJump_5963E

UnknownData_5966C:
INCBIN "baserom.gb", $5966C, $596D9 - $5966C

	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_596E6
	ld a, 77
	ld [$FF00+$E2], a
	call UnknownCall_5B3C6
	ret

UnknownRJump_596E6:
	dec a
	rst $28

UnknownData_596E8:
INCBIN "baserom.gb", $596E8, $596EE - $596E8

	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_596F7
	dec a
	ld [$FF00+$EC], a
	ret nz

UnknownRJump_596F7:
	ld a, 43
	ld [$FF00+$DB], a
	ld a, 44
	ld [$AF37], a
	ld a, [$FF00+$DD]
	ld [$AF38], a
	ld a, 82
	ld [$AF36], a
	call UnknownCall_5B36D
	ld a, 16
	ld [$FF00+$EC], a
	ld a, 3
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 42
	ld [$FF00+$DB], a
	call UnknownCall_5B3C6
	ld a, 96
	ld [$FF00+$EC], a
	ret
	ld a, [$FF00+$DF]
	dec a
	jr z, UnknownRJump_5973D
	dec a
	jr z, UnknownRJump_59750
	ld a, 77
	ld [$FF00+$E2], a
	call UnknownCall_3CB1
	ld a, 11
	ld [$A478], a
	ret

UnknownRJump_5973D:
	call UnknownCall_5B5B6
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld b, 2
	call UnknownCall_3D22
	ld b, 1
	call UnknownCall_3D2D
	ret

UnknownRJump_59750:
	call UnknownCall_5B5B6
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld b, 2
	call UnknownCall_3D32
	ld b, 1
	call UnknownCall_3D2D
	ret
	call UnknownCall_5B57E
	ld a, [$FF00+$DF]
	and a
	jp nz, UnknownJump_58215
	call UnknownCall_5B3C6
	ld a, 77
	ld [$FF00+$E2], a
	ret
	ld a, [$FF00+$DF]
	dec a
	jr z, UnknownRJump_59795
	dec a
	jr z, UnknownRJump_597A9
	dec a
	jr z, UnknownRJump_59788
	ld a, 77
	ld [$FF00+$E2], a
	ld a, 3
	ld [$FF00+$DF], a
	ret

UnknownRJump_59788:
	call UnknownCall_5B678
	call UnknownCall_5B4B4
	cp 48
	ret nc
	call UnknownCall_5B3C6
	ret

UnknownRJump_59795:
	call UnknownCall_5B585
	call UnknownCall_3C58
	ld a, [$AF2F]
	bit 4, a
	jp nz, UnknownJump_59D2D
	ld b, 2
	call UnknownCall_3D22
	ret

UnknownRJump_597A9:
	call UnknownCall_5B585
	call UnknownCall_3BF4
	ld a, [$AF2F]
	bit 0, a
	jp nz, UnknownJump_59D2D
	ld b, 2
	call UnknownCall_3D32
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_597D2
	ld a, 72
	ld [$FF00+$E2], a
	call UnknownCall_5B3C6
	ld a, 1
	ld [$FF00+$E8], a
	ld a, 1
	ld [$FF00+$E9], a
	ret

UnknownRJump_597D2:
	call UnknownCall_5B57E
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_597DE:
INCBIN "baserom.gb", $597DE, $597EE - $597DE

	call UnknownCall_598CE
	ld hl, $594E
	call UnknownCall_5990E
	ld hl, $FFE9
	inc [hl]
	ld a, [hl]
	cp 21
	ret nz
	ld [hl], 1
	ld a, 3
	ld [$FF00+$DF], a
	ret
	call UnknownCall_598F5
	ld hl, $5964
	call UnknownCall_5990E
	ld hl, $FFE9
	inc [hl]
	ld a, [hl]
	cp 21
	ret nz
	ld [hl], 1
	ld a, 5
	ld [$FF00+$DF], a
	xor a
	ld [$FF00+$EA], a
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a
	ret
	call UnknownCall_59919
	ld hl, $5990
	call UnknownCall_598EA
	ld hl, $FFE9
	inc [hl]
	ld a, [hl]
	cp 21
	ret nz

UnknownData_59838:
INCBIN "baserom.gb", $59838, $598CE - $59838


UnknownCall_598CE:
	ld hl, $5938
	call UnknownCall_598DF
	ld hl, $FFE8
	inc [hl]
	ld a, [hl]
	cp 21
	ret nz
	ld [hl], 20
	ret

UnknownCall_598DF:
	ld a, [$FF00+$E8]
	ld e, a
	ld d, 0
	add de
	ld b, [hl]
	call UnknownCall_3D2D
	ret

UnknownCall_598EA:
	ld a, [$FF00+$E9]
	ld e, a
	ld d, 0
	add de
	ld b, [hl]
	call UnknownCall_3D32
	ret

UnknownCall_598F5:
	ld hl, $5938
	call UnknownCall_59903
	ld hl, $FFE8
	dec [hl]
	ret nz
	ld [hl], 1
	ret

UnknownCall_59903:
	ld a, [$FF00+$E8]
	ld e, a
	ld d, 0
	add de
	ld b, [hl]
	call UnknownCall_3D3D
	ret

UnknownCall_5990E:
	ld a, [$FF00+$E9]
	ld e, a
	ld d, 0
	add de
	ld b, [hl]
	call UnknownCall_3D22
	ret

UnknownCall_59919:
	ld hl, $597A
	call UnknownCall_59903
	ld hl, $FFE8
	inc [hl]
	ld a, [hl]
	cp 21
	ret nz

UnknownData_59927:
INCBIN "baserom.gb", $59927, $599A6 - $59927

	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_599B4
	ld a, 77
	ld [$FF00+$E2], a
	ld a, 5
	ld [$FF00+$DF], a
	ret

UnknownRJump_599B4:
	dec a
	rst $28

UnknownData_599B6:
INCBIN "baserom.gb", $599B6, $599C4 - $599B6

	ld b, 2
	call UnknownCall_3D2D
	ld a, [$FF00+$E8]
	add b
	ld [$FF00+$E8], a
	cp 64
	ret nz
	ld a, 9
	ld [$FF00+$E8], a
	ld a, 6
	ld [$FF00+$DF], a
	ret
	ld b, 3
	call UnknownCall_3D3D
	ld a, [$FF00+$E8]
	sub b
	ld [$FF00+$E8], a
	ret nz
	ld a, 7
	ld [$FF00+$DF], a
	ld a, 151
	ld [$FF00+$DB], a
	ret
	call UnknownCall_5B465
	call UnknownCall_3D3D
	ld a, [$FF00+$E0]
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	call UnknownCall_5B3C6
	ret

UnknownRJump_599FF:
	xor a
	ld [$FF00+$E8], a
	ld [$FF00+$E9], a
	ld [$FF00+$E0], a
	ld a, 5
	ld [$FF00+$DF], a
	ld a, 150
	ld [$FF00+$DB], a
	ret
	ld hl, $5A9D
	call UnknownCall_5B33E
	call UnknownCall_3D22
	ld a, [$FF00+$E9]
	inc a
	ld [$FF00+$E9], a

UnknownRJump_59A1D:
	call UnknownCall_3B40
	ld a, [$AF2F]
	bit 6, a
	jr nz, UnknownRJump_599FF
	ld hl, $5A8D
	call UnknownCall_5B33A
	call UnknownCall_3D3D
	ld a, [$FF00+$E8]
	inc a
	ld [$FF00+$E8], a
	cp 16
	ret nz
	xor a
	ld [$FF00+$E8], a
	ld hl, $FFDF
	ld a, [hl]
	cp 3
	jr nc, UnknownRJump_59A4B
	add 2
	ld [hl], a
	ld hl, $FFE9
	dec [hl]
	ret

UnknownRJump_59A4B:
	cp 4
	jr z, UnknownRJump_59A55
	dec [hl]
	ld hl, $FFE9
	inc [hl]
	ret

UnknownRJump_59A55:
	ld a, 1
	ld [hl], a
	ld hl, $FFE9
	inc [hl]
	ret
	ld hl, $5A9D
	call UnknownCall_5B33E
	call UnknownCall_3D32
	ld a, [$FF00+$E9]
	inc a
	ld [$FF00+$E9], a
	jr UnknownRJump_59A1D
	ld hl, $5A9D
	call UnknownCall_5B33E
	call UnknownCall_3D32
	ld a, [$FF00+$E9]
	dec a
	ld [$FF00+$E9], a
	jr UnknownRJump_59A1D
	ld hl, $5A9D
	call UnknownCall_5B33E
	call UnknownCall_3D22
	ld a, [$FF00+$E9]
	dec a
	ld [$FF00+$E9], a
	jr UnknownRJump_59A1D

UnknownData_59A8D:
INCBIN "baserom.gb", $59A8D, $59AAD - $59A8D

	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_59ABA
	call UnknownCall_5B3C6
	ld a, 72
	ld [$FF00+$E2], a
	ret

UnknownRJump_59ABA:
	call UnknownCall_5B511
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_59AC6:
INCBIN "baserom.gb", $59AC6, $59ACA - $59AC6

	ld b, 1
	call UnknownCall_3D22
	jr UnknownRJump_59AD6
	ld b, 1
	call UnknownCall_3D32

UnknownRJump_59AD6:
	ld a, [$FF00+$E8]
	dec a
	jr z, UnknownRJump_59AE9
	dec a
	jr z, UnknownRJump_59AF1
	dec a
	jr z, UnknownRJump_59AF9
	call UnknownCall_5B46C
	call UnknownCall_3D2D
	jr UnknownRJump_59AFF

UnknownRJump_59AE9:
	call UnknownCall_5B445
	call UnknownCall_3D3D
	jr UnknownRJump_59AFF

UnknownRJump_59AF1:
	call UnknownCall_5B46C
	call UnknownCall_3D3D
	jr UnknownRJump_59AFF

UnknownRJump_59AF9:
	call UnknownCall_5B445
	call UnknownCall_3D2D

UnknownRJump_59AFF:
	ld a, [$FF00+$E0]
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$E8]
	inc a
	and $03
	ld [$FF00+$E8], a
	ret
	call UnknownCall_5B678
	ld a, [$FF00+$DF]
	and a
	jp nz, UnknownJump_58642
	call UnknownCall_5B3C6
	ld a, 77
	ld [$FF00+$E2], a
	ret
	call UnknownCall_5B51A
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_59B2F
	call UnknownCall_5B3C6
	ld a, 77
	ld [$FF00+$E2], a
	ret

UnknownRJump_59B2F:
	dec a
	rst $28

UnknownData_59B31:
INCBIN "baserom.gb", $59B31, $59B35 - $59B31

	ld a, [$FF00+$F0]
	and $01
	jr nz, UnknownRJump_59B73
	ld b, 2
	call UnknownCall_3D22
	call UnknownCall_3C1C
	ld a, [$AF2F]
	bit 4, a
	ret z

UnknownData_59B49:
INCBIN "baserom.gb", $59B49, $59B54 - $59B49

	ld a, [$FF00+$F0]
	and $01
	jr nz, UnknownRJump_59B73
	ld b, 2
	call UnknownCall_3D32
	call UnknownCall_3BB8
	ld a, [$AF2F]
	bit 0, a
	ret z

UnknownData_59B68:
INCBIN "baserom.gb", $59B68, $59B73 - $59B68


UnknownRJump_59B73:
	ld a, [$FF00+$E8]
	dec a
	jr z, UnknownRJump_59B94
	call UnknownCall_5B46C
	ld a, [$FF00+$E0]
	cp c
	jr z, UnknownRJump_59B8C
	call UnknownCall_3D2D
	call UnknownCall_3B7C
	ld a, [$AF2F]
	bit 4, a
	ret z

UnknownRJump_59B8C:
	xor a
	ld [$FF00+$E0], a
	ld a, 1
	ld [$FF00+$E8], a
	ret

UnknownRJump_59B94:
	call UnknownCall_5B451
	call UnknownCall_3D3D
	call UnknownCall_3B40
	ld a, [$AF2F]
	bit 6, a
	ret z
	xor a
	ld [$FF00+$E0], a
	ld [$FF00+$E8], a
	ld a, [$FF00+$DF]
	xor $03
	ld [$FF00+$DF], a
	ret
	call UnknownCall_5B57E
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_59BBF
	ld a, 77
	ld [$FF00+$E2], a
	call UnknownCall_5B3C6
	ret

UnknownRJump_59BBF:
	dec a
	rst $28

UnknownData_59BC1:
INCBIN "baserom.gb", $59BC1, $59BC5 - $59BC1

	call UnknownCall_5B585
	ld a, [$FF00+$DF]
	rst $28

UnknownData_59BCB:
INCBIN "baserom.gb", $59BCB, $59BD1 - $59BCB

	ld a, 16
	ld [$FF00+$DE], a
	ld a, 78
	ld [$FF00+$E2], a
	call UnknownCall_5B3C6
	ld a, 1
	ld [$FF00+$EC], a
	ret
	ld a, [$FF00+$DF]
	rst $28

UnknownData_59BE4:
INCBIN "baserom.gb", $59BE4, $59BE8 - $59BE4

	ld a, 16
	ld [$FF00+$DE], a
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 32
	ld [$FF00+$EC], a
	ret
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 1
	ld [$AF26], a
	call UnknownCall_5B2D7
	ret

UnknownJump_59C04:
	ld a, [$FF00+$D5]
	rst $28

UnknownData_59C07:
INCBIN "baserom.gb", $59C07, $59CE7 - $59C07

	call UnknownCall_5B51A
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_59CFF
	ld a, 16
	ld [$FF00+$DE], a
	ld a, 76
	ld [$FF00+$E2], a
	call UnknownCall_5B3C6
	ld a, 1
	ld [$FF00+$EC], a
	ret

UnknownRJump_59CFF:
	dec a
	rst $28

UnknownData_59D01:
INCBIN "baserom.gb", $59D01, $59D05 - $59D01

	call UnknownCall_3C1C
	ld a, [$AF2F]
	bit 4, a
	jr nz, UnknownRJump_59D2D
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_59D1D
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 48
	ld [$FF00+$E9], a
	ret

UnknownRJump_59D1D:
	ld b, 1
	call UnknownCall_3D22

UnknownRJump_59D22:
	ld a, [$FF00+$E9]
	dec a
	ld [$FF00+$E9], a
	ret nz
	ld a, 16
	ld [$FF00+$EC], a
	ret

UnknownJump_59D2D:
UnknownRJump_59D2D:
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a

UnknownJump_59D33:
	ld a, [$FF00+$DF]
	xor $03
	ld [$FF00+$DF], a
	ret

UnknownJump_59D3A:
	ld b, 1
	call UnknownCall_3D32
	jr UnknownRJump_59D22
	call UnknownCall_3BB8
	ld a, [$AF2F]
	bit 0, a
	jr nz, UnknownRJump_59D2D
	ld a, [$FF00+$EC]
	and a
	jp z, UnknownJump_59D3A
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 48
	ld [$FF00+$E9], a
	ret
	call UnknownCall_5B51A
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_59D6E
	ld a, 16
	ld [$FF00+$DE], a
	ld a, 72
	ld [$FF00+$E2], a
	call UnknownCall_5B3C6
	ret

UnknownRJump_59D6E:
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_59D72:
INCBIN "baserom.gb", $59D72, $59D7A - $59D72

	call UnknownCall_3C44
	ld a, [$AF2F]
	bit 4, a
	jr nz, UnknownRJump_59D2D
	ld b, 1
	call UnknownCall_3D22
	jr UnknownRJump_59D9B
	call UnknownCall_3BE0
	ld a, [$AF2F]
	bit 0, a
	jp nz, UnknownJump_59D2D
	ld b, 1
	call UnknownCall_3D32

UnknownRJump_59D9B:
	call UnknownCall_5B4B4
	cp 36
	ret nc
	ld a, [$FF00+$DF]
	add 2
	ld [$FF00+$DF], a
	ret
	call UnknownCall_3C44
	ld a, [$AF2F]
	bit 4, a
	jr nz, UnknownRJump_59DF9
	ld a, [$FF00+$E9]
	and a
	jr nz, UnknownRJump_59DBF
	call UnknownCall_5B449
	call UnknownCall_3D22
	jr UnknownRJump_59DE4

UnknownRJump_59DBF:
	call UnknownCall_5B481
	call UnknownCall_3D22
	jr UnknownRJump_59DE4
	call UnknownCall_3BE0
	ld a, [$AF2F]
	bit 0, a
	jr nz, UnknownRJump_59DF9
	ld a, [$FF00+$E9]
	and a
	jr nz, UnknownRJump_59DDE
	call UnknownCall_5B449
	call UnknownCall_3D32
	jr UnknownRJump_59DE4

UnknownRJump_59DDE:
	call UnknownCall_5B481
	call UnknownCall_3D32

UnknownRJump_59DE4:
	ld a, [$FF00+$E0]
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$E9]
	xor $01
	ld [$FF00+$E9], a
	ret nz
	ld a, [$FF00+$DF]
	sub 2
	ld [$FF00+$DF], a
	ret

UnknownRJump_59DF9:
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a
	ld a, [$FF00+$DF]
	xor $07
	ld [$FF00+$DF], a
	ret
	call UnknownCall_5B51A
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_59E1F
	ld a, 16
	ld [$FF00+$DE], a
	ld a, 76
	ld [$FF00+$E2], a
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 48
	ld [$FF00+$E8], a
	ret

UnknownRJump_59E1F:
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_59E28:
INCBIN "baserom.gb", $59E28, $59E2C - $59E28

	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_59E35
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_59E35:
	ld b, 1
	call UnknownCall_3D2D

UnknownRJump_59E3A:
	ld a, [$FF00+$E8]
	sub b
	ld [$FF00+$E8], a
	ret nz
	ld a, 48
	ld [$FF00+$E8], a
	ld a, 16
	ld [$FF00+$EC], a
	jp UnknownJump_59D33
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_59E54
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_59E54:
	ld b, 1
	call UnknownCall_3D3D
	jr UnknownRJump_59E3A
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_59E70
	ld a, 16
	ld [$FF00+$DE], a
	ld a, 76
	ld [$FF00+$E2], a
	call UnknownCall_5B3C6
	ld a, 48
	ld [$FF00+$E9], a
	ret

UnknownRJump_59E70:
	dec a
	rst $28

UnknownData_59E72:
INCBIN "baserom.gb", $59E72, $59E7A - $59E72

	call UnknownCall_5B51A
	call UnknownCall_3C1C
	ld a, [$AF2F]
	bit 4, a
	jp nz, UnknownJump_59D2D
	ld b, 1
	call UnknownCall_3D22

UnknownRJump_59E8D:
	ld a, [$FF00+$E9]
	sub b
	ld [$FF00+$E9], a
	ret nz
	ld a, 48
	ld [$FF00+$E9], a
	ld a, 3
	ld [$FF00+$DF], a
	ld a, 53
	ld [$FF00+$DB], a
	ret
	call UnknownCall_5B51A
	call UnknownCall_3BB8
	ld a, [$AF2F]
	bit 0, a
	jp nz, UnknownJump_59D2D
	ld b, 1
	call UnknownCall_3D32
	jr UnknownRJump_59E8D
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$FF00+$DB]
	cp 55
	jr z, UnknownRJump_59EC4
	inc a
	ld [$FF00+$DB], a
	ret

UnknownRJump_59EC4:
	call UnknownCall_3B7C
	ld a, [$AF2F]
	bit 4, a
	jr nz, UnknownRJump_59EDB
	ld b, 1
	call UnknownCall_3D2D
	ld a, [$FF00+$E8]
	add b
	ld [$FF00+$E8], a
	cp 32
	ret nz

UnknownRJump_59EDB:
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$FF00+$DB]
	cp 53
	jr z, UnknownRJump_59EF0
	dec a
	ld [$FF00+$DB], a
	ret

UnknownRJump_59EF0:
	ld b, 1
	call UnknownCall_3D3D
	ld a, [$FF00+$E8]
	sub b
	ld [$FF00+$E8], a
	ret nz
	call UnknownCall_5B3C6
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_59F17
	ld a, 16
	ld [$FF00+$DE], a
	ld a, 72
	ld [$FF00+$E2], a
	call UnknownCall_5B4B4
	cp 48
	ret nc
	ld a, 1
	ld [$FF00+$DF], a
	ret

UnknownRJump_59F17:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_59F20:
INCBIN "baserom.gb", $59F20, $59F24 - $59F20

	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_59F2D
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_59F2D:
	ld b, 8
	call UnknownCall_3D3D
	ld a, [$FF00+$DB]
	inc a
	ld [$FF00+$DB], a
	cp 41
	ret nz
	ld a, 8
	ld [$FF00+$EC], a
	jp UnknownJump_59D33
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_59F4A
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_59F4A:
	ld b, 8
	call UnknownCall_3D2D
	ld a, [$FF00+$DB]
	dec a
	ld [$FF00+$DB], a
	cp 37
	ret nz
	ld a, 8
	ld [$FF00+$EC], a
	jp UnknownJump_59D33
	call UnknownCall_5B51A
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_59F76
	ld a, 16
	ld [$FF00+$DE], a
	ld a, 72
	ld [$FF00+$E2], a
	call UnknownCall_5B3C6
	ld a, 48
	ld [$FF00+$E9], a
	ret

UnknownRJump_59F76:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_59F7F:
INCBIN "baserom.gb", $59F7F, $59F83 - $59F7F

	ld b, 2
	call UnknownCall_3D22

UnknownRJump_59F88:
	ld a, [$FF00+$E9]
	sub b
	ld [$FF00+$E9], a
	jr nz, UnknownRJump_59FAA
	ld a, 48
	ld [$FF00+$E9], a
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_59F9D
	ld a, 1
	ld [$FF00+$E8], a
	ret

UnknownRJump_59F9D:
	xor a
	ld [$FF00+$E8], a
	jp UnknownJump_59D2D
	ld b, 2
	call UnknownCall_3D32
	jr UnknownRJump_59F88

UnknownRJump_59FAA:
	ld b, 1
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_59FB5
	call UnknownCall_3D2D
	ret

UnknownRJump_59FB5:
	call UnknownCall_3D3D
	ret
	call UnknownCall_5B57E
	ld a, [$FF00+$DF]
	and a
	jp nz, UnknownJump_58215
	call UnknownCall_5B3C6
	ld a, 16
	ld [$FF00+$DE], a
	ld a, 77
	ld [$FF00+$E2], a
	ret
	call UnknownCall_5B57E
	ld a, [$FF00+$DF]
	and a
	jp nz, UnknownJump_58215
	call UnknownCall_5B3C6
	ld a, 77
	ld [$FF00+$E2], a
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_59FF0
	ld a, 77
	ld [$FF00+$E2], a
	call UnknownCall_5B3C6
	ld a, 24
	ld [$FF00+$EC], a
	ret

UnknownRJump_59FF0:
	dec a
	rst $28

UnknownData_59FF2:
INCBIN "baserom.gb", $59FF2, $59FF8 - $59FF2

	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_5A001
	dec a
	ld [$FF00+$EC], a
	ret nz

UnknownRJump_5A001:
	ld a, 62
	ld [$AF37], a
	ld a, [$FF00+$DD]
	ld [$AF38], a
	ld a, 36
	ld [$AF36], a
	call UnknownCall_5B36D
	ld a, 16
	ld [$FF00+$EC], a
	ld a, 3
	ld [$FF00+$DF], a
	ret
	call UnknownCall_5B57E
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 59
	ld [$FF00+$DB], a
	call UnknownCall_5B3C6
	ld a, 112
	ld [$FF00+$EC], a
	ret
	call UnknownCall_5B5B6
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_5A04F
	ld a, 72
	ld [$FF00+$E2], a
	call UnknownCall_3CB1
	ld b, 16
	ld a, [$FF00+$DD]
	and a
	jr nz, UnknownRJump_5A04B
	call UnknownCall_3D22
	ret

UnknownRJump_5A04B:
UnknownData_5A04B:
INCBIN "baserom.gb", $5A04B, $5A04F - $5A04B


UnknownRJump_5A04F:
	dec a
	rst $28

UnknownData_5A051:
INCBIN "baserom.gb", $5A051, $5A055 - $5A051

	call UnknownCall_3C1C
	ld a, [$AF2F]
	bit 4, a
	jr nz, UnknownRJump_5A066
	ld b, 1
	call UnknownCall_3D22
	jr UnknownRJump_5A07E

UnknownRJump_5A066:
	ld a, 2
	ld [$AF26], a
	call UnknownCall_5B2D7
	ret

UnknownData_5A06F:
INCBIN "baserom.gb", $5A06F, $5A07E - $5A06F


UnknownRJump_5A07E:
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_5A08F
	call UnknownCall_5B465
	call UnknownCall_3D2D
	ld a, [$FF00+$E0]
	cp c
	ret nz
	jr UnknownRJump_5A0A0

UnknownRJump_5A08F:
	call UnknownCall_3B40
	ld a, [$AF2F]
	bit 6, a
	jr nz, UnknownRJump_5A0A0
	call UnknownCall_5B441
	call UnknownCall_3D3D
	ret

UnknownRJump_5A0A0:
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$E8]
	xor $01
	ld [$FF00+$E8], a
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_5A0BB
	ld a, 77
	ld [$FF00+$E2], a
	call UnknownCall_5B3C6
	ld a, 48
	ld [$FF00+$E9], a
	ret

UnknownRJump_5A0BB:
	ld a, [$FF00+$E9]
	dec a
	ld [$FF00+$E9], a
	jr z, UnknownRJump_5A0D5
	ld a, [$FF00+$DF]
	cp 3
	call c, UnknownCall_5B585
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_5A0CD:
INCBIN "baserom.gb", $5A0CD, $5A0D5 - $5A0CD


UnknownRJump_5A0D5:
	ld a, 66
	ld [$FF00+$DB], a
	ld a, 69
	ld [$AF37], a
	ld a, [$FF00+$DD]
	ld [$AF38], a
	ld a, 38
	ld [$AF36], a
	call UnknownCall_5B36D
	ld a, 16
	ld [$FF00+$EC], a
	ld a, [$FF00+$DF]
	add 2
	ld [$FF00+$DF], a
	xor a
	ld [$FF00+$EA], a
	ld a, 17
	ld [$A470], a
	ret
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld b, 3
	ld a, [$FF00+$DD]
	and a
	jr nz, UnknownRJump_5A119
	call UnknownCall_3D32

UnknownRJump_5A10E:
	ld a, 88
	ld [$FF00+$E9], a
	ld a, [$FF00+$DF]
	sub 2
	ld [$FF00+$DF], a
	ret

UnknownRJump_5A119:
	call UnknownCall_3D22
	jr UnknownRJump_5A10E
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_5A13E
	ld a, 72
	ld [$FF00+$E2], a
	call UnknownCall_3CB1
	ld b, 15
	call UnknownCall_3D2D
	ld b, 11
	ld a, [$FF00+$DF]
	dec a
	jr nz, UnknownRJump_5A13A
	call UnknownCall_3D22
	ret

UnknownRJump_5A13A:
	call UnknownCall_3D32
	ret

UnknownRJump_5A13E:
	dec a
	rst $28

UnknownData_5A140:
INCBIN "baserom.gb", $5A140, $5A148 - $5A140

	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld b, 1
	call UnknownCall_3D22
	jr UnknownRJump_5A15E
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld b, 1
	call UnknownCall_3D32

UnknownRJump_5A15E:
	ld a, [$FF00+$DB]
	inc a
	ld [$FF00+$DB], a
	cp 73
	ret nz
	ld a, [$FF00+$DF]
	add 2
	ld [$FF00+$DF], a
	ret
	ld b, 2
	call UnknownCall_3D22
	ret
	ld b, 2
	call UnknownCall_3D32
	ret
	ld a, [$FF00+$DF]
	cp 3
	call c, UnknownCall_5B585
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_5A18D
	ld a, 77
	ld [$FF00+$E2], a
	call UnknownCall_5B3C6
	ret

UnknownRJump_5A18D:
	dec a
	rst $28

UnknownData_5A18F:
INCBIN "baserom.gb", $5A18F, $5A197 - $5A18F

	call UnknownCall_582FB
	jr UnknownRJump_5A19F
	call UnknownCall_5831A

UnknownRJump_5A19F:
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_5A1A8
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_5A1A8:
	call UnknownCall_5B4B4
	cp 32
	ret nc
	ld a, 3
	ld [$FF00+$DF], a
	xor a
	ld [$FF00+$EA], a
	ld a, 99
	ld [$FF00+$DB], a
	ld a, 76
	ld [$FF00+$E2], a
	ret
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld a, [$FF00+$DB]
	dec a
	ld [$FF00+$DB], a
	cp 97
	ret nz
	ld a, 4
	ld [$FF00+$DF], a
	ld a, 32
	ld [$FF00+$EC], a
	ret
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_5A1DD
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_5A1DD:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld a, [$FF00+$DB]
	inc a
	ld [$FF00+$DB], a
	cp 99
	ret nz
	call UnknownCall_5B3C6
	ld a, 77
	ld [$FF00+$E2], a
	ld a, 64
	ld [$FF00+$EC], a
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_5A204
	ld a, 77
	ld [$FF00+$E2], a
	ld a, 3
	ld [$FF00+$DF], a
	ret

UnknownRJump_5A204:
	dec a
	rst $28

UnknownData_5A206:
INCBIN "baserom.gb", $5A206, $5A20C - $5A206

	ld a, [$FF00+$DB]
	set 0, a
	ld [$FF00+$DB], a
	call UnknownCall_5B4B4
	cp 24
	ret nc
	call UnknownCall_5B3C6
	ld a, 23
	ld [$A470], a
	ret
	ld b, 3
	call UnknownCall_3D32
	jr UnknownRJump_5A22D
	ld b, 3
	call UnknownCall_3D22

UnknownRJump_5A22D:
	call UnknownCall_5B521
	ld b, 1
	call UnknownCall_3D2D
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_5A244
	ld a, 32
	ld [$FF00+$E2], a
	ld a, 1
	ld [$FF00+$DF], a
	ret

UnknownRJump_5A244:
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_5A248:
INCBIN "baserom.gb", $5A248, $5A24A - $5A248

	call UnknownCall_5B5AD
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld b, 1
	call UnknownCall_3CC0
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_5A271
	ld a, 32
	ld [$FF00+$E2], a
	ld a, [$FF00+$E7]
	bit 6, a
	ret z
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 24
	ld [$FF00+$E8], a
	ld [$FF00+$E9], a
	ret

UnknownRJump_5A271:
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_5A275:
INCBIN "baserom.gb", $5A275, $5A27B - $5A275

	ld a, [$FF00+$E7]
	bit 6, a
	jr z, UnknownRJump_5A297
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$FF00+$E8]
	and a
	jr z, UnknownRJump_5A2A0
	dec a
	ld [$FF00+$E8], a
	ld b, 1
	call UnknownCall_3D3D
	call UnknownCall_3CDF
	ret

UnknownRJump_5A297:
	ld a, 2
	ld [$FF00+$DF], a
	ld a, 16
	ld [$FF00+$EC], a
	ret

UnknownRJump_5A2A0:
	ld a, 3
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$E7]
	bit 6, a
	jr nz, UnknownRJump_5A2C4
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_5A2B4
	dec a
	ld [$FF00+$EC], a
	ret nz

UnknownRJump_5A2B4:
	ld a, [$FF00+$E9]
	ld c, a
	ld a, [$FF00+$E8]
	cp c
	ret z
	inc a
	ld [$FF00+$E8], a
	ld b, 1
	call UnknownCall_3D2D
	ret

UnknownRJump_5A2C4:
	ld a, 1
	ld [$FF00+$DF], a
	xor a
	ld [$FF00+$EC], a
	ret
	call UnknownCall_5B2BF
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_5A2E6
	ld a, 77
	ld [$FF00+$E2], a
	ld a, 5
	ld [$FF00+$DF], a
	ld a, 16
	ld [$FF00+$E8], a
	ld a, 128
	ld [$FF00+$DC], a
	ret

UnknownRJump_5A2E6:
	call UnknownCall_5B5AD
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_5A2ED:
INCBIN "baserom.gb", $5A2ED, $5A2F7 - $5A2ED

	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld b, 1
	call UnknownCall_3D2D
	ld a, [$FF00+$E8]
	sub b
	ld [$FF00+$E8], a
	ret nz
	call UnknownCall_5B3C6
	xor a
	ld [$FF00+$DC], a
	ret
	call UnknownCall_5B521
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_5A325
	ld a, 72
	ld [$FF00+$E2], a
	call UnknownCall_5B3C6
	ld a, 56
	ld [$FF00+$E9], a
	add a
	ld [$FF00+$E8], a
	ret

UnknownJump_5A325:
UnknownRJump_5A325:
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_5A32E:
INCBIN "baserom.gb", $5A32E, $5A332 - $5A32E

	ld b, 1
	call UnknownCall_3D22
	jr UnknownRJump_5A33E
	ld b, 1
	call UnknownCall_3D32

UnknownRJump_5A33E:
	ld a, [$FF00+$E9]
	sub b
	ld [$FF00+$E9], a
	ret nz
	ld a, [$FF00+$E8]
	ld [$FF00+$E9], a
	ld a, [$FF00+$DF]
	xor $03
	ld [$FF00+$DF], a
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_5A385
	ld b, 36
	call UnknownCall_3D2D
	call UnknownCall_5B3C6
	and a
	jr z, UnknownRJump_5A376

UnknownData_5A365:
INCBIN "baserom.gb", $5A365, $5A376 - $5A365


UnknownRJump_5A376:
	ld a, 18
	ld [$FF00+$DF], a
	ld a, 1
	ld [$FF00+$E8], a
	ld [$FF00+$E9], a
	ld a, 72
	ld [$FF00+$E2], a
	ret

UnknownRJump_5A385:
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$FF00+$DF]
	and $F0
	swap a
	dec a
	jr z, UnknownRJump_5A3A4
	dec a
	jr z, UnknownRJump_5A3AF
	dec a
	jr z, UnknownRJump_5A3BA
	ld hl, $6519
	call UnknownCall_5A478
	call UnknownCall_3D10
	jr UnknownRJump_5A3C3

UnknownRJump_5A3A4:
	ld hl, $6519
	call UnknownCall_5A3F7
	call UnknownCall_3CDF
	jr UnknownRJump_5A3C3

UnknownRJump_5A3AF:
	ld hl, $652F
	call UnknownCall_5A405
	call UnknownCall_3CDF
	jr UnknownRJump_5A3C3

UnknownRJump_5A3BA:
	ld hl, $652F
	call UnknownCall_5A486
	call UnknownCall_3D10

UnknownRJump_5A3C3:
	ld a, [$FF00+$DF]
	and $0F
	jr z, UnknownRJump_5A3D9
	dec a
	jr z, UnknownRJump_5A3E3
	dec a
	jr z, UnknownRJump_5A3ED
	ld hl, $652F
	call UnknownCall_5A4D4
	call UnknownCall_3CC0
	ret

UnknownRJump_5A3D9:
	ld hl, $6519
	call UnknownCall_5A49F
	call UnknownCall_3CC0
	ret

UnknownRJump_5A3E3:
	ld hl, $6519
	call UnknownCall_5A4B8
	call UnknownCall_3CF1
	ret

UnknownRJump_5A3ED:
	ld hl, $652F
	call UnknownCall_5A4C6
	call UnknownCall_3CF1
	ret

UnknownCall_5A3F7:
	call UnknownCall_5A413
	call UnknownCall_5A41E
	ld a, [$AF27]
	and a
	ret nz
	ld [hl], 1
	ret

UnknownCall_5A405:
	call UnknownCall_5A413
	call UnknownCall_5A41E
	ld a, [$AF27]
	and a
	ret nz
	ld [hl], 20
	ret

UnknownCall_5A413:
	ld a, [$FF00+$E8]
	ld e, a
	ld d, 0
	add de
	ld b, [hl]
	call UnknownCall_3D3D
	ret

UnknownCall_5A41E:
	xor a
	ld [$AF27], a
	ld hl, $FFE8
	inc [hl]
	ld a, [hl]
	cp 21
	jr nz, UnknownRJump_5A432
	ld a, [$FF00+$DF]
	add 16
	ld [$FF00+$DF], a
	ret

UnknownRJump_5A432:
	ld a, 1
	ld [$AF27], a
	ret

UnknownCall_5A438:
	xor a
	ld [$AF27], a
	ld hl, $FFE8
	dec [hl]
	jr nz, UnknownRJump_5A432
	ld a, [$FF00+$DF]
	add 16
	cp 80
	jr c, UnknownRJump_5A44C
	sub 64

UnknownRJump_5A44C:
	ld [$FF00+$DF], a
	ret

UnknownCall_5A44F:
	xor a
	ld [$AF27], a
	ld hl, $FFE9
	dec [hl]
	jr nz, UnknownRJump_5A432
	ld a, [$FF00+$DF]
	inc a
	bit 4, a
	jr z, UnknownRJump_5A44C
	sub 4
	ld [$FF00+$DF], a
	ret

UnknownCall_5A465:
	xor a
	ld [$AF27], a
	ld hl, $FFE9
	inc [hl]
	ld a, [hl]
	cp 21
	jr nz, UnknownRJump_5A432
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	ret

UnknownCall_5A478:
	call UnknownCall_5A494
	call UnknownCall_5A438
	ld a, [$AF27]
	and a
	ret nz
	ld [hl], 1
	ret

UnknownCall_5A486:
	call UnknownCall_5A494
	call UnknownCall_5A438
	ld a, [$AF27]
	and a
	ret nz
	ld [hl], 20
	ret

UnknownCall_5A494:
	ld a, [$FF00+$E8]
	ld e, a
	ld d, 0
	add de
	ld b, [hl]
	call UnknownCall_3D2D
	ret

UnknownCall_5A49F:
	call UnknownCall_5A4AD
	call UnknownCall_5A44F
	ld a, [$AF27]
	and a
	ret nz
	ld [hl], 1
	ret

UnknownCall_5A4AD:
	ld a, [$FF00+$E9]
	ld e, a
	ld d, 0
	add de
	ld b, [hl]
	call UnknownCall_3D32
	ret

UnknownCall_5A4B8:
	call UnknownCall_5A4E2
	call UnknownCall_5A465
	ld a, [$AF27]
	and a
	ret nz
	ld [hl], 1
	ret

UnknownCall_5A4C6:
	call UnknownCall_5A4E2
	call UnknownCall_5A465
	ld a, [$AF27]
	and a
	ret nz
	ld [hl], 20
	ret

UnknownCall_5A4D4:
	call UnknownCall_5A4AD
	call UnknownCall_5A44F
	ld a, [$AF27]
	and a
	ret nz
	ld [hl], 20
	ret

UnknownCall_5A4E2:
	ld a, [$FF00+$E9]
	ld e, a
	ld d, 0
	add de
	ld b, [hl]
	call UnknownCall_3D22
	ret

UnknownData_5A4ED:
INCBIN "baserom.gb", $5A4ED, $5A545 - $5A4ED

	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_5A568
	ld a, 32
	ld [$FF00+$E2], a
	ld a, 16
	ld [$FF00+$DE], a
	call UnknownCall_5B3C6
	ld a, 168
	ld [$AF37], a
	ld a, [$FF00+$DD]
	ld [$AF38], a
	ld a, 69
	ld [$AF36], a
	call UnknownCall_5B36D
	ret

UnknownRJump_5A568:
	call UnknownCall_5B5D8
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_5A574:
INCBIN "baserom.gb", $5A574, $5A578 - $5A574

	call UnknownCall_3C58
	ld a, [$AF2F]
	bit 4, a
	jp nz, UnknownJump_59D2D
	ld b, 1
	call UnknownCall_3D22
	call UnknownCall_3CF1
	jr UnknownRJump_5A5A0
	call UnknownCall_3BF4
	ld a, [$AF2F]
	bit 0, a
	jp nz, UnknownJump_59D2D
	ld b, 1
	call UnknownCall_3D32
	call UnknownCall_3CC0

UnknownRJump_5A5A0:
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_5A5B0
	call UnknownCall_5B465
	call UnknownCall_3D2D
	call UnknownCall_3D10
	jr UnknownRJump_5A5B9

UnknownRJump_5A5B0:
	call UnknownCall_5B441
	call UnknownCall_3D3D
	call UnknownCall_3CDF

UnknownRJump_5A5B9:
	ld a, [$FF00+$E0]
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$E8]
	xor $01
	ld [$FF00+$E8], a
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_5A5DA
	ld a, 77
	ld [$FF00+$E2], a
	ld a, 1
	ld [$FF00+$DF], a
	ld b, 24
	call UnknownCall_3D2D
	ret

UnknownRJump_5A5DA:
	call UnknownCall_5B57E
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_5A5E1:
INCBIN "baserom.gb", $5A5E1, $5A5E3 - $5A5E1

	call UnknownCall_5B4F5
	ld b, 24
	call UnknownCall_3D2D
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_5A603
	ld a, 16
	ld [$FF00+$DE], a
	ld a, 32
	ld [$FF00+$E2], a
	ld a, [$FF00+$E7]
	bit 6, a
	ret z
	ld a, 1
	ld [$FF00+$DF], a
	ret

UnknownRJump_5A603:
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_5A607:
INCBIN "baserom.gb", $5A607, $5A60F - $5A607

	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld b, 1
	call UnknownCall_3D2D
	call UnknownCall_3D10
	call UnknownCall_3D32
	call UnknownCall_3CC0
	ld a, [$FF00+$E9]
	add b
	ld [$FF00+$E9], a
	cp 48
	ret nz
	xor a
	ld [$FF00+$E9], a
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld b, 1
	call UnknownCall_3D3D
	call UnknownCall_3CDF
	call UnknownCall_3D32
	call UnknownCall_3CC0
	ld a, [$FF00+$E9]
	add b
	ld [$FF00+$E9], a
	cp 32
	ret nz
	xor a
	ld [$FF00+$E9], a
	ld a, 3
	ld [$FF00+$DF], a
	ld a, 64
	ld [$FF00+$EC], a
	ret
	call UnknownCall_5B68B
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	call UnknownCall_5B2BF
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_5A674
	ld a, 77
	ld [$FF00+$E2], a
	call UnknownCall_5B3C6
	ret

UnknownRJump_5A674:
	call UnknownCall_5B57E
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_5A67B:
INCBIN "baserom.gb", $5A67B, $5A683 - $5A67B

	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_5A691
	ld a, 32
	ld [$FF00+$E2], a
	ld a, 4
	ld [$FF00+$DF], a
	ret

UnknownRJump_5A691:
	dec a
	rst $28

UnknownData_5A693:
INCBIN "baserom.gb", $5A693, $5A69B - $5A693

	ld a, [$FF00+$E7]
	bit 6, a
	ret z
	ld a, 1
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$DB]
	inc a
	ld [$FF00+$DB], a
	cp 190
	ret nz
	ld a, 2
	ld [$FF00+$DF], a
	ld a, 112
	ld [$FF00+$E9], a
	ret
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld b, 1
	call UnknownCall_3D32
	call UnknownCall_3CC0
	ld a, [$FF00+$E9]
	sub b
	ld [$FF00+$E9], a
	ret nz
	ld a, 3
	ld [$FF00+$DF], a
	ld a, 32
	ld [$FF00+$EC], a
	ret
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_5A6DB
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_5A6DB:
	ld a, [$FF00+$DB]
	cp 188
	ret z
	dec a
	ld [$FF00+$DB], a
	xor a
	ld [$FF00+$E2], a
	ret
	call UnknownCall_5B51A
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_5A6F7
	ld a, 72
	ld [$FF00+$E2], a
	call UnknownCall_5B3C6
	ret

UnknownRJump_5A6F7:
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_5A6FB:
INCBIN "baserom.gb", $5A6FB, $5A6FF - $5A6FB

	ld b, 1
	call UnknownCall_3D22
	call UnknownCall_3AF0
	ld a, [$AF2F]
	bit 4, a
	jp z, UnknownJump_59D2D
	ret
	ld b, 1
	call UnknownCall_3D32
	call UnknownCall_3B04
	ld a, [$AF2F]
	bit 4, a
	jp z, UnknownJump_59D2D
	ret
	call UnknownCall_5B639
	ld a, [$FF00+$DF]
	and a
	jp nz, UnknownJump_5A325
	ld a, 72
	ld [$FF00+$E2], a
	call UnknownCall_5B3C6
	ld a, 56
	ld [$FF00+$E9], a
	add a
	ld [$FF00+$E8], a
	ret
	call UnknownCall_5B51A
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_5A749
	ld a, 72
	ld [$FF00+$E2], a
	call UnknownCall_5B3C6
	ret

UnknownRJump_5A749:
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_5A74D:
INCBIN "baserom.gb", $5A74D, $5A751 - $5A74D

	ld b, 1
	call UnknownCall_3D22
	call UnknownCall_3B18
	ld a, [$AF2F]
	bit 6, a
	jp z, UnknownJump_59D2D
	ret
	ld b, 1
	call UnknownCall_3D32
	call UnknownCall_3B2C
	ld a, [$AF2F]
	bit 6, a
	jp z, UnknownJump_59D2D
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_5A787
	ld a, 77
	ld [$FF00+$E2], a
	call UnknownCall_5B3C6
	ld a, 24
	ld [$FF00+$E9], a
	add a
	ld [$FF00+$E8], a
	ret

UnknownRJump_5A787:
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_5A78B:
INCBIN "baserom.gb", $5A78B, $5A793 - $5A78B

	call UnknownCall_5B51A
	ld b, 1
	call UnknownCall_3D22
	jr UnknownRJump_5A7A5
	call UnknownCall_5B51A
	ld b, 1
	call UnknownCall_3D32

UnknownRJump_5A7A5:
	ld a, [$FF00+$E9]
	sub b
	ld [$FF00+$E9], a
	ret nz
	ld a, [$FF00+$DF]
	ld [$FF00+$EF], a
	ld a, 3
	ld [$FF00+$DF], a
	ld a, 16
	ld [$FF00+$EC], a
	call UnknownCall_5B41A
	ld a, [$AF2C]
	cp 255
	jr z, UnknownRJump_5A7C6
	ld a, 147
	ld [$FF00+$DB], a
	ret

UnknownRJump_5A7C6:
	ld a, 148
	ld [$FF00+$DB], a
	ret
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_5A7D4
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_5A7D4:
	ld a, 145
	ld [$AF37], a
	ld a, [$FF00+$DD]
	ld [$AF38], a
	ld a, [$FF00+$DB]
	cp 148
	jr nz, UnknownRJump_5A7EB
	ld a, [$AF38]
	inc a
	ld [$AF38], a

UnknownRJump_5A7EB:
	ld a, 78
	ld [$AF36], a
	call UnknownCall_5B36D
	ld a, 4
	ld [$FF00+$DF], a
	ld a, 32
	ld [$FF00+$EC], a
	ld a, 17
	ld [$A470], a
	ret
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 146
	ld [$FF00+$DB], a
	ld a, [$FF00+$EF]
	ld [$FF00+$DF], a
	ld a, [$FF00+$E8]
	ld [$FF00+$E9], a
	jp UnknownJump_59D2D
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_5A834
	ld a, 73
	ld [$FF00+$E2], a
	call UnknownCall_3CB1
	ld a, [$FF00+$DD]
	bit 0, a
	jr nz, UnknownRJump_5A82F
	ld a, [$FF00+$DF]
	add 2
	ld [$FF00+$DF], a
	ret

UnknownRJump_5A82F:
	res 0, a
	ld [$FF00+$DD], a
	ret

UnknownRJump_5A834:
	dec a
	rst $28

UnknownData_5A836:
INCBIN "baserom.gb", $5A836, $5A83E - $5A836

	ld b, 1
	call UnknownCall_3D22
	jr UnknownRJump_5A84A
	ld b, 1
	call UnknownCall_3D32

UnknownRJump_5A84A:
	ld b, 1
	call UnknownCall_3D2D
	ret
	ld b, 2
	call UnknownCall_3D22
	ret
	ld b, 2
	call UnknownCall_3D32
	ret

UnknownData_5A85C:
INCBIN "baserom.gb", $5A85C, $5A8D2 - $5A85C

	ld a, 1
	ld [$AF3E], a
	ld a, [$FF00+$DF]
	and a
	ret nz
	ld a, 16
	ld [$FF00+$E2], a
	ld a, 1
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_5A913
	call UnknownCall_5B3C6
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a
	ld a, 133
	ld [$FF00+$E2], a
	ld a, 90
	ld [$AF37], a
	ld a, [$FF00+$DD]
	ld [$AF38], a
	ld a, 55
	ld [$AF36], a
	call UnknownCall_5B36D
	ld b, 16
	call UnknownCall_3D2D
	ld a, 18
	ld [$A470], a
	ret

UnknownRJump_5A913:
	dec a
	rst $28

UnknownData_5A915:
INCBIN "baserom.gb", $5A915, $5A91D - $5A915


UnknownRJump_5A91D:
	call UnknownCall_3B54
	ld a, [$AF2F]
	bit 6, a
	ret nz
	ld a, [$FF00+$DF]
	add 2
	ld [$FF00+$DF], a
	ret

UnknownData_5A92D:
INCBIN "baserom.gb", $5A92D, $5A939 - $5A92D

	ld a, [$FF00+$F0]
	and $01
	jr nz, UnknownRJump_5A91D

UnknownRJump_5A93F:
	ld b, 3
	call UnknownCall_3D32
	ret
	ld a, [$FF00+$F0]
	and $01
	jr z, UnknownRJump_5A93F
	jr UnknownRJump_5A953

UnknownData_5A94D:
INCBIN "baserom.gb", $5A94D, $5A953 - $5A94D


UnknownRJump_5A953:
	call UnknownCall_5B451
	call UnknownCall_3D3D
	call UnknownCall_3B54
	ld a, [$AF2F]
	bit 6, a
	ret z
	ld a, [$FF00+$DF]
	sub 2
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_5A973
	ld a, 1
	ld [$FF00+$DF], a
	ret

UnknownRJump_5A973:
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_5A977:
INCBIN "baserom.gb", $5A977, $5A979 - $5A977

	call UnknownCall_5B585
	call UnknownCall_5B4F5
	ld b, 20
	call UnknownCall_3D3D
	ld a, [$AF07]
	and a
	ret z
	ld a, 2
	ld [$AF26], a
	call UnknownCall_5B2D7
	ret
	call UnknownCall_5B521
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_5A9A9
	ld a, 72
	ld [$FF00+$E2], a
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 64
	ld [$FF00+$E8], a
	ld [$FF00+$E9], a
	ret

UnknownRJump_5A9A9:
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_5A9B2:
INCBIN "baserom.gb", $5A9B2, $5A9B6 - $5A9B2

	ld b, 1
	call UnknownCall_3D3D
	jr UnknownRJump_5A9C2

UnknownData_5A9BD:
INCBIN "baserom.gb", $5A9BD, $5A9C2 - $5A9BD


UnknownRJump_5A9C2:
	ld a, [$FF00+$E8]
	sub b
	ld [$FF00+$E8], a
	ret nz

UnknownData_5A9C8:
INCBIN "baserom.gb", $5A9C8, $5A9D3 - $5A9C8

	call UnknownCall_5B511
	xor a
	ld [$FF00+$DD], a
	ld a, [$FF00+$DF]
	and a
	jp nz, UnknownJump_58642
	ld a, 77
	ld [$FF00+$E2], a
	ld a, 1
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_5AA14
	ld b, 2
	call UnknownCall_3D3D
	ld a, 128
	ld [$FF00+$DC], a
	xor a
	ld [$FF00+$DD], a
	ld a, 74
	ld [$FF00+$E2], a
	ld a, 24
	ld [$FF00+$E9], a
	ld a, 24
	ld [$FF00+$EC], a
	ld a, 5
	ld [$FF00+$DF], a
	ret
	call UnknownCall_5B4B4
	cp 40
	ret c
	call UnknownCall_5B3C6
	ret

UnknownRJump_5AA14:
	dec a
	rst $28

UnknownData_5AA16:
INCBIN "baserom.gb", $5AA16, $5AA20 - $5AA16

	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_5AA29
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_5AA29:
	ld b, 1
	call UnknownCall_3D22
	jr UnknownRJump_5AA3E
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_5AA39
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_5AA39:
	ld b, 1
	call UnknownCall_3D32

UnknownRJump_5AA3E:
	ld a, [$FF00+$E9]
	sub b
	ld [$FF00+$E9], a
	ret nz
	xor a
	ld [$FF00+$DC], a
	ld a, [$FF00+$DF]
	add 2
	ld [$FF00+$DF], a
	ld a, 16
	ld [$A470], a
	ret
	ld b, 3
	call UnknownCall_3D22
	jr UnknownRJump_5AA5F
	ld b, 3
	call UnknownCall_3D32

UnknownRJump_5AA5F:
	ld a, [$FF00+$DA]
	cp 184
	ret c
	call UnknownCall_5B2BF
	ret
	ld a, [$FF00+$DF]
	and a
	jp nz, UnknownJump_59189
	jp UnknownJump_581B9
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_5AA85
	ld a, 72
	ld [$FF00+$E2], a
	ld a, 3
	ld [$FF00+$DF], a
	ld a, 8
	ld [$FF00+$E8], a
	ld [$FF00+$E9], a
	ret

UnknownRJump_5AA85:
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_5AA89:
INCBIN "baserom.gb", $5AA89, $5AA8F - $5AA89

	call UnknownCall_5B4B4
	cp 32
	ret nc
	ld a, [$FF00+$DB]
	set 0, a
	ld [$FF00+$DB], a
	ld a, 1
	ld [$FF00+$DF], a
	ret
	ld b, 1
	call UnknownCall_3D2D
	jr UnknownRJump_5AAAC
	ld b, 1
	call UnknownCall_3D3D

UnknownRJump_5AAAC:
	ld a, [$FF00+$E8]
	sub b
	ld [$FF00+$E8], a
	ret nz
	ld a, [$FF00+$E9]
	ld [$FF00+$E8], a
	jp UnknownJump_59D33
	ld a, [$FF00+$DF]
	rst $28

UnknownData_5AABC:
INCBIN "baserom.gb", $5AABC, $5AAC6 - $5AABC

	ld a, 16
	ld [$FF00+$DE], a
	ld a, 32
	ld [$FF00+$E2], a
	ld a, 3
	ld [$FF00+$DF], a
	ld a, 48
	ld [$FF00+$E8], a
	ld [$FF00+$E9], a
	ret
	ld a, [$FF00+$E7]
	bit 6, a
	ret z
	ld b, 8
	call UnknownCall_3D3D
	ld a, 221
	ld [$FF00+$DB], a
	ld a, 4
	ld [$FF00+$DF], a
	ld a, 4
	ld [$FF00+$EC], a
	ret
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 128
	ld [$FF00+$DC], a
	ld b, 64
	call UnknownCall_3D22
	call UnknownCall_3D2D
	ld a, 193
	ld [$FF00+$DB], a
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 72
	ld [$FF00+$E2], a
	ret
	ld a, [$A2E4]
	and $01
	jr nz, UnknownRJump_5AB1A
	ld b, 4
	jr UnknownRJump_5AB1C

UnknownRJump_5AB1A:
	ld b, 2

UnknownRJump_5AB1C:
	call UnknownCall_3D3D
	jr UnknownRJump_5AB31
	ld a, [$A2E4]
	and $01
	jr nz, UnknownRJump_5AB2C
	ld b, 4
	jr UnknownRJump_5AB2E

UnknownRJump_5AB2C:
	ld b, 2

UnknownRJump_5AB2E:
	call UnknownCall_3D2D

UnknownRJump_5AB31:
	ld a, [$FF00+$E8]
	sub b
	ld [$FF00+$E8], a
	ret nz
	ld a, [$FF00+$E9]
	ld [$FF00+$E8], a
	ld a, [$FF00+$DF]
	cp 1
	call z, UnknownCall_5AB45
	jp UnknownJump_59D33

UnknownCall_5AB45:
	ld a, 10
	ld [$A470], a
	ret
	ld a, [$FF00+$DF]
	rst $28

UnknownData_5AB4E:
INCBIN "baserom.gb", $5AB4E, $5AB58 - $5AB4E

	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 128
	ld [$FF00+$DC], a
	ld b, 48
	call UnknownCall_3D22
	ld b, 64
	call UnknownCall_3D2D
	ld a, 193
	ld [$FF00+$DB], a
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 72
	ld [$FF00+$E2], a
	ret
	call UnknownCall_5B585
	ld a, [$FF00+$DF]
	rst $28

UnknownData_5AB7F:
INCBIN "baserom.gb", $5AB7F, $5AB89 - $5AB7F

	ld a, 74
	ld [$FF00+$E2], a
	call UnknownCall_5B3C6
	ld a, [$FF00+$DF]
	ld [$FF00+$EF], a
	ret

UnknownCall_5AB95:
	call UnknownCall_3B40
	ld a, [$AF2F]
	bit 6, a
	jr nz, UnknownRJump_5ABA5
	ld b, 2
	call UnknownCall_3D3D
	ret

UnknownRJump_5ABA5:
	ld a, [$FF00+$DF]
	add 2

UnknownRJump_5ABA9:
	ld [$FF00+$DF], a
	ld [$FF00+$EF], a
	ret
	call UnknownCall_5AB95
	jr UnknownRJump_5ABBB
	call UnknownCall_5AB95
	jr UnknownRJump_5ABD3
	call UnknownCall_5ABE8

UnknownRJump_5ABBB:
	call UnknownCall_3C1C
	ld a, [$AF2F]
	bit 4, a
	jr nz, UnknownRJump_5ABCB
	ld b, 2
	call UnknownCall_3D22
	ret

UnknownRJump_5ABCB:
	ld a, [$FF00+$DF]
	inc a
	jr UnknownRJump_5ABA9
	call UnknownCall_5ABE8

UnknownRJump_5ABD3:
	call UnknownCall_3BB8
	ld a, [$AF2F]
	bit 0, a
	jr nz, UnknownRJump_5ABE3
	ld b, 2
	call UnknownCall_3D32
	ret

UnknownRJump_5ABE3:
	ld a, [$FF00+$DF]
	dec a
	jr UnknownRJump_5ABFC

UnknownCall_5ABE8:
	call UnknownCall_3B7C
	ld a, [$AF2F]
	bit 4, a
	jr nz, UnknownRJump_5ABF8
	ld b, 2
	call UnknownCall_3D2D
	ret

UnknownRJump_5ABF8:
	ld a, [$FF00+$DF]
	sub 2

UnknownRJump_5ABFC:
	ld [$FF00+$DF], a
	ld [$FF00+$EF], a
	ret
	ld a, [$FF00+$DF]
	rst $28

UnknownData_5AC04:
INCBIN "baserom.gb", $5AC04, $5AC08 - $5AC04

	ld a, 1
	ld [$FF00+$DF], a
	ld a, 56
	ld [$FF00+$EC], a
	ret
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, [$A2E4]
	and $01
	jr nz, UnknownRJump_5AC2A
	call UnknownCall_3AB4
	ld a, 73
	ld [$FF00+$E2], a
	ld a, [$FF00+$EF]
	ld [$FF00+$DF], a
	ret

UnknownRJump_5AC2A:
	ld a, 2
	ld [$AF26], a
	call UnknownCall_5B2D7
	ld a, [$A2E0]
	and a
	ret z
	dec a
	ld [$A2E0], a
	ret
	ld a, [$FF00+$DF]
	rst $28

UnknownData_5AC3F:
INCBIN "baserom.gb", $5AC3F, $5AC47 - $5AC3F

	ld a, 16
	ld [$FF00+$DE], a
	ld a, 72
	ld [$FF00+$E2], a
	ld a, 3
	ld [$FF00+$DF], a
	ret
	call UnknownCall_5B4B4
	cp 48
	ret nc
	ld a, 1
	ld [$FF00+$DF], a
	ret
	call UnknownCall_5B5B6
	jp UnknownJump_593FB
	call UnknownCall_5B5B6
	call UnknownCall_3B90
	ld a, [$AF2F]
	bit 4, a
	jr nz, UnknownRJump_5AC78
	ld b, 1
	call UnknownCall_3D2D
	ret

UnknownRJump_5AC78:
UnknownData_5AC78:
INCBIN "baserom.gb", $5AC78, $5AC7D - $5AC78

	ld a, [$FF00+$DF]
	rst $28

UnknownData_5AC80:
INCBIN "baserom.gb", $5AC80, $5AC88 - $5AC80

	ld a, 32
	ld [$FF00+$E2], a
	ld a, 1
	ld [$FF00+$DF], a
	ld a, [$A2E4]
	and $01
	ret z
	ld a, 224
	ld [$FF00+$DB], a
	ret
	call UnknownCall_5B521
	ld a, [$FF00+$E7]
	bit 6, a
	ret z
	ld a, [$A2E4]
	and $01
	jr nz, UnknownRJump_5ACAF
	ld a, 2
	ld [$FF00+$DF], a
	ret

UnknownRJump_5ACAF:
	ld a, 3
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$F0]
	and $07
	ret nz
	ld a, [$FF00+$DB]
	inc a
	ld [$FF00+$DB], a
	cp 206
	jr z, UnknownRJump_5ACC9
	cp 208
	ret nz
	call UnknownCall_5B2D7
	ret

UnknownRJump_5ACC9:
	ld a, 1
	ld [$A478], a
	ret
	ld a, [$FF00+$F0]
	and $07
	ret nz
	ld a, [$FF00+$DB]
	inc a
	ld [$FF00+$DB], a
	cp 226
	jr z, UnknownRJump_5ACC9
	cp 228
	ret nz
	call UnknownCall_5B2D7
	ret
	ld a, [$FF00+$DF]
	rst $28

UnknownData_5ACE7:
INCBIN "baserom.gb", $5ACE7, $5ACED - $5ACE7


UnknownRJump_5ACED:
	ld a, 32
	ld [$FF00+$EC], a
	ld a, 2
	ld [$FF00+$DF], a
	ld a, 16
	ld [$FF00+$DE], a
	ret
	call UnknownCall_5AD11
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 80
	ld [$FF00+$E2], a
	ld a, 6
	ld [$A478], a
	ret

UnknownCall_5AD11:
	ld a, [$FF00+$EC]
	and $06
	ret z
	ld a, 1
	ld [$AF3E], a
	ret
	call UnknownCall_5B5AD
	ld b, 2
	call UnknownCall_3D22
	ld a, [$FF00+$DA]
	cp 176
	ret c
	call UnknownCall_5B2BF
	ret
	ld a, [$FF00+$DF]
	rst $28

UnknownData_5AD30:
INCBIN "baserom.gb", $5AD30, $5AD36 - $5AD30

	ld a, 32
	ld [$FF00+$DD], a
	jr UnknownRJump_5ACED
	call UnknownCall_5B5AD
	ld b, 2
	call UnknownCall_3D32
	ld a, [$FF00+$DA]
	cp 184
	ret c
	call UnknownCall_5B2BF
	ret
	ld a, [$FF00+$DF]
	rst $28

UnknownData_5AD50:
INCBIN "baserom.gb", $5AD50, $5AD5A - $5AD50

	ld a, 32
	ld [$FF00+$E2], a
	ld a, 2
	ld [$FF00+$DF], a
	ld a, 40
	ld [$FF00+$E9], a
	add a
	ld [$FF00+$E8], a
	ld a, 16
	ld [$FF00+$DE], a
	ld a, 1
	ld [$FF00+$E0], a
	ret
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	ld a, [$FF00+$E8]
	ld [$FF00+$E9], a
	xor a
	ld [$FF00+$E0], a
	ret
	call UnknownCall_5B5DF
	ld a, [$A2E4]
	and $01
	jr z, UnknownRJump_5AD94
	ld a, [$FF00+$F0]
	and $01
	ret nz

UnknownRJump_5AD94:
	ld a, [$FF00+$E0]
	xor $01
	ld [$FF00+$E0], a
	inc a
	ld b, a
	call UnknownCall_3D32
	call UnknownCall_3CC0
	ld a, [$FF00+$E9]
	sub b
	ld [$FF00+$E9], a
	ret nz
	ld a, 3
	ld [$FF00+$DF], a
	ld a, 48
	ld [$FF00+$EC], a
	ret
	call UnknownCall_5B5DF
	ld a, [$A2E4]
	and $01
	jr z, UnknownRJump_5ADC0
	ld a, [$FF00+$F0]
	and $01
	ret nz

UnknownRJump_5ADC0:
	ld a, [$FF00+$E0]
	xor $01
	ld [$FF00+$E0], a
	inc a
	ld b, a
	call UnknownCall_3D22
	call UnknownCall_3CF1
	ld a, [$FF00+$E9]
	sub b
	ld [$FF00+$E9], a
	ret nz
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 48
	ld [$FF00+$EC], a
	ret
	call UnknownCall_5B57E
	ld a, [$FF00+$DF]
	rst $28

UnknownData_5ADE3:
INCBIN "baserom.gb", $5ADE3, $5ADED - $5ADE3

	ld a, 72
	ld [$FF00+$E2], a
	call UnknownCall_5B3C6
	ld a, 16
	ld [$FF00+$DE], a
	ret
	ld hl, $6E62
	call UnknownCall_5B33E
	ld a, b
	cp 128
	jr z, UnknownRJump_5AE09
	call UnknownCall_3D22
	jr UnknownRJump_5AE1B

UnknownJump_5AE09:
UnknownRJump_5AE09:
	ld a, 3
	jr UnknownRJump_5AE28
	ld hl, $6E62
	call UnknownCall_5B33E
	ld a, b
	cp 128
	jr z, UnknownRJump_5AE26
	call UnknownCall_3D32

UnknownRJump_5AE1B:
	ld hl, $6EAC

UnknownJump_5AE1E:
	call UnknownCall_5B33E
	call UnknownCall_3D2D
	jr UnknownRJump_5AE59

UnknownJump_5AE26:
UnknownRJump_5AE26:
	ld a, 4

UnknownRJump_5AE28:
	ld [$FF00+$DF], a
	xor a
	ld [$FF00+$E9], a
	ret
	ld hl, $6E87
	call UnknownCall_5B33E
	ld a, b
	cp 128
	jr z, UnknownRJump_5AE3E
	call UnknownCall_3D32
	jr UnknownRJump_5AE50

UnknownJump_5AE3E:
UnknownRJump_5AE3E:
	ld a, 2
	jr UnknownRJump_5AE28
	ld hl, $6E87
	call UnknownCall_5B33E
	ld a, b
	cp 128
	jr z, UnknownRJump_5AE5E
	call UnknownCall_3D22

UnknownRJump_5AE50:
	ld hl, $6ED0

UnknownJump_5AE53:
	call UnknownCall_5B33E
	call UnknownCall_3D3D

UnknownRJump_5AE59:
	ld hl, $FFE9
	inc [hl]
	ret

UnknownJump_5AE5E:
UnknownRJump_5AE5E:
	ld a, 1
	jr UnknownRJump_5AE28

UnknownData_5AE62:
INCBIN "baserom.gb", $5AE62, $5AEF4 - $5AE62

	call UnknownCall_5B57E
	ld a, [$FF00+$DF]
	rst $28

UnknownData_5AEFA:
INCBIN "baserom.gb", $5AEFA, $5AF04 - $5AEFA

	ld hl, $6F55
	call UnknownCall_5B33E
	ld a, b
	cp 128
	jp z, UnknownJump_5AE09
	call UnknownCall_3D22
	ld hl, $6F97
	jp UnknownJump_5AE1E
	ld hl, $6F55
	call UnknownCall_5B33E
	ld a, b
	cp 128
	jp z, UnknownJump_5AE26
	call UnknownCall_3D32
	ld hl, $6F97
	jp UnknownJump_5AE1E
	ld hl, $6F76
	call UnknownCall_5B33E
	ld a, b
	cp 128
	jp z, UnknownJump_5AE3E
	call UnknownCall_3D32
	jp UnknownJump_5AF4F
	ld hl, $6F76
	call UnknownCall_5B33E
	ld a, b
	cp 128
	jp z, UnknownJump_5AE5E
	call UnknownCall_3D22

UnknownJump_5AF4F:
	ld hl, $6FB7
	jp UnknownJump_5AE53

UnknownData_5AF55:
INCBIN "baserom.gb", $5AF55, $5AFD7 - $5AF55

	ld a, [$FF00+$DF]
	rst $28

UnknownData_5AFDA:
INCBIN "baserom.gb", $5AFDA, $5AFE4 - $5AFDA

	ld a, 77
	ld [$FF00+$E2], a
	call UnknownCall_5B3C6
	ld a, 1
	ld [$FF00+$E8], a
	ld a, 2
	ld [$FF00+$E9], a
	ret
	ld b, 1
	call UnknownCall_3D22
	jr UnknownRJump_5B000
	ld b, 1
	call UnknownCall_3D32

UnknownRJump_5B000:
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_5B012
	call UnknownCall_5B481
	call UnknownCall_3D3D
	jr UnknownRJump_5B018

UnknownRJump_5B012:
	call UnknownCall_5B449
	call UnknownCall_3D2D

UnknownRJump_5B018:
	ld a, [$FF00+$E0]
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$E8]
	xor $01
	ld [$FF00+$E8], a
	jp z, UnknownJump_59D2D
	ld a, [$FF00+$E9]
	dec a
	ld [$FF00+$E9], a
	ret nz
	ld a, [$FF00+$DF]
	ld [$FF00+$EF], a
	ld a, 3
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld a, [$FF00+$DB]
	inc a
	ld [$FF00+$DB], a
	cp 112
	ret nz
	ld a, 108
	ld [$FF00+$DB], a
	ld a, 112
	ld [$AF37], a
	ld a, 89
	ld [$AF36], a
	call UnknownCall_5B36D
	ld a, 4
	ld [$FF00+$DF], a
	ld a, 8
	ld [$FF00+$EC], a
	ret
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, [$FF00+$EF]
	ld [$FF00+$DF], a
	ld a, 2
	ld [$FF00+$E9], a
	ret
	ld a, [$FF00+$DF]
	rst $28

UnknownData_5B070:
INCBIN "baserom.gb", $5B070, $5B078 - $5B070

	ld b, 16
	call UnknownCall_3D2D
	ld a, 72
	ld [$FF00+$E2], a
	call UnknownCall_5B3C6
	ret
	ld b, 1
	call UnknownCall_3D22
	jr UnknownRJump_5B091

UnknownData_5B08C:
INCBIN "baserom.gb", $5B08C, $5B091 - $5B08C


UnknownRJump_5B091:
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_5B0A8
	call UnknownCall_5B46C
	call UnknownCall_3D2D
	ld a, [$FF00+$E0]
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, 1
	ld [$FF00+$E8], a
	ret

UnknownRJump_5B0A8:
	call UnknownCall_3B40
	ld a, [$AF2F]
	bit 6, a
	jr nz, UnknownRJump_5B0B9
	call UnknownCall_5B451
	call UnknownCall_3D3D
	ret

UnknownRJump_5B0B9:
	ld a, 113
	ld [$FF00+$DB], a
	ld a, 3
	ld [$FF00+$DF], a
	ld a, 16
	ld [$FF00+$EC], a
	ret
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 2
	ld [$AF26], a
	call UnknownCall_5B2D7
	ret
	call UnknownCall_5B521
	ld a, [$FF00+$DF]
	rst $28

UnknownData_5B0DB:
INCBIN "baserom.gb", $5B0DB, $5B0E5 - $5B0DB

	ld a, 77
	ld [$FF00+$E2], a
	ld a, 24
	ld [$FF00+$E9], a
	add a
	ld [$FF00+$E8], a
	call UnknownCall_5B3C6
	ld a, [$FF00+$DF]
	ld [$FF00+$E0], a
	ret
	ld b, 1
	call UnknownCall_3D22
	ld a, [$FF00+$E9]
	sub b
	ld [$FF00+$E9], a
	ret nz
	ld a, [$FF00+$E8]
	ld [$FF00+$E9], a
	ld a, [$FF00+$E0]
	dec a
	jr z, UnknownRJump_5B115

UnknownRJump_5B10C:
	ld a, 4
	ld [$FF00+$DF], a
	ld a, 118
	ld [$FF00+$DB], a
	ret

UnknownRJump_5B115:
	ld a, 3
	ld [$FF00+$DF], a
	ld a, 120
	ld [$FF00+$DB], a
	ret
	ld b, 1
	call UnknownCall_3D32
	ld a, [$FF00+$E9]
	sub b
	ld [$FF00+$E9], a
	ret nz
	ld a, [$FF00+$E8]
	ld [$FF00+$E9], a
	xor a
	ld [$FF00+$DD], a
	ld a, [$FF00+$E0]
	dec a
	jr z, UnknownRJump_5B10C
	jr UnknownRJump_5B115
	ld b, 1
	call UnknownCall_3D3D
	ld a, [$FF00+$E9]
	sub b
	ld [$FF00+$E9], a
	ret nz
	ld a, [$FF00+$E8]
	ld [$FF00+$E9], a
	ld a, 116
	ld [$FF00+$DB], a
	ld a, [$FF00+$E0]
	dec a
	jr z, UnknownRJump_5B154

UnknownRJump_5B14F:
	ld a, 1
	ld [$FF00+$DF], a
	ret

UnknownRJump_5B154:
	ld a, 32
	ld [$FF00+$DD], a
	ld a, 2
	ld [$FF00+$DF], a
	ret
	ld b, 1
	call UnknownCall_3D2D
	ld a, [$FF00+$E9]
	sub b
	ld [$FF00+$E9], a
	ret nz
	ld a, [$FF00+$E8]
	ld [$FF00+$E9], a
	ld a, 116
	ld [$FF00+$DB], a
	ld a, [$FF00+$E0]
	dec a
	jr z, UnknownRJump_5B14F
	jr UnknownRJump_5B154
	call UnknownCall_5B51A
	ld a, [$FF00+$DF]
	rst $28

UnknownData_5B17D:
INCBIN "baserom.gb", $5B17D, $5B183 - $5B17D

	ld a, 77
	ld [$FF00+$E2], a
	ld a, 16
	ld [$FF00+$DE], a
	call UnknownCall_5B3C6
	ret
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld b, 2
	call UnknownCall_3D22
	jr UnknownRJump_5B1A5
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld b, 2
	call UnknownCall_3D32

UnknownRJump_5B1A5:
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_5B1B3
	call UnknownCall_5B47A
	inc b
	call UnknownCall_3D2D
	jr UnknownRJump_5B1BA

UnknownRJump_5B1B3:
	call UnknownCall_5B451
	inc b
	call UnknownCall_3D3D

UnknownRJump_5B1BA:
	ld a, [$FF00+$E0]
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$E8]
	xor $01
	ld [$FF00+$E8], a
	ret
	ld a, [$FF00+$DF]
	rst $28

UnknownData_5B1CB:
INCBIN "baserom.gb", $5B1CB, $5B1D3 - $5B1CB


UnknownRJump_5B1D3:
	ld a, 76
	ld [$FF00+$E2], a
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 3
	ld [$FF00+$E8], a
	ld [$FF00+$E9], a
	ld [$FF00+$EA], a
	ret
	ld b, 1
	ld a, [$FF00+$E0]
	and a
	jr nz, UnknownRJump_5B1F0
	call UnknownCall_3D2D
	jr UnknownRJump_5B1F3

UnknownRJump_5B1F0:
	call UnknownCall_3D3D

UnknownRJump_5B1F3:
	ld a, [$FF00+$E8]
	sub b
	ld [$FF00+$E8], a
	ret nz
	ld a, [$FF00+$EA]
	dec a
	ld [$FF00+$EA], a
	jr z, UnknownRJump_5B20B
	ld a, [$FF00+$E9]
	ld [$FF00+$E8], a
	ld a, [$FF00+$E0]
	xor $01
	ld [$FF00+$E0], a
	ret

UnknownRJump_5B20B:
	xor a
	ld [$FF00+$E2], a
	ld a, 2
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld a, [$FF00+$DB]
	inc a
	ld [$FF00+$DB], a
	cp 124
	ret nz
	ld a, 32
	ld [$FF00+$EC], a
	ld a, 3
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_5B232
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_5B232:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld a, [$FF00+$DB]
	dec a
	ld [$FF00+$DB], a
	cp 122
	ret nz
	jr UnknownRJump_5B1D3
	ld a, [$FF00+$DF]
	rst $28

UnknownData_5B244:
INCBIN "baserom.gb", $5B244, $5B24A - $5B244

	ld a, 72
	ld [$FF00+$E2], a
	ld a, 1
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_5B260
	call UnknownCall_5B473
	call UnknownCall_3D2D
	jr UnknownRJump_5B266

UnknownRJump_5B260:
	call UnknownCall_5B44D
	call UnknownCall_3D2D

UnknownRJump_5B266:
	ld a, [$FF00+$E0]
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$E8]
	xor $01
	ld [$FF00+$E8], a
	ret z
	jp UnknownJump_59D33
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_5B284
	call UnknownCall_5B473
	call UnknownCall_3D3D
	jr UnknownRJump_5B266

UnknownRJump_5B284:
	call UnknownCall_5B44D
	call UnknownCall_3D3D
	jr UnknownRJump_5B266
	ld a, [$FF00+$DF]
	rst $28

UnknownData_5B28F:
INCBIN "baserom.gb", $5B28F, $5B295 - $5B28F

	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_5B2A2
	call UnknownCall_5B473
	call UnknownCall_3D22
	jr UnknownRJump_5B266

UnknownRJump_5B2A2:
	call UnknownCall_5B44D
	call UnknownCall_3D22
	jr UnknownRJump_5B266
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_5B2B7
	call UnknownCall_5B473
	call UnknownCall_3D32
	jr UnknownRJump_5B266

UnknownRJump_5B2B7:
	call UnknownCall_5B44D
	call UnknownCall_3D32
	jr UnknownRJump_5B266

UnknownCall_5B2BF:
	ld a, [$FF00+$D6]
	ld h, a
	ld a, [$FF00+$D7]
	ld l, a
	dec hl
	dec hl
	ld de, $FFD0
	ld b, 5
	call UnknownCall_3CAA
	call UnknownCall_3AA0
	ld a, 1
	ld [$FF00+$D8], a
	ret

UnknownJump_5B2D7:
UnknownCall_5B2D7:
	ld a, [$AF26]
	and a
	jr nz, UnknownRJump_5B2F0
	ld hl, $FFD6
	ld a, [hli]
	cp 173
	jr nc, UnknownRJump_5B2F0
	ld d, a
	ld a, [hli]
	ld e, a
	ld a, [$FF00+$D2]
	cp 16
	jr z, UnknownRJump_5B2EF
	xor a

UnknownRJump_5B2EF:
	ld [de], a

UnknownRJump_5B2F0:
	ld a, [$FF00+$D8]
	dec a
	jr z, UnknownRJump_5B305
	ld hl, $AF41
	dec [hl]
	ld a, [$AF26]
	cp 1
	jr nz, UnknownRJump_5B309
	call UnknownCall_5B31D
	jr UnknownRJump_5B309

UnknownRJump_5B305:
	ld hl, $AF40
	dec [hl]

UnknownRJump_5B309:
	xor a
	ld hl, $FFD0
	ld b, 32

UnknownRJump_5B30F:
	ld [hli], a
	dec b
	jr nz, UnknownRJump_5B30F
	ld a, 2
	ld [$AF3E], a
	xor a
	ld [$AF26], a
	ret

UnknownCall_5B31D:
	ld a, [$A28D]
	add 1
	daa
	ld [$A28D], a
	ret nz
	ld a, 28
	ld [$AF37], a
	ld a, 26
	ld [$AF36], a
	call UnknownCall_5B346
	ld a, 8
	ld [$A460], a
	ret

UnknownCall_5B33A:
	ld a, [$FF00+$E8]
	jr UnknownRJump_5B340

UnknownCall_5B33E:
	ld a, [$FF00+$E9]

UnknownRJump_5B340:
	ld e, a
	ld d, 0
	add de
	ld b, [hl]
	ret

UnknownCall_5B346:
	ld hl, $ACE8
	ld de, $0020

UnknownRJump_5B34C:
	add de
	ld a, [hl]
	and a
	jr nz, UnknownRJump_5B34C
	ld a, h
	cp 175
	jr z, UnknownRJump_5B3AE
	ld a, l
	and $F0
	ld l, a
	ld a, [$FFCB]
	ld [hli], a
	ld a, [$FFCA]
	ld [hli], a
	inc l
	ld a, [$FFC9]
	ld [hli], a
	ld a, [$FFC8]
	ld [hli], a
	jr UnknownRJump_5B38C

UnknownCall_5B36D:
	ld hl, $ACE8
	ld de, $0020

UnknownRJump_5B373:
	add de
	ld a, [hl]
	and a
	jr nz, UnknownRJump_5B373
	ld a, h
	cp 175
	jr z, UnknownRJump_5B3AE
	ld d, h
	ld a, l
	and $F0
	ld e, a
	ld hl, $FFD0
	ld b, 5
	call UnknownCall_3CAA
	ld h, d
	ld l, e

UnknownRJump_5B38C:
	ld a, [$AF36]
	ld [hli], a
	ld a, [$AF28]
	ld [hli], a
	ld a, [$AF29]
	and $F0
	ld [hli], a
	ld a, 1
	ld [hl], a
	ld a, l
	add 3
	ld l, a
	ld a, [$AF37]
	ld [hli], a
	inc l
	ld a, [$AF38]
	ld [hl], a
	ld hl, $AF40
	inc [hl]

UnknownRJump_5B3AE:
	xor a
	ld [$AF36], a
	ld [$AF37], a
	ld [$AF38], a
	ret

UnknownData_5B3B9:
INCBIN "baserom.gb", $5B3B9, $5B3C6 - $5B3B9


UnknownCall_5B3C6:
	call UnknownCall_5B3E0
	ld a, [$AF2C]
	dec a
	jr z, UnknownRJump_5B3D7
	ld a, 1
	ld [$FF00+$DF], a
	xor a
	ld [$FF00+$DD], a
	ret

UnknownRJump_5B3D7:
	ld a, 2
	ld [$FF00+$DF], a
	ld a, 32
	ld [$FF00+$DD], a
	ret

UnknownCall_5B3E0:
	xor a
	ld [$AF2C], a
	ld hl, $FFD0
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld a, [$AF31]
	cp b
	jr c, UnknownRJump_5B3F8
	jr z, UnknownRJump_5B3FE

UnknownRJump_5B3F2:
	ld a, 1
	ld [$AF2C], a
	ret

UnknownRJump_5B3F8:
	ld a, 255
	ld [$AF2C], a
	ret

UnknownRJump_5B3FE:
	ld a, [$AF30]
	cp c
	ret z
	jr c, UnknownRJump_5B3F8
	jr UnknownRJump_5B3F2

UnknownCall_5B407:
	call UnknownCall_5B41A
	ld a, [$AF2C]
	dec a
	jr z, UnknownRJump_5B415
	ld a, 1
	ld [$FF00+$DF], a
	ret

UnknownRJump_5B415:
	ld a, 2
	ld [$FF00+$DF], a
	ret

UnknownCall_5B41A:
	xor a
	ld [$AF2C], a
	ld hl, $FFD3
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld a, [$AF33]
	cp b
	jr c, UnknownRJump_5B432
	jr z, UnknownRJump_5B438

UnknownRJump_5B42C:
	ld a, 1
	ld [$AF2C], a
	ret

UnknownRJump_5B432:
	ld a, 255
	ld [$AF2C], a
	ret

UnknownRJump_5B438:
	ld a, [$AF32]
	cp c
	ret z
	jr c, UnknownRJump_5B432
	jr UnknownRJump_5B42C

UnknownCall_5B441:
	ld c, 8
	jr UnknownRJump_5B453

UnknownCall_5B445:
	ld c, 12
	jr UnknownRJump_5B453

UnknownCall_5B449:
	ld c, 15
	jr UnknownRJump_5B453

UnknownCall_5B44D:
	ld c, 18
	jr UnknownRJump_5B453

UnknownCall_5B451:
	ld c, 21

UnknownRJump_5B453:
	ld hl, $7488

UnknownRJump_5B456:
	ld a, [$FF00+$E0]
	ld e, a
	ld d, 0
	add de
	ld b, [hl]
	ld hl, $FFE0
	ld a, [hl]
	cp c
	ret z
	inc [hl]
	ret

UnknownCall_5B465:
	ld c, 8
	ld hl, $74AB
	jr UnknownRJump_5B456

UnknownCall_5B46C:
	ld c, 12
	ld hl, $74A7
	jr UnknownRJump_5B456

UnknownCall_5B473:
	ld c, 18
	ld hl, $74A1
	jr UnknownRJump_5B456

UnknownCall_5B47A:
	ld c, 21
	ld hl, $749E
	jr UnknownRJump_5B456

UnknownCall_5B481:
	ld c, 15
	ld hl, $74A4
	jr UnknownRJump_5B456

UnknownData_5B488:
INCBIN "baserom.gb", $5B488, $5B4B4 - $5B488


UnknownCall_5B4B4:
	ld hl, $FFD1
	ld a, [$AF30]
	sub [hl]
	bit 7, a
	ret z
	cpl
	inc a
	ret

UnknownCall_5B4C1:
	ld hl, $FFC0
	ld a, [hli]
	ld [$FF00+$D4], a
	ld a, [hli]
	ld [$FF00+$D3], a
	ld a, [hli]
	ld [$FF00+$D1], a
	ld a, [hl]
	ld [$FF00+$D0], a
	ld b, 8
	call UnknownCall_3D32
	ld a, [$A216]
	and a
	jr z, UnknownRJump_5B4E5
	ld a, [$A291]
	and a
	jr nz, UnknownRJump_5B4EF
	ld b, 5
	jr UnknownRJump_5B4F1

UnknownRJump_5B4E5:
	ld a, [$A291]
	and a
	jr z, UnknownRJump_5B4EF
	ld b, 20
	jr UnknownRJump_5B4F1

UnknownRJump_5B4EF:
	ld b, 14

UnknownRJump_5B4F1:
	call UnknownCall_3D3D
	ret

UnknownCall_5B4F5:
	ld a, [$FF00+$D6]
	ld h, a
	ld a, [$FF00+$D7]
	ld l, a
	ld de, $FFD0
	ld b, 5
	call UnknownCall_3CAA
	inc l
	inc l
	inc l
	ld a, [hl]
	sub 2
	jr z, UnknownRJump_5B50D
	ld a, 1

UnknownRJump_5B50D:
	ld [$AF07], a
	ret

UnknownCall_5B511:
	ld a, [$FF00+$F0]
	and $07
	ret nz
	jr UnknownRJump_5B526

UnknownCall_5B518:
	jr UnknownRJump_5B526

UnknownCall_5B51A:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	jr UnknownRJump_5B526

UnknownCall_5B521:
	ld a, [$FF00+$F0]
	and $01
	ret nz

UnknownRJump_5B526:
	ld a, [$FF00+$DB]
	xor $01
	ld [$FF00+$DB], a
	ret

UnknownData_5B52D:
INCBIN "baserom.gb", $5B52D, $5B539 - $5B52D


UnknownCall_5B539:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld a, [$FF00+$DB]
	xor $1B
	ld [$FF00+$DB], a
	ret

UnknownCall_5B545:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	jr UnknownRJump_5B551

UnknownCall_5B54C:
	ld a, [$FF00+$F0]
	and $01
	ret nz

UnknownRJump_5B551:
	ld hl, $FFEA
	inc [hl]
	ld a, [hl]
	cp 4
	jr nz, UnknownRJump_5B562
	xor a
	ld [hl], a
	ld a, [$FF00+$DD]
	res 5, a
	ld [$FF00+$DD], a

UnknownRJump_5B562:
	ld hl, $757A
	ld e, a
	ld d, 0
	add de
	ld a, [$FF00+$DB]
	add [hl]
	ld [$FF00+$DB], a
	ld a, [$FF00+$EA]
	cp 3
	ret nz
	ld a, [$FF00+$DD]
	set 5, a
	ld [$FF00+$DD], a
	ret

UnknownData_5B57A:
INCBIN "baserom.gb", $5B57A, $5B57E - $5B57A


UnknownCall_5B57E:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	jr UnknownRJump_5B58A

UnknownCall_5B585:
	ld a, [$FF00+$F0]
	and $01
	ret nz

UnknownRJump_5B58A:
	ld hl, $FFEA
	inc [hl]
	ld a, [hl]
	cp 4
	jr nz, UnknownRJump_5B595
	xor a
	ld [hl], a

UnknownRJump_5B595:
	ld hl, $75A2
	ld e, a
	ld d, 0
	add de
	ld a, [$FF00+$DB]
	add [hl]
	ld [$FF00+$DB], a
	ret

UnknownData_5B5A2:
INCBIN "baserom.gb", $5B5A2, $5B5A6 - $5B5A2


UnknownCall_5B5A6:
	ld a, [$FF00+$F0]
	and $07
	ret nz
	jr UnknownRJump_5B5BB

UnknownCall_5B5AD:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	jr UnknownRJump_5B5BB

UnknownCall_5B5B4:
	jr UnknownRJump_5B5BB

UnknownCall_5B5B6:
	ld a, [$FF00+$F0]
	and $01
	ret nz

UnknownRJump_5B5BB:
	ld hl, $FFEA
	inc [hl]
	ld a, [hl]
	cp 3
	jr nz, UnknownRJump_5B5C6
	xor a
	ld [hl], a

UnknownRJump_5B5C6:
	ld hl, $75D3
	ld e, a
	ld d, 0
	add de
	ld a, [$FF00+$DB]
	add [hl]
	ld [$FF00+$DB], a
	ret

UnknownData_5B5D3:
INCBIN "baserom.gb", $5B5D3, $5B5D8 - $5B5D3


UnknownCall_5B5D8:
	ld a, [$FF00+$F0]
	and $07
	ret nz
	jr UnknownRJump_5B5EB

UnknownCall_5B5DF:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	jr UnknownRJump_5B5EB

UnknownCall_5B5E6:
	ld a, [$FF00+$F0]
	and $01
	ret nz

UnknownRJump_5B5EB:
	ld hl, $FFEA
	inc [hl]
	ld a, [hl]
	cp 4
	jr nz, UnknownRJump_5B5F6
	xor a
	ld [hl], a

UnknownRJump_5B5F6:
	ld hl, $7603
	ld e, a
	ld d, 0
	add de
	ld a, [$FF00+$DB]
	add [hl]
	ld [$FF00+$DB], a
	ret

UnknownData_5B603:
INCBIN "baserom.gb", $5B603, $5B607 - $5B603


UnknownCall_5B607:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld hl, $FFEA
	inc [hl]
	ld a, [hl]
	cp 4
	jr nz, UnknownRJump_5B61D
	xor a
	ld [hl], a
	ld a, [$FF00+$DD]
	res 5, a
	ld [$FF00+$DD], a

UnknownRJump_5B61D:
	ld hl, $7635
	ld e, a
	ld d, 0
	add de
	ld a, [$FF00+$DB]
	add [hl]
	ld [$FF00+$DB], a
	ld a, [$FF00+$EA]
	cp 3
	ret nz
	ld a, [$FF00+$DD]
	set 5, a
	ld [$FF00+$DD], a
	ret

UnknownData_5B635:
INCBIN "baserom.gb", $5B635, $5B639 - $5B635


UnknownCall_5B639:
	ld hl, $FFEA
	inc [hl]
	ld a, [hl]
	cp 8
	jr nz, UnknownRJump_5B644
	xor a
	ld [hl], a

UnknownRJump_5B644:
	ld hl, $7669
	ld e, a
	ld d, 0
	add de
	ld a, [$FF00+$DB]
	add [hl]
	ld [$FF00+$DB], a
	ld a, [$FF00+$EA]
	cp 3
	jr z, UnknownRJump_5B65B
	cp 6
	jr z, UnknownRJump_5B662
	ret

UnknownRJump_5B65B:
	ld a, [$FF00+$DD]
	set 6, a
	ld [$FF00+$DD], a
	ret

UnknownRJump_5B662:
	ld a, [$FF00+$DD]
	res 6, a
	ld [$FF00+$DD], a
	ret

UnknownData_5B669:
INCBIN "baserom.gb", $5B669, $5B678 - $5B669


UnknownCall_5B678:
	ld a, [$FF00+$F0]
	and $07
	ret nz
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a
	ret

UnknownData_5B684:
INCBIN "baserom.gb", $5B684, $5B68B - $5B684


UnknownCall_5B68B:
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$FF00+$DE]
	xor $10
	ld [$FF00+$DE], a
	ret

UnknownCall_5B697:
	ld hl, $AD12

UnknownRJump_5B69A:
	ld a, [hl]
	and a
	call nz, UnknownCall_5B6A9
	ld de, $0020
	add de
	ld a, h
	cp 175
	jr nz, UnknownRJump_5B69A
	ret

UnknownCall_5B6A9:
	ld a, [hl]
	cp 95
	ret z
	and $A0
	ret nz
	push hl
	ld a, [hli]
	ld [$AF47], a
	ld a, [hli]
	ld [$AF48], a
	ld a, [hli]
	ld [$AF49], a
	ld a, [hli]
	ld [$AF4A], a
	ld a, [hli]
	ld [$AF4B], a
	ld a, l
	sub 14
	ld l, a
	ld a, [hli]
	ld [$AF4C], a
	ld b, a
	ld a, [hl]
	ld [$AF4D], a
	ld c, a
	ld a, [$AF48]
	add 3
	add b
	ld d, a
	ld a, [$AF49]
	add 10
	add b
	sub d
	ld e, a
	ld a, [$FF00+$D9]
	sub d
	cp e
	jr nc, UnknownRJump_5B708
	ld a, [$AF4A]
	sub 5
	add c
	ld d, a
	ld a, [$AF4B]
	add 5
	add c
	sub d
	ld e, a
	ld a, [$FF00+$DA]
	sub d
	cp e
	jr nc, UnknownRJump_5B708
	ld a, l
	add 13
	ld l, a
	set 4, [hl]
	ld a, 1
	ld [$AF2E], a

UnknownRJump_5B708:
	pop hl
	ret

UnknownData_5B70A:
INCBIN "baserom.gb", $5B70A, $5C000 - $5B70A



SECTION "bank17", ROMX, BANK[$17]


UnknownData_5C000:
INCBIN "baserom.gb", $5C000, $60000 - $5C000



SECTION "bank18", ROMX, BANK[$18]


UnknownData_60000:
INCBIN "baserom.gb", $60000, $60028 - $60000

	ld a, [$A7A6]
	add a
	ld d, 0
	ld e, a
	ld hl, $4037
	add de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

UnknownData_60037:
INCBIN "baserom.gb", $60037, $6004F - $60037

	call UnknownCall_6046A
	ld a, [$A69A]
	and $01
	jp z, UnknownJump_60461
	ld a, [$FFC5]
	cp 40
	jr nz, UnknownRJump_6006E
	ld a, 1
	ld [$A7A6], a
	call UnknownCall_60C41
	ld [$FFC6], a
	jr UnknownRJump_60097

UnknownRJump_6006E:
	inc a
	ld [$FFC5], a
	ld a, [$A69A]
	and $02
	jr z, UnknownRJump_60088
	ld a, [$A795]
	inc a
	ld [$A795], a
	cp 3
	jr c, UnknownRJump_60088
	xor a
	ld [$A795], a

UnknownRJump_60088:
	call UnknownCall_60C41
	ld e, a
	ld a, [$A795]
	add e
	inc a
	ld [$FFC6], a
	jp UnknownJump_60461

UnknownRJump_60097:
	call UnknownCall_6046A
	ld a, [$FF80]
	bit 0, a
	jr nz, UnknownRJump_600AC
	bit 5, a
	jr nz, UnknownRJump_600B9
	bit 4, a
	jr nz, UnknownRJump_600C6
	jp UnknownJump_60461

UnknownRJump_600AC:
	ld a, 4
	ld [$A7A6], a
	ld a, 16
	ld [$A7A7], a
	jp UnknownJump_60182

UnknownRJump_600B9:
	ld a, 2
	ld [$A7A6], a
	ld a, 32
	ld [$A7A7], a
	jp UnknownJump_600D3

UnknownRJump_600C6:
	ld a, 3
	ld [$A7A6], a
	ld a, 32
	ld [$A7A7], a
	jp UnknownJump_6012B

UnknownJump_600D3:
	call UnknownCall_6046A
	ld a, [$A69A]
	and $03
	jp z, UnknownJump_60461
	ld a, [$FFC5]
	cp 40
	jp z, UnknownJump_6011D
	ld a, [$A7A7]
	or a
	jr z, UnknownRJump_6011D
	dec a
	ld [$A7A7], a
	ld a, [$FFC5]
	dec a
	ld [$FFC5], a
	ld a, [$A69A]
	and $02
	jr z, UnknownRJump_6010D
	ld a, [$A795]
	inc a
	ld [$A795], a
	cp 3
	jr c, UnknownRJump_6010D
	xor a
	ld [$A795], a

UnknownRJump_6010D:
	call UnknownCall_60C41
	ld e, a
	ld a, [$A795]
	add e
	add 5
	ld [$FFC6], a
	jp UnknownJump_60461

UnknownJump_6011D:
UnknownRJump_6011D:
	ld a, 1
	ld [$A7A6], a
	call UnknownCall_60C41
	ld [$FFC6], a
	jp UnknownJump_60461

UnknownJump_6012B:
	call UnknownCall_6046A
	ld a, [$A69A]
	and $03
	jp z, UnknownJump_60461
	ld a, [$FFC5]
	cp 136
	jp z, UnknownJump_60174
	ld a, [$A7A7]
	or a
	jr z, UnknownRJump_60174
	dec a
	ld [$A7A7], a
	ld a, [$FFC5]
	inc a
	ld [$FFC5], a
	ld a, [$A69A]
	and $02
	jr z, UnknownRJump_60165
	ld a, [$A795]
	inc a
	ld [$A795], a
	cp 3
	jr c, UnknownRJump_60165
	xor a
	ld [$A795], a

UnknownRJump_60165:
	call UnknownCall_60C41
	ld e, a
	ld a, [$A795]
	add e
	inc a
	ld [$FFC6], a
	jp UnknownJump_60461

UnknownJump_60174:
UnknownRJump_60174:
	ld a, 1
	ld [$A7A6], a
	call UnknownCall_60C41
	ld [$FFC6], a
	jp UnknownJump_60461

UnknownJump_60182:
	call UnknownCall_60269
	ld a, [$A69A]
	and $03
	jp z, UnknownJump_60461
	ld a, [$A7A7]
	or a
	jr z, UnknownRJump_601D9
	dec a
	ld [$A7A7], a
	ld b, 0
	ld c, a
	ld hl, $421A
	add bc
	ld a, [hl]
	ld c, a
	ld a, [$FFC4]
	add c
	ld [$FFC4], a
	call UnknownCall_60C41
	add 8
	ld [$FFC6], a
	ld a, [$A7A7]
	cp 8
	call z, UnknownCall_601BA
	jp UnknownJump_60461

UnknownCall_601BA:
	ld hl, $A7ED
	ld d, 0
	ld a, [$FFC5]
	sub 40
	and $60
	swap a
	rrca
	ld e, a
	add de
	add de
	add de
	ld a, 1
	ld [hl], a
	call UnknownCall_610DD
	ld a, 8
	ld [$A468], a
	ret

UnknownRJump_601D9:
	ld a, 5
	ld [$A7A6], a
	call UnknownCall_60C41
	ld [$FFC6], a
	ld hl, $A7D2
	ld d, 0
	ld a, [$A7B0]
	ld e, a
	add de
	add de
	add de
	ld a, 0
	ld [hl], a
	ld hl, $A7D2
	ld d, 0
	ld a, [$A7B1]
	ld e, a
	add de
	add de
	add de
	ld a, 0
	ld [hl], a
	call UnknownCall_610DD
	ld a, [$FFC5]
	sub 4
	ld [$A6DF], a
	ld a, 42
	ld [$A6E1], a
	ld a, 3
	ld [$A7B3], a
	jp UnknownJump_6022A

UnknownData_6021A:
INCBIN "baserom.gb", $6021A, $6022A - $6021A


UnknownJump_6022A:
	ld a, [$A69A]
	and $01
	jp z, UnknownJump_60461
	ld a, 4
	ld [$A478], a
	ld a, [$A69A]
	and $02
	jr z, UnknownRJump_6024B
	ld a, [$A6E1]
	inc a
	cp 45
	jr c, UnknownRJump_60248
	ld a, 42

UnknownRJump_60248:
	ld [$A6E1], a

UnknownRJump_6024B:
	ld a, [$A7B3]
	cp 3
	call z, UnknownCall_60290
	ld a, [$A7B3]
	cp 1
	call z, UnknownCall_60314
	ld a, [$A7B3]
	cp 2
	call z, UnknownCall_6032A
	call UnknownCall_60269
	jp UnknownJump_60461

UnknownCall_60269:
	ld b, 37
	ld a, [$A69A]
	bit 6, a
	jp z, UnknownJump_60275
	ld b, 38

UnknownJump_60275:
	ld hl, $A6C6
	ld d, 0
	ld a, [$A7B0]
	ld e, a
	add de
	add de
	add de
	ld [hl], b
	ld hl, $A6C6
	ld d, 0
	ld a, [$A7B1]
	ld e, a
	add de
	add de
	add de
	ld [hl], b
	ret

UnknownCall_60290:
	ld a, [$A6E0]
	dec a
	ld [$A6E0], a
	and $07
	jr nz, UnknownRJump_602E9
	ld b, 0
	ld a, [$A6E0]
	and $F8
	sub 16
	sla a
	rl b
	sla a
	rl b
	ld c, a
	ld a, [$A6DF]
	sub 12
	srl a
	srl a
	srl a
	ld h, 152
	ld l, a
	add bc
	push hl
	ld hl, $FF41

UnknownRJump_602C0:
	bit 4, [hl]
	jr nz, UnknownRJump_602C0
	pop hl
	ld a, [hli]
	ld b, a
	ld a, [hl]
	cp 61
	jr z, UnknownRJump_602D3
	ld a, b
	cp 60
	jr z, UnknownRJump_602DE
	jr UnknownRJump_602E9

UnknownRJump_602D3:
	ld a, 1
	ld [$A7B3], a
	ld a, 32
	ld [$A7B4], a
	ret

UnknownRJump_602DE:
	ld a, 2
	ld [$A7B3], a
	ld a, 32
	ld [$A7B4], a
	ret

UnknownRJump_602E9:
	ld a, [$A6E0]
	cp 42
	ret nc
	ld a, 6
	ld [$A7A6], a
	ld a, [$A6DF]
	sub 4
	ld [$A6E2], a
	ld a, [$A6DF]
	sub 36
	and $60
	swap a
	rrca
	ld [$A7A8], a
	ld a, 255
	ld [$A6E1], a
	ld a, 39
	ld [$A6E4], a
	ret

UnknownCall_60314:
	ld a, [$A6DF]
	inc a
	ld [$A6DF], a
	ld a, [$A7B4]
	dec a
	ld [$A7B4], a
	or a
	ret nz
	ld a, 3
	ld [$A7B3], a
	ret

UnknownCall_6032A:
	ld a, [$A6DF]
	dec a
	ld [$A6DF], a
	ld a, [$A7B4]
	dec a
	ld [$A7B4], a
	or a
	ret nz
	ld a, 3
	ld [$A7B3], a
	ret
	call UnknownCall_60269
	ld a, [$A6E4]
	cp 255
	jr z, UnknownRJump_60373
	ld a, [$A69A]
	and $0F
	jp nz, UnknownJump_60461
	ld a, [$A6E4]
	cp 39
	call z, UnknownCall_603F9
	ld a, [$A6E4]
	cp 41
	call z, UnknownCall_6042D
	ld a, [$A6E4]
	cp 255
	jr z, UnknownRJump_60373
	ld a, [$A6E4]
	inc a
	ld [$A6E4], a
	jp UnknownJump_60461

UnknownRJump_60373:
	ld a, [$A7A8]
	ld d, 0
	ld e, a
	ld hl, $A6B9
	add de
	add de
	add de
	ld a, [hl]
	inc a
	ld [hl], a
	cp 112
	jr c, UnknownRJump_603AA
	ld a, 7
	ld [$A7A6], a
	ld hl, $A6BA
	ld a, [$A7A8]
	ld d, 0
	ld e, a
	add de
	add de
	add de
	ld a, 255
	ld [hl], a
	call UnknownCall_60917
	ld a, 20
	ld [$A7A7], a
	ld a, 116
	ld [$A6E3], a
	jp UnknownJump_60433

UnknownRJump_603AA:
	call UnknownCall_60C41
	ld [$FFC6], a
	ld hl, $A6B8
	ld a, [$A7A8]
	ld d, 0
	ld e, a
	add de
	add de
	add de
	ld a, [hl]
	add 8
	ld b, a
	ld a, [$FFC5]
	cp b
	jp z, UnknownJump_60461
	jr c, UnknownRJump_603CE
	dec a
	ld c, 5
	jr UnknownRJump_603D1

UnknownRJump_603CE:
	inc a
	ld c, 1

UnknownRJump_603D1:
	ld [$FFC5], a
	ld a, [$A69A]
	and $03
	jr nz, UnknownRJump_603EA
	ld a, [$A795]
	inc a
	ld [$A795], a
	cp 3
	jr c, UnknownRJump_603EA
	xor a
	ld [$A795], a

UnknownRJump_603EA:
	call UnknownCall_60C41
	ld e, a
	ld a, [$A795]
	add e
	add c
	ld [$FFC6], a
	jp UnknownJump_60461

UnknownCall_603F9:
	ld a, [$A7A8]
	and $03
	rlca
	rlca
	add 3
	ld hl, $9840
	ld d, 0
	ld e, a
	add de
	push hl
	ld hl, $FF41

UnknownRJump_6040D:
	bit 4, [hl]
	jr nz, UnknownRJump_6040D
	pop hl
	ld a, 255
	ld [hli], a
	ld [hl], a
	ld de, $001F
	add de
	push hl
	ld hl, $FF41

UnknownRJump_6041E:
	bit 4, [hl]
	jr nz, UnknownRJump_6041E
	pop hl
	ld a, 255
	ld [hli], a
	ld [hl], a
	ld a, 22
	ld [$A468], a
	ret

UnknownCall_6042D:
	ld a, 255
	ld [$A6E4], a
	ret

UnknownJump_60433:
	ld a, [$A69A]
	and $03
	jp nz, UnknownJump_60461
	call UnknownCall_606AA
	jp UnknownJump_60461

UnknownData_60441:
INCBIN "baserom.gb", $60441, $60444 - $60441

	ld a, [$A69A]
	and $01
	jp z, UnknownJump_60461
	ld a, [$A7A7]
	dec a
	ld [$A7A7], a
	or a
	jr nz, UnknownRJump_60461
	ld a, 10
	ld [$A7A6], a
	jp UnknownJump_60461

UnknownData_6045E:
INCBIN "baserom.gb", $6045E, $60461 - $6045E


UnknownJump_60461:
UnknownRJump_60461:
	call UnknownCall_6106D
	call UnknownCall_3F44
	jp UnknownJump_3E07

UnknownCall_6046A:
	ld a, [$A69A]
	and $07
	jp nz, UnknownJump_604F3
	ld a, [$A7B0]
	ld c, a
	ld b, 0
	ld hl, $A6C6
	add bc
	add bc
	add bc
	ld a, 255
	ld [hl], a

UnknownRJump_60481:
	push bc
	ld a, [$FF00+$04]
	ld b, a
	swap a
	add b
	ld b, a
	ld a, [$A7B7]
	add b
	ld b, a
	ld a, [$FF97]
	add b
	ld [$A7B7], a
	pop bc
	and $0F
	cp 9
	jr nc, UnknownRJump_60481
	ld c, a
	ld a, [$A7B1]
	cp c
	jr z, UnknownRJump_60481
	ld a, c
	ld [$A7B0], a
	ld b, 0
	ld hl, $A6C6
	add bc
	add bc
	add bc
	ld a, 37
	ld [hl], a
	ld a, [$A7B1]
	ld c, a
	ld b, 0
	ld hl, $A6C6
	add bc
	add bc
	add bc
	ld a, 255
	ld [hl], a

UnknownRJump_604C1:
	push bc
	ld a, [$FF00+$04]
	ld b, a
	swap a
	add b
	ld b, a
	ld a, [$A7B7]
	add b
	ld b, a
	ld a, [$FF97]
	add b
	ld [$A7B7], a
	pop bc
	and $0F
	cp 9
	jr nc, UnknownRJump_604C1
	ld c, a
	ld a, [$A7B0]
	cp c
	jr z, UnknownRJump_604C1
	ld a, c
	ld [$A7B1], a
	ld b, 0
	ld hl, $A6C6
	add bc
	add bc
	add bc
	ld a, 37
	ld [hl], a
	ret

UnknownJump_604F3:
	ld a, [$A7B0]
	ld c, a
	ld b, 0
	ld hl, $A6C6
	add bc
	add bc
	add bc
	ld a, 37
	ld [hl], a
	ld a, [$A7B1]
	ld c, a
	ld b, 0
	ld hl, $A6C6
	add bc
	add bc
	add bc
	ld a, 37
	ld [hl], a
	ret
	ld a, [$A7A6]
	add a
	ld d, 0
	ld e, a
	ld hl, $4521
	add de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

UnknownData_60521:
INCBIN "baserom.gb", $60521, $60539 - $60521

	ld a, [$A69A]
	and $01
	jp z, UnknownJump_607AA
	ld a, [$FFC5]
	cp 32
	jr nz, UnknownRJump_60559
	ld a, 1
	ld [$A7A6], a
	call UnknownCall_60C41
	ld [$FFC6], a
	xor a
	ld [$A7B2], a
	jr UnknownRJump_60582

UnknownRJump_60559:
	inc a
	ld [$FFC5], a
	ld a, [$A69A]
	and $02
	jr z, UnknownRJump_60573
	ld a, [$A795]
	inc a
	ld [$A795], a
	cp 3
	jr c, UnknownRJump_60573
	xor a
	ld [$A795], a

UnknownRJump_60573:
	call UnknownCall_60C41
	ld e, a
	ld a, [$A795]
	add e
	inc a
	ld [$FFC6], a
	jp UnknownJump_607AA

UnknownRJump_60582:
	ld a, [$FF81]
	and $01
	jr z, UnknownRJump_6059A
	ld a, 2
	ld [$A7A6], a
	ld a, 24
	ld [$A7A7], a
	ld a, 8
	ld [$A468], a
	jr UnknownRJump_605A0

UnknownRJump_6059A:
	call UnknownCall_60800
	jp UnknownJump_607AA

UnknownRJump_605A0:
	ld a, [$A69A]
	and $03
	jr nz, UnknownRJump_605C7
	ld a, [$A7A7]
	or a
	jr nz, UnknownRJump_605B9
	ld a, 3
	ld [$A7A6], a
	ld a, 0
	ld [$A7A7], a
	jr UnknownRJump_605CA

UnknownRJump_605B9:
	ld a, [$A7A7]
	dec a
	ld [$A7A7], a
	ld a, [$A6BC]
	inc a
	ld [$A6BC], a

UnknownRJump_605C7:
	jp UnknownJump_607AA

UnknownRJump_605CA:
	ld a, [$A69A]
	and $03
	jr nz, UnknownRJump_605EB
	ld a, [$A6BD]
	cp 35
	jr c, UnknownRJump_605E4
	ld a, 4
	ld [$A7A6], a
	ld a, 32
	ld [$A7A7], a
	jr UnknownRJump_605EE

UnknownRJump_605E4:
	ld a, [$A6BD]
	inc a
	ld [$A6BD], a

UnknownRJump_605EB:
	jp UnknownJump_607AA

UnknownRJump_605EE:
	ld a, [$A69A]
	and $03
	jr nz, UnknownRJump_60619
	ld a, [$A7A7]
	or a
	jr nz, UnknownRJump_60602
	ld a, 5
	ld [$A7A6], a
	jr UnknownRJump_60639

UnknownRJump_60602:
	ld a, [$A7A7]
	dec a
	ld [$A7A7], a
	or a
	call z, UnknownCall_6062D
	ld a, [$A6BC]
	dec a
	ld [$A6BC], a
	cp 72
	call z, UnknownCall_6061C

UnknownRJump_60619:
	jp UnknownJump_607AA

UnknownCall_6061C:
	ld a, [$A7B2]
	cp 1
	ret z
	ld a, 9
	ld [$A7A6], a
	ld a, 17
	ld [$A460], a
	ret

UnknownCall_6062D:
	ld a, [$A7B2]
	cp 1
	ret nz
	ld a, 22
	ld [$A468], a
	ret

UnknownRJump_60639:
	ld a, [$A69A]
	bit 0, a
	jr nz, UnknownRJump_60658
	ld a, [$A6B8]
	cp 29
	jr nc, UnknownRJump_6064E
	ld a, 6
	ld [$A7A6], a
	jr UnknownRJump_6065B

UnknownRJump_6064E:
	ld a, [$A6B8]
	dec a
	ld [$A6B8], a
	ld [$A6BB], a

UnknownRJump_60658:
	jp UnknownJump_607AA

UnknownRJump_6065B:
	ld a, [$A69A]
	and $03
	jr nz, UnknownRJump_6067C
	ld a, [$A6BD]
	cp 33
	jr nz, UnknownRJump_60675
	ld a, 7
	ld [$A7A6], a
	ld a, 25
	ld [$A7A7], a
	jr UnknownRJump_6067F

UnknownRJump_60675:
	ld a, [$A6BD]
	dec a
	ld [$A6BD], a

UnknownRJump_6067C:
	jp UnknownJump_607AA

UnknownRJump_6067F:
	ld a, [$A69A]
	and $03
	jp nz, UnknownJump_607AA
	ld a, [$A7A7]
	or a
	jr z, UnknownRJump_60694
	dec a
	ld [$A7A7], a
	jp UnknownJump_607AA

UnknownRJump_60694:
UnknownData_60694:
INCBIN "baserom.gb", $60694, $6069C - $60694

	ld a, [$A69A]
	and $03
	jp nz, UnknownJump_607AA
	call UnknownCall_606AA
	jp UnknownJump_607AA

UnknownCall_606AA:
	ld a, [$A7A8]
	cp 3
	jr nc, UnknownRJump_60711
	ld a, [$A69A]
	and $0C
	jr nz, UnknownRJump_606BE
	ld a, [$A7AC]
	ld e, a
	jr UnknownRJump_606DF

UnknownRJump_606BE:
	cp 4
	jr nz, UnknownRJump_606C6
	ld b, 0
	jr UnknownRJump_606DF

UnknownRJump_606C6:
	cp 8
	jr nz, UnknownRJump_606D7
	ld a, [$A7AB]
	ld e, a
	or a
	jr nz, UnknownRJump_606DF
	ld a, [$A7AC]
	ld e, a
	jr UnknownRJump_606DF

UnknownRJump_606D7:
	ld b, 0
	jr UnknownRJump_606DF

UnknownJump_606DB:
	ld a, [$A7AC]
	ld e, a

UnknownRJump_606DF:
	ld d, 0
	ld hl, $4C4D
	add de
	ld a, [hl]
	ld [$FFC6], a
	ld a, [$A7A7]
	dec a
	ld [$A7A7], a
	or a
	ret nz
	ld a, [$A7AC]
	ld [$A216], a
	ld d, 0
	ld e, a
	ld hl, $4C4D
	add de
	ld a, [hl]
	ld [$FFC6], a
	ld a, 9
	ld [$A7A6], a
	ld a, 20
	ld [$A7A7], a
	call UnknownCall_2934
	ret

UnknownRJump_60711:
	ld c, 30
	ld a, [$A7A8]
	cp 3
	jr nz, UnknownRJump_60723
	ld c, 29
	ld a, [$A68B]
	cp 14
	jr z, UnknownRJump_6073D

UnknownRJump_60723:
	ld a, c
	ld [$A6DB], a
	ld a, [$A6DA]
	cp 96
	jr c, UnknownRJump_60735
	dec a
	ld [$A6DA], a
	jp UnknownJump_606DB

UnknownRJump_60735:
	ld a, 255
	ld [$A6DB], a
	jp UnknownJump_606DB

UnknownRJump_6073D:
	ld a, c
	ld [$A6E4], a
	ld a, [$A6E3]
	cp 98
	jr c, UnknownRJump_60757
	dec a
	ld [$A6E3], a
	ld a, [$FFC5]
	sub 4
	ld [$A6E2], a
	jp UnknownJump_606DB

UnknownRJump_60757:
	ld a, 255
	ld [$A6E4], a
	ld a, 176
	ld [$A6E2], a
	jp UnknownJump_606DB
	ld a, [$A69A]
	and $01
	jp z, UnknownJump_607AA
	call UnknownCall_60772
	jp UnknownJump_607AA

UnknownCall_60772:
	ld a, [$FFC5]
	cp 232
	jr nz, UnknownRJump_6077F
	ld a, 10
	ld [$A7A6], a
	ret

UnknownRJump_6077F:
	dec a
	ld [$FFC5], a
	ld a, [$A69A]
	and $02
	jr z, UnknownRJump_60799
	ld a, [$A795]
	inc a
	ld [$A795], a
	cp 3
	jr c, UnknownRJump_60799
	xor a
	ld [$A795], a

UnknownRJump_60799:
	call UnknownCall_60C41
	ld e, a
	ld a, [$A795]
	add e
	add 5
	ld [$FFC6], a
	ret

UnknownData_607A7:
INCBIN "baserom.gb", $607A7, $607AA - $607A7


UnknownJump_607AA:
	call UnknownCall_607C5
	call UnknownCall_6083C
	call UnknownCall_6083C
	call UnknownCall_6083C
	call UnknownCall_6083C
	call UnknownCall_6083C
	call UnknownCall_6106D
	call UnknownCall_3F44
	jp UnknownJump_3E07

UnknownCall_607C5:
	ld a, 255
	ld [$A6C0], a
	ld [$A6C3], a
	ld [$A6C6], a
	ld [$A6C9], a
	ld a, [$A6BC]
	cp 62
	ret c
	ld a, 32
	ld [$A6C0], a
	ld a, [$A6BC]
	cp 70
	ret c
	ld a, 32
	ld [$A6C3], a
	ld a, [$A6BC]
	cp 78
	ret c
	ld a, 32
	ld [$A6C6], a
	ld a, [$A6BC]
	cp 86
	ret c
	ld a, 32
	ld [$A6C9], a
	ret

UnknownCall_60800:
	ld a, [$A69A]
	and $03
	ret z
	ld a, [$A6B8]
	ld e, a
	ld a, [$A7A7]
	bit 0, a
	jr nz, UnknownRJump_60822
	ld a, e
	cp 120
	jr nc, UnknownRJump_60819
	inc e
	jr UnknownRJump_60828

UnknownRJump_60819:
	ld a, [$A7A7]
	cpl
	ld [$A7A7], a
	jr UnknownRJump_60828

UnknownRJump_60822:
	ld a, e
	cp 80
	jr c, UnknownRJump_60819
	dec e

UnknownRJump_60828:
	ld a, e
	ld [$A6B8], a
	ld [$A6BB], a
	ld [$A6BE], a
	ld [$A6C1], a
	ld [$A6C4], a
	ld [$A6C7], a
	ret

UnknownCall_6083C:
	ld a, [$A7E9]
	cp 5
	jr c, UnknownRJump_60847
	xor a
	ld [$A7E9], a

UnknownRJump_60847:
	ld d, 0
	ld e, a
	ld hl, $A7D0
	add de
	ld a, [hl]
	or a
	jp z, UnknownJump_60865
	cp 1
	jp z, UnknownJump_608BB
	cp 2
	jp z, UnknownJump_608E1
	cp 3
	jp z, UnknownJump_60965

UnknownData_60862:
INCBIN "baserom.gb", $60862, $60865 - $60862


UnknownJump_60865:
	ld a, [$A69A]
	and $01
	jp nz, UnknownJump_609E4
	ld hl, $A7D5
	add de
	ld a, [hl]
	dec a
	ld [hl], a
	cp 50
	jr nc, UnknownRJump_6088C
	ld a, 142
	ld [hl], a
	ld a, 3
	ld hl, $A7D0
	add de
	ld [hl], a
	ld a, 28
	ld hl, $A7DF
	add de
	ld [hl], a
	jp UnknownJump_60965

UnknownRJump_6088C:
	ld a, [$A7A6]
	cp 3
	call z, UnknownCall_60897
	jp UnknownJump_609E4

UnknownCall_60897:
	ld hl, $A7E4
	add de
	ld a, [hl]
	cp 5
	ret nc
	ld hl, $A7D5
	add de
	ld a, [$A6BB]
	sub 12
	cp [hl]
	ret nc
	add 16
	cp [hl]
	ret c
	ld hl, $A7D0
	add de
	ld a, 1
	ld [hl], a
	ld a, 1
	ld [$A7B2], a
	ret

UnknownJump_608BB:
	ld a, [$A6BB]
	sub 4
	ld hl, $A7D5
	add de
	ld [hl], a
	ld a, [$A6BC]
	add 8
	ld hl, $A7DA
	add de
	ld [hl], a
	ld a, [$A7A6]
	cp 7
	jp nz, UnknownJump_609E4
	ld a, 2
	ld hl, $A7D0
	add de
	ld [hl], a
	jp UnknownJump_609E4

UnknownJump_608E1:
	ld hl, $A7DA
	add de
	ld a, [hl]
	inc a
	ld [hl], a
	cp 104
	jp c, UnknownJump_609E4
	ld a, 3
	ld hl, $A7D0
	add de
	ld [hl], a
	ld a, 255
	ld hl, $A7DF
	add de
	ld [hl], a
	ld a, 8
	ld [$A7A6], a
	ld a, 20
	ld [$A7A7], a
	ld hl, $A6CC
	add de
	add de
	add de
	ld a, [hl]
	sub 24
	ld [$A7A8], a
	call UnknownCall_60917
	jp UnknownJump_609E4

UnknownCall_60917:
	ld a, [$A216]
	ld [$A7AB], a
	ld [$A7AC], a
	ld a, [$A7A8]
	cp 3
	jp nc, UnknownJump_60939
	ld hl, $4C51
	ld b, 0
	ld c, a
	add bc
	ld a, [hl]
	ld [$A7AC], a
	ld a, 20
	ld [$A470], a
	ret

UnknownJump_60939:
	ld a, 9
	ld [$A460], a
	ld a, [$A7A8]
	cp 3
	jr nz, UnknownRJump_60955
	ld a, [$A22C]
	add 1
	daa
	ld [$A22C], a
	ret nc

UnknownData_6094F:
INCBIN "baserom.gb", $6094F, $60955 - $6094F


UnknownRJump_60955:
	ld a, [$A22C]
	add 3
	daa
	ld [$A22C], a
	ret nc

UnknownData_6095F:
INCBIN "baserom.gb", $6095F, $60965 - $6095F


UnknownJump_60965:
	ld a, 142
	ld hl, $A7D5
	add de
	ld [hl], a
	ld a, 96
	ld hl, $A7DA
	add de
	ld [hl], a
	ld a, [$A7AE]
	ld l, a
	ld a, [$A7AF]
	ld h, a
	ld a, [hl]
	cp 6
	jr c, UnknownRJump_6098F
	ld a, [$A7B5]
	ld [$A7AE], a
	ld l, a
	ld a, [$A7B6]
	ld [$A7AF], a
	ld h, a
	ld a, [hl]

UnknownRJump_6098F:
	ld hl, $A7E4
	add de
	ld [hl], a
	ld a, 255
	ld hl, $A6CC
	add de
	add de
	add de
	ld [hl], a
	ld a, [$A69A]
	and $01
	jp nz, UnknownJump_609E4
	ld hl, $A7DF
	add de
	ld a, [hl]
	cp 255
	jp z, UnknownJump_609E4
	or a
	jr z, UnknownRJump_609B7
	dec a
	ld [hl], a
	jp UnknownJump_609E4

UnknownRJump_609B7:
	ld hl, $A7E4
	add de
	ld a, [hl]
	cp 5
	jr z, UnknownRJump_609C9
	add 24
	ld hl, $A6CC
	add de
	add de
	add de
	ld [hl], a

UnknownRJump_609C9:
	ld a, 0
	ld hl, $A7D0
	add de
	ld [hl], a
	ld a, [$A7AE]
	ld l, a
	ld a, [$A7AF]
	ld h, a
	inc hl
	ld a, l
	ld [$A7AE], a
	ld a, h
	ld [$A7AF], a
	jp UnknownJump_609E4

UnknownJump_609E4:
	ld hl, $A7D5
	ld a, [hli]
	ld [$A6CA], a
	ld a, [hli]
	ld [$A6CD], a
	ld a, [hli]
	ld [$A6D0], a
	ld a, [hli]
	ld [$A6D3], a
	ld a, [hl]
	ld [$A6D6], a
	ld hl, $A7DA
	ld a, [hli]
	ld [$A6CB], a
	ld a, [hli]
	ld [$A6CE], a
	ld a, [hli]
	ld [$A6D1], a
	ld a, [hli]
	ld [$A6D4], a
	ld a, [hl]
	ld [$A6D7], a
	ld a, [$A7E9]
	inc a
	ld [$A7E9], a
	ret

UnknownData_60A1A:
INCBIN "baserom.gb", $60A1A, $60A81 - $60A1A

	ld a, [$A7A6]
	cp 0
	jr nz, UnknownRJump_60AEC
	ld a, [$A6BD]
	cp 7
	jr nz, UnknownRJump_60AA7
	ld a, [$FF81]
	bit 0, a
	jr z, UnknownRJump_60AA7
	ld a, 5
	ld [$A7A6], a
	ld a, 0
	ld [$A79A], a
	ld a, 1
	ld [$A460], a
	jr UnknownRJump_60AEC

UnknownJump_60AA7:
UnknownRJump_60AA7:
	ld a, [$A6B9]
	ld d, a
	ld a, [$A796]
	inc a
	ld [$A796], a
	cp 40
	jr c, UnknownRJump_60AC2
	cp 80
	jr nc, UnknownRJump_60ABD
	dec d
	jr UnknownRJump_60AC3

UnknownRJump_60ABD:
	ld a, 0
	ld [$A796], a

UnknownRJump_60AC2:
	inc d

UnknownRJump_60AC3:
	ld a, d
	ld [$A6B9], a
	ld a, [$A69A]
	and $07
	jr nz, UnknownRJump_60AD9
	ld a, [$A6BD]
	cp 7
	jr z, UnknownRJump_60AD9
	inc a
	ld [$A6BD], a

UnknownRJump_60AD9:
	ld b, 2
	ld a, [$A7A5]
	sub b
	ld [$A7A5], a
	ld a, [$A7AD]
	inc a
	ld [$A7AD], a
	jp UnknownJump_60CF9

UnknownJump_60AEC:
UnknownRJump_60AEC:
	ld a, [$A7A6]
	cp 1
	jp nz, UnknownJump_60BBF
	ld a, [$A7A7]
	dec a
	ld [$A7A7], a
	or a
	jr nz, UnknownRJump_60B18
	ld a, 2
	ld [$A7A6], a
	ld a, 90
	ld [$A7A7], a
	ld a, 2
	ld [$A6BA], a
	call UnknownCall_60D32
	ld a, 56
	ld [$A6C2], a
	jp UnknownJump_60BBF

UnknownRJump_60B18:
	call UnknownCall_60D08
	ld a, [$A7A7]
	cp 120
	jr nc, UnknownRJump_60B88
	and $01
	jr z, UnknownRJump_60B49
	ld a, [$A797]
	inc a
	cp 3
	jr c, UnknownRJump_60B41
	ld a, 3
	ld [$A797], a
	ld a, 2
	ld [$A6BA], a
	ld a, [$A69A]
	and $04
	jr nz, UnknownRJump_60B49
	jr UnknownRJump_60B49

UnknownRJump_60B41:
	ld [$A797], a
	add 2
	ld [$A6BA], a

UnknownRJump_60B49:
	ld a, [$A7A7]
	ld d, 0
	ld e, a
	ld hl, $4FCD
	add de
	ld a, [hl]
	or a
	jr nz, UnknownRJump_60B5C
	jp UnknownJump_60CF9

UnknownData_60B5A:
INCBIN "baserom.gb", $60B5A, $60B5C - $60B5A


UnknownRJump_60B5C:
	ld b, a
	ld a, [$A7A5]
	sub b
	ld [$A7A5], a
	ld a, [$A7AD]
	inc a
	ld [$A7AD], a
	ld a, [$A798]
	add b
	ld [$A798], a
	cp 3
	jp c, UnknownJump_60CF9
	sub 3
	ld [$A798], a
	xor a
	ld [$A797], a
	ld a, 2
	ld [$A6BA], a
	jp UnknownJump_60CF9

UnknownRJump_60B88:
	ld a, [$A6B9]
	ld d, a
	and $07
	cp 5
	jr z, UnknownRJump_60BAD
	ld a, [$A796]
	inc a
	ld [$A796], a
	cp 40
	jr c, UnknownRJump_60BA8
	cp 80
	jr nc, UnknownRJump_60BA4
	dec d
	jr UnknownRJump_60BA9

UnknownRJump_60BA4:
UnknownData_60BA4:
INCBIN "baserom.gb", $60BA4, $60BA8 - $60BA4


UnknownRJump_60BA8:
	inc d

UnknownRJump_60BA9:
	ld a, d
	ld [$A6B9], a

UnknownRJump_60BAD:
	ld a, [$A7A5]
	sub 2
	ld [$A7A5], a
	ld a, [$A7AD]
	inc a
	ld [$A7AD], a
	jp UnknownJump_60CF9

UnknownJump_60BBF:
	ld a, [$A7A6]
	cp 2
	jr nz, UnknownRJump_60C13
	ld a, [$A69A]
	bit 0, a
	jp nz, UnknownJump_60CF9
	ld a, 255
	ld [$A6C3], a
	ld a, [$A7A7]
	cp 60
	jr nc, UnknownRJump_60BF3
	ld a, [$A6C2]
	inc a
	ld [$A6C2], a
	cp 78
	call z, UnknownCall_60D80
	ld a, 32
	ld [$A6C1], a
	ld a, [$A7A8]
	add 11
	ld [$A6C3], a

UnknownRJump_60BF3:
	ld a, [$A7A7]
	dec a
	ld [$A7A7], a
	or a
	jp nz, UnknownJump_60CF9
	ld a, 100
	ld [$A7A7], a
	ld a, 6
	ld [$A7A6], a
	ld a, 255
	ld [$A6C3], a
	call UnknownCall_60DC7
	jp UnknownJump_60CF9

UnknownRJump_60C13:
	ld a, [$A7A6]
	cp 4
	jr nz, UnknownRJump_60C59
	call UnknownCall_60C41
	add 16
	ld [$FFC6], a
	ld a, [$FFC4]
	dec a
	ld [$FFC4], a
	cp 125
	jp nc, UnknownJump_60CF9
	ld a, 0
	ld [$A7A6], a
	call UnknownCall_60C41
	ld [$FFC6], a
	ld a, 1
	ld [$FFBB], a
	jp UnknownJump_60CF9

UnknownCall_60C41:
	ld a, [$A216]
	ld d, 0
	ld e, a
	ld hl, $4C4D
	add de
	ld a, [hl]
	ret

UnknownData_60C4D:
INCBIN "baserom.gb", $60C4D, $60C59 - $60C4D


UnknownRJump_60C59:
	ld a, [$A7A6]
	cp 5
	jr nz, UnknownRJump_60C94
	call UnknownCall_60D08
	ld a, [$FFC4]
	cp 108
	jr nc, UnknownRJump_60C91
	ld a, [$A69A]
	and $01
	jr nz, UnknownRJump_60C91
	ld a, [$A6C0]
	cp 10
	jr nc, UnknownRJump_60C7F
	inc a
	ld [$A6C0], a
	jp UnknownJump_60CF9

UnknownRJump_60C7F:
	ld a, 1
	ld [$A7A6], a
	ld a, 150
	ld [$A7A7], a
	ld a, 8
	ld [$A468], a
	jp UnknownJump_60AEC

UnknownRJump_60C91:
	jp UnknownJump_60AA7

UnknownRJump_60C94:
	ld a, [$A7A6]
	cp 6
	jp nz, UnknownJump_60CF9
	ld a, [$A7A7]
	cp 25
	jr c, UnknownRJump_60CD8
	ld a, [$A7A8]
	cp 0
	jr z, UnknownRJump_60CD8
	cp 4
	jr nc, UnknownRJump_60CD8
	ld a, [$A69A]
	and $0C
	jr nz, UnknownRJump_60CBB
	ld a, [$A7AC]
	ld e, a
	jr UnknownRJump_60CDC

UnknownRJump_60CBB:
	cp 4
	jr nz, UnknownRJump_60CC3
	ld b, 0
	jr UnknownRJump_60CDC

UnknownRJump_60CC3:
	cp 8
	jr nz, UnknownRJump_60CD4
	ld a, [$A7AB]
	ld e, a
	or a
	jr nz, UnknownRJump_60CDC
	ld a, [$A7AC]
	ld e, a
	jr UnknownRJump_60CDC

UnknownRJump_60CD4:
	ld b, 0
	jr UnknownRJump_60CDC

UnknownRJump_60CD8:
	ld a, [$A7AC]
	ld e, a

UnknownRJump_60CDC:
	ld d, 0
	ld hl, $4C4D
	add de
	ld a, [hl]
	ld [$FFC6], a
	ld a, [$A7A7]
	dec a
	ld [$A7A7], a
	or a
	jp nz, UnknownJump_60CF9
	ld a, 3
	ld [$A7A6], a
	jp UnknownJump_60CF9

UnknownJump_60CF9:
	call UnknownCall_60EE6
	call UnknownCall_60EB5
	call UnknownCall_6106D
	call UnknownCall_3F44
	jp UnknownJump_3E07

UnknownCall_60D08:
	call UnknownCall_60C41
	ld [$FFC6], a
	ld a, [$A79A]
	ld d, 0
	ld e, a
	ld hl, $4FA8
	add de
	ld a, [hl]
	cp 128
	ret z
	ld b, a
	inc e
	ld a, e
	ld [$A79A], a
	ld a, [$FFC4]
	add b
	ld [$FFC4], a
	call UnknownCall_60C41
	add 8
	ld [$FFC6], a
	ret

UnknownCall_60D32:
	ld a, [$A7A5]
	and $7C
	srl a
	srl a
	cp 30
	jr c, UnknownRJump_60D49

UnknownData_60D3F:
INCBIN "baserom.gb", $60D3F, $60D49 - $60D3F


UnknownRJump_60D49:
	ld d, a
	ld a, [$A6B9]
	sub 40
	srl a
	srl a
	srl a
	and $0F
	add d
	ld e, a
	ld d, 0
	ld hl, $4F7E
	add de
	ld c, [hl]
	ld a, [$A840]
	sub 110
	add a
	ld d, 0
	ld e, a
	ld hl, $4F76
	add de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld h, 0
	ld l, c
	add de
	ld a, [hl]
	ld [$A7A8], a
	or a
	ret z
	ld a, 22
	ld [$A468], a
	ret

UnknownCall_60D80:
	ld a, [$A7A8]
	or a
	ret nz
	ld a, [$A6B9]
	sub 48
	srl a
	srl a
	srl a
	and $0F
	ld [$A7AA], a
	ld a, [$A6B9]
	sub 40
	srl a
	srl a
	srl a
	and $0F
	ld d, a
	ld a, [$A7A5]
	srl a
	srl a
	add d

UnknownRJump_60DAB:
	cp 3
	jr c, UnknownRJump_60DB3
	sub 3
	jr UnknownRJump_60DAB

UnknownRJump_60DB3:
	ld e, a
	ld a, 2
	sub e
	ld d, a
	ld a, [$A7AA]
	add d
	set 7, a
	ld [$A7AA], a
	ld a, 17
	ld [$A460], a
	ret

UnknownCall_60DC7:
	ld a, [$A216]
	ld [$A7AB], a
	ld [$A7AC], a
	ld a, [$A7A8]
	or a
	ret z
	cp 1
	jr nz, UnknownRJump_60DE1
	ld a, 1
	ld [$A216], a
	jp UnknownJump_60E7D

UnknownRJump_60DE1:
	cp 2
	jr nz, UnknownRJump_60DED
	ld a, 2
	ld [$A216], a
	jp UnknownJump_60E7D

UnknownRJump_60DED:
	cp 3
	jr nz, UnknownRJump_60DF9
	ld a, 3
	ld [$A216], a
	jp UnknownJump_60E7D

UnknownRJump_60DF9:
	cp 4
	jr nz, UnknownRJump_60E0B
	ld a, [$A22C]
	add 1
	daa
	ld [$A22C], a
	call c, UnknownCall_60EAF
	jr UnknownRJump_60E7D

UnknownRJump_60E0B:
	cp 5
	jr nz, UnknownRJump_60E1D
	ld a, [$A22C]
	add 3
	daa
	ld [$A22C], a
	call c, UnknownCall_60EAF
	jr UnknownRJump_60E7D

UnknownRJump_60E1D:
	cp 6
	jr nz, UnknownRJump_60E2F

UnknownData_60E21:
INCBIN "baserom.gb", $60E21, $60E2F - $60E21


UnknownRJump_60E2F:
	cp 7
	jr nz, UnknownRJump_60E41

UnknownData_60E33:
INCBIN "baserom.gb", $60E33, $60E41 - $60E33


UnknownRJump_60E41:
	cp 8
	jr nz, UnknownRJump_60E4C

UnknownData_60E45:
INCBIN "baserom.gb", $60E45, $60E4C - $60E45


UnknownRJump_60E4C:
	cp 9
	jr nz, UnknownRJump_60E5B

UnknownData_60E50:
INCBIN "baserom.gb", $60E50, $60E5B - $60E50


UnknownRJump_60E5B:
	cp 10
	jr nz, UnknownRJump_60E6A
	ld a, [$A263]
	add 5
	daa
	ld [$A263], a
	jr UnknownRJump_60E7D

UnknownRJump_60E6A:
UnknownData_60E6A:
INCBIN "baserom.gb", $60E6A, $60E7D - $60E6A


UnknownJump_60E7D:
UnknownRJump_60E7D:
	ld a, [$A216]
	ld [$A7AC], a
	ld a, [$A7A8]
	ld d, 0
	ld e, a
	ld hl, $4F6A
	add de
	ld a, [hl]
	cp 20
	jr nz, UnknownRJump_60E97
	ld [$A470], a
	jr UnknownRJump_60E9A

UnknownRJump_60E97:
	ld [$A460], a

UnknownRJump_60E9A:
	ld a, [$A263]
	and $F0
	jr z, UnknownRJump_60EAB

UnknownData_60EA1:
INCBIN "baserom.gb", $60EA1, $60EAB - $60EA1


UnknownRJump_60EAB:
	call UnknownCall_2934
	ret

UnknownCall_60EAF:
UnknownData_60EAF:
INCBIN "baserom.gb", $60EAF, $60EB5 - $60EAF


UnknownCall_60EB5:
	ld a, [$A7AD]
	and $0C
	rrca
	rrca
	ld e, a
	ld d, 0
	ld a, [$A840]
	cp 110
	jr z, UnknownRJump_60EDD
	cp 111
	jr z, UnknownRJump_60ED8
	cp 112
	jr z, UnknownRJump_60ED3
	ld hl, $4F66
	jr UnknownRJump_60EE0

UnknownRJump_60ED3:
	ld hl, $4F62
	jr UnknownRJump_60EE0

UnknownRJump_60ED8:
	ld hl, $4F5E
	jr UnknownRJump_60EE0

UnknownRJump_60EDD:
	ld hl, $4F5A

UnknownRJump_60EE0:
	add de
	ld a, [hl]
	ld [$A6C4], a
	ret

UnknownCall_60EE6:
	ld a, [$A7A8]
	or a
	ret z
	ld a, [$A69A]
	and $03
	ret nz
	ld a, [$A7B9]
	inc a
	cp 3
	jr c, UnknownRJump_60EFA
	xor a

UnknownRJump_60EFA:
	ld [$A7B9], a
	or a
	jr z, UnknownRJump_60F06
	cp 1
	jr z, UnknownRJump_60F22
	jr UnknownRJump_60F3E

UnknownRJump_60F06:
	ld hl, $4530
	ld de, $8D30
	call UnknownCall_3F0E
	ld hl, $4D50
	ld de, $8E70
	call UnknownCall_3F0E
	ld hl, $4D50
	ld de, $9550
	call UnknownCall_3F0E
	ret

UnknownRJump_60F22:
	ld hl, $4D50
	ld de, $8D30
	call UnknownCall_3F0E
	ld hl, $4530
	ld de, $8E70
	call UnknownCall_3F0E
	ld hl, $4D50
	ld de, $9550
	call UnknownCall_3F0E
	ret

UnknownRJump_60F3E:
	ld hl, $4D50
	ld de, $8D30
	call UnknownCall_3F0E
	ld hl, $4D50
	ld de, $8E70
	call UnknownCall_3F0E
	ld hl, $4530
	ld de, $9550
	call UnknownCall_3F0E
	ret

UnknownData_60F5A:
INCBIN "baserom.gb", $60F5A, $6106D - $60F5A


UnknownCall_6106D:
	xor a
	ld hl, $A100
	ld d, 160

UnknownRJump_61073:
	ld [hli], a
	dec d
	jr nz, UnknownRJump_61073
	ld a, 0
	ld [$A782], a
	ld hl, $A6B5
	ld a, 16

UnknownRJump_61081:
	push af
	push hl
	ld b, [hl]
	inc hl
	ld c, [hl]
	inc hl
	ld a, [hl]
	ld e, a
	cp 255
	ld hl, $51B1
	call nz, UnknownCall_6109B
	pop hl
	ld bc, $0003
	add bc
	pop af
	dec a
	jr nz, UnknownRJump_61081
	ret

UnknownCall_6109B:
	ld d, 0
	sla e
	rl d
	add de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [$A782]
	cp 40
	ret nc
	add a
	add a
	ld de, $A100
	add e
	ld e, a
	ld a, d
	adc 0
	ld d, a

UnknownRJump_610B6:
	ld a, [$A782]
	cp 40
	ret nc
	ld a, [hli]
	add c
	ld [de], a
	inc de
	ld a, [hli]
	add b
	ld [de], a
	inc de
	ld a, [hli]
	cp 255
	jr z, UnknownRJump_610D7
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [$A782]
	inc a
	ld [$A782], a
	jr UnknownRJump_610B6

UnknownRJump_610D7:
	xor a
	dec de
	ld [de], a
	dec de
	ld [de], a
	ret

UnknownCall_610DD:
	ld b, 15
	ld hl, $A7D0

UnknownRJump_610E2:
	push bc
	ld a, [hli]
	ld [$A787], a
	ld a, [hli]
	ld [$A788], a
	ld a, [hli]
	cp 255
	jr z, UnknownRJump_61142
	sla a
	ld d, 0
	ld e, a
	push hl
	ld hl, $5213
	add de
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	pop hl

UnknownRJump_610FF:
	ld a, [de]
	inc de
	cp 255
	jr z, UnknownRJump_61142
	ld c, a
	ld a, [$A787]
	add c
	and $1F
	ld c, a
	ld b, 152
	ld a, [de]
	inc de
	push hl
	ld l, a
	ld a, [$A788]
	add l
	and $1F
	ld h, 0
	ld l, a
	sla l
	rl h
	sla l
	rl h
	sla l
	rl h
	sla l
	rl h
	sla l
	rl h
	add bc
	ld b, h
	ld c, l
	pop hl
	push hl
	ld hl, $FF41

UnknownRJump_61138:
	bit 4, [hl]
	jr nz, UnknownRJump_61138
	pop hl
	ld a, [de]
	inc de
	ld [bc], a
	jr UnknownRJump_610FF

UnknownRJump_61142:
	pop bc
	dec b
	jr nz, UnknownRJump_610E2
	ret
	ld b, 15
	ld hl, $A7D0

UnknownRJump_6114C:
	push bc
	ld a, [hli]
	ld [$A787], a
	ld a, [hli]
	ld [$A788], a
	ld a, [hli]
	cp 255
	jr z, UnknownRJump_611AC
	sla a
	ld d, 0
	ld e, a
	push hl
	ld hl, $63EA
	add de
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	pop hl

UnknownRJump_61169:
	ld a, [de]
	inc de
	cp 255
	jr z, UnknownRJump_611AC
	ld c, a
	ld a, [$A787]
	add c
	and $1F
	ld c, a
	ld b, 152
	ld a, [de]
	inc de
	push hl
	ld l, a
	ld a, [$A788]
	add l
	and $1F
	ld h, 0
	ld l, a
	sla l
	rl h
	sla l
	rl h
	sla l
	rl h
	sla l
	rl h
	sla l
	rl h
	add bc
	ld b, h
	ld c, l
	pop hl
	push hl
	ld hl, $FF41

UnknownRJump_611A2:
	bit 4, [hl]
	jr nz, UnknownRJump_611A2
	pop hl
	ld a, [de]
	inc de
	ld [bc], a
	jr UnknownRJump_61169

UnknownRJump_611AC:
	pop bc
	dec b
	jr nz, UnknownRJump_6114C
	ret

UnknownData_611B1:
INCBIN "baserom.gb", $611B1, $64000 - $611B1



SECTION "bank19", ROMX, BANK[$19]


UnknownData_64000:
INCBIN "baserom.gb", $64000, $66000 - $64000

	ld a, [$AF3E]
	and a
	ret nz
	call UnknownCall_66087
	ld hl, $6092
	ld a, [$FF00+$DB]
	ld d, 0
	ld e, a
	sla e
	rl d
	add de
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	ld h, 161
	ld a, [$FF8D]
	ld l, a
	ld a, [$FF00+$D9]
	ld b, a
	ld a, [$FF00+$DA]
	ld c, a
	ld a, [de]
	cp 136
	jr nz, UnknownRJump_66039
	ld a, [$AF2B]
	bit 6, a
	jr z, UnknownRJump_66037
	inc de
	ld a, [de]
	add b
	ld b, a
	jr UnknownRJump_66038

UnknownRJump_66037:
	inc de

UnknownRJump_66038:
	inc de

UnknownRJump_66039:
	ld a, [de]
	cp 128
	ret z
	ld a, [$AF2B]
	bit 6, a
	jr z, UnknownRJump_6604A
	ld a, [de]
	cpl
	sub 7
	jr UnknownRJump_6604B

UnknownRJump_6604A:
	ld a, [de]

UnknownRJump_6604B:
	add b
	cp 160
	jr nc, UnknownRJump_6605F
	ld [hli], a
	inc de
	ld a, [$AF2B]
	bit 5, a
	jr z, UnknownRJump_6606D
	ld a, [de]
	cpl
	sub 7
	jr UnknownRJump_6606E

UnknownRJump_6605F:
	inc de
	inc de
	inc de
	inc de
	jr UnknownRJump_66039

UnknownRJump_66065:
	dec l
	ld [hl], 0
	inc de
	inc de
	inc de
	jr UnknownRJump_66039

UnknownRJump_6606D:
	ld a, [de]

UnknownRJump_6606E:
	add c
	cp 168
	jr nc, UnknownRJump_66065
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	push hl
	ld hl, $AF2B
	ld a, [de]
	xor [hl]
	pop hl
	ld [hli], a
	ld a, l
	ld [$FF8D], a
	inc de
	jr UnknownRJump_66039

UnknownCall_66087:
	ld hl, $FFDC
	ld a, [hli]
	xor [hl]
	inc l
	xor [hl]
	ld [$AF2B], a
	ret

UnknownData_66092:
INCBIN "baserom.gb", $66092, $68000 - $66092



SECTION "bank1A", ROMX, BANK[$1A]

	xor a
	ld [$A2DD], a
	ld [$A2DC], a
	ld a, [$FF9B]
	inc a
	ld [$FF9B], a
	ret
	call UnknownCall_68016
	call UnknownCall_2B4F
	ret

UnknownCall_68016:
	ld a, [$A2DD]
	rst $28

UnknownData_6801A:
INCBIN "baserom.gb", $6801A, $68042 - $6801A

	call UnknownCall_684C5
	call UnknownCall_2A96
	ld a, [$A248]
	and a
	ret nz
	ld a, [$A2DD]
	inc a
	ld [$A2DD], a
	ld a, 6
	ld [$A460], a
	xor a
	ld [$A267], a
	ld a, 64
	ld [$A266], a
	ret
	call UnknownCall_684C5
	call UnknownCall_2A96
	ld a, [$A248]
	and a
	ret nz
	ld a, 26
	ld [$A265], a
	ld a, 86
	ld [$FFB1], a
	ld a, 70
	ld [$FFB2], a
	ld a, 0
	ld [$FFB3], a
	ld a, 128
	ld [$FFB4], a
	ld a, 0
	ld [$FFB5], a
	ld a, 8
	ld [$FFB6], a
	ld a, 255
	ld [$A248], a
	ld a, [$A2DD]
	inc a
	ld [$A2DD], a
	ret
	ld a, 195
	ld [$FF40], a

UnknownJump_680A3:
	ld a, [$FF44]
	cp 12
	jp nc, UnknownJump_680A3
	call UnknownCall_68492
	call UnknownCall_2A96

UnknownRJump_680B1:
	ld a, [$FF44]
	cp 111
	jr c, UnknownRJump_680B1

UnknownRJump_680B8:
	ld a, [$FF41]
	and $03
	jr nz, UnknownRJump_680B8
	ld a, 211
	ld [$FF40], a
	ld a, [$A266]
	add 32
	cp 64
	jr nc, UnknownRJump_680FE
	ld hl, $444F

UnknownRJump_680D0:
	ld a, [$FF41]
	and $03
	jr nz, UnknownRJump_680D0
	ld a, [$FF97]
	and $3C
	srl a
	srl a
	ld b, a
	ld a, [$FF44]
	add b
	and $0F
	ld e, a
	ld d, 0
	ld hl, $444F
	add de
	ld a, [hl]
	ld [$FF43], a
	ld a, [$FF44]
	cp 139
	jr c, UnknownRJump_680D0
	ld a, [$A2D6]
	and a
	ret nz

UnknownRJump_680FE:
	ld a, [$A2D8]
	and a
	jr nz, UnknownRJump_6811D
	ld a, [$A267]
	ld b, a
	ld a, [$A266]
	or b
	ret nz
	ld a, 4
	ld [$A2D6], a
	ld a, 0
	ld [$A267], a
	ld a, 255
	ld [$A266], a
	ret

UnknownRJump_6811D:
	ld a, [$A2DD]
	inc a
	ld [$A2DD], a
	ret

UnknownData_68125:
INCBIN "baserom.gb", $68125, $68139 - $68125

	call UnknownCall_68400
	ld a, [$A248]
	and a
	ret nz
	ld a, [$A2DD]
	inc a
	ld [$A2DD], a
	ret
	call UnknownCall_68400
	ld a, [$A248]
	and a
	ret nz
	ld a, 16
	ld [$A265], a
	ld a, 0
	ld [$FFB1], a
	ld a, 96
	ld [$FFB2], a
	ld a, 0
	ld [$FFB3], a
	ld a, 136
	ld [$FFB4], a
	ld a, 0
	ld [$FFB5], a
	ld a, 16
	ld [$FFB6], a
	ld a, 255
	ld [$A248], a
	ld a, 2
	ld [$A267], a
	ld a, 0
	ld [$A266], a
	ld a, [$A2DD]
	inc a
	ld [$A2DD], a
	ret
	call UnknownCall_68492
	call UnknownCall_2A96
	ld a, [$A266]
	and $F0
	swap a
	ld b, a
	ld a, [$A267]
	and $0F
	swap a
	or b
	xor $FF
	add 25
	ld [$A2B0], a
	ld b, a
	ld a, 44
	sub b
	ld [$A2E1], a
	ld a, b
	cp 24
	ret nz
	ld hl, $56CE
	ld a, l
	ld [$A273], a
	ld a, h
	ld [$A274], a
	xor a
	ld [$A2D7], a
	ld [$A2D8], a
	ld a, 4
	ld [$A2D6], a
	ld a, [$A2DD]
	inc a
	ld [$A2DD], a
	ret
	call UnknownCall_2A96
	call UnknownCall_684E0
	ld a, [$A267]
	ld b, a
	ld a, [$A266]
	or b
	ret nz
	ld a, 0
	ld [$A267], a
	ld a, 64
	ld [$A266], a
	ld a, [$A2DD]
	inc a
	ld [$A2DD], a
	ld a, 7
	ld [$A460], a
	ld a, 44
	ld [$A2E1], a
	ret
	call UnknownCall_2A96
	call UnknownCall_684C5
	ld a, [$A267]
	ld b, a
	ld a, [$A266]
	or b
	ret nz
	ld a, 2
	ld [$A267], a
	ld a, 0
	ld [$A266], a
	ld a, [$A2DD]
	inc a
	ld [$A2DD], a
	ret
	call UnknownCall_2A96
	ld a, [$A267]
	ld b, a
	ld a, [$A266]
	or b
	ret nz
	ld a, 1
	ld [$A267], a
	ld a, 128
	ld [$A266], a
	ld a, [$A2DD]
	inc a
	ld [$A2DD], a
	ld a, 255
	ld [$A2E2], a
	ret
	ld a, 44
	ld [$A2E1], a
	call UnknownCall_68492
	call UnknownCall_2A96
	ld a, [$A267]
	ld b, a
	ld a, [$A266]
	or b
	ret nz
	ld a, 1
	ld [$A267], a
	ld a, 128
	ld [$A266], a
	ld a, [$A2DD]
	inc a
	ld [$A2DD], a
	ret
	ld a, 195
	ld [$FF40], a

UnknownJump_6826C:
	ld a, [$FF44]
	cp 12
	jp nc, UnknownJump_6826C
	call UnknownCall_68492
	call UnknownCall_2A96

UnknownRJump_6827A:
	ld a, [$FF44]
	cp 111
	jr c, UnknownRJump_6827A

UnknownRJump_68281:
	ld a, [$FF41]
	and $03
	jr nz, UnknownRJump_68281
	ld a, 211
	ld [$FF40], a
	ret

UnknownData_6828E:
INCBIN "baserom.gb", $6828E, $682BA - $6828E

	ld a, [$A266]
	and $03
	jr nz, UnknownRJump_682C8
	ld a, [$A2E1]
	inc a
	ld [$A2E1], a

UnknownRJump_682C8:
	call UnknownCall_6845F
	call UnknownCall_2A96
	ld a, [$A267]
	ld b, a
	ld a, [$A266]
	or b
	ret nz
	ld a, 0
	ld [$A267], a
	ld a, 32
	ld [$A266], a
	ld a, [$A2DD]
	inc a
	ld [$A2DD], a
	ld a, 13
	ld [$A2DF], a
	ret
	call UnknownCall_6845F
	call UnknownCall_2A96
	ld a, [$A267]
	ld b, a
	ld a, [$A266]
	or b
	ret nz
	ld a, 0
	ld [$A267], a
	ld a, 128
	ld [$A266], a
	ld a, [$A2DD]
	inc a
	ld [$A2DD], a
	ret

UnknownData_6830F:
INCBIN "baserom.gb", $6830F, $68398 - $6830F

	call UnknownCall_68400
	ld a, [$FF97]
	and $01
	ld b, a
	ld a, [$A2DF]
	sub b
	ld [$A2DF], a
	cp 13
	ret nz
	ld a, 0
	ld [$A267], a
	ld a, 192
	ld [$A266], a
	ld a, [$A2DD]
	inc a
	ld [$A2DD], a
	ret
	call UnknownCall_68400
	ld a, [$FF97]
	and $01
	ld b, a
	ld a, [$A2DF]
	add b
	ld [$A2DF], a
	cp 139
	ret nz
	ld a, 26
	ld [$A265], a
	ld a, 150
	ld [$FFB1], a
	ld a, 80
	ld [$FFB2], a
	ld a, 0
	ld [$FFB3], a
	ld a, 152
	ld [$FFB4], a
	ld a, 0
	ld [$FFB5], a
	ld a, 4
	ld [$FFB6], a
	ld a, 255
	ld [$A248], a
	ld a, [$A2DD]
	inc a
	ld [$A2DD], a
	ret

UnknownJump_68400:
UnknownCall_68400:
	ld a, [$FF44]
	cp 12
	jp nc, UnknownJump_68400
	call UnknownCall_2A96

UnknownJump_6840B:
	ld a, [$FF44]
	cp 16
	jp c, UnknownJump_6840B
	ld hl, $444F

UnknownRJump_68416:
	ld a, [$FF41]
	and $03
	jr nz, UnknownRJump_68416
	ld a, [$FF97]
	and $3C
	srl a
	srl a
	ld b, a
	ld a, [$FF44]
	add b
	and $0F
	ld e, a
	ld d, 0
	ld hl, $444F
	add de
	ld a, [hl]
	ld [$FF43], a
	ld a, [$A2DF]
	ld b, a
	ld a, [$FF44]
	cp b
	jr c, UnknownRJump_68416

UnknownRJump_68442:
	ld a, [$FF41]
	and $03
	jr nz, UnknownRJump_68442
	ld a, 0
	ld [$FF43], a
	ret

UnknownData_6844F:
INCBIN "baserom.gb", $6844F, $6845F - $6844F


UnknownCall_6845F:
	xor a
	ld [$FFBB], a
	ld a, 1
	ld [$FFC7], a
	ld a, [$A222]
	inc a
	ld [$A222], a
	cp 48
	jr c, UnknownRJump_68477
	xor a
	ld [$A222], a

UnknownRJump_68477:
	ld a, 84
	ld [$FFC5], a
	ld a, [$A2E1]
	ld [$FFC4], a
	ld a, [$A222]
	and $F0
	swap a
	add 229
	ld [$FFC6], a
	call UnknownCall_2B27
	ret

UnknownCall_68492:
	ld a, 1
	ld [$FFBB], a
	ld a, 0
	ld [$FFC7], a
	ld a, [$A222]
	inc a
	ld [$A222], a
	cp 48
	jr c, UnknownRJump_684AB
	xor a
	ld [$A222], a

UnknownRJump_684AB:
	ld a, 84
	ld [$FFC5], a
	ld a, [$A2E1]
	ld [$FFC4], a
	ld a, [$A222]
	and $F0
	swap a
	add 232
	ld [$FFC6], a
	call UnknownCall_2B27

UnknownCall_684C5:
	ld a, 0
	ld [$FFC7], a
	ld a, [$A2E1]
	add 52
	ld [$FFC4], a
	ld a, 79
	ld [$FFC5], a
	ld a, 235
	ld [$FFC6], a
	call UnknownCall_2B27
	ret

UnknownCall_684E0:
	ld a, [$FF97]
	bit 0, a
	jr z, UnknownRJump_684EC
	ld a, 24
	ld [$A470], a

UnknownRJump_684EC:
	ld a, 0
	ld [$FFC7], a
	ld a, 1
	ld [$FFBB], a
	ld a, 96
	ld [$FFC4], a
	ld a, 79
	ld [$FFC5], a
	ld a, [$FF97]
	and $1C
	srl a
	srl a
	ld e, a
	ld d, 0
	ld hl, $4518
	add de
	ld a, [hl]
	ld [$FFC6], a
	call UnknownCall_2B27
	ret

UnknownData_68518:
INCBIN "baserom.gb", $68518, $68520 - $68518

	ld a, [$A2DD]
	inc a
	ld [$A2DD], a
	ret
	call $FFA0
	ld a, 0
	ld [$FF43], a
	ld [$FF43], a
	ld a, [$A2D6]
	and a
	jp nz, UnknownJump_68572
	ld a, [$A2E2]
	and a
	jr z, UnknownRJump_68562
	ld a, 137
	ld [$9948], a
	ld a, 138
	ld [$9949], a
	ld a, 139
	ld [$994A], a
	ld a, 153
	ld [$9968], a
	ld a, 154
	ld [$9969], a
	ld a, 155
	ld [$996A], a
	xor a
	ld [$A2E2], a

UnknownRJump_68562:
	ld a, [$A24E]
	ld [$2100], a
	ld a, 1
	ld [$FF82], a
	pop hl
	pop de
	pop bc
	pop af
	reti

UnknownJump_68572:
	ld a, [$A2D6]
	xor $FF
	add 5
	sla a
	swap a
	ld l, a
	ld h, 0
	ld de, $9A20
	add de
	ld e, l
	ld d, h
	ld a, [$A273]
	ld l, a
	ld a, [$A274]
	ld h, a
	ld a, [hl]
	cp 255
	jr z, UnknownRJump_685A5
	ld b, 20

UnknownRJump_68595:
	ld a, [hli]
	sub 48
	cp 240
	jr nz, UnknownRJump_6859E
	ld a, 255

UnknownRJump_6859E:
	ld [de], a
	inc de
	dec b
	jr nz, UnknownRJump_68595
	jr UnknownRJump_685AF

UnknownRJump_685A5:
	inc hl
	ld b, 20

UnknownRJump_685A8:
	ld a, 255
	ld [de], a
	inc de
	dec b
	jr nz, UnknownRJump_685A8

UnknownRJump_685AF:
	ld a, l
	ld [$A273], a
	ld a, h
	ld [$A274], a
	ld a, [hl]
	cp 254
	jr nz, UnknownRJump_685C1
	ld a, 255
	ld [$A2D8], a

UnknownRJump_685C1:
	ld a, [$A2D6]
	dec a
	ld [$A2D6], a
	and a
	jr nz, UnknownRJump_685D5
	ld a, 1
	ld [$A267], a
	ld a, 0
	ld [$A266], a

UnknownRJump_685D5:
	ld a, [$A24E]
	ld [$2100], a
	ld a, 1
	ld [$FF82], a
	pop hl
	pop de
	pop bc
	pop af
	reti

UnknownData_685E5:
INCBIN "baserom.gb", $685E5, $6C000 - $685E5



SECTION "bank1B", ROMX, BANK[$1B]


UnknownData_6C000:
INCBIN "baserom.gb", $6C000, $70000 - $6C000



SECTION "bank1C", ROMX, BANK[$1C]


UnknownData_70000:
INCBIN "baserom.gb", $70000, $74000 - $70000



SECTION "bank1D", ROMX, BANK[$1D]


UnknownData_74000:
INCBIN "baserom.gb", $74000, $78000 - $74000



SECTION "bank1E", ROMX, BANK[$1E]


UnknownData_78000:
INCBIN "baserom.gb", $78000, $7C000 - $78000



SECTION "bank1F", ROMX, BANK[$1F]


UnknownData_7C000:
INCBIN "baserom.gb", $7C000, $80000 - $7C000
