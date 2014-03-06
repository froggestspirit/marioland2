include "macros.asm"
include "ram.asm"
include "home.asm"

SECTION "bank01", ROMX, BANK[$01]


UnknownData_0x4000:
INCBIN "baserom.gb", $4000, $41E4 - $4000 ;These are pointers to the sprite mappings

INCLUDE "gfx/spritemappings.asm"

UnknownCall_0x5267:
	ld a, [$FF00+$C6]
	swap a
	and $0F
	add 128
	call UnknownCall_0x527C

UnknownCall_0x5272:
	ld a, [$FF00+$C6]
	and $0F
	add 128
	call UnknownCall_0x527C
	ret

UnknownCall_0x527C:
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

UnknownJump_0x5297:
UnknownCall_0x5297:
	ld a, 1 ;prepare bank switch
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

UnknownRJump_0x52BB:
	ld a, [de]
	cp $80
	jr z, UnknownRJump_0x52E6
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
	jr z, UnknownRJump_0x52D4
	ld a, [de]
	set 4, a
	jr UnknownRJump_0x52D5

UnknownRJump_0x52D4:
	ld a, [de]

UnknownRJump_0x52D5:
	ld [hl], a
	ld a, [$FF00+$BB]
	and a
	jr nz, UnknownRJump_0x52DF
	ld a, [hl]
	set 7, a
	ld [hl], a

UnknownRJump_0x52DF:
	inc hl
	ld a, l
	ld [$FF00+$8D], a
	inc de
	jr UnknownRJump_0x52BB

UnknownRJump_0x52E6:
	ret

UnknownJump_0x52E7:
UnknownCall_0x52E7:
	ld a, [$FF00+$8D]
	ld b, a
	ld a, [$A26E]
	ld c, a
	cp b
	jr c, UnknownRJump_0x52FC
	ld h, 161
	ld a, [$FF00+$8D]
	ld l, a

UnknownRJump_0x52F6:
	xor a
	ld [hli], a
	ld a, l
	cp c
	jr c, UnknownRJump_0x52F6

UnknownRJump_0x52FC:
	ld a, [$FF00+$8D]
	ld [$A26E], a
	ret

UnknownJump_0x5302:
UnknownCall_0x5302:
	ld hl, $A100

UnknownRJump_0x5305:
	xor a
	ld [hli], a
	ld a, l
	cp $A0
	jr c, UnknownRJump_0x5305
	ret

UnknownJump_0x530D:
	ld a, 1
	ld [$FF00+$BB], a
	ld a, [sPipeTravelDirection]
	cp $10
	jr c, UnknownRJump_0x532D
	xor a
	ld [$FF00+$BB], a
	ld a, 16
	ld [$FF00+$C6], a
	ld a, [sPipeTravelDirection]
	cp $30
	jp c, UnknownJump_0x5447
	jp z, UnknownJump_0x53AD
	jp UnknownJump_0x5426

UnknownRJump_0x532D:
	ld a, [sSpinJump]
	and a
	jr z, UnknownRJump_0x534C
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
	jp UnknownJump_0x5447

UnknownData_0x5348:
INCBIN "baserom.gb", $5348, $534C - $5348


UnknownRJump_0x534C:
	ld a, [sMarioDirection]
	cp $01
	jp nz, UnknownJump_0x53CF
	ld a, [sMoonPhysics]
	bit 1, a
	jr z, UnknownRJump_0x5377
	ld a, [sMarioOnGround]
	and a
	jr nz, UnknownRJump_0x5377
	ld a, 18
	ld [$FF00+$C6], a
	ld a, [$A285]
	and a
	jp z, UnknownJump_0x5447
	dec a
	ld [$A285], a
	ld a, 19
	ld [$FF00+$C6], a
	jp UnknownJump_0x5447

UnknownRJump_0x5377:
	ld a, [$A291]
	and a
	jr z, UnknownRJump_0x5384
	ld a, 14
	ld [$FF00+$C6], a
	jp UnknownJump_0x5447

UnknownRJump_0x5384:
	ld a, [sMarioOnGround]
	ld b, a
	ld a, [$A26B]
	or b
	jr z, UnknownRJump_0x53BD
	ld a, [sHVelocityIndex]
	cp $80
	jr nc, UnknownRJump_0x53A1
	ld a, 13
	ld [$FF00+$C6], a
	ld a, 4
	ld [$A460], a
	jp UnknownJump_0x5447

UnknownRJump_0x53A1:
	ld a, 0
	ld [$FF00+$C6], a
	ld a, [sHVelocityIndex]
	cp $80
	jp z, UnknownJump_0x5447

UnknownJump_0x53AD:
	ld a, [$A222]
	and $0C
	srl a
	srl a
	add 1
	ld [$FF00+$C6], a
	jp UnknownJump_0x5447

UnknownRJump_0x53BD:
	ld a, 8
	ld [$FF00+$C6], a
	ld a, [sMarioInAir]
	and a
	jp nz, UnknownJump_0x5447
	ld a, 10
	ld [$FF00+$C6], a
	jp UnknownJump_0x5447

UnknownJump_0x53CF:
	ld a, [sMoonPhysics]
	bit 1, a
	jr z, UnknownRJump_0x53F2
	ld a, [sMarioOnGround]
	and a
	jr nz, UnknownRJump_0x53F2
	ld a, 20
	ld [$FF00+$C6], a
	ld a, [$A285]
	and a
	jp z, UnknownJump_0x5447
	dec a
	ld [$A285], a
	ld a, 21
	ld [$FF00+$C6], a
	jp UnknownJump_0x5447

UnknownRJump_0x53F2:
	ld a, [$A291]
	and a
	jr z, UnknownRJump_0x53FE
	ld a, 15
	ld [$FF00+$C6], a
	jr UnknownRJump_0x5447

UnknownRJump_0x53FE:
	ld a, [sMarioOnGround]
	ld b, a
	ld a, [$A26B]
	or b
	jr z, UnknownRJump_0x5436
	ld a, [sHVelocityIndex]
	cp $81
	jr c, UnknownRJump_0x541A
	ld a, 12
	ld [$FF00+$C6], a
	ld a, 4
	ld [$A460], a
	jr UnknownRJump_0x5447

UnknownRJump_0x541A:
	ld a, 4
	ld [$FF00+$C6], a
	ld a, [sHVelocityIndex]
	cp $80
	jp z, UnknownJump_0x5447

UnknownJump_0x5426:
	ld a, [$A222]
	and $0C
	srl a
	srl a
	add 5
	ld [$FF00+$C6], a
	jp UnknownJump_0x5447

UnknownRJump_0x5436:
	ld a, 9
	ld [$FF00+$C6], a
	ld a, [sMarioInAir]
	and a
	jr nz, UnknownRJump_0x5447
	ld a, 11
	ld [$FF00+$C6], a
	jp UnknownJump_0x5447

UnknownJump_0x5447:
UnknownRJump_0x5447:
	ld a, [$A217]
	and a
	jr z, UnknownRJump_0x545D
	dec a
	ld [$A217], a
	bit 2, a
	jr z, UnknownRJump_0x546B
	ld a, [$FF00+$C6]
	add 32
	ld [$FF00+$C6], a
	jr UnknownRJump_0x54A7

UnknownRJump_0x545D:
	ld a, [sCurPowerup]
	and a
	jr nz, UnknownRJump_0x546B
	ld a, [$FF00+$C6]
	add 32
	ld [$FF00+$C6], a
	jr UnknownRJump_0x54A7

UnknownRJump_0x546B:
	ld a, [sCurPowerup]
	cp $02
	jr nz, UnknownRJump_0x548A
	ld a, [$FF00+$C6]
	add 69
	ld [$FF00+$C6], a
	ld a, [$A24D]
	and a
	jr z, UnknownRJump_0x54A7
	bit 2, a
	jr z, UnknownRJump_0x54A7
	ld a, [$FF00+$C6]
	add 26
	ld [$FF00+$C6], a
	jr UnknownRJump_0x54A7

UnknownRJump_0x548A:
	ld a, [sCurPowerup]
	cp $03
	jr nz, UnknownRJump_0x54A7
	ld a, [$FF00+$C6]
	add 112
	ld [$FF00+$C6], a
	ld a, [$A25A]
	and a
	jr z, UnknownRJump_0x54A7
	dec a
	ld [$A25A], a
	ld a, [$FF00+$C6]
	add 32
	ld [$FF00+$C6], a

UnknownRJump_0x54A7:
	ld a, [$FF00+$CA]
	ld b, a
	ld a, [$FF00+$C2]
	sub b
	add 96
	ld [$FF00+$C5], a
	ld [sMarioScreenX], a
	cp $60
	jr c, UnknownRJump_0x54BF
	ld a, 255
	ld [$A232], a
	jr UnknownRJump_0x54C8

UnknownRJump_0x54BF:
	cp $60
	jr nc, UnknownRJump_0x54C8
	ld a, 255
	ld [$A233], a

UnknownJump_0x54C8:
UnknownRJump_0x54C8:
	ld a, [$FF00+$C8]
	ld b, a
	ld a, [$FF00+$C0]
	sub b
	add 98
	ld [$FF00+$C4], a
	ld [sMarioScreenY], a
	xor a
	ld [$FF00+$C7], a
	ld a, [$A271]
	and a
	jr z, UnknownRJump_0x54E9
	ld a, [$A272]
	bit 2, a
	jr z, UnknownRJump_0x54E9
	ld a, 1
	ld [$FF00+$C7], a

UnknownRJump_0x54E9:
	ld a, [$A2B3]
	and a
	jr z, UnknownRJump_0x54FB
	dec a
	ld [$A2B3], a
	and $03
	ld b, a
	ld a, [$FF00+$C4]
	sub b
	ld [$FF00+$C4], a

UnknownRJump_0x54FB:
	call UnknownCall_0x5297
	xor a
	ld [$FF00+$C7], a
	ld [$FF00+$BB], a
	ld a, [sMoonPhysics]
	bit 2, a
	jr z, UnknownRJump_0x551E
	ld a, 1
	ld [$FF00+$BB], a
	ld a, [$FF00+$97]
	and $10
	swap a
	add 220
	ld [$FF00+$C6], a
	call UnknownCall_0x5297
	xor a
	ld [$FF00+$BB], a

UnknownRJump_0x551E:
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
	cp $05
	jr nc, UnknownRJump_0x5548
	ld [$FF00+$C6], a
	call UnknownCall_0x5272
	ret

UnknownRJump_0x5548:
	ld a, 190
	ld [$FF00+$C6], a
	call UnknownCall_0x5297
	ret

UnknownJump_0x5550:
	ld a, [$FF00+$C8]
	ld b, a
	ld a, [$FF00+$C0]
	sub b
	add 98
	ld [$FF00+$C4], a
	ld [sMarioScreenY], a
	and $E0
	cp $E0
	ret z
	ld a, [$FF00+$CA]
	ld b, a
	ld a, [$FF00+$C2]
	sub b
	add 96
	ld [$FF00+$C5], a
	ld [sMarioScreenX], a
	ld a, 107
	ld [$FF00+$C6], a
	xor a
	ld [$FF00+$C7], a
	jp UnknownJump_0x54C8

UnknownJump_0x5579:
	xor a
	ld [$A2A0], a
	ld a, [$A27D]
	bit 3, a
	jr z, UnknownRJump_0x5589
	ld a, 255
	ld [$A2A0], a

UnknownRJump_0x5589:
	ld hl, Level_Header_Pointers
	ld a, [sCurLevel]
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

UnknownRJump_0x559F:
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, UnknownRJump_0x559F
	ld a, [$A2A0]
	and a
	jr z, UnknownRJump_0x55C6
	ld hl, $377B
	ld a, [sCurLevel]
	sla a
	sla a
	sla a
	ld e, a
	ld d, 0
	add de
	ld de, $A800
	ld b, 8

UnknownRJump_0x55C0:
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, UnknownRJump_0x55C0

UnknownRJump_0x55C6:
	ld a, 2
	ld [$FF00+$9B], a
	ret

UnknownData_0x55CB:
INCLUDE "levels/levelheaders.asm"
INCBIN "baserom.gb", $588B, $591F - $588B

UnknownJump_0x591F:
	ld a, [sCoinLow]
	inc a
	daa
	ld [sCoinLow], a
	ld a, [sCoinHigh]
	adc 0
	ld [sCoinHigh], a
	cp $0A
	jr c, UnknownRJump_0x593D

UnknownData_0x5933:
INCBIN "baserom.gb", $5933, $593D - $5933


UnknownRJump_0x593D:
	ld a, [$FF00+$C2]
	add 16
	ld [$FF00+$B9], a
	ld a, [$FF00+$C3]
	adc 0
	ld [$FF00+$BA], a
	ld c, 8
	ld a, [sCurPowerup]
	and a
	jr nz, UnknownRJump_0x5955
	ld a, 10
	add c
	ld c, a

UnknownRJump_0x5955:
	ld a, [$FF00+$C0]
	add c
	ld [$FF00+$B7], a
	ld a, [$FF00+$C1]
	adc 0
	ld [$FF00+$B8], a

UnknownJump_0x5960:
	ld hl, $AA80

UnknownRJump_0x5963:
	ld a, [hl]
	and a
	jr z, UnknownRJump_0x5970
	ld a, l
	add 16
	ld l, a
	cp $00
	ret z
	jr UnknownRJump_0x5963

UnknownRJump_0x5970:
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
	call UnknownCall_0x2F72
	ret

UnknownJump_0x5997:
	ld hl, $AA80

UnknownJump_0x599A:
	push hl
	ld a, [hli]
	ld [$A23E], a
	and a
	jr z, UnknownRJump_0x59DF
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
	cp $01
	jr z, UnknownRJump_0x59EB
	cp $02
	jp z, UnknownJump_0x5B70
	cp $03
	jp z, UnknownJump_0x5B06
	cp $04
	jp z, UnknownJump_0x5A9E
	cp $05
	jr z, UnknownRJump_0x59FA

UnknownData_0x59DA:
INCBIN "baserom.gb", $59DA, $59DF - $59DA


UnknownJump_0x59DF:
UnknownRJump_0x59DF:
	pop hl
	ld a, l
	and $F0
	add 16
	ld l, a
	and a
	jp nz, UnknownJump_0x599A
	ret

UnknownRJump_0x59EB:
	ld a, [$A23F]
	cp $02
	jp z, UnknownJump_0x5A72
	cp $28
	jp z, UnknownJump_0x5A82
	jr UnknownRJump_0x5A07

UnknownRJump_0x59FA:
	ld a, [$A23F]
	cp $02
	jp z, UnknownJump_0x5A7A
	cp $28
	jp z, UnknownJump_0x5A90

UnknownRJump_0x5A07:
	ld hl, $5A4A
	ld e, a
	ld d, 0
	add de
	ld a, [hl]
	ld c, a
	ld a, [sScrollY]
	ld b, a
	ld a, [$FF00+$B7]
	sub b
	add c
	ld [$FF00+$C4], a
	ld a, [$A23F]
	ld c, a
	ld a, [sScrollX]
	ld b, a
	ld a, [$FF00+$B9]
	sub b
	sub c
	ld [$FF00+$C5], a
	ld a, 101
	ld [$FF00+$C6], a
	ld a, 1
	ld [$FF00+$BB], a
	call UnknownCall_0x5297
	ld a, [$A23F]
	ld c, a
	ld a, [sScrollX]
	ld b, a
	ld a, [$FF00+$B9]
	sub b
	add c
	ld [$FF00+$C5], a
	ld a, 102
	ld [$FF00+$C6], a
	call UnknownCall_0x5297
	jr UnknownRJump_0x59DF

UnknownData_0x5A4A:
INCBIN "baserom.gb", $5A4A, $5A72 - $5A4A


UnknownJump_0x5A72:
	ld a, 96
	call UnknownCall_0x5CF1
	jp UnknownJump_0x5C01

UnknownJump_0x5A7A:
	ld a, 127
	call UnknownCall_0x5CF1
	jp UnknownJump_0x5C2C

UnknownJump_0x5A82:
	ld a, l
	and $F0
	ld l, a
	xor a
	ld [hl], a
	ld a, 96
	call UnknownCall_0x5CF1
	jp UnknownJump_0x59DF

UnknownJump_0x5A90:
	ld a, l
	and $F0
	ld l, a
	xor a
	ld [hl], a
	ld a, 127
	call UnknownCall_0x5CF1
	jp UnknownJump_0x59DF

UnknownJump_0x5A9E:
	ld a, [$A23F]
	cp $32
	jr z, UnknownRJump_0x5AFD
	ld hl, $5AE0
	srl a
	ld e, a
	ld d, 0
	add de
	ld a, [hl]
	ld c, a
	ld a, [sScrollY]
	ld b, a
	ld a, [$FF00+$B7]
	sub b
	add c
	ld [$FF00+$C4], a
	ld a, [sScrollX]
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
	call UnknownCall_0x5297
	jp UnknownJump_0x59DF

UnknownData_0x5AE0:
INCBIN "baserom.gb", $5AE0, $5AFD - $5AE0


UnknownRJump_0x5AFD:
	ld a, l
	and $F0
	ld l, a
	xor a
	ld [hl], a
	jp UnknownJump_0x59DF

UnknownJump_0x5B06:
	ld a, [$A23F]
	cp $02
	jp z, UnknownJump_0x5BFC
	cp $08
	jr z, UnknownRJump_0x5B3C
	ld hl, $5BB4
	ld e, a
	ld d, 0
	add de
	ld a, [hl]
	ld c, a
	ld a, [sScrollY]
	ld b, a
	ld a, [$FF00+$B7]
	sub b
	add c
	ld [$FF00+$C4], a
	ld a, [sScrollX]
	ld b, a
	ld a, [$FF00+$B9]
	sub b
	ld [$FF00+$C5], a
	ld a, 66
	ld [$FF00+$C6], a
	ld a, 1
	ld [$FF00+$BB], a
	call UnknownCall_0x5297
	jp UnknownJump_0x59DF

UnknownRJump_0x5B3C:
	ld a, l
	and $F0
	ld l, a
	xor a
	ld [hl], a
	ld a, 7
	call UnknownCall_0x5CF1
	call UnknownCall_0x200C
	ld a, [$A205]
	and $DE
	ld l, a
	ld a, [$A206]
	ld h, a
	ld de, $001F

UnknownRJump_0x5B57:
	ld a, [$FF00+$41]
	and $03
	jr nz, UnknownRJump_0x5B57

UnknownRJump_0x5B5D:
	ld a, [$FF00+$41]
	and $03
	jr nz, UnknownRJump_0x5B5D
	ld a, 248
	ld [hli], a
	inc a
	ld [hl], a
	add de
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	jp UnknownJump_0x59DF

UnknownJump_0x5B70:
	ld a, [$A23F]
	cp $02
	jp z, UnknownJump_0x5BFC
	cp $08
	jr z, UnknownRJump_0x5BBC
	jr UnknownRJump_0x5B8A

UnknownData_0x5B7E:
INCBIN "baserom.gb", $5B7E, $5B8A - $5B7E


UnknownRJump_0x5B8A:
	ld hl, $5BB4
	ld e, a
	ld d, 0
	add de
	ld a, [hl]
	ld c, a
	ld a, [sScrollY]
	ld b, a
	ld a, [$FF00+$B7]
	sub b
	add c
	ld [$FF00+$C4], a
	ld a, [sScrollX]
	ld b, a
	ld a, [$FF00+$B9]
	sub b
	ld [$FF00+$C5], a
	ld a, 66
	ld [$FF00+$C6], a
	ld a, 1
	ld [$FF00+$BB], a
	call UnknownCall_0x5297
	jp UnknownJump_0x59DF

UnknownData_0x5BB4:
INCBIN "baserom.gb", $5BB4, $5BBC - $5BB4


UnknownRJump_0x5BBC:
	ld a, l
	and $F0
	ld l, a
	xor a
	ld [hl], a
	xor a
	call UnknownCall_0x5CF1
	jr UnknownRJump_0x5BD3

UnknownData_0x5BC8:
INCBIN "baserom.gb", $5BC8, $5BD3 - $5BC8


UnknownRJump_0x5BD3:
	call UnknownCall_0x200C
	ld a, [$A205]
	and $DE
	ld l, a
	ld a, [$A206]
	ld h, a
	ld de, $001F

UnknownRJump_0x5BE3:
	ld a, [$FF00+$41]
	and $03
	jr nz, UnknownRJump_0x5BE3

UnknownRJump_0x5BE9:
	ld a, [$FF00+$41]
	and $03
	jr nz, UnknownRJump_0x5BE9
	ld a, 244
	ld [hli], a
	inc a
	ld [hl], a
	add de
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	jp UnknownJump_0x59DF

UnknownJump_0x5BFC:
	ld a, 24
	call UnknownCall_0x5CF1

UnknownJump_0x5C01:
	call UnknownCall_0x200C
	ld a, [$A205]
	and $DE
	ld l, a
	ld a, [$A206]
	ld h, a
	ld de, $001F

UnknownRJump_0x5C11:
	ld a, [$FF00+$41]
	and $03
	jr nz, UnknownRJump_0x5C11

UnknownRJump_0x5C17:
	ld a, [$FF00+$41]
	and $03
	jr nz, UnknownRJump_0x5C17
	ld a, 255
	ld [hli], a
	ld [hl], a
	add de
	ld [hli], a
	ld [hl], a
	jp UnknownJump_0x59DF

UnknownData_0x5C27:
INCBIN "baserom.gb", $5C27, $5C2C - $5C27


UnknownJump_0x5C2C:
	call UnknownCall_0x200C
	ld a, [$A205]
	and $DE
	ld l, a
	ld a, [$A206]
	ld h, a
	ld de, $001F

UnknownRJump_0x5C3C:
	ld a, [$FF00+$41]
	and $03
	jr nz, UnknownRJump_0x5C3C

UnknownRJump_0x5C42:
	ld a, [$FF00+$41]
	and $03
	jr nz, UnknownRJump_0x5C42
	ld a, 127
	ld [hli], a
	ld [hl], a
	add de
	ld [hli], a
	ld [hl], a
	jp UnknownJump_0x59DF

UnknownData_0x5C52:
INCBIN "baserom.gb", $5C52, $5CF1 - $5C52


UnknownCall_0x5CF1:
	ld d, a

UnknownJump_0x5CF2:
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

UnknownJump_0x5D25:
	xor a
	ld [$A238], a
	ld [$A237], a
	ld [$A28A], a
	ld a, [$FF00+$40]
	bit 5, a
	jr nz, UnknownRJump_0x5D39
	set 5, a
	ld [$FF00+$40], a

UnknownRJump_0x5D39:
	ld a, 136
	ld [$FF00+$4A], a
	ld a, [$A29B]
	and a
	call nz, UnknownCall_0x6442
	ld a, [$A271]
	and a
	jr z, UnknownRJump_0x5D6A
	ld a, [$A272]
	sub 1
	ld [$A272], a
	ld a, [$A271]
	sbc 0
	ld [$A271], a
	and a
	jr nz, UnknownRJump_0x5D6A
	ld a, [sCurSong]
	cp $09
	jr z, UnknownRJump_0x5D6A
	ld a, [$A292]
	ld [$A468], a

UnknownRJump_0x5D6A:
	ld a, [$A224]
	ld b, a
	ld a, [$A2E3]
	ld c, a
	ld a, [$A24F]
	or b
	or c
	jp nz, UnknownJump_0x5E12
	ld a, [$A24B]
	dec a
	ld [$A24B], a
	jp nz, UnknownJump_0x5E12
	ld a, 48
	ld [$A24B], a
	ld a, [sTimerLow]
	sub 1
	daa
	ld [sTimerLow], a
	ld a, [sTimerHigh]
	sbc 0
	daa
	ld [sTimerHigh], a
	jr nc, UnknownRJump_0x5DB4
	ld a, 128
	ld [$A224], a
	xor a
	ld [sTimerLow], a
	ld [sTimerHigh], a
	ld a, 15
	ld [$A460], a
	xor a
	ld [$A53F], a
	jr UnknownRJump_0x5E12

UnknownRJump_0x5DB4:
	ld a, [sTimerHigh]
	and a
	jr nz, UnknownRJump_0x5DCB
	ld a, [sTimerLow]
	cp $11
	jr nc, UnknownRJump_0x5DCB
	ld a, 14
	ld [$A470], a
	ld a, 1
	ld [$A53F], a

UnknownRJump_0x5DCB:
	ld a, [$A24F]
	and a
	jr nz, UnknownRJump_0x5E12
	ld a, [sTimerHigh]
	and a
	jr nz, UnknownRJump_0x5E03
	ld a, [sCurSong]
	and a
	jr nz, UnknownRJump_0x5E12
	ld a, [$A292]
	and $FC
	cp $20
	jr z, UnknownRJump_0x5DF9
	ld a, [$A292]
	ld [$A468], a
	ld a, [$A271]
	and a
	jr z, UnknownRJump_0x5E12

UnknownData_0x5DF2:
INCBIN "baserom.gb", $5DF2, $5DF9 - $5DF2


UnknownRJump_0x5DF9:
UnknownData_0x5DF9:
INCBIN "baserom.gb", $5DF9, $5E03 - $5DF9


UnknownRJump_0x5E03:
	cp $01
	jr nz, UnknownRJump_0x5E12
	ld a, [sTimerLow]
	and a
	jr nz, UnknownRJump_0x5E12
	ld a, 9
	ld [$A468], a

UnknownJump_0x5E12:
UnknownRJump_0x5E12:
	ld a, [$A2DC]
	cp $03
	ret nz
	xor a
	ld [hKeysPressed], a
	ld a, 18
	ld [hKeysHeld], a
	ld a, [$FF00+$C2]
	and $FE
	cp $A0
	ret c
	jr nz, UnknownRJump_0x5E31
	ld a, 1
	ld [hKeysPressed], a
	ld a, 17
	ld [hKeysHeld], a
	ret

UnknownRJump_0x5E31:
	xor a
	ld [hKeysPressed], a
	ld a, 17
	ld [hKeysHeld], a
	ld a, [$FF00+$C0]
	cp $E0
	ret c
	ld a, 35
	ld [$FF00+$9B], a
	ret

UnknownData_0x5E42:
INCBIN "baserom.gb", $5E42, $6442 - $5E42


UnknownCall_0x6442:
UnknownData_0x6442:
INCBIN "baserom.gb", $6442, $6485 - $6442


UnknownJump_0x6485:
	ld a, [$A2B6]
	and a
	ret z
	cp $01
	jr z, UnknownRJump_0x64F9
	ld a, [$FF00+$97]
	and $01
	jr nz, UnknownRJump_0x64CB
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
	call UnknownCall_0x1EFA
	cp $52
	jr c, UnknownRJump_0x64F4
	cp $58
	jr nc, UnknownRJump_0x64F4

UnknownRJump_0x64CB:
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
	cp $10
	jr c, UnknownRJump_0x64F4
	xor a
	ld [$FF00+$C7], a
	ld a, 1
	ld [$FF00+$BB], a
	ld a, 200
	ld [$FF00+$C6], a
	call UnknownCall_0x5297
	ret

UnknownRJump_0x64F4:
	xor a
	ld [$A2B6], a
	ret

UnknownRJump_0x64F9:
	ld a, [$A2B7]
	inc a
	ld [$A2B7], a
	cp $10
	jr nc, UnknownRJump_0x64F4
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
	call UnknownCall_0x5297
	ret

UnknownData_0x6529:
INCBIN "baserom.gb", $6529, $8000 - $6529



SECTION "bank02", ROMX, BANK[$02]


UnknownCall_0x8000:
	ld de, $0060
	ldh_a_n $CA
	ld l, a
	sub e
	ld [$AF0D], a
	ldh_a_n $CB
	ld h, a
	sbc d
	ld [$AF0C], a
	jr nc, UnknownRJump_0x801C
	xor a
	ld [$AF0D], a
	ld [$AF0C], a

UnknownRJump_0x801C:
	add de
	ld a, h
	ld [$AF0A], a
	ld a, l
	ld [$AF0B], a
	ld e, 112
	ldh_a_n $CA
	ld l, a
	sub e
	ld [$AF15], a
	ldh_a_n $CB
	ld h, a
	sbc d
	ld [$AF14], a
	jr nc, UnknownRJump_0x8040
	xor a
	ld [$AF15], a
	ld [$AF14], a

UnknownRJump_0x8040:
	add de
	ld a, h
	ld [$AF12], a
	ld a, l
	ld [$AF13], a
	ld e, 160
	ldh_a_n $CA
	ld l, a
	sub e
	ld [$AF1D], a
	ldh_a_n $CB
	ld h, a
	sbc d
	ld [$AF1C], a
	jr nc, UnknownRJump_0x8064
	xor a
	ld [$AF1D], a
	ld [$AF1C], a

UnknownRJump_0x8064:
	add de
	ld a, h
	ld [$AF1A], a
	ld a, l
	ld [$AF1B], a
	ld a, [$AF24]
	ld b, a
	ldh_a_n $CB
	cp b
	jr c, UnknownRJump_0x80A4
	jr nz, UnknownRJump_0x8085
	ld a, [$AF25]
	ld b, a
	ldh_a_n $CA
	cp b
	jr c, UnknownRJump_0x80A4
	jr z, UnknownRJump_0x809A

UnknownRJump_0x8085:
	ld a, 1
	ld [$AF22], a
	ld a, [$AF12]
	ld [$AF00], a
	ld a, [$AF13]
	and $F8
	ld [$AF01], a
	jr UnknownRJump_0x80B7

UnknownRJump_0x809A:
	ld [$AF22], a
	ld a, 255
	ld [$AF00], a
	jr UnknownRJump_0x80B7

UnknownRJump_0x80A4:
	ld a, 255
	ld [$AF22], a
	ld a, [$AF14]
	ld [$AF00], a
	ld a, [$AF15]
	and $F8
	ld [$AF01], a

UnknownRJump_0x80B7:
	ld de, $0060
	ldh_a_n $C8
	ld l, a
	sub e
	ld [$AF11], a
	ldh_a_n $C9
	ld h, a
	sbc d
	ld [$AF10], a
	jr nc, UnknownRJump_0x80D3
	xor a
	ld [$AF11], a
	ld [$AF10], a

UnknownRJump_0x80D3:
	add de
	ld a, h
	ld [$AF0E], a
	ld a, l
	ld [$AF0F], a
	ld e, 160
	ldh_a_n $C8
	ld l, a
	sub e
	ld [$AF19], a
	ldh_a_n $C9
	ld h, a
	sbc d
	ld [$AF18], a
	jr nc, UnknownRJump_0x80F7
	xor a
	ld [$AF19], a
	ld [$AF18], a

UnknownRJump_0x80F7:
	add de
	ld a, h
	ld [$AF16], a
	ld a, l
	ld [$AF17], a
	ldh_a_n $C2
	add 8
	ld [$AF30], a
	ldh_a_n $C3
	adc 0
	ld [$AF31], a
	ldh_a_n $C0
	add 32
	ld [$AF32], a
	ldh_a_n $C1
	adc 0
	ld [$AF33], a
	ld a, [$AF08]
	xor $01
	ld [$AF08], a
	jr z, UnknownRJump_0x812E
	ld hl, $FFF0
	inc [hl]

UnknownRJump_0x812E:
	ld hl, $AD08

UnknownRJump_0x8131:
	xor a
	ld [$AF3E], a
	ld [$AF2E], a
	ld a, h
	ld [$AF28], a
	ld a, l
	ld [$AF29], a
	ld a, [hl]
	and a
	jr z, UnknownRJump_0x816A
	dec a
	jr z, UnknownRJump_0x815E
	call UnknownCall_0x826D
	ld a, [$AF3E]
	and a
	jr nz, UnknownRJump_0x816A
	call UnknownCall_0x828F
	ld a, [$AF3E]
	and a
	jr nz, UnknownRJump_0x816A
	call UnknownCall_0x818D
	jr UnknownRJump_0x816A

UnknownRJump_0x815E:
	call UnknownCall_0x826D
	ld a, [$AF3E]
	and a
	jr nz, UnknownRJump_0x816A
	call UnknownCall_0x81F7

UnknownRJump_0x816A:
	ld a, [$AF28]
	ld h, a
	ld a, [$AF29]
	ld l, a
	ld de, $0020
	add de
	ld a, h
	cp $AF
	jr z, UnknownRJump_0x817D
	jr UnknownRJump_0x8131

UnknownRJump_0x817D:
	call UnknownCall_0x8C31
	ldh_a_n $CB
	ld [$AF24], a
	ldh_a_n $CA
	ld [$AF25], a
	ret

UnknownCall_0x818D:
	call UnknownCall_0x81A7
	call UnknownCall_0x3A50
	call UnknownCall_0x3C80
	ld a, [$AF09]
	and a
	jr z, UnknownRJump_0x819F
	xor a
	ld [$FF00+$E7], a

UnknownRJump_0x819F:
	xor a
	ld [$AF09], a
	call UnknownCall_0x81BA
	ret

UnknownCall_0x81A7:
	ld hl, $AF28
	ld a, [hli]
	ld b, a
	ld a, [hl]
	and $F0
	ld l, a
	ld h, b
	ld de, $FFD0
	ld b, 32
	call UnknownCall_0x3CAA
	ret

UnknownCall_0x81BA:
	call UnknownCall_0x81CF

UnknownCall_0x81BD:
	ld hl, $AF28
	ld a, [hli]
	ld d, a
	ld a, [hl]
	and $F0
	ld e, a
	ld hl, $FFD0
	ld b, 32
	call UnknownCall_0x3CAA
	ret

UnknownCall_0x81CF:
	ld hl, $4935
	ld a, [$AF06]
	and a
	jr nz, UnknownRJump_0x81DB
	ld hl, $4737

UnknownJump_0x81DB:
UnknownRJump_0x81DB:
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

UnknownCall_0x81F7:
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld hl, $AF0A
	ld de, $AF02
	ld b, 4
	call UnknownCall_0x3CAA
	call UnknownCall_0x82D5
	ld a, [$AF2A]
	and a
	ret z
	ld hl, $AF0E
	ld de, $AF02
	ld b, 4
	call UnknownCall_0x3CAA
	call UnknownCall_0x8306
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

UnknownCall_0x8240:
	ld a, [$FF00+$D6]
	cp $AD
	ret nc
	ld a, [$FF00+$D5]
	ld e, a
	ld d, 0
	ld hl, $4BC1
	ld a, [$AF06]
	and a
	jr nz, UnknownRJump_0x8256
	ld hl, $4B61

UnknownRJump_0x8256:
	add de
	ld a, [hl]
	ld hl, $FFDB
	ld [hli], a
	inc l
	ld a, [$AF38]
	ld [hli], a
	ld b, 17
	xor a

UnknownRJump_0x8264:
	ld [hli], a
	dec b
	jr nz, UnknownRJump_0x8264
	xor a
	ld [$AF38], a
	ret

UnknownCall_0x826D:
	ld a, [$FF00+$F0]
	and $01
	ret z
	ld hl, $AF1A
	ld de, $AF02
	ld b, 4
	call UnknownCall_0x3CAA
	call UnknownCall_0x82D5
	ld a, [$AF2A]
	and a
	ret nz

UnknownRJump_0x8285:
	call UnknownCall_0x81A7
	call UnknownCall_0x3C6C
	call UnknownCall_0x81BA
	ret

UnknownCall_0x828F:
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld hl, $AF16
	ld de, $AF02
	ld b, 4
	call UnknownCall_0x3CAA
	call UnknownCall_0x8306
	ld a, [$AF2A]
	and a
	ret nz
	ld a, [$FF00+$D5]
	cp $10
	jr z, UnknownRJump_0x8285
	ld a, [$AF28]
	ld h, a
	ld a, [$AF29]
	sub 2
	ld l, a
	ld a, [hli]
	cp $AD
	jr nc, UnknownRJump_0x8285
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

UnknownCall_0x82D5:
	xor a
	ld [$AF2A], a
	ld a, [$AF28]
	ld h, a
	ld a, [$AF29]
	and $F0
	ld l, a

UnknownRJump_0x82E3:
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld a, [$AF02]
	cp b
	ret c
	jr nz, UnknownRJump_0x82F2
	ld a, [$AF03]
	cp c
	ret c

UnknownRJump_0x82F2:
	ld a, [$AF04]
	cp b
	jr c, UnknownRJump_0x8300
	ret nz
	ld a, [$AF05]
	cp c
	jr z, UnknownRJump_0x8300
	ret nc

UnknownRJump_0x8300:
	ld a, 1
	ld [$AF2A], a
	ret

UnknownCall_0x8306:
	xor a
	ld [$AF2A], a
	ld a, [$AF28]
	ld h, a
	ld a, [$AF29]
	and $F0
	add 3
	ld l, a
	jr UnknownRJump_0x82E3

UnknownCall_0x8318:
	ld a, 136
	ld [$AF2F], a
	ld a, [$FF00+$D4]
	ldh_n_a $B7
	and $0C
	jr nz, UnknownRJump_0x837B
	ld a, [$FF00+$D3]
	ldh_n_a $B8
	ld b, 16
	call UnknownCall_0x859D
	call UnknownCall_0x1F2F
	cp $48
	ret c
	jr UnknownRJump_0x837B

UnknownCall_0x8338:
	ld a, 136
	ld [$AF2F], a
	ld a, [$FF00+$D4]
	ldh_n_a $B7
	and $0C
	jr nz, UnknownRJump_0x837B
	ld a, [$FF00+$D3]
	ldh_n_a $B8
	ld b, 16
	call UnknownCall_0x8590
	call UnknownCall_0x1F2F
	cp $48
	ret c
	jr UnknownRJump_0x837B

UnknownCall_0x8358:
	ld a, 136
	ld [$AF2F], a
	ld a, [$FF00+$D4]
	ldh_n_a $B7
	and $0C
	jr nz, UnknownRJump_0x837B
	ld a, [$FF00+$D3]
	ldh_n_a $B8

UnknownRJump_0x836B:
	ld a, [$FF00+$D1]
	ldh_n_a $B9
	ld a, [$FF00+$D0]
	ldh_n_a $BA
	call UnknownCall_0x1F2F
	cp $48
	ret c

UnknownRJump_0x837B:
	ld hl, $AF2F
	res 3, [hl]
	ret

UnknownCall_0x8381:
	ld a, 136
	ld [$AF2F], a
	ld b, 16
	call UnknownCall_0x8576
	ldh_a_n $B7
	and $0C
	jr nz, UnknownRJump_0x837B
	jr UnknownRJump_0x836B

UnknownCall_0x8394:
	ld a, 68
	ld [$AF2F], a
	ld b, 8
	call UnknownCall_0x8583
	ld a, [$FF00+$D1]
	ldh_n_a $B9
	ld a, [$FF00+$D0]
	ldh_n_a $BA
	call UnknownCall_0x1F2F
	cp $38
	ret c
	jr UnknownRJump_0x83CA

UnknownCall_0x83B0:
	ld a, 68
	ld [$AF2F], a
	ld b, 18
	call UnknownCall_0x8583
	ld a, [$FF00+$D1]
	ldh_n_a $B9
	ld a, [$FF00+$D0]
	ldh_n_a $BA
	call UnknownCall_0x1F2F
	cp $38
	ret c

UnknownRJump_0x83CA:
	ld hl, $AF2F
	res 2, [hl]
	ret

UnknownCall_0x83D0:
	ld a, 68
	ld [$AF2F], a
	ld b, 32
	call UnknownCall_0x8583
	ld a, [$FF00+$D1]
	ldh_n_a $B9
	ld a, [$FF00+$D0]
	ldh_n_a $BA
	call UnknownCall_0x1F2F
	cp $38
	ret c
	jr UnknownRJump_0x83CA

UnknownCall_0x83EC:
	ld a, 68
	ld [$AF2F], a
	ld b, 18
	call UnknownCall_0x8583
	ld b, 16
	call UnknownCall_0x859D
	call UnknownCall_0x1F2F
	cp $38
	ret c
	jr UnknownRJump_0x83CA

UnknownCall_0x8403:
	ld a, 68
	ld [$AF2F], a
	ld b, 18
	call UnknownCall_0x8583
	ld b, 16
	call UnknownCall_0x8590
	call UnknownCall_0x1F2F
	cp $38
	ret c
	jr UnknownRJump_0x83CA

UnknownCall_0x841A:
	ld a, 17
	ld [$AF2F], a
	ld b, 8
	call UnknownCall_0x8583
	ld b, 7
	call UnknownCall_0x8590
	call UnknownCall_0x1F2F
	cp $38
	ret c
	ld b, 5
	call UnknownCall_0x8583
	call UnknownCall_0x1F2F
	cp $38
	ret c
	jr UnknownRJump_0x845C

UnknownCall_0x843C:
	ld a, 17
	ld [$AF2F], a
	ld b, 11
	call UnknownCall_0x8583
	ld b, 7
	call UnknownCall_0x8590
	call UnknownCall_0x1F2F
	cp $38
	ret c
	ld b, 5
	call UnknownCall_0x8583
	call UnknownCall_0x1F2F
	cp $38
	ret c

UnknownRJump_0x845C:
	ld hl, $AF2F
	res 0, [hl]
	ret

UnknownCall_0x8462:
	ld a, 17
	ld [$AF2F], a
	ld b, 11
	call UnknownCall_0x8583
	ld b, 11
	call UnknownCall_0x8590
	call UnknownCall_0x1F2F
	cp $38
	ret c
	ld b, 5
	call UnknownCall_0x8583
	call UnknownCall_0x1F2F
	cp $38
	ret c
	jr UnknownRJump_0x845C

UnknownCall_0x8484:
	ld a, 17
	ld [$AF2F], a
	ld b, 11
	call UnknownCall_0x8583
	ld b, 19
	call UnknownCall_0x8590
	call UnknownCall_0x1F2F
	cp $38
	ret c
	ld b, 5
	call UnknownCall_0x8583
	call UnknownCall_0x1F2F
	cp $38
	ret c
	jr UnknownRJump_0x845C

UnknownCall_0x84A6:
	ld a, 17
	ld [$AF2F], a
	ld b, 19
	call UnknownCall_0x8583
	ld b, 11
	call UnknownCall_0x8590
	call UnknownCall_0x1F2F
	cp $38
	ret c
	ld b, 4
	call UnknownCall_0x8583
	call UnknownCall_0x1F2F
	cp $38
	ret c
	jr UnknownRJump_0x845C

UnknownCall_0x84C8:
	ld a, 34
	ld [$AF2F], a
	ld b, 8
	call UnknownCall_0x8583
	ld b, 7
	call UnknownCall_0x859D
	call UnknownCall_0x1F2F
	cp $38
	ret c
	ld b, 5
	call UnknownCall_0x8583
	call UnknownCall_0x1F2F
	cp $38
	ret c
	jr UnknownRJump_0x850A

UnknownCall_0x84EA:
	ld a, 34
	ld [$AF2F], a
	ld b, 11
	call UnknownCall_0x8583
	ld b, 7
	call UnknownCall_0x859D
	call UnknownCall_0x1F2F
	cp $38
	ret c
	ld b, 5
	call UnknownCall_0x8583
	call UnknownCall_0x1F2F
	cp $38
	ret c

UnknownRJump_0x850A:
	ld hl, $AF2F
	res 1, [hl]
	ret

UnknownCall_0x8510:
	ld a, 34
	ld [$AF2F], a
	ld b, 11
	call UnknownCall_0x8583
	ld b, 11
	call UnknownCall_0x859D
	call UnknownCall_0x1F2F
	cp $38
	ret c
	ld b, 5
	call UnknownCall_0x8583
	call UnknownCall_0x1F2F
	cp $38
	ret c
	jr UnknownRJump_0x850A

UnknownCall_0x8532:
	ld a, 34
	ld [$AF2F], a
	ld b, 11
	call UnknownCall_0x8583
	ld b, 19
	call UnknownCall_0x859D
	call UnknownCall_0x1F2F
	cp $38
	ret c
	ld b, 5
	call UnknownCall_0x8583
	call UnknownCall_0x1F2F
	cp $38
	ret c
	jr UnknownRJump_0x850A

UnknownCall_0x8554:
	ld a, 34
	ld [$AF2F], a
	ld b, 19
	call UnknownCall_0x8583
	ld b, 11
	call UnknownCall_0x859D
	call UnknownCall_0x1F2F
	cp $38
	ret c
	ld b, 4
	call UnknownCall_0x8583
	call UnknownCall_0x1F2F
	cp $38
	ret c
	jr UnknownRJump_0x850A

UnknownCall_0x8576:
	ld hl, $FFB7
	ld a, [$FF00+$D4]
	add b
	ld [hli], a
	ld a, [$FF00+$D3]
	adc 0
	ld [hl], a
	ret

UnknownCall_0x8583:
	ld hl, $FFB7
	ld a, [$FF00+$D4]
	sub b
	ld [hli], a
	ld a, [$FF00+$D3]
	sbc 0
	ld [hl], a
	ret

UnknownCall_0x8590:
	ld hl, $FFB9
	ld a, [$FF00+$D1]
	add b
	ld [hli], a
	ld a, [$FF00+$D0]
	adc 0
	ld [hl], a
	ret

UnknownCall_0x859D:
	ld hl, $FFB9
	ld a, [$FF00+$D1]
	sub b
	ld [hli], a
	ld a, [$FF00+$D0]
	sbc 0
	ld [hl], a
	ret

UnknownCall_0x85AA:
	ld a, [$FF00+$E7]
	and a
	ret z
	bit 0, a
	jr nz, UnknownRJump_0x85C4
	bit 1, a
	jr nz, UnknownRJump_0x85F0
	bit 2, a
	jr nz, UnknownRJump_0x85E2
	bit 4, a
	jr nz, UnknownRJump_0x8611
	bit 5, a
	jp nz, UnknownJump_0x86A0
	ret

UnknownRJump_0x85C4:
	xor a
	ld [$FF00+$DF], a
	ld a, [sSpinJump]
	and a
	jr nz, UnknownRJump_0x85F0
	ld a, [$FF00+$E2]
	bit 1, a
	jr z, UnknownRJump_0x85F0
	bit 0, a
	jr z, UnknownRJump_0x8633
	ld a, 3
	ld [$A460], a

UnknownCall_0x85DC:
	ld hl, $FFD5
	dec [hl]
	jr UnknownRJump_0x863C

UnknownRJump_0x85E2:
	ld a, [$A460]
	cp $09
	jr z, UnknownRJump_0x85FC
	ld a, 16
	ld [$A460], a
	jr UnknownRJump_0x85FC

UnknownJump_0x85F0:
UnknownRJump_0x85F0:
	ld a, [$A460]
	cp $09
	jr z, UnknownRJump_0x85FC
	ld a, 6
	ld [$A460], a

UnknownRJump_0x85FC:
UnknownCall_0x85FC:
	call UnknownCall_0x3A78
	xor a
	ld [$FF00+$D5], a
	ld [$FF00+$DF], a
	ld [$FF00+$DC], a
	ld [$FF00+$E2], a
	ld a, 1
	ld [$AF3E], a
	ld [$AF09], a
	ret

UnknownRJump_0x8611:
	ld a, [$FF00+$E2]
	bit 7, a
	jr nz, UnknownRJump_0x868A
	cp $06
	ret nz
	ldh_a_n $80
	bit 1, a
	jr z, UnknownRJump_0x864A
	ld a, [$AF3A]
	and a
	ret nz
	ld a, 1
	ld [$AF3A], a
	ld a, [$FF00+$D5]
	add 2
	ld [$FF00+$D5], a
	jr UnknownRJump_0x863C

UnknownRJump_0x8633:
UnknownCall_0x8633:
	ld a, 3
	ld [$A460], a
	ld hl, $FFD5
	inc [hl]

UnknownJump_0x863C:
UnknownRJump_0x863C:
UnknownCall_0x863C:
	ld a, [$FF00+$DD]
	ld [$AF38], a
	call UnknownCall_0x8240
	ld a, 1
	ld [$AF3E], a
	ret

UnknownRJump_0x864A:
	call UnknownCall_0x8633
	ld b, 16
	ld a, [sMarioDirection]
	cp $01
	jr z, UnknownRJump_0x8670
	call UnknownCall_0x3D22
	call UnknownCall_0x84C8
	ld a, [$AF2F]
	bit 1, a
	ret z
	ld b, 16
	call UnknownCall_0x3D32
	ld a, 95
	ld [$FF00+$E2], a
	ld a, 2
	ld [$FF00+$DF], a
	ret

UnknownRJump_0x8670:
	call UnknownCall_0x3D32
	call UnknownCall_0x841A
	ld a, [$AF2F]
	bit 0, a
	ret z

UnknownData_0x867C:
INCBIN "baserom.gb", $867C, $868A - $867C


UnknownRJump_0x868A:
	cp $85
	jr z, UnknownRJump_0x86DA
	cp $89
	jr z, UnknownRJump_0x8695
	cp $86
	ret nc

UnknownRJump_0x8695:
	xor a
	ld [$FF00+$DD], a
	call UnknownCall_0x863C
	ld a, 16
	ld [$FF00+$D5], a
	ret

UnknownJump_0x86A0:
	ld a, 1
	ld [$AF09], a
	ld a, [$FF00+$E2]
	bit 7, a
	jr nz, UnknownRJump_0x86E4
	xor a
	ld [$FF00+$DF], a
	ld a, [$FF00+$E2]
	bit 4, a
	jr nz, UnknownRJump_0x86C6
	bit 3, a
	jp nz, UnknownJump_0x85F0

UnknownData_0x86B9:
INCBIN "baserom.gb", $86B9, $86C6 - $86B9


UnknownRJump_0x86C6:
	bit 3, a
	jr nz, UnknownRJump_0x86D2
	call UnknownCall_0x8633
	ld a, 1
	ld [$FF00+$EB], a
	ret

UnknownRJump_0x86D2:
UnknownData_0x86D2:
INCBIN "baserom.gb", $86D2, $86DA - $86D2


UnknownRJump_0x86DA:
	ld a, 16
	ld [$FF00+$D5], a
	xor a
	ld [$FF00+$DD], a
	jp UnknownJump_0x863C

UnknownRJump_0x86E4:
	ld a, [$FF00+$E2]
	and $7F
	jr nz, UnknownRJump_0x8721
	ld a, [$FF00+$D5]
	cp $11
	jr nz, UnknownRJump_0x8708
	ld a, [sCurPowerup]
	and a
	jr z, UnknownRJump_0x8708
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

UnknownRJump_0x8708:
	ld a, [$FF00+$D5]
	add 112
	ld [$FF00+$E2], a
	ld a, 1
	ld [$FF00+$DF], a
	ld b, 16
	call UnknownCall_0x3A64
	ld a, 8
	ld [$A460], a
	ld a, 16
	ld [$FF00+$D2], a
	ret

UnknownRJump_0x8721:
	ld a, [$FF00+$E2]
	ld [$AFCC], a
	call UnknownCall_0x863C
	ld a, [$AFCC]
	ld [$FF00+$E2], a
	xor a
	ld [$AFCC], a
	ld a, 2
	ld [$FF00+$EB], a
	ret

UnknownData_0x8737:
INCBIN "baserom.gb", $8737, $8C31 - $8737


UnknownCall_0x8C31:
	ld a, [$AF22]
	and a
	ret z
	dec a
	jr z, UnknownRJump_0x8C3C
	jp UnknownJump_0x8CEB

UnknownRJump_0x8C3C:
	ld a, [$AF00]
	cp $FF
	ret z
	ld c, a
	ld a, [$AF1E]
	ld h, a
	ld a, [$AF1F]
	ld l, a
	ld a, [hl]
	cp $FF
	ret z
	ld de, $0006

UnknownRJump_0x8C52:
	cp c
	jr z, UnknownRJump_0x8C6E
	ret nc

UnknownJump_0x8C56:
UnknownRJump_0x8C56:
	ld a, [$AF1E]
	ld h, a
	ld a, [$AF1F]
	ld l, a
	add de
	ld a, [hl]
	cp $FF
	ret z
	ld a, h
	ld [$AF1E], a
	ld a, l
	ld [$AF1F], a
	ld a, [hl]
	jr UnknownRJump_0x8C52

UnknownRJump_0x8C6E:
	inc hl
	ld a, [$AF01]
	ld b, a
	ld a, [hl]
	cp b
	jr c, UnknownRJump_0x8C56
	ret nz
	ld a, [sEasyMode]
	and $01
	jr nz, UnknownRJump_0x8C87
	inc hl
	ld a, [hl]
	and $0E
	jr nz, UnknownRJump_0x8C56
	jr UnknownRJump_0x8C8D

UnknownRJump_0x8C87:
	inc hl
	ld a, [hl]
	and $0F
	jr nz, UnknownRJump_0x8C56

UnknownRJump_0x8C8D:
	ld b, e
	ld hl, $ACE8
	ld e, 32

UnknownRJump_0x8C93:
	add de
	ld a, [hl]
	and a
	jr nz, UnknownRJump_0x8C93
	ld a, h
	cp $AF
	ret z
	ld a, l
	and $F0
	ld l, a
	ld a, [$AF1E]
	ld d, a
	ld a, [$AF1F]
	ld e, a

UnknownRJump_0x8CA8:
	ld a, [de]
	ld [hli], a
	inc de
	dec b
	jr nz, UnknownRJump_0x8CA8
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

UnknownRJump_0x8CC6:
	ld [hli], a
	dec b
	jr nz, UnknownRJump_0x8CC6
	ld a, [$AF1E]
	ld h, a
	ld a, [$AF1F]
	add 2
	ld l, a
	ld [hl], 2
	push bc
	call UnknownCall_0x81A7
	call UnknownCall_0x8240
	call UnknownCall_0x81BA
	pop bc
	ld hl, $AF40
	inc [hl]
	ld de, $0006
	jp UnknownJump_0x8C56

UnknownJump_0x8CEB:
	ld a, [$AF00]
	cp $FF
	ret z
	ld c, a
	ld a, [$AF1E]
	ld h, a
	ld a, [$AF1F]
	ld l, a
	ld a, [hl]
	cp $FF
	ret z
	ld de, $FFFA

UnknownRJump_0x8D01:
	cp c
	jr z, UnknownRJump_0x8D1D
	ret c

UnknownJump_0x8D05:
UnknownRJump_0x8D05:
	ld a, [$AF1E]
	ld h, a
	ld a, [$AF1F]
	ld l, a
	add de
	ld a, [hl]
	cp $FF
	ret z
	ld a, h
	ld [$AF1E], a
	ld a, l
	ld [$AF1F], a
	ld a, [hl]
	jr UnknownRJump_0x8D01

UnknownRJump_0x8D1D:
	inc hl
	ld a, [$AF01]
	ld b, a
	ld a, [hl]
	cp b
	ret c
	jr nz, UnknownRJump_0x8D05
	ld a, [sEasyMode]
	and $01
	jr nz, UnknownRJump_0x8D36
	inc hl
	ld a, [hl]
	and $0E
	jr nz, UnknownRJump_0x8D05
	jr UnknownRJump_0x8D3C

UnknownRJump_0x8D36:
	inc hl
	ld a, [hl]
	and $0F
	jr nz, UnknownRJump_0x8D05

UnknownRJump_0x8D3C:
	ld b, 6
	ld hl, $ACE8
	ld de, $0020

UnknownRJump_0x8D44:
	add de
	ld a, [hl]
	and a
	jr nz, UnknownRJump_0x8D44
	ld a, h
	cp $AF
	ret z
	ld a, l
	and $F0
	ld l, a
	ld a, [$AF1E]
	ld d, a
	ld a, [$AF1F]
	ld e, a

UnknownRJump_0x8D59:
	ld a, [de]
	ld [hli], a
	inc de
	dec b
	jr nz, UnknownRJump_0x8D59
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

UnknownRJump_0x8D77:
	ld [hli], a
	dec b
	jr nz, UnknownRJump_0x8D77
	ld a, [$AF1E]
	ld h, a
	ld a, [$AF1F]
	add 2
	ld l, a
	ld [hl], 2
	push bc
	call UnknownCall_0x81A7
	call UnknownCall_0x8240
	call UnknownCall_0x81BA
	pop bc
	ld hl, $AF40
	inc [hl]
	ld de, $FFFA
	jp UnknownJump_0x8D05

UnknownJump_0x8D9C:
	call UnknownCall_0x3A28
	call UnknownCall_0x3A00
	call UnknownCall_0x8DFD
	call UnknownCall_0x8E6C
	ret

UnknownJump_0x8DA9:
	ld a, [$AFC1]
	inc a
	ld [$AFC2], a
	ld a, 173
	ld [$AF28], a
	ld a, 0
	ld [$AF29], a
	ld hl, $FFF0
	inc [hl]

UnknownRJump_0x8DBE:
	xor a
	ld [$AF3E], a
	ld [$AFC3], a
	ld [$5290], a
	call UnknownCall_0x81A7
	ld a, [$FF00+$D5]
	and a
	jr z, UnknownRJump_0x8DDF
	call UnknownCall_0x92DF
	call UnknownCall_0x3A14
	xor a
	ld [$FF00+$E7], a
	call UnknownCall_0x9048
	call UnknownCall_0x81BD

UnknownRJump_0x8DDF:
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
	jr UnknownRJump_0x8DBE

UnknownCall_0x8DFD:
	ld b, 0
	ld a, [sCurLevel]
	cp $05
	jr z, UnknownRJump_0x8E20
	inc b
	cp $09
	jr z, UnknownRJump_0x8E20
	inc b
	cp $0D
	jr z, UnknownRJump_0x8E20
	inc b
	cp $10
	jr z, UnknownRJump_0x8E20
	inc b
	cp $13
	jr z, UnknownRJump_0x8E20
	inc b
	cp $17
	jr z, UnknownRJump_0x8E20
	inc b

UnknownRJump_0x8E20:
	ld a, [$A2DC]
	add b
	ld [$AFC0], a
	ld a, 80
	ld [$AFCD], a
	ld hl, $4E3F
	call UnknownCall_0x904E
	ld a, [hli]
	ld [$AFC1], a
	ld a, [hli]
	ld [$AFC5], a
	ld a, [hl]
	ld [$AFCA], a
	ret

UnknownData_0x8E3F:
INCBIN "baserom.gb", $8E3F, $8E6C - $8E3F


UnknownCall_0x8E6C:
	ld hl, $4E9A
	call UnknownCall_0x904E
	ld de, $AD05
	ld b, 18
	call UnknownCall_0x3CAA
	ld hl, $4EAC
	call UnknownCall_0x904E
	ld a, [$AFC1]
	and a
	ret z
	ld c, a
	ld de, $AD25

UnknownRJump_0x8E89:
	ld b, 18
	call UnknownCall_0x3CAA
	ld a, e
	add 16
	and $F0
	add 5
	ld e, a
	dec c
	jr nz, UnknownRJump_0x8E89
	ret

UnknownData_0x8E9A:
INCBIN "baserom.gb", $8E9A, $9048 - $8E9A


UnknownCall_0x9048:
	ld hl, $505B
	jp UnknownJump_0x81DB

UnknownCall_0x904E:
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

UnknownData_0x905B:
INCBIN "baserom.gb", $905B, $9285 - $905B


UnknownCall_0x9285:
	ld a, [$FF00+$E7]
	bit 0, a
	jr nz, UnknownRJump_0x92A5
	bit 1, a
	jr nz, UnknownRJump_0x9290
	ret

UnknownRJump_0x9290:
	ld a, 1
	ld [$AF3E], a
	ld a, [$AF29]
	and a
	ret nz

UnknownData_0x929A:
INCBIN "baserom.gb", $929A, $92A5 - $929A


UnknownRJump_0x92A5:
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
	jr z, UnknownRJump_0x92C4
	jr c, UnknownRJump_0x92C4
	ret

UnknownRJump_0x92C4:
	ld a, 1
	ld [$AF26], a
	ld a, [$AFC0]
	cp $06
	ret nc
	ld a, 2
	ld [$A267], a
	ld a, 128
	ld [$A266], a
	ld a, 1
	ld [$A2E3], a
	ret

UnknownCall_0x92DF:
	ld a, [$A224]
	cp $FF
	ret z
	ld a, [$FF00+$D5]
	rst $28

UnknownData_0x92E8:
INCBIN "baserom.gb", $92E8, $9323 - $92E8

	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x934C
	ld b, 32
	call UnknownCall_0xB270
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

UnknownRJump_0x934C:
	dec a
	rst $28

UnknownData_0x934E:
INCBIN "baserom.gb", $934E, $9354 - $934E

	call UnknownCall_0xB1EB
	call UnknownCall_0xB270
	ld a, [$FF00+$E0]
	cp c
	ret nz
	ld a, 2
	ld [$FF00+$DF], a
	xor a
	ld [$FF00+$E0], a
	ret
	call UnknownCall_0xB18F
	call UnknownCall_0xB276
	ld a, [$FF00+$D9]
	cp $D0
	ret c
	ld a, [$AF29]
	and a
	jr nz, UnknownRJump_0x9399
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
	call UnknownCall_0xB15B
	ld a, 1
	ld [$AF3E], a
	ld a, 2
	ld [$AF26], a
	ret

UnknownRJump_0x9399:
	call UnknownCall_0xB157
	ld a, 1
	ld [$AF3E], a
	ld a, 2
	ld [$AF26], a
	ret
	call UnknownCall_0x9285
	ld a, [$AF3E]
	and a
	jr z, UnknownRJump_0x93D5
	ld a, [$FF00+$DB]
	ld [$AF37], a
	ld a, [$FF00+$DF]
	ld [$AFC4], a
	ld a, [$FF00+$E2]
	ld [$AFCC], a
	ld a, [$AFC3]
	and a
	jr z, UnknownRJump_0x93CD
	xor a
	ld [$FF00+$DB], a
	ld a, [$AFCD]
	ld [$FF00+$EC], a

UnknownRJump_0x93CD:
	xor a
	ld [$FF00+$E2], a
	ld a, 1
	ld [$FF00+$DF], a
	ret

UnknownRJump_0x93D5:
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x93EE
	call UnknownCall_0xB309
	call UnknownCall_0xB14E
	ret nz
	ld a, 69
	ld [$FF00+$E2], a
	ld a, 3
	ld [$FF00+$DB], a
	ld a, 3
	ld [$FF00+$DF], a
	ret

UnknownRJump_0x93EE:
	dec a
	rst $28

UnknownData_0x93F0:
INCBIN "baserom.gb", $93F0, $93FE - $93F0

	call UnknownCall_0xB40E
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0x940F
	call UnknownCall_0xB2F6
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz

UnknownRJump_0x940F:
	ld a, [$AF26]
	and a
	jr nz, UnknownRJump_0x9435
	ld a, 4
	ld [$FF00+$DB], a
	ld a, [$FF00+$EA]
	inc a
	ld [$FF00+$EA], a
	cp $10
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

UnknownJump_0x9435:
UnknownRJump_0x9435:
	ld a, 2
	ld [$FF00+$DF], a
	ld a, 32
	ld [$FF00+$EC], a
	ld a, [$AFCA]
	ld [$FF00+$DB], a
	ret

UnknownJump_0x9443:
UnknownCall_0x9443:
	call UnknownCall_0xB40E
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
	call UnknownCall_0xB183
	call UnknownCall_0xB276
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
	call UnknownCall_0xB2FD
	ld a, [$FF00+$E0]
	cp $0C
	jr c, UnknownRJump_0x9489
	ld b, 1
	call UnknownCall_0xB270

UnknownRJump_0x9489:
	ld hl, $5595
	call UnknownCall_0xB16B
	call UnknownCall_0xB26A
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	cp $69
	ret nz
	ld a, 104
	ld [$FF00+$E0], a
	ld a, 5
	ld [$FF00+$DF], a
	ld a, 80
	ld [$FF00+$EC], a
	ld a, [$AFC5]
	cp $03
	ret nc

UnknownData_0x94AC:
INCBIN "baserom.gb", $94AC, $94B6 - $94AC

	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0x94CD
	call UnknownCall_0xB2FD
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 5
	ld [$FF00+$DB], a
	ld a, 8
	ld [$A470], a

UnknownRJump_0x94CD:
	call UnknownCall_0xB309
	ld a, [$AFC6]
	and a
	jr nz, UnknownRJump_0x94DC
	ld a, [$FF00+$E0]
	cp $0C
	jr c, UnknownRJump_0x94E1

UnknownRJump_0x94DC:
	ld b, 1
	call UnknownCall_0xB276

UnknownRJump_0x94E1:
	ld hl, $5595
	call UnknownCall_0xB16B
	call UnknownCall_0xB264
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
	call UnknownCall_0xB2FD
	ld a, [$FF00+$E0]
	cp $0C
	jr c, UnknownRJump_0x9516
	ld b, 1
	call UnknownCall_0xB270

UnknownRJump_0x9516:
	ld hl, $5595
	call UnknownCall_0xB16B
	call UnknownCall_0xB264
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	cp $69
	ret nz
	ld a, 104
	ld [$FF00+$E0], a
	ld a, 7
	ld [$FF00+$DF], a
	ld a, 80
	ld [$FF00+$EC], a
	ld a, [$AFC5]
	cp $03
	ret nc
	ld a, 1
	ld [$AFC6], a
	ld a, 92
	ld [$FF00+$E0], a
	ret
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0x955A
	call UnknownCall_0xB2FD
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 5
	ld [$FF00+$DB], a
	ld a, 8
	ld [$A470], a

UnknownRJump_0x955A:
	call UnknownCall_0xB309
	ld a, [$AFC6]
	and a
	jr nz, UnknownRJump_0x9569

UnknownData_0x9563:
INCBIN "baserom.gb", $9563, $9569 - $9563


UnknownRJump_0x9569:
	ld b, 1
	call UnknownCall_0xB276
	ld hl, $5595
	call UnknownCall_0xB16B
	call UnknownCall_0xB26A
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

UnknownData_0x9595:
INCBIN "baserom.gb", $9595, $9606 - $9595

	ld a, [$FF00+$DF]
	and a
	ret nz
	ld a, [$AF26]
	cp $02
	ret nz
	xor a
	ld [$FF00+$E2], a
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 4
	ld [$AF36], a
	ld a, 9
	ld [$AF37], a
	call UnknownCall_0xB224
	ld a, 7
	ld [$FF00+$DB], a
	ret
	call UnknownCall_0xB1D6
	call UnknownCall_0xB270
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

UnknownData_0x9641:
INCBIN "baserom.gb", $9641, $9642 - $9641

	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x965E
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 5
	ld [$AF36], a
	ld a, 12
	ld [$AF37], a
	ld a, [$FF00+$DD]
	ld [$AF38], a
	call UnknownCall_0xB224
	ret

UnknownRJump_0x965E:
	call UnknownCall_0xB38C
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_0x966A:
INCBIN "baserom.gb", $966A, $9670 - $966A

	call UnknownCall_0xB18F
	call UnknownCall_0xB276
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
	call UnknownCall_0xB270
	ld a, [$FF00+$D9]
	cp $08
	ret nc
	ld a, 29
	ldh_n_a $9B
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x96B2
	ld a, [$FF00+$EC]
	inc a
	ld [$FF00+$EC], a
	cp $08
	ret nz
	xor a
	ld [$FF00+$EC], a
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 24
	call UnknownCall_0xB276
	ret

UnknownRJump_0x96B2:
	call UnknownCall_0xB2EF
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_0x96BE:
INCBIN "baserom.gb", $96BE, $96C4 - $96BE

	call UnknownCall_0xB1D6
	call UnknownCall_0xB270
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
	call UnknownCall_0xB270
	ret
	call UnknownCall_0xB18F
	call UnknownCall_0xB276
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
	call UnknownCall_0xB276
	ret
	call UnknownCall_0x9285
	ld a, [$AF3E]
	and a
	jr z, UnknownRJump_0x972D
	ld a, [$FF00+$DB]
	ld [$AF37], a
	ld a, [$FF00+$DF]
	ld [$AFC4], a
	ld a, [$FF00+$E2]
	ld [$AFCC], a
	ld a, [$AFC3]
	and a
	jr z, UnknownRJump_0x9725
	ld a, 17
	ld [$FF00+$DB], a
	ld a, [$AFCD]
	ld [$FF00+$EC], a

UnknownJump_0x9725:
UnknownRJump_0x9725:
	xor a
	ld [$FF00+$E2], a
	ld a, 1
	ld [$FF00+$DF], a
	ret

UnknownRJump_0x972D:
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x9752
	call UnknownCall_0xB14E
	ret nz
	ld a, [$FF00+$EC]
	inc a
	ld [$FF00+$EC], a
	cp $70
	ret nz
	xor a
	ld [$FF00+$EC], a
	ld a, 3
	ld [$FF00+$DF], a
	ld a, 8
	ld [$FF00+$EA], a
	call UnknownCall_0x97FA
	ld a, 2
	ld [$A470], a
	ret

UnknownRJump_0x9752:
	dec a
	rst $28

UnknownData_0x9754:
INCBIN "baserom.gb", $9754, $9762 - $9754

	call UnknownCall_0xB40E
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0x9770
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz

UnknownRJump_0x9770:
	ld a, [$AF26]
	and a
	jp nz, UnknownJump_0x9435
	xor a
	ld [$FF00+$DE], a
	ld a, 20
	ld [$FF00+$DB], a
	ld a, 5
	ld [$FF00+$DF], a
	xor a
	ld [$FF00+$E2], a
	ret
	call UnknownCall_0x9C19
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
	ldh_a_n $04
	and $03
	ld [$AFC7], a
	ld a, 9
	ld [$AF36], a
	ld a, 26
	ld [$AF37], a
	ld a, [$FF00+$DD]
	ld [$AF38], a
	call UnknownCall_0xB224
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
	cp $19
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

UnknownCall_0x97FA:
	ld a, 112
	ld [$FF00+$D9], a
	ldh_a_n $04
	and $03
	jr z, UnknownRJump_0x980D
	ld a, [$AFC9]
	xor $01
	ld [$AFC9], a

UnknownRJump_0x980D:
	ld a, [$AFC9]
	and a
	jr nz, UnknownRJump_0x981B
	ld a, 152
	ld [$FF00+$DA], a
	xor a
	ld [$FF00+$DD], a
	ret

UnknownRJump_0x981B:
	ld a, 24
	ld [$FF00+$DA], a
	ld a, 32
	ld [$FF00+$DD], a
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x9862
	ld a, [$AFC8]
	and a
	ret z
	ld a, [$AFC7]
	bit 0, a
	ret z
	dec a
	jr z, UnknownRJump_0x9845
	ld a, [$AFC9]
	and a
	jr nz, UnknownRJump_0x984B

UnknownRJump_0x983D:
	ld a, [$AF29]
	cp $60
	ret nz
	jr UnknownRJump_0x9851

UnknownRJump_0x9845:
	ld a, [$AFC9]
	and a
	jr nz, UnknownRJump_0x983D

UnknownRJump_0x984B:
	ld a, [$AF29]
	cp $20
	ret nz

UnknownRJump_0x9851:
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 80
	ld [$FF00+$E8], a
	ld a, 64
	ld [$FF00+$EC], a
	ld a, 25
	ld [$FF00+$DB], a
	ret

UnknownRJump_0x9862:
	dec a
	rst $28

UnknownData_0x9864:
INCBIN "baserom.gb", $9864, $986C - $9864

	call UnknownCall_0xB3F4
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
	jr nz, UnknownRJump_0x98A0
	ld b, 2
	call UnknownCall_0xB270
	call UnknownCall_0x3D10
	ld a, [$FF00+$E8]
	sub b
	ld [$FF00+$E8], a
	ret nz
	ld a, 3
	ld [$FF00+$DF], a
	ld a, 32
	ld [$FF00+$EC], a
	ret

UnknownRJump_0x98A0:
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
	cp $84
	jr nc, UnknownRJump_0x98C0
	call UnknownCall_0xB18F
	call UnknownCall_0xB276
	ret

UnknownRJump_0x98C0:
	ld a, 132
	ld [$FF00+$D9], a
	xor a
	ld [$FF00+$DF], a
	ret
	ld a, [$AF26]
	cp $02
	jr z, UnknownRJump_0x98F0
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x9908
	ld a, [$AFC8]
	and a
	ret z
	ld a, [$AFC7]
	cp $02
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

UnknownRJump_0x98F0:
	ld a, 116
	ld [$FF00+$D9], a
	ld a, 88
	ld [$FF00+$DA], a

UnknownJump_0x98F8:
	ld a, 4
	ld [$FF00+$D5], a
	ld a, 9
	ld [$FF00+$DB], a
	xor a
	ld [$FF00+$DF], a
	ld [$FF00+$E0], a
	ld [$FF00+$E2], a
	ret

UnknownRJump_0x9908:
	dec a
	rst $28

UnknownData_0x990A:
INCBIN "baserom.gb", $990A, $9912 - $990A

	ld a, [$FF00+$D9]
	cp $74
	jr nc, UnknownRJump_0x991F
	call UnknownCall_0xB18F
	call UnknownCall_0xB276
	ret

UnknownRJump_0x991F:
	ld a, 116
	ld [$FF00+$D9], a
	xor a
	ld [$FF00+$DF], a
	ret
	call UnknownCall_0xB2FD
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x994A
	ld a, 64
	ld [$FF00+$E2], a
	call UnknownCall_0x3CB1
	ld b, 28
	call UnknownCall_0xB270
	ld b, 16
	ld a, [$FF00+$DD]
	and a
	jr nz, UnknownRJump_0x9946
	call UnknownCall_0xB264
	ret

UnknownRJump_0x9946:
	call UnknownCall_0xB26A
	ret

UnknownRJump_0x994A:
	dec a
	rst $28

UnknownData_0x994C:
INCBIN "baserom.gb", $994C, $9954 - $994C

	call UnknownCall_0x997D
	jr z, UnknownRJump_0x996E
	call UnknownCall_0xB264
	jr UnknownRJump_0x9966
	call UnknownCall_0x997D
	jr z, UnknownRJump_0x996E
	call UnknownCall_0xB26A

UnknownRJump_0x9966:
	call UnknownCall_0x99A2
	ld hl, $FFE0
	inc [hl]
	ret

UnknownRJump_0x996E:
	ld a, [$FF00+$DB]
	add 2
	ld [$FF00+$DB], a
	ld a, 3
	ld [$FF00+$DF], a
	ld a, 32
	ld [$FF00+$EC], a
	ret

UnknownCall_0x997D:
	ld a, [$AFC7]
	dec a
	jr z, UnknownRJump_0x998E
	dec a
	jr z, UnknownRJump_0x9993
	dec a
	jr z, UnknownRJump_0x9998
	ld hl, $59E2
	jr UnknownRJump_0x999B

UnknownRJump_0x998E:
	ld hl, $5A63
	jr UnknownRJump_0x999B

UnknownRJump_0x9993:
	ld hl, $5AB4
	jr UnknownRJump_0x999B

UnknownRJump_0x9998:
	ld hl, $5AF1

UnknownRJump_0x999B:
	call UnknownCall_0xB16B
	ld a, b
	cp $80
	ret

UnknownCall_0x99A2:
	ld a, [$AFC7]
	dec a
	jr z, UnknownRJump_0x99AF
	dec a
	jr z, UnknownRJump_0x99B4
	dec a
	jr z, UnknownRJump_0x99B9
	ret

UnknownRJump_0x99AF:
	ld hl, $5B3E
	jr UnknownRJump_0x99BC

UnknownRJump_0x99B4:
	ld hl, $5B8F
	jr UnknownRJump_0x99BC

UnknownRJump_0x99B9:
	ld hl, $5BCC

UnknownRJump_0x99BC:
	call UnknownCall_0xB16B
	call UnknownCall_0xB276
	ret
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, [$AFC7]
	and a
	jr z, UnknownRJump_0x99DE
	ld a, 1
	ld [$AFC8], a
	ld a, 4
	ld [$FF00+$DF], a
	ret
	ld a, [$AFC8]
	and a
	ret nz

UnknownRJump_0x99DE:
	call UnknownCall_0xB157
	ret

UnknownData_0x99E2:
INCBIN "baserom.gb", $99E2, $9C19 - $99E2


UnknownCall_0x9C19:
	ld a, [$FF00+$EA]
	ld b, a
	ld a, [$FF00+$F0]
	and $07
	jr z, UnknownRJump_0x9C2B
	cp b
	ret nz
	ld a, [$FF00+$DB]
	xor $01
	ld [$FF00+$DB], a
	ret

UnknownRJump_0x9C2B:
	dec b
	ld a, b
	ld [$FF00+$EA], a
	ld a, [$FF00+$DB]
	res 0, a
	ld [$FF00+$DB], a
	ret
	call UnknownCall_0x9285
	ld a, [$AF3E]
	and a
	jr z, UnknownRJump_0x9C7F

UnknownJump_0x9C3F:
	ld a, [$FF00+$DB]
	ld [$AF37], a
	ld a, [$FF00+$DF]
	ld [$AFC4], a
	ld a, [$FF00+$E2]
	ld [$AFCC], a
	ld b, 1
	ld a, [$AFC3]
	and a
	jr z, UnknownRJump_0x9C67
	ld a, 19
	ld [$A460], a
	inc b
	ld a, 31
	ld [$FF00+$DB], a
	ld a, [$AFCD]
	ld [$FF00+$EC], a
	jr UnknownRJump_0x9C6C

UnknownRJump_0x9C67:
UnknownData_0x9C67:
INCBIN "baserom.gb", $9C67, $9C6C - $9C67


UnknownRJump_0x9C6C:
	xor a
	ld [$FF00+$E2], a
	ld a, [$FF00+$D8]
	sub b
	ld [$FF00+$D8], a
	jp z, UnknownJump_0x9435
	jp c, UnknownJump_0x9435
	ld a, 1
	ld [$FF00+$DF], a
	ret

UnknownRJump_0x9C7F:
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x9CA0
	call UnknownCall_0xB402
	call UnknownCall_0xB14E
	ret nz

UnknownJump_0x9C8B:
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

UnknownRJump_0x9CA0:
	dec a
	rst $28

UnknownData_0x9CA2:
INCBIN "baserom.gb", $9CA2, $9CAC - $9CA2

	call UnknownCall_0xB40E
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0x9CBA
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz

UnknownRJump_0x9CBA:
	ld a, [$AF26]
	and a
	jp nz, UnknownJump_0x9435
	xor a
	ld [$FF00+$DE], a
	ld a, [$AF37]
	ld [$FF00+$DB], a
	ld a, [$AFC4]
	ld [$FF00+$DF], a
	ld a, [$AFCC]
	ld [$FF00+$E2], a
	ret
	call UnknownCall_0xB2F6
	jp UnknownJump_0x9443
	ld b, 1
	call UnknownCall_0xB26A

UnknownJump_0x9CDF:
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_0x9CF6
	call UnknownCall_0xB1EB
	call UnknownCall_0xB270
	ld a, [$FF00+$E0]
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, 1
	ld [$FF00+$E8], a
	ret

UnknownRJump_0x9CF6:
	call UnknownCall_0xB18F
	call UnknownCall_0xB276
	ld a, [$FF00+$D9]
	cp $90
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
	call UnknownCall_0xB3D7
	ld a, [$FF00+$D8]
	srl a
	ld b, a
	ld a, 4
	sub b
	ld b, a
	call UnknownCall_0xB26A
	ld a, [$FF00+$DA]
	cp $A0
	ret c
	jr UnknownRJump_0x9D3D
	call UnknownCall_0xB3D7
	ld a, [$FF00+$D8]
	srl a
	ld b, a
	ld a, 4
	sub b
	ld b, a
	call UnknownCall_0xB264
	ld a, [$FF00+$DA]
	cp $10
	ret nc

UnknownJump_0x9D3D:
UnknownRJump_0x9D3D:
	ld a, [$FF00+$DF]
	xor $01
	ld [$FF00+$DF], a
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a
	ld a, [$FF00+$D5]
	ld [$A470], a
	ret
	call UnknownCall_0x9285
	ld a, [$AF3E]
	and a
	jr z, UnknownRJump_0x9D5B
	jp UnknownJump_0x9C3F

UnknownRJump_0x9D5B:
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x9D77
	call UnknownCall_0xB402
	ld a, [$AFC1]
	dec a
	ret nz
	xor a
	ld [$AF26], a
	ld a, [$FF00+$EC]
	inc a
	ld [$FF00+$EC], a
	cp $30
	ret nz
	jp UnknownJump_0x9C8B

UnknownRJump_0x9D77:
	dec a
	rst $28

UnknownData_0x9D79:
INCBIN "baserom.gb", $9D79, $9D83 - $9D79

	ld b, 1
	call UnknownCall_0xB264
	ld a, 8
	ld [$FF00+$EC], a
	jp UnknownJump_0x9CDF
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0x9DA2
	ld a, 40
	ld [$FF00+$DB], a
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 32
	ld [$FF00+$DB], a

UnknownRJump_0x9DA2:
	ld a, [$FF00+$D8]
	srl a
	ld b, a
	ld a, 4
	sub b
	ld b, a
	call UnknownCall_0xB264
	ld a, [$FF00+$DA]
	cp $10
	jr c, UnknownRJump_0x9D3D

UnknownRJump_0x9DB4:
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_0x9DC1
	call UnknownCall_0xB1EB
	call UnknownCall_0xB270
	jr UnknownRJump_0x9DC7

UnknownRJump_0x9DC1:
	call UnknownCall_0xB187
	call UnknownCall_0xB276

UnknownJump_0x9DC7:
UnknownRJump_0x9DC7:
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
	jr z, UnknownRJump_0x9DF2
	ld a, 40
	ld [$FF00+$DB], a
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 32
	ld [$FF00+$DB], a

UnknownRJump_0x9DF2:
	ld a, [$FF00+$D8]
	srl a
	ld b, a
	ld a, 4
	sub b
	ld b, a
	call UnknownCall_0xB26A
	ld a, [$FF00+$DA]
	cp $A0
	jp nc, UnknownJump_0x9D3D
	jr UnknownRJump_0x9DB4
	call UnknownCall_0x9285
	ld a, [$AF3E]
	and a
	jr z, UnknownRJump_0x9E32
	ld a, [$FF00+$DB]
	ld [$AF37], a
	ld a, [$FF00+$DF]
	ld [$AFC4], a
	ld a, [$FF00+$E2]
	ld [$AFCC], a
	ld a, [$AFC3]
	and a
	jp z, UnknownJump_0x9725
	ld a, 31
	ld [$FF00+$DB], a
	ld a, [$AFCD]
	ld [$FF00+$EC], a
	jp UnknownJump_0x9725

UnknownRJump_0x9E32:
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x9E5B
	call UnknownCall_0xB402
	ld a, [$AFC1]
	and a
	ret nz
	xor a
	ld [$AF26], a
	ld a, [$FF00+$EC]
	inc a
	ld [$FF00+$EC], a
	cp $30
	ret nz
	ld a, 13
	ld [$AF36], a
	ld a, 14
	ld [$AF37], a
	call UnknownCall_0xB224
	jp UnknownJump_0x9C8B

UnknownRJump_0x9E5B:
	dec a
	rst $28

UnknownData_0x9E5D:
INCBIN "baserom.gb", $9E5D, $9E67 - $9E5D

	ld a, 8
	ld [$FF00+$EC], a
	jp UnknownJump_0x9CDF
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0x9E81
	ld a, 40
	ld [$FF00+$DB], a
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 41
	ld [$FF00+$DB], a

UnknownRJump_0x9E81:
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$AFC5]
	srl a
	ld b, a
	ld a, 4
	sub b
	ld b, a
	call UnknownCall_0xB264
	ld a, [$FF00+$DA]
	cp $10
	jp c, UnknownJump_0x9D3D

UnknownRJump_0x9E9A:
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_0x9EAA
	call UnknownCall_0xB1EB
	inc b
	inc b
	call UnknownCall_0xB270
	jp UnknownJump_0x9DC7

UnknownRJump_0x9EAA:
	call UnknownCall_0xB187
	inc b
	inc b
	call UnknownCall_0xB276
	jp UnknownJump_0x9DC7
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0x9EC8
	ld a, 40
	ld [$FF00+$DB], a
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 41
	ld [$FF00+$DB], a

UnknownRJump_0x9EC8:
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$AFC5]
	srl a
	ld b, a
	ld a, 4
	sub b
	ld b, a
	call UnknownCall_0xB26A
	ld a, [$FF00+$DA]
	cp $A0
	jp nc, UnknownJump_0x9D3D
	jr UnknownRJump_0x9E9A
	ld a, [$AF26]
	cp $02
	ret nz
	ld a, 144
	ld [$FF00+$D9], a
	ld a, 88
	ld [$FF00+$DA], a
	jp UnknownJump_0x98F8
	call UnknownCall_0x9285
	ld a, [$AF3E]
	and a
	jr z, UnknownRJump_0x9F1E
	ld a, [$FF00+$DB]
	ld [$AF37], a
	ld a, [$FF00+$DF]
	ld [$AFC4], a
	ld a, [$FF00+$E2]
	ld [$AFCC], a
	ld a, [$AFC3]
	and a
	jp z, UnknownJump_0x9725
	ld a, 48
	ld [$FF00+$DB], a
	ld a, 104
	ld [$FF00+$EC], a
	jp UnknownJump_0x9725

UnknownRJump_0x9F1E:
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x9F36
	call UnknownCall_0xB14E
	ret nz
	ld a, 3
	ld [$FF00+$DF], a
	ld a, 69
	ld [$FF00+$E2], a
	ld a, 32
	ld [$FF00+$E8], a
	ld [$FF00+$E9], a
	ret

UnknownRJump_0x9F36:
	dec a
	rst $28

UnknownData_0x9F38:
INCBIN "baserom.gb", $9F38, $9F46 - $9F38

	ld b, 2
	call UnknownCall_0xB270
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
	call UnknownCall_0xB270
	ld a, [$FF00+$E8]
	sub b
	ld [$FF00+$E8], a
	ret nz
	ldh_a_n $04
	and $03
	jr nz, UnknownRJump_0x9FF2

UnknownJump_0x9F7C:
	ld a, 44
	ld [$FF00+$DB], a
	jr UnknownRJump_0x9FDF
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0x9F8F
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 44
	ld [$FF00+$DB], a

UnknownRJump_0x9F8F:
	call UnknownCall_0xB2FD
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld a, [$FF00+$DA]
	cp $A0
	jr nc, UnknownRJump_0x9FA4
	ld b, 1
	call UnknownCall_0xB26A
	jr UnknownRJump_0x9FD1

UnknownRJump_0x9FA4:
UnknownData_0x9FA4:
INCBIN "baserom.gb", $9FA4, $9FD1 - $9FA4


UnknownRJump_0x9FD1:
	inc b
	call UnknownCall_0xB276
	ld a, [$FF00+$E8]
	sub b
	ld [$FF00+$E8], a
	ret nz
	ld a, 46
	ld [$FF00+$DB], a

UnknownRJump_0x9FDF:
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

UnknownRJump_0x9FF2:
	ld a, [$AFCB]
	and a
	jr z, UnknownRJump_0xA004
	ld a, [$AD4F]
	and a
	jp nz, UnknownJump_0x9F7C
	ld hl, $AD49
	jr UnknownRJump_0xA00E

UnknownRJump_0xA004:
	ld a, [$AD2F]
	and a
	jp nz, UnknownJump_0x9F7C
	ld hl, $AD29

UnknownRJump_0xA00E:
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
	jr UnknownRJump_0x9FDF
	ld a, [$AF26]
	cp $02
	jr nz, UnknownRJump_0xA041
	ld a, [$AF29]
	cp $40
	ret nz
	ld a, 112
	ld [$FF00+$D9], a
	ld a, 88
	ld [$FF00+$DA], a
	jp UnknownJump_0x98F8

UnknownRJump_0xA041:
	call UnknownCall_0x9285
	ld a, [$AF3E]
	and a
	ret nz
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0xA05C
	ld a, [$FF00+$DB]
	cp $0E
	ret z
	ld a, 3
	ld [$FF00+$DF], a
	ld a, 69
	ld [$FF00+$E2], a
	ret

UnknownRJump_0xA05C:
	dec a
	rst $28

UnknownData_0xA05E:
INCBIN "baserom.gb", $A05E, $A064 - $A05E

	call UnknownCall_0xB1EB
	call UnknownCall_0xB276
	ld a, [$FF00+$E0]
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, 50
	ld [$FF00+$DB], a
	call UnknownCall_0xB27C
	ld a, 32
	ld [$FF00+$E9], a
	ret
	call UnknownCall_0xB2FD
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld b, 1
	call UnknownCall_0xB264
	jr UnknownRJump_0xA099

UnknownData_0xA08C:
INCBIN "baserom.gb", $A08C, $A099 - $A08C


UnknownRJump_0xA099:
	ld a, [$FF00+$DA]
	cp $B8
	jr nc, UnknownRJump_0xA0B1
	call UnknownCall_0xB2C2
	dec a
	jr z, UnknownRJump_0xA0AB
	ld b, 1
	call UnknownCall_0xB270
	ret

UnknownRJump_0xA0AB:
	ld b, 1
	call UnknownCall_0xB276
	ret

UnknownRJump_0xA0B1:
	ld a, 14
	ld [$FF00+$DB], a
	xor a
	ld [$FF00+$DF], a
	ret
	call UnknownCall_0x9285
	ld a, [$AF3E]
	and a
	jr z, UnknownRJump_0xA0E8
	ld a, [$FF00+$DB]
	ld [$AF37], a
	ld a, [$FF00+$DF]
	ld [$AFC4], a
	ld a, [$FF00+$E2]
	ld [$AFCC], a
	ld a, [$AFC3]
	and a
	jp z, UnknownJump_0x9725
	ld a, 53
	ld [$FF00+$DB], a
	xor a
	ld [$FF00+$E2], a
	ld a, 9
	ld [$FF00+$DF], a
	ld a, 1
	ld [$FF00+$EC], a
	ret

UnknownRJump_0xA0E8:
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0xA103
	call UnknownCall_0xB14E
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

UnknownRJump_0xA103:
	dec a
	rst $28

UnknownData_0xA105:
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
	call UnknownCall_0xB3C0
	jp UnknownJump_0x9443
	ld a, [$AFC7]
	and a
	jr z, UnknownRJump_0xA17D
	call UnknownCall_0xA1B3
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, [$AD2F]
	and a
	jr nz, UnknownRJump_0xA159
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

UnknownRJump_0xA159:
	ld a, [$AD4F]
	and a
	jr nz, UnknownRJump_0xA171
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

UnknownRJump_0xA171:
	ld a, [$AFC7]
	dec a
	ld [$AFC7], a
	ld a, 96
	ld [$FF00+$EC], a
	ret

UnknownRJump_0xA17D:
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
	jr z, UnknownRJump_0xA17D
	call UnknownCall_0xA1B3
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, [$AD2F]
	and a
	jr nz, UnknownRJump_0xA159
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
	jr UnknownRJump_0xA159

UnknownCall_0xA1B3:
	ld a, [$FF00+$E8]
	and a
	jr z, UnknownRJump_0xA1C0
	call UnknownCall_0xB183
	call UnknownCall_0xB270
	jr UnknownRJump_0xA1C6

UnknownRJump_0xA1C0:
	call UnknownCall_0xB1E4
	call UnknownCall_0xB276

UnknownRJump_0xA1C6:
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
	call UnknownCall_0xB276
	ld hl, $5595
	call UnknownCall_0xB16B
	call UnknownCall_0xB264
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
	call UnknownCall_0xB270
	ld hl, $5595
	call UnknownCall_0xB16B
	call UnknownCall_0xB264
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	cp $5D
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
	ldh_a_n $04
	and $03
	ld [$AFC7], a
	ret
	ld b, 1
	call UnknownCall_0xB276
	ld hl, $5595
	call UnknownCall_0xB16B
	call UnknownCall_0xB26A
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
	call UnknownCall_0xB270
	ld hl, $5595
	call UnknownCall_0xB16B
	call UnknownCall_0xB26A
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	cp $5D
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
	ldh_a_n $04
	and $03
	ld [$AFC7], a
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0xA295
	ld a, [$FF00+$DB]
	cp $0E
	ret z
	ld a, 64
	ld [$FF00+$E2], a
	call UnknownCall_0x3CB1
	ld a, 9
	ld [$A478], a
	ret

UnknownRJump_0xA295:
	dec a
	rst $28

UnknownData_0xA297:
INCBIN "baserom.gb", $A297, $A29B - $A297

	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld b, 3
	call UnknownCall_0xB264
	jr UnknownRJump_0xA2B1
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld b, 3
	call UnknownCall_0xB26A

UnknownRJump_0xA2B1:
	ld a, [$FF00+$DA]
	cp $B8
	ret c
	ld a, 14
	ld [$FF00+$DB], a
	xor a
	ld [$FF00+$DF], a
	ret
	ld a, [$AF26]
	cp $02
	jr nz, UnknownRJump_0xA2D0
	ld a, 128
	ld [$FF00+$D9], a
	ld a, 88
	ld [$FF00+$DA], a
	jp UnknownJump_0x98F8

UnknownRJump_0xA2D0:
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0xA2E3
	ld a, [$FF00+$DB]
	cp $0E
	ret z
	ld a, 3
	ld [$FF00+$DF], a
	ld a, 64
	ld [$FF00+$E2], a
	ret

UnknownRJump_0xA2E3:
	dec a
	rst $28

UnknownData_0xA2E5:
INCBIN "baserom.gb", $A2E5, $A2F1 - $A2E5

	call UnknownCall_0xB18F
	call UnknownCall_0xB276
	ld a, [$FF00+$D9]
	cp $80
	ret c
	call UnknownCall_0x3CB1
	ret
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld b, 3
	call UnknownCall_0xB264
	jr UnknownRJump_0xA316
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld b, 3
	call UnknownCall_0xB26A

UnknownRJump_0xA316:
	call UnknownCall_0xB2DB
	cp $10
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
	cp $3E
	ret nz
	ld a, 5
	ld [$FF00+$DF], a
	ld a, 48
	ld [$FF00+$E8], a
	ret
	call UnknownCall_0xB2FD
	ld b, 2
	call UnknownCall_0xB270
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
	cp $41
	jr z, UnknownRJump_0xA362
	inc a
	ld [$FF00+$DB], a
	ret

UnknownRJump_0xA362:
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
	call UnknownCall_0x9285
	ld a, [$AF3E]
	and a
	jr z, UnknownRJump_0xA39C
	ld a, [$FF00+$DB]
	ld [$AF37], a
	ld a, [$FF00+$DF]
	ld [$AFC4], a
	ld a, [$FF00+$E2]
	ld [$AFCC], a
	ld a, [$AFC3]
	and a
	jp z, UnknownJump_0x9725
	ld a, 74
	ld [$FF00+$DB], a
	ld a, 48
	ld [$FF00+$EC], a
	jp UnknownJump_0x9725

UnknownRJump_0xA39C:
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0xA3B6
	call UnknownCall_0xB14E
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

UnknownRJump_0xA3B6:
	ld a, [$FF00+$DF]
	cp $03
	call nc, UnknownCall_0xA3FF
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_0xA3C1:
INCBIN "baserom.gb", $A3C1, $A3FF - $A3C1


UnknownCall_0xA3FF:
	ld a, 16
	ld [$FF00+$DE], a
	call UnknownCall_0xB339
	ld a, [$FF00+$DC]
	and a
	ret nz
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, 7
	ld [$A478], a
	ldh_a_n $04
	and $3F
	ret nz
	ld a, 3
	ld [$A470], a
	ret
	call UnknownCall_0xB2FD
	call UnknownCall_0x9443
	ld a, 16
	ld [$FF00+$DE], a
	ret
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0xA434
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_0xA434:
	ld b, 2
	call UnknownCall_0xB264
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
	call UnknownCall_0xB16B
	ld a, b
	cp $80
	jr z, UnknownRJump_0xA465
	call UnknownCall_0xB276
	ld hl, $648C
	call UnknownCall_0xB16B
	call UnknownCall_0xB264
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	ret

UnknownRJump_0xA465:
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	ld a, 76
	ld [$FF00+$E9], a
	ret

UnknownData_0xA472:
INCBIN "baserom.gb", $A472, $A4A5 - $A472

	ld b, 2
	call UnknownCall_0xB264
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
	call UnknownCall_0xB16B
	ld a, b
	cp $80
	jr z, UnknownRJump_0xA4DD
	call UnknownCall_0xB270
	ld hl, $64F7
	call UnknownCall_0xB16B
	call UnknownCall_0xB264
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	ret

UnknownRJump_0xA4DD:
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	ld a, 28
	ld [$FF00+$E8], a
	ret

UnknownData_0xA4EA:
INCBIN "baserom.gb", $A4EA, $A504 - $A4EA

	ld b, 1
	call UnknownCall_0xB270
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
	call UnknownCall_0xB26A
	ld a, 128
	ld [$FF00+$DC], a
	ld b, 2
	call UnknownCall_0xB264
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
	jr z, UnknownRJump_0xA551
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_0xA551:
	ld b, 2
	call UnknownCall_0xB26A
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
	call UnknownCall_0xB16B
	ld a, b
	cp $80
	jr z, UnknownRJump_0xA582
	call UnknownCall_0xB276
	ld hl, $65A0
	call UnknownCall_0xB16B
	call UnknownCall_0xB26A
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	ret

UnknownRJump_0xA582:
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	ld a, 80
	ld [$FF00+$E9], a
	ret

UnknownData_0xA58F:
INCBIN "baserom.gb", $A58F, $A5B0 - $A58F

	ld b, 2
	call UnknownCall_0xB26A
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
	call UnknownCall_0xB16B
	ld a, b
	cp $80
	jr z, UnknownRJump_0xA5E9
	call UnknownCall_0xB270
	ld hl, $64F7
	call UnknownCall_0xB16B
	call UnknownCall_0xB26A
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	ret

UnknownRJump_0xA5E9:
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	ld a, 68
	ld [$FF00+$E8], a
	ret
	ld b, 1
	call UnknownCall_0xB270
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
	call UnknownCall_0xB16B
	ld a, b
	cp $80
	jr z, UnknownRJump_0xA62E
	call UnknownCall_0xB270
	ld hl, $64EA
	call UnknownCall_0xB16B
	call UnknownCall_0xB264
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	ret

UnknownRJump_0xA62E:
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	ld a, 28
	ld [$FF00+$E9], a
	ret
	ld b, 2
	call UnknownCall_0xB264
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
	call UnknownCall_0xB276
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
	call UnknownCall_0xB26A
	ld a, [$FF00+$E9]
	sub b
	ld [$FF00+$E9], a
	ret nz
	ld a, 18
	ld [$FF00+$DF], a
	ret
	ld hl, $66B7
	call UnknownCall_0xB16B
	ld a, b
	cp $80
	jr z, UnknownRJump_0xA6A6
	call UnknownCall_0xB270
	ld hl, $66C3
	call UnknownCall_0xB16B
	call UnknownCall_0xB26A
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	ret

UnknownRJump_0xA6A6:
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

UnknownData_0xA6B7:
INCBIN "baserom.gb", $A6B7, $A6CE - $A6B7

	ld b, 2
	call UnknownCall_0xB26A
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
	jr z, UnknownRJump_0xA6F2
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_0xA6F2:
	ld b, 2
	call UnknownCall_0xB264
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
	call UnknownCall_0xB16B
	ld a, b
	cp $80
	jr z, UnknownRJump_0xA723
	call UnknownCall_0xB276
	ld hl, $673C
	call UnknownCall_0xB16B
	call UnknownCall_0xB264
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	ret

UnknownRJump_0xA723:
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	ld a, 84
	ld [$FF00+$E9], a
	ret

UnknownData_0xA730:
INCBIN "baserom.gb", $A730, $A747 - $A730

	ld b, 2
	call UnknownCall_0xB264
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
	call UnknownCall_0xB16B
	ld a, b
	cp $80
	jr z, UnknownRJump_0xA780
	call UnknownCall_0xB270
	ld hl, $64F7
	call UnknownCall_0xB16B
	call UnknownCall_0xB264
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	ret

UnknownRJump_0xA780:
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	ld a, 68
	ld [$FF00+$E8], a
	ret
	ld b, 1
	call UnknownCall_0xB270
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
	call UnknownCall_0xB16B
	ld a, b
	cp $80
	jr z, UnknownRJump_0xA7C6
	call UnknownCall_0xB270
	ld hl, $64EA
	call UnknownCall_0xB16B
	call UnknownCall_0xB26A
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	ret

UnknownRJump_0xA7C6:
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	ld a, 28
	ld [$FF00+$E9], a
	ret
	ld b, 2
	call UnknownCall_0xB26A
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
	call UnknownCall_0xB276
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
	call UnknownCall_0xB26A
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
	call UnknownCall_0xB16B
	ld a, b
	cp $80
	jr z, UnknownRJump_0xA857
	call UnknownCall_0xB270
	ld hl, $64F7
	call UnknownCall_0xB16B
	call UnknownCall_0xB26A
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	ret

UnknownRJump_0xA857:
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	ld a, 60
	ld [$FF00+$E8], a
	ret
	ld b, 1
	call UnknownCall_0xB270
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
	call UnknownCall_0xB264
	ld a, 128
	ld [$FF00+$DC], a
	ret
	ld b, 2
	call UnknownCall_0xB26A
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
	call UnknownCall_0x9285
	ld a, [$AF3E]
	and a
	jr z, UnknownRJump_0xA8D6
	ld a, [$FF00+$DB]
	ld [$AF37], a
	ld a, [$FF00+$DF]
	ld [$AFC4], a
	ld a, [$FF00+$E2]
	ld [$AFCC], a
	ld a, [$AFC3]
	and a
	jp z, UnknownJump_0x9725
	ld a, 82
	ld [$FF00+$DB], a
	ld a, [$AFCD]
	ld [$FF00+$EC], a
	jp UnknownJump_0x9725

UnknownRJump_0xA8D6:
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0xA90A
	ld a, [$A266]
	cp $61
	call z, UnknownCall_0xA8FF
	ld a, [$AFCF]
	and a
	call nz, UnknownCall_0xB2EF
	call UnknownCall_0xB14E
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

UnknownCall_0xA8FF:
	ld a, 15
	ld [$A470], a
	ld a, 1
	ld [$AFCF], a
	ret

UnknownRJump_0xA90A:
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_0xA90E:
INCBIN "baserom.gb", $A90E, $A920 - $A90E

	call UnknownCall_0xB40E
	call UnknownCall_0xB18F
	call UnknownCall_0xB276
	ld a, [$FF00+$D9]
	cp $8A
	ret c
	ld a, 6
	ld [$FF00+$DF], a
	ld a, 128
	ld [$FF00+$EC], a
	ret
	call UnknownCall_0xB40E
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
	call UnknownCall_0xB321
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
	call UnknownCall_0xB40E
	call UnknownCall_0xB339
	ld b, 2
	call UnknownCall_0xB26A
	ld a, [$FF00+$DA]
	cp $C0
	ret c
	call UnknownCall_0xB15B
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
	jr nz, UnknownRJump_0xA9D4
	call UnknownCall_0xB1E4
	call UnknownCall_0xB270
	ld a, [$FF00+$E0]
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, 1
	ld [$FF00+$E8], a
	ret

UnknownRJump_0xA9D4:
	call UnknownCall_0xB17F
	call UnknownCall_0xB276
	ld a, [$FF00+$D9]
	cp $8A
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

UnknownRJump_0xA9FC:
	ld a, 5
	ld [$FF00+$DF], a
	ld a, 79
	ld [$FF00+$DB], a
	ret
	ld a, [sTimerLow]
	and $07
	jr z, UnknownRJump_0xA9FC
	call UnknownCall_0xB339
	ld b, 2
	ld a, [$FF00+$E9]
	and a
	jr nz, UnknownRJump_0xAA20
	call UnknownCall_0xB264
	ld a, [$FF00+$DA]
	cp $10
	ret nc
	jr UnknownRJump_0xAA28

UnknownRJump_0xAA20:
	call UnknownCall_0xB26A
	ld a, [$FF00+$DA]
	cp $98
	ret c

UnknownRJump_0xAA28:
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
	jr nz, UnknownRJump_0xAA46
	call UnknownCall_0xB1D6
	call UnknownCall_0xB270
	jr UnknownRJump_0xAA4C

UnknownRJump_0xAA46:
	call UnknownCall_0xB18F
	call UnknownCall_0xB276

UnknownRJump_0xAA4C:
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
	jr z, UnknownRJump_0xAA79
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_0xAA79:
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_0xAA86
	call UnknownCall_0xB1E4
	call UnknownCall_0xB270
	jr UnknownRJump_0xAA8C

UnknownRJump_0xAA86:
	call UnknownCall_0xB183
	call UnknownCall_0xB276

UnknownRJump_0xAA8C:
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

UnknownData_0xAAA8:
INCBIN "baserom.gb", $AAA8, $AAB0 - $AAA8

	ld a, 1
	ld [$FF00+$DF], a
	ret
	call UnknownCall_0xAACA
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

UnknownCall_0xAACA:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld b, 3
	ld a, [$FF00+$E9]
	and a
	jr nz, UnknownRJump_0xAADB
	call UnknownCall_0xB264
	jr UnknownRJump_0xAADE

UnknownRJump_0xAADB:
	call UnknownCall_0xB26A

UnknownRJump_0xAADE:
	ld a, [$FF00+$DA]
	cp $B0
	ret c
	ld a, [$FF00+$E9]
	xor $01
	ld [$FF00+$E9], a
	ret
	call UnknownCall_0xB40E
	call UnknownCall_0xB177
	call UnknownCall_0xB276
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
	cp $63
	ret nz
	ld a, 56
	ld [$FF00+$D9], a
	ld a, 96
	ld [$FF00+$DB], a
	xor a
	ld [$FF00+$E2], a
	ld [$FF00+$DF], a
	ld [$FF00+$E9], a
	ldh_a_n $04
	and $01
	jr z, UnknownRJump_0xAB29
	ld a, 167
	ld [$FF00+$DA], a
	ret

UnknownRJump_0xAB29:
	xor a
	ld [$FF00+$DA], a
	inc a
	ld [$FF00+$E9], a
	ret
	ld a, [$FF00+$DF]
	rst $28

UnknownData_0xAB33:
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
	call UnknownCall_0xB276
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
	call UnknownCall_0xB157
	ret
	ld a, [$FF00+$DF]
	rst $28

UnknownData_0xAB71:
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
	call UnknownCall_0x9285
	ld a, [$AF3E]
	and a
	jr z, UnknownRJump_0xABB6
	ld a, [$FF00+$DB]
	ld [$AF37], a
	ld a, [$FF00+$DF]
	ld [$AFC4], a
	ld a, [$FF00+$E2]
	ld [$AFCC], a
	ld a, [$AFC3]
	and a
	jp z, UnknownJump_0x9725
	ld a, 82
	ld [$FF00+$DB], a
	ld a, [$AFCD]
	ld [$FF00+$EC], a
	jp UnknownJump_0x9725

UnknownRJump_0xABB6:
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0xAC00
	ld a, 7
	ld [$FF00+$DF], a
	ld a, 32
	ld [$FF00+$EC], a
	ld a, 22
	ld [$AF36], a
	ld a, 14
	ld [$AF37], a
	call UnknownCall_0xB224
	ret
	ld a, [$A266]
	cp $61
	call z, UnknownCall_0xABF5
	ld a, [$AFCF]
	and a
	call nz, UnknownCall_0xB2EF
	call UnknownCall_0xB14E
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

UnknownCall_0xABF5:
	ld a, 1
	ld [$A470], a
	ld a, 1
	ld [$AFCF], a
	ret

UnknownRJump_0xAC00:
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_0xAC04:
INCBIN "baserom.gb", $AC04, $AC1A - $AC04

	ld a, 5
	ld [$A266], a
	call UnknownCall_0xB40E
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
	call UnknownCall_0xB315
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
	call UnknownCall_0xB339
	call UnknownCall_0xB40E
	ld b, 2
	call UnknownCall_0xB26A
	ld a, [$FF00+$DA]
	cp $C0
	ret c
	call UnknownCall_0xB15B
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
	ld a, [sEasyMode]
	and $01
	jr nz, UnknownRJump_0xACAC
	ld a, 27
	ld [hli], a
	ld [hl], 255
	ret

UnknownRJump_0xACAC:
	ld a, 29
	ld [hli], a
	ld [hl], 255
	ret
	call UnknownCall_0xB1C8
	call UnknownCall_0xB270
	ld a, [$FF00+$E0]
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	call UnknownCall_0xB27C
	ld a, [$FF00+$DF]
	add 3
	ld [$FF00+$DF], a
	ld a, 2
	ld [$A478], a
	ret
	call UnknownCall_0xB2EF
	ld b, 1
	call UnknownCall_0xB264
	ld a, [$FF00+$DA]
	cp $20
	jr c, UnknownRJump_0xACDE
	jr UnknownRJump_0xACFE

UnknownRJump_0xACDE:
	ld a, [$FF00+$DF]
	xor $01
	ld [$FF00+$DF], a
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a
	ld a, 2
	ld [$A478], a
	ret
	call UnknownCall_0xB2EF
	ld b, 1
	call UnknownCall_0xB26A
	ld a, [$FF00+$DA]
	cp $90
	jr nc, UnknownRJump_0xACDE

UnknownRJump_0xACFE:
	ld a, [$FF00+$F0]
	and $07
	ret nz
	call UnknownCall_0xB2DB
	cp $20
	jr nc, UnknownRJump_0xAD1E
	ld a, [sTimerLow]
	and $03
	jr nz, UnknownRJump_0xAD1E
	ld a, 10
	ld [$FF00+$DF], a
	ld a, 86
	ld [$FF00+$DB], a
	ld a, 32
	ld [$FF00+$EC], a
	ret

UnknownRJump_0xAD1E:
	ld b, 1
	call UnknownCall_0xB276
	ld a, [$FF00+$D9]
	cp $8A
	ret c

UnknownJump_0xAD28:
	ld a, 3
	ld [$FF00+$DF], a
	ld a, 86
	ld [$FF00+$DB], a
	ret
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0xAD3A
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_0xAD3A:
	call UnknownCall_0xB18F
	call UnknownCall_0xB276
	ld a, [$FF00+$D9]
	cp $8A
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
	jr z, UnknownRJump_0xAD69
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_0xAD69:
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_0xAD76
	call UnknownCall_0xB1E4
	call UnknownCall_0xB270
	jr UnknownRJump_0xAD7C

UnknownRJump_0xAD76:
	call UnknownCall_0xB183
	call UnknownCall_0xB276

UnknownRJump_0xAD7C:
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
	jp UnknownJump_0xAD28
	call UnknownCall_0x9285
	ld a, [$AF3E]
	and a
	jr z, UnknownRJump_0xADBE
	ld a, [$FF00+$DB]
	ld [$AF37], a
	ld a, [$FF00+$DF]
	ld [$AFC4], a
	ld a, [$FF00+$E2]
	ld [$AFCC], a
	ld a, [$AFC3]
	and a
	jp z, UnknownJump_0x9725
	ld a, 82
	ld [$FF00+$DB], a
	ld a, [$AFCD]
	ld [$FF00+$EC], a
	jp UnknownJump_0x9725

UnknownRJump_0xADBE:
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0xADF9
	ld a, 12
	ld [$FF00+$DF], a
	ld a, 32
	ld [$FF00+$EC], a
	ld a, 25
	ld [$AF36], a
	ld a, 14
	ld [$AF37], a
	call UnknownCall_0xB224
	ret
	ld a, [$A266]
	cp $61
	call z, UnknownCall_0xABF5
	ld a, [$AFCF]
	and a
	call nz, UnknownCall_0xB2EF
	call UnknownCall_0xB14E
	ret nz
	xor a
	ld [$AFCF], a
	ld a, 3
	ld [$FF00+$DF], a
	ld a, 65
	ld [$FF00+$E2], a
	ret

UnknownRJump_0xADF9:
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_0xADFD:
INCBIN "baserom.gb", $ADFD, $AE17 - $ADFD

	ld a, 1
	ld [$A2E3], a
	call UnknownCall_0xB32D
	call UnknownCall_0xB18F
	call UnknownCall_0xB276
	ld a, [$FF00+$D9]
	cp $8A
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
	call UnknownCall_0xB32D
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
	call UnknownCall_0xB2E8
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	jr z, UnknownRJump_0xAE6F
	cp $20
	ret nc
	ld a, 99
	ld [$FF00+$DB], a
	ret

UnknownRJump_0xAE6F:
	ld a, 48
	ld [$FF00+$EC], a
	call UnknownCall_0xB27C
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
	call UnknownCall_0xB224
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
	call UnknownCall_0xB35A
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0xAEBF
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_0xAEBF:
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld b, 3
	call UnknownCall_0xB26A
	ld a, [$FF00+$DA]
	cp $C0
	ret c
	call UnknownCall_0xB15B
	ld a, 3
	ld [$A2DC], a
	xor a
	ld [$A28B], a
	ret
	xor a
	ld [$FF00+$EA], a
	ld a, 92
	ld [$FF00+$DB], a
	call UnknownCall_0xB27C
	ld a, [$FF00+$DF]
	add 3
	ld [$FF00+$DF], a
	ld a, 27
	ld [$AF36], a
	ld a, 14
	ld [$AF37], a
	ld a, [$FF00+$DD]
	ld [$AF38], a
	call UnknownCall_0xB224
	ld a, 8
	ld [$A478], a
	ld a, 80
	ld [$FF00+$EC], a
	ret
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0xAF15
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 88
	ld [$FF00+$DB], a
	ret

UnknownRJump_0xAF15:
	call UnknownCall_0xB339
	ld b, 2
	call UnknownCall_0xB264
	ld a, [$FF00+$DA]
	cp $18
	jr c, UnknownRJump_0xAF25
	jr UnknownRJump_0xAF4E

UnknownRJump_0xAF25:
	ld a, [$FF00+$DF]
	xor $01
	ld [$FF00+$DF], a
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a
	ret
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0xAF40
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 88
	ld [$FF00+$DB], a
	ret

UnknownRJump_0xAF40:
	call UnknownCall_0xB339
	ld b, 2
	call UnknownCall_0xB26A
	ld a, [$FF00+$DA]
	cp $98
	jr nc, UnknownRJump_0xAF25

UnknownRJump_0xAF4E:
	call UnknownCall_0xB2DB
	cp $30
	jr c, UnknownRJump_0xAF66
	ld a, [sTimerLow]
	and $03
	ret nz
	ld a, [$AD2B]
	cp $0E
	ret nc
	ld a, 3
	ld [$FF00+$DF], a
	ret

UnknownRJump_0xAF66:
	ld a, [$FF00+$DF]
	add 2
	ld [$FF00+$DF], a
	ld a, 91
	ld [$FF00+$DB], a
	ld a, [sCurPowerup]
	sub 2
	ld [$AFD1], a
	ret
	ld b, 1
	call UnknownCall_0xB264
	ld a, [$FF00+$DA]
	cp $18
	jr c, UnknownRJump_0xAF25
	jr UnknownRJump_0xAF91
	ld b, 1
	call UnknownCall_0xB26A
	ld a, [$FF00+$DA]
	cp $98
	jr nc, UnknownRJump_0xAF25

UnknownRJump_0xAF91:
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_0xAFA9
	ld a, [$AFD1]
	and a
	jr z, UnknownRJump_0xAFA1
	call UnknownCall_0xB1EB
	jr UnknownRJump_0xAFA4

UnknownRJump_0xAFA1:
	call UnknownCall_0xB1CF

UnknownRJump_0xAFA4:
	call UnknownCall_0xB270
	jr UnknownRJump_0xAFBA

UnknownRJump_0xAFA9:
	ld a, [$AFD1]
	and a
	jr z, UnknownRJump_0xAFB4
	call UnknownCall_0xB187
	jr UnknownRJump_0xAFB7

UnknownRJump_0xAFB4:
	call UnknownCall_0xB17B

UnknownRJump_0xAFB7:
	call UnknownCall_0xB276

UnknownRJump_0xAFBA:
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
	cp $0E
	ret nc
	ld a, 3
	ld [$FF00+$DF], a
	ret
	call UnknownCall_0xB3B9
	ld a, [$FF00+$DF]
	rst $28

UnknownData_0xAFE6:
INCBIN "baserom.gb", $AFE6, $AFEC - $AFE6

	ld a, 64
	ld [$FF00+$E2], a
	call UnknownCall_0x3CB1
	ld a, 104
	ld [$FF00+$DB], a
	xor a
	ld [$FF00+$EA], a
	ld b, 16
	call UnknownCall_0xB270
	ret
	ld hl, $7039
	call UnknownCall_0xB16B
	ld a, b
	cp $80
	jr z, UnknownRJump_0xB010
	call UnknownCall_0xB264
	jr UnknownRJump_0xB023

UnknownRJump_0xB010:
	ld a, 58
	ld [$FF00+$E0], a
	ret
	ld hl, $7039
	call UnknownCall_0xB16B
	ld a, b
	cp $80
	jr z, UnknownRJump_0xB010
	call UnknownCall_0xB26A

UnknownRJump_0xB023:
	ld a, [$FF00+$DA]
	cp $B0
	jp nc, UnknownJump_0xB157
	ld hl, $707E
	call UnknownCall_0xB16B
	call UnknownCall_0xB276
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	ret

UnknownData_0xB039:
INCBIN "baserom.gb", $B039, $B0C2 - $B039

	ld a, [$FF00+$DF]
	rst $28

UnknownData_0xB0C5:
INCBIN "baserom.gb", $B0C5, $B0CF - $B0C5

	call UnknownCall_0x3CB1
	ret
	ld b, 2
	call UnknownCall_0xB264
	jr UnknownRJump_0xB0DF
	ld b, 2
	call UnknownCall_0xB26A

UnknownRJump_0xB0DF:
	call UnknownCall_0xB3C0
	ld a, [$FF00+$F0]
	and $03
	ret nz
	call UnknownCall_0xB2DB
	cp $08
	jr c, UnknownRJump_0xB10F
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_0xB0FB
	call UnknownCall_0xB1EB
	call UnknownCall_0xB270
	jr UnknownRJump_0xB101

UnknownRJump_0xB0FB:
UnknownData_0xB0FB:
INCBIN "baserom.gb", $B0FB, $B101 - $B0FB


UnknownRJump_0xB101:
	ld a, [$FF00+$E0]
	cp c
	ret nz

UnknownData_0xB105:
INCBIN "baserom.gb", $B105, $B10F - $B105


UnknownRJump_0xB10F:
	ld a, 3
	ld [$FF00+$DF], a
	xor a
	ld [$FF00+$E0], a
	ld [$FF00+$E8], a
	ld a, 6
	ld [$A460], a
	ret
	call UnknownCall_0xB3C0
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_0xB138
	call UnknownCall_0xB1E4
	call UnknownCall_0xB270
	ld a, [$FF00+$E0]
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, 1
	ld [$FF00+$E8], a
	ret

UnknownRJump_0xB138:
	ld a, [$FF00+$D9]
	cp $90
	jr nc, UnknownRJump_0xB145
	call UnknownCall_0xB18F
	call UnknownCall_0xB276
	ret

UnknownRJump_0xB145:
	ld a, 108
	ld [$FF00+$DB], a
	ld a, 4
	ld [$FF00+$DF], a
	ret

UnknownCall_0xB14E:
	ld a, [$A266]
	ld b, a
	ld a, [$A267]
	or b
	ret

UnknownJump_0xB157:
UnknownCall_0xB157:
	ld hl, $AFC1
	dec [hl]

UnknownCall_0xB15B:
	ld hl, $FFD0
	xor a
	ld b, 32

UnknownRJump_0xB161:
	ld [hli], a
	dec b
	jr nz, UnknownRJump_0xB161
	ld a, 1
	ld [$AF3E], a
	ret

UnknownCall_0xB16B:
	ld a, [$FF00+$E0]
	ld e, a
	ld d, 0
	add de
	ld b, [hl]
	ret

UnknownData_0xB173:
INCBIN "baserom.gb", $B173, $B177 - $B173


UnknownCall_0xB177:
	ld c, 36
	jr UnknownRJump_0xB191

UnknownCall_0xB17B:
	ld c, 27
	jr UnknownRJump_0xB191

UnknownCall_0xB17F:
	ld c, 24
	jr UnknownRJump_0xB191

UnknownCall_0xB183:
	ld c, 12
	jr UnknownRJump_0xB191

UnknownCall_0xB187:
	ld c, 15
	jr UnknownRJump_0xB191

UnknownData_0xB18B:
INCBIN "baserom.gb", $B18B, $B18F - $B18B


UnknownCall_0xB18F:
	ld c, 21

UnknownRJump_0xB191:
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

UnknownData_0xB1A3:
INCBIN "baserom.gb", $B1A3, $B1C8 - $B1A3


UnknownCall_0xB1C8:
	ld c, 36
	ld hl, $71FF
	jr UnknownRJump_0xB1F0

UnknownCall_0xB1CF:
	ld c, 27
	ld hl, $7208
	jr UnknownRJump_0xB1F0

UnknownCall_0xB1D6:
	ld c, 21
	ld hl, $720E
	jr UnknownRJump_0xB1F0

UnknownData_0xB1DD:
INCBIN "baserom.gb", $B1DD, $B1E4 - $B1DD


UnknownCall_0xB1E4:
	ld c, 12
	ld hl, $7217
	jr UnknownRJump_0xB1F0

UnknownCall_0xB1EB:
	ld c, 15
	ld hl, $7214

UnknownRJump_0xB1F0:
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

UnknownData_0xB1FF:
INCBIN "baserom.gb", $B1FF, $B224 - $B1FF


UnknownCall_0xB224:
	ld a, [$AFC1]
	inc a
	cp $10
	jr z, UnknownRJump_0xB259
	ld hl, $AD05
	ld de, $0020

UnknownRJump_0xB232:
	add de
	dec a
	jr nz, UnknownRJump_0xB232
	ld d, h
	ld e, l
	ld a, [$AF36]
	ld [de], a
	inc e
	ld hl, $FFD6
	ld b, 5
	call UnknownCall_0x3CAA
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

UnknownRJump_0xB259:
	xor a
	ld [$AF36], a
	ld [$AF37], a
	ld [$AF38], a
	ret

UnknownCall_0xB264:
	ld a, [$FF00+$DA]
	sub b
	ld [$FF00+$DA], a
	ret

UnknownCall_0xB26A:
	ld a, [$FF00+$DA]
	add b
	ld [$FF00+$DA], a
	ret

UnknownCall_0xB270:
	ld a, [$FF00+$D9]
	sub b
	ld [$FF00+$D9], a
	ret

UnknownCall_0xB276:
	ld a, [$FF00+$D9]
	add b
	ld [$FF00+$D9], a
	ret

UnknownCall_0xB27C:
	call UnknownCall_0xB296
	ld a, [$AF2C]
	dec a
	jr z, UnknownRJump_0xB28D
	ld a, 1
	ld [$FF00+$DF], a
	xor a
	ld [$FF00+$DD], a
	ret

UnknownRJump_0xB28D:
	ld a, 2
	ld [$FF00+$DF], a
	ld a, 32
	ld [$FF00+$DD], a
	ret

UnknownCall_0xB296:
	xor a
	ld [$AF2C], a
	ld a, [$FF00+$DA]
	ld b, a
	ld a, [sMarioScreenX]
	cp b
	jr c, UnknownRJump_0xB2A9
	ld a, 1
	ld [$AF2C], a
	ret

UnknownRJump_0xB2A9:
	ld a, 255
	ld [$AF2C], a
	ret

UnknownData_0xB2AF:
INCBIN "baserom.gb", $B2AF, $B2C2 - $B2AF


UnknownCall_0xB2C2:
	xor a
	ld [$AF2C], a
	ld a, [$FF00+$D9]
	ld b, a
	ld a, [sMarioScreenY]
	cp b
	jr c, UnknownRJump_0xB2D5
	ld a, 1
	ld [$AF2C], a
	ret

UnknownRJump_0xB2D5:
	ld a, 255
	ld [$AF2C], a
	ret

UnknownCall_0xB2DB:
	ld hl, $FFDA
	ld a, [sMarioScreenX]
	sub [hl]
	bit 7, a
	ret z
	cpl
	inc a
	ret

UnknownCall_0xB2E8:
	ld a, [$FF00+$F0]
	and $0F
	ret nz
	jr UnknownRJump_0xB302

UnknownCall_0xB2EF:
	ld a, [$FF00+$F0]
	and $07
	ret nz
	jr UnknownRJump_0xB302

UnknownCall_0xB2F6:
	ld a, [$FF00+$F0]
	and $01
	ret nz
	jr UnknownRJump_0xB302

UnknownCall_0xB2FD:
	ld a, [$FF00+$F0]
	and $03
	ret nz

UnknownRJump_0xB302:
	ld a, [$FF00+$DB]
	xor $01
	ld [$FF00+$DB], a
	ret

UnknownCall_0xB309:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld a, [$FF00+$DB]
	xor $06
	ld [$FF00+$DB], a
	ret

UnknownCall_0xB315:
	ld a, [$FF00+$F0]
	and $07
	ret nz
	ld a, [$FF00+$DB]
	xor $0B
	ld [$FF00+$DB], a
	ret

UnknownCall_0xB321:
	ld a, [$FF00+$F0]
	and $07
	ret nz
	ld a, [$FF00+$DB]
	xor $1F
	ld [$FF00+$DB], a
	ret

UnknownCall_0xB32D:
	ld a, [$FF00+$F0]
	and $07
	ret nz
	ld a, [$FF00+$DB]
	xor $31
	ld [$FF00+$DB], a
	ret

UnknownCall_0xB339:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld hl, $FFEA
	inc [hl]
	ld a, [hl]
	cp $04
	jr nz, UnknownRJump_0xB349
	xor a
	ld [hl], a

UnknownRJump_0xB349:
	ld hl, $7356
	ld e, a
	ld d, 0
	add de
	ld a, [$FF00+$DB]
	add [hl]
	ld [$FF00+$DB], a
	ret

UnknownData_0xB356:
INCBIN "baserom.gb", $B356, $B35A - $B356


UnknownCall_0xB35A:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld hl, $FFEA
	inc [hl]
	ld a, [hl]
	cp $04
	jr nz, UnknownRJump_0xB370
	xor a
	ld [hl], a
	ld a, [$FF00+$DD]
	res 5, a
	ld [$FF00+$DD], a

UnknownRJump_0xB370:
	ld hl, $7388
	ld e, a
	ld d, 0
	add de
	ld a, [$FF00+$DB]
	add [hl]
	ld [$FF00+$DB], a
	ld a, [$FF00+$EA]
	cp $03
	ret nz
	ld a, [$FF00+$DD]
	set 5, a
	ld [$FF00+$DD], a
	ret

UnknownData_0xB388:
INCBIN "baserom.gb", $B388, $B38C - $B388


UnknownCall_0xB38C:
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld hl, $FFEA
	inc [hl]
	ld a, [hl]
	ld e, a
	cp $03
	jr z, UnknownRJump_0xB3A2
	cp $05
	jr nz, UnknownRJump_0xB3A8
	xor a
	ld [hl], a
	ld e, a

UnknownRJump_0xB3A2:
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a

UnknownRJump_0xB3A8:
	ld hl, $73B4
	ld d, 0
	add de
	ld a, [$FF00+$DB]
	add [hl]
	ld [$FF00+$DB], a
	ret

UnknownData_0xB3B4:
INCBIN "baserom.gb", $B3B4, $B3B9 - $B3B4


UnknownCall_0xB3B9:
	ld a, [$FF00+$F0]
	and $01
	ret nz
	jr UnknownRJump_0xB3C5

UnknownCall_0xB3C0:
	ld a, [$FF00+$F0]
	and $03
	ret nz

UnknownRJump_0xB3C5:
	ld hl, $FFEA
	inc [hl]
	ld a, [hl]
	cp $04
	jr nz, UnknownRJump_0xB3EE
	xor a
	ld [hl], a
	ld a, [$FF00+$DB]
	sub 3
	ld [$FF00+$DB], a
	ret

UnknownCall_0xB3D7:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld hl, $FFEA
	inc [hl]
	ld a, [hl]
	cp $08
	jr nz, UnknownRJump_0xB3EE
	xor a
	ld [hl], a
	ld a, [$FF00+$DB]
	sub 7
	ld [$FF00+$DB], a
	ret

UnknownRJump_0xB3EE:
	ld a, [$FF00+$DB]
	inc a
	ld [$FF00+$DB], a
	ret

UnknownCall_0xB3F4:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	jr UnknownRJump_0xB407

UnknownData_0xB3FB:
INCBIN "baserom.gb", $B3FB, $B402 - $B3FB


UnknownCall_0xB402:
	ld a, [$FF00+$F0]
	and $0F
	ret nz

UnknownRJump_0xB407:
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a
	ret

UnknownCall_0xB40E:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld a, [$FF00+$DE]
	xor $10
	ld [$FF00+$DE], a
	ret

UnknownData_0xB41A:
INCBIN "baserom.gb", $B41A, $C000 - $B41A



SECTION "bank03", ROMX, BANK[$03]


UnknownCall_0xC000:
	ld a, [$FF00+$D8]
	cp $02
	ret nz
	call UnknownCall_0xC090
	ld hl, $4F11
	ld a, [$AF06]
	and a
	jr nz, UnknownRJump_0xC014
	ld hl, $40B1

UnknownRJump_0xC014:
	ld a, [$AF3E]
	and a
	ret nz
	ld a, [$FF00+$E2]
	cp $80
	ret z
	ld a, [$FF00+$D9]
	cp $B8
	ret nc
	ld a, [$FF00+$DA]
	cp $B8
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
	ldh_a_n $8D
	ld l, a
	ld a, [$FF00+$D9]
	ld b, a
	ld a, [$FF00+$DA]
	ld c, a

UnknownRJump_0xC042:
	ld a, [de]
	cp $80
	ret z
	ld a, [$AF2B]
	bit 6, a
	jr z, UnknownRJump_0xC053
	ld a, [de]
	cpl
	sub 7
	jr UnknownRJump_0xC054

UnknownRJump_0xC053:
	ld a, [de]

UnknownRJump_0xC054:
	add b
	cp $A0
	jr nc, UnknownRJump_0xC068
	ld [hli], a
	inc de
	ld a, [$AF2B]
	bit 5, a
	jr z, UnknownRJump_0xC076
	ld a, [de]
	cpl
	sub 7
	jr UnknownRJump_0xC077

UnknownRJump_0xC068:
	inc de
	inc de
	inc de
	inc de
	jr UnknownRJump_0xC042

UnknownRJump_0xC06E:
	dec l
	ld [hl], 0
	inc de
	inc de
	inc de
	jr UnknownRJump_0xC042

UnknownRJump_0xC076:
	ld a, [de]

UnknownRJump_0xC077:
	add c
	cp $A8
	jr nc, UnknownRJump_0xC06E
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
	ldh_n_a $8D
	inc de
	jr UnknownRJump_0xC042

UnknownCall_0xC090:
	ld a, [sScrollY]
	ld b, a
	ld a, [$FF00+$D4]
	add 16
	sub b
	ld [$FF00+$D9], a
	ld a, [sScrollX]
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

UnknownData_0xC0B1:
INCBIN "baserom.gb", $C0B1, $EBB6 - $C0B1


UnknownRJump_0xEBB6:
	ld a, 255
	ld [hli], a
	ld [hl], a
	ret

UnknownCall_0xEBBB:
	call UnknownCall_0xEC40
	call UnknownCall_0xEC17
	call UnknownCall_0xEC31
	call UnknownCall_0xEC4B
	ld a, [sCurLevel]
	add a
	ld e, a
	ld d, 0
	ld hl, $6037
	add de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld hl, $AB06

UnknownRJump_0xEBD8:
	ld a, [de]
	cp $FF
	jr z, UnknownRJump_0xEBB6
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
	bit 2, a
	jr z, UnknownRJump_0xEC0B
	set 6, a
	res 2, a

UnknownRJump_0xEC0B:
	ld b, a
	ld a, c
	rrca
	swap a
	and $07
	add b
	ld [hli], a
	inc de
	jr UnknownRJump_0xEBD8

UnknownCall_0xEC17:
	ld hl, $AB00
	ld bc, $0200
	xor a

UnknownRJump_0xEC1E:
	ld [hli], a
	dec c
	jr nz, UnknownRJump_0xEC1E
	dec b
	jr nz, UnknownRJump_0xEC1E
	ld hl, $AB00
	ld a, 255
	ld b, 6

UnknownRJump_0xEC2C:
	ld [hli], a
	dec b
	jr nz, UnknownRJump_0xEC2C
	ret

UnknownCall_0xEC31:
	ld hl, $AD00
	ld bc, $0200
	xor a

UnknownRJump_0xEC38:
	ld [hli], a
	dec c
	jr nz, UnknownRJump_0xEC38
	dec b
	jr nz, UnknownRJump_0xEC38
	ret

UnknownCall_0xEC40:
	ld hl, $AF00
	ld b, 0
	xor a

UnknownRJump_0xEC46:
	ld [hli], a
	dec b
	jr nz, UnknownRJump_0xEC46
	ret

UnknownCall_0xEC4B:
	ld a, 171
	ld [$AF1E], a
	ld a, 6
	ld [$AF1F], a
	ld a, [sCurLevel]
	cp $0A
	ret c
	ld a, 1
	ld [$AF06], a
	ret

UnknownData_0xEC61:
INCBIN "baserom.gb", $EC61, $FFA0 - $EC61


UnknownCall_0xFFA0:
UnknownData_0xFFA0:
INCBIN "baserom.gb", $FFA0, $10000 - $FFA0



SECTION "bank04", ROMX, BANK[$04]


UnknownCall_0x10000:
	ld hl, $A400

UnknownRJump_0x10003:
	ld [hl], 0
	inc l
	jr nz, UnknownRJump_0x10003
	ld hl, $A500

UnknownRJump_0x1000B:
	ld [hl], 0
	inc l
	jr nz, UnknownRJump_0x1000B
	ld a, 128
	ld [$FF00+$26], a
	ld a, 119
	ld [$FF00+$24], a
	ld a, 255
	ld [$FF00+$25], a
	ret

UnknownData_0x1001D:
INCBIN "baserom.gb", $1001D, $1002D - $1001D


UnknownCall_0x1002D:
	jp UnknownJump_0x13F5E

_UpdateSound: ;$10030
	ld a, [$A45E]
	cp $01
	jp z, UnknownJump_0x118F7
	cp $02
	jp z, UnknownJump_0x11926
	ld a, [$A45D]
	and a
	jp nz, UnknownJump_0x11936

UnknownJump_0x10044:
	ld hl, $A468
	ld a, [hli]
	and a
	jr nz, UnknownRJump_0x10078
	ld a, [$A53F]
	and a
	jr z, UnknownRJump_0x10057
	ld a, 51
	ld [$FF00+$24], a
	jr UnknownRJump_0x1005B

UnknownRJump_0x10057:
	ld a, 119
	ld [$FF00+$24], a

UnknownRJump_0x1005B:
	call UnknownCall_0x100DE
	call UnknownCall_0x106D3
	call UnknownCall_0x10E90

UnknownRJump_0x10064:
	call UnknownCall_0x11638

UnknownJump_0x10067:
	xor a
	ld [$A460], a
	ld [$A468], a
	ld [$A470], a
	ld [$A478], a
	ld [$A45E], a
	ret

UnknownRJump_0x10078:
	ld [hl], a
	call UnknownCall_0x112E0
	jr UnknownRJump_0x10064

UnknownData_0x1007E:
INCBIN "baserom.gb", $1007E, $100DE - $1007E


UnknownCall_0x100DE:
	ld hl, $A460
	ld a, [hl]
	and a
	jr z, UnknownRJump_0x10116
	cp $09
	jr z, UnknownRJump_0x10110
	cp $0C
	jr z, UnknownRJump_0x10110
	cp $0F
	jr z, UnknownRJump_0x10110
	cp $10
	jr z, UnknownRJump_0x10110
	cp $11
	jr z, UnknownRJump_0x10110
	cp $13
	jr z, UnknownRJump_0x10110
	cp $14
	jr z, UnknownRJump_0x10110
	cp $17
	jr z, UnknownRJump_0x10110
	ld a, [$A520]
	and a
	jr nz, UnknownRJump_0x10110
	ld a, [$A536]
	and a
	ret nz

UnknownRJump_0x10110:
	ld a, [hl]
	ld hl, $407E
	jr UnknownRJump_0x1011D

UnknownRJump_0x10116:
	inc hl
	ld a, [hl]
	and a
	ret z
	ld hl, $40AE

UnknownRJump_0x1011D:
	call UnknownCall_0x111A6
	ld de, $A500
	ld bc, $A504
	jp [hl]
	ld hl, $4134
	jp UnknownJump_0x1068A
	call UnknownCall_0x111B3
	ret nz
	jp UnknownJump_0x106A8

UnknownData_0x10134:
INCBIN "baserom.gb", $10134, $1013A - $10134

	ld hl, $4152
	jp UnknownJump_0x1068A
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $02
	jp z, UnknownJump_0x106A8
	ld hl, $4158
	jp UnknownJump_0x111BB

UnknownData_0x10152:
INCBIN "baserom.gb", $10152, $1015E - $10152

	ld a, [$A461]
	cp $03
	ret z
	ld hl, $417C
	jp UnknownJump_0x1068A
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $02
	jp z, UnknownJump_0x106A8
	ld hl, $4182
	jp UnknownJump_0x111BB

UnknownData_0x1017C:
INCBIN "baserom.gb", $1017C, $10188 - $1017C

	ld a, 5
	ld [$A52D], a
	ld hl, $41A3
	jp UnknownJump_0x1068A
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111DC
	jp z, UnknownJump_0x106A8
	ld hl, $41A3
	jp UnknownJump_0x111BB

UnknownData_0x101A3:
INCBIN "baserom.gb", $101A3, $101A9 - $101A3

	ld a, 2
	ld [$A52D], a
	ld hl, $46C6
	jp UnknownJump_0x10685
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $05
	jr z, UnknownRJump_0x101C8

UnknownRJump_0x101BF:
	ld hl, $41D3
	call UnknownCall_0x111A6
	jp UnknownJump_0x111BB

UnknownRJump_0x101C8:
	call UnknownCall_0x111DC
	jp z, UnknownJump_0x106A8
	ld a, 1
	ld [bc], a
	jr UnknownRJump_0x101BF

UnknownData_0x101D3:
INCBIN "baserom.gb", $101D3, $101F3 - $101D3

	ld hl, $420B
	jp UnknownJump_0x1068A
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $02
	jp z, UnknownJump_0x106A8
	ld hl, $4211
	jp UnknownJump_0x111BB

UnknownData_0x1020B:
INCBIN "baserom.gb", $1020B, $10217 - $1020B

	ld hl, $422F
	jp UnknownJump_0x1068A
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $02
	jp z, UnknownJump_0x106A8
	ld hl, $4235
	jp UnknownJump_0x106CC

UnknownData_0x1022F:
INCBIN "baserom.gb", $1022F, $10238 - $1022F

	ld hl, $4259
	jp UnknownJump_0x10685
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $04
	jp z, UnknownJump_0x106A8
	ld hl, $4253
	call UnknownCall_0x111A6
	jp UnknownJump_0x111BB

UnknownData_0x10253:
INCBIN "baserom.gb", $10253, $10271 - $10253

	ld a, 3
	ld [$A52D], a
	ld hl, $42AA
	call UnknownCall_0x111F9
	jp UnknownJump_0x10685
	call UnknownCall_0x111B3
	ret nz
	ld a, 5
	ld [de], a
	call UnknownCall_0x111B7
	cp $07
	jr z, UnknownRJump_0x10293

UnknownRJump_0x1028D:
	ld hl, $429E
	jp UnknownJump_0x11214

UnknownRJump_0x10293:
	call UnknownCall_0x111DC
	jp z, UnknownJump_0x106A8
	ld a, 1
	ld [bc], a
	jr UnknownRJump_0x1028D

UnknownData_0x1029E:
INCBIN "baserom.gb", $1029E, $102B2 - $1029E

	ld hl, $42D3
	jp UnknownJump_0x1068A
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $04
	jp z, UnknownJump_0x106A2
	ld hl, $42CD
	call UnknownCall_0x111A6
	jp UnknownJump_0x106CC

UnknownData_0x102CD:
INCBIN "baserom.gb", $102CD, $102E2 - $102CD

	call UnknownCall_0x13F5E
	ld a, 6
	ld [$A52D], a
	ld hl, $4343
	jp UnknownJump_0x10685
	call UnknownCall_0x111B3
	ret nz
	ld a, [$A535]
	inc a
	ld [$A535], a
	cp $03
	jr z, UnknownRJump_0x10321

UnknownRJump_0x102FF:
	ld hl, $433F
	call UnknownCall_0x111A6
	ld a, [$A535]
	cp $01
	jr z, UnknownRJump_0x1032E
	call UnknownCall_0x111BB

UnknownRJump_0x1030F:
	ld bc, $A504
	call UnknownCall_0x111B7
	dec a
	ld c, a
	ld b, 0
	ld hl, $4333
	add bc
	ld a, [hl]
	jp UnknownJump_0x111DA

UnknownRJump_0x10321:
	call UnknownCall_0x111DC
	jp z, UnknownJump_0x106A8
	ld a, 1
	ld [$A535], a
	jr UnknownRJump_0x102FF

UnknownRJump_0x1032E:
	call UnknownCall_0x111C1
	jr UnknownRJump_0x1030F

UnknownData_0x10333:
INCBIN "baserom.gb", $10333, $1034E - $10333

	ld a, 12
	ld [$A52D], a
	ld hl, $4388
	call UnknownCall_0x111F9
	jp UnknownJump_0x10685
	call UnknownCall_0x111B7
	cp $0B
	jr z, UnknownRJump_0x10369

UnknownRJump_0x10363:
	ld hl, $4374
	jp UnknownJump_0x11214

UnknownRJump_0x10369:
	call UnknownCall_0x111DC
	jp z, UnknownJump_0x106A8
	ld a, 1
	ld [bc], a
	jr UnknownRJump_0x10363

UnknownData_0x10374:
INCBIN "baserom.gb", $10374, $1038E - $10374

	ld a, 4
	ld [$A52D], a
	ld hl, $43CA
	jp UnknownJump_0x1068A
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $02
	jr z, UnknownRJump_0x103B2
	cp $06
	jp z, UnknownJump_0x106A8

UnknownJump_0x103A9:
	ld hl, $43C0
	call UnknownCall_0x111A6
	jp UnknownJump_0x111BB

UnknownRJump_0x103B2:
	call UnknownCall_0x111DC
	ld a, 2
	jp z, UnknownJump_0x103A9
	ld a, 1
	ld [bc], a
	jp UnknownJump_0x103A9

UnknownData_0x103C0:
INCBIN "baserom.gb", $103C0, $103DC - $103C0

	call UnknownCall_0x13F5E
	ld hl, $4402
	jp UnknownJump_0x10680
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $05
	jp z, UnknownJump_0x106A8
	ld hl, $43FA
	call UnknownCall_0x111A6
	jp UnknownJump_0x111BB

UnknownData_0x103FA:
INCBIN "baserom.gb", $103FA, $10408 - $103FA

	ld a, [$A279]
	and a
	ret z
	cp $05
	ret nc
	ld hl, $4431
	call UnknownCall_0x111A6
	jp UnknownJump_0x10680
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $02
	jp z, UnknownJump_0x106A8
	ld a, [$A279]
	ld hl, $4439
	call UnknownCall_0x111A6
	jp UnknownJump_0x106CC

UnknownData_0x10431:
INCBIN "baserom.gb", $10431, $10465 - $10431

	call UnknownCall_0x13F5E
	jp UnknownJump_0x1049C
	ld hl, $448A
	jp UnknownJump_0x1068A
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $03
	jp z, UnknownJump_0x106A8
	ld hl, $4486
	call UnknownCall_0x111A6
	jp UnknownJump_0x111BB

UnknownData_0x10486:
INCBIN "baserom.gb", $10486, $1049C - $10486


UnknownJump_0x1049C:
	ld a, 10
	ld [$A52D], a
	ld hl, $44D2
	call UnknownCall_0x111F9
	jp UnknownJump_0x10685
	call UnknownCall_0x111B7
	cp $09
	jr z, UnknownRJump_0x104B7

UnknownRJump_0x104B1:
	ld hl, $44C2
	jp UnknownJump_0x11214

UnknownRJump_0x104B7:
	call UnknownCall_0x111DC
	jp z, UnknownJump_0x106A8
	ld a, 1
	ld [bc], a
	jr UnknownRJump_0x104B1

UnknownData_0x104C2:
INCBIN "baserom.gb", $104C2, $104D8 - $104C2

	ld hl, $4542
	jp UnknownJump_0x10685
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $18
	jp z, UnknownJump_0x106A8
	cp $10
	jr nc, UnknownRJump_0x1050E
	cp $08
	jr nc, UnknownRJump_0x10508
	ld a, 160
	ld [$FF00+$12], a

UnknownRJump_0x104F6:
	ld a, 47
	ld [$FF00+$10], a
	ld a, 187
	ld [$FF00+$11], a
	ld a, [bc]
	ld hl, $4514
	call UnknownCall_0x111A6
	jp UnknownJump_0x106CC

UnknownRJump_0x10508:
	ld a, 64
	ld [$FF00+$12], a
	jr UnknownRJump_0x104F6

UnknownRJump_0x1050E:
	ld a, 32
	ld [$FF00+$12], a
	jr UnknownRJump_0x104F6

UnknownData_0x10514:
INCBIN "baserom.gb", $10514, $10560 - $10514

	ld a, 4
	ld [$A52D], a
	ld hl, $4595
	call UnknownCall_0x111F9
	jp UnknownJump_0x10685
	call UnknownCall_0x111B3
	ret nz
	ld a, 4
	ld [de], a
	call UnknownCall_0x111B7
	cp $05
	jr z, UnknownRJump_0x10582

UnknownRJump_0x1057C:
	ld hl, $458D
	jp UnknownJump_0x11214

UnknownRJump_0x10582:
	call UnknownCall_0x111DC
	jp z, UnknownJump_0x106A8
	ld a, 1
	ld [bc], a
	jr UnknownRJump_0x1057C

UnknownData_0x1058D:
INCBIN "baserom.gb", $1058D, $1059B - $1058D

	ld hl, $45DC
	jp UnknownJump_0x1068A
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $09
	jp z, UnknownJump_0x106A2
	ld hl, $45CC
	call UnknownCall_0x111A6
	ld a, [$A504]
	cp $08
	jp z, UnknownJump_0x111BB
	and $01
	jr z, UnknownRJump_0x105C6
	ld a, 48
	ld [$FF00+$12], a

UnknownRJump_0x105C3:
	jp UnknownJump_0x106CC

UnknownRJump_0x105C6:
	ld a, 176
	ld [$FF00+$12], a
	jr UnknownRJump_0x105C3

UnknownData_0x105CC:
INCBIN "baserom.gb", $105CC, $105F1 - $105CC

	ld a, 4
	ld [$A52D], a
	ld hl, $4626
	call UnknownCall_0x111F9
	jp UnknownJump_0x10685
	call UnknownCall_0x111B3
	ret nz
	ld a, 4
	ld [de], a
	call UnknownCall_0x111B7
	cp $05
	jr z, UnknownRJump_0x10613

UnknownRJump_0x1060D:
	ld hl, $461E
	jp UnknownJump_0x11214

UnknownRJump_0x10613:
	call UnknownCall_0x111DC
	jp z, UnknownJump_0x106A8
	ld a, 1
	ld [bc], a
	jr UnknownRJump_0x1060D

UnknownData_0x1061E:
INCBIN "baserom.gb", $1061E, $1062C - $1061E

	ld a, 8
	ld [$A52D], a
	ld hl, $467A
	call UnknownCall_0x111F9
	jp UnknownJump_0x10685
	call UnknownCall_0x111B7
	cp $15
	jr z, UnknownRJump_0x10647

UnknownRJump_0x10641:
	ld hl, $4652
	jp UnknownJump_0x11214

UnknownRJump_0x10647:
	call UnknownCall_0x111DC
	jp z, UnknownJump_0x106A8
	ld a, 9
	ld [bc], a
	jr UnknownRJump_0x10641

UnknownData_0x10652:
INCBIN "baserom.gb", $10652, $10680 - $10652


UnknownJump_0x10680:
	ld a, 1
	ld [$A520], a

UnknownJump_0x10685:
	ld a, 1
	ld [$A536], a

UnknownJump_0x1068A:
	ld a, [$A460]
	ld [$A461], a
	xor a
	ld [$A500], a
	ld [$A504], a
	ld a, [$A41F]
	set 7, a
	ld [$A41F], a
	jp UnknownJump_0x111BB

UnknownJump_0x106A2:
	ld hl, $46C6
	call UnknownCall_0x111BB

UnknownJump_0x106A8:
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

UnknownData_0x106C6:
INCBIN "baserom.gb", $106C6, $106CC - $106C6


UnknownJump_0x106CC:
	ld b, 2
	ld c, 19
	jp UnknownJump_0x111D3

UnknownCall_0x106D3:
	ld hl, $A470
	ld a, [hl]
	and a
	jr z, UnknownRJump_0x106E9
	cp $14
	jr z, UnknownRJump_0x106E3
	ld a, [$A538]
	and a
	ret nz

UnknownRJump_0x106E3:
	ld a, [hl]
	ld hl, $46FA
	jr UnknownRJump_0x106F0

UnknownRJump_0x106E9:
	inc hl
	ld a, [hl]
	and a
	ret z
	ld hl, $472A

UnknownRJump_0x106F0:
	call UnknownCall_0x111A6
	ld de, $A502
	ld bc, $A506
	jp [hl]

UnknownData_0x106FA:
INCBIN "baserom.gb", $106FA, $1075A - $106FA

	ld a, 2
	ld [$A52F], a
	call UnknownCall_0x10E49
	ld hl, $47D1
	jp UnknownJump_0x10DF8
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $18
	jr z, UnknownRJump_0x10798

UnknownRJump_0x10773:
	ld hl, $47A3
	call UnknownCall_0x111A6
	ld a, [$A506]
	cp $04
	jp z, UnknownJump_0x111C7
	cp $08
	jp z, UnknownJump_0x111C7
	cp $0C
	jp z, UnknownJump_0x111C7
	cp $10
	jp z, UnknownJump_0x111C7
	cp $14
	jp z, UnknownJump_0x111C7
	jp UnknownJump_0x10E5D

UnknownRJump_0x10798:
	call UnknownCall_0x111E8
	jp z, UnknownJump_0x10E1D
	ld a, 12
	ld [bc], a
	jr UnknownRJump_0x10773

UnknownData_0x107A3:
INCBIN "baserom.gb", $107A3, $1080A - $107A3

	call UnknownCall_0x10E4E
	ld hl, $4866
	jp UnknownJump_0x10DF8
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $12
	jp z, UnknownJump_0x10E1D
	ld hl, $4844
	call UnknownCall_0x111A6
	ld a, [$A506]
	cp $03
	jp z, UnknownJump_0x111C7
	cp $06
	jp z, UnknownJump_0x111C7
	cp $09
	jp z, UnknownJump_0x111C7
	cp $0C
	jp z, UnknownJump_0x111C7
	cp $0F
	jp z, UnknownJump_0x111C7
	jp UnknownJump_0x10E5D

UnknownData_0x10844:
INCBIN "baserom.gb", $10844, $1089C - $10844

	ld a, 2
	ld [$A52F], a
	call UnknownCall_0x10E4E
	ld hl, $48E2
	jp UnknownJump_0x10DF8
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $08
	jr z, UnknownRJump_0x108C6
	ld hl, $48D4
	call UnknownCall_0x111A6
	ld a, [$A506]
	cp $04
	jp z, UnknownJump_0x111C7
	jp UnknownJump_0x10E5D

UnknownRJump_0x108C6:
	call UnknownCall_0x111E8
	jp z, UnknownJump_0x10E1D
	xor a
	ld [bc], a
	ld hl, $48E2
	jp UnknownJump_0x111C7

UnknownData_0x108D4:
INCBIN "baserom.gb", $108D4, $108F7 - $108D4

	ld a, 36
	ld [$A52F], a
	call UnknownCall_0x10E53
	ld hl, $4926
	call UnknownCall_0x111FF
	jp UnknownJump_0x10DF8
	call UnknownCall_0x111E8
	jp z, UnknownJump_0x10E17
	cp $12
	jr z, UnknownRJump_0x1091B
	ld a, 1
	ld [bc], a
	ld hl, $4924
	jp UnknownJump_0x1121E

UnknownRJump_0x1091B:
	ld hl, $492C
	call UnknownCall_0x111FF
	jp UnknownJump_0x111C7

UnknownData_0x10924:
INCBIN "baserom.gb", $10924, $10932 - $10924

	ld a, 2
	ld [$A52F], a
	call UnknownCall_0x10E4E
	ld hl, $4988
	call UnknownCall_0x111FF
	jp UnknownJump_0x10DF8
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $11
	jr z, UnknownRJump_0x10957
	ld a, 2
	ld [de], a
	ld hl, $4968
	jp UnknownJump_0x1121E

UnknownRJump_0x10957:
	call UnknownCall_0x111E8
	jp z, UnknownJump_0x10E17
	xor a
	ld [bc], a
	ld hl, $498E
	call UnknownCall_0x111FF
	jp UnknownJump_0x111C7

UnknownData_0x10968:
INCBIN "baserom.gb", $10968, $10994 - $10968

	ld a, [$A471]
	cp $06
	ret z
	call UnknownCall_0x10E58
	ld hl, $A53E
	ld a, [hl]
	and a
	jr z, UnknownRJump_0x109AB
	dec [hl]
	ld hl, $49E1
	jp UnknownJump_0x10DF8

UnknownRJump_0x109AB:
	inc [hl]
	ld hl, $49ED
	jp UnknownJump_0x10DF8
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $03
	jp z, UnknownJump_0x10E1D
	ld a, [$A53E]
	and a
	ld a, [$A506]
	jr z, UnknownRJump_0x109D0
	ld hl, $49DD
	call UnknownCall_0x111A6
	jp UnknownJump_0x111C7

UnknownRJump_0x109D0:
	ld hl, $49D9
	call UnknownCall_0x111A6
	jp UnknownJump_0x111C7

UnknownData_0x109D9:
INCBIN "baserom.gb", $109D9, $109F9 - $109D9

	ld a, 48
	ld [$A52F], a
	call UnknownCall_0x10E58
	ld hl, $4A28
	call UnknownCall_0x111FF
	jp UnknownJump_0x10DF8
	call UnknownCall_0x111E8
	jp z, UnknownJump_0x10E17
	cp $18
	jr z, UnknownRJump_0x10A1D
	ld a, 1
	ld [bc], a
	ld hl, $4A26
	jp UnknownJump_0x1121E

UnknownRJump_0x10A1D:
	ld hl, $4A2E
	call UnknownCall_0x111FF
	jp UnknownJump_0x111C7

UnknownData_0x10A26:
INCBIN "baserom.gb", $10A26, $10A34 - $10A26

	ld a, 2
	ld [$A52F], a
	call UnknownCall_0x10E4E
	ld hl, $4AA3
	call UnknownCall_0x111FF
	jp UnknownJump_0x10DF8
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $1D
	jr z, UnknownRJump_0x10A5A
	ld a, 1
	ld [de], a
	ld a, [bc]
	ld hl, $4A6B
	jp UnknownJump_0x1121E

UnknownRJump_0x10A5A:
	call UnknownCall_0x111E8
	jp z, UnknownJump_0x10E17
	xor a
	ld [bc], a
	ld hl, $4AA9
	call UnknownCall_0x111FF
	jp UnknownJump_0x111C7

UnknownData_0x10A6B:
INCBIN "baserom.gb", $10A6B, $10AEA - $10A6B


UnknownJump_0x10AEA:
	call UnknownCall_0x10E58
	ld hl, $4B14
	call UnknownCall_0x111FF
	jp UnknownJump_0x10DF8
	call UnknownCall_0x111B7
	cp $0B
	jp z, UnknownJump_0x10E17
	ld hl, $4B04
	jp UnknownJump_0x1121E

UnknownData_0x10B04:
INCBIN "baserom.gb", $10B04, $10B1A - $10B04

	ld a, 3
	ld [$A52F], a
	call UnknownCall_0x10E53
	ld hl, $4B83
	call UnknownCall_0x111FF
	jp UnknownJump_0x10DF8
	call UnknownCall_0x111B3
	ret nz
	ld a, 2
	ld [de], a
	call UnknownCall_0x111B7
	cp $15
	jr z, UnknownRJump_0x10B3F
	ld hl, $4B5B
	jp UnknownJump_0x1121E

UnknownRJump_0x10B3F:
	call UnknownCall_0x111E8
	jp z, UnknownJump_0x10E17
	cp $01
	jp z, UnknownJump_0x10B56
	ld hl, $4B89

UnknownRJump_0x10B4D:
	ld a, 4
	ld [bc], a
	call UnknownCall_0x111FF
	jp UnknownJump_0x111C7

UnknownJump_0x10B56:
	ld hl, $4B8F
	jr UnknownRJump_0x10B4D

UnknownData_0x10B5B:
INCBIN "baserom.gb", $10B5B, $10B95 - $10B5B

	ld a, 2
	ld [$A52F], a
	jp UnknownJump_0x10AEA
	call UnknownCall_0x111B7
	cp $0B
	jp z, UnknownJump_0x10BAB
	ld hl, $4B04
	jp UnknownJump_0x1121E

UnknownJump_0x10BAB:
	call UnknownCall_0x111E8
	jp z, UnknownJump_0x10E17
	xor a
	ld [bc], a
	ld hl, $4BBC
	call UnknownCall_0x111FF
	jp UnknownJump_0x111C7

UnknownData_0x10BBC:
INCBIN "baserom.gb", $10BBC, $10BC2 - $10BBC

	ld a, 2
	ld [$A52F], a
	ld hl, $5B86
	call UnknownCall_0x10E43
	ld hl, $4C13
	call UnknownCall_0x111FF
	jp UnknownJump_0x10DF8
	call UnknownCall_0x111B3
	ret nz
	ld a, 2
	ld [de], a
	call UnknownCall_0x111B7
	cp $0B
	jr z, UnknownRJump_0x10BEA
	ld hl, $4BFB
	jp UnknownJump_0x1121E

UnknownRJump_0x10BEA:
	call UnknownCall_0x111E8
	jp z, UnknownJump_0x10E17
	xor a
	ld [bc], a
	ld hl, $4C19
	call UnknownCall_0x111FF
	jp UnknownJump_0x111C7

UnknownData_0x10BFB:
INCBIN "baserom.gb", $10BFB, $10C2F - $10BFB

	ld hl, $4C1F
	call UnknownCall_0x10E43
	ld hl, $4C42
	jp UnknownJump_0x10DF8
	call UnknownCall_0x111B3
	ret nz
	jp UnknownJump_0x10E1D

UnknownData_0x10C42:
INCBIN "baserom.gb", $10C42, $10C48 - $10C42

	ld hl, $4C6C
	push hl

UnknownRJump_0x10C4C:
	ld a, 8
	ld [$A52F], a
	call UnknownCall_0x10E58
	pop hl
	call UnknownCall_0x111FF
	jp UnknownJump_0x10DF8
	call UnknownCall_0x111E8
	jp z, UnknownJump_0x10E1D
	ld a, 1
	ld [bc], a
	ld hl, $4C6A
	jp UnknownJump_0x1121E

UnknownData_0x10C6A:
INCBIN "baserom.gb", $10C6A, $10C72 - $10C6A

	ld hl, $4C89
	push hl
	jr UnknownRJump_0x10C4C
	call UnknownCall_0x111E8
	jp z, UnknownJump_0x10E1D
	ld a, 1
	ld [bc], a
	ld hl, $4C87
	jp UnknownJump_0x1121E

UnknownData_0x10C87:
INCBIN "baserom.gb", $10C87, $10C8F - $10C87

	call UnknownCall_0x10E4E
	ld hl, $4CB9
	jp UnknownJump_0x10DF8
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $07
	jp z, UnknownJump_0x10E1D
	ld hl, $4CAD
	call UnknownCall_0x111A6
	jp UnknownJump_0x111C7

UnknownData_0x10CAD:
INCBIN "baserom.gb", $10CAD, $10CE1 - $10CAD

	ld a, 7
	ld [$A52F], a
	ld hl, $4CD1
	call UnknownCall_0x10E43
	ld hl, $4D32
	call UnknownCall_0x111FF
	jp UnknownJump_0x10DF3
	call UnknownCall_0x111B7
	cp $09
	jp z, UnknownJump_0x10D08
	cp $11
	jp z, UnknownJump_0x10E17

UnknownRJump_0x10D02:
	ld hl, $4D12
	jp UnknownJump_0x1121E

UnknownJump_0x10D08:
	call UnknownCall_0x111E8
	jr z, UnknownRJump_0x10D02
	ld a, 1
	ld [bc], a
	jr UnknownRJump_0x10D02

UnknownData_0x10D12:
INCBIN "baserom.gb", $10D12, $10D38 - $10D12


UnknownJump_0x10D38:
	call UnknownCall_0x10E58
	ld hl, $4D60
	jp UnknownJump_0x10DF8
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $06
	jp z, UnknownJump_0x10E1D
	ld hl, $4D56
	call UnknownCall_0x111A6
	jp UnknownJump_0x111C7

UnknownData_0x10D56:
INCBIN "baserom.gb", $10D56, $10D6C - $10D56

	ld a, 10
	ld [$A52F], a
	call UnknownCall_0x10E58
	ld hl, $4DA8
	call UnknownCall_0x111FF
	jp UnknownJump_0x10DF8
	call UnknownCall_0x111B7
	cp $03
	jr z, UnknownRJump_0x10D8A

UnknownRJump_0x10D84:
	ld hl, $4DA4
	jp UnknownJump_0x1121E

UnknownRJump_0x10D8A:
	call UnknownCall_0x111E8
	jp z, UnknownJump_0x10E1D
	cp $05
	jr z, UnknownRJump_0x10D99
	ld a, 1
	ld [bc], a
	jr UnknownRJump_0x10D84

UnknownRJump_0x10D99:
	xor a
	ld [bc], a
	ld hl, $4DA8
	call UnknownCall_0x111FF
	jp UnknownJump_0x111C7

UnknownData_0x10DA4:
INCBIN "baserom.gb", $10DA4, $10DAE - $10DA4

	ld a, 7
	ld [$A52F], a
	ld hl, $5BA6
	call UnknownCall_0x10E43
	ld hl, $4DE5
	call UnknownCall_0x111FF
	jp UnknownJump_0x10DF8
	call UnknownCall_0x111B3
	ret nz
	ld a, 2
	ld [de], a
	call UnknownCall_0x111B7
	cp $03
	jr z, UnknownRJump_0x10DD6

UnknownRJump_0x10DD0:
	ld hl, $4DE1
	jp UnknownJump_0x1121E

UnknownRJump_0x10DD6:
	call UnknownCall_0x111E8
	jp z, UnknownJump_0x10E17
	ld a, 1
	ld [bc], a
	jr UnknownRJump_0x10DD0

UnknownData_0x10DE1:
INCBIN "baserom.gb", $10DE1, $10DEB - $10DE1

	ld a, [$A471]
	and a
	ret nz
	jp UnknownJump_0x10D38

UnknownJump_0x10DF3:
	ld a, 1
	ld [$A538], a

UnknownJump_0x10DF8:
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
	jp UnknownJump_0x111C7

UnknownData_0x10E11:
INCBIN "baserom.gb", $10E11, $10E17 - $10E11


UnknownJump_0x10E17:
	ld hl, $4E3C
	call UnknownCall_0x111C7

UnknownJump_0x10E1D:
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
	jp UnknownJump_0x112A7

UnknownData_0x10E3C:
INCBIN "baserom.gb", $10E3C, $10E43 - $10E3C


UnknownRJump_0x10E43:
UnknownCall_0x10E43:
	xor a
	ld [$FF00+$1A], a
	jp UnknownJump_0x112A7

UnknownCall_0x10E49:
	ld hl, $5BD6
	jr UnknownRJump_0x10E43

UnknownCall_0x10E4E:
	ld hl, $5BE6
	jr UnknownRJump_0x10E43

UnknownCall_0x10E53:
	ld hl, $5BF6
	jr UnknownRJump_0x10E43

UnknownCall_0x10E58:
	ld hl, $5B96
	jr UnknownRJump_0x10E43

UnknownJump_0x10E5D:
	ld c, 29
	ld b, 2
	jp UnknownJump_0x111D3

UnknownData_0x10E64:
INCBIN "baserom.gb", $10E64, $10E90 - $10E64


UnknownCall_0x10E90:
	ld hl, $A478
	ld a, [hl]
	and a
	jr z, UnknownRJump_0x10EA2
	ld a, [$A539]
	and a
	ret nz
	ld a, [hl]
	ld hl, $4E64
	jr UnknownRJump_0x10EA9

UnknownRJump_0x10EA2:
	inc hl
	ld a, [hl]
	and a
	ret z
	ld hl, $4E7A

UnknownRJump_0x10EA9:
	call UnknownCall_0x111A6
	ld de, $A503
	ld bc, $A508
	jp [hl]
	ld hl, $4EDC
	jp UnknownJump_0x11163
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $08
	jp z, UnknownJump_0x11181
	ld hl, $4ECE
	call UnknownCall_0x111A6
	jp UnknownJump_0x111CD

UnknownData_0x10ECE:
INCBIN "baserom.gb", $10ECE, $10EEB - $10ECE

	ld a, 3
	ld [$A530], a
	ld hl, $4F34
	jp UnknownJump_0x11163
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $0C
	jp z, UnknownJump_0x11181
	and $01
	jr nz, UnknownRJump_0x10F18
	ld a, 73
	ld [$FF00+$21], a

UnknownRJump_0x10F0A:
	ld a, 47
	ld [$FF00+$20], a
	ld a, [bc]
	ld hl, $4F1E
	call UnknownCall_0x111A6
	jp UnknownJump_0x1119F

UnknownRJump_0x10F18:
	ld a, 32
	ld [$FF00+$21], a
	jr UnknownRJump_0x10F0A

UnknownData_0x10F1E:
INCBIN "baserom.gb", $10F1E, $10F4B - $10F1E

	ld a, 3
	ld [$A479], a
	ld hl, $4F60
	jp UnknownJump_0x111CD
	xor a
	ld [$A479], a
	ld hl, $4F65
	jp UnknownJump_0x111CD

UnknownData_0x10F60:
INCBIN "baserom.gb", $10F60, $10F6A - $10F60

	ld a, [$A479]
	cp $04
	ret z
	ld hl, $4F7D
	jp UnknownJump_0x11163
	call UnknownCall_0x111B3
	ret nz
	jp UnknownJump_0x11181

UnknownData_0x10F7D:
INCBIN "baserom.gb", $10F7D, $10F82 - $10F7D

	ld hl, $4FAB
	jp UnknownJump_0x11163
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $08
	jp z, UnknownJump_0x11181
	ld hl, $4F9D
	call UnknownCall_0x111A6
	jp UnknownJump_0x1119F

UnknownData_0x10F9D:
INCBIN "baserom.gb", $10F9D, $10FC5 - $10F9D

	ld hl, $4FEA
	jp UnknownJump_0x11163
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $06
	jp z, UnknownJump_0x11181
	ld hl, $4FE0
	call UnknownCall_0x111A6
	jp UnknownJump_0x111CD

UnknownData_0x10FE0:
INCBIN "baserom.gb", $10FE0, $11008 - $10FE0

	ld a, [$A479]
	cp $07
	ret z
	ld hl, $5026
	jp UnknownJump_0x11163
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $02
	jp z, UnknownJump_0x11181
	ld hl, $502B
	jp UnknownJump_0x111CD

UnknownData_0x11026:
INCBIN "baserom.gb", $11026, $11030 - $11026

	ld hl, $506D
	jp UnknownJump_0x11163
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $0A
	jp z, UnknownJump_0x1117B
	ld hl, $505B
	call UnknownCall_0x111A6
	ld a, [$A508]
	cp $05
	jr nc, UnknownRJump_0x11052
	jp UnknownJump_0x111CD

UnknownRJump_0x11052:
	inc hl
	inc hl
	ld a, 32
	ld [$FF00+$21], a
	jp UnknownJump_0x1119F

UnknownData_0x1105B:
INCBIN "baserom.gb", $1105B, $11086 - $1105B

	ld hl, $50C4
	jp UnknownJump_0x11163
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $0C
	jp z, UnknownJump_0x11181
	ld hl, $50AE
	call UnknownCall_0x111A6
	ld a, [$A508]
	cp $04
	jp z, UnknownJump_0x111CD
	cp $08
	jp z, UnknownJump_0x111CD
	jp UnknownJump_0x1119F

UnknownData_0x110AE:
INCBIN "baserom.gb", $110AE, $110DC - $110AE

	ld a, 5
	ld [$A530], a
	ld hl, $5108
	jp UnknownJump_0x11163
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $07
	jp z, UnknownJump_0x1117B
	ld hl, $50FC
	call UnknownCall_0x111A6
	jp UnknownJump_0x1119F

UnknownData_0x110FC:
INCBIN "baserom.gb", $110FC, $1111C - $110FC

	ld hl, $5145
	jp UnknownJump_0x11163
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $08
	jp z, UnknownJump_0x11181
	ld hl, $5137
	call UnknownCall_0x111A6
	jp UnknownJump_0x111CD

UnknownData_0x11137:
INCBIN "baserom.gb", $11137, $11163 - $11137


UnknownJump_0x11163:
	ld a, [$A478]
	ld [$A479], a
	xor a
	ld [$A503], a
	ld [$A508], a
	ld a, [$A44F]
	set 7, a
	ld [$A44F], a
	jp UnknownJump_0x111CD

UnknownJump_0x1117B:
	ld hl, $519A
	call UnknownCall_0x111CD

UnknownJump_0x11181:
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

UnknownData_0x1119A:
INCBIN "baserom.gb", $1119A, $1119F - $1119A


UnknownJump_0x1119F:
	ld b, 2
	ld c, 34
	jp UnknownJump_0x111D3

UnknownCall_0x111A6:
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

UnknownCall_0x111B3:
	ld a, [de]
	dec a
	ld [de], a
	ret

UnknownCall_0x111B7:
	ld a, [bc]
	inc a
	ld [bc], a
	ret

UnknownJump_0x111BB:
UnknownCall_0x111BB:
	ld b, 5
	ld c, 16
	jr UnknownRJump_0x111D3

UnknownCall_0x111C1:
	ld b, 4
	ld c, 22
	jr UnknownRJump_0x111D3

UnknownJump_0x111C7:
UnknownCall_0x111C7:
	ld b, 5
	ld c, 26
	jr UnknownRJump_0x111D3

UnknownJump_0x111CD:
UnknownCall_0x111CD:
	ld b, 4
	ld c, 32
	jr UnknownRJump_0x111D3

UnknownJump_0x111D3:
UnknownRJump_0x111D3:
	ld a, [hli]
	ld [$FF00+c], a
	inc c
	dec b
	jr nz, UnknownRJump_0x111D3
	ld a, [hl]

UnknownJump_0x111DA:
	ld [de], a
	ret

UnknownCall_0x111DC:
	push de
	ld de, $A52D
	jr UnknownRJump_0x111F4

UnknownData_0x111E2:
INCBIN "baserom.gb", $111E2, $111E8 - $111E2


UnknownCall_0x111E8:
	push de
	ld de, $A52F
	jr UnknownRJump_0x111F4

UnknownData_0x111EE:
INCBIN "baserom.gb", $111EE, $111F4 - $111EE


UnknownRJump_0x111F4:
	call UnknownCall_0x111B3
	pop de
	ret

UnknownCall_0x111F9:
	push de
	ld de, $A531
	jr UnknownRJump_0x11205

UnknownCall_0x111FF:
	push de
	ld de, $A533
	jr UnknownRJump_0x11205

UnknownRJump_0x11205:
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

UnknownJump_0x11214:
	push de
	ld de, $A532
	ld a, [bc]
	ld c, 19
	push bc
	jr UnknownRJump_0x11228

UnknownJump_0x1121E:
	push de
	ld de, $A534
	ld a, [bc]
	ld c, 29
	push bc
	jr UnknownRJump_0x11228

UnknownRJump_0x11228:
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

UnknownData_0x11244:
INCBIN "baserom.gb", $11244, $11298 - $11244


UnknownCall_0x11298:
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

UnknownJump_0x112A7:
UnknownCall_0x112A7:
	push bc
	ld c, 48

UnknownRJump_0x112AA:
	ld a, [hli]
	ld [$FF00+c], a
	inc c
	ld a, c
	cp $40
	jr nz, UnknownRJump_0x112AA
	pop bc
	ret

UnknownData_0x112B4:
INCBIN "baserom.gb", $112B4, $112DD - $112B4


UnknownRJump_0x112DD:
	jp UnknownJump_0x13F5E

UnknownCall_0x112E0:
	cp $FF
	jr z, UnknownRJump_0x112DD
	cp $2B
	ret nc
	ld [hl], a
	ld b, a
	ld hl, $5244
	and $3F
	call UnknownCall_0x11298
	call StartMusic
	jp UnknownJump_0x113F3

UnknownData_0x112F7:
INCBIN "baserom.gb", $112F7, $113F3 - $112F7


UnknownJump_0x113F3:
	ld a, [sCurSong]
	ld hl, $52F7

UnknownRJump_0x113F9:
	dec a
	jr z, UnknownRJump_0x11404
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	jr UnknownRJump_0x113F9

UnknownRJump_0x11404:
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

UnknownCall_0x11421:
	ld hl, $A455
	ld a, [hli]
	cp $01
	ret z

UnknownData_0x11428:
INCBIN "baserom.gb", $11428, $11449 - $11428


UnknownCall_0x11449:
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

UnknownCall_0x11454:
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	ret

StartMusic: ;$1145A
	call UnknownCall_0x13F6B
	ld a, [$A468]
	cp $02
	jr z, .SetNormalMusicSpeed
	cp $03
	jr z, .SetNormalMusicSpeed
	cp $0C
	jr z, .SetNormalMusicSpeed
	cp $0F
	jr z, .SetNormalMusicSpeed
	cp $18
	jr z, .SetNormalMusicSpeed
	cp $09
	jr nz, .StartMusic
	ld a, 1
	ld [sFastMusic], a
	jr .StartMusic

.SetNormalMusicSpeed ;$1147F
	xor a
	ld [sFastMusic], a

.StartMusic ;$11483
	ld de, $A400
	ld b, 0
	ld a, [hli]
	ld [de], a
	ld a, [sFastMusic]
	and a
	jr z, .SkipFastMusic
	ld b, 4
	ld a, [de]
	add b
	ld [de], a
	ld b, 0

.SkipFastMusic ;$11497
	inc e
	call UnknownCall_0x11454
	ld a, [sFastMusic]
	and a
	jr z, UnknownRJump_0x114A7
	dec e
	call UnknownCall_0x11454
	jr UnknownRJump_0x114A9

UnknownRJump_0x114A7:
	inc hl
	inc hl

UnknownRJump_0x114A9:
	ld de, $A410
	call UnknownCall_0x11454
	ld de, $A420
	call UnknownCall_0x11454
	ld de, $A430
	call UnknownCall_0x11454
	ld de, $A440
	call UnknownCall_0x11454
	ld hl, $A410
	ld de, $A414
	call UnknownCall_0x11449
	ld hl, $A420
	ld de, $A424
	call UnknownCall_0x11449
	ld hl, $A430
	ld de, $A434
	call UnknownCall_0x11449
	ld hl, $A440
	ld de, $A444
	call UnknownCall_0x11449
	ld bc, $0410
	ld hl, $A412

UnknownRJump_0x114EB:
	ld [hl], 1
	ld a, c
	add l
	ld l, a
	dec b
	jr nz, UnknownRJump_0x114EB
	xor a
	ld [$A41E], a
	ld [$A42E], a
	ld [$A43E], a
	ret

UnknownRJump_0x114FE:
	push hl
	ld a, [$A471]
	and a
	jr nz, UnknownRJump_0x1150D
	xor a
	ld [$FF00+$1A], a
	ld l, e
	ld h, d
	call UnknownCall_0x112A7

UnknownRJump_0x1150D:
	pop hl
	jr UnknownRJump_0x11540

UnknownJump_0x11510:
	call UnknownCall_0x11546
	call UnknownCall_0x1155B
	ld e, a
	call UnknownCall_0x11546
	call UnknownCall_0x1155B
	ld d, a
	call UnknownCall_0x11546
	call UnknownCall_0x1155B
	ld c, a
	ld a, [$A48D]
	and a
	jr nz, UnknownRJump_0x11536
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

UnknownRJump_0x11536:
	push hl
	ld hl, $A450
	ld a, [hl]
	pop hl
	cp $03
	jr z, UnknownRJump_0x114FE

UnknownRJump_0x11540:
	call UnknownCall_0x11546
	jp UnknownJump_0x11655

UnknownCall_0x11546:
	push de
	ld a, [hli]
	ld e, a
	ld a, [hld]
	ld d, a
	inc de

UnknownRJump_0x1154C:
	ld a, e
	ld [hli], a
	ld a, d
	ld [hld], a
	pop de
	ret

UnknownCall_0x11552:
	push de
	ld a, [hli]
	ld e, a
	ld a, [hld]
	ld d, a
	inc de
	inc de
	jr UnknownRJump_0x1154C

UnknownCall_0x1155B:
	ld a, [hli]
	ld c, a
	ld a, [hld]
	ld b, a
	ld a, [bc]
	ld b, a
	ret

UnknownRJump_0x11562:
	pop hl
	jr UnknownRJump_0x11596

UnknownJump_0x11565:
	ld a, [$A450]
	cp $03
	jr nz, UnknownRJump_0x1157C
	ld a, [$A438]
	bit 7, a
	jr z, UnknownRJump_0x1157C

UnknownData_0x11573:
INCBIN "baserom.gb", $11573, $1157C - $11573


UnknownRJump_0x1157C:
	push hl
	ld a, l
	add 9
	ld l, a
	ld a, [hl]
	and a
	jr nz, UnknownRJump_0x11562
	ld a, l
	add 4
	ld l, a
	bit 7, [hl]
	jr nz, UnknownRJump_0x11562
	pop hl
	call UnknownCall_0x11817
	push hl
	call UnknownCall_0x11899
	pop hl

UnknownJump_0x11596:
UnknownRJump_0x11596:
	dec l
	dec l
	jp UnknownJump_0x117F7

UnknownJump_0x1159B:
	dec l
	dec l
	dec l
	dec l
	call UnknownCall_0x11552

UnknownRJump_0x115A2:
	ld a, l
	add 4
	ld e, a
	ld d, h
	call UnknownCall_0x11449
	cp $00
	jr z, UnknownRJump_0x115CD
	cp $FF
	jr z, UnknownRJump_0x115B6
	inc l
	jp UnknownJump_0x11653

UnknownRJump_0x115B6:
	dec l
	push hl
	call UnknownCall_0x11552
	call UnknownCall_0x1155B
	ld e, a
	call UnknownCall_0x11546
	call UnknownCall_0x1155B
	ld d, a
	pop hl
	ld a, e
	ld [hli], a
	ld a, d
	ld [hld], a
	jr UnknownRJump_0x115A2

UnknownRJump_0x115CD:
	ld hl, sCurSong
	ld [hl], 0
	call UnknownCall_0x13F5E
	ret

UnknownJump_0x115D6:
	call UnknownCall_0x11546
	call UnknownCall_0x1155B
	ld [$A401], a
	call UnknownCall_0x11546
	call UnknownCall_0x1155B
	ld [$A402], a
	jr UnknownRJump_0x115F3

UnknownJump_0x115EA:
UnknownData_0x115EA:
INCBIN "baserom.gb", $115EA, $115F3 - $115EA


UnknownRJump_0x115F3:
	call UnknownCall_0x11546
	jr UnknownRJump_0x11655

UnknownJump_0x115F8:
	call UnknownCall_0x11546
	call UnknownCall_0x1155B
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
	jr UnknownRJump_0x11655

UnknownJump_0x1161C:
	push hl
	ld a, l
	add 11
	ld l, a
	ld a, [hl]
	dec [hl]
	ld a, [hl]
	and $7F
	jr z, UnknownRJump_0x11635
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
	jr UnknownRJump_0x11655

UnknownRJump_0x11635:
	pop hl
	jr UnknownRJump_0x115F3

UnknownCall_0x11638:
	ld hl, sCurSong
	ld a, [hl]
	and a
	ret z
	call UnknownCall_0x11421
	ld a, 1
	ld [$A450], a
	ld hl, $A410

UnknownJump_0x11649:
	inc l
	ld a, [hli]
	and a
	jp z, UnknownJump_0x11596
	dec [hl]
	jp nz, UnknownJump_0x11565

UnknownJump_0x11653:
	inc l
	inc l

UnknownJump_0x11655:
UnknownRJump_0x11655:
	call UnknownCall_0x1155B
	cp $00
	jp z, UnknownJump_0x1159B
	cp $9D
	jp z, UnknownJump_0x11510
	cp $9E
	jp z, UnknownJump_0x115D6
	cp $9F
	jp z, UnknownJump_0x115EA
	cp $9B
	jp z, UnknownJump_0x115F8
	cp $9C
	jp z, UnknownJump_0x1161C
	cp $99
	jp z, UnknownJump_0x11989
	cp $9A
	jp z, UnknownJump_0x11994
	cp $97
	jp z, UnknownJump_0x119CC
	cp $98
	jp z, UnknownJump_0x119DB
	cp $95
	jp z, UnknownJump_0x119FF
	cp $96
	jp z, UnknownJump_0x11A0E
	and $F0
	cp $A0
	jr nz, UnknownRJump_0x116E7
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
	jr nz, UnknownRJump_0x116B9
	ld a, d
	jr UnknownRJump_0x116DE

UnknownRJump_0x116B9:
	ld e, a
	ld a, d
	push af
	srl a
	sla e
	jr c, UnknownRJump_0x116CA
	ld d, a
	srl a
	sla e
	jr c, UnknownRJump_0x116CA
	add d

UnknownRJump_0x116CA:
	ld c, a
	and a
	jr nz, UnknownRJump_0x116D0
	ld c, 2

UnknownRJump_0x116D0:
	ld de, $A450
	ld a, [de]
	dec a
	ld e, a
	ld d, 0
	ld hl, $A407
	add de
	ld [hl], c
	pop af

UnknownRJump_0x116DE:
	pop hl
	dec l
	ld [hli], a
	call UnknownCall_0x11546
	call UnknownCall_0x1155B

UnknownRJump_0x116E7:
	ld a, [$A450]
	cp $04
	jr z, UnknownRJump_0x11728
	push de
	ld de, $A51A
	call UnknownCall_0x11A71
	ld a, [de]
	and a
	jr z, UnknownRJump_0x116FF
	ld a, 1
	ld [de], a
	inc e
	xor a
	ld [de], a

UnknownRJump_0x116FF:
	ld de, $A520
	call UnknownCall_0x11A71
	xor a
	ld [de], a
	inc e
	ld [de], a
	ld de, $A526
	call UnknownCall_0x11A71
	inc e
	xor a
	ld [de], a
	ld a, [$A450]
	cp $03
	jr nz, UnknownRJump_0x11727
	ld de, $A50E
	ld a, [de]
	and a
	jr z, UnknownRJump_0x11727
	ld a, 1
	ld [de], a
	xor a
	ld [$A51F], a

UnknownRJump_0x11727:
	pop de

UnknownRJump_0x11728:
	ld c, b
	ld b, 0
	call UnknownCall_0x11546
	ld a, [$A450]
	cp $04
	jp z, UnknownJump_0x1176A
	push hl
	ld a, l
	add 5
	ld l, a
	ld e, l
	ld d, h
	inc l
	inc l
	ld a, c
	cp $01
	jr z, UnknownRJump_0x11765
	ld [hl], 0
	ld a, [$A400]
	and a
	jr z, UnknownRJump_0x11758
	ld l, a
	ld h, 0
	bit 7, l
	jr z, UnknownRJump_0x11755

UnknownData_0x11753:
INCBIN "baserom.gb", $11753, $11755 - $11753


UnknownRJump_0x11755:
	add bc
	ld b, h
	ld c, l

UnknownRJump_0x11758:
	ld hl, $5AF4
	add bc
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	jp UnknownJump_0x1179B

UnknownRJump_0x11765:
	ld [hl], 1
	pop hl
	jr UnknownRJump_0x1179B

UnknownJump_0x1176A:
	push hl
	ld a, c
	cp $1F
	jr z, UnknownRJump_0x11788
	ld de, $A446
	ld hl, $5C06
	add bc

UnknownRJump_0x11777:
	ld a, [hli]
	ld [de], a
	inc e
	ld a, e
	cp $4B
	jr nz, UnknownRJump_0x11777
	ld c, 32
	ld hl, $A444
	ld b, 0
	jr UnknownRJump_0x117C9

UnknownRJump_0x11788:
	ld a, [$A44F]
	bit 7, a
	jp nz, UnknownJump_0x117F2
	ld a, 3
	ld [$A478], a
	call UnknownCall_0x10E90
	jp UnknownJump_0x117F2

UnknownJump_0x1179B:
UnknownRJump_0x1179B:
	push hl
	ld b, 0
	ld a, [$A450]
	cp $01
	jr z, UnknownRJump_0x117C6
	cp $02
	jr z, UnknownRJump_0x117C2
	ld c, 26
	ld a, [$A43F]
	bit 7, a
	jr nz, UnknownRJump_0x117B7
	xor a
	ld [$FF00+c], a
	ld a, 128
	ld [$FF00+c], a

UnknownRJump_0x117B7:
	inc c
	inc l
	inc l
	inc l
	inc l
	ld a, [hli]
	ld e, a
	ld d, 0
	jr UnknownRJump_0x117D0

UnknownRJump_0x117C2:
	ld c, 22
	jr UnknownRJump_0x117C9

UnknownRJump_0x117C6:
	ld c, 16
	inc c

UnknownRJump_0x117C9:
	inc l
	inc l
	ld a, [hli]
	ld e, a
	inc l
	ld a, [hli]
	ld d, a

UnknownRJump_0x117D0:
	push hl
	inc l
	inc l
	ld a, [hli]
	and a
	jr z, UnknownRJump_0x117D9
	ld e, 8

UnknownRJump_0x117D9:
	inc l
	inc l
	ld [hl], 0
	inc l
	ld a, [hl]
	pop hl
	bit 7, a
	jr nz, UnknownRJump_0x117F2
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

UnknownJump_0x117F2:
UnknownRJump_0x117F2:
	pop hl
	dec l
	ld a, [hld]
	ld [hld], a
	dec l

UnknownJump_0x117F7:
	ld de, $A450
	ld a, [de]
	cp $04
	jr z, UnknownRJump_0x11808
	inc a
	ld [de], a
	ld a, 16
	add l
	ld l, a
	jp UnknownJump_0x11649

UnknownRJump_0x11808:
	ld hl, $A41E
	inc [hl]
	ld hl, $A42E
	inc [hl]
	ld hl, $A43E
	inc [hl]
	ret

UnknownJump_0x11815:
	pop hl
	ret

UnknownCall_0x11817:
	push hl
	ld a, l
	add 6
	ld l, a
	ld a, [hl]
	and $0F
	jr z, UnknownRJump_0x11839
	ld [$A451], a
	ld a, [$A450]
	ld c, 19
	cp $01
	jr z, UnknownRJump_0x11879
	ld c, 24
	cp $02
	jr z, UnknownRJump_0x11879
	ld c, 29
	cp $03
	jr z, UnknownRJump_0x11879

UnknownJump_0x11839:
UnknownRJump_0x11839:
	ld a, [$A450]
	cp $04
	jp z, UnknownJump_0x11815
	ld c, 19
	cp $01
	jp z, UnknownJump_0x11851
	ld c, 24
	cp $02
	jp z, UnknownJump_0x11851
	ld c, 29

UnknownJump_0x11851:
	ld de, $A51A
	call UnknownCall_0x11A71
	ld a, [de]
	and a
	jp nz, UnknownJump_0x11A18
	ld de, $A526
	call UnknownCall_0x11A71
	ld a, [de]
	and a
	jp nz, UnknownJump_0x119E4
	ld a, [$A450]
	cp $03
	jp nz, UnknownJump_0x11815
	ld a, [$A50E]
	and a
	jp nz, UnknownJump_0x1199A
	jp UnknownJump_0x11815

UnknownRJump_0x11879:
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
	cp $01
	jp z, UnknownJump_0x11A87
	ld hl, $FFFF
	pop de
	add de
	call UnknownCall_0x11A60
	jp UnknownJump_0x11839

UnknownCall_0x11899:
	ld a, [$A41B]
	and a
	jr nz, UnknownRJump_0x118C0
	ld a, [$A417]
	and a
	jr z, UnknownRJump_0x118C0
	and $0F
	ld b, a
	ld hl, $A407
	ld a, [$A41E]
	cp [hl]
	jr nz, UnknownRJump_0x118C0
	ld c, 18
	ld de, $A41A
	ld a, [$A41F]
	bit 7, a
	jr nz, UnknownRJump_0x118C0
	call UnknownCall_0x118E4

UnknownRJump_0x118C0:
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
	call UnknownCall_0x118E4
	ret

UnknownCall_0x118E4:
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

UnknownJump_0x118F7:
	call UnknownCall_0x13FE7
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

UnknownRJump_0x11914:
	res 7, [hl]
	add de
	dec b
	jr nz, UnknownRJump_0x11914
	ld hl, $5970
	ld de, $A501
	call UnknownCall_0x111C1
	jp UnknownJump_0x10067

UnknownJump_0x11926:
	xor a
	ld [$A45D], a
	ld [$A536], a
	ld [$A538], a
	ld [$A539], a
	jp UnknownJump_0x10044

UnknownJump_0x11936:
	ld de, $A501
	call UnknownCall_0x111B3
	jp nz, UnknownJump_0x10067
	ld bc, $A505
	call UnknownCall_0x111B7
	cp $06
	jp z, UnknownJump_0x11959
	ld hl, $5966
	call UnknownCall_0x111A6
	ld de, $A501
	call UnknownCall_0x111C1
	jp UnknownJump_0x10067

UnknownJump_0x11959:
	ld a, 240
	ld [$A501], a
	ld a, 5
	ld [$A505], a
	jp UnknownJump_0x10067

UnknownData_0x11966:
INCBIN "baserom.gb", $11966, $11989 - $11966


UnknownJump_0x11989:
	ld a, 1

UnknownRJump_0x1198B:
	ld [$A50E], a
	call UnknownCall_0x11546
	jp UnknownJump_0x11655

UnknownJump_0x11994:
	xor a
	ld [$A50E], a
	jr UnknownRJump_0x1198B

UnknownJump_0x1199A:
	cp $02
	jp z, UnknownJump_0x11815
	ld bc, $A51F
	call UnknownCall_0x111B7
	ld c, 28
	ld b, 64
	cp $03
	jr z, UnknownRJump_0x119C7
	ld b, 96
	cp $05
	jr z, UnknownRJump_0x119C7
	cp $0A
	jr z, UnknownRJump_0x119C7
	ld b, 0
	cp $07
	jr z, UnknownRJump_0x119C7
	cp $0D
	jp nz, UnknownJump_0x11815
	ld a, 2
	ld [$A50E], a

UnknownRJump_0x119C7:
	ld a, b
	ld [$FF00+c], a
	jp UnknownJump_0x11815

UnknownJump_0x119CC:
	ld de, $A526
	call UnknownCall_0x11A71
	ld a, 1

UnknownRJump_0x119D4:
	ld [de], a
	call UnknownCall_0x11546
	jp UnknownJump_0x11655

UnknownJump_0x119DB:
	ld de, $A526
	call UnknownCall_0x11A71
	xor a
	jr UnknownRJump_0x119D4

UnknownJump_0x119E4:
	inc e
	ld a, [de]
	and a
	jr nz, UnknownRJump_0x119FA
	inc a
	ld [de], a
	pop hl
	push hl
	call UnknownCall_0x11A55

UnknownRJump_0x119F0:
	ld hl, $FF9C
	add de
	call UnknownCall_0x11A60
	jp UnknownJump_0x11815

UnknownRJump_0x119FA:
	call UnknownCall_0x11A7A
	jr UnknownRJump_0x119F0

UnknownJump_0x119FF:
	ld de, $A51A
	call UnknownCall_0x11A71
	ld a, 1

UnknownJump_0x11A07:
	ld [de], a
	call UnknownCall_0x11546
	jp UnknownJump_0x11655

UnknownJump_0x11A0E:
	ld de, $A51A
	call UnknownCall_0x11A71
	xor a
	jp UnknownJump_0x11A07

UnknownJump_0x11A18:
	cp $02
	jp z, UnknownJump_0x11815
	inc e
	ld a, [de]
	and a
	jr z, UnknownRJump_0x11A44
	cp $05
	jr z, UnknownRJump_0x11A35
	inc a
	ld [de], a
	call UnknownCall_0x11A7A
	ld hl, $0001
	add de
	call UnknownCall_0x11A60
	jp UnknownJump_0x11815

UnknownRJump_0x11A35:
	ld de, $A51A
	call UnknownCall_0x11A71
	ld a, 2
	ld [de], a
	inc e
	xor a
	ld [de], a
	jp UnknownJump_0x11815

UnknownRJump_0x11A44:
	inc a
	ld [de], a
	pop hl
	push hl
	call UnknownCall_0x11A55
	ld hl, $FFFC
	add de
	call UnknownCall_0x11A60
	jp UnknownJump_0x11815

UnknownCall_0x11A55:
	ld a, 7
	add l
	ld l, a
	ld a, [hli]
	ld e, a
	ld a, [hl]
	and $0F
	ld d, a
	ret

UnknownCall_0x11A60:
	ld de, $A514
	call UnknownCall_0x11A71
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

UnknownCall_0x11A71:
	ld a, [$A450]
	dec a
	sla a
	add e
	ld e, a
	ret

UnknownCall_0x11A7A:
	ld de, $A514
	call UnknownCall_0x11A71
	ld a, [de]
	ld l, a
	inc e
	ld a, [de]
	ld d, a
	ld e, l
	ret

UnknownJump_0x11A87:
	pop de
	ld de, $A520
	call UnknownCall_0x11A71
	ld a, [de]
	inc a
	ld [de], a
	inc e
	cp $19
	jr z, UnknownRJump_0x11AC7
	cp $2D
	jr z, UnknownRJump_0x11AC0
	ld a, [de]
	and a
	jp z, UnknownJump_0x11839

UnknownRJump_0x11A9F:
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
	call UnknownCall_0x11A55
	ld h, d
	ld l, e
	pop de
	add de
	call UnknownCall_0x11A60
	jp UnknownJump_0x11839

UnknownRJump_0x11AC0:
	dec e
	ld a, 25
	ld [de], a
	inc e
	jr UnknownRJump_0x11A9F

UnknownRJump_0x11AC7:
	ld a, 1
	ld [de], a
	jr UnknownRJump_0x11A9F

UnknownData_0x11ACC:
INCBIN "baserom.gb", $11ACC, $13F5E - $11ACC


UnknownJump_0x13F5E:
UnknownCall_0x13F5E:
	ld a, 255
	ld [$FF00+$25], a
	ld a, 3
	ld [$A455], a
	xor a
	ld [sCurSong], a

UnknownCall_0x13F6B:
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

UnknownCall_0x13FE7:
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

UnknownData_0x13FFD:
INCBIN "baserom.gb", $13FFD, $14000 - $13FFD



SECTION "bank05", ROMX, BANK[$05]


UnknownData_0x14000:
INCBIN "baserom.gb", $14000, $14043 - $14000


UnknownJump_0x14043:
	call UnknownCall_0x2ABE
	ld de, $9800
	ld hl, $59E5

UnknownRJump_0x1404C:
	ld a, [hli]
	ld [de], a
	inc de
	ld a, d
	cp $9C
	jr nz, UnknownRJump_0x1404C
	ld a, 7
	ldh_n_a $4B
	ld a, 136
	ldh_n_a $4A
	xor a
	ld [sScrollY], a
	ld a, 195
	ldh_n_a $40
	ld a, 5
	ld [$A267], a
	ld a, 64
	ld [$A266], a
	ld a, 255
	ld [$A468], a
	ld a, 1
	ldh_n_a $9B
	ret

UnknownJump_0x1407C:
	call UnknownCall_0x031C
	ld a, 228
	ld [sBGPalette], a
	ld a, 208
	ld [sOAMPalette1], a
	call UnknownCall_0x14113
	ld a, [$A267]
	cp $05
	ret nc
	and a
	jr z, UnknownRJump_0x140D6
	ldh_a_n $81
	cp $04
	jr z, UnknownRJump_0x140A8
	ldh_a_n $81
	cp $08
	ret nz
	ld a, 25
	ldh_n_a $9B
	ret

UnknownRJump_0x140A8:
UnknownData_0x140A8:
INCBIN "baserom.gb", $140A8, $140D6 - $140A8


UnknownRJump_0x140D6:
	ld a, [$A0F0]
	and $03
	ld b, a
	ld a, 127
	sub b
	ld h, a
	ld l, 0
	ld de, $A300

UnknownRJump_0x140E5:
	ld a, [hli]
	ld [de], a
	inc de
	ld a, l
	and a
	jr nz, UnknownRJump_0x140E5
	ld a, 15
	ld [sSoundDisabled], a
	xor a
	ld [$A2CF], a
	ldh_n_a $97
	ld hl, $4121
	ld a, [$A0F0]
	and $03
	ld e, a
	ld d, 0
	add de
	ld a, [hl]
	ld [sCurLevel], a
	ld a, 255
	ld [$A468], a
	ld a, 11
	ldh_n_a $9B
	ret

UnknownCall_0x14113:
	ld h, 161
	ldh_a_n $8D
	ld l, a

UnknownRJump_0x14119:
	xor a
	ld [hli], a
	ld a, l
	cp $A0
	jr c, UnknownRJump_0x14119
	ret

UnknownData_0x14121:
INCBIN "baserom.gb", $14121, $141E5 - $14121

GFX_TitleScreen: ;$141E5
INCBIN "gfx/titlescreen.2bpp"

INCBIN "baserom.gb", $159E5, $18000 - $159E5


SECTION "bank06", ROMX, BANK[$06]


GFX_Mario: ;$18000
INCBIN "gfx/mario.2bpp"

GFX_MarioDark: ;$18800
INCBIN "gfx/mariodark.2bpp"

GFX_MarioMoon: ;$19000
INCBIN "gfx/mariomoon.2bpp"

GFX_EnemiesClassic: ;$19800
INCBIN "gfx/enemies/classic.2bpp"

GFX_EnemiesTreeZone1: ;$19B80
INCBIN "gfx/enemies/treezone1.2bpp"

GFX_EnemiesTreeZone2: ;$19F00
INCBIN "gfx/enemies/treezone2.2bpp"

GFX_EnemiesTreeZone3: ;$1A280
INCBIN "gfx/enemies/treezone3.2bpp"

GFX_EnemiesTreeZone4: ;$1A600
INCBIN "gfx/enemies/treezone4.2bpp"

GFX_EnemiesTreeZoneBoss: ;$1A980
INCBIN "gfx/enemies/treezoneboss.2bpp"

INCBIN "baserom.gb", $1AD00, $1C000 - $1AD00



SECTION "bank07", ROMX, BANK[$07]


GFX_TilesetLevel1: ;$1C000
INCBIN "gfx/tilesets/level1.2bpp"

GFX_TilesetTreeZone1: ;$1C600
INCBIN "gfx/tilesets/treezone1.2bpp"

GFX_TilesetTreeZone2: ;$1CC00
INCBIN "gfx/tilesets/treezone2.2bpp"

GFX_TilesetTreeZone3: ;$1D200
INCBIN "gfx/tilesets/treezone3.2bpp"

GFX_TilesetTreeZone4: ;$1D800
INCBIN "gfx/tilesets/treezone4.2bpp"

GFX_TilesetTreeZone5: ;$1DE00
INCBIN "gfx/tilesets/treezone5.2bpp"

GFX_TilesetTreeZoneBoss: ;$1E400
INCBIN "gfx/tilesets/treezoneboss.2bpp"

INCBIN "baserom.gb", $1EA00, $20000 - $1EA00



SECTION "bank08", ROMX, BANK[$08]


Level_TileMap_01: ;$20000
INCBIN "tilemaps/mappings/01.bin"

Level_TileMap_02: ;$20200
INCBIN "tilemaps/mappings/02.bin"

Level_TileMap_03: ;$20400
INCBIN "tilemaps/mappings/03.bin"

Level_TileMap_04: ;$20600
INCBIN "tilemaps/mappings/04.bin"

Level_TileMap_05: ;$20800
INCBIN "tilemaps/mappings/05.bin"

Level_TileMap_06: ;$20A00
INCBIN "tilemaps/mappings/06.bin"

Level_TileMap_07: ;$20C00
INCBIN "tilemaps/mappings/07.bin"

Level_TileMap_08: ;$20E00
INCBIN "tilemaps/mappings/08.bin"

Level_TileMap_09: ;$21000
INCBIN "tilemaps/mappings/09.bin"

Level_TileMap_10: ;$21200
INCBIN "tilemaps/mappings/10.bin"

Level_TileMap_11: ;$21400
INCBIN "tilemaps/mappings/11.bin"

Level_TileMap_12: ;$21600
INCBIN "tilemaps/mappings/12.bin"

Level_TileMap_13: ;$21800
INCBIN "tilemaps/mappings/13.bin"

Level_TileMap_14: ;$21A00
INCBIN "tilemaps/mappings/14.bin"

Level_TileMap_15: ;$21C00
INCBIN "tilemaps/mappings/15.bin"

Level_TileMap_16: ;$21E00
INCBIN "tilemaps/mappings/16.bin"

Level_TileMap_17: ;$22000
INCBIN "tilemaps/mappings/17.bin"

Level_TileMap_18: ;$22200
INCBIN "tilemaps/mappings/18.bin"

Level_TileMap_19: ;$22400
INCBIN "tilemaps/mappings/19.bin"

Level_TileMap_20: ;$22600
INCBIN "tilemaps/mappings/20.bin"

Level_TileMap_21: ;$22800
INCBIN "tilemaps/mappings/21.bin"

Level_TileMap_22: ;$22A00
INCBIN "tilemaps/mappings/22.bin"

Level_TileMap_23: ;$22C00
INCBIN "tilemaps/mappings/23.bin"

Level_TileMap_24: ;$22E00
INCBIN "tilemaps/mappings/24.bin"

Level_TileMap_25: ;$23000
INCBIN "tilemaps/mappings/25.bin"

Level_TileMap_26: ;$23200
INCBIN "tilemaps/mappings/26.bin"

Level_TileMap_27: ;$23400
INCBIN "tilemaps/mappings/27.bin"

Level_TileMap_28: ;$23600
INCBIN "tilemaps/mappings/28.bin"

INCBIN "baserom.gb", $23800, $24000 - $23800

SECTION "bank09", ROMX, BANK[$09]


UnknownData_0x24000:
INCBIN "baserom.gb", $24000, $242F0 - $24000
;$242F0 Pointers to levels 
	dw Level_01
	dw Level_26
	dw Level_27
	dw Level_28
	
INCBIN "baserom.gb", $242F8, $24500 - $242F8

Level_01: ;$24500
INCBIN "levels/level01.bin"

Level_26: ;$24E5B
INCBIN "levels/level26.bin"

Level_27: ;$25105
INCBIN "levels/level27.bin"

Level_28: ;$25526
INCBIN "levels/level28.bin"

INCBIN "baserom.gb", $25CF7, $28000 - $25CF7


SECTION "bank0A", ROMX, BANK[$0A]


UnknownData_0x28000:
INCBIN "baserom.gb", $28000, $282F0 - $28000
;$282F0 Pointers to levels 
	dw Level_02
	dw Level_03
	dw Level_04
	
INCBIN "baserom.gb", $282F6, $28500 - $282F6

Level_02: ;$28500
INCBIN "levels/level02.bin"

Level_03: ;$2919B
INCBIN "levels/level03.bin"

Level_04: ;$2AA87
INCBIN "levels/level04.bin"

INCBIN "baserom.gb", $2B215, $2C000 - $2B215



SECTION "bank0B", ROMX, BANK[$0B]


UnknownData_0x2C000:
INCBIN "baserom.gb", $2C000, $2C2F0 - $2C000
;$2C2F0 Pointers to levels 
	dw Level_05
	dw Level_06
	dw Level_31
	dw Level_30
	dw Level_29
	dw Level_32
	
INCBIN "baserom.gb", $2C2FC, $2C500 - $2C2FC

Level_05: ;$2C500
INCBIN "levels/level05.bin"

Level_06: ;$2CCA7
INCBIN "levels/level06.bin"

Level_31: ;$2D192
INCBIN "levels/level31.bin"

Level_30: ;$2D40B
INCBIN "levels/level30.bin"

Level_29: ;$2D8D7
INCBIN "levels/level29.bin"

Level_32: ;$2E0F5
INCBIN "levels/level32.bin"

INCBIN "baserom.gb", $2E6AA, $30000 - $2E6AA

SECTION "bank0C", ROMX, BANK[$0C]


UnknownJump_0x30000:
	call DisableVBlank
	call UnknownCall_0x2B8B
	ld de, $9800
	ld hl, $4A52

UnknownRJump_0x3000C:
	ld a, [hli]
	ld [de], a
	inc de
	ld a, d
	cp $9C
	jr nz, UnknownRJump_0x3000C
	ld a, 228
	ld [sBGPalette], a
	ldh_n_a $47
	ld a, 208
	ld [sOAMPalette1], a
	ldh_n_a $48
	ld a, 56
	ld [sOAMPalette2], a
	ldh_n_a $49
	ld a, 40
	ld [$FF00+$C2], a
	ld a, 16
	ld [$FF00+$C0], a
	call UnknownCall_0x28D9
	xor a
	ld [$A277], a
	ld [sScrollY], a
	ld [sScrollX], a
	ld [$A2C6], a
	ld a, 131
	ldh_n_a $40
	ld a, 5
	ld [$A460], a
	ld a, 13
	ld [$A468], a
	xor a
	ld [sEasyMode], a
	ldh_a_n $9B
	inc a
	ldh_n_a $9B
	ret

UnknownJump_0x3005F:
	ld a, 1
	ld [$FF00+$BB], a
	xor a
	ld [$A2C7], a
	ld a, [sEasyMode]
	cp $01
	jr nz, UnknownRJump_0x3007D
	ld a, 68
	ld [$FF00+$C5], a
	ld a, 48
	ld [$FF00+$C4], a
	ld a, 241
	ld [$FF00+$C6], a
	call UnknownCall_0x2B13

UnknownRJump_0x3007D:
	call UnknownCall_0x3012E
	ld a, [$A2C7]
	and a
	jr nz, UnknownRJump_0x300E6
	ld a, [$FF00+$C0]
	ld [$FF00+$C4], a
	ld a, [$FF00+$C2]
	ld [$FF00+$C5], a
	ld a, [sEasyMode]
	cp $01
	jr nz, UnknownRJump_0x3009B
	ld a, [$FF00+$C6]
	add 32
	ld [$FF00+$C6], a

UnknownRJump_0x3009B:
	ld a, [$A2C6]
	and a
	jr z, UnknownRJump_0x300E1
	ld a, [$A277]
	cp $04
	jr z, UnknownRJump_0x300B4
	ldh_a_n $97
	and $01
	jr nz, UnknownRJump_0x300B4
	ld a, 4
	ld [$A478], a

UnknownRJump_0x300B4:
	ld hl, $412A
	ldh_a_n $97
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
	ld a, [sMarioDirection]
	cp $01
	jr z, UnknownRJump_0x300E1
	ld a, 204
	add b
	ld [$FF00+$C6], a

UnknownRJump_0x300E1:
	call UnknownCall_0x2B13
	jr UnknownRJump_0x300FE

UnknownRJump_0x300E6:
	ld a, [$FF00+$C0]
	ld [$FF00+$C4], a
	ld a, [$FF00+$C2]
	ld [$FF00+$C5], a
	ldh_a_n $97
	and $0C
	srl a
	srl a
	add 207
	ld [$FF00+$C6], a
	call UnknownCall_0x2B13

UnknownRJump_0x300FE:
	ld a, 88
	ld [$FF00+$C4], a
	ld a, 32
	ld [$FF00+$C5], a
	ld a, [$A042]
	ld [$FF00+$C6], a
	call UnknownCall_0x2B3B
	ld a, 64
	ld [$FF00+$C5], a
	ld a, [$A092]
	ld [$FF00+$C6], a
	call UnknownCall_0x2B3B
	ld a, 96
	ld [$FF00+$C5], a
	ld a, [$A0E2]
	ld [$FF00+$C6], a
	call UnknownCall_0x2B3B
	call UnknownCall_0x2B63
	ret

UnknownData_0x3012A:
INCBIN "baserom.gb", $3012A, $3012E - $3012A


UnknownCall_0x3012E:
	ld a, [$A277]
	rst $28

UnknownData_0x30132:
INCBIN "baserom.gb", $30132, $30140 - $30132

	ld a, [$A278]
	dec a
	ld [$A278], a
	jr nz, UnknownRJump_0x30159

UnknownRJump_0x30149:
	ld a, 124
	ld [$FF00+$C0], a
	ld a, 1
	ld [$A277], a
	xor a
	ld [$A2C6], a
	ld [$FF00+$BB], a
	ret

UnknownRJump_0x30159:
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
	cp $40
	jr c, UnknownRJump_0x3017C
	srl a
	srl a
	add 112
	ld [$FF00+$C4], a
	call UnknownCall_0x2B13

UnknownRJump_0x3017C:
	ld a, [$A278]
	and $F0
	swap a
	sub 4
	ld b, a
	ld a, [$A2D1]
	sub b
	ld [$A2D1], a
	ld a, [$A278]
	cp $40
	jr nc, UnknownRJump_0x301A6
	ld a, [$A2D1]
	cp $7C
	jr c, UnknownRJump_0x301A6
	ld a, 124
	ld [$A2D1], a
	ld a, 16
	ld [$FF00+$C6], a
	jr UnknownRJump_0x30149

UnknownRJump_0x301A6:
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
	call UnknownCall_0x2B13
	ret

UnknownData_0x301C2:
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
	jr nz, UnknownRJump_0x30227
	ld a, 21
	ldh_n_a $9B
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

UnknownRJump_0x3020A:
	ld a, [de]
	ld [hli], a
	inc de
	dec b
	jr nz, UnknownRJump_0x3020A
	ld l, e
	ld h, d
	ld a, [hli]
	ld [sCoinLow], a
	ld a, [hli]
	ld [sCoinHigh], a
	ld a, [hli]
	ld [$A2C5], a
	ld a, [hli]
	ld [$A22C], a
	ld a, [hli]
	ld [$A28D], a
	ret

UnknownRJump_0x30227:
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

UnknownRJump_0x30238:
	ld [hli], a
	dec b
	jr nz, UnknownRJump_0x30238
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
	cp $2B
	call z, UnknownCall_0x30291
	ld a, [$A278]
	cp $2B
	jr nc, UnknownRJump_0x3028A
	cp $0B
	jr nc, UnknownRJump_0x302C2
	jr UnknownRJump_0x302AD

UnknownRJump_0x3028A:
	ld a, [$FF00+$C0]
	dec a
	dec a
	ld [$FF00+$C0], a
	ret

UnknownCall_0x30291:
	ld a, [$A2C6]
	xor $FF
	ld [$A2C6], a
	ld a, 255
	ld [sMarioDirection], a
	ld a, 8
	ld [$A460], a
	ld a, [$A2C6]
	and a
	ret z
	xor a
	ld [sEasyMode], a
	ret

UnknownRJump_0x302AD:
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

UnknownRJump_0x302C2:
	ld a, 255
	ld [$A2C7], a
	ret
	ld a, 255
	ld [sMarioDirection], a
	call UnknownCall_0x3040D
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
	ld [sMarioDirection], a
	call UnknownCall_0x3040D
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

UnknownJump_0x3031A:
UnknownRJump_0x3031A:
	ld a, [sMarioDirection]
	xor $FF
	add 2
	sla a
	ld [$FF00+$C6], a
	ret
	ldh_a_n $81
	cp $04
	jp z, UnknownJump_0x3037D
	ldh_a_n $80
	and $30
	jr z, UnknownRJump_0x30342
	ldh_a_n $80
	cp $10
	jp z, UnknownJump_0x30398
	cp $20
	jp z, UnknownJump_0x303B7

UnknownRJump_0x30342:
	ldh_a_n $81
	cp $80
	jr z, UnknownRJump_0x30367
	cp $08
	jr z, UnknownRJump_0x30367
	cp $01
	jr nz, UnknownRJump_0x3031A
	ld a, [$FF00+$C2]
	cp $88
	jr nz, UnknownRJump_0x3031A
	ld a, 4
	ld [$A277], a
	ld a, 55
	ld [$A278], a
	ld a, 1
	ld [$A460], a
	ret

UnknownRJump_0x30367:
	ld a, [$FF00+$C2]
	cp $80
	jr nc, UnknownRJump_0x3031A
	ld a, 5
	ld [$A277], a
	ld a, 64
	ld [$A278], a
	ld a, 5
	ld [$A460], a
	ret

UnknownJump_0x3037D:
	ld a, [$A2C6]
	and a
	ret nz
	ld a, [sEasyMode]
	xor $FF
	and $01
	ld [sEasyMode], a
	ld a, [sMarioDirection]
	xor $FF
	add 2
	sla a
	ld [$FF00+$C6], a
	ret

UnknownJump_0x30398:
	ld a, [$FF00+$C2]
	cp $88
	jp nc, UnknownJump_0x3031A
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

UnknownJump_0x303B7:
	ld a, [$FF00+$C2]
	cp $30
	jp c, UnknownJump_0x3031A
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
	cp $30
	jr c, UnknownRJump_0x303EB
	ld a, 10
	ld [$FF00+$C6], a
	ld a, 1
	ld [$FF00+$BB], a

UnknownRJump_0x303EB:
	ld a, [$FF00+$C0]
	cp $7C
	jr nc, UnknownRJump_0x30400
	add 2
	ld [$FF00+$C0], a
	cp $40
	jr c, UnknownRJump_0x303FF
	ld a, [$FF00+$C0]
	add 1
	ld [$FF00+$C0], a

UnknownRJump_0x303FF:
	ret

UnknownRJump_0x30400:
	ld a, 1
	ld [$A277], a
	ld [sMarioDirection], a
	ld a, 124
	ld [$FF00+$C0], a
	ret

UnknownCall_0x3040D:
	ld a, [$A222]
	add 1
	ld [$A222], a
	cp $0C
	ret c
	xor a
	ld [$A222], a
	ret

UnknownJump_0x3041D:
	ld a, [$A27D]
	bit 7, a
	jr nz, UnknownRJump_0x3042D
	ld a, [$A2C5]
	add 1
	daa
	ld [$A2C5], a

UnknownRJump_0x3042D:
	xor a
	ld [$A299], a
	ld a, 192
	ld [$FF00+$C0], a
	ld hl, $4985
	ld a, [sCurLevel]
	ld e, a
	ld d, 0
	add de
	ld a, [hl]
	ld [$FF00+$C2], a
	xor a
	ld [$A277], a
	ld [$A222], a
	ldh_a_n $9B
	inc a
	ldh_n_a $9B
	ret

UnknownJump_0x30451:
	call UnknownCall_0x3046B
	call UnknownCall_0x307BC
	call UnknownCall_0x2B63
	ret

UnknownJump_0x3045B:
	ld a, [$FF00+$C0]
	ld [$FF00+$C4], a
	ld a, [$FF00+$C2]
	ld [$FF00+$C5], a
	ld a, 1
	ld [$FF00+$BB], a
	call UnknownCall_0x2B13
	ret

UnknownCall_0x3046B:
	ld a, [$A277]
	rst $28

UnknownData_0x3046F:
INCBIN "baserom.gb", $3046F, $30477 - $3046F

	ld a, [$A266]
	and a
	ret nz
	ld a, [$A2CA]
	ld [$A2C9], a
	and a
	jr z, UnknownRJump_0x30494
	dec a
	ld [$A2CA], a
	ld a, 64
	ld [$A266], a
	ld a, 10
	ld [$A478], a
	ret

UnknownRJump_0x30494:
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
	ldh_n_a $9B
	ret
	ld a, [$A267]
	ld b, a
	ld a, [$A266]
	or b
	jr nz, UnknownRJump_0x3050A
	ld a, 208
	ld [sOAMPalette1], a
	ld hl, $44F1
	ld a, [sCurLevel]
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
	cp $05
	jr z, UnknownRJump_0x304DD
	ld a, 20
	ldh_n_a $9B
	ret

UnknownRJump_0x304DD:
	ld a, [$A277]
	inc a
	ld [$A277], a
	ld a, 64
	ld [$A266], a
	ld a, 5
	ld [$A2CA], a
	jp UnknownJump_0x3045B

UnknownData_0x304F1:
INCBIN "baserom.gb", $304F1, $3050A - $304F1


UnknownRJump_0x3050A:
	ld hl, $499D
	ld a, [sCurLevel]
	ld e, a
	ld d, 0
	add de
	ld a, [hl]
	ld [$FF00+$C0], a
	ld hl, $49B5
	ld a, [sCurLevel]
	ld e, a
	ld d, 0
	add de
	ld a, [hl]
	ld [$FF00+$C6], a
	ld a, 208
	ld [sOAMPalette1], a
	ldh_a_n $97
	and $1F
	cp $04
	jp nc, UnknownJump_0x3045B
	ld a, 0
	ld [sOAMPalette1], a
	jp UnknownJump_0x3045B
	ld a, [$FF00+$C0]
	ld [$FF00+$C4], a
	ld a, [$FF00+$C2]
	ld [$FF00+$C5], a
	ld a, 1
	ld [$FF00+$BB], a
	ldh_a_n $97
	and $04
	srl a
	srl a
	add 197
	ld [$FF00+$C6], a
	call UnknownCall_0x2B13
	ld a, [$A222]
	add 8
	ld [$A222], a
	cp $50
	jr c, UnknownRJump_0x30567
	xor a
	ld [$A222], a

UnknownRJump_0x30567:
	ld a, [$A222]
	and $F0
	swap a
	add 191
	ld [$FF00+$C6], a
	ld hl, $499D
	ld a, [sCurLevel]
	ld e, a
	ld d, 0
	add de
	ld a, [hl]
	ld b, a
	ld a, [$FF00+$C0]
	cp b
	jr z, UnknownRJump_0x30593
	ldh_a_n $97
	bit 0, a
	jp nz, UnknownJump_0x3045B
	ld a, [$FF00+$C0]
	inc a
	ld [$FF00+$C0], a
	jp UnknownJump_0x3045B

UnknownRJump_0x30593:
	ld a, 15
	ld [$A468], a
	ld a, [$A2CB]
	cp $05
	jr nz, UnknownRJump_0x305A4
	ld a, 26
	ld [$A468], a

UnknownRJump_0x305A4:
	ld a, 1
	ld [$A277], a
	ld a, 1
	ld [$A267], a
	ld a, 255
	ld [$A266], a
	jp UnknownJump_0x3045B

UnknownJump_0x305B6:
	call DisableVBlank
	ld bc, $1800
	ld hl, $4C92
	ld de, $8000
	call CopyMem
	ld de, $9800
	ld hl, $6492

UnknownRJump_0x305CB:
	ld a, [hli]
	ld [de], a
	inc de
	ld a, d
	cp $9B
	jr nz, UnknownRJump_0x305CB
	xor a
	ld [$A2CC], a
	ld a, [$A84D]
	bit 7, a
	jr z, UnknownRJump_0x30629
	ld a, [$A851]
	bit 7, a
	jr z, UnknownRJump_0x30629
	ld a, [$A865]
	bit 7, a
	jr z, UnknownRJump_0x30629
	ld a, [$A85F]
	bit 7, a
	jr z, UnknownRJump_0x30629
	ld a, [$A859]
	bit 7, a
	jr z, UnknownRJump_0x30629
	ld a, [$A856]
	bit 7, a
	jr z, UnknownRJump_0x30629
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

UnknownRJump_0x30629:
	ld a, 228
	ld [sBGPalette], a
	ldh_n_a $47
	ld a, 208
	ld [sOAMPalette1], a
	ldh_n_a $48
	ld a, 56
	ld [sOAMPalette2], a
	ldh_n_a $49
	xor a
	ld [sScrollY], a
	ldh_n_a $42
	ld [sScrollX], a
	ldh_n_a $43
	ld [$A26E], a
	ld a, 64
	ld [$A278], a
	xor a
	ld [$A277], a
	ld a, 88
	ld [$FF00+$C2], a
	ldh_a_n $9B
	cp $1D
	jr z, UnknownRJump_0x3066A
	ld a, 255
	ld [$A468], a

UnknownRJump_0x3066A:
	call UnknownCall_0x2B77
	ld a, 195
	ldh_n_a $40
	ldh_a_n $9B
	inc a
	ldh_n_a $9B
	ret

UnknownJump_0x3067A:
	call UnknownCall_0x30693
	ld a, [$FF00+$C0]
	ld [$FF00+$C4], a
	ld a, [$FF00+$C2]
	ld [$FF00+$C5], a
	ld a, 1
	ld [$FF00+$BB], a
	call UnknownCall_0x2B13
	call UnknownCall_0x307BC
	call UnknownCall_0x2B63
	ret

UnknownCall_0x30693:
	ld a, [$A277]
	rst $28

UnknownData_0x30697:
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
	ld [sBGPalette], a
	ld a, [hli]
	ld [sOAMPalette1], a
	ld a, [hl]
	ld [sOAMPalette2], a
	ld a, 187
	ld [$FF00+$C6], a
	ld a, [$A266]
	and a
	ret nz
	ld a, 24
	ld [sCurLevel], a
	ld a, 22
	ldh_n_a $9B
	ret

UnknownData_0x306D1:
INCBIN "baserom.gb", $306D1, $306E1 - $306D1

	ld a, 187
	ld [$FF00+$C6], a
	ld a, [$A2CB]
	cp $06
	jr nz, UnknownRJump_0x30700
	ldh_a_n $81
	and $49
	jr z, UnknownRJump_0x30700
	ld a, [$A277]
	inc a
	ld [$A277], a
	ld a, 64
	ld [$A266], a
	ret

UnknownRJump_0x30700:
	ldh_a_n $81
	cp $80
	ret nz
	ld a, 1
	ld [$A277], a
	ld a, 64
	ld [$A278], a
	ret
	ldh_a_n $97
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
	jr z, UnknownRJump_0x30736
	srl a
	ld b, a
	ld a, 168
	sub b
	ld [$FF00+$C0], a
	ret

UnknownRJump_0x30736:
	ld a, 20
	ldh_n_a $9B
	xor a
	ld [$A266], a
	ld [$A267], a
	ld a, 1
	ld [$A224], a
	ret

UnknownData_0x30748:
INCBIN "baserom.gb", $30748, $3074C - $30748

	ldh_a_n $97
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
	jr z, UnknownRJump_0x30771
	srl a
	ld b, a
	ld a, 136
	add b
	ld [$FF00+$C0], a
	ret

UnknownRJump_0x30771:
	ld a, 2
	ld [$A277], a
	ret

UnknownData_0x30777:
INCBIN "baserom.gb", $30777, $307BC - $30777


UnknownCall_0x307BC:
	xor a
	ld [$A2CB], a
	ld a, 1
	ld [$FF00+$BB], a
	ld a, [$A84D]
	bit 7, a
	jr z, UnknownRJump_0x307E4
	ld a, [$498A]
	ld [$FF00+$C5], a
	ld a, [$49A2]
	ld [$FF00+$C4], a
	ld a, [$49BA]
	ld [$FF00+$C6], a
	call UnknownCall_0x2B13
	ld a, [$A2CB]
	inc a
	ld [$A2CB], a

UnknownRJump_0x307E4:
	ld a, [$A851]
	bit 7, a
	jr z, UnknownRJump_0x30804
	ld a, [$498E]
	ld [$FF00+$C5], a
	ld a, [$49A6]
	ld [$FF00+$C4], a
	ld a, [$49BE]
	ld [$FF00+$C6], a
	call UnknownCall_0x2B13
	ld a, [$A2CB]
	inc a
	ld [$A2CB], a

UnknownRJump_0x30804:
	ld a, [$A865]
	bit 7, a
	jr z, UnknownRJump_0x30824
	ld a, [$4992]
	ld [$FF00+$C5], a
	ld a, [$49AA]
	ld [$FF00+$C4], a
	ld a, [$49C2]
	ld [$FF00+$C6], a
	call UnknownCall_0x2B13
	ld a, [$A2CB]
	inc a
	ld [$A2CB], a

UnknownRJump_0x30824:
	ld a, [$A85F]
	bit 7, a
	jr z, UnknownRJump_0x30844
	ld a, [$4995]
	ld [$FF00+$C5], a
	ld a, [$49AD]
	ld [$FF00+$C4], a
	ld a, [$49C5]
	ld [$FF00+$C6], a
	call UnknownCall_0x2B13
	ld a, [$A2CB]
	inc a
	ld [$A2CB], a

UnknownRJump_0x30844:
	ld a, [$A859]
	bit 7, a
	jr z, UnknownRJump_0x30864
	ld a, [$4998]
	ld [$FF00+$C5], a
	ld a, [$49B0]
	ld [$FF00+$C4], a
	ld a, [$49C8]
	ld [$FF00+$C6], a
	call UnknownCall_0x2B13
	ld a, [$A2CB]
	inc a
	ld [$A2CB], a

UnknownRJump_0x30864:
	ld a, [$A856]
	bit 7, a
	ret z
	ld a, [$499C]
	ld [$FF00+$C5], a
	ld a, [$49B4]
	ld [$FF00+$C4], a
	ld a, [$49CC]
	ld [$FF00+$C6], a
	call UnknownCall_0x2B13
	ld a, [$A2CB]
	inc a
	ld [$A2CB], a
	ret

UnknownCall_0x30884:
	xor a
	ld [$A2D3], a
	ld a, [$A267]
	and a
	jr nz, UnknownRJump_0x3089A
	ld a, [$A266]
	cp $80
	jr nc, UnknownRJump_0x3089A
	sub 128
	ld [$A2D3], a

UnknownRJump_0x3089A:
	ld a, 1
	ld [$FF00+$BB], a
	ld a, [$A2B5]
	bit 5, a
	jr z, UnknownRJump_0x308C3
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
	jr z, UnknownRJump_0x308C0
	call UnknownCall_0x3097C

UnknownRJump_0x308C0:
	call UnknownCall_0x2B13

UnknownRJump_0x308C3:
	ld a, [$A2B5]
	bit 4, a
	jr z, UnknownRJump_0x308E8
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
	jr z, UnknownRJump_0x308E5
	call UnknownCall_0x3097C

UnknownRJump_0x308E5:
	call UnknownCall_0x2B13

UnknownRJump_0x308E8:
	ld a, [$A2B5]
	bit 3, a
	jr z, UnknownRJump_0x3090D
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
	jr z, UnknownRJump_0x3090A
	call UnknownCall_0x3097C

UnknownRJump_0x3090A:
	call UnknownCall_0x2B13

UnknownRJump_0x3090D:
	ld a, [$A2B5]
	bit 2, a
	jr z, UnknownRJump_0x30932
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
	jr z, UnknownRJump_0x3092F
	call UnknownCall_0x3097C

UnknownRJump_0x3092F:
	call UnknownCall_0x2B13

UnknownRJump_0x30932:
	ld a, [$A2B5]
	bit 1, a
	jr z, UnknownRJump_0x30957
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
	jr z, UnknownRJump_0x30954
	call UnknownCall_0x3097C

UnknownRJump_0x30954:
	call UnknownCall_0x2B13

UnknownRJump_0x30957:
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
	jr z, UnknownRJump_0x30978
	call UnknownCall_0x3097C

UnknownRJump_0x30978:
	call UnknownCall_0x2B13
	ret

UnknownCall_0x3097C:
	and $06
	srl a
	add 222
	ld [$FF00+$C6], a
	ret

UnknownData_0x30985:
INCBIN "baserom.gb", $30985, $309CD - $30985


UnknownJump_0x309CD:
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

UnknownRJump_0x309E1:
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, UnknownRJump_0x309E1
	ld de, $99A8
	ld b, 4

UnknownRJump_0x309EC:
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, UnknownRJump_0x309EC
	ld de, $9988
	ld b, 4

UnknownRJump_0x309F7:
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, UnknownRJump_0x309F7
	ld de, $9968
	ld b, 4

UnknownRJump_0x30A02:
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, UnknownRJump_0x30A02
	ld de, $9948
	ld b, 4

UnknownRJump_0x30A0D:
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, UnknownRJump_0x30A0D
	xor a
	ld [$A2C9], a
	call $FFA0
	ld a, [$A24E] ;prepare bank switch
	ld [$2100], a
	ld a, 1
	ldh_n_a $82
	pop hl
	pop de
	pop bc
	pop af
	reti

UnknownData_0x30A2A:
INCBIN "baserom.gb", $30A2A, $34000 - $30A2A



SECTION "bank0D", ROMX, BANK[$0D]


GFX_OW_Overworld: ;$34000
INCBIN "gfx/overworld/overworld.2bpp"

INCBIN "baserom.gb", $35800, $35A00 - $35800

GFX_OW_MacroZone: ;$35A00
INCBIN "gfx/overworld/macrozone.2bpp"

TileMapping_Overworld1x1: ;$37000
INCBIN "tilemaps/overworld/overworld1x1.bin"

TileMapping_Overworld2x1: ;$37400
INCBIN "tilemaps/overworld/overworld2x1.bin"

TileMapping_Overworld1x2: ;$37800
INCBIN "tilemaps/overworld/overworld1x2.bin"

TileMapping_Overworld2x2: ;$37C00
INCBIN "tilemaps/overworld/overworld2x2.bin"


SECTION "bank0E", ROMX, BANK[$0E]


UnknownData_0x38000:
INCBIN "baserom.gb", $38000, $38200 - $38000

GFX_OW_PumpkinZone: ;$38200
INCBIN "gfx/overworld/pumpkinzone.2bpp"

INCBIN "baserom.gb", $39800, $39A00 - $39800

GFX_OW_TreeZone: ;$39A000
INCBIN "gfx/overworld/treezone.2bpp"

TileMapping_PumpkinZone: ;$3B000
INCBIN "tilemaps/overworld/pumpkinzone.bin"

TileMapping_TreeZone:
INCBIN "tilemaps/overworld/treezone.bin"

TileMapping_SpaceZone:
INCBIN "tilemaps/overworld/spacezone.bin"

TileMapping_MacroZone:
INCBIN "tilemaps/overworld/macrozone.bin"

TileMapping_TurtleZone:
INCBIN "tilemaps/overworld/turtlezone.bin"

TileMapping_MarioZone:
INCBIN "tilemaps/overworld/mariozone.bin"

TileMapping_WarioCastle:
INCBIN "tilemaps/overworld/wariocastle.bin"

INCBIN "baserom.gb", $3BFC0, $3C000 - $3BFC0



SECTION "bank0F", ROMX, BANK[$0F]


UnknownJump_0x3C000:
	ld a, [$A68B]
	or a
	jp z, UnknownJump_0x3C04D
	cp $01
	jp z, UnknownJump_0x3C063
	cp $02
	jp z, UnknownJump_0x3C06F
	cp $03
	jp z, UnknownJump_0x3C07B
	cp $04
	jp z, UnknownJump_0x3C087
	cp $05
	jp z, UnknownJump_0x3C093
	cp $06
	jp z, UnknownJump_0x3C09F
	cp $07
	jp z, UnknownJump_0x3C0AB
	cp $08
	jp z, UnknownJump_0x3C0B7
	cp $09
	jp z, UnknownJump_0x3C0C3
	cp $0A
	jp z, UnknownJump_0x3C0CA
	cp $0B
	jp z, UnknownJump_0x3C0D1
	cp $0C
	jp z, UnknownJump_0x3C0D8
	cp $0D
	jp z, UnknownJump_0x3C0DF
	cp $0E
	jp z, UnknownJump_0x3C10E

UnknownJump_0x3C04D:
	call UnknownCall_0x3ED4C
	call UnknownCall_0x3C38C
	ld a, [$A68B]
	or a
	jp nz, UnknownJump_0x3C169
	call UnknownCall_0x3C13E
	call UnknownCall_0x3CFC8
	jp UnknownJump_0x3C169

UnknownJump_0x3C063:
	call UnknownCall_0x3C13E
	call UnknownCall_0x3D8E6
	call UnknownCall_0x3C38C
	jp UnknownJump_0x3C169

UnknownJump_0x3C06F:
	call UnknownCall_0x3C13E
	call UnknownCall_0x3DA2D
	call UnknownCall_0x3C38C
	jp UnknownJump_0x3C169

UnknownJump_0x3C07B:
	call UnknownCall_0x3C13E
	call UnknownCall_0x3DB12
	call UnknownCall_0x3C38C
	jp UnknownJump_0x3C169

UnknownJump_0x3C087:
	call UnknownCall_0x3C13E
	call UnknownCall_0x3DB40
	call UnknownCall_0x3C38C
	jp UnknownJump_0x3C169

UnknownJump_0x3C093:
	call UnknownCall_0x3C13E
	call UnknownCall_0x3DDD3
	call UnknownCall_0x3C38C
	jp UnknownJump_0x3C169

UnknownJump_0x3C09F:
	call UnknownCall_0x3C13E
	call UnknownCall_0x3DEC7
	call UnknownCall_0x3C38C
	jp UnknownJump_0x3C169

UnknownJump_0x3C0AB:
	call UnknownCall_0x3C13E
	call UnknownCall_0x3DFE8
	call UnknownCall_0x3C38C
	jp UnknownJump_0x3C169

UnknownJump_0x3C0B7:
	call UnknownCall_0x3C13E
	call UnknownCall_0x3DD8C
	call UnknownCall_0x3C38C
	jp UnknownJump_0x3C169

UnknownJump_0x3C0C3:
	call UnknownCall_0x3C13E
	call UnknownCall_0x3DDC3
	ret

UnknownJump_0x3C0CA:
	call UnknownCall_0x3C13E
	call UnknownCall_0x3DDC7
	ret

UnknownJump_0x3C0D1:
	call UnknownCall_0x3C13E
	call UnknownCall_0x3DDCB
	ret

UnknownJump_0x3C0D8:
	call UnknownCall_0x3C13E
	call UnknownCall_0x3DDCF
	ret

UnknownJump_0x3C0DF:
	call UnknownCall_0x3C13E
	ld a, 24
	ld hl, $4512
	call UnknownCall_0x3E00
	ld a, [$A7A6]
	cp $04
	jr c, UnknownRJump_0x3C101
	cp $07
	jr nc, UnknownRJump_0x3C101
	ldh_a_n $80
	and $20
	jr z, UnknownRJump_0x3C101

UnknownData_0x3C0FC:
INCBIN "baserom.gb", $3C0FC, $3C101 - $3C0FC


UnknownRJump_0x3C101:
	ld a, [$A7A6]
	cp $0A
	ret nz
	call UnknownCall_0x3E9FB
	call UnknownCall_0x3EF2B
	ret

UnknownJump_0x3C10E:
	call UnknownCall_0x3C13E
	ld a, 24
	ld hl, $4028
	call UnknownCall_0x3E00
	ld a, [$A7A6]
	cp $05
	jr nz, UnknownRJump_0x3C131
	ldh_a_n $80
	and $20
	jr z, UnknownRJump_0x3C131

UnknownData_0x3C127:
INCBIN "baserom.gb", $3C127, $3C131 - $3C127


UnknownRJump_0x3C131:
	ld a, [$A7A6]
	cp $0A
	ret nz
	call UnknownCall_0x3E9FB
	call UnknownCall_0x3EF2B
	ret

UnknownCall_0x3C13E:
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

UnknownJump_0x3C169:
	ei
	ld a, [$A690]
	or a
	ret nz
	ldh_a_n $81
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
	jr z, UnknownRJump_0x3C1A2
	ld a, e
	cp $05
	ret z
	cp $09
	ret z
	cp $0E
	ret z
	cp $17
	ret z
	cp $1D
	ret z
	cp $11
	ret z

UnknownRJump_0x3C1A2:
	xor a
	ld [$A27D], a
	ld a, [$A840]
	ld hl, $4218
	ld d, 0
	ld e, a
	add de
	ld a, [hl]
	cp $FE
	jr z, UnknownRJump_0x3C201
	ld [sCurLevel], a
	ld a, c
	ld [$A27D], a
	ld a, 255
	ld [$A468], a
	call UnknownCall_0x2AAA
	ld a, [$A68B]
	cp $03
	jr z, UnknownRJump_0x3C1EC
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

UnknownRJump_0x3C1EC:
	ld a, 22
	ld [$A460], a
	call UnknownCall_0x3E9FB
	call UnknownCall_0x2934
	ld a, 7
	ld [$FF00+$4B], a
	ld a, 22
	ldh_n_a $9B
	ret

UnknownRJump_0x3C201:
	ldh_a_n $81
	and $01
	ret z
	ld a, 16
	ld [$A7B8], a
	ld a, [$A840]
	cp $6E
	ret c
	ld a, 2
	ld [$A460], a
	ret

UnknownData_0x3C218:
INCBIN "baserom.gb", $3C218, $3C29A - $3C218


UnknownCall_0x3C29A:
	ld a, 16
	ldh_n_a $81
	ret

UnknownCall_0x3C2A0:
	ld a, 32
	ldh_n_a $81
	ret

UnknownCall_0x3C2A6:
	ld a, 128
	ldh_n_a $81
	ret

UnknownCall_0x3C2AC:
	ld a, 64
	ldh_n_a $81
	ret

UnknownCall_0x3C2B2:
	ld a, 8
	ldh_n_a $81
	ret

UnknownCall_0x3C2B8:
	ldh_a_n $81
	bit 4, a
	jr z, UnknownRJump_0x3C2D0
	ld a, [$A855]
	bit 7, a
	ret z
	ld a, 54
	ld [$A840], a
	ld a, 16
	ldh_n_a $81
	ret

UnknownRJump_0x3C2D0:
	ldh_a_n $81
	bit 5, a
	ret z
	ld a, [$A86B]
	bit 7, a
	ret z
	ld a, 55
	ld [$A840], a
	ld a, 32
	ldh_n_a $81
	ret

UnknownCall_0x3C2E7:
	ldh_a_n $81
	bit 6, a
	ret z
	ld a, [$A853]
	bit 0, a
	ret z
	ld a, 57
	ld [$A840], a
	ld a, 64
	ldh_n_a $81
	ret

UnknownCall_0x3C2FE:
	ldh_a_n $81
	bit 4, a
	ret z
	ld a, [$A86B]
	bit 7, a
	ret z
	ld a, 108
	ld [$A840], a
	ld a, 16
	ldh_n_a $81
	ret

UnknownData_0x3C315:
INCBIN "baserom.gb", $3C315, $3C316 - $3C315


UnknownJump_0x3C316:
	ld a, [$A690]
	or a
	jp nz, UnknownJump_0x3C4CC
	ld a, [$A848]
	bit 7, a
	jp z, UnknownJump_0x3C4CC

UnknownData_0x3C325:
INCBIN "baserom.gb", $3C325, $3C32D - $3C325


UnknownCall_0x3C32D:
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
	cp $FE
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
	ldh_n_a $81
	ret

UnknownData_0x3C364:
INCBIN "baserom.gb", $3C364, $3C38C - $3C364


UnknownCall_0x3C38C:
	ei
	ld a, [$A840]
	cp $14
	call z, UnknownCall_0x3C2AC
	ld a, [$A840]
	cp $35
	call z, UnknownCall_0x3C2B8
	ld a, [$A840]
	cp $32
	call z, UnknownCall_0x3C2E7
	ld a, [$A840]
	cp $6A
	call z, UnknownCall_0x3C2FE
	ld a, [$A840]
	cp $17
	call z, UnknownCall_0x3C2A0
	ld a, [$A840]
	cp $4B
	call z, UnknownCall_0x3C2A6
	ld a, [$A840]
	cp $2C
	call z, UnknownCall_0x3C2A6
	ld a, [$A840]
	cp $4A
	call z, UnknownCall_0x3C2AC
	ld a, [$A840]
	cp $2F
	call z, UnknownCall_0x3C2AC
	ld a, [$A840]
	cp $31
	call z, UnknownCall_0x3C2A6
	ld a, [$A840]
	cp $38
	call z, UnknownCall_0x3C2A6
	ld a, [$A840]
	cp $2E
	call z, UnknownCall_0x3C2AC
	ld a, [$A840]
	cp $6B
	call z, UnknownCall_0x3C2AC
	ld a, [$A840]
	cp $47
	call z, UnknownCall_0x3C2AC
	ld a, [$A840]
	cp $65
	call z, UnknownCall_0x3C2A0
	ld a, [$A840]
	cp $45
	call z, UnknownCall_0x3C2A0
	ld a, [$A840]
	cp $27
	call z, UnknownCall_0x3C2A0
	ld a, [$A840]
	cp $67
	call z, UnknownCall_0x3C2B2
	ld a, [$A840]
	cp $5B
	call z, UnknownCall_0x3C2B2
	ld a, [$A840]
	cp $5A
	call z, UnknownCall_0x3C2AC
	ld a, [$A840]
	cp $68
	call z, UnknownCall_0x3C29A
	ld a, [$A840]
	cp $25
	call z, UnknownCall_0x3C29A
	ld a, [$A840]
	cp $6C
	call z, UnknownCall_0x3C29A
	ld a, [$A840]
	cp $43
	call z, UnknownCall_0x3C29A
	ld a, [$A840]
	cp $79
	call z, UnknownCall_0x3C29A
	ld a, [$A840]
	cp $69
	call z, UnknownCall_0x3C2A6
	ld a, [$A840]
	cp $73
	call z, UnknownCall_0x3C2A0
	ld a, [$A840]
	cp $72
	call z, UnknownCall_0x3C29A
	ld a, [$A840]
	cp $3F
	call z, UnknownCall_0x3C29A
	ld a, [$A840]
	cp $74
	call z, UnknownCall_0x3C2A0
	ld a, [$A840]
	cp $75
	call z, UnknownCall_0x3C29A
	ld a, [$A840]
	cp $11
	call z, UnknownCall_0x3C2B2
	ld a, [$A840]
	cp $02
	call z, UnknownCall_0x3C2B2
	ld a, [$A840]
	cp $0C
	call z, UnknownCall_0x3C2B2
	ld a, [$A840]
	cp $0B
	call z, UnknownCall_0x3C2B2
	ld a, [$A840]
	cp $09
	call z, UnknownCall_0x3C2B2
	ld a, [$A840]
	cp $06
	call z, UnknownCall_0x3C2B2
	ld a, [$A840]
	cp $64
	call z, UnknownCall_0x3C29A
	ld a, [$A840]
	cp $1E
	call nc, UnknownCall_0x3C32D
	ld a, [$A840]
	or a
	jp z, UnknownJump_0x3C316

UnknownJump_0x3C4CC:
	ld a, [$A690]
	or a
	jp nz, UnknownJump_0x3C7EC
	call UnknownCall_0x3E1D7
	or a
	jp z, UnknownJump_0x3C5DA
	ld a, [$A840]
	cp $0C
	jr z, UnknownRJump_0x3C4E7
	cp $1E
	jr z, UnknownRJump_0x3C4E7
	jr UnknownRJump_0x3C505

UnknownRJump_0x3C4E7:
	ldh_a_n $81
	and $F6
	jr nz, UnknownRJump_0x3C505
	ldh_a_n $81
	and $09
	jr z, UnknownRJump_0x3C505
	ld a, 1
	ld [$A789], a
	ld a, 25
	ld [$A468], a
	ld bc, $5BF6
	jp UnknownJump_0x3C588

UnknownRJump_0x3C505:
	ld a, [$A68B]
	or a
	jr nz, UnknownRJump_0x3C52B
	ldh_a_n $80
	bit 1, a
	jp nz, UnknownJump_0x3C5B2
	ld a, [$A7A0]
	or a
	jr z, UnknownRJump_0x3C52B
	ld a, [$A840]
	ld [$A840], a
	call UnknownCall_0x3EEA4
	call UnknownCall_0x3ED4C
	call UnknownCall_0x3F156
	call UnknownCall_0x3EA9A

UnknownRJump_0x3C52B:
	xor a
	ld [$A7A0], a
	ldh_a_n $81
	and $F0
	jp z, UnknownJump_0x3C5DA
	ldh_a_n $81
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
	bit 1, d
	jr z, UnknownRJump_0x3C560
	ld c, 2
	jr UnknownRJump_0x3C56E

UnknownRJump_0x3C560:
	bit 2, d
	jr z, UnknownRJump_0x3C568
	ld c, 4
	jr UnknownRJump_0x3C56E

UnknownRJump_0x3C568:
	bit 3, d
	jr z, UnknownRJump_0x3C56E
	ld c, 6

UnknownRJump_0x3C56E:
	add bc
	ld a, 24
	call UnknownCall_0x3E7B
	ei
	ld c, a
	inc hl
	ld a, 24
	call UnknownCall_0x3E7B
	ei
	ld b, a
	ld a, b
	xor $FF
	ld d, a
	ld a, c
	xor $FF
	or d
	jr z, UnknownRJump_0x3C5DA

UnknownJump_0x3C588:
	ld hl, $A692
	ld [hl], c
	inc hl
	ld [hl], b
	ld a, 24
	call UnknownCall_0x3E8F
	ei
	ld d, a
	ld [$A844], a
	ld a, 255
	ld [$A690], a
	ld a, 9
	ld [$A694], a
	ld a, d
	and $F0
	cp $10
	jp nz, UnknownJump_0x3C7EC
	ld a, 5
	ld [$A694], a
	jp UnknownJump_0x3C7EC

UnknownJump_0x3C5B2:
	ld a, 255
	ld [$A7A0], a
	ldh_a_n $80
	bit 4, a
	call nz, UnknownCall_0x3CA37
	ldh_a_n $80
	bit 5, a
	call nz, UnknownCall_0x3CA63
	ldh_a_n $80
	bit 6, a
	call nz, UnknownCall_0x3CA8A
	ldh_a_n $80
	bit 7, a
	call nz, UnknownCall_0x3CAB1
	jp UnknownJump_0x3C9F4

UnknownJump_0x3C5DA:
UnknownRJump_0x3C5DA:
	ld a, [$A840]
	cp $15
	call z, UnknownCall_0x3C2B2
	ld a, [$A840]
	cp $0D
	jr nz, UnknownRJump_0x3C5F4
	call UnknownCall_0x3C2B2
	ld a, [$A789]
	or a
	jr z, UnknownRJump_0x3C5F4
	jr UnknownRJump_0x3C60B

UnknownRJump_0x3C5F4:
	ldh_a_n $81
	and $09
	jp z, UnknownJump_0x3C66C
	ld a, [$A68B]
	or a
	jp z, UnknownJump_0x3C60B
	cp $08
	jp z, UnknownJump_0x3C60B
	jp UnknownJump_0x3C66C

UnknownJump_0x3C60B:
UnknownRJump_0x3C60B:
	ld a, [$A840]
	cp $02
	jp z, UnknownJump_0x3D0D7
	cp $19
	jp z, UnknownJump_0x3D0D7
	cp $09
	jp z, UnknownJump_0x3D1E0
	cp $1C
	jp z, UnknownJump_0x3D1E0
	cp $06
	jp z, UnknownJump_0x3D33A
	cp $1B
	jp z, UnknownJump_0x3D33A
	cp $12
	jp z, UnknownJump_0x3D477
	cp $0D
	jp z, UnknownJump_0x3D5EC
	cp $67
	jp z, UnknownJump_0x3D5D0
	cp $0B
	jp z, UnknownJump_0x3D760
	cp $1D
	jp z, UnknownJump_0x3D760
	cp $15
	jp z, UnknownJump_0x3D848
	cp $6E
	jp z, UnknownJump_0x3F45E
	cp $6F
	jp z, UnknownJump_0x3F427
	cp $70
	jp z, UnknownJump_0x3F3F0
	cp $71
	jp z, UnknownJump_0x3F3B9
	cp $11
	jr nz, UnknownRJump_0x3C66C
	ld a, [$A68B]
	or a
	jp nz, UnknownJump_0x3C66C
	jp UnknownJump_0x3D6C3

UnknownJump_0x3C66C:
UnknownRJump_0x3C66C:
	ld a, [$A68B]
	or a
	jp z, UnknownJump_0x3C7D9
	ld a, [$A840]
	cp $23
	jp z, UnknownJump_0x3C6B0
	cp $28
	jp z, UnknownJump_0x3C6CA
	cp $2D
	jp z, UnknownJump_0x3C6E4
	cp $30
	jp z, UnknownJump_0x3C6F6
	cp $32
	jp z, UnknownJump_0x3C708
	cp $40
	jp z, UnknownJump_0x3C731
	cp $46
	jp z, UnknownJump_0x3C743
	cp $4A
	jp z, UnknownJump_0x3C75D
	cp $50
	jp z, UnknownJump_0x3C76F
	cp $5C
	jp z, UnknownJump_0x3C789
	cp $74
	jp z, UnknownJump_0x3C7A3
	jp UnknownJump_0x3C7D9

UnknownJump_0x3C6B0:
	ldh_a_n $81
	cp $80
	jp nz, UnknownJump_0x3C7D9
	ld a, 8
	call UnknownCall_0x3E2F7

UnknownJump_0x3C6BD:
	ld a, 25
	call UnknownCall_0x3C7CA
	ld a, 8
	ld [$A844], a
	jp UnknownJump_0x3C7BD

UnknownJump_0x3C6CA:
	ldh_a_n $81
	cp $80
	jp nz, UnknownJump_0x3C7D9
	ld a, 8
	call UnknownCall_0x3E2F7

UnknownJump_0x3C6D7:
	ld a, 28
	call UnknownCall_0x3C7CA
	ld a, 8
	ld [$A844], a
	jp UnknownJump_0x3C7BD

UnknownJump_0x3C6E4:
	ld a, 8
	call UnknownCall_0x3E2F7
	ld a, 121
	call UnknownCall_0x3C7CA
	ld a, 8
	ld [$A844], a
	jp UnknownJump_0x3C7BD

UnknownJump_0x3C6F6:
	ld a, 4
	call UnknownCall_0x3E2F7
	ld a, 122
	call UnknownCall_0x3C7CA
	ld a, 8
	ld [$A844], a
	jp UnknownJump_0x3C7BD

UnknownJump_0x3C708:
	ldh_a_n $81
	cp $20
	jp nz, UnknownJump_0x3C7D9
	ld a, 34
	ld [$A844], a
	ld a, 255
	ld [$A690], a
	ld a, 2
	call UnknownCall_0x3E2F7
	ld a, 0
	ld [$A690], a

UnknownJump_0x3C724:
	ld a, 27
	call UnknownCall_0x3C7CA
	ld a, 34
	ld [$A844], a
	jp UnknownJump_0x3C7BD

UnknownJump_0x3C731:
	ld a, 2
	call UnknownCall_0x3E2F7

UnknownJump_0x3C736:
	ld a, 26
	call UnknownCall_0x3C7CA
	ld a, 2
	ld [$A844], a
	jp UnknownJump_0x3C7BD

UnknownJump_0x3C743:
	ldh_a_n $81
	cp $40
	jp nz, UnknownJump_0x3C7D9
	ld a, 4
	call UnknownCall_0x3E2F7

UnknownJump_0x3C750:
	ld a, 30
	call UnknownCall_0x3C7CA
	ld a, 4
	ld [$A844], a
	jp UnknownJump_0x3C7BD

UnknownJump_0x3C75D:
	ld a, 4
	call UnknownCall_0x3E2F7
	ld a, 101
	call UnknownCall_0x3C7CA
	ld a, 4
	ld [$A844], a
	jp UnknownJump_0x3C7BD

UnknownJump_0x3C76F:
	ldh_a_n $81
	cp $20
	jp nz, UnknownJump_0x3C7D9
	ld a, 2
	call UnknownCall_0x3E2F7

UnknownJump_0x3C77C:
	ld a, 29
	call UnknownCall_0x3C7CA
	ld a, 2
	ld [$A844], a
	jp UnknownJump_0x3C7BD

UnknownJump_0x3C789:
	ldh_a_n $81
	and $90
	jp z, UnknownJump_0x3C7D9
	ld a, 1
	call UnknownCall_0x3E2F7
	ld a, 100
	call UnknownCall_0x3C7CA
	ld a, 1
	ld [$A844], a
	jp UnknownJump_0x3C7BD

UnknownJump_0x3C7A3:
	ldh_a_n $81
	cp $20
	jp nz, UnknownJump_0x3C7D9
	ld a, 2
	call UnknownCall_0x3E2F7
	ld a, 23
	call UnknownCall_0x3C7CA
	ld a, 2
	ld [$A844], a
	jp UnknownJump_0x3C7BD

UnknownJump_0x3C7BD:
	call UnknownCall_0x3F156
	ld a, 12
	ldh_n_a $9B
	call UnknownCall_0x3EA9A
	ei
	ret

UnknownCall_0x3C7CA:
	ld [$A840], a
	call UnknownCall_0x3EEA4
	call UnknownCall_0x3ED4C
	ld a, 0
	ld [$A68B], a
	ret

UnknownJump_0x3C7D9:
	xor a
	ld [$A690], a
	ld a, 8
	ld [$A694], a
	ld a, [$A68C]
	inc a
	ld [$A68C], a
	jp UnknownJump_0x3C8F4

UnknownJump_0x3C7EC:
	ld a, [$A878]
	rrca
	ld [$A878], a
	jr nc, UnknownRJump_0x3C7F8
	jp UnknownJump_0x3C901

UnknownRJump_0x3C7F8:
	ld a, [$A694]
	dec a
	ld [$A694], a
	jr nz, UnknownRJump_0x3C83C
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
	call UnknownCall_0x3E8F
	ei
	or a
	jr nz, UnknownRJump_0x3C82D
	xor a
	ld [$A690], a
	inc bc
	ld a, 24
	call UnknownCall_0x3E8F
	ei
	ld [$A840], a
	ld [$A840], a
	jp UnknownJump_0x3C901

UnknownRJump_0x3C82D:
	ld [$A844], a
	ld a, [$A844]
	bit 4, a
	jr z, UnknownRJump_0x3C83C
	ld a, 4
	ld [$A694], a

UnknownRJump_0x3C83C:
	ld a, [$A68C]
	inc a
	ld [$A68C], a
	ld a, [$A844]
	and $0F
	jp z, UnknownJump_0x3C8F4
	ld a, [$A844]
	bit 2, a
	jr z, UnknownRJump_0x3C872
	ld a, [$A68C]
	and $0C
	rrca
	rrca
	add 8
	ld [$A695], a
	ld a, [$A843]
	cp $08
	ccf
	sbc 0
	ld [$A843], a
	ld a, [$A68B]
	or a
	call z, UnknownCall_0x3CA84
	jr UnknownRJump_0x3C893

UnknownRJump_0x3C872:
	bit 3, a
	jr z, UnknownRJump_0x3C893
	ld a, [$A68C]
	and $0C
	rrca
	rrca
	add 12
	ld [$A695], a
	ld a, [$A843]
	cp $8A
	adc 0
	ld [$A843], a
	ld a, [$A68B]
	or a
	call z, UnknownCall_0x3CAAB

UnknownRJump_0x3C893:
	ld a, [$A844]
	bit 0, a
	jr z, UnknownRJump_0x3C8C1
	ld a, [$A68C]
	and $0C
	cp $0C
	jr nz, UnknownRJump_0x3C8A7
	xor a
	ld [$A68C], a

UnknownRJump_0x3C8A7:
	rrca
	rrca
	add 4
	ld [$A695], a
	ld a, [$A842]
	cp $94
	adc 0
	ld [$A842], a
	ld a, [$A68B]
	or a
	call z, UnknownCall_0x3CA31
	jr UnknownRJump_0x3C901

UnknownRJump_0x3C8C1:
	bit 1, a
	jr z, UnknownRJump_0x3C8EB
	ld a, [$A68C]
	and $0C
	cp $0C
	jr nz, UnknownRJump_0x3C8D2
	xor a
	ld [$A68C], a

UnknownRJump_0x3C8D2:
	rrca
	rrca
	ld [$A695], a
	ld a, [$A842]
	cp $08
	ccf
	sbc 0
	ld [$A842], a
	ld a, [$A68B]
	or a
	call z, UnknownCall_0x3CA5D
	jr UnknownRJump_0x3C901

UnknownRJump_0x3C8EB:
	ld a, [$A844]
	and $0F
	jr nz, UnknownRJump_0x3C901

UnknownData_0x3C8F2:
INCBIN "baserom.gb", $3C8F2, $3C8F4 - $3C8F2


UnknownJump_0x3C8F4:
	ld a, [$A68C]
	and $18
	rrca
	rrca
	rrca
	add 12
	ld [$A695], a

UnknownJump_0x3C901:
UnknownRJump_0x3C901:
UnknownCall_0x3C901:
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
	cp $08
	jr nz, UnknownRJump_0x3C92A
	ld de, $4B77
	ld a, [$A68C]
	and $08
	ld l, a
	ld h, 0
	add de
	ld d, h
	ld e, l
	jr UnknownRJump_0x3C990

UnknownRJump_0x3C92A:
	bit 2, a
	jr z, UnknownRJump_0x3C933
	ld de, $4B87
	jr UnknownRJump_0x3C990

UnknownRJump_0x3C933:
	cp $0A
	jr z, UnknownRJump_0x3C990
	and $02
	jr z, UnknownRJump_0x3C990
	ld a, [$A690]
	or a
	jr z, UnknownRJump_0x3C971
	ld a, [$A844]
	bit 1, a
	jr z, UnknownRJump_0x3C959
	ld de, $4B8F
	ld a, [$A68C]
	and $0C
	rlca
	ld l, a
	ld h, 0
	add de
	ld d, h
	ld e, l
	jr UnknownRJump_0x3C990

UnknownRJump_0x3C959:
	ld a, [$A844]
	bit 0, a
	jr z, UnknownRJump_0x3C971
	ld de, $4BAF
	ld a, [$A68C]
	and $0C
	rlca
	ld l, a
	ld h, 0
	add de
	ld d, h
	ld e, l
	jr UnknownRJump_0x3C990

UnknownRJump_0x3C971:
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
	jr UnknownRJump_0x3C990

UnknownData_0x3C98C:
INCBIN "baserom.gb", $3C98C, $3C990 - $3C98C


UnknownRJump_0x3C990:
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
	call UnknownCall_0x3C9B5
	ei
	ret

UnknownCall_0x3C9B5:
	ld bc, $0000
	ld a, [$A844]
	and $0F
	jr z, UnknownRJump_0x3C9CA
	ld a, [$A844]
	bit 5, a
	jr z, UnknownRJump_0x3C9CA
	ld b, 4
	ld c, 8

UnknownRJump_0x3C9CA:
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

UnknownJump_0x3C9F4:
	ldh_a_n $97
	swap a
	and $01
	jr nz, UnknownRJump_0x3CA02
	ld bc, $4A11
	jr UnknownRJump_0x3CA05

UnknownRJump_0x3CA02:
	ld bc, $4A21

UnknownRJump_0x3CA05:
	ld hl, $A100
	ld d, 16

UnknownRJump_0x3CA0A:
	ld a, [bc]
	ld [hli], a
	inc bc
	dec d
	jr nz, UnknownRJump_0x3CA0A
	ret

UnknownData_0x3CA11:
INCBIN "baserom.gb", $3CA11, $3CA31 - $3CA11


UnknownCall_0x3CA31:
	ld a, [$A842]
	cp $4C
	ret nz

UnknownCall_0x3CA37:
	ld hl, $FFB9
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	or a
	jr z, UnknownRJump_0x3CA45
	ld a, e
	cp $60
	ret nc

UnknownRJump_0x3CA45:
	inc de
	ld a, d
	ld [hld], a
	ld [hl], e
	ld a, [sScrollX]
	inc a
	ld [sScrollX], a
	ld a, [$A7A0]
	or a
	ret nz
	ld a, [$A842]
	dec a
	ld [$A842], a
	ret

UnknownCall_0x3CA5D:
	ld a, [$A842]
	cp $4A
	ret nz

UnknownCall_0x3CA63:
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
	ld a, [sScrollX]
	dec a
	ld [sScrollX], a
	ld a, [$A7A0]
	or a
	ret nz
	ld a, [$A842]
	inc a
	ld [$A842], a
	ret

UnknownCall_0x3CA84:
	ld a, [$A843]
	cp $4B
	ret nz

UnknownCall_0x3CA8A:
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
	ld a, [sScrollY]
	dec a
	ld [sScrollY], a
	ld a, [$A7A0]
	or a
	ret nz
	ld a, [$A843]
	inc a
	ld [$A843], a
	ret

UnknownCall_0x3CAAB:
	ld a, [$A843]
	cp $4D
	ret nz

UnknownCall_0x3CAB1:
	ld hl, $FFB7
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	or a
	jr z, UnknownRJump_0x3CABF
	ld a, e
	cp $70
	ret nc

UnknownRJump_0x3CABF:
	inc de
	ld a, d
	ld [hld], a
	ld [hl], e
	ld a, [sScrollY]
	inc a
	ld [sScrollY], a
	ld a, [$A7A0]
	or a
	ret nz
	ld a, [$A843]
	dec a
	ld [$A843], a
	ret

UnknownData_0x3CAD7:
INCBIN "baserom.gb", $3CAD7, $3CBE7 - $3CAD7


UnknownCall_0x3CBE7:
	xor a
	ld [$A781], a
	ld hl, $A6B5
	ld c, 72
	ld de, $4BFD

UnknownRJump_0x3CBF3:
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, UnknownRJump_0x3CBF3
	call UnknownCall_0x3CFC8
	ret

UnknownData_0x3CBFD:
INCBIN "baserom.gb", $3CBFD, $3CE43 - $3CBFD


UnknownCall_0x3CE43:
	ld hl, $4E37
	ld de, $A6C8
	ld b, 6

UnknownRJump_0x3CE4B:
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
	jr z, UnknownRJump_0x3CE5C
	ld a, 2
	jr UnknownRJump_0x3CE5E

UnknownRJump_0x3CE5C:
	ld a, 255

UnknownRJump_0x3CE5E:
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
	jr nz, UnknownRJump_0x3CE4B
	ret

UnknownCall_0x3CE6B:
	ld a, [$A69A]
	and $07
	jr nz, UnknownRJump_0x3CE93
	ld a, [$A780]
	inc a
	cp $03
	jr c, UnknownRJump_0x3CE7B
	xor a

UnknownRJump_0x3CE7B:
	ld [$A780], a
	add 2
	ld hl, $A6C8
	ld de, $0004
	ld b, 6
	ld c, a

UnknownRJump_0x3CE89:
	ld a, [hl]
	cp $FF
	jr z, UnknownRJump_0x3CE8F
	ld [hl], c

UnknownRJump_0x3CE8F:
	add de
	dec b
	jr nz, UnknownRJump_0x3CE89

UnknownRJump_0x3CE93:
	ld a, [$A69A]
	and $03
	jr nz, UnknownRJump_0x3CEB7
	ld hl, $A6BA
	ld de, $0004
	ld a, [$A781]
	inc a
	ld [$A781], a
	bit 6, a
	jr z, UnknownRJump_0x3CEB2
	inc [hl]
	add de
	inc [hl]
	add de
	inc [hl]
	jr UnknownRJump_0x3CEB7

UnknownRJump_0x3CEB2:
	dec [hl]
	add de
	dec [hl]
	add de
	dec [hl]

UnknownRJump_0x3CEB7:
	ld a, [$A69A]
	and $03
	jr nz, UnknownRJump_0x3CF16
	ld a, [$A7A9]
	or a
	jr z, UnknownRJump_0x3CF09

UnknownRJump_0x3CEC4:
	ld a, 255
	ld [$A6F8], a
	ld [$A6FC], a
	ld a, [$A7A9]
	dec a
	ld [$A7A9], a
	bit 0, a
	jr z, UnknownRJump_0x3CF16
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
	jr UnknownRJump_0x3CF16

UnknownRJump_0x3CF09:
	ld a, [$FF00+$04]
	and $72
	jr nz, UnknownRJump_0x3CF16
	ld a, 4
	ld [$A7A9], a
	jr UnknownRJump_0x3CEC4

UnknownRJump_0x3CF16:
	ld a, [$A789]
	or a
	ret z
	inc a
	ld [$A789], a
	ld d, a
	ld c, 0
	cp $10
	jr c, UnknownRJump_0x3CF2E
	sub 2
	and $18
	rlca
	swap a
	ld c, a

UnknownRJump_0x3CF2E:
	ld a, d
	cp $58
	jr c, UnknownRJump_0x3CF3A
	ld hl, $A6F0
	ld a, 5
	ld [hl], a
	ret

UnknownRJump_0x3CF3A:
	cp $2C
	jr nc, UnknownRJump_0x3CF48
	ld a, [$A6EE]
	dec a
	ld [$A6EE], a
	ld e, a
	jr UnknownRJump_0x3CF52

UnknownRJump_0x3CF48:
	ld a, [$A6EE]
	inc a
	ld [$A6EE], a
	ld e, a
	ld c, 0

UnknownRJump_0x3CF52:
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
	cp $06
	jr nc, UnknownRJump_0x3CF80
	ld a, 11
	ld [$A6E0], a
	ld a, e

UnknownRJump_0x3CF80:
	cp $05
	jr nc, UnknownRJump_0x3CF8A
	ld a, 11
	ld [$A6E4], a
	ld a, e

UnknownRJump_0x3CF8A:
	cp $04
	jr nc, UnknownRJump_0x3CF94
	ld a, 11
	ld [$A6E8], a
	ld a, e

UnknownRJump_0x3CF94:
	cp $03
	jr nc, UnknownRJump_0x3CF9E
	ld a, 11
	ld [$A6EC], a
	ld a, e

UnknownRJump_0x3CF9E:
	cp $02
	jr nc, UnknownRJump_0x3CFA7
	ld a, 11
	ld [$A6F4], a

UnknownRJump_0x3CFA7:
	ret

UnknownData_0x3CFA8:
INCBIN "baserom.gb", $3CFA8, $3CFC8 - $3CFA8


UnknownCall_0x3CFC8:
	call UnknownCall_0x3CE6B
	xor a
	ld hl, $A134
	ld d, 108

UnknownRJump_0x3CFD1:
	ld [hli], a
	dec d
	jr nz, UnknownRJump_0x3CFD1
	ld a, 13
	ld [$A6B3], a
	ld hl, $A6B5
	ld a, 18

UnknownRJump_0x3CFDF:
	push af
	push hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	cp $FF
	jr z, UnknownRJump_0x3CFF7
	dec hl
	dec hl
	dec hl
	call UnknownCall_0x3D044
	ld e, a
	ld a, [$A6B4]
	or a
	call z, UnknownCall_0x3D001

UnknownRJump_0x3CFF7:
	pop hl
	ld bc, $0004
	add bc
	pop af
	dec a
	jr nz, UnknownRJump_0x3CFDF
	ret

UnknownCall_0x3D001:
	ld hl, $4C4D
	sla e
	ld d, 0
	add de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [$A6B3]
	cp $28
	ret nc
	add a
	add a
	ld de, $A100
	add e
	ld e, a
	ld a, d
	adc 0
	ld d, a

UnknownRJump_0x3D01D:
	ld a, [$A6B3]
	cp $28
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
	cp $FF
	jr z, UnknownRJump_0x3D03E
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [$A6B3]
	inc a
	ld [$A6B3], a
	jr UnknownRJump_0x3D01D

UnknownRJump_0x3D03E:
	dec de
	xor a
	ld [de], a
	dec de
	ld [de], a
	ret

UnknownCall_0x3D044:
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
	jr c, UnknownRJump_0x3D079
	ld a, 255
	ld [$A6B4], a

UnknownRJump_0x3D079:
	pop hl
	ld de, $00D0
	add de
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
	jr nc, UnknownRJump_0x3D08B
	ld a, 255
	ld [$A6B4], a

UnknownRJump_0x3D08B:
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
	jr c, UnknownRJump_0x3D0A9
	ld a, 255
	ld [$A6B4], a

UnknownRJump_0x3D0A9:
	pop hl
	ld bc, $00C8
	add bc
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	jr nc, UnknownRJump_0x3D0BB
	ld a, 255
	ld [$A6B4], a

UnknownRJump_0x3D0BB:
	pop bc
	ld a, [$A6B4]
	or a
	jr nz, UnknownRJump_0x3D0D4
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

UnknownRJump_0x3D0D4:
	pop hl
	ld a, [hl]
	ret

UnknownJump_0x3D0D7:
	ld a, 48
	ld [$A842], a
	ld a, 158
	ld [$A843], a
	ld a, 35
	ld [$A840], a
	ld a, 255
	ld [$A224], a
	call UnknownCall_0x3E9FB
	ld a, 255
	ld [$A468], a
	call UnknownCall_0x2AAA
	call UnknownCall_0x3D0FF
	ld a, 4
	call UnknownCall_0x3E3BA
	ret

UnknownCall_0x3D0FF:
	call DisableVBlank
	ld a, BANK(GFX_OW_Overworld) ;prepare bank switch
	ld bc, $0200
	ld hl, GFX_OW_Overworld
	ld de, $8000
	call FarCopyMem
	ld a, BANK(GFX_OW_TreeZone) ;prepare bank switch
	ld bc, $1600
	ld hl, GFX_OW_TreeZone
	ld de, $8200
	call FarCopyMem
	ld a, 14 ;prepare bank switch
	ld bc, $0400
	ld hl, $7240
	ld de, $9800
	call FarCopyMem
	ld a, 0
	ld [sScrollX], a
	ld [sScrollY], a
	ld [$A690], a
	ld a, 2
	ld [$A68B], a
	call UnknownCall_0x3E46
	ld de, $65BA
	call UnknownCall_0x3E2A2
	ld a, [$A84D]
	bit 7, a
	jr z, UnknownRJump_0x3D151
	ld a, 255
	ld [$A6B7], a

UnknownRJump_0x3D151:
	ld hl, $A849
	ld de, $A6C3
	ld b, 5
	call UnknownCall_0x3DB00
	call UnknownCall_0x3E277
	call UnknownCall_0x3D1C9
	call UnknownCall_0x3D18E
	call UnknownCall_0x3D1B5
	ld a, 195
	ldh_n_a $40
	xor a
	ldh_n_a $81
	ld [$A69A], a
	ld [$A6B0], a
	ld [$A6B1], a
	ld [$A7BE], a
	ld [$A7BF], a
	ld a, 16
	ld [$A783], a
	ld a, 16
	ld [$A468], a
	call UnknownCall_0x2AAA
	ret

UnknownCall_0x3D18E:
	ld a, [$A2B4]
	or a
	ret z
	ld a, [$A224]
	or a
	ret nz
	ld a, [$A84A]
	and $01
	jr nz, UnknownRJump_0x3D1A4
	ld a, 106
	ld [$A6D2], a

UnknownRJump_0x3D1A4:
	ld a, 37
	ld [$A840], a
	call UnknownCall_0x3EEA4
	ld a, [$A84A]
	set 0, a
	ld [$A84A], a
	ret

UnknownCall_0x3D1B5:
	ld a, [$A840]
	cp $26
	ret nz
	ld a, 39
	ld [$A840], a
	call UnknownCall_0x3EEA4
	ld a, 255
	ld [$A224], a
	ret

UnknownCall_0x3D1C9:
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

UnknownJump_0x3D1E0:
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
	call UnknownCall_0x2AAA
	call UnknownCall_0x3E9FB
	call UnknownCall_0x3D208
	ld a, 4
	call UnknownCall_0x3E3BA
	ret

UnknownCall_0x3D208:
	call DisableVBlank
	ld a, BANK(GFX_OW_Overworld) ;prepare bank switch
	ld bc, $0200
	ld hl, GFX_OW_Overworld
	ld de, $8000
	call FarCopyMem
	ld a, BANK(GFX_OW_PumpkinZone) ;prepare bank switch
	ld bc, $1600
	ld hl, GFX_OW_PumpkinZone
	ld de, $8200
	call FarCopyMem
	ld a, 14 ;prepare bank switch
	ld bc, $0400
	ld hl, $7000
	ld de, $9800
	call FarCopyMem
	ld a, 0
	ld [sScrollX], a
	ld [sScrollY], a
	ld [$A690], a
	ld a, 1
	ld [$A68B], a
	call UnknownCall_0x3E46
	ld de, $65DE
	call UnknownCall_0x3E2A2
	ld a, [$A851]
	bit 7, a
	jr z, UnknownRJump_0x3D25A
	ld a, 255
	ld [$A6BD], a

UnknownRJump_0x3D25A:
	call UnknownCall_0x3D2FC
	call UnknownCall_0x3D324
	call UnknownCall_0x3D29F
	ld hl, $A84E
	ld de, $A6C0
	ld b, 4
	call UnknownCall_0x3DB00
	call UnknownCall_0x3E277
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
	ldh_n_a $40
	xor a
	ldh_n_a $81
	ld [$A69A], a
	ld a, 30
	ld [$A468], a
	call UnknownCall_0x2AAA
	ret

UnknownCall_0x3D29F:
	xor a
	ld [$A7BA], a
	ld a, [$A2B4]
	or a
	ret z
	ld a, [$A224]
	or a
	ret nz
	ld a, [$A840]
	cp $2C
	jr nz, UnknownRJump_0x3D2D5
	ld a, 31
	ld [$A7D2], a
	call UnknownCall_0x3F8E
	ld a, 44
	ld [$A840], a
	call UnknownCall_0x3EEA4
	ld a, [$A84F]
	bit 0, a
	ret nz
	set 0, a
	ld [$A84F], a
	ld a, 255
	ld [$A7BA], a
	ret

UnknownRJump_0x3D2D5:
	ld a, [$A840]
	cp $2F
	ret nz
	ld a, 39
	ld [$A7D5], a
	call UnknownCall_0x3F8E
	ld a, 47
	ld [$A840], a
	call UnknownCall_0x3EEA4
	ld a, [$A850]
	bit 0, a
	ret nz
	set 0, a
	ld [$A850], a
	ld a, 255
	ld [$A7BA], a
	ret

UnknownCall_0x3D2FC:
	ld a, [$A84F]
	and $01
	ret z
	ld a, 31

UnknownRJump_0x3D304:
	ld [$A7D2], a
	push af
	call UnknownCall_0x3F8E
	pop af
	inc a
	cp $27
	jr nz, UnknownRJump_0x3D304
	ld a, [$A86E]
	bit 7, a
	ret z
	ld hl, $4500
	ld de, $8800
	ld bc, $0220
	call UnknownCall_0x3FA4
	ret

UnknownCall_0x3D324:
	ld a, [$A850]
	and $01
	ret z
	ld a, 39

UnknownRJump_0x3D32C:
	ld [$A7D2], a
	push af
	call UnknownCall_0x3F8E
	pop af
	inc a
	cp $2F
	jr nz, UnknownRJump_0x3D32C
	ret

UnknownJump_0x3D33A:
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
	call UnknownCall_0x3E9FB
	ld a, 255
	ld [$A468], a
	call UnknownCall_0x2AAA
	call UnknownCall_0x3D371
	ld a, 255
	ld [$A690], a
	ld a, 1
	call UnknownCall_0x3E3BA
	ld a, 0
	ld [$A690], a
	ret

UnknownCall_0x3D371:
	call DisableVBlank
	ld a, BANK(GFX_OW_Overworld) ;prepare bank switch
	ld bc, $0200
	ld hl, GFX_OW_Overworld
	ld de, $8000
	call FarCopyMem
	ld a, BANK(GFX_OW_MacroZone) ;prepare bank switch
	ld bc, $1600
	ld hl, GFX_OW_MacroZone
	ld de, $8200
	call FarCopyMem
	ld a, 14 ;prepare bank switch
	ld bc, $0400
	ld hl, $76C0
	ld de, $9800
	call FarCopyMem
	ld a, 0
	ld [sScrollX], a
	ld [sScrollY], a
	ld [$A690], a
	ld a, 33
	ld [$A844], a
	ld a, 3
	ld [$A68B], a
	call UnknownCall_0x3E46
	ld de, $662C
	call UnknownCall_0x3E2A2
	call UnknownCall_0x3D45D
	call UnknownCall_0x3D409
	call UnknownCall_0x3D43D
	ld a, [$A844]
	or $20
	ld [$A844], a
	ld a, 0
	ld [$A690], a
	ld hl, $A853
	ld de, $A6C3
	ld b, 4
	call UnknownCall_0x3DB00
	ld hl, $A86B
	ld de, $A6B7
	ld b, 1
	call UnknownCall_0x3DB00
	call UnknownCall_0x3E277
	ld a, 195
	ldh_n_a $40
	xor a
	ldh_n_a $81
	ld [$A69A], a
	ld [$A6B0], a
	ld [$A6B1], a
	ld [$A783], a
	ld a, 5
	ld [$A468], a
	call UnknownCall_0x2AAA
	ret

UnknownCall_0x3D409:
	ld a, [$A840]
	cp $32
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
	call UnknownCall_0x3EEA4
	ld a, [$A853]
	bit 0, a
	jr z, UnknownRJump_0x3D432

UnknownData_0x3D42D:
INCBIN "baserom.gb", $3D42D, $3D432 - $3D42D


UnknownRJump_0x3D432:
	set 0, a
	ld [$A853], a
	ld a, 255
	ld [$A7BA], a
	ret

UnknownCall_0x3D43D:
	ld a, [$A840]
	cp $6A
	ret nz
	ld a, [$A224]
	or a
	jr nz, UnknownRJump_0x3D45C
	ld a, 108
	ld [$A840], a
	call UnknownCall_0x3EEA4
	ld hl, $A86B
	set 7, [hl]
	ld a, 255
	ld [$A224], a
	ret

UnknownRJump_0x3D45C:
	ret

UnknownCall_0x3D45D:
	xor a
	ld [$A7BA], a
	ld a, [$A853]
	and $01
	ret z
	ld a, 16

UnknownRJump_0x3D469:
	ld [$A7D2], a
	push af
	call UnknownCall_0x3F8E
	pop af
	inc a
	cp $1F
	jr nz, UnknownRJump_0x3D469
	ret

UnknownJump_0x3D477:
UnknownData_0x3D477:
INCBIN "baserom.gb", $3D477, $3D49F - $3D477


UnknownCall_0x3D49F:
	call DisableVBlank
	ld a, BANK(GFX_OW_Overworld) ;prepare bank switch
	ld bc, $0200
	ld hl, GFX_OW_Overworld
	ld de, $8000
	call FarCopyMem
	ld a, BANK(GFX_OW_SpaceZone) ;prepare bank switch
	ld bc, $1600
	ld hl, GFX_OW_SpaceZone
	ld de, $8200
	call FarCopyMem
	ld a, 14 ;prepare bank switch
	ld bc, $0240
	ld hl, $7480
	ld de, $9800
	call FarCopyMem
	ld hl, $9B00
	ld a, 126
	ld c, 255

UnknownRJump_0x3D4D3:
	ld [hli], a
	dec c
	jr nz, UnknownRJump_0x3D4D3
	ld a, 0
	ld [sScrollX], a
	ld [sScrollY], a
	ld [$A690], a
	ld a, 4
	ld [$A68B], a
	call UnknownCall_0x3E46
	ld de, $65FF
	call UnknownCall_0x3E2A2
	call UnknownCall_0x3D58D
	call UnknownCall_0x3D533
	call UnknownCall_0x3D56B
	ld hl, $A858
	ld de, $A6C3
	ld b, 2
	call UnknownCall_0x3DB00
	ld hl, $A871
	ld de, $A6D5
	ld b, 1
	call UnknownCall_0x3DB00
	call UnknownCall_0x3E277
	ld a, 195
	ldh_n_a $40
	xor a
	ldh_n_a $81
	ld [$A69A], a
	ld [$A6B0], a
	ld [$A6B1], a
	ld [$A783], a
	ld [$A7BD], a
	ld a, 28
	ld [$A468], a
	call UnknownCall_0x2AAA
	ret

UnknownCall_0x3D533:
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
	call UnknownCall_0x3EEA4
	ld a, [$A858]
	bit 0, a
	jr nz, UnknownRJump_0x3D562
	ld e, a
	ld a, 1
	ld [$A7BB], a
	ld a, 60
	ld [$A7BC], a
	ld a, 117
	ld [$A6D2], a
	ld a, e

UnknownRJump_0x3D562:
	set 0, a
	ld [$A858], a
	call UnknownCall_0x3F8E
	ret

UnknownCall_0x3D56B:
	ld a, [$A840]
	cp $44
	ret nz
	ld a, 69
	ld [$A840], a
	call UnknownCall_0x3EEA4
	ld a, 255
	ld [$A224], a
	ld a, [$A871]
	bit 7, a
	ret z
	ld a, 57
	ld [$A7D2], a
	call UnknownCall_0x3F8E
	ret

UnknownCall_0x3D58D:
	ld a, 0
	ld [$A7BB], a
	ld a, [$A858]
	and $01
	ret z
	ld a, 56
	ld [$A7D2], a
	call UnknownCall_0x3F8E
	ld a, 51
	ld [$A7D2], a
	ld a, 52
	ld [$A7D5], a
	call UnknownCall_0x3F8E
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
	call UnknownCall_0x3F8E
	ret

UnknownJump_0x3D5D0:
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
	jr UnknownRJump_0x3D606

UnknownJump_0x3D5EC:
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

UnknownRJump_0x3D606:
	ld a, 255
	ld [$A224], a
	call UnknownCall_0x3E9FB
	ld a, 255
	ld [$A468], a
	call UnknownCall_0x2AAA
	call UnknownCall_0x3D61F
	ld a, 8
	call UnknownCall_0x3E3BA
	ret

UnknownCall_0x3D61F:
	call DisableVBlank
	ld a, BANK(GFX_OW_Overworld) ;prepare bank switch
	ld bc, $0200
	ld hl, GFX_OW_Overworld
	ld de, $8000
	call FarCopyMem
	ld a, BANK(GFX_OW_TreeZone) ;prepare bank switch
	ld bc, $1600
	ld hl, GFX_OW_TreeZone
	ld de, $8200
	call FarCopyMem
	ld a, 14 ;prepare bank switch
	ld bc, $0400
	ld hl, $7900
	ld de, $9800
	call FarCopyMem
	ld a, 0
	ld [sScrollX], a
	ld [sScrollY], a
	ld [$A690], a
	ld a, 5
	ld [$A68B], a
	call UnknownCall_0x3E46
	ld de, $6680
	call UnknownCall_0x3E2A2
	call UnknownCall_0x3D6B7
	call UnknownCall_0x3D69C
	ld hl, $A85D
	ld de, $A6C3
	ld b, 3
	call UnknownCall_0x3DB00
	call UnknownCall_0x3E277
	ld a, 195
	ldh_n_a $40
	xor a
	ldh_n_a $81
	ld [$A69A], a
	ld [$A6B0], a
	ld [$A6B1], a
	ld [$A783], a
	ld a, 160
	ld [$A6A7], a
	ld a, 18
	ld [$A468], a
	call UnknownCall_0x2AAA
	ret

UnknownCall_0x3D69C:
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

UnknownCall_0x3D6B7:
	ld a, [$A85E]
	and $01
	ret z
	ld a, 129
	ld [$A6D5], a
	ret

UnknownJump_0x3D6C3:
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
	call UnknownCall_0x2AAA
	call UnknownCall_0x3E9FB
	call UnknownCall_0x3D6EB
	ld a, 2
	call UnknownCall_0x3E3BA
	ret

UnknownCall_0x3D6EB:
	call DisableVBlank
	ld a, 13 ;prepare bank switch
	ld bc, $0200
	ld hl, $4000
	ld de, $8000
	call FarCopyMem
	ld a, 17 ;prepare bank switch
	ld bc, $1600
	ld hl, $5A00
	ld de, $8200
	call FarCopyMem
	ld a, 14 ;prepare bank switch
	ld bc, $0400
	ld hl, $7D80
	ld de, $9800
	call FarCopyMem
	ld a, 0
	ld [sScrollX], a
	ld [sScrollY], a
	ld [$A690], a
	ld a, 7
	ld [$A68B], a
	call UnknownCall_0x3E46
	ld a, 225
	ld [sBGPalette], a
	ld a, 57
	ld [sOAMPalette2], a
	ld de, $66AA
	call UnknownCall_0x3E2A2
	ld a, 195
	ldh_n_a $40
	xor a
	ldh_n_a $81
	ld [$A69A], a
	ld [$A79E], a
	ld [$A79D], a
	ld a, 1
	ld [$A79F], a
	ld a, 23
	ld [$A78B], a
	ld a, 14
	ld [$A468], a
	call UnknownCall_0x2AAA
	ret

UnknownJump_0x3D760:
	ld a, 12
	ld [$A842], a
	ld a, 112
	ld [$A843], a
	ld a, 80
	ld [$A840], a
	ld [$A840], a
	ld a, 255
	ld [$A224], a
	call UnknownCall_0x3E9FB
	ld a, 255
	ld [$A468], a
	call UnknownCall_0x2AAA
	call UnknownCall_0x3D79A
	ld a, [$A862]
	and $80
	swap a
	ld b, a
	rlca
	or b
	add 56
	ld [$A6C4], a
	ld a, 1
	call UnknownCall_0x3E3BA
	ret

UnknownCall_0x3D79A:
	call DisableVBlank
	ld a, BANK(GFX_OW_Overworld) ;prepare bank switch
	ld bc, $0200
	ld hl, GFX_OW_Overworld
	ld de, $8000
	call FarCopyMem
	ld a, BANK(GFX_OW_MarioZone) ;prepare bank switch
	ld bc, $1600
	ld hl, GFX_OW_MarioZone
	ld de, $8200
	call FarCopyMem
	ld a, 14 ;prepare bank switch
	ld bc, $0400
	ld hl, $7B40
	ld de, $9800
	call FarCopyMem
	ld a, 0
	ld [sScrollX], a
	ld [sScrollY], a
	ld [$A690], a
	ld a, 6
	ld [$A68B], a
	call UnknownCall_0x3E46
	ld de, $664D
	call UnknownCall_0x3E2A2
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
	call UnknownCall_0x3F8E
	ld hl, $A862
	ld de, $A6CC
	ld b, 4
	call UnknownCall_0x3DB00
	call UnknownCall_0x3E277
	ld a, 195
	ldh_n_a $40
	xor a
	ldh_n_a $81
	ld [$A69A], a
	ld [$A6B0], a
	ld [$A6B1], a
	ld [$A783], a
	ld a, 27
	ld [$A468], a
	call UnknownCall_0x2AAA
	ret

UnknownJump_0x3D848:
	ld a, 255
	ld [$A468], a
	call UnknownCall_0x2AAA
	call UnknownCall_0x3E9FB
	call UnknownCall_0x3D880
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
	ld [sBGPalette], a
	ld a, 1
	call UnknownCall_0x3E3BA
	ret

UnknownCall_0x3D880:
	call DisableVBlank
	ld a, BANK(GFX_OW_Overworld) ;prepare bank switch
	ld bc, $0200
	ld hl, GFX_OW_Overworld
	ld de, $8000
	call FarCopyMem
	ld a, BANK(GFX_OW_PumpkinZone) ;prepare bank switch
	ld bc, $1600
	ld hl, GFX_OW_PumpkinZone
	ld de, $8200
	call FarCopyMem
	ld a, 16 ;prepare bank switch
	ld bc, $0400
	ld hl, $7000
	ld de, $9800
	call FarCopyMem
	ld a, 0
	ld [sScrollX], a
	ld [sScrollY], a
	ld [$A690], a
	ld a, 8
	ld [$A68B], a
	call UnknownCall_0x3E46
	ld de, $66BC
	call UnknownCall_0x3E2A2
	ld a, 195
	ldh_n_a $40
	xor a
	ldh_n_a $81
	ld [$A69A], a
	ld [$A7AA], a
	ld a, 13
	ld [$A468], a
	call UnknownCall_0x2AAA
	call UnknownCall_0x3EEA4
	ld a, 228
	ld [sBGPalette], a
	ret

UnknownCall_0x3D8E6:
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
	jr nz, UnknownRJump_0x3D927
	bit 5, c
	jr nz, UnknownRJump_0x3D922
	inc b
	jr UnknownRJump_0x3D923

UnknownRJump_0x3D922:
	dec b

UnknownRJump_0x3D923:
	ld a, b
	ld [$A6B9], a

UnknownRJump_0x3D927:
	ld a, [$A697]
	and $01
	jr z, UnknownRJump_0x3D96F
	ld a, [$A6BC]
	ld b, a
	ld a, [$A6A2]
	inc a
	cp $50
	jr c, UnknownRJump_0x3D93B
	xor a

UnknownRJump_0x3D93B:
	ld [$A6A2], a
	ld hl, $6227
	ld d, 0
	ld e, a
	add de
	ld a, [hl]
	ld [$A6A5], a
	ld d, a
	and $07
	bit 3, d
	jr nz, UnknownRJump_0x3D953
	add b
	jr UnknownRJump_0x3D956

UnknownRJump_0x3D953:
	ld c, a
	ld a, b
	sub c

UnknownRJump_0x3D956:
	ld [$A6BC], a
	ld a, [$A6BB]
	ld b, a
	ld a, d
	swap a
	and $07
	bit 7, d
	jr nz, UnknownRJump_0x3D969
	add b
	jr UnknownRJump_0x3D96C

UnknownRJump_0x3D969:
	ld c, a
	ld a, b
	sub c

UnknownRJump_0x3D96C:
	ld [$A6BB], a

UnknownRJump_0x3D96F:
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
	jr nz, UnknownRJump_0x3D98D
	ld a, e
	add 3
	ld e, a

UnknownRJump_0x3D98D:
	ld a, e
	ld [$A6BD], a
	ld a, [$A851]
	bit 7, a
	jr z, UnknownRJump_0x3D99D
	ld a, 255
	ld [$A6BD], a

UnknownRJump_0x3D99D:
	ld a, [$A69A]
	and $07
	jr nz, UnknownRJump_0x3DA12
	ld a, [$A7BA]
	or a
	jr z, UnknownRJump_0x3DA12
	ld a, [$A840]
	cp $2C
	jr nz, UnknownRJump_0x3D9DE
	ld a, [$A86E]
	bit 7, a
	jr nz, UnknownRJump_0x3D9DE
	ld a, [$A7D2]
	cp $27
	jr nc, UnknownRJump_0x3D9DE
	inc a
	cp $27
	jr c, UnknownRJump_0x3D9D3
	ld a, 21
	ld [$A460], a
	ld a, 255
	ld [$A7D2], a
	call UnknownCall_0x3F8E
	jr UnknownRJump_0x3D9DE

UnknownRJump_0x3D9D3:
	ld [$A7D2], a
	call UnknownCall_0x3F8E
	ld a, 6
	ld [$A460], a

UnknownRJump_0x3D9DE:
	ld a, [$A840]
	cp $2F
	jr nz, UnknownRJump_0x3DA12
	ld a, [$A86F]
	bit 7, a
	jr nz, UnknownRJump_0x3DA12
	ld a, [$A7D5]
	cp $2F
	jr nc, UnknownRJump_0x3DA12
	inc a
	cp $2F
	jr c, UnknownRJump_0x3DA07
	ld a, 21
	ld [$A460], a
	ld a, 255
	ld [$A7D5], a
	call UnknownCall_0x3F8E
	jr UnknownRJump_0x3DA12

UnknownRJump_0x3DA07:
	ld [$A7D5], a
	call UnknownCall_0x3F8E
	ld a, 6
	ld [$A460], a

UnknownRJump_0x3DA12:
	call UnknownCall_0x3E277
	ret

UnknownData_0x3DA16:
INCBIN "baserom.gb", $3DA16, $3DA2D - $3DA16


UnknownCall_0x3DA2D:
	ld a, [$A784]
	inc a
	ld [$A784], a
	cp $0A
	jr c, UnknownRJump_0x3DA66
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
	jr nz, UnknownRJump_0x3DA60
	ld hl, $A6BB
	inc [hl]
	inc hl
	dec [hl]
	jr UnknownRJump_0x3DA66

UnknownRJump_0x3DA60:
	ld hl, $A6BB
	dec [hl]
	inc hl
	inc [hl]

UnknownRJump_0x3DA66:
	ld a, [$A697]
	and $02
	srl a
	add 4
	ld [$A6BA], a
	ld a, [$A697]
	and $01
	jr z, UnknownRJump_0x3DAB7
	ld a, [$A6B9]
	ld b, a
	ld a, [$A6B0]
	inc a
	cp $50
	jr c, UnknownRJump_0x3DA86
	xor a

UnknownRJump_0x3DA86:
	ld [$A6B0], a
	ld hl, $6227
	ld d, 0
	ld e, a
	add de
	ld a, [hl]
	ld d, a
	and $07
	bit 3, d
	jr nz, UnknownRJump_0x3DA9B
	add b
	jr UnknownRJump_0x3DA9E

UnknownRJump_0x3DA9B:
	ld c, a
	ld a, b
	sub c

UnknownRJump_0x3DA9E:
	ld [$A6B9], a
	ld a, [$A6B8]
	ld b, a
	ld a, d
	swap a
	and $07
	bit 7, d
	jr nz, UnknownRJump_0x3DAB1
	add b
	jr UnknownRJump_0x3DAB4

UnknownRJump_0x3DAB1:
	ld c, a
	ld a, b
	sub c

UnknownRJump_0x3DAB4:
	ld [$A6B8], a

UnknownRJump_0x3DAB7:
	ld a, [$A696]
	and $30
	swap a
	ld [$A6B7], a
	ld a, [$A84D]
	bit 7, a
	jr z, UnknownRJump_0x3DACD
	ld a, 255
	ld [$A6B7], a

UnknownRJump_0x3DACD:
	call UnknownCall_0x3DADF
	ld hl, $A849
	ld de, $A6C3
	ld b, 5
	call UnknownCall_0x3DB00
	call UnknownCall_0x3E277
	ret

UnknownCall_0x3DADF:
	ld a, [$A69A]
	and $0F
	ret nz
	ld a, [$A6D2]
	cp $6D
	ret nc
	inc a
	ld [$A6D2], a
	ld a, 6
	ld [$A460], a
	ld a, [$A6D2]
	cp $6D
	ret c
	ld a, 21
	ld [$A460], a
	ret

UnknownRJump_0x3DB00:
UnknownCall_0x3DB00:
	ld a, [hli]
	bit 7, a
	jr z, UnknownRJump_0x3DB09
	ld a, 14
	jr UnknownRJump_0x3DB0B

UnknownRJump_0x3DB09:
	ld a, 255

UnknownRJump_0x3DB0B:
	ld [de], a
	inc de
	inc de
	inc de
	dec b
	jr nz, UnknownRJump_0x3DB00

UnknownCall_0x3DB12:
	ld a, [$A7BA]
	or a
	ret z
	ld a, [$A69A]
	and $07
	ret nz
	ld a, [$A7D2]
	cp $1F
	ret nc
	inc a
	cp $1F
	jr c, UnknownRJump_0x3DB34
	ld a, 21
	ld [$A460], a
	ld a, 255
	ld [$A7D2], a
	jr UnknownRJump_0x3DB3C

UnknownRJump_0x3DB34:
	ld [$A7D2], a
	ld a, 6
	ld [$A460], a

UnknownRJump_0x3DB3C:
	call UnknownCall_0x3F8E
	ret

UnknownCall_0x3DB40:
	ld a, [$A69A]
	and $03
	jr nz, UnknownRJump_0x3DB7A
	ld a, [$A7BD]
	or a
	jr nz, UnknownRJump_0x3DB68
	push bc
	ld a, [$FF00+$04]
	ld b, a
	swap a
	add b
	ld b, a
	ld a, [$A7B7]
	add b
	ld b, a
	ldh_a_n $97
	add b
	ld [$A7B7], a
	pop bc
	and $07
	jr nz, UnknownRJump_0x3DB7A
	ld a, 5

UnknownRJump_0x3DB68:
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

UnknownRJump_0x3DB7A:
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
	jr nz, UnknownRJump_0x3DBAD
	ld a, [$A6C8]
	inc a
	ld [$A6C8], a
	or a
	jr nz, UnknownRJump_0x3DBAD
	ld a, [$FF00+$04]
	ld [$A6C7], a

UnknownRJump_0x3DBAD:
	ld a, [$A69A]
	ld d, a
	and $07
	jp nz, UnknownJump_0x3DC3D
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
	jr nz, UnknownRJump_0x3DBE1
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

UnknownRJump_0x3DBE1:
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
	cp $01
	jr nz, UnknownRJump_0x3DC0F
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

UnknownRJump_0x3DC0F:
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
	cp $02
	jr nz, UnknownRJump_0x3DC3D
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

UnknownJump_0x3DC3D:
UnknownRJump_0x3DC3D:
	call UnknownCall_0x3DC62
	call UnknownCall_0x3E277
	ld a, [$A6D2]
	cp $7B
	ret nc
	ld a, [$A69A]
	and $07
	ret nz
	ld a, [$A6D2]
	inc a
	cp $7C
	jr c, UnknownRJump_0x3DC59

UnknownData_0x3DC57:
INCBIN "baserom.gb", $3DC57, $3DC59 - $3DC57


UnknownRJump_0x3DC59:
	ld [$A6D2], a
	ld a, 6
	ld [$A460], a
	ret

UnknownCall_0x3DC62:
	ld a, [$A7BB]
	or a
	jr nz, UnknownRJump_0x3DC71
	ld a, 255
	ld [$A6CC], a
	ld [$A6CF], a
	ret

UnknownRJump_0x3DC71:
	cp $01
	jr nz, UnknownRJump_0x3DCC4
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

UnknownRJump_0x3DCC4:
	cp $02
	jr nz, UnknownRJump_0x3DD16
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
	call UnknownCall_0x3F8E
	ld a, 20
	ld [$A7BC], a
	ld a, 24
	ld [$A460], a
	ret

UnknownRJump_0x3DD16:
	ld a, 140
	ld [$A6CA], a
	ld a, 36
	ld [$A6CB], a
	ld a, 255
	ld [$A6CC], a
	ld a, 255
	ld [$A6CF], a
	ld a, 0
	ld [sScrollX], a
	ld [sScrollY], a
	ld a, [$A7BC]
	or a
	ret z
	dec a
	ld [$A7BC], a
	ld a, [$A69A]
	bit 1, a
	ret z
	ld a, [$A7BC]
	srl a
	ld [sScrollX], a
	cpl
	ld [sScrollY], a
	ld a, [$A7BC]
	or a
	ret nz

UnknownData_0x3DD52:
INCBIN "baserom.gb", $3DD52, $3DD8C - $3DD52


UnknownCall_0x3DD8C:
	ld a, [$A6B5]
	ld e, a
	ld a, [$A69A]
	ld d, a
	and $07
	jr nz, UnknownRJump_0x3DDA0
	bit 7, d
	jr z, UnknownRJump_0x3DD9F
	inc e
	jr UnknownRJump_0x3DDA0

UnknownRJump_0x3DD9F:
	dec e

UnknownRJump_0x3DDA0:
	ld a, e
	ld [$A6B5], a
	ld a, [$A6B8]
	ld e, a
	ld a, [$A69A]
	ld d, a
	and $07
	jr nz, UnknownRJump_0x3DDB8
	bit 7, d
	jr z, UnknownRJump_0x3DDB7
	dec e
	jr UnknownRJump_0x3DDB8

UnknownRJump_0x3DDB7:
	inc e

UnknownRJump_0x3DDB8:
	ld a, e
	ld [$A6B8], a
	call UnknownCall_0x3E4EB
	call UnknownCall_0x3E277
	ret

UnknownCall_0x3DDC3:
	call UnknownCall_0x3F4A0
	ret

UnknownCall_0x3DDC7:
	call UnknownCall_0x3F4A0
	ret

UnknownCall_0x3DDCB:
	call UnknownCall_0x3F4A0
	ret

UnknownCall_0x3DDCF:
	call UnknownCall_0x3F4A0
	ret

UnknownCall_0x3DDD3:
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
	jr nz, UnknownRJump_0x3DE25
	ld a, [$A69A]
	and $60
	srl a
	swap a
	add 38
	ld [$A6B7], a
	jr UnknownRJump_0x3DE4E

UnknownRJump_0x3DE25:
	ld a, [$A69A]
	and $0F
	jr nz, UnknownRJump_0x3DE4E
	push bc
	ld a, [$FF00+$04]
	ld b, a
	swap a
	add b
	ld b, a
	ld a, [$A7B7]
	add b
	ld b, a
	ldh_a_n $97
	add b
	ld [$A7B7], a
	pop bc
	ld a, [$A7B7]
	and $01
	add 53
	ld [$A7D2], a
	call UnknownCall_0x3F8E

UnknownRJump_0x3DE4E:
	ld a, [$A69A]
	ld d, a
	and $02
	srl a
	and d
	ld d, a
	ld a, [$A6A8]
	bit 0, a
	jr nz, UnknownRJump_0x3DE7F
	ld a, [$A6A7]
	sub d
	ld c, a
	ld [$A6A7], a
	cp $C0
	jr nz, UnknownRJump_0x3DE78
	ld a, [$A6A8]
	xor $FF
	ld [$A6A8], a
	ld a, 120
	ld [$A6D1], a

UnknownRJump_0x3DE78:
	ld a, 50
	ld [$A6D2], a
	jr UnknownRJump_0x3DE9D

UnknownRJump_0x3DE7F:
	ld a, [$A6A7]
	add d
	ld c, a
	ld [$A6A7], a
	cp $B0
	jr nz, UnknownRJump_0x3DE98
	ld a, [$A6A8]
	xor $FF
	ld [$A6A8], a
	ld a, 64
	ld [$A6D1], a

UnknownRJump_0x3DE98:
	ld a, 51
	ld [$A6D2], a

UnknownRJump_0x3DE9D:
	ld a, c
	ld [$A6D0], a
	ld a, [$A69A]
	and $0F
	jr nz, UnknownRJump_0x3DEC3
	ld a, [$A6D5]
	cp $81
	jr nc, UnknownRJump_0x3DEC3
	inc a
	ld c, a
	ld [$A6D5], a
	ld a, 6
	ld [$A460], a
	ld a, c
	cp $81
	jr nz, UnknownRJump_0x3DEC3
	ld a, 21
	ld [$A460], a

UnknownRJump_0x3DEC3:
	call UnknownCall_0x3E277
	ret

UnknownCall_0x3DEC7:
	ld a, [$A69A]
	and $03
	jr nz, UnknownRJump_0x3DEF2
	ld a, [$A865]
	bit 7, a
	jr nz, UnknownRJump_0x3DEF2
	ld a, [$A864]
	bit 7, a
	jr z, UnknownRJump_0x3DEF2
	ld a, [$A6BB]
	cp $5C
	jr nc, UnknownRJump_0x3DEF2
	inc a
	ld [$A6BB], a
	ld a, [$A6BC]
	cp $13
	jr nc, UnknownRJump_0x3DEF2
	inc a
	ld [$A6BC], a

UnknownRJump_0x3DEF2:
	ld a, [$A69A]
	and $01
	jr nz, UnknownRJump_0x3DF0B
	ld a, [$A842]
	cp $2E
	jr c, UnknownRJump_0x3DF0B
	ld a, [$A6C4]
	cp $4A
	jr nc, UnknownRJump_0x3DF0B
	inc a
	ld [$A6C4], a

UnknownRJump_0x3DF0B:
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
	call UnknownCall_0x3E277
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
	jr nz, UnknownRJump_0x3DF83
	ld a, [$A862]
	bit 7, a
	jr z, UnknownRJump_0x3DF83
	ld a, [$A7D8]
	cp $08
	jr nc, UnknownRJump_0x3DF83
	inc a
	ld [$A7D8], a

UnknownRJump_0x3DF83:
	ld a, [$A864]
	bit 7, a
	jr nz, UnknownRJump_0x3DF9C
	ld a, [$A863]
	bit 7, a
	jr z, UnknownRJump_0x3DF9C
	ld a, [$A7DB]
	cp $0B
	jr nc, UnknownRJump_0x3DF9C
	inc a
	ld [$A7DB], a

UnknownRJump_0x3DF9C:
	call UnknownCall_0x3F8E
	ret

UnknownData_0x3DFA0:
INCBIN "baserom.gb", $3DFA0, $3DFE8 - $3DFA0


UnknownCall_0x3DFE8:
	ld a, [$A69A]
	and $07
	jr nz, UnknownRJump_0x3E003
	ld a, [$A796]
	inc a
	ld [$A796], a
	cp $03
	jr c, UnknownRJump_0x3DFFE
	xor a
	ld [$A796], a

UnknownRJump_0x3DFFE:
	add 53
	ld [$A6BA], a

UnknownRJump_0x3E003:
	ld a, [$A69A]
	and $03
	jr nz, UnknownRJump_0x3E02E
	ld a, 255
	ld [$A6BD], a
	ld a, [$FF00+$04]
	and $7E
	jr nz, UnknownRJump_0x3E02E
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

UnknownRJump_0x3E02E:
	ld a, [$A79D]
	or a
	jr nz, UnknownRJump_0x3E08F
	ld a, [$A69A]
	and $03
	jr nz, UnknownRJump_0x3E08F
	ld a, [$A797]
	cp $01
	jr nz, UnknownRJump_0x3E053
	ld a, 2
	ld [$A797], a
	ld a, 225
	ld [sBGPalette], a
	ld a, 57
	ld [sOAMPalette2], a
	jr UnknownRJump_0x3E08F

UnknownRJump_0x3E053:
	cp $02
	jr nz, UnknownRJump_0x3E06B
	xor a
	ld [$A797], a
	ld a, 225
	xor $FF
	ld [sBGPalette], a
	ld a, 57
	xor $FF
	ld [sOAMPalette2], a
	jr UnknownRJump_0x3E08F

UnknownRJump_0x3E06B:
	ld a, 225
	ld [sBGPalette], a
	ld a, 57
	ld [sOAMPalette2], a
	ld a, [$A6BD]
	cp $38
	jr nz, UnknownRJump_0x3E08F
	ld a, 225
	xor $FF
	ld [sBGPalette], a
	ld a, 57
	xor $FF
	ld [sOAMPalette2], a
	ld a, 1
	ld [$A797], a

UnknownRJump_0x3E08F:
	ld a, [$A69A]
	and $01
	jr nz, UnknownRJump_0x3E0C7
	ld a, [$A798]
	inc a
	ld [$A798], a
	ld a, [$A79E]
	cp $01
	jr nz, UnknownRJump_0x3E0A9
	call UnknownCall_0x3E0CB
	jr UnknownRJump_0x3E0C7

UnknownRJump_0x3E0A9:
	cp $02
	jr nz, UnknownRJump_0x3E0B2
	call UnknownCall_0x3E0FD
	jr UnknownRJump_0x3E0C7

UnknownRJump_0x3E0B2:
	cp $03
	jr nz, UnknownRJump_0x3E0BB
	call UnknownCall_0x3E12F
	jr UnknownRJump_0x3E0C7

UnknownRJump_0x3E0BB:
	cp $04
	jr nz, UnknownRJump_0x3E0C4
	call UnknownCall_0x3E147
	jr UnknownRJump_0x3E0C7

UnknownRJump_0x3E0C4:
	call UnknownCall_0x3E15F

UnknownRJump_0x3E0C7:
	call UnknownCall_0x3E277
	ret

UnknownCall_0x3E0CB:
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
	cp $28
	jp c, UnknownJump_0x3E17E
	res 1, e
	sub e
	ld [$A6BE], a
	cp $40
	ret c
	cp $60
	ret nc
	ld a, [$A6BF]
	cp $50
	ret c
	ld a, 255
	ld [$A6C0], a
	ret

UnknownCall_0x3E0FD:
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
	cp $78
	jp nc, UnknownJump_0x3E17E
	res 1, e
	add e
	ld [$A6BE], a
	cp $40
	ret c
	cp $60
	ret nc
	ld a, [$A6BF]
	cp $50
	ret c

UnknownData_0x3E129:
INCBIN "baserom.gb", $3E129, $3E12F - $3E129


UnknownCall_0x3E12F:
	ld a, 63
	ld [$A6C0], a
	ld a, [$A6BF]
	cp $36
	jp c, UnknownJump_0x3E1B3
	sub 4
	ld [$A6BF], a
	ld a, 255
	ld [$A6C0], a
	ret

UnknownCall_0x3E147:
	ld a, 63
	ld [$A6C0], a
	ld a, [$A6BF]
	cp $62
	jp nc, UnknownJump_0x3E1B3
	add 4
	ld [$A6BF], a
	ld a, 255
	ld [$A6C0], a
	ret

UnknownCall_0x3E15F:
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
	jr z, UnknownRJump_0x3E17E
	dec a
	ld [$A79F], a
	ret

UnknownJump_0x3E17E:
UnknownRJump_0x3E17E:
	ld a, [$FF00+$04]
	ld e, a
	ld a, [$FF00+$05]
	add e
	and $07
	ld e, a
	ld a, [$A79E]
	ld d, a
	cp e
	jr z, UnknownRJump_0x3E17E
	ld a, e
	or a
	jr z, UnknownRJump_0x3E1A9
	cp $05
	jr c, UnknownRJump_0x3E199
	sub 4
	ld e, a

UnknownRJump_0x3E199:
	cp $03
	jr nc, UnknownRJump_0x3E1A4
	ld a, d
	cp $03
	jr c, UnknownRJump_0x3E17E

UnknownData_0x3E1A2:
INCBIN "baserom.gb", $3E1A2, $3E1A4 - $3E1A2


UnknownRJump_0x3E1A4:
	ld a, d
	cp $03
	jr nc, UnknownRJump_0x3E17E

UnknownRJump_0x3E1A9:
	ld a, e
	ld [$A79E], a
	ld a, 30
	ld [$A79F], a
	ret

UnknownJump_0x3E1B3:
	ld a, [$A6BE]
	cp $32
	jr c, UnknownRJump_0x3E1C0
	ld a, 1
	ld [$A79E], a
	ret

UnknownRJump_0x3E1C0:
	ld a, 2
	ld [$A79E], a
	ld a, 30
	ld [$A79F], a
	ret

UnknownData_0x3E1CB:
INCBIN "baserom.gb", $3E1CB, $3E1D7 - $3E1CB


UnknownCall_0x3E1D7:
	ld a, [$A68B]
	or a
	jr z, UnknownRJump_0x3E210
	ldh_a_n $80
	and $F0
	ld e, a
	ld hl, $4218
	ld a, [$A840]
	ld b, 0
	ld c, a
	add bc
	ld a, [hl]
	cp $FE
	jr z, UnknownRJump_0x3E210
	ld hl, $650E
	add bc
	ld a, [hl]
	ld b, 0
	ld c, a
	ld hl, $6591
	add bc
	ld a, [hl]
	and e
	jr z, UnknownRJump_0x3E210
	ld hl, $A848
	add bc
	ld a, [hl]
	bit 7, a
	jr z, UnknownRJump_0x3E20D
	jr UnknownRJump_0x3E210

UnknownRJump_0x3E20D:
	ld a, 0
	ret

UnknownRJump_0x3E210:
	ld a, 255
	ret

UnknownData_0x3E213:
INCBIN "baserom.gb", $3E213, $3E277 - $3E213


UnknownCall_0x3E277:
	xor a
	ld hl, $A110
	ld d, 144

UnknownRJump_0x3E27D:
	ld [hli], a
	dec d
	jr nz, UnknownRJump_0x3E27D
	ld a, 4
	ld [$A782], a
	ld hl, $A6B5
	ld a, 16

UnknownRJump_0x3E28B:
	push af
	push hl
	ld b, [hl]
	inc hl
	ld c, [hl]
	inc hl
	ld a, [hl]
	ld e, a
	cp $FF
	call nz, UnknownCall_0x3F75
	pop hl
	ld bc, $0003
	add bc
	pop af
	dec a
	jr nz, UnknownRJump_0x3E28B
	ret

UnknownCall_0x3E2A2:
	xor a
	ld [$A781], a
	ld a, 255
	ld c, 48
	ld hl, $A6B7

UnknownRJump_0x3E2AD:
	ld [hli], a
	dec c
	jr nz, UnknownRJump_0x3E2AD
	ld a, 255
	ld c, 48
	ld hl, $A7D0

UnknownRJump_0x3E2B8:
	ld [hli], a
	dec c
	jr nz, UnknownRJump_0x3E2B8
	ld hl, $A6B5
	ld c, 16

UnknownRJump_0x3E2C1:
	ld a, [de]
	cp $FF
	jr z, UnknownRJump_0x3E2D1
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, UnknownRJump_0x3E2C1

UnknownRJump_0x3E2D1:
	push de
	call UnknownCall_0x3E277
	pop de
	inc de
	inc de
	inc de
	ld hl, $A7D0
	ld c, 16

UnknownRJump_0x3E2DE:
	ld a, [de]
	cp $FF
	jr z, UnknownRJump_0x3E2EE
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, UnknownRJump_0x3E2DE

UnknownRJump_0x3E2EE:
	ld a, [$A68B]
	cp $0D
	call c, UnknownCall_0x3F8E
	ret

UnknownCall_0x3E2F7:
	ld [$A786], a
	ld a, 2
	ld [$A79D], a
	ld a, 40

UnknownRJump_0x3E301:
	push af
	call UnknownCall_0x3E426
	call UnknownCall_0x3E367
	call UnknownCall_0x3E9EC
	call UnknownCall_0x3E367
	call UnknownCall_0x3E9EC
	pop af
	dec a
	jr nz, UnknownRJump_0x3E301
	ld d, 228
	ld e, 4

UnknownRJump_0x3E319:
	call UnknownCall_0x3E9EC
	ld a, d
	ld [sBGPalette], a
	push de
	ld hl, $6A53
	ld d, 0
	add de
	ld a, [hl]
	ld [sOAMPalette1], a
	ld [sOAMPalette2], a
	pop de
	ld b, 2

UnknownRJump_0x3E331:
	call UnknownCall_0x3E426
	call UnknownCall_0x3E367
	call UnknownCall_0x3E9EC
	call UnknownCall_0x3E367
	call UnknownCall_0x3E9EC
	dec b
	jr nz, UnknownRJump_0x3E331
	sla d
	sla d
	dec e
	jr nz, UnknownRJump_0x3E319
	ld hl, $9800
	ld bc, $0400
	ld d, 255

UnknownRJump_0x3E352:
	push hl
	ld hl, $FF41

UnknownRJump_0x3E356:
	bit 1, [hl]
	jr nz, UnknownRJump_0x3E356
	pop hl
	ld a, d
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, UnknownRJump_0x3E352
	xor a
	ld [$A79D], a
	ret

UnknownCall_0x3E367:
	push af
	push bc
	push de
	push hl
	call UnknownCall_0x3C13E
	ld a, [$A68B]
	cp $01
	jr nz, UnknownRJump_0x3E37A
	call UnknownCall_0x3D8E6
	jr UnknownRJump_0x3E3B5

UnknownRJump_0x3E37A:
	cp $02
	jr nz, UnknownRJump_0x3E383
	call UnknownCall_0x3DA2D
	jr UnknownRJump_0x3E3B5

UnknownRJump_0x3E383:
	cp $03
	jr nz, UnknownRJump_0x3E38C
	call UnknownCall_0x3DB12
	jr UnknownRJump_0x3E3B5

UnknownRJump_0x3E38C:
	cp $04
	jr nz, UnknownRJump_0x3E395
	call UnknownCall_0x3DB40
	jr UnknownRJump_0x3E3B5

UnknownRJump_0x3E395:
	cp $05
	jr nz, UnknownRJump_0x3E39E
	call UnknownCall_0x3DDD3
	jr UnknownRJump_0x3E3B5

UnknownRJump_0x3E39E:
	cp $06
	jr nz, UnknownRJump_0x3E3A7
	call UnknownCall_0x3DEC7
	jr UnknownRJump_0x3E3B5

UnknownRJump_0x3E3A7:
	cp $07
	jr nz, UnknownRJump_0x3E3B0
	call UnknownCall_0x3DFE8
	jr UnknownRJump_0x3E3B5

UnknownRJump_0x3E3B0:
	cp $08
	call z, UnknownCall_0x3DD8C

UnknownRJump_0x3E3B5:
	pop hl
	pop de
	pop bc
	pop af
	ret

UnknownCall_0x3E3BA:
	ld [$A786], a
	ld a, 1
	ld [$A79D], a
	ld a, 146
	ld [$A878], a
	ld d, 228
	ld a, [$A68B]
	cp $07
	jp z, UnknownJump_0x3E4C1
	ld e, 1

UnknownRJump_0x3E3D3:
	call UnknownCall_0x3E9EC
	ld a, [sBGPalette]
	srl d
	rra
	srl d
	rra
	ld [sBGPalette], a
	push de
	ld hl, $6A53
	ld d, 0
	add de
	ld a, [hl]
	ld [sOAMPalette1], a
	ld [sOAMPalette2], a
	pop de
	ld b, 2

UnknownRJump_0x3E3F3:
	call UnknownCall_0x3E426
	call UnknownCall_0x3E367
	call UnknownCall_0x3E9EC
	call UnknownCall_0x3E367
	call UnknownCall_0x3E9EC
	dec b
	jr nz, UnknownRJump_0x3E3F3
	inc e
	ld a, e
	cp $05
	jr nz, UnknownRJump_0x3E3D3
	ld a, 40

UnknownRJump_0x3E40D:
	push af
	call UnknownCall_0x3E426
	call UnknownCall_0x3E367
	call UnknownCall_0x3E9EC
	call UnknownCall_0x3E367
	call UnknownCall_0x3E9EC
	pop af
	dec a
	jr nz, UnknownRJump_0x3E40D
	xor a
	ld [$A79D], a
	ret

UnknownCall_0x3E426:
	ld a, [$A786]
	cp $01
	jr z, UnknownRJump_0x3E49F
	cp $02
	jr z, UnknownRJump_0x3E47F
	cp $04
	jr z, UnknownRJump_0x3E43A
	cp $08
	jr z, UnknownRJump_0x3E45D

UnknownData_0x3E439:
INCBIN "baserom.gb", $3E439, $3E43A - $3E439


UnknownRJump_0x3E43A:
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
	call UnknownCall_0x3C901
	pop hl
	pop de
	pop bc
	pop af
	ret

UnknownRJump_0x3E45D:
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
	call UnknownCall_0x3C901
	pop hl
	pop de
	pop bc
	pop af
	ret

UnknownRJump_0x3E47F:
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
	call UnknownCall_0x3C901
	pop hl
	pop de
	pop bc
	pop af
	ret

UnknownRJump_0x3E49F:
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
	call UnknownCall_0x3C901
	pop hl
	pop de
	pop bc
	pop af
	ret

UnknownJump_0x3E4C1:
	ld a, 225
	ld [sBGPalette], a
	ld a, 208
	ld [sOAMPalette1], a
	ld a, 57
	ld [sOAMPalette2], a
	ld a, 48

UnknownRJump_0x3E4D2:
	push af
	call UnknownCall_0x3E426
	call UnknownCall_0x3E367
	call UnknownCall_0x3E9EC
	call UnknownCall_0x3E367
	call UnknownCall_0x3E9EC
	pop af
	dec a
	jr nz, UnknownRJump_0x3E4D2
	xor a
	ld [$A79D], a
	ret

UnknownCall_0x3E4EB:
	ld a, [sCoinLow]
	ld l, a
	ld a, [sCoinHigh]
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

UnknownData_0x3E50E:
INCBIN "baserom.gb", $3E50E, $3E7BE - $3E50E


UnknownCall_0x3E7BE:
	ld hl, $88E0
	ld de, $A700
	ld c, 32
	call UnknownCall_0x3E7EB
	ld hl, $89E0
	ld de, $A720
	ld c, 32
	call UnknownCall_0x3E7EB
	ld hl, $8CE0
	ld de, $A740
	ld c, 32
	call UnknownCall_0x3E7EB
	ld hl, $8DE0
	ld de, $A760
	ld c, 32
	call UnknownCall_0x3E7EB
	ret

UnknownRJump_0x3E7EB:
UnknownCall_0x3E7EB:
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, UnknownRJump_0x3E7EB
	ret

UnknownCall_0x3E7F2:
	ld a, [$A689]
	inc a
	ld [$A689], a
	ld e, a
	and $03
	jr nz, UnknownRJump_0x3E823
	ld a, [$A78A]
	dec a
	ld [$A78A], a
	ld a, e
	and $04
	jr nz, UnknownRJump_0x3E823
	ld a, [$A78B]
	dec a
	cp $18
	jr c, UnknownRJump_0x3E814
	ld a, 23

UnknownRJump_0x3E814:
	ld [$A78B], a
	ld a, e
	and $08
	jr nz, UnknownRJump_0x3E823
	ld a, [$A78C]
	dec a
	ld [$A78C], a

UnknownRJump_0x3E823:
	ld e, 255

UnknownRJump_0x3E825:
	ld a, [$FF00+$44]
	cp $0F
	jr nc, UnknownRJump_0x3E832
	ld a, [$A78A]
	ld [$FF00+$43], a
	jr UnknownRJump_0x3E84B

UnknownRJump_0x3E832:
	cp $17
	jr nc, UnknownRJump_0x3E83D
	ld a, [$A78B]
	ld [$FF00+$43], a
	jr UnknownRJump_0x3E84B

UnknownRJump_0x3E83D:
	cp $1F
	jr nc, UnknownRJump_0x3E848
	ld a, [$A78C]
	ld [$FF00+$43], a
	jr UnknownRJump_0x3E84B

UnknownRJump_0x3E848:
	xor a
	ld [$FF00+$43], a

UnknownRJump_0x3E84B:
	nop
	nop
	nop
	nop
	dec e
	jr nz, UnknownRJump_0x3E825
	ret

UnknownCall_0x3E853:
	ld a, [$A689]
	inc a
	ld b, a
	ld [$A689], a
	and $07
	rlca
	ld e, a
	ld d, 0
	bit 0, b
	jp z, UnknownJump_0x3E929
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

UnknownJump_0x3E929:
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

UnknownCall_0x3E9EC:
	ei
	xor a
	ld [$A785], a

UnknownRJump_0x3E9F1:
	ld a, [$A785]
	or a
	jr z, UnknownRJump_0x3E9F1
	call UnknownCall_0x3EAD7
	ret

UnknownCall_0x3E9FB:
	ld d, 228
	ld e, 4

UnknownRJump_0x3E9FF:
	call UnknownCall_0x3E9EC
	call UnknownCall_0x3E9EC
	call UnknownCall_0x3E9EC
	call UnknownCall_0x3E9EC
	call UnknownCall_0x3E9EC
	call UnknownCall_0x3E9EC
	call UnknownCall_0x3E9EC
	call UnknownCall_0x3E9EC
	call UnknownCall_0x3E9EC
	call UnknownCall_0x3E9EC
	call UnknownCall_0x3E9EC
	call UnknownCall_0x3E9EC
	ld a, d
	ld [sBGPalette], a
	push de
	ld hl, $6A53
	ld d, 0
	add de
	ld a, [hl]
	ld [sOAMPalette1], a
	ld [sOAMPalette2], a
	pop de
	sla d
	sla d
	dec e
	jr nz, UnknownRJump_0x3E9FF
	ld hl, $9800
	ld bc, $0400
	ld d, 255

UnknownRJump_0x3EA45:
	ld a, [$FF00+$41]
	and $03
	jr nz, UnknownRJump_0x3EA45
	ld a, d
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, UnknownRJump_0x3EA45
	ret

UnknownData_0x3EA53:
INCBIN "baserom.gb", $3EA53, $3EA9A - $3EA53


UnknownCall_0x3EA9A:
	ld a, 6
	ld [$A468], a
	ld a, 0
	ld [$A878], a
	ld d, 228
	ld e, 1

UnknownRJump_0x3EAA8:
	call UnknownCall_0x3E9EC
	call UnknownCall_0x3E9EC
	call UnknownCall_0x3E9EC
	ld a, [sBGPalette]
	srl d
	rra
	srl d
	rra
	ld [sBGPalette], a
	push de
	ld hl, $6A5A
	ld d, 0
	sla e
	add de
	ld a, [hli]
	ld [sOAMPalette1], a
	ld a, [hl]
	ld [sOAMPalette2], a
	pop de
	inc e
	ld a, e
	cp $05
	jr nz, UnknownRJump_0x3EAA8
	ei
	ret

UnknownCall_0x3EAD7:
	push af
	push bc
	push de
	push hl
	di
	call UnknownCall_0x2AAA
	ei
	pop hl
	pop de
	pop bc
	pop af
	ret

UnknownRJump_0x3EAE5:
UnknownCall_0x3EAE5:
	ld a, 13
	call UnknownCall_0x3E22
	inc bc
	dec d
	jr nz, UnknownRJump_0x3EAE5
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
	jr nz, UnknownRJump_0x3EAE5
	ret

UnknownJump_0x3EAFF:
	ld a, [$A68B]
	or a
	call z, UnknownCall_0x3E853
	ld a, [$A68B]
	cp $07
	call z, UnknownCall_0x3E7F2
	ld a, [$A68B]
	cp $0D
	jr nc, UnknownRJump_0x3EB1A
	cp $09
	call nc, UnknownCall_0x3EBD5

UnknownRJump_0x3EB1A:
	ld a, [$A68B]
	cp $01
	call z, UnknownCall_0x3EC7D
	ld a, [$A68B]
	cp $02
	call z, UnknownCall_0x3ECF5
	ld a, [$A68B]
	cp $05
	call z, UnknownCall_0x3ED35
	ld a, [$A68B]
	or a
	jp nz, UnknownJump_0x01C5
	ldh_a_n $97
	and $03
	cp $01
	jr nz, UnknownRJump_0x3EB48
	call UnknownCall_0x3EBAE
	jp UnknownJump_0x01C5

UnknownRJump_0x3EB48:
	cp $02
	jr nz, UnknownRJump_0x3EB52
	call UnknownCall_0x3EB94
	jp UnknownJump_0x01C5

UnknownRJump_0x3EB52:
	cp $03
	jr nz, UnknownRJump_0x3EB5C
	call UnknownCall_0x3EB7B
	jp UnknownJump_0x01C5

UnknownRJump_0x3EB5C:
	call UnknownCall_0x3EB62
	jp UnknownJump_0x01C5

UnknownCall_0x3EB62:
	ld hl, $A600
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld d, 20

UnknownRJump_0x3EB6B:
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
	jr nz, UnknownRJump_0x3EB6B
	ret

UnknownCall_0x3EB7B:
	ld hl, $A620
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld d, 20

UnknownRJump_0x3EB84:
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
	jr nz, UnknownRJump_0x3EB84
	ret

UnknownCall_0x3EB94:
	ld hl, $A640
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld d, 20
	ld e, 32

UnknownRJump_0x3EB9F:
	ld a, [hli]
	ld [bc], a
	ld a, c
	add e
	ld c, a
	ld a, b
	adc 0
	res 2, a
	ld b, a
	dec d
	jr nz, UnknownRJump_0x3EB9F
	ret

UnknownCall_0x3EBAE:
	ld hl, $A660
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld d, 20
	ld e, 32

UnknownRJump_0x3EBB9:
	ld a, [hli]
	ld [bc], a
	ld a, c
	add e
	ld c, a
	ld a, b
	adc 0
	res 2, a
	ld b, a
	dec d
	jr nz, UnknownRJump_0x3EBB9
	ret

UnknownCall_0x3EBC8:
	call UnknownCall_0x3EB62
	call UnknownCall_0x3EB7B
	call UnknownCall_0x3EB94
	call UnknownCall_0x3EBAE
	ret

UnknownCall_0x3EBD5:
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
	cp $1E
	jr c, UnknownRJump_0x3EBFD
	ld a, [$A7A5]
	and $77
	ld [$A7A5], a
	ld a, 29

UnknownRJump_0x3EBFD:
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

UnknownRJump_0x3EC0E:
	call UnknownCall_0x3E51
	push hl
	ld hl, $001B
	add bc
	ld b, h
	ld c, l
	pop hl
	dec d
	jr nz, UnknownRJump_0x3EC0E
	ld bc, $9825
	ld a, [sCoinLow]
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
	ld a, [sCoinHigh]
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

UnknownData_0x3EC75:
INCBIN "baserom.gb", $3EC75, $3EC7D - $3EC75


UnknownCall_0x3EC7D:
	ld a, [$A86F]
	bit 7, a
	ret z
	ld a, [$A7BE]
	inc a
	cp $0E
	jr c, UnknownRJump_0x3EC8C
	xor a

UnknownRJump_0x3EC8C:
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
	ld e, 0
	srl a
	rr e
	srl a
	rr e
	ld d, a
	ld hl, $5300
	add de
	call UnknownCall_0x3EA4
	ret

UnknownData_0x3ECB5:
INCBIN "baserom.gb", $3ECB5, $3ECF5 - $3ECB5


UnknownCall_0x3ECF5:
	ld a, [$A86C]
	bit 7, a
	ret z
	ld a, [$A7BE]
	inc a
	cp $0E
	jr c, UnknownRJump_0x3ED04
	xor a

UnknownRJump_0x3ED04:
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
	ld e, 0
	srl a
	rr e
	srl a
	rr e
	ld d, a
	ld hl, $5800
	add de
	call UnknownCall_0x3ECB
	ret

UnknownData_0x3ED2D:
INCBIN "baserom.gb", $3ED2D, $3ED35 - $3ED2D


UnknownCall_0x3ED35:
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
	call UnknownCall_0x3EF2
	ret

UnknownCall_0x3ED4C:
	di
	ld hl, $A680
	ldh_a_n $B9
	ld [hli], a
	ldh_a_n $BA
	ld [hl], a
	ld hl, $A682
	ldh_a_n $B7
	ld [hli], a
	ldh_a_n $B8
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
	call UnknownCall_0x3EE8C
	ld hl, $A620
	call UnknownCall_0x3EE8C
	ld hl, $A640
	call UnknownCall_0x3EE8C
	ld hl, $A660
	call UnknownCall_0x3EE8C
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

UnknownRJump_0x3EDF2:
	ld a, 13
	call UnknownCall_0x3E34
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
	jr nz, UnknownRJump_0x3EDF2
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

UnknownRJump_0x3EE16:
	ld a, 13
	call UnknownCall_0x3E34
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
	jr nz, UnknownRJump_0x3EE16
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

UnknownRJump_0x3EE44:
	ld a, 13
	call UnknownCall_0x3E34
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
	jr nz, UnknownRJump_0x3EE44
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

UnknownRJump_0x3EE75:
	ld a, 13
	call UnknownCall_0x3E34
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
	jr nz, UnknownRJump_0x3EE75
	pop de
	ret

UnknownCall_0x3EE8C:
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

UnknownCall_0x3EEA4:
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
	call UnknownCall_0x3E7B
	inc hl
	ldh_n_a $BA
	ld a, 24
	call UnknownCall_0x3E7B
	inc hl
	ldh_n_a $B9
	ld a, 24
	call UnknownCall_0x3E7B
	inc hl
	ldh_n_a $B8
	ld a, 24
	call UnknownCall_0x3E7B
	inc hl
	ldh_n_a $B7
	ld a, 24
	call UnknownCall_0x3E7B
	inc hl
	ld [$A842], a
	ld a, 24
	call UnknownCall_0x3E7B
	ld [$A843], a
	ret

UnknownCall_0x3EEF0:
	ld a, [$A840]
	ld d, 0
	ld e, a
	ld hl, $650E
	add de
	ld a, [hl]
	cp $FE
	ret nc
	ld d, 0
	ld e, a
	ld hl, $A848
	add de
	ld a, [$A224]
	or a
	jr nz, UnknownRJump_0x3EF19
	ld a, [$A2B4]
	or a
	jr nz, UnknownRJump_0x3EF25
	set 7, [hl]
	res 3, [hl]
	call UnknownCall_0x2934
	ret

UnknownRJump_0x3EF19:
	ld a, [$A2A0]
	cp $FF
	ret nz
	set 3, [hl]
	call UnknownCall_0x2934
	ret

UnknownRJump_0x3EF25:
	res 3, [hl]
	call UnknownCall_0x2934
	ret

UnknownJump_0x3EF2B:
UnknownCall_0x3EF2B:
	ld a, 228
	ld [sBGPalette], a
	ld a, 208
	ld [sOAMPalette1], a
	ld a, 57
	ld [sOAMPalette2], a
	ld a, [$A24F]
	or a
	jr z, UnknownRJump_0x3EF56
	ld a, [$A840]
	bit 0, a
	jr nz, UnknownRJump_0x3EF4C
	call UnknownCall_0x3F4B1
	jr UnknownRJump_0x3EF4F

UnknownRJump_0x3EF4C:
	call UnknownCall_0x3F5A4

UnknownRJump_0x3EF4F:
	ld a, 12
	ldh_n_a $9B
	ei
	ret

UnknownRJump_0x3EF56:
	ld a, [$A2B4]
	or a
	jr z, UnknownRJump_0x3EFB2
	ld a, [$A224]
	or a
	jr nz, UnknownRJump_0x3EFB2
	ld a, [$A840]
	cp $48
	jr nz, UnknownRJump_0x3EF70
	ld a, 71
	ld [$A840], a
	jr UnknownRJump_0x3EFB2

UnknownRJump_0x3EF70:
	ld a, [$A840]
	cp $1A
	jr z, UnknownRJump_0x3EF81
	cp $05
	jr z, UnknownRJump_0x3EF81
	cp $12
	jr z, UnknownRJump_0x3EF81
	jr UnknownRJump_0x3EF88

UnknownRJump_0x3EF81:
	ld a, 105
	ld [$A840], a
	jr UnknownRJump_0x3EFB2

UnknownRJump_0x3EF88:
	ld a, [$A840]
	cp $29
	jr nz, UnknownRJump_0x3EF96
	ld a, 44
	ld [$A840], a
	jr UnknownRJump_0x3EFB2

UnknownRJump_0x3EF96:
	ld a, [$A840]
	cp $2A
	jr nz, UnknownRJump_0x3EFA4
	ld a, 47
	ld [$A840], a
	jr UnknownRJump_0x3EFB2

UnknownRJump_0x3EFA4:
	ld a, [$A840]
	cp $3C
	jr nz, UnknownRJump_0x3EFB2
	ld a, 64
	ld [$A840], a
	jr UnknownRJump_0x3EFB2

UnknownRJump_0x3EFB2:
	call UnknownCall_0x3EEF0
	ld a, BANK(GFX_OW_Overworld) ;prepare bank switch
	ld bc, $0200
	ld hl, GFX_OW_Overworld
	ld de, $8000
	di
	call FarCopyMem
	call UnknownCall_0x3EEA4
	ld a, 8
	ld [$A844], a
	xor a
	ld [$A68B], a
	ld a, [$A224]
	or a
	jr nz, UnknownRJump_0x3F003
	ld a, [$A840]
	ld hl, $650E
	ld d, 0
	ld e, a
	add de
	ld a, [hl]
	cp $FE
	jr nc, UnknownRJump_0x3F003
	cp $05
	jp z, UnknownJump_0x3C6BD
	cp $09
	jp z, UnknownJump_0x3C6D7
	cp $0E
	jp z, UnknownJump_0x3C724
	cp $11
	jp z, UnknownJump_0x3C736
	cp $17
	jp z, UnknownJump_0x3C750
	cp $1D
	jp z, UnknownJump_0x3C77C

UnknownRJump_0x3F003:
	ld a, [$A840]
	cp $1E
	jr nc, UnknownRJump_0x3F04D
	cp $05
	jr z, UnknownRJump_0x3F014
	cp $1A
	jr z, UnknownRJump_0x3F014
	jr UnknownRJump_0x3F024

UnknownRJump_0x3F014:
	ld a, [$A224]
	or a
	jr nz, UnknownRJump_0x3F03D
	ld a, 63
	ld [$A840], a
	call UnknownCall_0x3EEA4
	jr UnknownRJump_0x3F07E

UnknownRJump_0x3F024:
	or a
	jr nz, UnknownRJump_0x3F03D
	ld a, [$A224]
	or a
	jr nz, UnknownRJump_0x3F03D
	ld a, [$A848]
	set 7, a
	ld [$A848], a
	ld a, 20
	ld [$A840], a
	call UnknownCall_0x3EEA4

UnknownJump_0x3F03D:
UnknownRJump_0x3F03D:
	call UnknownCall_0x3F156
	call UnknownCall_0x2934
	ld a, 12
	ldh_n_a $9B
	call UnknownCall_0x3EA9A
	ei
	ret

UnknownRJump_0x3F04D:
	cp $28
	jr nc, UnknownRJump_0x3F05C
	call UnknownCall_0x3D0FF
	ld a, 2
	ld [$A68B], a
	jp UnknownJump_0x3F147

UnknownRJump_0x3F05C:
	cp $32
	jr nc, UnknownRJump_0x3F06B

UnknownJump_0x3F060:
	call UnknownCall_0x3D208
	ld a, 1
	ld [$A68B], a
	jp UnknownJump_0x3F147

UnknownRJump_0x3F06B:
	cp $3C
	jr nc, UnknownRJump_0x3F07A

UnknownJump_0x3F06F:
	call UnknownCall_0x3D371
	ld a, 3
	ld [$A68B], a
	jp UnknownJump_0x3F147

UnknownRJump_0x3F07A:
	cp $46
	jr nc, UnknownRJump_0x3F089

UnknownRJump_0x3F07E:
	call UnknownCall_0x3D49F
	ld a, 4
	ld [$A68B], a
	jp UnknownJump_0x3F147

UnknownRJump_0x3F089:
	cp $50
	jr nc, UnknownRJump_0x3F098
	call UnknownCall_0x3D61F
	ld a, 5
	ld [$A68B], a
	jp UnknownJump_0x3F147

UnknownRJump_0x3F098:
	cp $5A
	jr nc, UnknownRJump_0x3F0A7
	call UnknownCall_0x3D79A
	ld a, 6
	ld [$A68B], a
	jp UnknownJump_0x3F147

UnknownRJump_0x3F0A7:
	cp $64
	jr nc, UnknownRJump_0x3F0C2
	cp $5B
	jr nz, UnknownRJump_0x3F0B7
	ld a, 92
	ld [$A840], a
	call UnknownCall_0x3EEA4

UnknownRJump_0x3F0B7:
	call UnknownCall_0x3D6EB
	ld a, 7
	ld [$A68B], a
	jp UnknownJump_0x3F147

UnknownRJump_0x3F0C2:
	cp $6E
	jr nc, UnknownRJump_0x3F0F6
	cp $66
	jr nz, UnknownRJump_0x3F0E4
	ld a, 104
	ld [$A840], a
	call UnknownCall_0x3EEA4
	ld a, [$A224]
	or a
	jp nz, UnknownJump_0x3F03D
	ld a, [$A86D]
	set 7, a
	ld [$A86D], a
	jp UnknownJump_0x3F03D

UnknownRJump_0x3F0E4:
	cp $6A
	jp z, UnknownJump_0x3F06F
	cp $6B
	jp z, UnknownJump_0x3F06F
	cp $6C
	jp z, UnknownJump_0x3F06F
	jp UnknownJump_0x3F03D

UnknownRJump_0x3F0F6:
	cp $78
	jr nc, UnknownRJump_0x3F104
	call UnknownCall_0x3D880
	ld a, 8
	ld [$A68B], a
	jr UnknownRJump_0x3F147

UnknownRJump_0x3F104:
	cp $78
	jp nz, UnknownJump_0x3F123
	ld a, 46
	ld [$A840], a
	call UnknownCall_0x3EEA4
	ld a, [$A224]
	or a
	jp nz, UnknownJump_0x3F060
	ld a, [$A86E]
	set 7, a
	ld [$A86E], a
	jp UnknownJump_0x3F060

UnknownJump_0x3F123:
	cp $7A
	jp nz, UnknownJump_0x3F142
	ld a, 49
	ld [$A840], a
	call UnknownCall_0x3EEA4
	ld a, [$A224]
	or a
	jp nz, UnknownJump_0x3F060
	ld a, [$A86F]
	set 7, a
	ld [$A86F], a
	jp UnknownJump_0x3F060

UnknownJump_0x3F142:
UnknownData_0x3F142:
INCBIN "baserom.gb", $3F142, $3F147 - $3F142


UnknownJump_0x3F147:
UnknownRJump_0x3F147:
	ld a, 146
	ld [$A878], a
	ei
	call UnknownCall_0x2934
	ld a, 12
	ldh_n_a $9B
	ret

UnknownCall_0x3F156:
	di
	xor a
	ld [sBGPalette], a
	call DisableVBlank
	ld a, 255
	ld [$A468], a
	call UnknownCall_0x2AAA
	di
	ldh_a_n $B7
	ld [sScrollY], a
	ldh_a_n $B9
	ld [sScrollX], a
	ld a, 0
	ld [$A690], a
	ld [$A789], a
	ld [$A68B], a
	ld hl, $7800
	ld bc, $B800
	ld de, $2020
	call UnknownCall_0x3EAE5
	ld hl, $7C00
	ld bc, $B820
	ld de, $2020
	call UnknownCall_0x3EAE5
	ld hl, $7000
	ld bc, $B000
	ld de, $2020
	call UnknownCall_0x3EAE5
	ld hl, $7400
	ld bc, $B020
	ld de, $2020
	call UnknownCall_0x3EAE5
	call UnknownCall_0x3ED4C
	call UnknownCall_0x3E46
	ld a, [$A840]
	cp $17
	jr z, UnknownRJump_0x3F1C2
	cp $18
	jr z, UnknownRJump_0x3F1C2
	call UnknownCall_0x3C901

UnknownRJump_0x3F1C2:
	ld a, BANK(GFX_OW_Overworld) ;prepare bank switch
	ld bc, $1800
	ld hl, GFX_OW_Overworld
	ld de, $8000
	di
	call FarCopyMem
	call UnknownCall_0x3E7BE
	call UnknownCall_0x3F275
	call UnknownCall_0x3EBC8
	call UnknownCall_0x3F203
	ld a, 136
	ld [$FF00+$4A], a
	ld a, 80
	ld [$FF00+$4B], a
	ld a, 227
	ldh_n_a $40
	call UnknownCall_0x3CBE7
	call UnknownCall_0x3CE43
	xor a
	ld [$A7A0], a
	ld [$A7A9], a
	ld a, 0
	ld [$A878], a
	ld a, 6
	ld [$A468], a
	ei
	ret

UnknownCall_0x3F203:
	ld hl, $A110
	ld de, $7251
	ld c, 36

UnknownRJump_0x3F20B:
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, UnknownRJump_0x3F20B
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
	ld a, [sCoinHigh]
	and $0F
	or $70
	ld [$A12A], a
	ld a, [sCoinLow]
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

UnknownRJump_0x3F24C:
	ld [hli], a
	dec c
	jr nz, UnknownRJump_0x3F24C
	ret

UnknownData_0x3F251:
INCBIN "baserom.gb", $3F251, $3F275 - $3F251


UnknownCall_0x3F275:
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

UnknownRJump_0x3F2C1:
	ld e, 0
	push bc

UnknownRJump_0x3F2C4:
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
	call UnknownCall_0x3E10
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
	cp $20
	jr nz, UnknownRJump_0x3F2C4
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
	jr nz, UnknownRJump_0x3F2C1
	ret

UnknownCall_0x3F307:
	ld a, 255
	ld [$A468], a
	call UnknownCall_0x2AAA
	call DisableVBlank
	ld a, 25 ;prepare bank switch
	ld bc, $1000
	ld hl, $4000
	ld de, $8800
	call FarCopyMem
	call UnknownCall_0x3F58
	xor a
	ld [sScrollX], a
	ld [sScrollY], a
	ld [$A690], a
	ldh_n_a $81
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
	call UnknownCall_0x3E46
	ret

UnknownCall_0x3F35A:
	ld a, 40
	ldh_n_a $C5
	ld a, 156
	ldh_n_a $C4
	call UnknownCall_0x3F37F
	add 16
	ldh_n_a $C6
	ld a, 0
	ldh_n_a $C7
	ld a, 0
	ldh_n_a $BB
	call UnknownCall_0x3F30
	ld a, 5
	ld [$A460], a
	ret

UnknownCall_0x3F37F:
	ld a, [sCurPowerup]
	ld d, 0
	ld e, a
	ld hl, $738B
	add de
	ld a, [hl]
	ret

UnknownData_0x3F38B:
INCBIN "baserom.gb", $3F38B, $3F38F - $3F38B


UnknownCall_0x3F38F:
	ld a, [sCoinLow]
	sub l
	daa
	ld a, [sCoinHigh]
	sbc h
	daa
	jr c, UnknownRJump_0x3F3B1
	ld a, [sCoinLow]
	sub l
	daa
	ld [sCoinLow], a
	ld a, [sCoinHigh]
	sbc h
	daa
	ld [sCoinHigh], a
	call UnknownCall_0x2934
	ld a, 0
	ret

UnknownRJump_0x3F3B1:
	ld a, 19
	ld [$A460], a
	ld a, 1
	ret

UnknownJump_0x3F3B9:
	ld hl, $0999
	call UnknownCall_0x3F38F
	or a
	jp nz, UnknownJump_0x3C7D9
	call UnknownCall_0x3F307
	ld a, 16 ;prepare bank switch
	ld bc, $0400
	ld hl, $7240
	ld de, $9800
	call FarCopyMem
	ld a, 9
	ld [$A68B], a
	ld de, $66D4
	call UnknownCall_0x3E2A2
	call UnknownCall_0x3F35A
	ld a, 225
	ld [sBGPalette], a
	ld a, 195
	ldh_n_a $40
	call UnknownCall_0x3F495
	ret

UnknownJump_0x3F3F0:
	ld hl, $0200
	call UnknownCall_0x3F38F
	or a
	jp nz, UnknownJump_0x3C7D9
	call UnknownCall_0x3F307
	ld a, 16 ;prepare bank switch
	ld bc, $0400
	ld hl, $7480
	ld de, $9800
	call FarCopyMem
	ld a, 10
	ld [$A68B], a
	ld de, $671C
	call UnknownCall_0x3E2A2
	call UnknownCall_0x3F35A
	ld a, 225
	ld [sBGPalette], a
	ld a, 195
	ldh_n_a $40
	call UnknownCall_0x3F495
	ret

UnknownJump_0x3F427:
	ld hl, $0050
	call UnknownCall_0x3F38F
	or a
	jp nz, UnknownJump_0x3C7D9
	call UnknownCall_0x3F307
	ld a, 16 ;prepare bank switch
	ld bc, $0400
	ld hl, $76C0
	ld de, $9800
	call FarCopyMem
	ld a, 11
	ld [$A68B], a
	ld de, $6704
	call UnknownCall_0x3E2A2
	call UnknownCall_0x3F35A
	ld a, 225
	ld [sBGPalette], a
	ld a, 195
	ldh_n_a $40
	call UnknownCall_0x3F495
	ret

UnknownJump_0x3F45E:
	ld hl, $0030
	call UnknownCall_0x3F38F
	or a
	jp nz, UnknownJump_0x3C7D9
	call UnknownCall_0x3F307
	ld a, 16 ;prepare bank switch
	ld bc, $0400
	ld hl, $7900
	ld de, $9800
	call FarCopyMem
	ld a, 12
	ld [$A68B], a
	ld de, $66EC
	call UnknownCall_0x3E2A2
	call UnknownCall_0x3F35A
	ld a, 225
	ld [sBGPalette], a
	ld a, 195
	ldh_n_a $40
	call UnknownCall_0x3F495
	ret

UnknownCall_0x3F495:
	ld a, 21
	ld [$A468], a
	ld a, 5
	ld [$A460], a
	ret

UnknownCall_0x3F4A0:
	ld a, 24
	ld hl, $4A81
	call UnknownCall_0x3E00
	ld a, [$A7A6]
	cp $03
	call z, UnknownCall_0x3D880
	ret

UnknownCall_0x3F4B1:
	ld a, 255
	ld [$A468], a
	call UnknownCall_0x2AAA
	call DisableVBlank
	ld a, 25 ;prepare bank switch
	ld bc, $1000
	ld hl, $5000
	ld de, $8800
	call FarCopyMem
	call UnknownCall_0x3F58
	xor a
	ld [sScrollX], a
	ld [sScrollY], a
	ld [$A690], a
	ldh_n_a $81
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
	ld a, [sTimerHigh]
	and $0F
	jr nz, UnknownRJump_0x3F507

UnknownData_0x3F502:
INCBIN "baserom.gb", $3F502, $3F507 - $3F502


UnknownRJump_0x3F507:
	cp $01
	jr nz, UnknownRJump_0x3F510

UnknownData_0x3F50B:
INCBIN "baserom.gb", $3F50B, $3F510 - $3F50B


UnknownRJump_0x3F510:
	ld hl, $4A58
	ld a, l
	ld [$A7AE], a
	ld [$A7B5], a
	ld a, h
	ld [$A7AF], a
	ld [$A7B6], a
	call UnknownCall_0x3E46
	ld a, 17 ;prepare bank switch
	ld bc, $0400
	ld hl, $7800
	ld de, $9800
	call FarCopyMem
	ld a, 13
	ld [$A68B], a
	ld de, $6734
	call UnknownCall_0x3E2A2
	ld a, 240
	ldh_n_a $C5
	ld a, 124
	ldh_n_a $C4
	call UnknownCall_0x3F37F
	ldh_n_a $C6
	ld a, 0
	ldh_n_a $C7
	ld a, 1
	ldh_n_a $BB
	call UnknownCall_0x3F30
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
	ldh_n_a $40
	ld a, 21
	ld [$A468], a
	ld a, 0
	ld [$A24F], a
	ret

UnknownCall_0x3F5A4:
	ld a, 255
	ld [$A468], a
	call UnknownCall_0x2AAA
	call DisableVBlank
	ld a, 25 ;prepare bank switch
	ld bc, $1000
	ld hl, $5000
	ld de, $8800
	call FarCopyMem
	call UnknownCall_0x3F58
	xor a
	ld [sScrollX], a
	ld [sScrollY], a
	ld [$A690], a
	ldh_n_a $81
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
	call UnknownCall_0x3E46
	ld a, 17 ;prepare bank switch
	ld bc, $0240
	ld hl, $7A40
	ld de, $9800
	call FarCopyMem
	ld a, 14
	ld [$A68B], a
	ld de, $6761
	call UnknownCall_0x3E2A2
	ld a, 240
	ldh_n_a $C5
	ld a, 124
	ldh_n_a $C4
	call UnknownCall_0x3F37F
	ldh_n_a $C6
	ld a, 0
	ldh_n_a $C7
	ld a, 1
	ldh_n_a $BB
	call UnknownCall_0x3F30
	ld a, 5
	ld [$A460], a
	ld a, 57
	ld [sOAMPalette2], a
	ld a, 195
	ldh_n_a $40
	ld a, 21
	ld [$A468], a
	ld a, 0
	ld [$A24F], a
	ret

UnknownData_0x3F64D:
INCBIN "baserom.gb", $3F64D, $40000 - $3F64D



SECTION "bank10", ROMX, BANK[$10]


UnknownData_0x40000:
INCBIN "baserom.gb", $40000, $40200 - $40000

GFX_OW_SpaceZone: ;$40200
INCBIN "gfx/overworld/spacezone.2bpp"

INCBIN "baserom.gb", $41800, $42000 - $41800

GFX_OW_MarioCastle: ;$42000
INCBIN "gfx/overworld/mariocastle.2bpp"

INCBIN "tilemaps/overworld/minigamehill.bin"
INCBIN "tilemaps/minigame/30coin.bin"
INCBIN "tilemaps/minigame/50coin.bin"
INCBIN "tilemaps/minigame/200coin.bin"
INCBIN "tilemaps/minigame/999coin.bin"
INCBIN "baserom.gb", $43B40, $44000 - $43B40



SECTION "bank11", ROMX, BANK[$11]


UnknownData_0x44000:
INCBIN "baserom.gb", $44000, $44200 - $44000

GFX_OW_MarioZone: ;$44200
INCBIN "gfx/overworld/mariozone.2bpp"

INCBIN "baserom.gb", $45800, $46000 - $45800

GFX_OW_WarioCastle: ;$46000
INCBIN "gfx/overworld/wariocastle.2bpp"

INCBIN "baserom.gb", $47000, $47800 - $47000
INCBIN "tilemaps/minigame/conveyor.bin"
INCBIN "tilemaps/minigame/rat.bin"
INCBIN "baserom.gb", $47C80, $48000 - $47C80



SECTION "bank12", ROMX, BANK[$12]


UnknownData_0x48000:
INCBIN "baserom.gb", $48000, $482F0 - $48000
;$482F0 Pointers to levels 
	dw Level_07
	dw Level_08
	dw Level_09
	dw Level_10
	
INCBIN "baserom.gb", $482F8, $48500 - $482F8

Level_07: ;$48500
INCBIN "levels/level07.bin"

Level_08: ;$48E29
INCBIN "levels/level08.bin"

Level_09: ;$494D9
INCBIN "levels/level09.bin"

Level_10: ;$49FF2
INCBIN "levels/level10.bin"

INCBIN "baserom.gb", $4A948, $4C000 - $4A948

SECTION "bank13", ROMX, BANK[$13]


UnknownData_0x4C000:
INCBIN "baserom.gb", $4C000, $4C2F0 - $4C000
;$4C2F0 Pointers to levels 
	dw Level_18
	dw Level_19
	dw Level_20
	dw Level_25
	
INCBIN "baserom.gb", $4C2F8, $4C500 - $4C2F8

Level_18: ;$4C500
INCBIN "levels/level18.bin"

Level_19: ;$4CE19
INCBIN "levels/level19.bin"

Level_20: ;$4DAFF
INCBIN "levels/level20.bin"

Level_25: ;$4E33A
INCBIN "levels/level25.bin"

INCBIN "baserom.gb", $4FEAF, $50000 - $4FEAF

SECTION "bank14", ROMX, BANK[$14]


UnknownData_0x50000:
INCBIN "baserom.gb", $50000, $502F0 - $50000
;$502F0 Pointers to levels 
	dw Level_15
	dw Level_16
	dw Level_17
	
INCBIN "baserom.gb", $502F6, $50500 - $502F6

Level_15: ;$50500
INCBIN "levels/level15.bin"

Level_16: ;$50AB4
INCBIN "levels/level16.bin"

Level_17: ;$51EC9
INCBIN "levels/level17.bin"

INCBIN "baserom.gb", $52341, $54000 - $52341

SECTION "bank15", ROMX, BANK[$15]


UnknownData_0x54000:
INCBIN "baserom.gb", $54000, $542F0 - $54000
;$542F0 Pointers to levels 
	dw Level_21
	dw Level_22
	dw Level_23
	dw Level_24
	
INCBIN "baserom.gb", $542F8, $54500 - $542F8

Level_21: ;$54500
INCBIN "levels/level21.bin"

Level_22: ;$54B41
INCBIN "levels/level22.bin"

Level_23: ;$55242
INCBIN "levels/level23.bin"

Level_24: ;$55C4C
INCBIN "levels/level24.bin"

INCBIN "baserom.gb", $562DE, $58000 - $562DE



SECTION "bank16", ROMX, BANK[$16]


UnknownCall_0x58000:
	ld a, [$A224]
	cp $FF
	ret z
	ld a, [$A24F]
	and a
	jr z, UnknownRJump_0x5800F
	xor a
	ld [$FF00+$E2], a

UnknownRJump_0x5800F:
	call UnknownCall_0x3A8C
	ld a, [$AF3E]
	and a
	ret nz
	ld a, [$FF00+$DF]
	and a
	jr z, UnknownRJump_0x5802B
	ld a, [$AF08]
	ld b, a
	ld a, [$AF29]
	swap a
	and $03
	srl a
	xor b
	ret nz

UnknownRJump_0x5802B:
	ld a, 1
	ld [$AF09], a
	ld a, [$FF00+$EB]
	and a
	jp nz, UnknownJump_0x58101
	ld a, [$AF06]
	and a
	jp nz, UnknownJump_0x59C04
	ld a, [$FF00+$D5]
	rst $28

UnknownData_0x58040:
INCBIN "baserom.gb", $58040, $58101 - $58040


UnknownJump_0x58101:
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x58110
	call UnknownCall_0x5B3C6
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a
	ret

UnknownRJump_0x58110:
	dec a
	rst $28

UnknownData_0x58112:
INCBIN "baserom.gb", $58112, $5811A - $58112

	ld b, 1
	call UnknownCall_0x3D32
	call UnknownCall_0x3BB8
	ld a, [$AF2F]
	bit 0, a
	jr z, UnknownRJump_0x5812E
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a

UnknownRJump_0x5812E:
	call UnknownCall_0x5B481
	call UnknownCall_0x3D2D
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
	call UnknownCall_0x3D22
	call UnknownCall_0x3C1C
	ld a, [$AF2F]
	bit 1, a
	jr z, UnknownRJump_0x5812E
	ld a, [$FF00+$DF]
	dec a
	ld [$FF00+$DF], a
	jr UnknownRJump_0x5812E
	ld b, 1
	call UnknownCall_0x3D32
	call UnknownCall_0x3BB8
	ld a, [$AF2F]
	bit 0, a
	jr z, UnknownRJump_0x5816C
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a

UnknownRJump_0x5816C:
	call UnknownCall_0x5B451
	call UnknownCall_0x3D3D
	call UnknownCall_0x3B40
	ld a, [$AF2F]
	bit 3, a
	ret z
	ld a, [$FF00+$EB]
	cp $02
	jr z, UnknownRJump_0x5819B
	call UnknownCall_0x3AA0
	ret
	ld b, 1
	call UnknownCall_0x3D22
	call UnknownCall_0x3C1C
	ld a, [$AF2F]
	bit 1, a
	jr z, UnknownRJump_0x5816C
	ld a, [$FF00+$DF]
	dec a
	ld [$FF00+$DF], a
	jr UnknownRJump_0x5816C

UnknownRJump_0x5819B:
	ld a, [$FF00+$E2]
	ld [$AFCC], a
	call UnknownCall_0x3AA0
	ld a, [$AFCC]
	ld [$FF00+$E2], a
	call UnknownCall_0x3CB1
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$DF]
	dec a
	jr z, UnknownRJump_0x581CE
	dec a
	jr z, UnknownRJump_0x581E2

UnknownJump_0x581B9:
	ld b, 20
	call UnknownCall_0x3D2D
	ld a, [$FF00+$DD]
	xor $40
	ld [$FF00+$DD], a
	xor a
	ld [$FF00+$E0], a
	ld [$FF00+$E2], a
	ld a, 1
	ld [$FF00+$DF], a
	ret

UnknownRJump_0x581CE:
	call UnknownCall_0x5B465
	sla b
	call UnknownCall_0x3D2D
	ld a, [$FF00+$E0]
	cp c
	ret nz
	ld a, 2
	ld [$FF00+$DF], a
	xor a
	ld [$FF00+$E0], a
	ret

UnknownRJump_0x581E2:
	call UnknownCall_0x5B451
	sla b
	call UnknownCall_0x3D3D
	ld a, [$FF00+$D9]
	cp $A0
	ret c
	ld a, 2
	ld [$AF26], a
	call UnknownCall_0x5B2D7
	ld a, [$A2E0]
	and a
	ret z
	dec a
	ld [$A2E0], a
	ret
	call UnknownCall_0x5B51A
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x58215
	call UnknownCall_0x5B3C6
	ld a, 16
	ld [$FF00+$DE], a
	ld a, 78
	ld [$FF00+$E2], a
	ret

UnknownJump_0x58215:
UnknownRJump_0x58215:
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_0x5821E:
INCBIN "baserom.gb", $5821E, $58226 - $5821E


UnknownJump_0x58226:
	call UnknownCall_0x3C1C
	ld a, [$AF2F]
	bit 1, a
	jr nz, UnknownRJump_0x58237
	ld b, 1
	call UnknownCall_0x3D22
	jr UnknownRJump_0x58243

UnknownRJump_0x58237:
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a
	ret

UnknownRJump_0x58243:
	call UnknownCall_0x3B40
	ld a, [$AF2F]
	bit 3, a
	ret nz
	ld a, [$FF00+$DF]
	add 2
	ld [$FF00+$DF], a
	ret

UnknownJump_0x58253:
	call UnknownCall_0x3BB8
	ld a, [$AF2F]
	bit 0, a
	jr nz, UnknownRJump_0x58264
	ld b, 1
	call UnknownCall_0x3D32
	jr UnknownRJump_0x58243

UnknownRJump_0x58264:
	ld a, [$FF00+$DF]
	sub 1
	ld [$FF00+$DF], a
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a
	ret

UnknownJump_0x58271:
	call UnknownCall_0x3C1C
	ld a, [$AF2F]
	bit 1, a
	jr nz, UnknownRJump_0x58237
	ld b, 1
	call UnknownCall_0x3D22
	jr UnknownRJump_0x58293

UnknownJump_0x58282:
	call UnknownCall_0x3BB8
	ld a, [$AF2F]
	bit 0, a
	jr nz, UnknownRJump_0x58264
	ld b, 1
	call UnknownCall_0x3D32
	jr UnknownRJump_0x58293

UnknownRJump_0x58293:
	call UnknownCall_0x5B451
	call UnknownCall_0x3D3D
	call UnknownCall_0x3B40
	ld a, [$AF2F]
	bit 3, a
	ret z
	ld a, [$FF00+$DF]
	sub 2
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$DF]
	dec a
	jr z, UnknownRJump_0x582C3
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

UnknownRJump_0x582C3:
	ld hl, $FFE0
	dec [hl]
	ret nz
	ld a, 1
	ld [$AF26], a
	call UnknownCall_0x5B2D7
	ret
	call UnknownCall_0x5B585
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x582F5
	ld a, 86
	ld [$FF00+$E2], a

UnknownJump_0x582DD:
	call UnknownCall_0x3B40
	ld a, [$AF2F]
	bit 3, a
	jr nz, UnknownRJump_0x582EE

UnknownData_0x582E7:
INCBIN "baserom.gb", $582E7, $582EE - $582E7


UnknownRJump_0x582EE:
	xor a
	ld [$FF00+$E0], a
	call UnknownCall_0x5B3C6
	ret

UnknownJump_0x582F5:
UnknownRJump_0x582F5:
	dec a
	rst $28

UnknownData_0x582F7:
INCBIN "baserom.gb", $582F7, $582FB - $582F7


UnknownJump_0x582FB:
UnknownCall_0x582FB:
	ld a, [$FF00+$F0]
	and $01
	jr nz, UnknownRJump_0x58339
	ld b, 1
	call UnknownCall_0x3D22
	call UnknownCall_0x3C1C
	ld a, [$AF2F]
	bit 1, a
	ret z
	ld a, 2
	ld [$FF00+$DF], a
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a
	ret

UnknownJump_0x5831A:
UnknownCall_0x5831A:
	ld a, [$FF00+$F0]
	and $01
	jr nz, UnknownRJump_0x58339
	ld b, 1
	call UnknownCall_0x3D32
	call UnknownCall_0x3BB8
	ld a, [$AF2F]
	bit 0, a
	ret z
	ld a, 1
	ld [$FF00+$DF], a
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a
	ret

UnknownRJump_0x58339:
	call UnknownCall_0x3B40
	ld a, [$AF2F]
	bit 3, a
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
	jr z, UnknownRJump_0x58364
	dec a
	jr z, UnknownRJump_0x58380
	ld a, 6
	ld [$FF00+$E2], a
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 192
	ld [$FF00+$EC], a
	ret

UnknownRJump_0x58364:
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	jr z, UnknownRJump_0x5837B
	call UnknownCall_0x3B40
	ld a, [$AF2F]
	bit 3, a
	ret nz
	call UnknownCall_0x5B451
	call UnknownCall_0x3D3D
	ret

UnknownRJump_0x5837B:
	ld a, 2
	ld [$FF00+$DF], a
	ret

UnknownRJump_0x58380:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld a, [$FF00+$DB]
	xor $0B
	ld [$FF00+$DB], a
	ld a, [$FF00+$EC]
	inc a
	ld [$FF00+$EC], a
	cp $08
	ret nz
	ld a, 1
	ld [$FF00+$D5], a
	call UnknownCall_0x3AA0
	ret
	ld a, [$FF00+$E2]
	bit 6, a
	call nz, UnknownCall_0x5B697
	call UnknownCall_0x5B607
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x583B2
	call UnknownCall_0x5B3C6
	ld a, 95
	ld [$FF00+$E2], a
	ret

UnknownRJump_0x583B2:
	dec a
	rst $28

UnknownData_0x583B4:
INCBIN "baserom.gb", $583B4, $583BC - $583B4

	call UnknownCall_0x3BA4
	ld a, [$AF2F]
	bit 0, a
	jr nz, UnknownRJump_0x583DB
	ld b, 3
	call UnknownCall_0x3D32

UnknownRJump_0x583CB:
	call UnknownCall_0x3B40
	ld a, [$AF2F]
	bit 3, a
	ret nz
	ld a, [$FF00+$DF]
	add 2
	ld [$FF00+$DF], a
	ret

UnknownRJump_0x583DB:
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	ld a, 2
	ld [$A460], a
	ret
	call UnknownCall_0x3C08
	ld a, [$AF2F]
	bit 1, a
	jr nz, UnknownRJump_0x583F7
	ld b, 3
	call UnknownCall_0x3D22
	jr UnknownRJump_0x583CB

UnknownRJump_0x583F7:
	ld a, [$FF00+$DF]
	dec a
	ld [$FF00+$DF], a
	ld a, 2
	ld [$A460], a
	ret
	call UnknownCall_0x3BA4
	ld a, [$AF2F]
	bit 0, a
	jr nz, UnknownRJump_0x583DB
	ld b, 3
	call UnknownCall_0x3D32

UnknownRJump_0x58411:
	call UnknownCall_0x3B40
	ld a, [$AF2F]
	bit 3, a
	jr nz, UnknownRJump_0x58423
	call UnknownCall_0x5B451
	inc b
	call UnknownCall_0x3D3D
	ret

UnknownRJump_0x58423:
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$DF]
	sub 2
	ld [$FF00+$DF], a
	ld a, [$FF00+$D4]
	and $F0
	ld [$FF00+$D4], a
	ret
	call UnknownCall_0x3C08
	ld a, [$AF2F]
	bit 1, a
	jr nz, UnknownRJump_0x583F7
	ld b, 3
	call UnknownCall_0x3D22
	jr UnknownRJump_0x58411
	ld a, [sPipeTravelDirection]
	and $F0
	jr z, UnknownRJump_0x58452
	xor a
	ld [$AF3A], a
	jp UnknownJump_0x5B2D7

UnknownRJump_0x58452:
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x5845F
	xor a
	ld [$FF00+$E2], a
	ld a, 1
	ld [$FF00+$DF], a
	ret

UnknownRJump_0x5845F:
	dec a
	rst $28

UnknownData_0x58461:
INCBIN "baserom.gb", $58461, $58463 - $58461

	call UnknownCall_0x5B4C1
	call UnknownCall_0x5B697
	ld a, [$AF2E]
	and a
	jr nz, UnknownRJump_0x584C3
	call UnknownCall_0x3B68
	ld a, [$AF2F]
	bit 2, a
	jr nz, UnknownRJump_0x584C3
	ldh_a_n $80
	bit 1, a
	ret nz
	xor a
	ld [$AF3A], a
	call UnknownCall_0x3AB4
	ld b, 16
	ld a, [sMarioDirection]
	cp $01
	jr z, UnknownRJump_0x584A9
	call UnknownCall_0x3D22
	call UnknownCall_0x3C08
	ld a, [$AF2F]
	bit 1, a
	ret z
	ld b, 16
	call UnknownCall_0x3D32
	ld a, 95
	ld [$FF00+$E2], a
	ld a, 2
	ld [$FF00+$DF], a
	ret

UnknownRJump_0x584A9:
	call UnknownCall_0x3D32
	call UnknownCall_0x3BA4
	ld a, [$AF2F]
	bit 0, a
	ret z
	ld b, 16
	call UnknownCall_0x3D22
	ld a, 95
	ld [$FF00+$E2], a
	ld a, 1
	ld [$FF00+$DF], a
	ret

UnknownRJump_0x584C3:
	xor a
	ld [$AF3A], a
	call UnknownCall_0x3ADC
	ret
	ld a, [sPipeTravelDirection]
	and $F0
	jp nz, UnknownJump_0x5B2D7
	ld a, [$FF00+$DF]
	dec a
	jr z, UnknownRJump_0x5851C
	dec a
	jr z, UnknownRJump_0x5850C
	dec a
	jr z, UnknownRJump_0x58537
	jr UnknownRJump_0x584F3
	ld a, [sPipeTravelDirection]
	and $F0
	jp nz, UnknownJump_0x5B2D7
	ld a, [$FF00+$DF]
	dec a
	jr z, UnknownRJump_0x5850C
	dec a
	jr z, UnknownRJump_0x5851C
	dec a
	jr z, UnknownRJump_0x58537

UnknownRJump_0x584F3:
	ld a, 128
	ld [$FF00+$DC], a
	call UnknownCall_0x5B4B4
	cp $18
	ret c
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 32
	ld [$FF00+$E8], a
	ld [$FF00+$E9], a
	ld a, 68
	ld [$FF00+$E2], a
	ret

UnknownRJump_0x5850C:
	call UnknownCall_0x5B51A
	ld b, 1
	call UnknownCall_0x3D2D
	ld a, [$FF00+$E8]
	sub b
	ld [$FF00+$E8], a
	ret nz
	jr UnknownRJump_0x5852A

UnknownRJump_0x5851C:
	call UnknownCall_0x5B51A
	ld b, 1
	call UnknownCall_0x3D3D
	ld a, [$FF00+$E8]
	sub b
	ld [$FF00+$E8], a
	ret nz

UnknownRJump_0x5852A:
	ld a, [$FF00+$E9]
	ld [$FF00+$E8], a
	ld hl, $FFDF
	inc [hl]
	ld a, 24
	ld [$FF00+$EC], a
	ret

UnknownRJump_0x58537:
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	xor a
	ld [$FF00+$DF], a
	ret
	ld a, [sPipeTravelDirection]
	and $F0
	jp nz, UnknownJump_0x5B2D7
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x5855A
	call UnknownCall_0x5B3E0
	inc a
	jr z, UnknownRJump_0x58556
	ld a, 32

UnknownRJump_0x58556:
	ld [$FF00+$DD], a
	jr UnknownRJump_0x584F3

UnknownRJump_0x5855A:
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_0x5855E:
INCBIN "baserom.gb", $5855E, $58566 - $5855E

	call UnknownCall_0x585DA
	ld b, 1
	call UnknownCall_0x3D2D
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
	cp $13
	jr z, UnknownRJump_0x58596
	ld a, [$AF38]
	set 6, a
	ld [$AF38], a

UnknownRJump_0x58596:
	call UnknownCall_0x5B36D
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
	call UnknownCall_0x585DA
	ld b, 1
	call UnknownCall_0x3D3D
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

UnknownCall_0x585DA:
	call UnknownCall_0x5B41A
	ld a, [$AF2C]
	dec a
	jr z, UnknownRJump_0x585E8
	ld a, 18
	ld [$FF00+$DB], a
	ret

UnknownRJump_0x585E8:
	ld a, 20
	ld [$FF00+$DB], a
	ret
	call UnknownCall_0x5B521
	ld a, [$FF00+$DF]
	dec a
	jr z, UnknownRJump_0x58613
	dec a
	jr z, UnknownRJump_0x5861A
	ld a, 64
	ld [$FF00+$E2], a
	ld b, 12
	call UnknownCall_0x3D2D
	ld a, [$FF00+$DD]
	bit 6, a
	jr z, UnknownRJump_0x5860F
	res 6, a
	ld [$FF00+$DD], a
	ld a, 1
	ld [$FF00+$E8], a

UnknownRJump_0x5860F:
	call UnknownCall_0x3CB1
	ret

UnknownRJump_0x58613:
	ld b, 2
	call UnknownCall_0x3D22
	jr UnknownRJump_0x5861F

UnknownRJump_0x5861A:
	ld b, 2
	call UnknownCall_0x3D32

UnknownRJump_0x5861F:
	ld b, 1
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_0x5862A
	call UnknownCall_0x3D2D
	ret

UnknownRJump_0x5862A:
	call UnknownCall_0x3D3D
	ret
	call UnknownCall_0x5B521
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x58642
	call UnknownCall_0x5B3C6
	ld a, 16
	ld [$FF00+$DE], a
	ld a, 86
	ld [$FF00+$E2], a
	ret

UnknownJump_0x58642:
UnknownRJump_0x58642:
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_0x58646:
INCBIN "baserom.gb", $58646, $5864E - $58646

	ld a, [$FF00+$F0]
	and $01
	jr nz, UnknownRJump_0x5868C
	ld b, 1
	call UnknownCall_0x3D22
	call UnknownCall_0x3C1C
	ld a, [$AF2F]
	bit 1, a
	ret z
	ld a, 2
	ld [$FF00+$DF], a
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a
	ret
	ld a, [$FF00+$F0]
	and $01
	jr nz, UnknownRJump_0x5868C
	ld b, 1
	call UnknownCall_0x3D32
	call UnknownCall_0x3BB8
	ld a, [$AF2F]
	bit 0, a
	ret z
	ld a, 1
	ld [$FF00+$DF], a
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a
	ret

UnknownRJump_0x5868C:
	ld a, [$FF00+$E8]
	dec a
	jr z, UnknownRJump_0x586AD
	call UnknownCall_0x5B47A
	ld a, [$FF00+$E0]
	cp c
	jr z, UnknownRJump_0x586A5
	call UnknownCall_0x3D2D
	call UnknownCall_0x3B7C
	ld a, [$AF2F]
	bit 2, a
	ret z

UnknownRJump_0x586A5:
	xor a
	ld [$FF00+$E0], a
	ld a, 1
	ld [$FF00+$E8], a
	ret

UnknownRJump_0x586AD:
	call UnknownCall_0x5B451
	call UnknownCall_0x3D3D
	call UnknownCall_0x3B40
	ld a, [$AF2F]
	bit 3, a
	ret z
	xor a
	ld [$FF00+$E8], a
	ld a, [$FF00+$E9]
	inc a
	cp $04
	jr z, UnknownRJump_0x586D6
	ld [$FF00+$E9], a
	ld a, 10
	ld [$FF00+$E0], a
	ld a, [$FF00+$DF]
	cp $03
	ret nc
	add 2
	ld [$FF00+$DF], a
	ret

UnknownRJump_0x586D6:
	xor a
	ld [$FF00+$E0], a
	ld [$FF00+$E8], a
	ld [$FF00+$E9], a
	call UnknownCall_0x5B3C6
	ret
	ld a, 133
	ld [$FF00+$E2], a
	ret
	ld a, 137
	ld [$FF00+$E2], a
	ret

UnknownData_0x586EB:
INCBIN "baserom.gb", $586EB, $586EE - $586EB

	ld a, [$FF00+$D5]
	add 102
	ld [$FF00+$E2], a
	ret
	ld a, 1
	ld [$FF00+$DF], a
	call UnknownCall_0x5B68B
	ld b, 2
	call UnknownCall_0x3D2D
	ld a, [$FF00+$E8]
	add b
	ld [$FF00+$E8], a
	cp $20
	ret nz
	ld a, 2
	ld [$AF26], a
	call UnknownCall_0x5B2D7
	ret
	ld a, [$FF00+$DF]
	dec a
	jr z, UnknownRJump_0x58734
	dec a
	jr z, UnknownRJump_0x58749
	dec a
	jr z, UnknownRJump_0x5874C
	dec a
	jr z, UnknownRJump_0x5874F
	dec a
	jr z, UnknownRJump_0x58752
	ld a, 128
	ld [$FF00+$E2], a
	xor a
	ld [$FF00+$E8], a
	ld a, 128
	ld [$FF00+$DC], a
	ld a, 1
	ld [$AF3E], a
	ret

UnknownRJump_0x58734:
	ld b, 1
	call UnknownCall_0x3D2D
	ld a, [$FF00+$E8]
	inc a
	ld [$FF00+$E8], a
	cp $08
	ret nz
	ld a, 3
	ld [$FF00+$DF], a
	xor a
	ld [$FF00+$DC], a
	ret

UnknownRJump_0x58749:
	jp UnknownJump_0x58226

UnknownRJump_0x5874C:
	jp UnknownJump_0x58253

UnknownRJump_0x5874F:
	jp UnknownJump_0x58271

UnknownRJump_0x58752:
	jp UnknownJump_0x58282
	call UnknownCall_0x5B68B
	ld a, [$FF00+$DF]
	dec a
	jr z, UnknownRJump_0x58787
	dec a
	ret z
	ld a, 128
	ld [$FF00+$E2], a
	ld a, [$FF00+$D2]
	cp $10
	jr z, UnknownRJump_0x58777
	ld a, 128
	ld [$FF00+$DC], a
	ld a, 1
	ld [$AF3E], a
	ld a, 2
	ld [$FF00+$DF], a
	ret

UnknownRJump_0x58777:
	ld a, [$FF00+$D5]
	add 112
	ld [$FF00+$E2], a
	ld a, 2
	ld [$FF00+$DF], a
	ld b, 8
	call UnknownCall_0x3D3D
	ret

UnknownRJump_0x58787:
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld b, 1
	call UnknownCall_0x3D2D
	ld a, [$FF00+$E8]
	inc a
	ld [$FF00+$E8], a
	cp $08
	ret nz
	ld a, 2
	ld [$FF00+$DF], a
	xor a
	ld [$FF00+$DC], a
	ret
	call UnknownCall_0x5B68B
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x587B7
	ld a, 132
	ld [$FF00+$E2], a
	ld b, 56
	call UnknownCall_0x3D2D
	ld a, 1
	ld [$FF00+$DF], a
	ret

UnknownRJump_0x587B7:
	ld b, 1
	call UnknownCall_0x3D3D
	ret
	ld a, [$FF00+$DF]
	dec a
	jr z, UnknownRJump_0x587D3
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

UnknownRJump_0x587D3:
	call UnknownCall_0x5B545
	ret
	ld a, [$FF00+$DF]
	dec a
	jr z, UnknownRJump_0x587D3
	dec a
	jr z, UnknownRJump_0x587EE
	ld a, [$A2A0]
	and a
	jr nz, UnknownRJump_0x587FB
	ld a, 135
	ld [$FF00+$E2], a
	ld a, 2
	ld [$FF00+$DF], a
	ret

UnknownRJump_0x587EE:
	ld a, [$FF00+$E7]
	bit 4, a
	ret z
	ld a, 1
	ld [$FF00+$DF], a
	xor a
	ld [$FF00+$E2], a
	ret

UnknownRJump_0x587FB:
	ld a, 2
	ld [$AF26], a
	call UnknownCall_0x5B2D7
	ret
	ld a, [$FF00+$DF]
	rst $28

UnknownData_0x58807:
INCBIN "baserom.gb", $58807, $5880F - $58807

	ld a, 1
	ld [$FF00+$DF], a
	ret
	call UnknownCall_0x5B4B4
	cp $30
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
	cp $88
	ret nz
	ld a, 3
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$E7]
	bit 4, a
	jr nz, UnknownRJump_0x58844
	call UnknownCall_0x5B511
	ld b, 1
	call UnknownCall_0x3D2D
	ret

UnknownRJump_0x58844:
	call UnknownCall_0x5B2D7
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x58859
	call UnknownCall_0x5B3C6
	ld a, 77
	ld [$FF00+$E2], a
	ld a, 1
	ld [$FF00+$EC], a
	ret

UnknownRJump_0x58859:
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_0x5885D:
INCBIN "baserom.gb", $5885D, $58865 - $5885D

	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0x58872
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 56
	ld [$FF00+$DB], a

UnknownRJump_0x58872:
	call UnknownCall_0x3C1C
	ld a, [$AF2F]
	bit 1, a
	jr nz, UnknownRJump_0x588E2
	ld b, 1
	call UnknownCall_0x3D22
	jr UnknownRJump_0x5889F
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0x58890
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 56
	ld [$FF00+$DB], a

UnknownRJump_0x58890:
	call UnknownCall_0x3BB8
	ld a, [$AF2F]
	bit 0, a
	jr nz, UnknownRJump_0x588E2
	ld b, 1
	call UnknownCall_0x3D32

UnknownRJump_0x5889F:
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_0x588B9
	call UnknownCall_0x5B46C
	call UnknownCall_0x3D2D
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

UnknownRJump_0x588B9:
	call UnknownCall_0x3B40
	ld a, [$AF2F]
	bit 3, a
	jr nz, UnknownRJump_0x588CA
	call UnknownCall_0x5B445
	call UnknownCall_0x3D3D
	ret

UnknownRJump_0x588CA:
	xor a
	ld [$FF00+$E0], a
	ld [$FF00+$E8], a
	ld a, 8
	ld [$FF00+$EC], a
	call UnknownCall_0x5B4B4
	cp $30
	jr c, UnknownRJump_0x588E8
	ld a, [$FF00+$E9]
	inc a
	ld [$FF00+$E9], a
	cp $03
	ret nz

UnknownJump_0x588E2:
UnknownRJump_0x588E2:
	xor a
	ld [$FF00+$E9], a
	jp UnknownJump_0x59D2D

UnknownRJump_0x588E8:
	ld a, 8
	ld [$FF00+$EC], a
	call UnknownCall_0x5B3E0
	bit 7, a
	jr z, UnknownRJump_0x58900
	ld b, 1
	ld a, [$FF00+$DF]
	xor b
	jr z, UnknownRJump_0x5891D

UnknownData_0x588FA:
INCBIN "baserom.gb", $588FA, $58900 - $588FA


UnknownRJump_0x58900:
	ld b, 2
	ld a, [$FF00+$DF]
	xor b
	jr z, UnknownRJump_0x5891D
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

UnknownRJump_0x5891D:
	ld a, [$FF00+$E9]
	inc a
	ld [$FF00+$E9], a
	ld a, [$FF00+$DF]
	add 2
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0x58932
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_0x58932:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld a, [$FF00+$EA]
	cp $03
	jr nc, UnknownRJump_0x5894B
	inc a
	ld [$FF00+$EA], a
	ld a, [$FF00+$DB]
	inc a
	ld [$FF00+$DB], a
	ld b, 4
	call UnknownCall_0x3D22
	ret

UnknownRJump_0x5894B:
	cp $06
	jr z, UnknownRJump_0x5895D
	inc a
	ld [$FF00+$EA], a
	ld a, [$FF00+$DB]
	dec a
	ld [$FF00+$DB], a
	ld b, 4
	call UnknownCall_0x3D32
	ret

UnknownRJump_0x5895D:
	xor a
	ld [$FF00+$EA], a
	ld a, 8
	ld [$FF00+$EC], a
	ld a, [$FF00+$DF]
	sub 2
	ld [$FF00+$DF], a
	ld a, [$FF00+$E9]
	cp $03
	jp z, UnknownJump_0x588E2
	ret
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0x5897B
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_0x5897B:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld a, [$FF00+$EA]
	cp $03
	jr nc, UnknownRJump_0x58994
	inc a
	ld [$FF00+$EA], a
	ld a, [$FF00+$DB]
	inc a
	ld [$FF00+$DB], a
	ld b, 4
	call UnknownCall_0x3D32
	ret

UnknownRJump_0x58994:
	cp $06
	jr z, UnknownRJump_0x5895D
	inc a
	ld [$FF00+$EA], a
	ld a, [$FF00+$DB]
	dec a
	ld [$FF00+$DB], a
	ld b, 4
	call UnknownCall_0x3D22
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x589BA
	ld a, 32
	ld [$FF00+$E2], a
	call UnknownCall_0x5B4B4
	cp $40
	ret nc
	ld a, 5
	ld [$FF00+$DF], a
	ret

UnknownRJump_0x589BA:
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_0x589BE:
INCBIN "baserom.gb", $589BE, $589CA - $589BE

	call UnknownCall_0x5B521
	ld a, [$FF00+$F0]
	and $01
	jr nz, UnknownRJump_0x589E7
	ld b, 1
	call UnknownCall_0x3D22
	call UnknownCall_0x3C30
	ld a, [$AF2F]
	bit 1, a
	ret z

UnknownData_0x589E1:
INCBIN "baserom.gb", $589E1, $589E7 - $589E1


UnknownRJump_0x589E7:
	call UnknownCall_0x3B40
	ld a, [$AF2F]
	bit 3, a
	ret nz

UnknownData_0x589F0:
INCBIN "baserom.gb", $589F0, $589F7 - $589F0

	call UnknownCall_0x5B521
	ld a, [$FF00+$F0]
	and $01
	jr nz, UnknownRJump_0x589E7
	ld b, 1
	call UnknownCall_0x3D32
	call UnknownCall_0x3BCC
	ld a, [$AF2F]
	bit 0, a
	ret z

UnknownData_0x58A0E:
INCBIN "baserom.gb", $58A0E, $58A3D - $58A0E

	call UnknownCall_0x5B521
	ld a, [$FF00+$EA]
	inc a
	ld [$FF00+$EA], a
	cp $20
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
	cp $3E
	ret nz
	call UnknownCall_0x5B3C6
	ld a, 77
	ld [$FF00+$E2], a
	ld a, [$FF00+$E7]
	bit 3, a
	ret z
	ld a, 8
	call UnknownCall_0x3D10
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x58A76
	jr UnknownRJump_0x58ABE

UnknownRJump_0x58A76:
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_0x58A7A:
INCBIN "baserom.gb", $58A7A, $58A82 - $58A7A

	call UnknownCall_0x5B68B
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0x58A96
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 64
	ld [$FF00+$DB], a
	ld a, 76
	ld [$FF00+$E2], a

UnknownRJump_0x58A96:
	call UnknownCall_0x5B5E6
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ldh_a_n $04
	and $3F
	jr z, UnknownRJump_0x58ABE
	ld b, 1
	call UnknownCall_0x3D22
	call UnknownCall_0x3C1C
	ld a, [$AF2F]
	bit 1, a
	ret z
	ld a, 2
	ld [$FF00+$DF], a
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a
	ret

UnknownRJump_0x58ABE:
	call UnknownCall_0x5B3C6
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
	call UnknownCall_0x5B68B
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0x58AE7

UnknownData_0x58ADB:
INCBIN "baserom.gb", $58ADB, $58AE7 - $58ADB


UnknownRJump_0x58AE7:
	call UnknownCall_0x5B5E6
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ldh_a_n $04
	and $3F
	jr z, UnknownRJump_0x58ABE
	ld b, 1
	call UnknownCall_0x3D32
	call UnknownCall_0x3BB8
	ld a, [$AF2F]
	bit 0, a
	ret z
	ld a, 1
	ld [$FF00+$DF], a
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a
	ret
	call UnknownCall_0x5B521
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$FF00+$E9]
	inc a
	ld [$FF00+$E9], a
	cp $28
	jr z, UnknownRJump_0x58B21
	ret

UnknownRJump_0x58B21:
	xor a
	ld [$FF00+$E9], a
	ld [$FF00+$EA], a
	ld a, [$FF00+$DF]
	sub 2
	ld [$FF00+$DF], a
	ld a, 36
	ld [$FF00+$EC], a
	ret

UnknownData_0x58B31:
INCBIN "baserom.gb", $58B31, $58B43 - $58B31

	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x58B50
	call UnknownCall_0x5B3C6
	ld a, 77
	ld [$FF00+$E2], a
	ret

UnknownRJump_0x58B50:
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_0x58B54:
INCBIN "baserom.gb", $58B54, $58B58 - $58B54

	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0x58B66
	call UnknownCall_0x5B5B6
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz

UnknownRJump_0x58B66:
	call UnknownCall_0x5B5B4
	ld a, [$FF00+$F0]
	and $01
	ret nz
	call UnknownCall_0x5B451
	call UnknownCall_0x3D22

UnknownRJump_0x58B74:
	ld b, 1
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_0x58B80
	call UnknownCall_0x3D3D
	jr UnknownRJump_0x58B83

UnknownRJump_0x58B80:
	call UnknownCall_0x3D2D

UnknownRJump_0x58B83:
	ld a, [$FF00+$E0]
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	call UnknownCall_0x5B3C6
	call UnknownCall_0x5B41A
	dec a
	jr z, UnknownRJump_0x58B95
	ld a, 1

UnknownRJump_0x58B95:
	ld [$FF00+$E8], a
	ld a, 40
	ld [$FF00+$EC], a
	ret
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0x58BAA
	call UnknownCall_0x5B5B6
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz

UnknownRJump_0x58BAA:
	call UnknownCall_0x5B5B4
	ld a, [$FF00+$F0]
	and $01
	ret nz
	call UnknownCall_0x5B451
	call UnknownCall_0x3D32
	jr UnknownRJump_0x58B74
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x58BDC
	ld a, 32
	ld [$FF00+$E2], a
	call UnknownCall_0x5B407
	ld a, 44
	ld [$FF00+$E8], a
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x58BDC
	ld a, 32
	ld [$FF00+$E2], a
	call UnknownCall_0x5B407
	ld a, 20
	ld [$FF00+$E8], a
	ret

UnknownRJump_0x58BDC:
	dec a
	rst $28

UnknownData_0x58BDE:
INCBIN "baserom.gb", $58BDE, $58BE6 - $58BDE

	ld a, [$FF00+$E8]
	ld c, a
	ld b, 1
	call UnknownCall_0x3D2D
	call UnknownCall_0x3D10
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
	call UnknownCall_0x3D3D
	call UnknownCall_0x3CDF
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
	call UnknownCall_0x3D2D
	call UnknownCall_0x3D10

UnknownRJump_0x58C22:
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
	call UnknownCall_0x3D3D
	call UnknownCall_0x3CDF
	jr UnknownRJump_0x58C22
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x58C7B
	ld a, 32
	ld [$FF00+$E2], a
	call UnknownCall_0x5B3C6
	ld a, 60
	ld [$FF00+$E8], a
	ret
	call UnknownCall_0x5B51A
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x58C7B
	ld a, 32
	ld [$FF00+$E2], a
	ld a, 16
	ld [$FF00+$DE], a
	call UnknownCall_0x5B3C6
	ld a, 36
	ld [$FF00+$E8], a
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x58C7B
	ld a, 32
	ld [$FF00+$E2], a
	call UnknownCall_0x5B3C6
	ld a, 36
	ld [$FF00+$E8], a
	ret

UnknownRJump_0x58C7B:
	dec a
	rst $28

UnknownData_0x58C7D:
INCBIN "baserom.gb", $58C7D, $58C85 - $58C7D

	ld a, [$FF00+$E8]
	ld c, a
	ld b, 1
	call UnknownCall_0x3D22
	call UnknownCall_0x3CF1
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
	call UnknownCall_0x3D32
	call UnknownCall_0x3CC0
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
	call UnknownCall_0x3D22
	call UnknownCall_0x3CF1

UnknownRJump_0x58CC1:
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
	call UnknownCall_0x3D32
	call UnknownCall_0x3CC0
	jr UnknownRJump_0x58CC1
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x58CF4
	ld a, 32
	ld [$FF00+$E2], a
	call UnknownCall_0x5B3C6
	ld a, 24
	ld [$FF00+$E8], a
	add a
	ld [$FF00+$E9], a
	ret

UnknownRJump_0x58CF4:
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_0x58CFD:
INCBIN "baserom.gb", $58CFD, $58D01 - $58CFD

	ld b, 1
	call UnknownCall_0x3D22
	call UnknownCall_0x3CF1
	ld b, 1
	call UnknownCall_0x3D3D
	call UnknownCall_0x3CDF

UnknownRJump_0x58D11:
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
	call UnknownCall_0x3D32
	call UnknownCall_0x3CC0
	ld b, 1
	call UnknownCall_0x3D2D
	call UnknownCall_0x3D10
	jr UnknownRJump_0x58D11
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x58D45
	ld a, 32
	ld [$FF00+$E2], a
	call UnknownCall_0x5B3C6
	ld a, 24
	ld [$FF00+$E8], a
	ret

UnknownRJump_0x58D45:
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_0x58D4E:
INCBIN "baserom.gb", $58D4E, $58D78 - $58D4E

	ld a, [$FF00+$E8]
	ld c, a
	ld b, 1
	call UnknownCall_0x3D32
	call UnknownCall_0x3CC0
	ld b, 1
	call UnknownCall_0x3D3D
	call UnknownCall_0x3CDF
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
	call UnknownCall_0x3D22
	call UnknownCall_0x3CF1
	ld b, 1
	call UnknownCall_0x3D2D
	call UnknownCall_0x3D10

UnknownRJump_0x58DAA:
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
	call UnknownCall_0x3D32
	call UnknownCall_0x3CC0
	ld b, 1
	call UnknownCall_0x3D3D
	call UnknownCall_0x3CDF
	jr UnknownRJump_0x58DAA
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x58DDF
	ld a, 32
	ld [$FF00+$E2], a
	ld a, 2
	ld [$FF00+$DF], a
	ret

UnknownRJump_0x58DDF:
	dec a
	rst $28

UnknownData_0x58DE1:
INCBIN "baserom.gb", $58DE1, $58DE5 - $58DE1

	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0x58DEE
	dec a
	ld [$FF00+$EC], a
	ret nz

UnknownRJump_0x58DEE:
	call UnknownCall_0x5B451
	call UnknownCall_0x3D3D
	call UnknownCall_0x3CDF
	call UnknownCall_0x3B40
	ld a, [$AF2F]
	bit 3, a
	ret z
	call UnknownCall_0x5B2D7
	ret
	ld a, [$FF00+$E7]
	bit 3, a
	ret z
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 28
	ld [$FF00+$EC], a
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x58E30
	ld a, 32
	ld [$FF00+$E2], a
	ld a, 3
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$E7]
	bit 3, a
	ret z
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 64
	ld [$FF00+$E8], a
	ld [$FF00+$E9], a
	ret

UnknownRJump_0x58E30:
	dec a
	rst $28

UnknownData_0x58E32:
INCBIN "baserom.gb", $58E32, $58E38 - $58E32


UnknownJump_0x58E38:
	ld a, [$FF00+$E7]
	bit 3, a
	jr z, UnknownRJump_0x58E4E
	ld a, [$FF00+$E8]
	and a
	ret z
	dec a
	ld [$FF00+$E8], a
	ld b, 1
	call UnknownCall_0x3D2D
	call UnknownCall_0x3D10
	ret

UnknownRJump_0x58E4E:
	ld a, 2
	ld [$FF00+$DF], a
	ld a, 16
	ld [$FF00+$EC], a
	ret

UnknownJump_0x58E57:
	ld a, [$FF00+$E7]
	bit 3, a
	jr nz, UnknownRJump_0x58E76
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0x58E66
	dec a
	ld [$FF00+$EC], a
	ret nz

UnknownRJump_0x58E66:
	ld a, [$FF00+$E9]
	ld c, a
	ld a, [$FF00+$E8]
	cp c
	ret z
	inc a
	ld [$FF00+$E8], a
	ld b, 1
	call UnknownCall_0x3D3D
	ret

UnknownRJump_0x58E76:
	ld a, 1
	ld [$FF00+$DF], a
	xor a
	ld [$FF00+$EC], a
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x58E99
	ld b, 32
	call UnknownCall_0x3D2D
	call UnknownCall_0x5B3C6
	ld a, 32
	ld [$FF00+$E2], a
	ld a, 40
	ld [$FF00+$E9], a
	add a
	ld [$FF00+$E8], a
	ld [$FF00+$E0], a
	ret

UnknownRJump_0x58E99:
	dec a
	rst $28

UnknownData_0x58E9B:
INCBIN "baserom.gb", $58E9B, $58EA7 - $58E9B

	ld b, 1
	call UnknownCall_0x3D22
	call UnknownCall_0x3CF1
	ld a, [$FF00+$E9]
	dec a
	ld [$FF00+$E9], a
	ret nz
	ld a, 3
	ld [$FF00+$DF], a
	ld a, [$FF00+$E0]
	ld [$FF00+$E9], a
	ret

UnknownData_0x58EBE:
INCBIN "baserom.gb", $58EBE, $58EC8 - $58EBE

	ld b, 1
	call UnknownCall_0x3D3D
	call UnknownCall_0x3CDF
	ld a, [$FF00+$E8]
	dec a
	ld [$FF00+$E8], a
	ret nz
	ld a, [$FF00+$E0]
	ld [$FF00+$E8], a
	ld a, [$FF00+$DD]
	and a
	jr nz, UnknownRJump_0x58EE4
	ld a, 4
	ld [$FF00+$DF], a
	ret

UnknownRJump_0x58EE4:
UnknownData_0x58EE4:
INCBIN "baserom.gb", $58EE4, $58EE9 - $58EE4

	ld b, 1
	call UnknownCall_0x3D32
	call UnknownCall_0x3CC0
	ld a, [$FF00+$E9]
	dec a
	ld [$FF00+$E9], a
	ret nz
	ld a, [$FF00+$E0]
	ld [$FF00+$E9], a
	ld a, [$FF00+$DD]
	and a
	jr nz, UnknownRJump_0x58F05
	ld a, 5
	ld [$FF00+$DF], a
	ret

UnknownRJump_0x58F05:
UnknownData_0x58F05:
INCBIN "baserom.gb", $58F05, $58F0A - $58F05

	ld b, 1
	call UnknownCall_0x3D2D
	call UnknownCall_0x3D10
	ld a, [$FF00+$E8]
	dec a
	ld [$FF00+$E8], a
	ret nz
	ld a, [$FF00+$E0]
	ld [$FF00+$E8], a
	ld a, [$FF00+$DD]
	and a
	jr nz, UnknownRJump_0x58F26
	ld a, 6
	ld [$FF00+$DF], a
	ret

UnknownRJump_0x58F26:
UnknownData_0x58F26:
INCBIN "baserom.gb", $58F26, $58F2B - $58F26

	ld b, 1
	call UnknownCall_0x3D22
	call UnknownCall_0x3CF1
	ld a, [$FF00+$E9]
	dec a
	ld [$FF00+$E9], a
	ret nz

UnknownData_0x58F39:
INCBIN "baserom.gb", $58F39, $58F4C - $58F39

	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x58F5D
	call UnknownCall_0x5B3C6
	ld a, 77
	ld [$FF00+$E2], a
	ld a, 16
	ld [$FF00+$DE], a
	ret

UnknownRJump_0x58F5D:
	dec a
	rst $28

UnknownData_0x58F5F:
INCBIN "baserom.gb", $58F5F, $58F69 - $58F5F

	call UnknownCall_0x5B54C
	ld a, [$FF00+$F0]
	and $01
	jr nz, UnknownRJump_0x58FA5
	ld b, 1
	call UnknownCall_0x3D22
	call UnknownCall_0x3C1C
	ld a, [$AF2F]
	bit 1, a
	ret z

UnknownRJump_0x58F80:
	ld a, 5
	ld [$FF00+$DF], a
	ld a, 88
	ld [$FF00+$DB], a
	xor a
	ld [$FF00+$EA], a
	ret

UnknownData_0x58F8C:
INCBIN "baserom.gb", $58F8C, $58FA5 - $58F8C


UnknownRJump_0x58FA5:
	call UnknownCall_0x3B40
	ld a, [$AF2F]
	bit 3, a
	ret nz
	jr UnknownRJump_0x58F80
	call UnknownCall_0x5B521
	ld b, 1
	call UnknownCall_0x3D2D
	ld a, [$FF00+$E8]
	inc a
	ld [$FF00+$E8], a
	cp $28
	ret nz

UnknownData_0x58FC0:
INCBIN "baserom.gb", $58FC0, $5902D - $58FC0

	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x59078

UnknownJump_0x59032:
	xor a
	ld [$FF00+$E2], a
	ld [$FF00+$DD], a
	ld a, 16
	ld [$FF00+$DE], a
	call UnknownCall_0x59136
	ld a, [$AF3E]
	and a
	ret nz
	ld d, 0
	ld hl, $5082
	add de
	ld a, [hl]
	bit 7, a
	jr z, UnknownRJump_0x59056
	cpl
	inc a
	ld b, a
	call UnknownCall_0x3D2D
	jr UnknownRJump_0x5905A

UnknownRJump_0x59056:
	ld b, a
	call UnknownCall_0x3D3D

UnknownRJump_0x5905A:
	ld hl, $508A
	add de
	ld a, [hl]
	bit 7, a
	jr z, UnknownRJump_0x5906B
	cpl
	inc a
	ld b, a
	call UnknownCall_0x3D22
	jr UnknownRJump_0x5906F

UnknownRJump_0x5906B:
	ld b, a
	call UnknownCall_0x3D32

UnknownRJump_0x5906F:
	ld a, 3
	ld [$FF00+$DF], a
	ld a, 48
	ld [$FF00+$EC], a
	ret

UnknownRJump_0x59078:
	dec a
	rst $28

UnknownData_0x5907A:
INCBIN "baserom.gb", $5907A, $59092 - $5907A

	call UnknownCall_0x5B518
	ld a, [$FF00+$F0]
	and $03
	ret nz
	call UnknownCall_0x590E9
	ld a, 3
	sub b
	ld b, a
	call UnknownCall_0x3D22
	call UnknownCall_0x5B3C6
	ret
	call UnknownCall_0x5B518
	ld a, [$FF00+$F0]
	and $03
	ret nz
	call UnknownCall_0x590E9
	ld a, 3
	sub b
	ld b, a
	call UnknownCall_0x3D32
	call UnknownCall_0x5B3C6
	ret
	call UnknownCall_0x5B511
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
	call UnknownCall_0x5B51A
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	call UnknownCall_0x5B3C6
	ld a, 8
	ld [$FF00+$E8], a
	ret

UnknownCall_0x590E9:
	call UnknownCall_0x5B41A
	ld hl, $FFE8
	ld a, [$AF2C]
	inc a
	jr z, UnknownRJump_0x59100
	ld hl, $FFE8
	ld a, [hl]
	cp $10
	jr z, UnknownRJump_0x5910A
	inc [hl]
	jr UnknownRJump_0x59105

UnknownRJump_0x59100:
	ld a, [hl]
	and a
	jr z, UnknownRJump_0x59116
	dec [hl]

UnknownRJump_0x59105:
	ld a, [hl]
	cp $08
	jr c, UnknownRJump_0x59116

UnknownRJump_0x5910A:
	ld e, a
	ld d, 0
	ld hl, $5125
	add de
	ld b, [hl]
	call UnknownCall_0x3D3D
	ret

UnknownRJump_0x59116:
	ld e, a
	ld d, 0
	ld hl, $5125
	add de
	ld a, [hl]
	cpl
	inc a
	ld b, a
	call UnknownCall_0x3D2D
	ret

UnknownData_0x59125:
INCBIN "baserom.gb", $59125, $59136 - $59125


UnknownCall_0x59136:
	ld hl, $AF4E
	xor a
	ld [hl], a
	ldh_a_n $04
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

UnknownRJump_0x5914D:
	rrca
	inc [hl]
	dec d
	jr nz, UnknownRJump_0x5914D
	jr nc, UnknownRJump_0x59166

UnknownData_0x59154:
INCBIN "baserom.gb", $59154, $59166 - $59154


UnknownRJump_0x59166:
	dec b
	set 7, a
	ld d, a
	ld a, b
	add c
	ld b, a
	ld a, d

UnknownRJump_0x5916E:
	rrca
	inc [hl]
	dec b
	jr nz, UnknownRJump_0x5916E
	ld [$FF00+$EF], a
	ld a, e
	and $07
	ld e, a
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x59189
	ld a, 16
	ld [$FF00+$DE], a
	call UnknownCall_0x5B31D
	jp UnknownJump_0x581B9

UnknownJump_0x59189:
UnknownRJump_0x59189:
	dec a
	rst $28

UnknownData_0x5918B:
INCBIN "baserom.gb", $5918B, $5918F - $5918B

	call UnknownCall_0x5B451
	call UnknownCall_0x3D3D
	ld a, [$FF00+$D9]
	cp $A0
	ret c
	ld a, [$FF00+$D5]
	dec a
	ld [$FF00+$D5], a
	call UnknownCall_0x5B2BF
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x591CC
	call UnknownCall_0x5B511
	ld a, 32
	ld [$FF00+$E2], a
	ld a, 16
	ld [$FF00+$DE], a
	ld a, [$FF00+$E7]
	bit 3, a
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

UnknownRJump_0x591CC:
	dec a
	rst $28

UnknownData_0x591CE:
INCBIN "baserom.gb", $591CE, $591D2 - $591CE

	call UnknownCall_0x5B5B6
	jp UnknownJump_0x58E38
	call UnknownCall_0x5B5B6
	jp UnknownJump_0x58E57
	call UnknownCall_0x5B5B6
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x591EF
	ld a, 77
	ld [$FF00+$E2], a
	ld a, 1
	ld [$FF00+$DF], a
	ret

UnknownRJump_0x591EF:
	dec a
	rst $28

UnknownData_0x591F1:
INCBIN "baserom.gb", $591F1, $591F3 - $591F1

	ld b, 1
	call UnknownCall_0x3D22
	ret
	call UnknownCall_0x5B521
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x5920D
	ld a, 86
	ld [$FF00+$E2], a
	ld a, 16
	ld [$FF00+$DE], a
	call UnknownCall_0x5B407
	ret

UnknownRJump_0x5920D:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_0x59216:
INCBIN "baserom.gb", $59216, $5921E - $59216

	call UnknownCall_0x5B481
	call UnknownCall_0x3D2D

UnknownRJump_0x59224:
	ld a, [$FF00+$E0]
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$DF]
	add 2
	ld [$FF00+$DF], a
	ret
	call UnknownCall_0x5B481
	call UnknownCall_0x3D3D
	jr UnknownRJump_0x59224
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0x59243

UnknownData_0x5923F:
INCBIN "baserom.gb", $5923F, $59243 - $5923F


UnknownRJump_0x59243:
	call UnknownCall_0x5B449
	call UnknownCall_0x3D3D

UnknownRJump_0x59249:
	ld a, [$FF00+$E0]
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$DF]
	cp $04
	jr z, UnknownRJump_0x5925A
	dec a
	ld [$FF00+$DF], a
	ret

UnknownRJump_0x5925A:
	ld a, 1
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0x59268

UnknownData_0x59264:
INCBIN "baserom.gb", $59264, $59268 - $59264


UnknownRJump_0x59268:
	call UnknownCall_0x5B449
	call UnknownCall_0x3D2D
	jr UnknownRJump_0x59249
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x59285
	ld a, 32
	ld [$FF00+$E2], a
	ld a, 16
	ld [$FF00+$DE], a
	call UnknownCall_0x5B3C6
	ld a, 20
	ld [$FF00+$E8], a
	ret

UnknownRJump_0x59285:
	call UnknownCall_0x5B5B6
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_0x5928C:
INCBIN "baserom.gb", $5928C, $59298 - $5928C

	ld a, [$FF00+$E8]
	ld c, a
	ld b, 1
	call UnknownCall_0x3D22
	call UnknownCall_0x3CF1
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld b, 1
	call UnknownCall_0x3D3D
	call UnknownCall_0x3CDF
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
	call UnknownCall_0x3D32
	call UnknownCall_0x3CC0
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld b, 1
	call UnknownCall_0x3D3D
	call UnknownCall_0x3CDF
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
	call UnknownCall_0x3D2D
	call UnknownCall_0x3D10

UnknownRJump_0x592EE:
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
	call UnknownCall_0x3D32
	call UnknownCall_0x3CC0
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld b, 1
	call UnknownCall_0x3D3D
	call UnknownCall_0x3CDF
	jr UnknownRJump_0x592EE
	ld b, 1
	call UnknownCall_0x3D22
	call UnknownCall_0x3CF1
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld b, 1
	call UnknownCall_0x3D3D
	call UnknownCall_0x3CDF
	ld a, [$FF00+$E8]
	add a
	ld c, a
	ld a, [$FF00+$E0]
	inc a
	ld [$FF00+$E0], a
	cp c
	ret nz

UnknownData_0x59342:
INCBIN "baserom.gb", $59342, $5934A - $59342

	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x59352
	jp UnknownJump_0x59032

UnknownRJump_0x59352:
	dec a
	rst $28

UnknownData_0x59354:
INCBIN "baserom.gb", $59354, $5935C - $59354

	call UnknownCall_0x5B511
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 4
	ld [$FF00+$DF], a

UnknownJump_0x59369:
	ld a, 82
	ld [$FF00+$E2], a
	ld a, 112
	ld [$FF00+$DB], a
	ld a, 48
	ld [$FF00+$EC], a
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x5938C
	xor a
	ld [$FF00+$E2], a
	ld a, 16
	ld [$FF00+$DE], a
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 1
	ld [$A478], a
	ret

UnknownRJump_0x5938C:
	dec a
	rst $28

UnknownData_0x5938E:
INCBIN "baserom.gb", $5938E, $59394 - $5938E

	call UnknownCall_0x3B40
	ld a, [$AF2F]
	bit 3, a
	jr nz, UnknownRJump_0x593A5
	call UnknownCall_0x5B451
	call UnknownCall_0x3D3D
	ret

UnknownRJump_0x593A5:
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
	call UnknownCall_0x5B539
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 62
	ld [$FF00+$D5], a
	call UnknownCall_0x3AA0
	call UnknownCall_0x5B3C6
	ld a, 8
	ld [$FF00+$E8], a
	ld a, 16
	ld [$FF00+$DE], a
	jp UnknownJump_0x59369
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x593F2
	ld a, 16
	ld [$FF00+$DE], a
	ld a, 72
	ld [$FF00+$E2], a
	call UnknownCall_0x5B4B4
	cp $30
	ret nc
	ld a, 1
	ld [$FF00+$DF], a
	ret

UnknownRJump_0x593F2:
	dec a
	rst $28

UnknownData_0x593F4:
INCBIN "baserom.gb", $593F4, $593F8 - $593F4

	call UnknownCall_0x5B518

UnknownJump_0x593FB:
	call UnknownCall_0x3B40
	ld a, [$AF2F]
	bit 3, a
	jr nz, UnknownRJump_0x5940D
	call UnknownCall_0x5B451
	inc b
	call UnknownCall_0x3D3D
	ret

UnknownRJump_0x5940D:
	xor a
	ld [$FF00+$E0], a
	ld a, 2
	ld [$FF00+$DF], a
	ld a, 10
	ld [$A470], a
	ret
	call UnknownCall_0x5B51A
	call UnknownCall_0x3B7C
	ld a, [$AF2F]
	bit 2, a
	jr nz, UnknownRJump_0x5942D
	ld b, 1
	call UnknownCall_0x3D2D
	ret

UnknownRJump_0x5942D:
	xor a
	ld [$FF00+$DF], a
	ret
	call UnknownCall_0x5B511
	ld a, [$FF00+$DF]
	dec a
	jp z, UnknownJump_0x582FB
	dec a
	jp z, UnknownJump_0x5831A
	call UnknownCall_0x3B40
	ld a, [$AF2F]
	bit 3, a
	jr nz, UnknownRJump_0x5944F

UnknownData_0x59448:
INCBIN "baserom.gb", $59448, $5944F - $59448


UnknownRJump_0x5944F:
	xor a
	ld [$FF00+$E0], a
	call UnknownCall_0x5B3C6
	ld a, 77
	ld [$FF00+$E2], a
	ret
	call UnknownCall_0x5B511
	ld a, [$FF00+$DF]
	dec a
	jp z, UnknownJump_0x582FB
	dec a
	jp z, UnknownJump_0x5831A
	ld a, 16
	ld [$FF00+$DE], a
	call UnknownCall_0x3B40
	ld a, [$AF2F]
	bit 3, a
	jr nz, UnknownRJump_0x5947C

UnknownData_0x59475:
INCBIN "baserom.gb", $59475, $5947C - $59475


UnknownRJump_0x5947C:
	xor a
	ld [$FF00+$E0], a
	call UnknownCall_0x5B3C6
	ld a, 72
	ld [$FF00+$E2], a
	ret
	call UnknownCall_0x5B5DF
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x5949E
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 77
	ld [$FF00+$E2], a
	ld a, 128
	ld [$FF00+$DC], a
	ld [$FF00+$EC], a
	ret

UnknownRJump_0x5949E:
	dec a
	rst $28

UnknownData_0x594A0:
INCBIN "baserom.gb", $594A0, $594A4 - $594A0

	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0x594AD
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_0x594AD:
UnknownData_0x594AD:
INCBIN "baserom.gb", $594AD, $594EB - $594AD

	call UnknownCall_0x5B585
	ld a, [$FF00+$DF]
	and a
	jp nz, UnknownJump_0x582F5
	ld a, 82
	ld [$FF00+$E2], a
	jp UnknownJump_0x582DD
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x5950C
	xor a
	ld [$FF00+$E2], a
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 48
	ld [$FF00+$EC], a
	ret

UnknownRJump_0x5950C:
	dec a
	rst $28

UnknownData_0x5950E:
INCBIN "baserom.gb", $5950E, $59512 - $5950E

	call UnknownCall_0x5B521
	call UnknownCall_0x5B68B
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
	call UnknownCall_0x5B5A6
	ld a, [$FF00+$DB]
	cp $84
	ret nz
	ld a, 1
	ld [$AF26], a
	call UnknownCall_0x5B2D7
	ret
	ld a, [$FF00+$F0]
	and $03
	ret nz
	call UnknownCall_0x5B3E0
	ld hl, $A22B
	ld a, [$AF2C]
	cp [hl]
	jr nz, UnknownRJump_0x5957F
	ld a, [$FF00+$DF]
	dec a
	jr z, UnknownRJump_0x59587
	dec a
	jr z, UnknownRJump_0x5959D
	ld a, 13
	ld [$FF00+$DB], a
	ld a, 32
	ld [$FF00+$DD], a
	ld a, [$AF2C]
	cp $01
	jr z, UnknownRJump_0x59572
	xor a
	ld [$FF00+$DD], a
	ld a, 2

UnknownRJump_0x59572:
	ld [$FF00+$DF], a
	ld a, 8
	ld [$FF00+$E8], a
	ld [$FF00+$E9], a
	ld a, 72
	ld [$FF00+$E2], a
	ret

UnknownRJump_0x5957F:
	ld a, 14
	ld [$FF00+$DB], a
	xor a
	ld [$FF00+$DF], a
	ret

UnknownRJump_0x59587:
	call UnknownCall_0x590E9
	ld a, [$FF00+$E9]
	ld e, a
	ld d, 0
	ld b, 1
	call UnknownCall_0x3D32
	ld hl, $FFE9
	ld a, [hl]
	cp $10
	ret z
	inc [hl]
	ret

UnknownRJump_0x5959D:
	call UnknownCall_0x590E9
	ld a, [$FF00+$E9]
	ld e, a
	ld d, 0
	ld b, 1
	call UnknownCall_0x3D22
	ld hl, $FFE9
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x595CF
	ld a, 72
	ld [$FF00+$E2], a
	call UnknownCall_0x5B4B4
	cp $38
	ret nc
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 16
	ld [$FF00+$EC], a
	ld a, 21
	ld [$A470], a
	ret

UnknownRJump_0x595CF:
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_0x595D3:
INCBIN "baserom.gb", $595D3, $595D7 - $595D3

	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	jr z, UnknownRJump_0x595F0
	ld b, 3
	ld a, [$FF00+$E9]
	xor $01
	ld [$FF00+$E9], a
	jr nz, UnknownRJump_0x595EC
	call UnknownCall_0x3D22
	ret

UnknownRJump_0x595EC:
	call UnknownCall_0x3D32
	ret

UnknownRJump_0x595F0:
	ld a, 2
	ld [$FF00+$DF], a
	ret
	call UnknownCall_0x5B451
	sla b
	call UnknownCall_0x3D3D
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x59619
	ld a, 72
	ld [$FF00+$E2], a
	ld a, 1
	ld [$FF00+$DF], a
	ld b, 4
	call UnknownCall_0x3D22
	ld a, 64
	ld [$FF00+$E8], a
	ld a, 32
	ld [$FF00+$EC], a
	ret

UnknownRJump_0x59619:
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_0x5961D:
INCBIN "baserom.gb", $5961D, $59621 - $5961D

	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0x59633
	call UnknownCall_0x5B68B
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 16
	ld [$FF00+$DE], a

UnknownRJump_0x59633:
	ld b, 2
	call UnknownCall_0x3D3D
	ld a, [$FF00+$E8]
	sub b
	ld [$FF00+$E8], a
	ret nz

UnknownRJump_0x5963E:
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
	jr z, UnknownRJump_0x5965F
	call UnknownCall_0x5B68B
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 16
	ld [$FF00+$DE], a

UnknownRJump_0x5965F:
	ld b, 2
	call UnknownCall_0x3D2D
	ld a, [$FF00+$E8]
	sub b
	ld [$FF00+$E8], a
	ret nz
	jr UnknownRJump_0x5963E

UnknownData_0x5966C:
INCBIN "baserom.gb", $5966C, $596D9 - $5966C

	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x596E6
	ld a, 77
	ld [$FF00+$E2], a
	call UnknownCall_0x5B3C6
	ret

UnknownRJump_0x596E6:
	dec a
	rst $28

UnknownData_0x596E8:
INCBIN "baserom.gb", $596E8, $596EE - $596E8

	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0x596F7
	dec a
	ld [$FF00+$EC], a
	ret nz

UnknownRJump_0x596F7:
	ld a, 43
	ld [$FF00+$DB], a
	ld a, 44
	ld [$AF37], a
	ld a, [$FF00+$DD]
	ld [$AF38], a
	ld a, 82
	ld [$AF36], a
	call UnknownCall_0x5B36D
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
	call UnknownCall_0x5B3C6
	ld a, 96
	ld [$FF00+$EC], a
	ret
	ld a, [$FF00+$DF]
	dec a
	jr z, UnknownRJump_0x5973D
	dec a
	jr z, UnknownRJump_0x59750
	ld a, 77
	ld [$FF00+$E2], a
	call UnknownCall_0x3CB1
	ld a, 11
	ld [$A478], a
	ret

UnknownRJump_0x5973D:
	call UnknownCall_0x5B5B6
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld b, 2
	call UnknownCall_0x3D22
	ld b, 1
	call UnknownCall_0x3D2D
	ret

UnknownRJump_0x59750:
	call UnknownCall_0x5B5B6
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld b, 2
	call UnknownCall_0x3D32
	ld b, 1
	call UnknownCall_0x3D2D
	ret
	call UnknownCall_0x5B57E
	ld a, [$FF00+$DF]
	and a
	jp nz, UnknownJump_0x58215
	call UnknownCall_0x5B3C6
	ld a, 77
	ld [$FF00+$E2], a
	ret
	ld a, [$FF00+$DF]
	dec a
	jr z, UnknownRJump_0x59795
	dec a
	jr z, UnknownRJump_0x597A9
	dec a
	jr z, UnknownRJump_0x59788
	ld a, 77
	ld [$FF00+$E2], a
	ld a, 3
	ld [$FF00+$DF], a
	ret

UnknownRJump_0x59788:
	call UnknownCall_0x5B678
	call UnknownCall_0x5B4B4
	cp $30
	ret nc
	call UnknownCall_0x5B3C6
	ret

UnknownRJump_0x59795:
	call UnknownCall_0x5B585
	call UnknownCall_0x3C58
	ld a, [$AF2F]
	bit 1, a
	jp nz, UnknownJump_0x59D2D
	ld b, 2
	call UnknownCall_0x3D22
	ret

UnknownRJump_0x597A9:
	call UnknownCall_0x5B585
	call UnknownCall_0x3BF4
	ld a, [$AF2F]
	bit 0, a
	jp nz, UnknownJump_0x59D2D
	ld b, 2
	call UnknownCall_0x3D32
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x597D2
	ld a, 72
	ld [$FF00+$E2], a
	call UnknownCall_0x5B3C6
	ld a, 1
	ld [$FF00+$E8], a
	ld a, 1
	ld [$FF00+$E9], a
	ret

UnknownRJump_0x597D2:
	call UnknownCall_0x5B57E
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_0x597DE:
INCBIN "baserom.gb", $597DE, $597EE - $597DE

	call UnknownCall_0x598CE
	ld hl, $594E
	call UnknownCall_0x5990E
	ld hl, $FFE9
	inc [hl]
	ld a, [hl]
	cp $15
	ret nz
	ld [hl], 1
	ld a, 3
	ld [$FF00+$DF], a
	ret
	call UnknownCall_0x598F5
	ld hl, $5964
	call UnknownCall_0x5990E
	ld hl, $FFE9
	inc [hl]
	ld a, [hl]
	cp $15
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
	call UnknownCall_0x59919
	ld hl, $5990
	call UnknownCall_0x598EA
	ld hl, $FFE9
	inc [hl]
	ld a, [hl]
	cp $15
	ret nz

UnknownData_0x59838:
INCBIN "baserom.gb", $59838, $598CE - $59838


UnknownCall_0x598CE:
	ld hl, $5938
	call UnknownCall_0x598DF
	ld hl, $FFE8
	inc [hl]
	ld a, [hl]
	cp $15
	ret nz
	ld [hl], 20
	ret

UnknownCall_0x598DF:
	ld a, [$FF00+$E8]
	ld e, a
	ld d, 0
	add de
	ld b, [hl]
	call UnknownCall_0x3D2D
	ret

UnknownCall_0x598EA:
	ld a, [$FF00+$E9]
	ld e, a
	ld d, 0
	add de
	ld b, [hl]
	call UnknownCall_0x3D32
	ret

UnknownCall_0x598F5:
	ld hl, $5938
	call UnknownCall_0x59903
	ld hl, $FFE8
	dec [hl]
	ret nz
	ld [hl], 1
	ret

UnknownCall_0x59903:
	ld a, [$FF00+$E8]
	ld e, a
	ld d, 0
	add de
	ld b, [hl]
	call UnknownCall_0x3D3D
	ret

UnknownCall_0x5990E:
	ld a, [$FF00+$E9]
	ld e, a
	ld d, 0
	add de
	ld b, [hl]
	call UnknownCall_0x3D22
	ret

UnknownCall_0x59919:
	ld hl, $597A
	call UnknownCall_0x59903
	ld hl, $FFE8
	inc [hl]
	ld a, [hl]
	cp $15
	ret nz

UnknownData_0x59927:
INCBIN "baserom.gb", $59927, $599A6 - $59927

	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x599B4
	ld a, 77
	ld [$FF00+$E2], a
	ld a, 5
	ld [$FF00+$DF], a
	ret

UnknownRJump_0x599B4:
	dec a
	rst $28

UnknownData_0x599B6:
INCBIN "baserom.gb", $599B6, $599C4 - $599B6

	ld b, 2
	call UnknownCall_0x3D2D
	ld a, [$FF00+$E8]
	add b
	ld [$FF00+$E8], a
	cp $40
	ret nz
	ld a, 9
	ld [$FF00+$E8], a
	ld a, 6
	ld [$FF00+$DF], a
	ret
	ld b, 3
	call UnknownCall_0x3D3D
	ld a, [$FF00+$E8]
	sub b
	ld [$FF00+$E8], a
	ret nz
	ld a, 7
	ld [$FF00+$DF], a
	ld a, 151
	ld [$FF00+$DB], a
	ret
	call UnknownCall_0x5B465
	call UnknownCall_0x3D3D
	ld a, [$FF00+$E0]
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	call UnknownCall_0x5B3C6
	ret

UnknownRJump_0x599FF:
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
	call UnknownCall_0x5B33E
	call UnknownCall_0x3D22
	ld a, [$FF00+$E9]
	inc a
	ld [$FF00+$E9], a

UnknownRJump_0x59A1D:
	call UnknownCall_0x3B40
	ld a, [$AF2F]
	bit 3, a
	jr nz, UnknownRJump_0x599FF
	ld hl, $5A8D
	call UnknownCall_0x5B33A
	call UnknownCall_0x3D3D
	ld a, [$FF00+$E8]
	inc a
	ld [$FF00+$E8], a
	cp $10
	ret nz
	xor a
	ld [$FF00+$E8], a
	ld hl, $FFDF
	ld a, [hl]
	cp $03
	jr nc, UnknownRJump_0x59A4B
	add 2
	ld [hl], a
	ld hl, $FFE9
	dec [hl]
	ret

UnknownRJump_0x59A4B:
	cp $04
	jr z, UnknownRJump_0x59A55
	dec [hl]
	ld hl, $FFE9
	inc [hl]
	ret

UnknownRJump_0x59A55:
	ld a, 1
	ld [hl], a
	ld hl, $FFE9
	inc [hl]
	ret
	ld hl, $5A9D
	call UnknownCall_0x5B33E
	call UnknownCall_0x3D32
	ld a, [$FF00+$E9]
	inc a
	ld [$FF00+$E9], a
	jr UnknownRJump_0x59A1D
	ld hl, $5A9D
	call UnknownCall_0x5B33E
	call UnknownCall_0x3D32
	ld a, [$FF00+$E9]
	dec a
	ld [$FF00+$E9], a
	jr UnknownRJump_0x59A1D
	ld hl, $5A9D
	call UnknownCall_0x5B33E
	call UnknownCall_0x3D22
	ld a, [$FF00+$E9]
	dec a
	ld [$FF00+$E9], a
	jr UnknownRJump_0x59A1D

UnknownData_0x59A8D:
INCBIN "baserom.gb", $59A8D, $59AAD - $59A8D

	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x59ABA
	call UnknownCall_0x5B3C6
	ld a, 72
	ld [$FF00+$E2], a
	ret

UnknownRJump_0x59ABA:
	call UnknownCall_0x5B511
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_0x59AC6:
INCBIN "baserom.gb", $59AC6, $59ACA - $59AC6

	ld b, 1
	call UnknownCall_0x3D22
	jr UnknownRJump_0x59AD6
	ld b, 1
	call UnknownCall_0x3D32

UnknownRJump_0x59AD6:
	ld a, [$FF00+$E8]
	dec a
	jr z, UnknownRJump_0x59AE9
	dec a
	jr z, UnknownRJump_0x59AF1
	dec a
	jr z, UnknownRJump_0x59AF9
	call UnknownCall_0x5B46C
	call UnknownCall_0x3D2D
	jr UnknownRJump_0x59AFF

UnknownRJump_0x59AE9:
	call UnknownCall_0x5B445
	call UnknownCall_0x3D3D
	jr UnknownRJump_0x59AFF

UnknownRJump_0x59AF1:
	call UnknownCall_0x5B46C
	call UnknownCall_0x3D3D
	jr UnknownRJump_0x59AFF

UnknownRJump_0x59AF9:
	call UnknownCall_0x5B445
	call UnknownCall_0x3D2D

UnknownRJump_0x59AFF:
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
	call UnknownCall_0x5B678
	ld a, [$FF00+$DF]
	and a
	jp nz, UnknownJump_0x58642
	call UnknownCall_0x5B3C6
	ld a, 77
	ld [$FF00+$E2], a
	ret
	call UnknownCall_0x5B51A
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x59B2F
	call UnknownCall_0x5B3C6
	ld a, 77
	ld [$FF00+$E2], a
	ret

UnknownRJump_0x59B2F:
	dec a
	rst $28

UnknownData_0x59B31:
INCBIN "baserom.gb", $59B31, $59B35 - $59B31

	ld a, [$FF00+$F0]
	and $01
	jr nz, UnknownRJump_0x59B73
	ld b, 2
	call UnknownCall_0x3D22
	call UnknownCall_0x3C1C
	ld a, [$AF2F]
	bit 1, a
	ret z

UnknownData_0x59B49:
INCBIN "baserom.gb", $59B49, $59B54 - $59B49

	ld a, [$FF00+$F0]
	and $01
	jr nz, UnknownRJump_0x59B73
	ld b, 2
	call UnknownCall_0x3D32
	call UnknownCall_0x3BB8
	ld a, [$AF2F]
	bit 0, a
	ret z

UnknownData_0x59B68:
INCBIN "baserom.gb", $59B68, $59B73 - $59B68


UnknownRJump_0x59B73:
	ld a, [$FF00+$E8]
	dec a
	jr z, UnknownRJump_0x59B94
	call UnknownCall_0x5B46C
	ld a, [$FF00+$E0]
	cp c
	jr z, UnknownRJump_0x59B8C
	call UnknownCall_0x3D2D
	call UnknownCall_0x3B7C
	ld a, [$AF2F]
	bit 2, a
	ret z

UnknownRJump_0x59B8C:
	xor a
	ld [$FF00+$E0], a
	ld a, 1
	ld [$FF00+$E8], a
	ret

UnknownRJump_0x59B94:
	call UnknownCall_0x5B451
	call UnknownCall_0x3D3D
	call UnknownCall_0x3B40
	ld a, [$AF2F]
	bit 3, a
	ret z
	xor a
	ld [$FF00+$E0], a
	ld [$FF00+$E8], a
	ld a, [$FF00+$DF]
	xor $03
	ld [$FF00+$DF], a
	ret
	call UnknownCall_0x5B57E
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x59BBF
	ld a, 77
	ld [$FF00+$E2], a
	call UnknownCall_0x5B3C6
	ret

UnknownRJump_0x59BBF:
	dec a
	rst $28

UnknownData_0x59BC1:
INCBIN "baserom.gb", $59BC1, $59BC5 - $59BC1

	call UnknownCall_0x5B585
	ld a, [$FF00+$DF]
	rst $28

UnknownData_0x59BCB:
INCBIN "baserom.gb", $59BCB, $59BD1 - $59BCB

	ld a, 16
	ld [$FF00+$DE], a
	ld a, 78
	ld [$FF00+$E2], a
	call UnknownCall_0x5B3C6
	ld a, 1
	ld [$FF00+$EC], a
	ret
	ld a, [$FF00+$DF]
	rst $28

UnknownData_0x59BE4:
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
	call UnknownCall_0x5B2D7
	ret

UnknownJump_0x59C04:
	ld a, [$FF00+$D5]
	rst $28

UnknownData_0x59C07:
INCBIN "baserom.gb", $59C07, $59CE7 - $59C07

	call UnknownCall_0x5B51A
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x59CFF
	ld a, 16
	ld [$FF00+$DE], a
	ld a, 76
	ld [$FF00+$E2], a
	call UnknownCall_0x5B3C6
	ld a, 1
	ld [$FF00+$EC], a
	ret

UnknownRJump_0x59CFF:
	dec a
	rst $28

UnknownData_0x59D01:
INCBIN "baserom.gb", $59D01, $59D05 - $59D01

	call UnknownCall_0x3C1C
	ld a, [$AF2F]
	bit 1, a
	jr nz, UnknownRJump_0x59D2D
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0x59D1D
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 48
	ld [$FF00+$E9], a
	ret

UnknownRJump_0x59D1D:
	ld b, 1
	call UnknownCall_0x3D22

UnknownRJump_0x59D22:
	ld a, [$FF00+$E9]
	dec a
	ld [$FF00+$E9], a
	ret nz
	ld a, 16
	ld [$FF00+$EC], a
	ret

UnknownJump_0x59D2D:
UnknownRJump_0x59D2D:
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a

UnknownJump_0x59D33:
	ld a, [$FF00+$DF]
	xor $03
	ld [$FF00+$DF], a
	ret

UnknownJump_0x59D3A:
	ld b, 1
	call UnknownCall_0x3D32
	jr UnknownRJump_0x59D22
	call UnknownCall_0x3BB8
	ld a, [$AF2F]
	bit 0, a
	jr nz, UnknownRJump_0x59D2D
	ld a, [$FF00+$EC]
	and a
	jp z, UnknownJump_0x59D3A
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 48
	ld [$FF00+$E9], a
	ret
	call UnknownCall_0x5B51A
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x59D6E
	ld a, 16
	ld [$FF00+$DE], a
	ld a, 72
	ld [$FF00+$E2], a
	call UnknownCall_0x5B3C6
	ret

UnknownRJump_0x59D6E:
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_0x59D72:
INCBIN "baserom.gb", $59D72, $59D7A - $59D72

	call UnknownCall_0x3C44
	ld a, [$AF2F]
	bit 1, a
	jr nz, UnknownRJump_0x59D2D
	ld b, 1
	call UnknownCall_0x3D22
	jr UnknownRJump_0x59D9B
	call UnknownCall_0x3BE0
	ld a, [$AF2F]
	bit 0, a
	jp nz, UnknownJump_0x59D2D
	ld b, 1
	call UnknownCall_0x3D32

UnknownRJump_0x59D9B:
	call UnknownCall_0x5B4B4
	cp $24
	ret nc
	ld a, [$FF00+$DF]
	add 2
	ld [$FF00+$DF], a
	ret
	call UnknownCall_0x3C44
	ld a, [$AF2F]
	bit 1, a
	jr nz, UnknownRJump_0x59DF9
	ld a, [$FF00+$E9]
	and a
	jr nz, UnknownRJump_0x59DBF
	call UnknownCall_0x5B449
	call UnknownCall_0x3D22
	jr UnknownRJump_0x59DE4

UnknownRJump_0x59DBF:
	call UnknownCall_0x5B481
	call UnknownCall_0x3D22
	jr UnknownRJump_0x59DE4
	call UnknownCall_0x3BE0
	ld a, [$AF2F]
	bit 0, a
	jr nz, UnknownRJump_0x59DF9
	ld a, [$FF00+$E9]
	and a
	jr nz, UnknownRJump_0x59DDE
	call UnknownCall_0x5B449
	call UnknownCall_0x3D32
	jr UnknownRJump_0x59DE4

UnknownRJump_0x59DDE:
	call UnknownCall_0x5B481
	call UnknownCall_0x3D32

UnknownRJump_0x59DE4:
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

UnknownRJump_0x59DF9:
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a
	ld a, [$FF00+$DF]
	xor $07
	ld [$FF00+$DF], a
	ret
	call UnknownCall_0x5B51A
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x59E1F
	ld a, 16
	ld [$FF00+$DE], a
	ld a, 76
	ld [$FF00+$E2], a
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 48
	ld [$FF00+$E8], a
	ret

UnknownRJump_0x59E1F:
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_0x59E28:
INCBIN "baserom.gb", $59E28, $59E2C - $59E28

	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0x59E35
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_0x59E35:
	ld b, 1
	call UnknownCall_0x3D2D

UnknownRJump_0x59E3A:
	ld a, [$FF00+$E8]
	sub b
	ld [$FF00+$E8], a
	ret nz
	ld a, 48
	ld [$FF00+$E8], a
	ld a, 16
	ld [$FF00+$EC], a
	jp UnknownJump_0x59D33
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0x59E54
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_0x59E54:
	ld b, 1
	call UnknownCall_0x3D3D
	jr UnknownRJump_0x59E3A
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x59E70
	ld a, 16
	ld [$FF00+$DE], a
	ld a, 76
	ld [$FF00+$E2], a
	call UnknownCall_0x5B3C6
	ld a, 48
	ld [$FF00+$E9], a
	ret

UnknownRJump_0x59E70:
	dec a
	rst $28

UnknownData_0x59E72:
INCBIN "baserom.gb", $59E72, $59E7A - $59E72

	call UnknownCall_0x5B51A
	call UnknownCall_0x3C1C
	ld a, [$AF2F]
	bit 1, a
	jp nz, UnknownJump_0x59D2D
	ld b, 1
	call UnknownCall_0x3D22

UnknownRJump_0x59E8D:
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
	call UnknownCall_0x5B51A
	call UnknownCall_0x3BB8
	ld a, [$AF2F]
	bit 0, a
	jp nz, UnknownJump_0x59D2D
	ld b, 1
	call UnknownCall_0x3D32
	jr UnknownRJump_0x59E8D
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$FF00+$DB]
	cp $37
	jr z, UnknownRJump_0x59EC4
	inc a
	ld [$FF00+$DB], a
	ret

UnknownRJump_0x59EC4:
	call UnknownCall_0x3B7C
	ld a, [$AF2F]
	bit 2, a
	jr nz, UnknownRJump_0x59EDB
	ld b, 1
	call UnknownCall_0x3D2D
	ld a, [$FF00+$E8]
	add b
	ld [$FF00+$E8], a
	cp $20
	ret nz

UnknownRJump_0x59EDB:
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$FF00+$DB]
	cp $35
	jr z, UnknownRJump_0x59EF0
	dec a
	ld [$FF00+$DB], a
	ret

UnknownRJump_0x59EF0:
	ld b, 1
	call UnknownCall_0x3D3D
	ld a, [$FF00+$E8]
	sub b
	ld [$FF00+$E8], a
	ret nz
	call UnknownCall_0x5B3C6
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x59F17
	ld a, 16
	ld [$FF00+$DE], a
	ld a, 72
	ld [$FF00+$E2], a
	call UnknownCall_0x5B4B4
	cp $30
	ret nc
	ld a, 1
	ld [$FF00+$DF], a
	ret

UnknownRJump_0x59F17:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_0x59F20:
INCBIN "baserom.gb", $59F20, $59F24 - $59F20

	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0x59F2D
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_0x59F2D:
	ld b, 8
	call UnknownCall_0x3D3D
	ld a, [$FF00+$DB]
	inc a
	ld [$FF00+$DB], a
	cp $29
	ret nz
	ld a, 8
	ld [$FF00+$EC], a
	jp UnknownJump_0x59D33
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0x59F4A
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_0x59F4A:
	ld b, 8
	call UnknownCall_0x3D2D
	ld a, [$FF00+$DB]
	dec a
	ld [$FF00+$DB], a
	cp $25
	ret nz
	ld a, 8
	ld [$FF00+$EC], a
	jp UnknownJump_0x59D33
	call UnknownCall_0x5B51A
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x59F76
	ld a, 16
	ld [$FF00+$DE], a
	ld a, 72
	ld [$FF00+$E2], a
	call UnknownCall_0x5B3C6
	ld a, 48
	ld [$FF00+$E9], a
	ret

UnknownRJump_0x59F76:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_0x59F7F:
INCBIN "baserom.gb", $59F7F, $59F83 - $59F7F

	ld b, 2
	call UnknownCall_0x3D22

UnknownRJump_0x59F88:
	ld a, [$FF00+$E9]
	sub b
	ld [$FF00+$E9], a
	jr nz, UnknownRJump_0x59FAA
	ld a, 48
	ld [$FF00+$E9], a
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_0x59F9D
	ld a, 1
	ld [$FF00+$E8], a
	ret

UnknownRJump_0x59F9D:
	xor a
	ld [$FF00+$E8], a
	jp UnknownJump_0x59D2D
	ld b, 2
	call UnknownCall_0x3D32
	jr UnknownRJump_0x59F88

UnknownRJump_0x59FAA:
	ld b, 1
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_0x59FB5
	call UnknownCall_0x3D2D
	ret

UnknownRJump_0x59FB5:
	call UnknownCall_0x3D3D
	ret
	call UnknownCall_0x5B57E
	ld a, [$FF00+$DF]
	and a
	jp nz, UnknownJump_0x58215
	call UnknownCall_0x5B3C6
	ld a, 16
	ld [$FF00+$DE], a
	ld a, 77
	ld [$FF00+$E2], a
	ret
	call UnknownCall_0x5B57E
	ld a, [$FF00+$DF]
	and a
	jp nz, UnknownJump_0x58215
	call UnknownCall_0x5B3C6
	ld a, 77
	ld [$FF00+$E2], a
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x59FF0
	ld a, 77
	ld [$FF00+$E2], a
	call UnknownCall_0x5B3C6
	ld a, 24
	ld [$FF00+$EC], a
	ret

UnknownRJump_0x59FF0:
	dec a
	rst $28

UnknownData_0x59FF2:
INCBIN "baserom.gb", $59FF2, $59FF8 - $59FF2

	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0x5A001
	dec a
	ld [$FF00+$EC], a
	ret nz

UnknownRJump_0x5A001:
	ld a, 62
	ld [$AF37], a
	ld a, [$FF00+$DD]
	ld [$AF38], a
	ld a, 36
	ld [$AF36], a
	call UnknownCall_0x5B36D
	ld a, 16
	ld [$FF00+$EC], a
	ld a, 3
	ld [$FF00+$DF], a
	ret
	call UnknownCall_0x5B57E
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 59
	ld [$FF00+$DB], a
	call UnknownCall_0x5B3C6
	ld a, 112
	ld [$FF00+$EC], a
	ret
	call UnknownCall_0x5B5B6
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x5A04F
	ld a, 72
	ld [$FF00+$E2], a
	call UnknownCall_0x3CB1
	ld b, 16
	ld a, [$FF00+$DD]
	and a
	jr nz, UnknownRJump_0x5A04B
	call UnknownCall_0x3D22
	ret

UnknownRJump_0x5A04B:
UnknownData_0x5A04B:
INCBIN "baserom.gb", $5A04B, $5A04F - $5A04B


UnknownRJump_0x5A04F:
	dec a
	rst $28

UnknownData_0x5A051:
INCBIN "baserom.gb", $5A051, $5A055 - $5A051

	call UnknownCall_0x3C1C
	ld a, [$AF2F]
	bit 1, a
	jr nz, UnknownRJump_0x5A066
	ld b, 1
	call UnknownCall_0x3D22
	jr UnknownRJump_0x5A07E

UnknownRJump_0x5A066:
	ld a, 2
	ld [$AF26], a
	call UnknownCall_0x5B2D7
	ret

UnknownData_0x5A06F:
INCBIN "baserom.gb", $5A06F, $5A07E - $5A06F


UnknownRJump_0x5A07E:
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_0x5A08F
	call UnknownCall_0x5B465
	call UnknownCall_0x3D2D
	ld a, [$FF00+$E0]
	cp c
	ret nz
	jr UnknownRJump_0x5A0A0

UnknownRJump_0x5A08F:
	call UnknownCall_0x3B40
	ld a, [$AF2F]
	bit 3, a
	jr nz, UnknownRJump_0x5A0A0
	call UnknownCall_0x5B441
	call UnknownCall_0x3D3D
	ret

UnknownRJump_0x5A0A0:
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$E8]
	xor $01
	ld [$FF00+$E8], a
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x5A0BB
	ld a, 77
	ld [$FF00+$E2], a
	call UnknownCall_0x5B3C6
	ld a, 48
	ld [$FF00+$E9], a
	ret

UnknownRJump_0x5A0BB:
	ld a, [$FF00+$E9]
	dec a
	ld [$FF00+$E9], a
	jr z, UnknownRJump_0x5A0D5
	ld a, [$FF00+$DF]
	cp $03
	call c, UnknownCall_0x5B585
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_0x5A0CD:
INCBIN "baserom.gb", $5A0CD, $5A0D5 - $5A0CD


UnknownRJump_0x5A0D5:
	ld a, 66
	ld [$FF00+$DB], a
	ld a, 69
	ld [$AF37], a
	ld a, [$FF00+$DD]
	ld [$AF38], a
	ld a, 38
	ld [$AF36], a
	call UnknownCall_0x5B36D
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
	jr nz, UnknownRJump_0x5A119
	call UnknownCall_0x3D32

UnknownRJump_0x5A10E:
	ld a, 88
	ld [$FF00+$E9], a
	ld a, [$FF00+$DF]
	sub 2
	ld [$FF00+$DF], a
	ret

UnknownRJump_0x5A119:
	call UnknownCall_0x3D22
	jr UnknownRJump_0x5A10E
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x5A13E
	ld a, 72
	ld [$FF00+$E2], a
	call UnknownCall_0x3CB1
	ld b, 15
	call UnknownCall_0x3D2D
	ld b, 11
	ld a, [$FF00+$DF]
	dec a
	jr nz, UnknownRJump_0x5A13A
	call UnknownCall_0x3D22
	ret

UnknownRJump_0x5A13A:
	call UnknownCall_0x3D32
	ret

UnknownRJump_0x5A13E:
	dec a
	rst $28

UnknownData_0x5A140:
INCBIN "baserom.gb", $5A140, $5A148 - $5A140

	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld b, 1
	call UnknownCall_0x3D22
	jr UnknownRJump_0x5A15E
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld b, 1
	call UnknownCall_0x3D32

UnknownRJump_0x5A15E:
	ld a, [$FF00+$DB]
	inc a
	ld [$FF00+$DB], a
	cp $49
	ret nz
	ld a, [$FF00+$DF]
	add 2
	ld [$FF00+$DF], a
	ret
	ld b, 2
	call UnknownCall_0x3D22
	ret
	ld b, 2
	call UnknownCall_0x3D32
	ret
	ld a, [$FF00+$DF]
	cp $03
	call c, UnknownCall_0x5B585
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x5A18D
	ld a, 77
	ld [$FF00+$E2], a
	call UnknownCall_0x5B3C6
	ret

UnknownRJump_0x5A18D:
	dec a
	rst $28

UnknownData_0x5A18F:
INCBIN "baserom.gb", $5A18F, $5A197 - $5A18F

	call UnknownCall_0x582FB
	jr UnknownRJump_0x5A19F
	call UnknownCall_0x5831A

UnknownRJump_0x5A19F:
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0x5A1A8
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_0x5A1A8:
	call UnknownCall_0x5B4B4
	cp $20
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
	cp $61
	ret nz
	ld a, 4
	ld [$FF00+$DF], a
	ld a, 32
	ld [$FF00+$EC], a
	ret
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0x5A1DD
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_0x5A1DD:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld a, [$FF00+$DB]
	inc a
	ld [$FF00+$DB], a
	cp $63
	ret nz
	call UnknownCall_0x5B3C6
	ld a, 77
	ld [$FF00+$E2], a
	ld a, 64
	ld [$FF00+$EC], a
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x5A204
	ld a, 77
	ld [$FF00+$E2], a
	ld a, 3
	ld [$FF00+$DF], a
	ret

UnknownRJump_0x5A204:
	dec a
	rst $28

UnknownData_0x5A206:
INCBIN "baserom.gb", $5A206, $5A20C - $5A206

	ld a, [$FF00+$DB]
	set 0, a
	ld [$FF00+$DB], a
	call UnknownCall_0x5B4B4
	cp $18
	ret nc
	call UnknownCall_0x5B3C6
	ld a, 23
	ld [$A470], a
	ret
	ld b, 3
	call UnknownCall_0x3D32
	jr UnknownRJump_0x5A22D
	ld b, 3
	call UnknownCall_0x3D22

UnknownRJump_0x5A22D:
	call UnknownCall_0x5B521
	ld b, 1
	call UnknownCall_0x3D2D
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x5A244
	ld a, 32
	ld [$FF00+$E2], a
	ld a, 1
	ld [$FF00+$DF], a
	ret

UnknownRJump_0x5A244:
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_0x5A248:
INCBIN "baserom.gb", $5A248, $5A24A - $5A248

	call UnknownCall_0x5B5AD
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld b, 1
	call UnknownCall_0x3CC0
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x5A271
	ld a, 32
	ld [$FF00+$E2], a
	ld a, [$FF00+$E7]
	bit 3, a
	ret z
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 24
	ld [$FF00+$E8], a
	ld [$FF00+$E9], a
	ret

UnknownRJump_0x5A271:
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_0x5A275:
INCBIN "baserom.gb", $5A275, $5A27B - $5A275

	ld a, [$FF00+$E7]
	bit 3, a
	jr z, UnknownRJump_0x5A297
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$FF00+$E8]
	and a
	jr z, UnknownRJump_0x5A2A0
	dec a
	ld [$FF00+$E8], a
	ld b, 1
	call UnknownCall_0x3D3D
	call UnknownCall_0x3CDF
	ret

UnknownRJump_0x5A297:
	ld a, 2
	ld [$FF00+$DF], a
	ld a, 16
	ld [$FF00+$EC], a
	ret

UnknownRJump_0x5A2A0:
	ld a, 3
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$E7]
	bit 3, a
	jr nz, UnknownRJump_0x5A2C4
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0x5A2B4
	dec a
	ld [$FF00+$EC], a
	ret nz

UnknownRJump_0x5A2B4:
	ld a, [$FF00+$E9]
	ld c, a
	ld a, [$FF00+$E8]
	cp c
	ret z
	inc a
	ld [$FF00+$E8], a
	ld b, 1
	call UnknownCall_0x3D2D
	ret

UnknownRJump_0x5A2C4:
	ld a, 1
	ld [$FF00+$DF], a
	xor a
	ld [$FF00+$EC], a
	ret
	call UnknownCall_0x5B2BF
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x5A2E6
	ld a, 77
	ld [$FF00+$E2], a
	ld a, 5
	ld [$FF00+$DF], a
	ld a, 16
	ld [$FF00+$E8], a
	ld a, 128
	ld [$FF00+$DC], a
	ret

UnknownRJump_0x5A2E6:
	call UnknownCall_0x5B5AD
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_0x5A2ED:
INCBIN "baserom.gb", $5A2ED, $5A2F7 - $5A2ED

	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld b, 1
	call UnknownCall_0x3D2D
	ld a, [$FF00+$E8]
	sub b
	ld [$FF00+$E8], a
	ret nz
	call UnknownCall_0x5B3C6
	xor a
	ld [$FF00+$DC], a
	ret
	call UnknownCall_0x5B521
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x5A325
	ld a, 72
	ld [$FF00+$E2], a
	call UnknownCall_0x5B3C6
	ld a, 56
	ld [$FF00+$E9], a
	add a
	ld [$FF00+$E8], a
	ret

UnknownJump_0x5A325:
UnknownRJump_0x5A325:
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_0x5A32E:
INCBIN "baserom.gb", $5A32E, $5A332 - $5A32E

	ld b, 1
	call UnknownCall_0x3D22
	jr UnknownRJump_0x5A33E
	ld b, 1
	call UnknownCall_0x3D32

UnknownRJump_0x5A33E:
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
	jr nz, UnknownRJump_0x5A385
	ld b, 36
	call UnknownCall_0x3D2D
	call UnknownCall_0x5B3C6
	and a
	jr z, UnknownRJump_0x5A376

UnknownData_0x5A365:
INCBIN "baserom.gb", $5A365, $5A376 - $5A365


UnknownRJump_0x5A376:
	ld a, 18
	ld [$FF00+$DF], a
	ld a, 1
	ld [$FF00+$E8], a
	ld [$FF00+$E9], a
	ld a, 72
	ld [$FF00+$E2], a
	ret

UnknownRJump_0x5A385:
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$FF00+$DF]
	and $F0
	swap a
	dec a
	jr z, UnknownRJump_0x5A3A4
	dec a
	jr z, UnknownRJump_0x5A3AF
	dec a
	jr z, UnknownRJump_0x5A3BA
	ld hl, $6519
	call UnknownCall_0x5A478
	call UnknownCall_0x3D10
	jr UnknownRJump_0x5A3C3

UnknownRJump_0x5A3A4:
	ld hl, $6519
	call UnknownCall_0x5A3F7
	call UnknownCall_0x3CDF
	jr UnknownRJump_0x5A3C3

UnknownRJump_0x5A3AF:
	ld hl, $652F
	call UnknownCall_0x5A405
	call UnknownCall_0x3CDF
	jr UnknownRJump_0x5A3C3

UnknownRJump_0x5A3BA:
	ld hl, $652F
	call UnknownCall_0x5A486
	call UnknownCall_0x3D10

UnknownRJump_0x5A3C3:
	ld a, [$FF00+$DF]
	and $0F
	jr z, UnknownRJump_0x5A3D9
	dec a
	jr z, UnknownRJump_0x5A3E3
	dec a
	jr z, UnknownRJump_0x5A3ED
	ld hl, $652F
	call UnknownCall_0x5A4D4
	call UnknownCall_0x3CC0
	ret

UnknownRJump_0x5A3D9:
	ld hl, $6519
	call UnknownCall_0x5A49F
	call UnknownCall_0x3CC0
	ret

UnknownRJump_0x5A3E3:
	ld hl, $6519
	call UnknownCall_0x5A4B8
	call UnknownCall_0x3CF1
	ret

UnknownRJump_0x5A3ED:
	ld hl, $652F
	call UnknownCall_0x5A4C6
	call UnknownCall_0x3CF1
	ret

UnknownCall_0x5A3F7:
	call UnknownCall_0x5A413
	call UnknownCall_0x5A41E
	ld a, [$AF27]
	and a
	ret nz
	ld [hl], 1
	ret

UnknownCall_0x5A405:
	call UnknownCall_0x5A413
	call UnknownCall_0x5A41E
	ld a, [$AF27]
	and a
	ret nz
	ld [hl], 20
	ret

UnknownCall_0x5A413:
	ld a, [$FF00+$E8]
	ld e, a
	ld d, 0
	add de
	ld b, [hl]
	call UnknownCall_0x3D3D
	ret

UnknownCall_0x5A41E:
	xor a
	ld [$AF27], a
	ld hl, $FFE8
	inc [hl]
	ld a, [hl]
	cp $15
	jr nz, UnknownRJump_0x5A432
	ld a, [$FF00+$DF]
	add 16
	ld [$FF00+$DF], a
	ret

UnknownRJump_0x5A432:
	ld a, 1
	ld [$AF27], a
	ret

UnknownCall_0x5A438:
	xor a
	ld [$AF27], a
	ld hl, $FFE8
	dec [hl]
	jr nz, UnknownRJump_0x5A432
	ld a, [$FF00+$DF]
	add 16
	cp $50
	jr c, UnknownRJump_0x5A44C
	sub 64

UnknownRJump_0x5A44C:
	ld [$FF00+$DF], a
	ret

UnknownCall_0x5A44F:
	xor a
	ld [$AF27], a
	ld hl, $FFE9
	dec [hl]
	jr nz, UnknownRJump_0x5A432
	ld a, [$FF00+$DF]
	inc a
	bit 2, a
	jr z, UnknownRJump_0x5A44C
	sub 4
	ld [$FF00+$DF], a
	ret

UnknownCall_0x5A465:
	xor a
	ld [$AF27], a
	ld hl, $FFE9
	inc [hl]
	ld a, [hl]
	cp $15
	jr nz, UnknownRJump_0x5A432
	ld a, [$FF00+$DF]
	inc a
	ld [$FF00+$DF], a
	ret

UnknownCall_0x5A478:
	call UnknownCall_0x5A494
	call UnknownCall_0x5A438
	ld a, [$AF27]
	and a
	ret nz
	ld [hl], 1
	ret

UnknownCall_0x5A486:
	call UnknownCall_0x5A494
	call UnknownCall_0x5A438
	ld a, [$AF27]
	and a
	ret nz
	ld [hl], 20
	ret

UnknownCall_0x5A494:
	ld a, [$FF00+$E8]
	ld e, a
	ld d, 0
	add de
	ld b, [hl]
	call UnknownCall_0x3D2D
	ret

UnknownCall_0x5A49F:
	call UnknownCall_0x5A4AD
	call UnknownCall_0x5A44F
	ld a, [$AF27]
	and a
	ret nz
	ld [hl], 1
	ret

UnknownCall_0x5A4AD:
	ld a, [$FF00+$E9]
	ld e, a
	ld d, 0
	add de
	ld b, [hl]
	call UnknownCall_0x3D32
	ret

UnknownCall_0x5A4B8:
	call UnknownCall_0x5A4E2
	call UnknownCall_0x5A465
	ld a, [$AF27]
	and a
	ret nz
	ld [hl], 1
	ret

UnknownCall_0x5A4C6:
	call UnknownCall_0x5A4E2
	call UnknownCall_0x5A465
	ld a, [$AF27]
	and a
	ret nz
	ld [hl], 20
	ret

UnknownCall_0x5A4D4:
	call UnknownCall_0x5A4AD
	call UnknownCall_0x5A44F
	ld a, [$AF27]
	and a
	ret nz
	ld [hl], 20
	ret

UnknownCall_0x5A4E2:
	ld a, [$FF00+$E9]
	ld e, a
	ld d, 0
	add de
	ld b, [hl]
	call UnknownCall_0x3D22
	ret

UnknownData_0x5A4ED:
INCBIN "baserom.gb", $5A4ED, $5A545 - $5A4ED

	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x5A568
	ld a, 32
	ld [$FF00+$E2], a
	ld a, 16
	ld [$FF00+$DE], a
	call UnknownCall_0x5B3C6
	ld a, 168
	ld [$AF37], a
	ld a, [$FF00+$DD]
	ld [$AF38], a
	ld a, 69
	ld [$AF36], a
	call UnknownCall_0x5B36D
	ret

UnknownRJump_0x5A568:
	call UnknownCall_0x5B5D8
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_0x5A574:
INCBIN "baserom.gb", $5A574, $5A578 - $5A574

	call UnknownCall_0x3C58
	ld a, [$AF2F]
	bit 1, a
	jp nz, UnknownJump_0x59D2D
	ld b, 1
	call UnknownCall_0x3D22
	call UnknownCall_0x3CF1
	jr UnknownRJump_0x5A5A0
	call UnknownCall_0x3BF4
	ld a, [$AF2F]
	bit 0, a
	jp nz, UnknownJump_0x59D2D
	ld b, 1
	call UnknownCall_0x3D32
	call UnknownCall_0x3CC0

UnknownRJump_0x5A5A0:
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_0x5A5B0
	call UnknownCall_0x5B465
	call UnknownCall_0x3D2D
	call UnknownCall_0x3D10
	jr UnknownRJump_0x5A5B9

UnknownRJump_0x5A5B0:
	call UnknownCall_0x5B441
	call UnknownCall_0x3D3D
	call UnknownCall_0x3CDF

UnknownRJump_0x5A5B9:
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
	jr nz, UnknownRJump_0x5A5DA
	ld a, 77
	ld [$FF00+$E2], a
	ld a, 1
	ld [$FF00+$DF], a
	ld b, 24
	call UnknownCall_0x3D2D
	ret

UnknownRJump_0x5A5DA:
	call UnknownCall_0x5B57E
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_0x5A5E1:
INCBIN "baserom.gb", $5A5E1, $5A5E3 - $5A5E1

	call UnknownCall_0x5B4F5
	ld b, 24
	call UnknownCall_0x3D2D
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x5A603
	ld a, 16
	ld [$FF00+$DE], a
	ld a, 32
	ld [$FF00+$E2], a
	ld a, [$FF00+$E7]
	bit 3, a
	ret z
	ld a, 1
	ld [$FF00+$DF], a
	ret

UnknownRJump_0x5A603:
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_0x5A607:
INCBIN "baserom.gb", $5A607, $5A60F - $5A607

	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld b, 1
	call UnknownCall_0x3D2D
	call UnknownCall_0x3D10
	call UnknownCall_0x3D32
	call UnknownCall_0x3CC0
	ld a, [$FF00+$E9]
	add b
	ld [$FF00+$E9], a
	cp $30
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
	call UnknownCall_0x3D3D
	call UnknownCall_0x3CDF
	call UnknownCall_0x3D32
	call UnknownCall_0x3CC0
	ld a, [$FF00+$E9]
	add b
	ld [$FF00+$E9], a
	cp $20
	ret nz
	xor a
	ld [$FF00+$E9], a
	ld a, 3
	ld [$FF00+$DF], a
	ld a, 64
	ld [$FF00+$EC], a
	ret
	call UnknownCall_0x5B68B
	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	call UnknownCall_0x5B2BF
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x5A674
	ld a, 77
	ld [$FF00+$E2], a
	call UnknownCall_0x5B3C6
	ret

UnknownRJump_0x5A674:
	call UnknownCall_0x5B57E
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_0x5A67B:
INCBIN "baserom.gb", $5A67B, $5A683 - $5A67B

	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x5A691
	ld a, 32
	ld [$FF00+$E2], a
	ld a, 4
	ld [$FF00+$DF], a
	ret

UnknownRJump_0x5A691:
	dec a
	rst $28

UnknownData_0x5A693:
INCBIN "baserom.gb", $5A693, $5A69B - $5A693

	ld a, [$FF00+$E7]
	bit 3, a
	ret z
	ld a, 1
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$DB]
	inc a
	ld [$FF00+$DB], a
	cp $BE
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
	call UnknownCall_0x3D32
	call UnknownCall_0x3CC0
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
	jr z, UnknownRJump_0x5A6DB
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_0x5A6DB:
	ld a, [$FF00+$DB]
	cp $BC
	ret z
	dec a
	ld [$FF00+$DB], a
	xor a
	ld [$FF00+$E2], a
	ret
	call UnknownCall_0x5B51A
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x5A6F7
	ld a, 72
	ld [$FF00+$E2], a
	call UnknownCall_0x5B3C6
	ret

UnknownRJump_0x5A6F7:
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_0x5A6FB:
INCBIN "baserom.gb", $5A6FB, $5A6FF - $5A6FB

	ld b, 1
	call UnknownCall_0x3D22
	call UnknownCall_0x3AF0
	ld a, [$AF2F]
	bit 2, a
	jp z, UnknownJump_0x59D2D
	ret
	ld b, 1
	call UnknownCall_0x3D32
	call UnknownCall_0x3B04
	ld a, [$AF2F]
	bit 2, a
	jp z, UnknownJump_0x59D2D
	ret
	call UnknownCall_0x5B639
	ld a, [$FF00+$DF]
	and a
	jp nz, UnknownJump_0x5A325
	ld a, 72
	ld [$FF00+$E2], a
	call UnknownCall_0x5B3C6
	ld a, 56
	ld [$FF00+$E9], a
	add a
	ld [$FF00+$E8], a
	ret
	call UnknownCall_0x5B51A
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x5A749
	ld a, 72
	ld [$FF00+$E2], a
	call UnknownCall_0x5B3C6
	ret

UnknownRJump_0x5A749:
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_0x5A74D:
INCBIN "baserom.gb", $5A74D, $5A751 - $5A74D

	ld b, 1
	call UnknownCall_0x3D22
	call UnknownCall_0x3B18
	ld a, [$AF2F]
	bit 3, a
	jp z, UnknownJump_0x59D2D
	ret
	ld b, 1
	call UnknownCall_0x3D32
	call UnknownCall_0x3B2C
	ld a, [$AF2F]
	bit 3, a
	jp z, UnknownJump_0x59D2D
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x5A787
	ld a, 77
	ld [$FF00+$E2], a
	call UnknownCall_0x5B3C6
	ld a, 24
	ld [$FF00+$E9], a
	add a
	ld [$FF00+$E8], a
	ret

UnknownRJump_0x5A787:
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_0x5A78B:
INCBIN "baserom.gb", $5A78B, $5A793 - $5A78B

	call UnknownCall_0x5B51A
	ld b, 1
	call UnknownCall_0x3D22
	jr UnknownRJump_0x5A7A5
	call UnknownCall_0x5B51A
	ld b, 1
	call UnknownCall_0x3D32

UnknownRJump_0x5A7A5:
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
	call UnknownCall_0x5B41A
	ld a, [$AF2C]
	cp $FF
	jr z, UnknownRJump_0x5A7C6
	ld a, 147
	ld [$FF00+$DB], a
	ret

UnknownRJump_0x5A7C6:
	ld a, 148
	ld [$FF00+$DB], a
	ret
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0x5A7D4
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_0x5A7D4:
	ld a, 145
	ld [$AF37], a
	ld a, [$FF00+$DD]
	ld [$AF38], a
	ld a, [$FF00+$DB]
	cp $94
	jr nz, UnknownRJump_0x5A7EB
	ld a, [$AF38]
	inc a
	ld [$AF38], a

UnknownRJump_0x5A7EB:
	ld a, 78
	ld [$AF36], a
	call UnknownCall_0x5B36D
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
	jp UnknownJump_0x59D2D
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x5A834
	ld a, 73
	ld [$FF00+$E2], a
	call UnknownCall_0x3CB1
	ld a, [$FF00+$DD]
	bit 0, a
	jr nz, UnknownRJump_0x5A82F
	ld a, [$FF00+$DF]
	add 2
	ld [$FF00+$DF], a
	ret

UnknownRJump_0x5A82F:
	res 0, a
	ld [$FF00+$DD], a
	ret

UnknownRJump_0x5A834:
	dec a
	rst $28

UnknownData_0x5A836:
INCBIN "baserom.gb", $5A836, $5A83E - $5A836

	ld b, 1
	call UnknownCall_0x3D22
	jr UnknownRJump_0x5A84A
	ld b, 1
	call UnknownCall_0x3D32

UnknownRJump_0x5A84A:
	ld b, 1
	call UnknownCall_0x3D2D
	ret
	ld b, 2
	call UnknownCall_0x3D22
	ret
	ld b, 2
	call UnknownCall_0x3D32
	ret

UnknownData_0x5A85C:
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
	jr nz, UnknownRJump_0x5A913
	call UnknownCall_0x5B3C6
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
	call UnknownCall_0x5B36D
	ld b, 16
	call UnknownCall_0x3D2D
	ld a, 18
	ld [$A470], a
	ret

UnknownRJump_0x5A913:
	dec a
	rst $28

UnknownData_0x5A915:
INCBIN "baserom.gb", $5A915, $5A91D - $5A915


UnknownRJump_0x5A91D:
	call UnknownCall_0x3B54
	ld a, [$AF2F]
	bit 3, a
	ret nz
	ld a, [$FF00+$DF]
	add 2
	ld [$FF00+$DF], a
	ret

UnknownData_0x5A92D:
INCBIN "baserom.gb", $5A92D, $5A939 - $5A92D

	ld a, [$FF00+$F0]
	and $01
	jr nz, UnknownRJump_0x5A91D

UnknownRJump_0x5A93F:
	ld b, 3
	call UnknownCall_0x3D32
	ret
	ld a, [$FF00+$F0]
	and $01
	jr z, UnknownRJump_0x5A93F
	jr UnknownRJump_0x5A953

UnknownData_0x5A94D:
INCBIN "baserom.gb", $5A94D, $5A953 - $5A94D


UnknownRJump_0x5A953:
	call UnknownCall_0x5B451
	call UnknownCall_0x3D3D
	call UnknownCall_0x3B54
	ld a, [$AF2F]
	bit 3, a
	ret z
	ld a, [$FF00+$DF]
	sub 2
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x5A973
	ld a, 1
	ld [$FF00+$DF], a
	ret

UnknownRJump_0x5A973:
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_0x5A977:
INCBIN "baserom.gb", $5A977, $5A979 - $5A977

	call UnknownCall_0x5B585
	call UnknownCall_0x5B4F5
	ld b, 20
	call UnknownCall_0x3D3D
	ld a, [$AF07]
	and a
	ret z
	ld a, 2
	ld [$AF26], a
	call UnknownCall_0x5B2D7
	ret
	call UnknownCall_0x5B521
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x5A9A9
	ld a, 72
	ld [$FF00+$E2], a
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 64
	ld [$FF00+$E8], a
	ld [$FF00+$E9], a
	ret

UnknownRJump_0x5A9A9:
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_0x5A9B2:
INCBIN "baserom.gb", $5A9B2, $5A9B6 - $5A9B2

	ld b, 1
	call UnknownCall_0x3D3D
	jr UnknownRJump_0x5A9C2

UnknownData_0x5A9BD:
INCBIN "baserom.gb", $5A9BD, $5A9C2 - $5A9BD


UnknownRJump_0x5A9C2:
	ld a, [$FF00+$E8]
	sub b
	ld [$FF00+$E8], a
	ret nz

UnknownData_0x5A9C8:
INCBIN "baserom.gb", $5A9C8, $5A9D3 - $5A9C8

	call UnknownCall_0x5B511
	xor a
	ld [$FF00+$DD], a
	ld a, [$FF00+$DF]
	and a
	jp nz, UnknownJump_0x58642
	ld a, 77
	ld [$FF00+$E2], a
	ld a, 1
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x5AA14
	ld b, 2
	call UnknownCall_0x3D3D
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
	call UnknownCall_0x5B4B4
	cp $28
	ret c
	call UnknownCall_0x5B3C6
	ret

UnknownRJump_0x5AA14:
	dec a
	rst $28

UnknownData_0x5AA16:
INCBIN "baserom.gb", $5AA16, $5AA20 - $5AA16

	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0x5AA29
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_0x5AA29:
	ld b, 1
	call UnknownCall_0x3D22
	jr UnknownRJump_0x5AA3E
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0x5AA39
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_0x5AA39:
	ld b, 1
	call UnknownCall_0x3D32

UnknownRJump_0x5AA3E:
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
	call UnknownCall_0x3D22
	jr UnknownRJump_0x5AA5F
	ld b, 3
	call UnknownCall_0x3D32

UnknownRJump_0x5AA5F:
	ld a, [$FF00+$DA]
	cp $B8
	ret c
	call UnknownCall_0x5B2BF
	ret
	ld a, [$FF00+$DF]
	and a
	jp nz, UnknownJump_0x59189
	jp UnknownJump_0x581B9
	ld a, [$FF00+$DF]
	and a
	jr nz, UnknownRJump_0x5AA85
	ld a, 72
	ld [$FF00+$E2], a
	ld a, 3
	ld [$FF00+$DF], a
	ld a, 8
	ld [$FF00+$E8], a
	ld [$FF00+$E9], a
	ret

UnknownRJump_0x5AA85:
	ld a, [$FF00+$DF]
	dec a
	rst $28

UnknownData_0x5AA89:
INCBIN "baserom.gb", $5AA89, $5AA8F - $5AA89

	call UnknownCall_0x5B4B4
	cp $20
	ret nc
	ld a, [$FF00+$DB]
	set 0, a
	ld [$FF00+$DB], a
	ld a, 1
	ld [$FF00+$DF], a
	ret
	ld b, 1
	call UnknownCall_0x3D2D
	jr UnknownRJump_0x5AAAC
	ld b, 1
	call UnknownCall_0x3D3D

UnknownRJump_0x5AAAC:
	ld a, [$FF00+$E8]
	sub b
	ld [$FF00+$E8], a
	ret nz
	ld a, [$FF00+$E9]
	ld [$FF00+$E8], a
	jp UnknownJump_0x59D33
	ld a, [$FF00+$DF]
	rst $28

UnknownData_0x5AABC:
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
	bit 3, a
	ret z
	ld b, 8
	call UnknownCall_0x3D3D
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
	call UnknownCall_0x3D22
	call UnknownCall_0x3D2D
	ld a, 193
	ld [$FF00+$DB], a
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 72
	ld [$FF00+$E2], a
	ret
	ld a, [sEasyMode]
	and $01
	jr nz, UnknownRJump_0x5AB1A
	ld b, 4
	jr UnknownRJump_0x5AB1C

UnknownRJump_0x5AB1A:
	ld b, 2

UnknownRJump_0x5AB1C:
	call UnknownCall_0x3D3D
	jr UnknownRJump_0x5AB31
	ld a, [sEasyMode]
	and $01
	jr nz, UnknownRJump_0x5AB2C
	ld b, 4
	jr UnknownRJump_0x5AB2E

UnknownRJump_0x5AB2C:
	ld b, 2

UnknownRJump_0x5AB2E:
	call UnknownCall_0x3D2D

UnknownRJump_0x5AB31:
	ld a, [$FF00+$E8]
	sub b
	ld [$FF00+$E8], a
	ret nz
	ld a, [$FF00+$E9]
	ld [$FF00+$E8], a
	ld a, [$FF00+$DF]
	cp $01
	call z, UnknownCall_0x5AB45
	jp UnknownJump_0x59D33

UnknownCall_0x5AB45:
	ld a, 10
	ld [$A470], a
	ret
	ld a, [$FF00+$DF]
	rst $28

UnknownData_0x5AB4E:
INCBIN "baserom.gb", $5AB4E, $5AB58 - $5AB4E

	ld a, [$FF00+$EC]
	dec a
	ld [$FF00+$EC], a
	ret nz
	ld a, 128
	ld [$FF00+$DC], a
	ld b, 48
	call UnknownCall_0x3D22
	ld b, 64
	call UnknownCall_0x3D2D
	ld a, 193
	ld [$FF00+$DB], a
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 72
	ld [$FF00+$E2], a
	ret
	call UnknownCall_0x5B585
	ld a, [$FF00+$DF]
	rst $28

UnknownData_0x5AB7F:
INCBIN "baserom.gb", $5AB7F, $5AB89 - $5AB7F

	ld a, 74
	ld [$FF00+$E2], a
	call UnknownCall_0x5B3C6
	ld a, [$FF00+$DF]
	ld [$FF00+$EF], a
	ret

UnknownCall_0x5AB95:
	call UnknownCall_0x3B40
	ld a, [$AF2F]
	bit 3, a
	jr nz, UnknownRJump_0x5ABA5
	ld b, 2
	call UnknownCall_0x3D3D
	ret

UnknownRJump_0x5ABA5:
	ld a, [$FF00+$DF]
	add 2

UnknownRJump_0x5ABA9:
	ld [$FF00+$DF], a
	ld [$FF00+$EF], a
	ret
	call UnknownCall_0x5AB95
	jr UnknownRJump_0x5ABBB
	call UnknownCall_0x5AB95
	jr UnknownRJump_0x5ABD3
	call UnknownCall_0x5ABE8

UnknownRJump_0x5ABBB:
	call UnknownCall_0x3C1C
	ld a, [$AF2F]
	bit 1, a
	jr nz, UnknownRJump_0x5ABCB
	ld b, 2
	call UnknownCall_0x3D22
	ret

UnknownRJump_0x5ABCB:
	ld a, [$FF00+$DF]
	inc a
	jr UnknownRJump_0x5ABA9
	call UnknownCall_0x5ABE8

UnknownRJump_0x5ABD3:
	call UnknownCall_0x3BB8
	ld a, [$AF2F]
	bit 0, a
	jr nz, UnknownRJump_0x5ABE3
	ld b, 2
	call UnknownCall_0x3D32
	ret

UnknownRJump_0x5ABE3:
	ld a, [$FF00+$DF]
	dec a
	jr UnknownRJump_0x5ABFC

UnknownCall_0x5ABE8:
	call UnknownCall_0x3B7C
	ld a, [$AF2F]
	bit 2, a
	jr nz, UnknownRJump_0x5ABF8
	ld b, 2
	call UnknownCall_0x3D2D
	ret

UnknownRJump_0x5ABF8:
	ld a, [$FF00+$DF]
	sub 2

UnknownRJump_0x5ABFC:
	ld [$FF00+$DF], a
	ld [$FF00+$EF], a
	ret
	ld a, [$FF00+$DF]
	rst $28

UnknownData_0x5AC04:
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
	ld a, [sEasyMode]
	and $01
	jr nz, UnknownRJump_0x5AC2A
	call UnknownCall_0x3AB4
	ld a, 73
	ld [$FF00+$E2], a
	ld a, [$FF00+$EF]
	ld [$FF00+$DF], a
	ret

UnknownRJump_0x5AC2A:
	ld a, 2
	ld [$AF26], a
	call UnknownCall_0x5B2D7
	ld a, [$A2E0]
	and a
	ret z
	dec a
	ld [$A2E0], a
	ret
	ld a, [$FF00+$DF]
	rst $28

UnknownData_0x5AC3F:
INCBIN "baserom.gb", $5AC3F, $5AC47 - $5AC3F

	ld a, 16
	ld [$FF00+$DE], a
	ld a, 72
	ld [$FF00+$E2], a
	ld a, 3
	ld [$FF00+$DF], a
	ret
	call UnknownCall_0x5B4B4
	cp $30
	ret nc
	ld a, 1
	ld [$FF00+$DF], a
	ret
	call UnknownCall_0x5B5B6
	jp UnknownJump_0x593FB
	call UnknownCall_0x5B5B6
	call UnknownCall_0x3B90
	ld a, [$AF2F]
	bit 2, a
	jr nz, UnknownRJump_0x5AC78
	ld b, 1
	call UnknownCall_0x3D2D
	ret

UnknownRJump_0x5AC78:
UnknownData_0x5AC78:
INCBIN "baserom.gb", $5AC78, $5AC7D - $5AC78

	ld a, [$FF00+$DF]
	rst $28

UnknownData_0x5AC80:
INCBIN "baserom.gb", $5AC80, $5AC88 - $5AC80

	ld a, 32
	ld [$FF00+$E2], a
	ld a, 1
	ld [$FF00+$DF], a
	ld a, [sEasyMode]
	and $01
	ret z
	ld a, 224
	ld [$FF00+$DB], a
	ret
	call UnknownCall_0x5B521
	ld a, [$FF00+$E7]
	bit 3, a
	ret z
	ld a, [sEasyMode]
	and $01
	jr nz, UnknownRJump_0x5ACAF
	ld a, 2
	ld [$FF00+$DF], a
	ret

UnknownRJump_0x5ACAF:
	ld a, 3
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$F0]
	and $07
	ret nz
	ld a, [$FF00+$DB]
	inc a
	ld [$FF00+$DB], a
	cp $CE
	jr z, UnknownRJump_0x5ACC9
	cp $D0
	ret nz
	call UnknownCall_0x5B2D7
	ret

UnknownRJump_0x5ACC9:
	ld a, 1
	ld [$A478], a
	ret
	ld a, [$FF00+$F0]
	and $07
	ret nz
	ld a, [$FF00+$DB]
	inc a
	ld [$FF00+$DB], a
	cp $E2
	jr z, UnknownRJump_0x5ACC9
	cp $E4
	ret nz
	call UnknownCall_0x5B2D7
	ret
	ld a, [$FF00+$DF]
	rst $28

UnknownData_0x5ACE7:
INCBIN "baserom.gb", $5ACE7, $5ACED - $5ACE7


UnknownRJump_0x5ACED:
	ld a, 32
	ld [$FF00+$EC], a
	ld a, 2
	ld [$FF00+$DF], a
	ld a, 16
	ld [$FF00+$DE], a
	ret
	call UnknownCall_0x5AD11
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

UnknownCall_0x5AD11:
	ld a, [$FF00+$EC]
	and $06
	ret z
	ld a, 1
	ld [$AF3E], a
	ret
	call UnknownCall_0x5B5AD
	ld b, 2
	call UnknownCall_0x3D22
	ld a, [$FF00+$DA]
	cp $B0
	ret c
	call UnknownCall_0x5B2BF
	ret
	ld a, [$FF00+$DF]
	rst $28

UnknownData_0x5AD30:
INCBIN "baserom.gb", $5AD30, $5AD36 - $5AD30

	ld a, 32
	ld [$FF00+$DD], a
	jr UnknownRJump_0x5ACED
	call UnknownCall_0x5B5AD
	ld b, 2
	call UnknownCall_0x3D32
	ld a, [$FF00+$DA]
	cp $B8
	ret c
	call UnknownCall_0x5B2BF
	ret
	ld a, [$FF00+$DF]
	rst $28

UnknownData_0x5AD50:
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
	call UnknownCall_0x5B5DF
	ld a, [sEasyMode]
	and $01
	jr z, UnknownRJump_0x5AD94
	ld a, [$FF00+$F0]
	and $01
	ret nz

UnknownRJump_0x5AD94:
	ld a, [$FF00+$E0]
	xor $01
	ld [$FF00+$E0], a
	inc a
	ld b, a
	call UnknownCall_0x3D32
	call UnknownCall_0x3CC0
	ld a, [$FF00+$E9]
	sub b
	ld [$FF00+$E9], a
	ret nz
	ld a, 3
	ld [$FF00+$DF], a
	ld a, 48
	ld [$FF00+$EC], a
	ret
	call UnknownCall_0x5B5DF
	ld a, [sEasyMode]
	and $01
	jr z, UnknownRJump_0x5ADC0
	ld a, [$FF00+$F0]
	and $01
	ret nz

UnknownRJump_0x5ADC0:
	ld a, [$FF00+$E0]
	xor $01
	ld [$FF00+$E0], a
	inc a
	ld b, a
	call UnknownCall_0x3D22
	call UnknownCall_0x3CF1
	ld a, [$FF00+$E9]
	sub b
	ld [$FF00+$E9], a
	ret nz
	ld a, 1
	ld [$FF00+$DF], a
	ld a, 48
	ld [$FF00+$EC], a
	ret
	call UnknownCall_0x5B57E
	ld a, [$FF00+$DF]
	rst $28

UnknownData_0x5ADE3:
INCBIN "baserom.gb", $5ADE3, $5ADED - $5ADE3

	ld a, 72
	ld [$FF00+$E2], a
	call UnknownCall_0x5B3C6
	ld a, 16
	ld [$FF00+$DE], a
	ret
	ld hl, $6E62
	call UnknownCall_0x5B33E
	ld a, b
	cp $80
	jr z, UnknownRJump_0x5AE09
	call UnknownCall_0x3D22
	jr UnknownRJump_0x5AE1B

UnknownJump_0x5AE09:
UnknownRJump_0x5AE09:
	ld a, 3
	jr UnknownRJump_0x5AE28
	ld hl, $6E62
	call UnknownCall_0x5B33E
	ld a, b
	cp $80
	jr z, UnknownRJump_0x5AE26
	call UnknownCall_0x3D32

UnknownRJump_0x5AE1B:
	ld hl, $6EAC

UnknownJump_0x5AE1E:
	call UnknownCall_0x5B33E
	call UnknownCall_0x3D2D
	jr UnknownRJump_0x5AE59

UnknownJump_0x5AE26:
UnknownRJump_0x5AE26:
	ld a, 4

UnknownRJump_0x5AE28:
	ld [$FF00+$DF], a
	xor a
	ld [$FF00+$E9], a
	ret
	ld hl, $6E87
	call UnknownCall_0x5B33E
	ld a, b
	cp $80
	jr z, UnknownRJump_0x5AE3E
	call UnknownCall_0x3D32
	jr UnknownRJump_0x5AE50

UnknownJump_0x5AE3E:
UnknownRJump_0x5AE3E:
	ld a, 2
	jr UnknownRJump_0x5AE28
	ld hl, $6E87
	call UnknownCall_0x5B33E
	ld a, b
	cp $80
	jr z, UnknownRJump_0x5AE5E
	call UnknownCall_0x3D22

UnknownRJump_0x5AE50:
	ld hl, $6ED0

UnknownJump_0x5AE53:
	call UnknownCall_0x5B33E
	call UnknownCall_0x3D3D

UnknownRJump_0x5AE59:
	ld hl, $FFE9
	inc [hl]
	ret

UnknownJump_0x5AE5E:
UnknownRJump_0x5AE5E:
	ld a, 1
	jr UnknownRJump_0x5AE28

UnknownData_0x5AE62:
INCBIN "baserom.gb", $5AE62, $5AEF4 - $5AE62

	call UnknownCall_0x5B57E
	ld a, [$FF00+$DF]
	rst $28

UnknownData_0x5AEFA:
INCBIN "baserom.gb", $5AEFA, $5AF04 - $5AEFA

	ld hl, $6F55
	call UnknownCall_0x5B33E
	ld a, b
	cp $80
	jp z, UnknownJump_0x5AE09
	call UnknownCall_0x3D22
	ld hl, $6F97
	jp UnknownJump_0x5AE1E
	ld hl, $6F55
	call UnknownCall_0x5B33E
	ld a, b
	cp $80
	jp z, UnknownJump_0x5AE26
	call UnknownCall_0x3D32
	ld hl, $6F97
	jp UnknownJump_0x5AE1E
	ld hl, $6F76
	call UnknownCall_0x5B33E
	ld a, b
	cp $80
	jp z, UnknownJump_0x5AE3E
	call UnknownCall_0x3D32
	jp UnknownJump_0x5AF4F
	ld hl, $6F76
	call UnknownCall_0x5B33E
	ld a, b
	cp $80
	jp z, UnknownJump_0x5AE5E
	call UnknownCall_0x3D22

UnknownJump_0x5AF4F:
	ld hl, $6FB7
	jp UnknownJump_0x5AE53

UnknownData_0x5AF55:
INCBIN "baserom.gb", $5AF55, $5AFD7 - $5AF55

	ld a, [$FF00+$DF]
	rst $28

UnknownData_0x5AFDA:
INCBIN "baserom.gb", $5AFDA, $5AFE4 - $5AFDA

	ld a, 77
	ld [$FF00+$E2], a
	call UnknownCall_0x5B3C6
	ld a, 1
	ld [$FF00+$E8], a
	ld a, 2
	ld [$FF00+$E9], a
	ret
	ld b, 1
	call UnknownCall_0x3D22
	jr UnknownRJump_0x5B000
	ld b, 1
	call UnknownCall_0x3D32

UnknownRJump_0x5B000:
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_0x5B012
	call UnknownCall_0x5B481
	call UnknownCall_0x3D3D
	jr UnknownRJump_0x5B018

UnknownRJump_0x5B012:
	call UnknownCall_0x5B449
	call UnknownCall_0x3D2D

UnknownRJump_0x5B018:
	ld a, [$FF00+$E0]
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$E8]
	xor $01
	ld [$FF00+$E8], a
	jp z, UnknownJump_0x59D2D
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
	cp $70
	ret nz
	ld a, 108
	ld [$FF00+$DB], a
	ld a, 112
	ld [$AF37], a
	ld a, 89
	ld [$AF36], a
	call UnknownCall_0x5B36D
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

UnknownData_0x5B070:
INCBIN "baserom.gb", $5B070, $5B078 - $5B070

	ld b, 16
	call UnknownCall_0x3D2D
	ld a, 72
	ld [$FF00+$E2], a
	call UnknownCall_0x5B3C6
	ret
	ld b, 1
	call UnknownCall_0x3D22
	jr UnknownRJump_0x5B091

UnknownData_0x5B08C:
INCBIN "baserom.gb", $5B08C, $5B091 - $5B08C


UnknownRJump_0x5B091:
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_0x5B0A8
	call UnknownCall_0x5B46C
	call UnknownCall_0x3D2D
	ld a, [$FF00+$E0]
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, 1
	ld [$FF00+$E8], a
	ret

UnknownRJump_0x5B0A8:
	call UnknownCall_0x3B40
	ld a, [$AF2F]
	bit 3, a
	jr nz, UnknownRJump_0x5B0B9
	call UnknownCall_0x5B451
	call UnknownCall_0x3D3D
	ret

UnknownRJump_0x5B0B9:
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
	call UnknownCall_0x5B2D7
	ret
	call UnknownCall_0x5B521
	ld a, [$FF00+$DF]
	rst $28

UnknownData_0x5B0DB:
INCBIN "baserom.gb", $5B0DB, $5B0E5 - $5B0DB

	ld a, 77
	ld [$FF00+$E2], a
	ld a, 24
	ld [$FF00+$E9], a
	add a
	ld [$FF00+$E8], a
	call UnknownCall_0x5B3C6
	ld a, [$FF00+$DF]
	ld [$FF00+$E0], a
	ret
	ld b, 1
	call UnknownCall_0x3D22
	ld a, [$FF00+$E9]
	sub b
	ld [$FF00+$E9], a
	ret nz
	ld a, [$FF00+$E8]
	ld [$FF00+$E9], a
	ld a, [$FF00+$E0]
	dec a
	jr z, UnknownRJump_0x5B115

UnknownRJump_0x5B10C:
	ld a, 4
	ld [$FF00+$DF], a
	ld a, 118
	ld [$FF00+$DB], a
	ret

UnknownRJump_0x5B115:
	ld a, 3
	ld [$FF00+$DF], a
	ld a, 120
	ld [$FF00+$DB], a
	ret
	ld b, 1
	call UnknownCall_0x3D32
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
	jr z, UnknownRJump_0x5B10C
	jr UnknownRJump_0x5B115
	ld b, 1
	call UnknownCall_0x3D3D
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
	jr z, UnknownRJump_0x5B154

UnknownRJump_0x5B14F:
	ld a, 1
	ld [$FF00+$DF], a
	ret

UnknownRJump_0x5B154:
	ld a, 32
	ld [$FF00+$DD], a
	ld a, 2
	ld [$FF00+$DF], a
	ret
	ld b, 1
	call UnknownCall_0x3D2D
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
	jr z, UnknownRJump_0x5B14F
	jr UnknownRJump_0x5B154
	call UnknownCall_0x5B51A
	ld a, [$FF00+$DF]
	rst $28

UnknownData_0x5B17D:
INCBIN "baserom.gb", $5B17D, $5B183 - $5B17D

	ld a, 77
	ld [$FF00+$E2], a
	ld a, 16
	ld [$FF00+$DE], a
	call UnknownCall_0x5B3C6
	ret
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld b, 2
	call UnknownCall_0x3D22
	jr UnknownRJump_0x5B1A5
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld b, 2
	call UnknownCall_0x3D32

UnknownRJump_0x5B1A5:
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_0x5B1B3
	call UnknownCall_0x5B47A
	inc b
	call UnknownCall_0x3D2D
	jr UnknownRJump_0x5B1BA

UnknownRJump_0x5B1B3:
	call UnknownCall_0x5B451
	inc b
	call UnknownCall_0x3D3D

UnknownRJump_0x5B1BA:
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

UnknownData_0x5B1CB:
INCBIN "baserom.gb", $5B1CB, $5B1D3 - $5B1CB


UnknownRJump_0x5B1D3:
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
	jr nz, UnknownRJump_0x5B1F0
	call UnknownCall_0x3D2D
	jr UnknownRJump_0x5B1F3

UnknownRJump_0x5B1F0:
	call UnknownCall_0x3D3D

UnknownRJump_0x5B1F3:
	ld a, [$FF00+$E8]
	sub b
	ld [$FF00+$E8], a
	ret nz
	ld a, [$FF00+$EA]
	dec a
	ld [$FF00+$EA], a
	jr z, UnknownRJump_0x5B20B
	ld a, [$FF00+$E9]
	ld [$FF00+$E8], a
	ld a, [$FF00+$E0]
	xor $01
	ld [$FF00+$E0], a
	ret

UnknownRJump_0x5B20B:
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
	cp $7C
	ret nz
	ld a, 32
	ld [$FF00+$EC], a
	ld a, 3
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$EC]
	and a
	jr z, UnknownRJump_0x5B232
	dec a
	ld [$FF00+$EC], a
	ret

UnknownRJump_0x5B232:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld a, [$FF00+$DB]
	dec a
	ld [$FF00+$DB], a
	cp $7A
	ret nz
	jr UnknownRJump_0x5B1D3
	ld a, [$FF00+$DF]
	rst $28

UnknownData_0x5B244:
INCBIN "baserom.gb", $5B244, $5B24A - $5B244

	ld a, 72
	ld [$FF00+$E2], a
	ld a, 1
	ld [$FF00+$DF], a
	ret
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_0x5B260
	call UnknownCall_0x5B473
	call UnknownCall_0x3D2D
	jr UnknownRJump_0x5B266

UnknownRJump_0x5B260:
	call UnknownCall_0x5B44D
	call UnknownCall_0x3D2D

UnknownRJump_0x5B266:
	ld a, [$FF00+$E0]
	cp c
	ret nz
	xor a
	ld [$FF00+$E0], a
	ld a, [$FF00+$E8]
	xor $01
	ld [$FF00+$E8], a
	ret z
	jp UnknownJump_0x59D33
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_0x5B284
	call UnknownCall_0x5B473
	call UnknownCall_0x3D3D
	jr UnknownRJump_0x5B266

UnknownRJump_0x5B284:
	call UnknownCall_0x5B44D
	call UnknownCall_0x3D3D
	jr UnknownRJump_0x5B266
	ld a, [$FF00+$DF]
	rst $28

UnknownData_0x5B28F:
INCBIN "baserom.gb", $5B28F, $5B295 - $5B28F

	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_0x5B2A2
	call UnknownCall_0x5B473
	call UnknownCall_0x3D22
	jr UnknownRJump_0x5B266

UnknownRJump_0x5B2A2:
	call UnknownCall_0x5B44D
	call UnknownCall_0x3D22
	jr UnknownRJump_0x5B266
	ld a, [$FF00+$E8]
	and a
	jr nz, UnknownRJump_0x5B2B7
	call UnknownCall_0x5B473
	call UnknownCall_0x3D32
	jr UnknownRJump_0x5B266

UnknownRJump_0x5B2B7:
	call UnknownCall_0x5B44D
	call UnknownCall_0x3D32
	jr UnknownRJump_0x5B266

UnknownCall_0x5B2BF:
	ld a, [$FF00+$D6]
	ld h, a
	ld a, [$FF00+$D7]
	ld l, a
	dec hl
	dec hl
	ld de, $FFD0
	ld b, 5
	call UnknownCall_0x3CAA
	call UnknownCall_0x3AA0
	ld a, 1
	ld [$FF00+$D8], a
	ret

UnknownJump_0x5B2D7:
UnknownCall_0x5B2D7:
	ld a, [$AF26]
	and a
	jr nz, UnknownRJump_0x5B2F0
	ld hl, $FFD6
	ld a, [hli]
	cp $AD
	jr nc, UnknownRJump_0x5B2F0
	ld d, a
	ld a, [hli]
	ld e, a
	ld a, [$FF00+$D2]
	cp $10
	jr z, UnknownRJump_0x5B2EF
	xor a

UnknownRJump_0x5B2EF:
	ld [de], a

UnknownRJump_0x5B2F0:
	ld a, [$FF00+$D8]
	dec a
	jr z, UnknownRJump_0x5B305
	ld hl, $AF41
	dec [hl]
	ld a, [$AF26]
	cp $01
	jr nz, UnknownRJump_0x5B309
	call UnknownCall_0x5B31D
	jr UnknownRJump_0x5B309

UnknownRJump_0x5B305:
	ld hl, $AF40
	dec [hl]

UnknownRJump_0x5B309:
	xor a
	ld hl, $FFD0
	ld b, 32

UnknownRJump_0x5B30F:
	ld [hli], a
	dec b
	jr nz, UnknownRJump_0x5B30F
	ld a, 2
	ld [$AF3E], a
	xor a
	ld [$AF26], a
	ret

UnknownCall_0x5B31D:
	ld a, [$A28D]
	add 1
	daa
	ld [$A28D], a
	ret nz
	ld a, 28
	ld [$AF37], a
	ld a, 26
	ld [$AF36], a
	call UnknownCall_0x5B346
	ld a, 8
	ld [$A460], a
	ret

UnknownCall_0x5B33A:
	ld a, [$FF00+$E8]
	jr UnknownRJump_0x5B340

UnknownCall_0x5B33E:
	ld a, [$FF00+$E9]

UnknownRJump_0x5B340:
	ld e, a
	ld d, 0
	add de
	ld b, [hl]
	ret

UnknownCall_0x5B346:
	ld hl, $ACE8
	ld de, $0020

UnknownRJump_0x5B34C:
	add de
	ld a, [hl]
	and a
	jr nz, UnknownRJump_0x5B34C
	ld a, h
	cp $AF
	jr z, UnknownRJump_0x5B3AE
	ld a, l
	and $F0
	ld l, a
	ldh_a_n $CB
	ld [hli], a
	ldh_a_n $CA
	ld [hli], a
	inc l
	ldh_a_n $C9
	ld [hli], a
	ldh_a_n $C8
	ld [hli], a
	jr UnknownRJump_0x5B38C

UnknownCall_0x5B36D:
	ld hl, $ACE8
	ld de, $0020

UnknownRJump_0x5B373:
	add de
	ld a, [hl]
	and a
	jr nz, UnknownRJump_0x5B373
	ld a, h
	cp $AF
	jr z, UnknownRJump_0x5B3AE
	ld d, h
	ld a, l
	and $F0
	ld e, a
	ld hl, $FFD0
	ld b, 5
	call UnknownCall_0x3CAA
	ld h, d
	ld l, e

UnknownRJump_0x5B38C:
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

UnknownRJump_0x5B3AE:
	xor a
	ld [$AF36], a
	ld [$AF37], a
	ld [$AF38], a
	ret

UnknownData_0x5B3B9:
INCBIN "baserom.gb", $5B3B9, $5B3C6 - $5B3B9


UnknownCall_0x5B3C6:
	call UnknownCall_0x5B3E0
	ld a, [$AF2C]
	dec a
	jr z, UnknownRJump_0x5B3D7
	ld a, 1
	ld [$FF00+$DF], a
	xor a
	ld [$FF00+$DD], a
	ret

UnknownRJump_0x5B3D7:
	ld a, 2
	ld [$FF00+$DF], a
	ld a, 32
	ld [$FF00+$DD], a
	ret

UnknownCall_0x5B3E0:
	xor a
	ld [$AF2C], a
	ld hl, $FFD0
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld a, [$AF31]
	cp b
	jr c, UnknownRJump_0x5B3F8
	jr z, UnknownRJump_0x5B3FE

UnknownRJump_0x5B3F2:
	ld a, 1
	ld [$AF2C], a
	ret

UnknownRJump_0x5B3F8:
	ld a, 255
	ld [$AF2C], a
	ret

UnknownRJump_0x5B3FE:
	ld a, [$AF30]
	cp c
	ret z
	jr c, UnknownRJump_0x5B3F8
	jr UnknownRJump_0x5B3F2

UnknownCall_0x5B407:
	call UnknownCall_0x5B41A
	ld a, [$AF2C]
	dec a
	jr z, UnknownRJump_0x5B415
	ld a, 1
	ld [$FF00+$DF], a
	ret

UnknownRJump_0x5B415:
	ld a, 2
	ld [$FF00+$DF], a
	ret

UnknownCall_0x5B41A:
	xor a
	ld [$AF2C], a
	ld hl, $FFD3
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld a, [$AF33]
	cp b
	jr c, UnknownRJump_0x5B432
	jr z, UnknownRJump_0x5B438

UnknownRJump_0x5B42C:
	ld a, 1
	ld [$AF2C], a
	ret

UnknownRJump_0x5B432:
	ld a, 255
	ld [$AF2C], a
	ret

UnknownRJump_0x5B438:
	ld a, [$AF32]
	cp c
	ret z
	jr c, UnknownRJump_0x5B432
	jr UnknownRJump_0x5B42C

UnknownCall_0x5B441:
	ld c, 8
	jr UnknownRJump_0x5B453

UnknownCall_0x5B445:
	ld c, 12
	jr UnknownRJump_0x5B453

UnknownCall_0x5B449:
	ld c, 15
	jr UnknownRJump_0x5B453

UnknownCall_0x5B44D:
	ld c, 18
	jr UnknownRJump_0x5B453

UnknownCall_0x5B451:
	ld c, 21

UnknownRJump_0x5B453:
	ld hl, $7488

UnknownRJump_0x5B456:
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

UnknownCall_0x5B465:
	ld c, 8
	ld hl, $74AB
	jr UnknownRJump_0x5B456

UnknownCall_0x5B46C:
	ld c, 12
	ld hl, $74A7
	jr UnknownRJump_0x5B456

UnknownCall_0x5B473:
	ld c, 18
	ld hl, $74A1
	jr UnknownRJump_0x5B456

UnknownCall_0x5B47A:
	ld c, 21
	ld hl, $749E
	jr UnknownRJump_0x5B456

UnknownCall_0x5B481:
	ld c, 15
	ld hl, $74A4
	jr UnknownRJump_0x5B456

UnknownData_0x5B488:
INCBIN "baserom.gb", $5B488, $5B4B4 - $5B488


UnknownCall_0x5B4B4:
	ld hl, $FFD1
	ld a, [$AF30]
	sub [hl]
	bit 7, a
	ret z
	cpl
	inc a
	ret

UnknownCall_0x5B4C1:
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
	call UnknownCall_0x3D32
	ld a, [sCurPowerup]
	and a
	jr z, UnknownRJump_0x5B4E5
	ld a, [$A291]
	and a
	jr nz, UnknownRJump_0x5B4EF
	ld b, 5
	jr UnknownRJump_0x5B4F1

UnknownRJump_0x5B4E5:
	ld a, [$A291]
	and a
	jr z, UnknownRJump_0x5B4EF
	ld b, 20
	jr UnknownRJump_0x5B4F1

UnknownRJump_0x5B4EF:
	ld b, 14

UnknownRJump_0x5B4F1:
	call UnknownCall_0x3D3D
	ret

UnknownCall_0x5B4F5:
	ld a, [$FF00+$D6]
	ld h, a
	ld a, [$FF00+$D7]
	ld l, a
	ld de, $FFD0
	ld b, 5
	call UnknownCall_0x3CAA
	inc l
	inc l
	inc l
	ld a, [hl]
	sub 2
	jr z, UnknownRJump_0x5B50D
	ld a, 1

UnknownRJump_0x5B50D:
	ld [$AF07], a
	ret

UnknownCall_0x5B511:
	ld a, [$FF00+$F0]
	and $07
	ret nz
	jr UnknownRJump_0x5B526

UnknownCall_0x5B518:
	jr UnknownRJump_0x5B526

UnknownCall_0x5B51A:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	jr UnknownRJump_0x5B526

UnknownCall_0x5B521:
	ld a, [$FF00+$F0]
	and $01
	ret nz

UnknownRJump_0x5B526:
	ld a, [$FF00+$DB]
	xor $01
	ld [$FF00+$DB], a
	ret

UnknownData_0x5B52D:
INCBIN "baserom.gb", $5B52D, $5B539 - $5B52D


UnknownCall_0x5B539:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld a, [$FF00+$DB]
	xor $1B
	ld [$FF00+$DB], a
	ret

UnknownCall_0x5B545:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	jr UnknownRJump_0x5B551

UnknownCall_0x5B54C:
	ld a, [$FF00+$F0]
	and $01
	ret nz

UnknownRJump_0x5B551:
	ld hl, $FFEA
	inc [hl]
	ld a, [hl]
	cp $04
	jr nz, UnknownRJump_0x5B562
	xor a
	ld [hl], a
	ld a, [$FF00+$DD]
	res 5, a
	ld [$FF00+$DD], a

UnknownRJump_0x5B562:
	ld hl, $757A
	ld e, a
	ld d, 0
	add de
	ld a, [$FF00+$DB]
	add [hl]
	ld [$FF00+$DB], a
	ld a, [$FF00+$EA]
	cp $03
	ret nz
	ld a, [$FF00+$DD]
	set 5, a
	ld [$FF00+$DD], a
	ret

UnknownData_0x5B57A:
INCBIN "baserom.gb", $5B57A, $5B57E - $5B57A


UnknownCall_0x5B57E:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	jr UnknownRJump_0x5B58A

UnknownCall_0x5B585:
	ld a, [$FF00+$F0]
	and $01
	ret nz

UnknownRJump_0x5B58A:
	ld hl, $FFEA
	inc [hl]
	ld a, [hl]
	cp $04
	jr nz, UnknownRJump_0x5B595
	xor a
	ld [hl], a

UnknownRJump_0x5B595:
	ld hl, $75A2
	ld e, a
	ld d, 0
	add de
	ld a, [$FF00+$DB]
	add [hl]
	ld [$FF00+$DB], a
	ret

UnknownData_0x5B5A2:
INCBIN "baserom.gb", $5B5A2, $5B5A6 - $5B5A2


UnknownCall_0x5B5A6:
	ld a, [$FF00+$F0]
	and $07
	ret nz
	jr UnknownRJump_0x5B5BB

UnknownCall_0x5B5AD:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	jr UnknownRJump_0x5B5BB

UnknownCall_0x5B5B4:
	jr UnknownRJump_0x5B5BB

UnknownCall_0x5B5B6:
	ld a, [$FF00+$F0]
	and $01
	ret nz

UnknownRJump_0x5B5BB:
	ld hl, $FFEA
	inc [hl]
	ld a, [hl]
	cp $03
	jr nz, UnknownRJump_0x5B5C6
	xor a
	ld [hl], a

UnknownRJump_0x5B5C6:
	ld hl, $75D3
	ld e, a
	ld d, 0
	add de
	ld a, [$FF00+$DB]
	add [hl]
	ld [$FF00+$DB], a
	ret

UnknownData_0x5B5D3:
INCBIN "baserom.gb", $5B5D3, $5B5D8 - $5B5D3


UnknownCall_0x5B5D8:
	ld a, [$FF00+$F0]
	and $07
	ret nz
	jr UnknownRJump_0x5B5EB

UnknownCall_0x5B5DF:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	jr UnknownRJump_0x5B5EB

UnknownCall_0x5B5E6:
	ld a, [$FF00+$F0]
	and $01
	ret nz

UnknownRJump_0x5B5EB:
	ld hl, $FFEA
	inc [hl]
	ld a, [hl]
	cp $04
	jr nz, UnknownRJump_0x5B5F6
	xor a
	ld [hl], a

UnknownRJump_0x5B5F6:
	ld hl, $7603
	ld e, a
	ld d, 0
	add de
	ld a, [$FF00+$DB]
	add [hl]
	ld [$FF00+$DB], a
	ret

UnknownData_0x5B603:
INCBIN "baserom.gb", $5B603, $5B607 - $5B603


UnknownCall_0x5B607:
	ld a, [$FF00+$F0]
	and $03
	ret nz
	ld hl, $FFEA
	inc [hl]
	ld a, [hl]
	cp $04
	jr nz, UnknownRJump_0x5B61D
	xor a
	ld [hl], a
	ld a, [$FF00+$DD]
	res 5, a
	ld [$FF00+$DD], a

UnknownRJump_0x5B61D:
	ld hl, $7635
	ld e, a
	ld d, 0
	add de
	ld a, [$FF00+$DB]
	add [hl]
	ld [$FF00+$DB], a
	ld a, [$FF00+$EA]
	cp $03
	ret nz
	ld a, [$FF00+$DD]
	set 5, a
	ld [$FF00+$DD], a
	ret

UnknownData_0x5B635:
INCBIN "baserom.gb", $5B635, $5B639 - $5B635


UnknownCall_0x5B639:
	ld hl, $FFEA
	inc [hl]
	ld a, [hl]
	cp $08
	jr nz, UnknownRJump_0x5B644
	xor a
	ld [hl], a

UnknownRJump_0x5B644:
	ld hl, $7669
	ld e, a
	ld d, 0
	add de
	ld a, [$FF00+$DB]
	add [hl]
	ld [$FF00+$DB], a
	ld a, [$FF00+$EA]
	cp $03
	jr z, UnknownRJump_0x5B65B
	cp $06
	jr z, UnknownRJump_0x5B662
	ret

UnknownRJump_0x5B65B:
	ld a, [$FF00+$DD]
	set 6, a
	ld [$FF00+$DD], a
	ret

UnknownRJump_0x5B662:
	ld a, [$FF00+$DD]
	res 6, a
	ld [$FF00+$DD], a
	ret

UnknownData_0x5B669:
INCBIN "baserom.gb", $5B669, $5B678 - $5B669


UnknownCall_0x5B678:
	ld a, [$FF00+$F0]
	and $07
	ret nz
	ld a, [$FF00+$DD]
	xor $20
	ld [$FF00+$DD], a
	ret

UnknownData_0x5B684:
INCBIN "baserom.gb", $5B684, $5B68B - $5B684


UnknownCall_0x5B68B:
	ld a, [$FF00+$F0]
	and $01
	ret nz
	ld a, [$FF00+$DE]
	xor $10
	ld [$FF00+$DE], a
	ret

UnknownCall_0x5B697:
	ld hl, $AD12

UnknownRJump_0x5B69A:
	ld a, [hl]
	and a
	call nz, UnknownCall_0x5B6A9
	ld de, $0020
	add de
	ld a, h
	cp $AF
	jr nz, UnknownRJump_0x5B69A
	ret

UnknownCall_0x5B6A9:
	ld a, [hl]
	cp $5F
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
	jr nc, UnknownRJump_0x5B708
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
	jr nc, UnknownRJump_0x5B708
	ld a, l
	add 13
	ld l, a
	set 1, [hl]
	ld a, 1
	ld [$AF2E], a

UnknownRJump_0x5B708:
	pop hl
	ret

UnknownData_0x5B70A:
INCBIN "baserom.gb", $5B70A, $5C000 - $5B70A



SECTION "bank17", ROMX, BANK[$17]


UnknownData_0x5C000:
INCBIN "baserom.gb", $5C000, $5C2F0 - $5C000
;$5C2F0 Pointers to levels 
	dw Level_11
	dw Level_12
	dw Level_13
	dw Level_14
	
INCBIN "baserom.gb", $5C2F8, $5C500 - $5C2F8

Level_11: ;$5C500
INCBIN "levels/level11.bin"

Level_12: ;$5CE21
INCBIN "levels/level12.bin"

Level_13: ;$5D980
INCBIN "levels/level13.bin"

Level_14: ;$5E4F4
INCBIN "levels/level14.bin"

INCBIN "baserom.gb", $5F81A, $60000 - $5F81A



SECTION "bank18", ROMX, BANK[$18]


UnknownData_0x60000:
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

UnknownData_0x60037:
INCBIN "baserom.gb", $60037, $6004F - $60037

	call UnknownCall_0x6046A
	ld a, [$A69A]
	and $01
	jp z, UnknownJump_0x60461
	ldh_a_n $C5
	cp $28
	jr nz, UnknownRJump_0x6006E
	ld a, 1
	ld [$A7A6], a
	call UnknownCall_0x60C41
	ldh_n_a $C6
	jr UnknownRJump_0x60097

UnknownRJump_0x6006E:
	inc a
	ldh_n_a $C5
	ld a, [$A69A]
	and $02
	jr z, UnknownRJump_0x60088
	ld a, [$A795]
	inc a
	ld [$A795], a
	cp $03
	jr c, UnknownRJump_0x60088
	xor a
	ld [$A795], a

UnknownRJump_0x60088:
	call UnknownCall_0x60C41
	ld e, a
	ld a, [$A795]
	add e
	inc a
	ldh_n_a $C6
	jp UnknownJump_0x60461

UnknownRJump_0x60097:
	call UnknownCall_0x6046A
	ldh_a_n $80
	bit 0, a
	jr nz, UnknownRJump_0x600AC
	bit 5, a
	jr nz, UnknownRJump_0x600B9
	bit 4, a
	jr nz, UnknownRJump_0x600C6
	jp UnknownJump_0x60461

UnknownRJump_0x600AC:
	ld a, 4
	ld [$A7A6], a
	ld a, 16
	ld [$A7A7], a
	jp UnknownJump_0x60182

UnknownRJump_0x600B9:
	ld a, 2
	ld [$A7A6], a
	ld a, 32
	ld [$A7A7], a
	jp UnknownJump_0x600D3

UnknownRJump_0x600C6:
	ld a, 3
	ld [$A7A6], a
	ld a, 32
	ld [$A7A7], a
	jp UnknownJump_0x6012B

UnknownJump_0x600D3:
	call UnknownCall_0x6046A
	ld a, [$A69A]
	and $03
	jp z, UnknownJump_0x60461
	ldh_a_n $C5
	cp $28
	jp z, UnknownJump_0x6011D
	ld a, [$A7A7]
	or a
	jr z, UnknownRJump_0x6011D
	dec a
	ld [$A7A7], a
	ldh_a_n $C5
	dec a
	ldh_n_a $C5
	ld a, [$A69A]
	and $02
	jr z, UnknownRJump_0x6010D
	ld a, [$A795]
	inc a
	ld [$A795], a
	cp $03
	jr c, UnknownRJump_0x6010D
	xor a
	ld [$A795], a

UnknownRJump_0x6010D:
	call UnknownCall_0x60C41
	ld e, a
	ld a, [$A795]
	add e
	add 5
	ldh_n_a $C6
	jp UnknownJump_0x60461

UnknownJump_0x6011D:
UnknownRJump_0x6011D:
	ld a, 1
	ld [$A7A6], a
	call UnknownCall_0x60C41
	ldh_n_a $C6
	jp UnknownJump_0x60461

UnknownJump_0x6012B:
	call UnknownCall_0x6046A
	ld a, [$A69A]
	and $03
	jp z, UnknownJump_0x60461
	ldh_a_n $C5
	cp $88
	jp z, UnknownJump_0x60174
	ld a, [$A7A7]
	or a
	jr z, UnknownRJump_0x60174
	dec a
	ld [$A7A7], a
	ldh_a_n $C5
	inc a
	ldh_n_a $C5
	ld a, [$A69A]
	and $02
	jr z, UnknownRJump_0x60165
	ld a, [$A795]
	inc a
	ld [$A795], a
	cp $03
	jr c, UnknownRJump_0x60165
	xor a
	ld [$A795], a

UnknownRJump_0x60165:
	call UnknownCall_0x60C41
	ld e, a
	ld a, [$A795]
	add e
	inc a
	ldh_n_a $C6
	jp UnknownJump_0x60461

UnknownJump_0x60174:
UnknownRJump_0x60174:
	ld a, 1
	ld [$A7A6], a
	call UnknownCall_0x60C41
	ldh_n_a $C6
	jp UnknownJump_0x60461

UnknownJump_0x60182:
	call UnknownCall_0x60269
	ld a, [$A69A]
	and $03
	jp z, UnknownJump_0x60461
	ld a, [$A7A7]
	or a
	jr z, UnknownRJump_0x601D9
	dec a
	ld [$A7A7], a
	ld b, 0
	ld c, a
	ld hl, $421A
	add bc
	ld a, [hl]
	ld c, a
	ldh_a_n $C4
	add c
	ldh_n_a $C4
	call UnknownCall_0x60C41
	add 8
	ldh_n_a $C6
	ld a, [$A7A7]
	cp $08
	call z, UnknownCall_0x601BA
	jp UnknownJump_0x60461

UnknownCall_0x601BA:
	ld hl, $A7ED
	ld d, 0
	ldh_a_n $C5
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
	call UnknownCall_0x610DD
	ld a, 8
	ld [$A468], a
	ret

UnknownRJump_0x601D9:
	ld a, 5
	ld [$A7A6], a
	call UnknownCall_0x60C41
	ldh_n_a $C6
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
	call UnknownCall_0x610DD
	ldh_a_n $C5
	sub 4
	ld [$A6DF], a
	ld a, 42
	ld [$A6E1], a
	ld a, 3
	ld [$A7B3], a
	jp UnknownJump_0x6022A

UnknownData_0x6021A:
INCBIN "baserom.gb", $6021A, $6022A - $6021A


UnknownJump_0x6022A:
	ld a, [$A69A]
	and $01
	jp z, UnknownJump_0x60461
	ld a, 4
	ld [$A478], a
	ld a, [$A69A]
	and $02
	jr z, UnknownRJump_0x6024B
	ld a, [$A6E1]
	inc a
	cp $2D
	jr c, UnknownRJump_0x60248
	ld a, 42

UnknownRJump_0x60248:
	ld [$A6E1], a

UnknownRJump_0x6024B:
	ld a, [$A7B3]
	cp $03
	call z, UnknownCall_0x60290
	ld a, [$A7B3]
	cp $01
	call z, UnknownCall_0x60314
	ld a, [$A7B3]
	cp $02
	call z, UnknownCall_0x6032A
	call UnknownCall_0x60269
	jp UnknownJump_0x60461

UnknownCall_0x60269:
	ld b, 37
	ld a, [$A69A]
	bit 3, a
	jp z, UnknownJump_0x60275
	ld b, 38

UnknownJump_0x60275:
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

UnknownCall_0x60290:
	ld a, [$A6E0]
	dec a
	ld [$A6E0], a
	and $07
	jr nz, UnknownRJump_0x602E9
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

UnknownRJump_0x602C0:
	bit 1, [hl]
	jr nz, UnknownRJump_0x602C0
	pop hl
	ld a, [hli]
	ld b, a
	ld a, [hl]
	cp $3D
	jr z, UnknownRJump_0x602D3
	ld a, b
	cp $3C
	jr z, UnknownRJump_0x602DE
	jr UnknownRJump_0x602E9

UnknownRJump_0x602D3:
	ld a, 1
	ld [$A7B3], a
	ld a, 32
	ld [$A7B4], a
	ret

UnknownRJump_0x602DE:
	ld a, 2
	ld [$A7B3], a
	ld a, 32
	ld [$A7B4], a
	ret

UnknownRJump_0x602E9:
	ld a, [$A6E0]
	cp $2A
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

UnknownCall_0x60314:
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

UnknownCall_0x6032A:
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
	call UnknownCall_0x60269
	ld a, [$A6E4]
	cp $FF
	jr z, UnknownRJump_0x60373
	ld a, [$A69A]
	and $0F
	jp nz, UnknownJump_0x60461
	ld a, [$A6E4]
	cp $27
	call z, UnknownCall_0x603F9
	ld a, [$A6E4]
	cp $29
	call z, UnknownCall_0x6042D
	ld a, [$A6E4]
	cp $FF
	jr z, UnknownRJump_0x60373
	ld a, [$A6E4]
	inc a
	ld [$A6E4], a
	jp UnknownJump_0x60461

UnknownRJump_0x60373:
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
	cp $70
	jr c, UnknownRJump_0x603AA
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
	call UnknownCall_0x60917
	ld a, 20
	ld [$A7A7], a
	ld a, 116
	ld [$A6E3], a
	jp UnknownJump_0x60433

UnknownRJump_0x603AA:
	call UnknownCall_0x60C41
	ldh_n_a $C6
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
	ldh_a_n $C5
	cp b
	jp z, UnknownJump_0x60461
	jr c, UnknownRJump_0x603CE
	dec a
	ld c, 5
	jr UnknownRJump_0x603D1

UnknownRJump_0x603CE:
	inc a
	ld c, 1

UnknownRJump_0x603D1:
	ldh_n_a $C5
	ld a, [$A69A]
	and $03
	jr nz, UnknownRJump_0x603EA
	ld a, [$A795]
	inc a
	ld [$A795], a
	cp $03
	jr c, UnknownRJump_0x603EA
	xor a
	ld [$A795], a

UnknownRJump_0x603EA:
	call UnknownCall_0x60C41
	ld e, a
	ld a, [$A795]
	add e
	add c
	ldh_n_a $C6
	jp UnknownJump_0x60461

UnknownCall_0x603F9:
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

UnknownRJump_0x6040D:
	bit 1, [hl]
	jr nz, UnknownRJump_0x6040D
	pop hl
	ld a, 255
	ld [hli], a
	ld [hl], a
	ld de, $001F
	add de
	push hl
	ld hl, $FF41

UnknownRJump_0x6041E:
	bit 1, [hl]
	jr nz, UnknownRJump_0x6041E
	pop hl
	ld a, 255
	ld [hli], a
	ld [hl], a
	ld a, 22
	ld [$A468], a
	ret

UnknownCall_0x6042D:
	ld a, 255
	ld [$A6E4], a
	ret

UnknownJump_0x60433:
	ld a, [$A69A]
	and $03
	jp nz, UnknownJump_0x60461
	call UnknownCall_0x606AA
	jp UnknownJump_0x60461

UnknownData_0x60441:
INCBIN "baserom.gb", $60441, $60444 - $60441

	ld a, [$A69A]
	and $01
	jp z, UnknownJump_0x60461
	ld a, [$A7A7]
	dec a
	ld [$A7A7], a
	or a
	jr nz, UnknownRJump_0x60461
	ld a, 10
	ld [$A7A6], a
	jp UnknownJump_0x60461

UnknownData_0x6045E:
INCBIN "baserom.gb", $6045E, $60461 - $6045E


UnknownJump_0x60461:
UnknownRJump_0x60461:
	call UnknownCall_0x6106D
	call UnknownCall_0x3F44
	jp UnknownJump_0x3E07

UnknownCall_0x6046A:
	ld a, [$A69A]
	and $07
	jp nz, UnknownJump_0x604F3
	ld a, [$A7B0]
	ld c, a
	ld b, 0
	ld hl, $A6C6
	add bc
	add bc
	add bc
	ld a, 255
	ld [hl], a

UnknownRJump_0x60481:
	push bc
	ld a, [$FF00+$04]
	ld b, a
	swap a
	add b
	ld b, a
	ld a, [$A7B7]
	add b
	ld b, a
	ldh_a_n $97
	add b
	ld [$A7B7], a
	pop bc
	and $0F
	cp $09
	jr nc, UnknownRJump_0x60481
	ld c, a
	ld a, [$A7B1]
	cp c
	jr z, UnknownRJump_0x60481
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

UnknownRJump_0x604C1:
	push bc
	ld a, [$FF00+$04]
	ld b, a
	swap a
	add b
	ld b, a
	ld a, [$A7B7]
	add b
	ld b, a
	ldh_a_n $97
	add b
	ld [$A7B7], a
	pop bc
	and $0F
	cp $09
	jr nc, UnknownRJump_0x604C1
	ld c, a
	ld a, [$A7B0]
	cp c
	jr z, UnknownRJump_0x604C1
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

UnknownJump_0x604F3:
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

UnknownData_0x60521:
INCBIN "baserom.gb", $60521, $60539 - $60521

	ld a, [$A69A]
	and $01
	jp z, UnknownJump_0x607AA
	ldh_a_n $C5
	cp $20
	jr nz, UnknownRJump_0x60559
	ld a, 1
	ld [$A7A6], a
	call UnknownCall_0x60C41
	ldh_n_a $C6
	xor a
	ld [$A7B2], a
	jr UnknownRJump_0x60582

UnknownRJump_0x60559:
	inc a
	ldh_n_a $C5
	ld a, [$A69A]
	and $02
	jr z, UnknownRJump_0x60573
	ld a, [$A795]
	inc a
	ld [$A795], a
	cp $03
	jr c, UnknownRJump_0x60573
	xor a
	ld [$A795], a

UnknownRJump_0x60573:
	call UnknownCall_0x60C41
	ld e, a
	ld a, [$A795]
	add e
	inc a
	ldh_n_a $C6
	jp UnknownJump_0x607AA

UnknownRJump_0x60582:
	ldh_a_n $81
	and $01
	jr z, UnknownRJump_0x6059A
	ld a, 2
	ld [$A7A6], a
	ld a, 24
	ld [$A7A7], a
	ld a, 8
	ld [$A468], a
	jr UnknownRJump_0x605A0

UnknownRJump_0x6059A:
	call UnknownCall_0x60800
	jp UnknownJump_0x607AA

UnknownRJump_0x605A0:
	ld a, [$A69A]
	and $03
	jr nz, UnknownRJump_0x605C7
	ld a, [$A7A7]
	or a
	jr nz, UnknownRJump_0x605B9
	ld a, 3
	ld [$A7A6], a
	ld a, 0
	ld [$A7A7], a
	jr UnknownRJump_0x605CA

UnknownRJump_0x605B9:
	ld a, [$A7A7]
	dec a
	ld [$A7A7], a
	ld a, [$A6BC]
	inc a
	ld [$A6BC], a

UnknownRJump_0x605C7:
	jp UnknownJump_0x607AA

UnknownRJump_0x605CA:
	ld a, [$A69A]
	and $03
	jr nz, UnknownRJump_0x605EB
	ld a, [$A6BD]
	cp $23
	jr c, UnknownRJump_0x605E4
	ld a, 4
	ld [$A7A6], a
	ld a, 32
	ld [$A7A7], a
	jr UnknownRJump_0x605EE

UnknownRJump_0x605E4:
	ld a, [$A6BD]
	inc a
	ld [$A6BD], a

UnknownRJump_0x605EB:
	jp UnknownJump_0x607AA

UnknownRJump_0x605EE:
	ld a, [$A69A]
	and $03
	jr nz, UnknownRJump_0x60619
	ld a, [$A7A7]
	or a
	jr nz, UnknownRJump_0x60602
	ld a, 5
	ld [$A7A6], a
	jr UnknownRJump_0x60639

UnknownRJump_0x60602:
	ld a, [$A7A7]
	dec a
	ld [$A7A7], a
	or a
	call z, UnknownCall_0x6062D
	ld a, [$A6BC]
	dec a
	ld [$A6BC], a
	cp $48
	call z, UnknownCall_0x6061C

UnknownRJump_0x60619:
	jp UnknownJump_0x607AA

UnknownCall_0x6061C:
	ld a, [$A7B2]
	cp $01
	ret z
	ld a, 9
	ld [$A7A6], a
	ld a, 17
	ld [$A460], a
	ret

UnknownCall_0x6062D:
	ld a, [$A7B2]
	cp $01
	ret nz
	ld a, 22
	ld [$A468], a
	ret

UnknownRJump_0x60639:
	ld a, [$A69A]
	bit 0, a
	jr nz, UnknownRJump_0x60658
	ld a, [$A6B8]
	cp $1D
	jr nc, UnknownRJump_0x6064E
	ld a, 6
	ld [$A7A6], a
	jr UnknownRJump_0x6065B

UnknownRJump_0x6064E:
	ld a, [$A6B8]
	dec a
	ld [$A6B8], a
	ld [$A6BB], a

UnknownRJump_0x60658:
	jp UnknownJump_0x607AA

UnknownRJump_0x6065B:
	ld a, [$A69A]
	and $03
	jr nz, UnknownRJump_0x6067C
	ld a, [$A6BD]
	cp $21
	jr nz, UnknownRJump_0x60675
	ld a, 7
	ld [$A7A6], a
	ld a, 25
	ld [$A7A7], a
	jr UnknownRJump_0x6067F

UnknownRJump_0x60675:
	ld a, [$A6BD]
	dec a
	ld [$A6BD], a

UnknownRJump_0x6067C:
	jp UnknownJump_0x607AA

UnknownRJump_0x6067F:
	ld a, [$A69A]
	and $03
	jp nz, UnknownJump_0x607AA
	ld a, [$A7A7]
	or a
	jr z, UnknownRJump_0x60694
	dec a
	ld [$A7A7], a
	jp UnknownJump_0x607AA

UnknownRJump_0x60694:
UnknownData_0x60694:
INCBIN "baserom.gb", $60694, $6069C - $60694

	ld a, [$A69A]
	and $03
	jp nz, UnknownJump_0x607AA
	call UnknownCall_0x606AA
	jp UnknownJump_0x607AA

UnknownCall_0x606AA:
	ld a, [$A7A8]
	cp $03
	jr nc, UnknownRJump_0x60711
	ld a, [$A69A]
	and $0C
	jr nz, UnknownRJump_0x606BE
	ld a, [$A7AC]
	ld e, a
	jr UnknownRJump_0x606DF

UnknownRJump_0x606BE:
	cp $04
	jr nz, UnknownRJump_0x606C6
	ld e, 0
	jr UnknownRJump_0x606DF

UnknownRJump_0x606C6:
	cp $08
	jr nz, UnknownRJump_0x606D7
	ld a, [$A7AB]
	ld e, a
	or a
	jr nz, UnknownRJump_0x606DF
	ld a, [$A7AC]
	ld e, a
	jr UnknownRJump_0x606DF

UnknownRJump_0x606D7:
	ld e, 0
	jr UnknownRJump_0x606DF

UnknownJump_0x606DB:
	ld a, [$A7AC]
	ld e, a

UnknownRJump_0x606DF:
	ld d, 0
	ld hl, $4C4D
	add de
	ld a, [hl]
	ldh_n_a $C6
	ld a, [$A7A7]
	dec a
	ld [$A7A7], a
	or a
	ret nz
	ld a, [$A7AC]
	ld [sCurPowerup], a
	ld d, 0
	ld e, a
	ld hl, $4C4D
	add de
	ld a, [hl]
	ldh_n_a $C6
	ld a, 9
	ld [$A7A6], a
	ld a, 20
	ld [$A7A7], a
	call UnknownCall_0x2934
	ret

UnknownRJump_0x60711:
	ld c, 30
	ld a, [$A7A8]
	cp $03
	jr nz, UnknownRJump_0x60723
	ld c, 29
	ld a, [$A68B]
	cp $0E
	jr z, UnknownRJump_0x6073D

UnknownRJump_0x60723:
	ld a, c
	ld [$A6DB], a
	ld a, [$A6DA]
	cp $60
	jr c, UnknownRJump_0x60735
	dec a
	ld [$A6DA], a
	jp UnknownJump_0x606DB

UnknownRJump_0x60735:
	ld a, 255
	ld [$A6DB], a
	jp UnknownJump_0x606DB

UnknownRJump_0x6073D:
	ld a, c
	ld [$A6E4], a
	ld a, [$A6E3]
	cp $62
	jr c, UnknownRJump_0x60757
	dec a
	ld [$A6E3], a
	ldh_a_n $C5
	sub 4
	ld [$A6E2], a
	jp UnknownJump_0x606DB

UnknownRJump_0x60757:
	ld a, 255
	ld [$A6E4], a
	ld a, 176
	ld [$A6E2], a
	jp UnknownJump_0x606DB
	ld a, [$A69A]
	and $01
	jp z, UnknownJump_0x607AA
	call UnknownCall_0x60772
	jp UnknownJump_0x607AA

UnknownCall_0x60772:
	ldh_a_n $C5
	cp $E8
	jr nz, UnknownRJump_0x6077F
	ld a, 10
	ld [$A7A6], a
	ret

UnknownRJump_0x6077F:
	dec a
	ldh_n_a $C5
	ld a, [$A69A]
	and $02
	jr z, UnknownRJump_0x60799
	ld a, [$A795]
	inc a
	ld [$A795], a
	cp $03
	jr c, UnknownRJump_0x60799
	xor a
	ld [$A795], a

UnknownRJump_0x60799:
	call UnknownCall_0x60C41
	ld e, a
	ld a, [$A795]
	add e
	add 5
	ldh_n_a $C6
	ret

UnknownData_0x607A7:
INCBIN "baserom.gb", $607A7, $607AA - $607A7


UnknownJump_0x607AA:
	call UnknownCall_0x607C5
	call UnknownCall_0x6083C
	call UnknownCall_0x6083C
	call UnknownCall_0x6083C
	call UnknownCall_0x6083C
	call UnknownCall_0x6083C
	call UnknownCall_0x6106D
	call UnknownCall_0x3F44
	jp UnknownJump_0x3E07

UnknownCall_0x607C5:
	ld a, 255
	ld [$A6C0], a
	ld [$A6C3], a
	ld [$A6C6], a
	ld [$A6C9], a
	ld a, [$A6BC]
	cp $3E
	ret c
	ld a, 32
	ld [$A6C0], a
	ld a, [$A6BC]
	cp $46
	ret c
	ld a, 32
	ld [$A6C3], a
	ld a, [$A6BC]
	cp $4E
	ret c
	ld a, 32
	ld [$A6C6], a
	ld a, [$A6BC]
	cp $56
	ret c
	ld a, 32
	ld [$A6C9], a
	ret

UnknownCall_0x60800:
	ld a, [$A69A]
	and $03
	ret z
	ld a, [$A6B8]
	ld e, a
	ld a, [$A7A7]
	bit 0, a
	jr nz, UnknownRJump_0x60822
	ld a, e
	cp $78
	jr nc, UnknownRJump_0x60819
	inc e
	jr UnknownRJump_0x60828

UnknownRJump_0x60819:
	ld a, [$A7A7]
	cpl
	ld [$A7A7], a
	jr UnknownRJump_0x60828

UnknownRJump_0x60822:
	ld a, e
	cp $50
	jr c, UnknownRJump_0x60819
	dec e

UnknownRJump_0x60828:
	ld a, e
	ld [$A6B8], a
	ld [$A6BB], a
	ld [$A6BE], a
	ld [$A6C1], a
	ld [$A6C4], a
	ld [$A6C7], a
	ret

UnknownCall_0x6083C:
	ld a, [$A7E9]
	cp $05
	jr c, UnknownRJump_0x60847
	xor a
	ld [$A7E9], a

UnknownRJump_0x60847:
	ld d, 0
	ld e, a
	ld hl, $A7D0
	add de
	ld a, [hl]
	or a
	jp z, UnknownJump_0x60865
	cp $01
	jp z, UnknownJump_0x608BB
	cp $02
	jp z, UnknownJump_0x608E1
	cp $03
	jp z, UnknownJump_0x60965

UnknownData_0x60862:
INCBIN "baserom.gb", $60862, $60865 - $60862


UnknownJump_0x60865:
	ld a, [$A69A]
	and $01
	jp nz, UnknownJump_0x609E4
	ld hl, $A7D5
	add de
	ld a, [hl]
	dec a
	ld [hl], a
	cp $32
	jr nc, UnknownRJump_0x6088C
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
	jp UnknownJump_0x60965

UnknownRJump_0x6088C:
	ld a, [$A7A6]
	cp $03
	call z, UnknownCall_0x60897
	jp UnknownJump_0x609E4

UnknownCall_0x60897:
	ld hl, $A7E4
	add de
	ld a, [hl]
	cp $05
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

UnknownJump_0x608BB:
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
	cp $07
	jp nz, UnknownJump_0x609E4
	ld a, 2
	ld hl, $A7D0
	add de
	ld [hl], a
	jp UnknownJump_0x609E4

UnknownJump_0x608E1:
	ld hl, $A7DA
	add de
	ld a, [hl]
	inc a
	ld [hl], a
	cp $68
	jp c, UnknownJump_0x609E4
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
	call UnknownCall_0x60917
	jp UnknownJump_0x609E4

UnknownCall_0x60917:
	ld a, [sCurPowerup]
	ld [$A7AB], a
	ld [$A7AC], a
	ld a, [$A7A8]
	cp $03
	jp nc, UnknownJump_0x60939
	ld hl, $4C51
	ld b, 0
	ld c, a
	add bc
	ld a, [hl]
	ld [$A7AC], a
	ld a, 20
	ld [$A470], a
	ret

UnknownJump_0x60939:
	ld a, 9
	ld [$A460], a
	ld a, [$A7A8]
	cp $03
	jr nz, UnknownRJump_0x60955
	ld a, [$A22C]
	add 1
	daa
	ld [$A22C], a
	ret nc

UnknownData_0x6094F:
INCBIN "baserom.gb", $6094F, $60955 - $6094F


UnknownRJump_0x60955:
	ld a, [$A22C]
	add 3
	daa
	ld [$A22C], a
	ret nc

UnknownData_0x6095F:
INCBIN "baserom.gb", $6095F, $60965 - $6095F


UnknownJump_0x60965:
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
	cp $06
	jr c, UnknownRJump_0x6098F
	ld a, [$A7B5]
	ld [$A7AE], a
	ld l, a
	ld a, [$A7B6]
	ld [$A7AF], a
	ld h, a
	ld a, [hl]

UnknownRJump_0x6098F:
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
	jp nz, UnknownJump_0x609E4
	ld hl, $A7DF
	add de
	ld a, [hl]
	cp $FF
	jp z, UnknownJump_0x609E4
	or a
	jr z, UnknownRJump_0x609B7
	dec a
	ld [hl], a
	jp UnknownJump_0x609E4

UnknownRJump_0x609B7:
	ld hl, $A7E4
	add de
	ld a, [hl]
	cp $05
	jr z, UnknownRJump_0x609C9
	add 24
	ld hl, $A6CC
	add de
	add de
	add de
	ld [hl], a

UnknownRJump_0x609C9:
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
	jp UnknownJump_0x609E4

UnknownJump_0x609E4:
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

UnknownData_0x60A1A:
INCBIN "baserom.gb", $60A1A, $60A81 - $60A1A

	ld a, [$A7A6]
	cp $00
	jr nz, UnknownRJump_0x60AEC
	ld a, [$A6BD]
	cp $07
	jr nz, UnknownRJump_0x60AA7
	ldh_a_n $81
	bit 0, a
	jr z, UnknownRJump_0x60AA7
	ld a, 5
	ld [$A7A6], a
	ld a, 0
	ld [$A79A], a
	ld a, 1
	ld [$A460], a
	jr UnknownRJump_0x60AEC

UnknownJump_0x60AA7:
UnknownRJump_0x60AA7:
	ld a, [$A6B9]
	ld d, a
	ld a, [$A796]
	inc a
	ld [$A796], a
	cp $28
	jr c, UnknownRJump_0x60AC2
	cp $50
	jr nc, UnknownRJump_0x60ABD
	dec d
	jr UnknownRJump_0x60AC3

UnknownRJump_0x60ABD:
	ld a, 0
	ld [$A796], a

UnknownRJump_0x60AC2:
	inc d

UnknownRJump_0x60AC3:
	ld a, d
	ld [$A6B9], a
	ld a, [$A69A]
	and $07
	jr nz, UnknownRJump_0x60AD9
	ld a, [$A6BD]
	cp $07
	jr z, UnknownRJump_0x60AD9
	inc a
	ld [$A6BD], a

UnknownRJump_0x60AD9:
	ld b, 2
	ld a, [$A7A5]
	sub b
	ld [$A7A5], a
	ld a, [$A7AD]
	inc a
	ld [$A7AD], a
	jp UnknownJump_0x60CF9

UnknownJump_0x60AEC:
UnknownRJump_0x60AEC:
	ld a, [$A7A6]
	cp $01
	jp nz, UnknownJump_0x60BBF
	ld a, [$A7A7]
	dec a
	ld [$A7A7], a
	or a
	jr nz, UnknownRJump_0x60B18
	ld a, 2
	ld [$A7A6], a
	ld a, 90
	ld [$A7A7], a
	ld a, 2
	ld [$A6BA], a
	call UnknownCall_0x60D32
	ld a, 56
	ld [$A6C2], a
	jp UnknownJump_0x60BBF

UnknownRJump_0x60B18:
	call UnknownCall_0x60D08
	ld a, [$A7A7]
	cp $78
	jr nc, UnknownRJump_0x60B88
	and $01
	jr z, UnknownRJump_0x60B49
	ld a, [$A797]
	inc a
	cp $03
	jr c, UnknownRJump_0x60B41
	ld a, 3
	ld [$A797], a
	ld a, 2
	ld [$A6BA], a
	ld a, [$A69A]
	and $04
	jr nz, UnknownRJump_0x60B49
	jr UnknownRJump_0x60B49

UnknownRJump_0x60B41:
	ld [$A797], a
	add 2
	ld [$A6BA], a

UnknownRJump_0x60B49:
	ld a, [$A7A7]
	ld d, 0
	ld e, a
	ld hl, $4FCD
	add de
	ld a, [hl]
	or a
	jr nz, UnknownRJump_0x60B5C
	jp UnknownJump_0x60CF9

UnknownData_0x60B5A:
INCBIN "baserom.gb", $60B5A, $60B5C - $60B5A


UnknownRJump_0x60B5C:
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
	cp $03
	jp c, UnknownJump_0x60CF9
	sub 3
	ld [$A798], a
	xor a
	ld [$A797], a
	ld a, 2
	ld [$A6BA], a
	jp UnknownJump_0x60CF9

UnknownRJump_0x60B88:
	ld a, [$A6B9]
	ld d, a
	and $07
	cp $05
	jr z, UnknownRJump_0x60BAD
	ld a, [$A796]
	inc a
	ld [$A796], a
	cp $28
	jr c, UnknownRJump_0x60BA8
	cp $50
	jr nc, UnknownRJump_0x60BA4
	dec d
	jr UnknownRJump_0x60BA9

UnknownRJump_0x60BA4:
UnknownData_0x60BA4:
INCBIN "baserom.gb", $60BA4, $60BA8 - $60BA4


UnknownRJump_0x60BA8:
	inc d

UnknownRJump_0x60BA9:
	ld a, d
	ld [$A6B9], a

UnknownRJump_0x60BAD:
	ld a, [$A7A5]
	sub 2
	ld [$A7A5], a
	ld a, [$A7AD]
	inc a
	ld [$A7AD], a
	jp UnknownJump_0x60CF9

UnknownJump_0x60BBF:
	ld a, [$A7A6]
	cp $02
	jr nz, UnknownRJump_0x60C13
	ld a, [$A69A]
	bit 0, a
	jp nz, UnknownJump_0x60CF9
	ld a, 255
	ld [$A6C3], a
	ld a, [$A7A7]
	cp $3C
	jr nc, UnknownRJump_0x60BF3
	ld a, [$A6C2]
	inc a
	ld [$A6C2], a
	cp $4E
	call z, UnknownCall_0x60D80
	ld a, 32
	ld [$A6C1], a
	ld a, [$A7A8]
	add 11
	ld [$A6C3], a

UnknownRJump_0x60BF3:
	ld a, [$A7A7]
	dec a
	ld [$A7A7], a
	or a
	jp nz, UnknownJump_0x60CF9
	ld a, 100
	ld [$A7A7], a
	ld a, 6
	ld [$A7A6], a
	ld a, 255
	ld [$A6C3], a
	call UnknownCall_0x60DC7
	jp UnknownJump_0x60CF9

UnknownRJump_0x60C13:
	ld a, [$A7A6]
	cp $04
	jr nz, UnknownRJump_0x60C59
	call UnknownCall_0x60C41
	add 16
	ldh_n_a $C6
	ldh_a_n $C4
	dec a
	ldh_n_a $C4
	cp $7D
	jp nc, UnknownJump_0x60CF9
	ld a, 0
	ld [$A7A6], a
	call UnknownCall_0x60C41
	ldh_n_a $C6
	ld a, 1
	ldh_n_a $BB
	jp UnknownJump_0x60CF9

UnknownCall_0x60C41:
	ld a, [sCurPowerup]
	ld d, 0
	ld e, a
	ld hl, $4C4D
	add de
	ld a, [hl]
	ret

UnknownData_0x60C4D:
INCBIN "baserom.gb", $60C4D, $60C59 - $60C4D


UnknownRJump_0x60C59:
	ld a, [$A7A6]
	cp $05
	jr nz, UnknownRJump_0x60C94
	call UnknownCall_0x60D08
	ldh_a_n $C4
	cp $6C
	jr nc, UnknownRJump_0x60C91
	ld a, [$A69A]
	and $01
	jr nz, UnknownRJump_0x60C91
	ld a, [$A6C0]
	cp $0A
	jr nc, UnknownRJump_0x60C7F
	inc a
	ld [$A6C0], a
	jp UnknownJump_0x60CF9

UnknownRJump_0x60C7F:
	ld a, 1
	ld [$A7A6], a
	ld a, 150
	ld [$A7A7], a
	ld a, 8
	ld [$A468], a
	jp UnknownJump_0x60AEC

UnknownRJump_0x60C91:
	jp UnknownJump_0x60AA7

UnknownRJump_0x60C94:
	ld a, [$A7A6]
	cp $06
	jp nz, UnknownJump_0x60CF9
	ld a, [$A7A7]
	cp $19
	jr c, UnknownRJump_0x60CD8
	ld a, [$A7A8]
	cp $00
	jr z, UnknownRJump_0x60CD8
	cp $04
	jr nc, UnknownRJump_0x60CD8
	ld a, [$A69A]
	and $0C
	jr nz, UnknownRJump_0x60CBB
	ld a, [$A7AC]
	ld e, a
	jr UnknownRJump_0x60CDC

UnknownRJump_0x60CBB:
	cp $04
	jr nz, UnknownRJump_0x60CC3
	ld e, 0
	jr UnknownRJump_0x60CDC

UnknownRJump_0x60CC3:
	cp $08
	jr nz, UnknownRJump_0x60CD4
	ld a, [$A7AB]
	ld e, a
	or a
	jr nz, UnknownRJump_0x60CDC
	ld a, [$A7AC]
	ld e, a
	jr UnknownRJump_0x60CDC

UnknownRJump_0x60CD4:
	ld e, 0
	jr UnknownRJump_0x60CDC

UnknownRJump_0x60CD8:
	ld a, [$A7AC]
	ld e, a

UnknownRJump_0x60CDC:
	ld d, 0
	ld hl, $4C4D
	add de
	ld a, [hl]
	ldh_n_a $C6
	ld a, [$A7A7]
	dec a
	ld [$A7A7], a
	or a
	jp nz, UnknownJump_0x60CF9
	ld a, 3
	ld [$A7A6], a
	jp UnknownJump_0x60CF9

UnknownJump_0x60CF9:
	call UnknownCall_0x60EE6
	call UnknownCall_0x60EB5
	call UnknownCall_0x6106D
	call UnknownCall_0x3F44
	jp UnknownJump_0x3E07

UnknownCall_0x60D08:
	call UnknownCall_0x60C41
	ldh_n_a $C6
	ld a, [$A79A]
	ld d, 0
	ld e, a
	ld hl, $4FA8
	add de
	ld a, [hl]
	cp $80
	ret z
	ld b, a
	inc e
	ld a, e
	ld [$A79A], a
	ldh_a_n $C4
	add b
	ldh_n_a $C4
	call UnknownCall_0x60C41
	add 8
	ldh_n_a $C6
	ret

UnknownCall_0x60D32:
	ld a, [$A7A5]
	and $7C
	srl a
	srl a
	cp $1E
	jr c, UnknownRJump_0x60D49

UnknownData_0x60D3F:
INCBIN "baserom.gb", $60D3F, $60D49 - $60D3F


UnknownRJump_0x60D49:
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

UnknownCall_0x60D80:
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

UnknownRJump_0x60DAB:
	cp $03
	jr c, UnknownRJump_0x60DB3
	sub 3
	jr UnknownRJump_0x60DAB

UnknownRJump_0x60DB3:
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

UnknownCall_0x60DC7:
	ld a, [sCurPowerup]
	ld [$A7AB], a
	ld [$A7AC], a
	ld a, [$A7A8]
	or a
	ret z
	cp $01
	jr nz, UnknownRJump_0x60DE1
	ld a, 1
	ld [sCurPowerup], a
	jp UnknownJump_0x60E7D

UnknownRJump_0x60DE1:
	cp $02
	jr nz, UnknownRJump_0x60DED
	ld a, 2
	ld [sCurPowerup], a
	jp UnknownJump_0x60E7D

UnknownRJump_0x60DED:
	cp $03
	jr nz, UnknownRJump_0x60DF9
	ld a, 3
	ld [sCurPowerup], a
	jp UnknownJump_0x60E7D

UnknownRJump_0x60DF9:
	cp $04
	jr nz, UnknownRJump_0x60E0B
	ld a, [$A22C]
	add 1
	daa
	ld [$A22C], a
	call c, UnknownCall_0x60EAF
	jr UnknownRJump_0x60E7D

UnknownRJump_0x60E0B:
	cp $05
	jr nz, UnknownRJump_0x60E1D
	ld a, [$A22C]
	add 3
	daa
	ld [$A22C], a
	call c, UnknownCall_0x60EAF
	jr UnknownRJump_0x60E7D

UnknownRJump_0x60E1D:
	cp $06
	jr nz, UnknownRJump_0x60E2F

UnknownData_0x60E21:
INCBIN "baserom.gb", $60E21, $60E2F - $60E21


UnknownRJump_0x60E2F:
	cp $07
	jr nz, UnknownRJump_0x60E41

UnknownData_0x60E33:
INCBIN "baserom.gb", $60E33, $60E41 - $60E33


UnknownRJump_0x60E41:
	cp $08
	jr nz, UnknownRJump_0x60E4C

UnknownData_0x60E45:
INCBIN "baserom.gb", $60E45, $60E4C - $60E45


UnknownRJump_0x60E4C:
	cp $09
	jr nz, UnknownRJump_0x60E5B

UnknownData_0x60E50:
INCBIN "baserom.gb", $60E50, $60E5B - $60E50


UnknownRJump_0x60E5B:
	cp $0A
	jr nz, UnknownRJump_0x60E6A
	ld a, [sCoinHigh]
	add 5
	daa
	ld [sCoinHigh], a
	jr UnknownRJump_0x60E7D

UnknownRJump_0x60E6A:
UnknownData_0x60E6A:
INCBIN "baserom.gb", $60E6A, $60E7D - $60E6A


UnknownJump_0x60E7D:
UnknownRJump_0x60E7D:
	ld a, [sCurPowerup]
	ld [$A7AC], a
	ld a, [$A7A8]
	ld d, 0
	ld e, a
	ld hl, $4F6A
	add de
	ld a, [hl]
	cp $14
	jr nz, UnknownRJump_0x60E97
	ld [$A470], a
	jr UnknownRJump_0x60E9A

UnknownRJump_0x60E97:
	ld [$A460], a

UnknownRJump_0x60E9A:
	ld a, [sCoinHigh]
	and $F0
	jr z, UnknownRJump_0x60EAB

UnknownData_0x60EA1:
INCBIN "baserom.gb", $60EA1, $60EAB - $60EA1


UnknownRJump_0x60EAB:
	call UnknownCall_0x2934
	ret

UnknownCall_0x60EAF:
UnknownData_0x60EAF:
INCBIN "baserom.gb", $60EAF, $60EB5 - $60EAF


UnknownCall_0x60EB5:
	ld a, [$A7AD]
	and $0C
	rrca
	rrca
	ld e, a
	ld d, 0
	ld a, [$A840]
	cp $6E
	jr z, UnknownRJump_0x60EDD
	cp $6F
	jr z, UnknownRJump_0x60ED8
	cp $70
	jr z, UnknownRJump_0x60ED3
	ld hl, $4F66
	jr UnknownRJump_0x60EE0

UnknownRJump_0x60ED3:
	ld hl, $4F62
	jr UnknownRJump_0x60EE0

UnknownRJump_0x60ED8:
	ld hl, $4F5E
	jr UnknownRJump_0x60EE0

UnknownRJump_0x60EDD:
	ld hl, $4F5A

UnknownRJump_0x60EE0:
	add de
	ld a, [hl]
	ld [$A6C4], a
	ret

UnknownCall_0x60EE6:
	ld a, [$A7A8]
	or a
	ret z
	ld a, [$A69A]
	and $03
	ret nz
	ld a, [$A7B9]
	inc a
	cp $03
	jr c, UnknownRJump_0x60EFA
	xor a

UnknownRJump_0x60EFA:
	ld [$A7B9], a
	or a
	jr z, UnknownRJump_0x60F06
	cp $01
	jr z, UnknownRJump_0x60F22
	jr UnknownRJump_0x60F3E

UnknownRJump_0x60F06:
	ld hl, $4530
	ld de, $8D30
	call UnknownCall_0x3F0E
	ld hl, $4D50
	ld de, $8E70
	call UnknownCall_0x3F0E
	ld hl, $4D50
	ld de, $9550
	call UnknownCall_0x3F0E
	ret

UnknownRJump_0x60F22:
	ld hl, $4D50
	ld de, $8D30
	call UnknownCall_0x3F0E
	ld hl, $4530
	ld de, $8E70
	call UnknownCall_0x3F0E
	ld hl, $4D50
	ld de, $9550
	call UnknownCall_0x3F0E
	ret

UnknownRJump_0x60F3E:
	ld hl, $4D50
	ld de, $8D30
	call UnknownCall_0x3F0E
	ld hl, $4D50
	ld de, $8E70
	call UnknownCall_0x3F0E
	ld hl, $4530
	ld de, $9550
	call UnknownCall_0x3F0E
	ret

UnknownData_0x60F5A:
INCBIN "baserom.gb", $60F5A, $6106D - $60F5A


UnknownCall_0x6106D:
	xor a
	ld hl, $A100
	ld d, 160

UnknownRJump_0x61073:
	ld [hli], a
	dec d
	jr nz, UnknownRJump_0x61073
	ld a, 0
	ld [$A782], a
	ld hl, $A6B5
	ld a, 16

UnknownRJump_0x61081:
	push af
	push hl
	ld b, [hl]
	inc hl
	ld c, [hl]
	inc hl
	ld a, [hl]
	ld e, a
	cp $FF
	ld hl, $51B1
	call nz, UnknownCall_0x6109B
	pop hl
	ld bc, $0003
	add bc
	pop af
	dec a
	jr nz, UnknownRJump_0x61081
	ret

UnknownCall_0x6109B:
	ld d, 0
	sla e
	rl d
	add de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [$A782]
	cp $28
	ret nc
	add a
	add a
	ld de, $A100
	add e
	ld e, a
	ld a, d
	adc 0
	ld d, a

UnknownRJump_0x610B6:
	ld a, [$A782]
	cp $28
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
	cp $FF
	jr z, UnknownRJump_0x610D7
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [$A782]
	inc a
	ld [$A782], a
	jr UnknownRJump_0x610B6

UnknownRJump_0x610D7:
	xor a
	dec de
	ld [de], a
	dec de
	ld [de], a
	ret

UnknownCall_0x610DD:
	ld b, 15
	ld hl, $A7D0

UnknownRJump_0x610E2:
	push bc
	ld a, [hli]
	ld [$A787], a
	ld a, [hli]
	ld [$A788], a
	ld a, [hli]
	cp $FF
	jr z, UnknownRJump_0x61142
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

UnknownRJump_0x610FF:
	ld a, [de]
	inc de
	cp $FF
	jr z, UnknownRJump_0x61142
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

UnknownRJump_0x61138:
	bit 1, [hl]
	jr nz, UnknownRJump_0x61138
	pop hl
	ld a, [de]
	inc de
	ld [bc], a
	jr UnknownRJump_0x610FF

UnknownRJump_0x61142:
	pop bc
	dec b
	jr nz, UnknownRJump_0x610E2
	ret

UnknownCall_0x61147:
	ld b, 15
	ld hl, $A7D0

UnknownRJump_0x6114C:
	push bc
	ld a, [hli]
	ld [$A787], a
	ld a, [hli]
	ld [$A788], a
	ld a, [hli]
	cp $FF
	jr z, UnknownRJump_0x611AC
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

UnknownRJump_0x61169:
	ld a, [de]
	inc de
	cp $FF
	jr z, UnknownRJump_0x611AC
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

UnknownRJump_0x611A2:
	bit 1, [hl]
	jr nz, UnknownRJump_0x611A2
	pop hl
	ld a, [de]
	inc de
	ld [bc], a
	jr UnknownRJump_0x61169

UnknownRJump_0x611AC:
	pop bc
	dec b
	jr nz, UnknownRJump_0x6114C
	ret

UnknownData_0x611B1:
INCBIN "baserom.gb", $611B1, $61602 - $611B1
include "owmovementpointers.asm"
INCBIN "baserom.gb", $61A40, $64000 - $61A40


SECTION "bank19", ROMX, BANK[$19]


UnknownData_0x64000:
INCBIN "gfx/coingame.2bpp"
INCBIN "gfx/bonusgame.2bpp"

UnknownCall_0x66000:
	ld a, [$AF3E]
	and a
	ret nz
	call UnknownCall_0x66087
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
	ldh_a_n $8D
	ld l, a
	ld a, [$FF00+$D9]
	ld b, a
	ld a, [$FF00+$DA]
	ld c, a
	ld a, [de]
	cp $88
	jr nz, UnknownRJump_0x66039
	ld a, [$AF2B]
	bit 6, a
	jr z, UnknownRJump_0x66037
	inc de
	ld a, [de]
	add b
	ld b, a
	jr UnknownRJump_0x66038

UnknownRJump_0x66037:
	inc de

UnknownRJump_0x66038:
	inc de

UnknownRJump_0x66039:
	ld a, [de]
	cp $80
	ret z
	ld a, [$AF2B]
	bit 6, a
	jr z, UnknownRJump_0x6604A
	ld a, [de]
	cpl
	sub 7
	jr UnknownRJump_0x6604B

UnknownRJump_0x6604A:
	ld a, [de]

UnknownRJump_0x6604B:
	add b
	cp $A0
	jr nc, UnknownRJump_0x6605F
	ld [hli], a
	inc de
	ld a, [$AF2B]
	bit 5, a
	jr z, UnknownRJump_0x6606D
	ld a, [de]
	cpl
	sub 7
	jr UnknownRJump_0x6606E

UnknownRJump_0x6605F:
	inc de
	inc de
	inc de
	inc de
	jr UnknownRJump_0x66039

UnknownRJump_0x66065:
	dec l
	ld [hl], 0
	inc de
	inc de
	inc de
	jr UnknownRJump_0x66039

UnknownRJump_0x6606D:
	ld a, [de]

UnknownRJump_0x6606E:
	add c
	cp $A8
	jr nc, UnknownRJump_0x66065
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
	ldh_n_a $8D
	inc de
	jr UnknownRJump_0x66039

UnknownCall_0x66087:
	ld hl, $FFDC
	ld a, [hli]
	xor [hl]
	inc l
	xor [hl]
	ld [$AF2B], a
	ret

UnknownData_0x66092:
INCBIN "baserom.gb", $66092, $68000 - $66092



SECTION "bank1A", ROMX, BANK[$1A]


UnknownJump_0x68000:
	xor a
	ld [$A2DD], a
	ld [$A2DC], a
	ldh_a_n $9B
	inc a
	ldh_n_a $9B
	ret

UnknownJump_0x6800F:
	call UnknownCall_0x68016
	call UnknownCall_0x2B4F
	ret

UnknownCall_0x68016:
	ld a, [$A2DD]
	rst $28

UnknownData_0x6801A:
INCBIN "baserom.gb", $6801A, $68042 - $6801A

	call UnknownCall_0x684C5
	call UnknownCall_0x2A96
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
	call UnknownCall_0x684C5
	call UnknownCall_0x2A96
	ld a, [$A248]
	and a
	ret nz
	ld a, 26
	ld [$A265], a
	ld a, 86
	ldh_n_a $B1
	ld a, 70
	ldh_n_a $B2
	ld a, 0
	ldh_n_a $B3
	ld a, 128
	ldh_n_a $B4
	ld a, 0
	ldh_n_a $B5
	ld a, 8
	ldh_n_a $B6
	ld a, 255
	ld [$A248], a
	ld a, [$A2DD]
	inc a
	ld [$A2DD], a
	ret
	ld a, 195
	ldh_n_a $40

UnknownJump_0x680A3:
	ldh_a_n $44
	cp $0C
	jp nc, UnknownJump_0x680A3
	call UnknownCall_0x68492
	call UnknownCall_0x2A96

UnknownRJump_0x680B1:
	ldh_a_n $44
	cp $6F
	jr c, UnknownRJump_0x680B1

UnknownRJump_0x680B8:
	ldh_a_n $41
	and $03
	jr nz, UnknownRJump_0x680B8
	ld a, 211
	ldh_n_a $40
	ld a, [$A266]
	add 32
	cp $40
	jr nc, UnknownRJump_0x680FE
	ld hl, $444F

UnknownRJump_0x680D0:
	ldh_a_n $41
	and $03
	jr nz, UnknownRJump_0x680D0
	ldh_a_n $97
	and $3C
	srl a
	srl a
	ld b, a
	ldh_a_n $44
	add b
	and $0F
	ld e, a
	ld d, 0
	ld hl, $444F
	add de
	ld a, [hl]
	ldh_n_a $43
	ldh_a_n $44
	cp $8B
	jr c, UnknownRJump_0x680D0
	ld a, [$A2D6]
	and a
	ret nz

UnknownRJump_0x680FE:
	ld a, [$A2D8]
	and a
	jr nz, UnknownRJump_0x6811D
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

UnknownRJump_0x6811D:
	ld a, [$A2DD]
	inc a
	ld [$A2DD], a
	ret

UnknownData_0x68125:
INCBIN "baserom.gb", $68125, $68139 - $68125

	call UnknownCall_0x68400
	ld a, [$A248]
	and a
	ret nz
	ld a, [$A2DD]
	inc a
	ld [$A2DD], a
	ret
	call UnknownCall_0x68400
	ld a, [$A248]
	and a
	ret nz
	ld a, 16
	ld [$A265], a
	ld a, 0
	ldh_n_a $B1
	ld a, 96
	ldh_n_a $B2
	ld a, 0
	ldh_n_a $B3
	ld a, 136
	ldh_n_a $B4
	ld a, 0
	ldh_n_a $B5
	ld a, 16
	ldh_n_a $B6
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
	call UnknownCall_0x68492
	call UnknownCall_0x2A96
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
	ld [sScrollY], a
	ld b, a
	ld a, 44
	sub b
	ld [$A2E1], a
	ld a, b
	cp $18
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
	call UnknownCall_0x2A96
	call UnknownCall_0x684E0
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
	call UnknownCall_0x2A96
	call UnknownCall_0x684C5
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
	call UnknownCall_0x2A96
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
	call UnknownCall_0x68492
	call UnknownCall_0x2A96
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
	ldh_n_a $40

UnknownJump_0x6826C:
	ldh_a_n $44
	cp $0C
	jp nc, UnknownJump_0x6826C
	call UnknownCall_0x68492
	call UnknownCall_0x2A96

UnknownRJump_0x6827A:
	ldh_a_n $44
	cp $6F
	jr c, UnknownRJump_0x6827A

UnknownRJump_0x68281:
	ldh_a_n $41
	and $03
	jr nz, UnknownRJump_0x68281
	ld a, 211
	ldh_n_a $40
	ret

UnknownData_0x6828E:
INCBIN "baserom.gb", $6828E, $682BA - $6828E

	ld a, [$A266]
	and $03
	jr nz, UnknownRJump_0x682C8
	ld a, [$A2E1]
	inc a
	ld [$A2E1], a

UnknownRJump_0x682C8:
	call UnknownCall_0x6845F
	call UnknownCall_0x2A96
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
	call UnknownCall_0x6845F
	call UnknownCall_0x2A96
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

UnknownData_0x6830F:
INCBIN "baserom.gb", $6830F, $68398 - $6830F

	call UnknownCall_0x68400
	ldh_a_n $97
	and $01
	ld b, a
	ld a, [$A2DF]
	sub b
	ld [$A2DF], a
	cp $0D
	ret nz
	ld a, 0
	ld [$A267], a
	ld a, 192
	ld [$A266], a
	ld a, [$A2DD]
	inc a
	ld [$A2DD], a
	ret
	call UnknownCall_0x68400
	ldh_a_n $97
	and $01
	ld b, a
	ld a, [$A2DF]
	add b
	ld [$A2DF], a
	cp $8B
	ret nz
	ld a, 26
	ld [$A265], a
	ld a, 150
	ldh_n_a $B1
	ld a, 80
	ldh_n_a $B2
	ld a, 0
	ldh_n_a $B3
	ld a, 152
	ldh_n_a $B4
	ld a, 0
	ldh_n_a $B5
	ld a, 4
	ldh_n_a $B6
	ld a, 255
	ld [$A248], a
	ld a, [$A2DD]
	inc a
	ld [$A2DD], a
	ret

UnknownJump_0x68400:
UnknownCall_0x68400:
	ldh_a_n $44
	cp $0C
	jp nc, UnknownJump_0x68400
	call UnknownCall_0x2A96

UnknownJump_0x6840B:
	ldh_a_n $44
	cp $10
	jp c, UnknownJump_0x6840B
	ld hl, $444F

UnknownRJump_0x68416:
	ldh_a_n $41
	and $03
	jr nz, UnknownRJump_0x68416
	ldh_a_n $97
	and $3C
	srl a
	srl a
	ld b, a
	ldh_a_n $44
	add b
	and $0F
	ld e, a
	ld d, 0
	ld hl, $444F
	add de
	ld a, [hl]
	ldh_n_a $43
	ld a, [$A2DF]
	ld b, a
	ldh_a_n $44
	cp b
	jr c, UnknownRJump_0x68416

UnknownRJump_0x68442:
	ldh_a_n $41
	and $03
	jr nz, UnknownRJump_0x68442
	ld a, 0
	ldh_n_a $43
	ret

UnknownData_0x6844F:
INCBIN "baserom.gb", $6844F, $6845F - $6844F


UnknownCall_0x6845F:
	xor a
	ldh_n_a $BB
	ld a, 1
	ldh_n_a $C7
	ld a, [$A222]
	inc a
	ld [$A222], a
	cp $30
	jr c, UnknownRJump_0x68477
	xor a
	ld [$A222], a

UnknownRJump_0x68477:
	ld a, 84
	ldh_n_a $C5
	ld a, [$A2E1]
	ldh_n_a $C4
	ld a, [$A222]
	and $F0
	swap a
	add 229
	ldh_n_a $C6
	call UnknownCall_0x2B27
	ret

UnknownCall_0x68492:
	ld a, 1
	ldh_n_a $BB
	ld a, 0
	ldh_n_a $C7
	ld a, [$A222]
	inc a
	ld [$A222], a
	cp $30
	jr c, UnknownRJump_0x684AB
	xor a
	ld [$A222], a

UnknownRJump_0x684AB:
	ld a, 84
	ldh_n_a $C5
	ld a, [$A2E1]
	ldh_n_a $C4
	ld a, [$A222]
	and $F0
	swap a
	add 232
	ldh_n_a $C6
	call UnknownCall_0x2B27

UnknownCall_0x684C5:
	ld a, 0
	ldh_n_a $C7
	ld a, [$A2E1]
	add 52
	ldh_n_a $C4
	ld a, 79
	ldh_n_a $C5
	ld a, 235
	ldh_n_a $C6
	call UnknownCall_0x2B27
	ret

UnknownCall_0x684E0:
	ldh_a_n $97
	bit 0, a
	jr z, UnknownRJump_0x684EC
	ld a, 24
	ld [$A470], a

UnknownRJump_0x684EC:
	ld a, 0
	ldh_n_a $C7
	ld a, 1
	ldh_n_a $BB
	ld a, 96
	ldh_n_a $C4
	ld a, 79
	ldh_n_a $C5
	ldh_a_n $97
	and $1C
	srl a
	srl a
	ld e, a
	ld d, 0
	ld hl, $4518
	add de
	ld a, [hl]
	ldh_n_a $C6
	call UnknownCall_0x2B27
	ret

UnknownData_0x68518:
INCBIN "baserom.gb", $68518, $68520 - $68518

	ld a, [$A2DD]
	inc a
	ld [$A2DD], a
	ret

UnknownJump_0x68528:
	call $FFA0
	ld a, 0
	ldh_n_a $43
	ldh_n_a $43
	ld a, [$A2D6]
	and a
	jp nz, UnknownJump_0x68572
	ld a, [$A2E2]
	and a
	jr z, UnknownRJump_0x68562
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

UnknownRJump_0x68562:
	ld a, [$A24E] ;prepare bank switch
	ld [$2100], a
	ld a, 1
	ldh_n_a $82
	pop hl
	pop de
	pop bc
	pop af
	reti

UnknownJump_0x68572:
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
	cp $FF
	jr z, UnknownRJump_0x685A5
	ld b, 20

UnknownRJump_0x68595:
	ld a, [hli]
	sub 48
	cp $F0
	jr nz, UnknownRJump_0x6859E
	ld a, 255

UnknownRJump_0x6859E:
	ld [de], a
	inc de
	dec b
	jr nz, UnknownRJump_0x68595
	jr UnknownRJump_0x685AF

UnknownRJump_0x685A5:
	inc hl
	ld b, 20

UnknownRJump_0x685A8:
	ld a, 255
	ld [de], a
	inc de
	dec b
	jr nz, UnknownRJump_0x685A8

UnknownRJump_0x685AF:
	ld a, l
	ld [$A273], a
	ld a, h
	ld [$A274], a
	ld a, [hl]
	cp $FE
	jr nz, UnknownRJump_0x685C1
	ld a, 255
	ld [$A2D8], a

UnknownRJump_0x685C1:
	ld a, [$A2D6]
	dec a
	ld [$A2D6], a
	and a
	jr nz, UnknownRJump_0x685D5
	ld a, 1
	ld [$A267], a
	ld a, 0
	ld [$A266], a

UnknownRJump_0x685D5:
	ld a, [$A24E] ;prepare bank switch
	ld [$2100], a
	ld a, 1
	ldh_n_a $82
	pop hl
	pop de
	pop bc
	pop af
	reti

UnknownData_0x685E5:
INCBIN "baserom.gb", $685E5, $6C000 - $685E5



SECTION "bank1B", ROMX, BANK[$1B]


GFX_TilesetMarioZone1: ;$6C000
INCBIN "gfx/tilesets/mariozone1.2bpp"

GFX_TilesetMarioZone2: ;$6C600
INCBIN "gfx/tilesets/mariozone2.2bpp"

GFX_TilesetMarioZone3: ;$6CC00
INCBIN "gfx/tilesets/mariozone3.2bpp"

GFX_TilesetMarioZone4: ;$6D200
INCBIN "gfx/tilesets/mariozone4.2bpp"

GFX_TilesetMarioZoneBoss: ;$6D800
INCBIN "gfx/tilesets/mariozoneboss.2bpp"

GFX_EnemiesMarioZone1: ;$6DE00
INCBIN "gfx/enemies/mariozone1.2bpp"

GFX_EnemiesMarioZone2: ;$6E180
INCBIN "gfx/enemies/mariozone2.2bpp"

GFX_EnemiesMarioZone3: ;$6E500
INCBIN "gfx/enemies/mariozone3.2bpp"

GFX_EnemiesMarioZone4: ;$6E880
INCBIN "gfx/enemies/mariozone4.2bpp"

GFX_EnemiesMarioZoneBoss: ;$6EC00
INCBIN "gfx/enemies/mariozoneboss.2bpp"

INCBIN "baserom.gb", $6EF80, $70000 - $6EF80


SECTION "bank1C", ROMX, BANK[$1C]

GFX_TilesetMacroZone1: ;$70000
INCBIN "gfx/tilesets/macrozone1.2bpp"

GFX_TilesetMacroZone2: ;$70600
INCBIN "gfx/tilesets/macrozone2.2bpp"

GFX_TilesetMacroZone3: ;$70C00
INCBIN "gfx/tilesets/macrozone3.2bpp"

GFX_TilesetMacroZone4: ;$71200
INCBIN "gfx/tilesets/macrozone4.2bpp"

GFX_TilesetMacroZoneBoss: ;$71800
INCBIN "gfx/tilesets/macrozoneboss.2bpp"

GFX_EnemiesMacroZone1: ;$71E00
INCBIN "gfx/enemies/macrozone1.2bpp"

GFX_EnemiesMacroZone2: ;$72180
INCBIN "gfx/enemies/macrozone2.2bpp"

GFX_EnemiesMacroZone3: ;$72500
INCBIN "gfx/enemies/macrozone3.2bpp"

GFX_EnemiesMacroZone4: ;$72880
INCBIN "gfx/enemies/macrozone4.2bpp"

GFX_EnemiesMacroZoneBoss: ;$72C00
INCBIN "gfx/enemies/macrozoneboss.2bpp"

INCBIN "baserom.gb", $72F80, $74000 - $72F80


SECTION "bank1D", ROMX, BANK[$1D]

GFX_TilesetTurtleZone1: ;$74000
INCBIN "gfx/tilesets/turtlezone1.2bpp"

GFX_TilesetTurtleZone2: ;$74600
INCBIN "gfx/tilesets/turtlezone2.2bpp"

GFX_TilesetTurtleZone3: ;$74C00
INCBIN "gfx/tilesets/turtlezone3.2bpp"

GFX_TilesetTurtleZoneBoss: ;$75200
INCBIN "gfx/tilesets/turtlezoneboss.2bpp"

GFX_EnemiesTurtleZone1: ;$75800
INCBIN "gfx/enemies/turtlezone1.2bpp"

GFX_EnemiesTurtleZone2: ;$75B80
INCBIN "gfx/enemies/turtlezone2.2bpp"

GFX_EnemiesTurtleZone3: ;$75F00
INCBIN "gfx/enemies/turtlezone3.2bpp"

GFX_EnemiesTurtleZoneBoss: ;$76280
INCBIN "gfx/enemies/turtlezoneboss.2bpp"

INCBIN "baserom.gb", $76600, $78000 - $76600


SECTION "bank1E", ROMX, BANK[$1E]

GFX_TilesetSpaceZone: ;$78000
INCBIN "gfx/tilesets/spacezone.2bpp"

GFX_TilesetPumpkinZoneBoss2: ;$78600 maybe unused?
INCBIN "gfx/tilesets/pumpkinzoneboss2.2bpp"

GFX_TilesetWarioCastle: ;$78C00
INCBIN "gfx/tilesets/wariocastle.2bpp"

GFX_TilesetWarioRoom: ;$79200
INCBIN "gfx/tilesets/warioroom.2bpp"

INCBIN "baserom.gb", $79800, $79A00 - $79800

GFX_EnemiesHippoLevel: ;$79A00
INCBIN "gfx/enemies/hippolevel.2bpp"

GFX_EnemiesSpaceZone1: ;$79D80
INCBIN "gfx/enemies/spacezone1.2bpp"

GFX_EnemiesSpaceZone2: ;$7A100
INCBIN "gfx/enemies/spacezone2.2bpp"

GFX_EnemiesSpaceZoneBoss: ;$7A480
INCBIN "gfx/enemies/spacezoneboss.2bpp"

INCBIN "baserom.gb", $7A800, $7A880 - $7A800

GFX_EnemiesWarioCastle1: ;$7A880
INCBIN "gfx/enemies/wariocastle1.2bpp"

GFX_EnemiesWarioCastle2: ;$7AC00
INCBIN "gfx/enemies/wariocastle2.2bpp"

GFX_EnemiesWario1: ;$7AF80
INCBIN "gfx/enemies/wario1.2bpp"

GFX_EnemiesWario2: ;$7B300
INCBIN "gfx/enemies/wario2.2bpp"

INCBIN "baserom.gb", $7B680, $7C000 - $7B680

SECTION "bank1F", ROMX, BANK[$1F]

GFX_TilesetPumpkinZone1: ;$7C000
INCBIN "gfx/tilesets/pumpkinzone1.2bpp"

GFX_TilesetPumpkinZone2: ;$7C600
INCBIN "gfx/tilesets/pumpkinzone2.2bpp"

GFX_TilesetPumpkinZone3: ;$7CC00
INCBIN "gfx/tilesets/pumpkinzone3.2bpp"

GFX_TilesetPumpkinZone4: ;$7D200
INCBIN "gfx/tilesets/pumpkinzone4.2bpp"

GFX_TilesetPumpkinZoneBoss: ;$7D800
INCBIN "gfx/tilesets/pumpkinzoneboss.2bpp"

GFX_EnemiesPumpkinZone1: ;$7DE00
INCBIN "gfx/enemies/pumpkinzone1.2bpp"

GFX_EnemiesPumpkinZone2: ;$7E180
INCBIN "gfx/enemies/pumpkinzone2.2bpp"

GFX_EnemiesPumpkinZone3: ;$7E500
INCBIN "gfx/enemies/pumpkinzone3.2bpp"

GFX_EnemiesPumpkinZone4: ;$7E880
INCBIN "gfx/enemies/pumpkinzone4.2bpp"

GFX_EnemiesPumpkinZoneBoss: ;$7EC00
INCBIN "gfx/enemies/pumpkinzoneboss.2bpp"

INCBIN "baserom.gb", $7EF80, $80000 - $7EF80
