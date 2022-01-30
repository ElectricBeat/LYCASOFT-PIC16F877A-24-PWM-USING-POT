opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 10920"

opt pagewidth 120

	opt lm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 4 "E:\02-CODING\05-LYCASOFT CODING\02-CODING\23-PWM USING POT\CODE\PWM USING PWM.c"
	psect config,class=CONFIG,delta=2 ;#
# 4 "E:\02-CODING\05-LYCASOFT CODING\02-CODING\23-PWM USING POT\CODE\PWM USING PWM.c"
	dw 0X3F3A ;#
	FNCALL	_main,_Lcd_Intialization
	FNCALL	_main,_Lcd_Command
	FNCALL	_main,_Lcd_String
	FNCALL	_main,___awdiv
	FNCALL	_main,_divider
	FNCALL	_main,_pluse
	FNCALL	_divider,___awmod
	FNCALL	_divider,___awdiv
	FNCALL	_divider,_Lcd_Data
	FNCALL	_Lcd_Intialization,_Lcd_Command
	FNCALL	_Lcd_String,_Lcd_Data
	FNROOT	_main
	global	_a
	global	_b
	global	_c
	global	_d
	global	_m
	global	_temp1
	global	_temp2
	global	_v
	global	_ADCON0
psect	text218,local,class=CODE,delta=2
global __ptext218
__ptext218:
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_CCP1CON
_CCP1CON	set	23
	global	_CCPR1H
_CCPR1H	set	22
	global	_CCPR1L
_CCPR1L	set	21
	global	_PORTA
_PORTA	set	5
	global	_PORTC
_PORTC	set	7
	global	_PORTD
_PORTD	set	8
	global	_T2CON
_T2CON	set	18
	global	_TMR2
_TMR2	set	17
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_RD2
_RD2	set	66
	global	_RD3
_RD3	set	67
	global	_ADCON1
_ADCON1	set	159
	global	_ADRESL
_ADRESL	set	158
	global	_TRISA
_TRISA	set	133
	global	_TRISC
_TRISC	set	135
	global	_TRISD
_TRISD	set	136
	global	_EEADR
_EEADR	set	269
	global	_EEDATA
_EEDATA	set	268
	global	_EECON1
_EECON1	set	396
	global	_EECON2
_EECON2	set	397
	global	_RD
_RD	set	3168
	global	_WR
_WR	set	3169
	global	_WREN
_WREN	set	3170
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	
STR_2:	
	retlw	80	;'P'
	retlw	79	;'O'
	retlw	84	;'T'
	retlw	32	;' '
	retlw	86	;'V'
	retlw	65	;'A'
	retlw	76	;'L'
	retlw	85	;'U'
	retlw	69	;'E'
	retlw	58	;':'
	retlw	0
psect	strings
	
STR_1:	
	retlw	76	;'L'
	retlw	89	;'Y'
	retlw	67	;'C'
	retlw	65	;'A'
	retlw	83	;'S'
	retlw	79	;'O'
	retlw	70	;'F'
	retlw	84	;'T'
	retlw	0
psect	strings
	file	"PWM USING PWM.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_a:
       ds      2

_b:
       ds      2

_c:
       ds      2

_d:
       ds      2

_m:
       ds      2

_temp1:
       ds      2

_temp2:
       ds      2

_v:
       ds      2

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop		;do the next byte

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+010h)
	fcall	clear_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_Lcd_Command
?_Lcd_Command:	; 0 bytes @ 0x0
	global	??_Lcd_Command
??_Lcd_Command:	; 0 bytes @ 0x0
	global	?_Lcd_Data
?_Lcd_Data:	; 0 bytes @ 0x0
	global	??_Lcd_Data
??_Lcd_Data:	; 0 bytes @ 0x0
	global	?_Lcd_String
?_Lcd_String:	; 0 bytes @ 0x0
	global	?_Lcd_Intialization
?_Lcd_Intialization:	; 0 bytes @ 0x0
	global	?_pluse
?_pluse:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?___awdiv
?___awdiv:	; 2 bytes @ 0x0
	global	?___awmod
?___awmod:	; 2 bytes @ 0x0
	global	pluse@x
pluse@x:	; 2 bytes @ 0x0
	global	___awdiv@divisor
___awdiv@divisor:	; 2 bytes @ 0x0
	global	___awmod@divisor
___awmod@divisor:	; 2 bytes @ 0x0
	ds	2
	global	??_pluse
??_pluse:	; 0 bytes @ 0x2
	global	Lcd_Command@cmd
Lcd_Command@cmd:	; 1 bytes @ 0x2
	global	Lcd_Data@Data
Lcd_Data@Data:	; 1 bytes @ 0x2
	global	pluse@Temp
pluse@Temp:	; 2 bytes @ 0x2
	global	___awdiv@dividend
___awdiv@dividend:	; 2 bytes @ 0x2
	global	___awmod@dividend
___awmod@dividend:	; 2 bytes @ 0x2
	ds	1
	global	??_Lcd_String
??_Lcd_String:	; 0 bytes @ 0x3
	global	??_Lcd_Intialization
??_Lcd_Intialization:	; 0 bytes @ 0x3
	ds	1
	global	??___awdiv
??___awdiv:	; 0 bytes @ 0x4
	global	??___awmod
??___awmod:	; 0 bytes @ 0x4
	global	Lcd_String@Str
Lcd_String@Str:	; 1 bytes @ 0x4
	ds	1
	global	___awdiv@counter
___awdiv@counter:	; 1 bytes @ 0x5
	global	___awmod@counter
___awmod@counter:	; 1 bytes @ 0x5
	ds	1
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0x6
	global	___awmod@sign
___awmod@sign:	; 1 bytes @ 0x6
	ds	1
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0x7
	ds	2
	global	?_divider
?_divider:	; 0 bytes @ 0x9
	global	divider@x
divider@x:	; 2 bytes @ 0x9
	ds	2
	global	??_divider
??_divider:	; 0 bytes @ 0xB
	global	??_main
??_main:	; 0 bytes @ 0xB
	ds	3
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	divider@Dig1
divider@Dig1:	; 2 bytes @ 0x0
	ds	2
	global	divider@Dig2
divider@Dig2:	; 2 bytes @ 0x2
	ds	2
	global	divider@Dig3
divider@Dig3:	; 2 bytes @ 0x4
	ds	2
	global	divider@Dig4
divider@Dig4:	; 2 bytes @ 0x6
	ds	2
	global	divider@Temp
divider@Temp:	; 2 bytes @ 0x8
	ds	2
;;Data sizes: Strings 20, constant 0, data 0, bss 16, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80     10      26
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___awdiv	int  size(1) Largest target is 0
;;
;; ?___awmod	int  size(1) Largest target is 0
;;
;; Lcd_String@Str	PTR const unsigned char  size(1) Largest target is 11
;;		 -> STR_2(CODE[11]), STR_1(CODE[9]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_divider
;;   _divider->___awdiv
;;   _Lcd_Intialization->_Lcd_Command
;;   _Lcd_String->_Lcd_Data
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_divider
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 5     5      0    1411
;;                                             11 COMMON     3     3      0
;;                  _Lcd_Intialization
;;                        _Lcd_Command
;;                         _Lcd_String
;;                            ___awdiv
;;                            _divider
;;                              _pluse
;; ---------------------------------------------------------------------------------
;; (1) _divider                                             12    10      2     889
;;                                              9 COMMON     2     0      2
;;                                              0 BANK0     10    10      0
;;                            ___awmod
;;                            ___awdiv
;;                           _Lcd_Data
;; ---------------------------------------------------------------------------------
;; (1) _Lcd_Intialization                                    0     0      0      44
;;                        _Lcd_Command
;; ---------------------------------------------------------------------------------
;; (1) _Lcd_String                                           2     2      0      89
;;                                              3 COMMON     2     2      0
;;                           _Lcd_Data
;; ---------------------------------------------------------------------------------
;; (2) _Lcd_Data                                             3     3      0      44
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (1) _Lcd_Command                                          3     3      0      44
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (2) ___awmod                                              7     3      4     296
;;                                              0 COMMON     7     3      4
;; ---------------------------------------------------------------------------------
;; (2) ___awdiv                                              9     5      4     300
;;                                              0 COMMON     9     5      4
;; ---------------------------------------------------------------------------------
;; (1) _pluse                                                4     2      2      45
;;                                              0 COMMON     4     2      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _Lcd_Intialization
;;     _Lcd_Command
;;   _Lcd_Command
;;   _Lcd_String
;;     _Lcd_Data
;;   ___awdiv
;;   _divider
;;     ___awmod
;;     ___awdiv
;;     _Lcd_Data
;;   _pluse
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      E       E       1      100.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       2       2        0.0%
;;ABS                  0      0      28       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      A      1A       5       32.5%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      2A      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 84 in file "E:\02-CODING\05-LYCASOFT CODING\02-CODING\23-PWM USING POT\CODE\PWM USING PWM.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    0        int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_Lcd_Intialization
;;		_Lcd_Command
;;		_Lcd_String
;;		___awdiv
;;		_divider
;;		_pluse
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\02-CODING\05-LYCASOFT CODING\02-CODING\23-PWM USING POT\CODE\PWM USING PWM.c"
	line	84
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	86
	
l3029:	
;PWM USING PWM.c: 85: int i;
;PWM USING PWM.c: 86: TRISA=0X01;
	movlw	(01h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	87
	
l3031:	
;PWM USING PWM.c: 87: PORTA=0X00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	88
	
l3033:	
;PWM USING PWM.c: 88: TRISC=0X00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(135)^080h	;volatile
	line	89
	
l3035:	
;PWM USING PWM.c: 89: PORTC=0X00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(7)	;volatile
	line	90
	
l3037:	
;PWM USING PWM.c: 90: TRISD=0X00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	91
	
l3039:	
;PWM USING PWM.c: 91: PORTD=0X00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	93
	
l3041:	
;PWM USING PWM.c: 93: ADCON0=0X01;
	movlw	(01h)
	movwf	(31)	;volatile
	line	94
	
l3043:	
;PWM USING PWM.c: 94: ADCON1=0Xce;
	movlw	(0CEh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	96
	
l3045:	
;PWM USING PWM.c: 96: CCP1CON=0X0C;
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(23)	;volatile
	line	97
;PWM USING PWM.c: 97: TMR2=0;
	clrf	(17)	;volatile
	line	98
	
l3047:	
;PWM USING PWM.c: 98: T2CON=0X07;
	movlw	(07h)
	movwf	(18)	;volatile
	line	99
	
l3049:	
;PWM USING PWM.c: 99: CCPR1H=0X00;
	clrf	(22)	;volatile
	line	100
	
l3051:	
;PWM USING PWM.c: 100: CCPR1L=0X00;
	clrf	(21)	;volatile
	line	102
	
l3053:	
;PWM USING PWM.c: 102: Lcd_Intialization();
	fcall	_Lcd_Intialization
	line	103
	
l3055:	
;PWM USING PWM.c: 103: _delay((unsigned long)((100)*(20e6/4000.0)));
	opt asmopt_off
movlw  3
movwf	((??_main+0)+0+2),f
movlw	138
movwf	((??_main+0)+0+1),f
	movlw	86
movwf	((??_main+0)+0),f
u2497:
	decfsz	((??_main+0)+0),f
	goto	u2497
	decfsz	((??_main+0)+0+1),f
	goto	u2497
	decfsz	((??_main+0)+0+2),f
	goto	u2497
	nop2
opt asmopt_on

	line	105
	
l3057:	
;PWM USING PWM.c: 105: Lcd_Command(0x80);
	movlw	(080h)
	fcall	_Lcd_Command
	line	106
	
l3059:	
;PWM USING PWM.c: 106: Lcd_String("LYCASOFT");
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_Lcd_String
	line	107
	
l3061:	
;PWM USING PWM.c: 107: Lcd_Command(0xc0);
	movlw	(0C0h)
	fcall	_Lcd_Command
	line	108
	
l3063:	
;PWM USING PWM.c: 108: Lcd_String("POT VALUE:");
	movlw	((STR_2-__stringbase))&0ffh
	fcall	_Lcd_String
	goto	l3065
	line	110
;PWM USING PWM.c: 110: while(1)
	
l724:	
	line	112
;PWM USING PWM.c: 111: {
;PWM USING PWM.c: 112: while((ADCON0=0X01|0X04)==1);
	goto	l3065
	
l726:	
	goto	l3065
	
l725:	
	
l3065:	
	movlw	(05h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	xorlw	01h
	skipnz
	goto	u2481
	goto	u2480
u2481:
	goto	l3065
u2480:
	goto	l3067
	
l727:	
	line	113
	
l3067:	
;PWM USING PWM.c: 113: v=(ADRESH<<8)+ADRESL;
	movf	(30),w	;volatile
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	(??_main+0)+0,w
	movwf	(??_main+0)+1
	clrf	(??_main+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	addwf	0+(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_v)
	movlw	0
	skipnc
	movlw	1
	addwf	1+(??_main+0)+0,w
	movwf	1+(_v)
	line	114
	
l3069:	
;PWM USING PWM.c: 114: v=v/4;
	movlw	low(04h)
	movwf	(?___awdiv)
	movlw	high(04h)
	movwf	((?___awdiv))+1
	movf	(_v+1),w
	clrf	1+(?___awdiv)+02h
	addwf	1+(?___awdiv)+02h
	movf	(_v),w
	clrf	0+(?___awdiv)+02h
	addwf	0+(?___awdiv)+02h

	fcall	___awdiv
	movf	(1+(?___awdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_v+1)
	addwf	(_v+1)
	movf	(0+(?___awdiv)),w
	clrf	(_v)
	addwf	(_v)

	line	115
	
l3071:	
;PWM USING PWM.c: 115: Lcd_Command(0xCA);
	movlw	(0CAh)
	fcall	_Lcd_Command
	line	116
	
l3073:	
;PWM USING PWM.c: 116: divider(v);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_v+1),w
	clrf	(?_divider+1)
	addwf	(?_divider+1)
	movf	(_v),w
	clrf	(?_divider)
	addwf	(?_divider)

	fcall	_divider
	line	117
	
l3075:	
;PWM USING PWM.c: 117: _delay((unsigned long)((10)*(20e6/4000.0)));
	opt asmopt_off
movlw	65
movwf	((??_main+0)+0+1),f
	movlw	238
movwf	((??_main+0)+0),f
u2507:
	decfsz	((??_main+0)+0),f
	goto	u2507
	decfsz	((??_main+0)+0+1),f
	goto	u2507
	clrwdt
opt asmopt_on

	line	119
	
l3077:	
;PWM USING PWM.c: 119: pluse(v);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_v+1),w
	clrf	(?_pluse+1)
	addwf	(?_pluse+1)
	movf	(_v),w
	clrf	(?_pluse)
	addwf	(?_pluse)

	fcall	_pluse
	line	120
	
l3079:	
;PWM USING PWM.c: 120: _delay((unsigned long)((10)*(20e6/4000.0)));
	opt asmopt_off
movlw	65
movwf	((??_main+0)+0+1),f
	movlw	238
movwf	((??_main+0)+0),f
u2517:
	decfsz	((??_main+0)+0),f
	goto	u2517
	decfsz	((??_main+0)+0+1),f
	goto	u2517
	clrwdt
opt asmopt_on

	goto	l3065
	line	121
	
l728:	
	line	110
	goto	l3065
	
l729:	
	line	122
	
l730:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_divider
psect	text219,local,class=CODE,delta=2
global __ptext219
__ptext219:

;; *************** function _divider *****************
;; Defined at:
;;		line 59 in file "E:\02-CODING\05-LYCASOFT CODING\02-CODING\23-PWM USING POT\CODE\PWM USING PWM.c"
;; Parameters:    Size  Location     Type
;;  x               2    9[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  Temp            2    8[BANK0 ] int 
;;  Dig4            2    6[BANK0 ] int 
;;  Dig3            2    4[BANK0 ] int 
;;  Dig2            2    2[BANK0 ] int 
;;  Dig1            2    0[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0      10       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2      10       0       0       0
;;Total ram usage:       12 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___awmod
;;		___awdiv
;;		_Lcd_Data
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text219
	file	"E:\02-CODING\05-LYCASOFT CODING\02-CODING\23-PWM USING POT\CODE\PWM USING PWM.c"
	line	59
	global	__size_of_divider
	__size_of_divider	equ	__end_of_divider-_divider
	
_divider:	
	opt	stack 6
; Regs used in _divider: [wreg+status,2+status,0+pclath+cstack]
	line	62
	
l3007:	
;PWM USING PWM.c: 60: int Temp,Dig1,Dig2,Dig3,Dig4;
;PWM USING PWM.c: 62: Temp = x;
	movf	(divider@x+1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(divider@Temp+1)
	addwf	(divider@Temp+1)
	movf	(divider@x),w
	clrf	(divider@Temp)
	addwf	(divider@Temp)

	line	63
	
l3009:	
;PWM USING PWM.c: 63: Dig1 = Temp%10;
	movlw	low(0Ah)
	movwf	(?___awmod)
	movlw	high(0Ah)
	movwf	((?___awmod))+1
	movf	(divider@Temp+1),w
	clrf	1+(?___awmod)+02h
	addwf	1+(?___awmod)+02h
	movf	(divider@Temp),w
	clrf	0+(?___awmod)+02h
	addwf	0+(?___awmod)+02h

	fcall	___awmod
	movf	(1+(?___awmod)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(divider@Dig1+1)
	addwf	(divider@Dig1+1)
	movf	(0+(?___awmod)),w
	clrf	(divider@Dig1)
	addwf	(divider@Dig1)

	line	64
	
l3011:	
;PWM USING PWM.c: 64: Temp = Temp/10;
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	movf	(divider@Temp+1),w
	clrf	1+(?___awdiv)+02h
	addwf	1+(?___awdiv)+02h
	movf	(divider@Temp),w
	clrf	0+(?___awdiv)+02h
	addwf	0+(?___awdiv)+02h

	fcall	___awdiv
	movf	(1+(?___awdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(divider@Temp+1)
	addwf	(divider@Temp+1)
	movf	(0+(?___awdiv)),w
	clrf	(divider@Temp)
	addwf	(divider@Temp)

	line	65
	
l3013:	
;PWM USING PWM.c: 65: Dig2 = Temp%10;
	movlw	low(0Ah)
	movwf	(?___awmod)
	movlw	high(0Ah)
	movwf	((?___awmod))+1
	movf	(divider@Temp+1),w
	clrf	1+(?___awmod)+02h
	addwf	1+(?___awmod)+02h
	movf	(divider@Temp),w
	clrf	0+(?___awmod)+02h
	addwf	0+(?___awmod)+02h

	fcall	___awmod
	movf	(1+(?___awmod)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(divider@Dig2+1)
	addwf	(divider@Dig2+1)
	movf	(0+(?___awmod)),w
	clrf	(divider@Dig2)
	addwf	(divider@Dig2)

	line	66
	
l3015:	
;PWM USING PWM.c: 66: Temp = Temp/10;
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	movf	(divider@Temp+1),w
	clrf	1+(?___awdiv)+02h
	addwf	1+(?___awdiv)+02h
	movf	(divider@Temp),w
	clrf	0+(?___awdiv)+02h
	addwf	0+(?___awdiv)+02h

	fcall	___awdiv
	movf	(1+(?___awdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(divider@Temp+1)
	addwf	(divider@Temp+1)
	movf	(0+(?___awdiv)),w
	clrf	(divider@Temp)
	addwf	(divider@Temp)

	line	67
	
l3017:	
;PWM USING PWM.c: 67: Dig3 = Temp%10;
	movlw	low(0Ah)
	movwf	(?___awmod)
	movlw	high(0Ah)
	movwf	((?___awmod))+1
	movf	(divider@Temp+1),w
	clrf	1+(?___awmod)+02h
	addwf	1+(?___awmod)+02h
	movf	(divider@Temp),w
	clrf	0+(?___awmod)+02h
	addwf	0+(?___awmod)+02h

	fcall	___awmod
	movf	(1+(?___awmod)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(divider@Dig3+1)
	addwf	(divider@Dig3+1)
	movf	(0+(?___awmod)),w
	clrf	(divider@Dig3)
	addwf	(divider@Dig3)

	line	68
	
l3019:	
;PWM USING PWM.c: 68: Dig4 = Temp/10;
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	movf	(divider@Temp+1),w
	clrf	1+(?___awdiv)+02h
	addwf	1+(?___awdiv)+02h
	movf	(divider@Temp),w
	clrf	0+(?___awdiv)+02h
	addwf	0+(?___awdiv)+02h

	fcall	___awdiv
	movf	(1+(?___awdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(divider@Dig4+1)
	addwf	(divider@Dig4+1)
	movf	(0+(?___awdiv)),w
	clrf	(divider@Dig4)
	addwf	(divider@Dig4)

	line	70
	
l3021:	
;PWM USING PWM.c: 70: Lcd_Data(Dig4+48);
	movf	(divider@Dig4),w
	addlw	030h
	fcall	_Lcd_Data
	line	71
	
l3023:	
;PWM USING PWM.c: 71: Lcd_Data(Dig3+48);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(divider@Dig3),w
	addlw	030h
	fcall	_Lcd_Data
	line	72
	
l3025:	
;PWM USING PWM.c: 72: Lcd_Data(Dig2+48);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(divider@Dig2),w
	addlw	030h
	fcall	_Lcd_Data
	line	73
	
l3027:	
;PWM USING PWM.c: 73: Lcd_Data(Dig1+48);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(divider@Dig1),w
	addlw	030h
	fcall	_Lcd_Data
	line	74
	
l718:	
	return
	opt stack 0
GLOBAL	__end_of_divider
	__end_of_divider:
;; =============== function _divider ends ============

	signat	_divider,4216
	global	_Lcd_Intialization
psect	text220,local,class=CODE,delta=2
global __ptext220
__ptext220:

;; *************** function _Lcd_Intialization *****************
;; Defined at:
;;		line 52 in file "E:\02-CODING\05-LYCASOFT CODING\02-CODING\23-PWM USING POT\CODE\PWM USING PWM.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_Lcd_Command
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text220
	file	"E:\02-CODING\05-LYCASOFT CODING\02-CODING\23-PWM USING POT\CODE\PWM USING PWM.c"
	line	52
	global	__size_of_Lcd_Intialization
	__size_of_Lcd_Intialization	equ	__end_of_Lcd_Intialization-_Lcd_Intialization
	
_Lcd_Intialization:	
	opt	stack 6
; Regs used in _Lcd_Intialization: [wreg+status,2+status,0+pclath+cstack]
	line	53
	
l3005:	
;PWM USING PWM.c: 53: Lcd_Command(0x02);
	movlw	(02h)
	fcall	_Lcd_Command
	line	54
;PWM USING PWM.c: 54: Lcd_Command(0x28);
	movlw	(028h)
	fcall	_Lcd_Command
	line	55
;PWM USING PWM.c: 55: Lcd_Command(0x0c);
	movlw	(0Ch)
	fcall	_Lcd_Command
	line	56
	
l715:	
	return
	opt stack 0
GLOBAL	__end_of_Lcd_Intialization
	__end_of_Lcd_Intialization:
;; =============== function _Lcd_Intialization ends ============

	signat	_Lcd_Intialization,88
	global	_Lcd_String
psect	text221,local,class=CODE,delta=2
global __ptext221
__ptext221:

;; *************** function _Lcd_String *****************
;; Defined at:
;;		line 44 in file "E:\02-CODING\05-LYCASOFT CODING\02-CODING\23-PWM USING POT\CODE\PWM USING PWM.c"
;; Parameters:    Size  Location     Type
;;  Str             1    wreg     PTR const unsigned char 
;;		 -> STR_2(11), STR_1(9), 
;; Auto vars:     Size  Location     Type
;;  Str             1    4[COMMON] PTR const unsigned char 
;;		 -> STR_2(11), STR_1(9), 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_Lcd_Data
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text221
	file	"E:\02-CODING\05-LYCASOFT CODING\02-CODING\23-PWM USING POT\CODE\PWM USING PWM.c"
	line	44
	global	__size_of_Lcd_String
	__size_of_Lcd_String	equ	__end_of_Lcd_String-_Lcd_String
	
_Lcd_String:	
	opt	stack 6
; Regs used in _Lcd_String: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;Lcd_String@Str stored from wreg
	movwf	(Lcd_String@Str)
	line	45
	
l2997:	
;PWM USING PWM.c: 45: while(*Str != 0)
	goto	l3003
	
l710:	
	line	47
	
l2999:	
;PWM USING PWM.c: 46: {
;PWM USING PWM.c: 47: Lcd_Data(*Str++);
	movf	(Lcd_String@Str),w
	movwf	fsr0
	fcall	stringdir
	fcall	_Lcd_Data
	
l3001:	
	movlw	(01h)
	movwf	(??_Lcd_String+0)+0
	movf	(??_Lcd_String+0)+0,w
	addwf	(Lcd_String@Str),f
	goto	l3003
	line	48
	
l709:	
	line	45
	
l3003:	
	movf	(Lcd_String@Str),w
	movwf	fsr0
	fcall	stringdir
	iorlw	0
	skipz
	goto	u2471
	goto	u2470
u2471:
	goto	l2999
u2470:
	goto	l712
	
l711:	
	line	49
	
l712:	
	return
	opt stack 0
GLOBAL	__end_of_Lcd_String
	__end_of_Lcd_String:
;; =============== function _Lcd_String ends ============

	signat	_Lcd_String,4216
	global	_Lcd_Data
psect	text222,local,class=CODE,delta=2
global __ptext222
__ptext222:

;; *************** function _Lcd_Data *****************
;; Defined at:
;;		line 29 in file "E:\02-CODING\05-LYCASOFT CODING\02-CODING\23-PWM USING POT\CODE\PWM USING PWM.c"
;; Parameters:    Size  Location     Type
;;  Data            1    wreg     const unsigned char 
;; Auto vars:     Size  Location     Type
;;  Data            1    2[COMMON] const unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Lcd_String
;;		_divider
;; This function uses a non-reentrant model
;;
psect	text222
	file	"E:\02-CODING\05-LYCASOFT CODING\02-CODING\23-PWM USING POT\CODE\PWM USING PWM.c"
	line	29
	global	__size_of_Lcd_Data
	__size_of_Lcd_Data	equ	__end_of_Lcd_Data-_Lcd_Data
	
_Lcd_Data:	
	opt	stack 6
; Regs used in _Lcd_Data: [wreg+status,2+status,0]
;Lcd_Data@Data stored from wreg
	movwf	(Lcd_Data@Data)
	line	30
	
l2977:	
;PWM USING PWM.c: 30: PORTD = (Data & 0XF0);
	movf	(Lcd_Data@Data),w
	andlw	0F0h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	31
	
l2979:	
;PWM USING PWM.c: 31: RD2 = 1;
	bsf	(66/8),(66)&7
	line	32
	
l2981:	
;PWM USING PWM.c: 32: RD3 = 1;
	bsf	(67/8),(67)&7
	line	33
	
l2983:	
;PWM USING PWM.c: 33: _delay((unsigned long)((5)*(20e6/4000.0)));
	opt asmopt_off
movlw	33
movwf	((??_Lcd_Data+0)+0+1),f
	movlw	118
movwf	((??_Lcd_Data+0)+0),f
u2527:
	decfsz	((??_Lcd_Data+0)+0),f
	goto	u2527
	decfsz	((??_Lcd_Data+0)+0+1),f
	goto	u2527
	clrwdt
opt asmopt_on

	line	34
	
l2985:	
;PWM USING PWM.c: 34: RD3 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(67/8),(67)&7
	line	36
	
l2987:	
;PWM USING PWM.c: 36: PORTD = ((Data<<4) & 0xF0);
	movf	(Lcd_Data@Data),w
	movwf	(??_Lcd_Data+0)+0
	movlw	(04h)-1
u2465:
	clrc
	rlf	(??_Lcd_Data+0)+0,f
	addlw	-1
	skipz
	goto	u2465
	clrc
	rlf	(??_Lcd_Data+0)+0,w
	andlw	0F0h
	movwf	(8)	;volatile
	line	37
	
l2989:	
;PWM USING PWM.c: 37: RD2 = 1;
	bsf	(66/8),(66)&7
	line	38
	
l2991:	
;PWM USING PWM.c: 38: RD3 = 1;
	bsf	(67/8),(67)&7
	line	39
	
l2993:	
;PWM USING PWM.c: 39: _delay((unsigned long)((5)*(20e6/4000.0)));
	opt asmopt_off
movlw	33
movwf	((??_Lcd_Data+0)+0+1),f
	movlw	118
movwf	((??_Lcd_Data+0)+0),f
u2537:
	decfsz	((??_Lcd_Data+0)+0),f
	goto	u2537
	decfsz	((??_Lcd_Data+0)+0+1),f
	goto	u2537
	clrwdt
opt asmopt_on

	line	40
	
l2995:	
;PWM USING PWM.c: 40: RD3 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(67/8),(67)&7
	line	41
	
l706:	
	return
	opt stack 0
GLOBAL	__end_of_Lcd_Data
	__end_of_Lcd_Data:
;; =============== function _Lcd_Data ends ============

	signat	_Lcd_Data,4216
	global	_Lcd_Command
psect	text223,local,class=CODE,delta=2
global __ptext223
__ptext223:

;; *************** function _Lcd_Command *****************
;; Defined at:
;;		line 14 in file "E:\02-CODING\05-LYCASOFT CODING\02-CODING\23-PWM USING POT\CODE\PWM USING PWM.c"
;; Parameters:    Size  Location     Type
;;  cmd             1    wreg     const unsigned char 
;; Auto vars:     Size  Location     Type
;;  cmd             1    2[COMMON] const unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Lcd_Intialization
;;		_main
;; This function uses a non-reentrant model
;;
psect	text223
	file	"E:\02-CODING\05-LYCASOFT CODING\02-CODING\23-PWM USING POT\CODE\PWM USING PWM.c"
	line	14
	global	__size_of_Lcd_Command
	__size_of_Lcd_Command	equ	__end_of_Lcd_Command-_Lcd_Command
	
_Lcd_Command:	
	opt	stack 7
; Regs used in _Lcd_Command: [wreg+status,2+status,0]
;Lcd_Command@cmd stored from wreg
	movwf	(Lcd_Command@cmd)
	line	15
	
l2957:	
;PWM USING PWM.c: 15: PORTD = (cmd & 0XF0);
	movf	(Lcd_Command@cmd),w
	andlw	0F0h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	16
	
l2959:	
;PWM USING PWM.c: 16: RD2 = 0;
	bcf	(66/8),(66)&7
	line	17
	
l2961:	
;PWM USING PWM.c: 17: RD3 = 1;
	bsf	(67/8),(67)&7
	line	18
	
l2963:	
;PWM USING PWM.c: 18: _delay((unsigned long)((5)*(20e6/4000.0)));
	opt asmopt_off
movlw	33
movwf	((??_Lcd_Command+0)+0+1),f
	movlw	118
movwf	((??_Lcd_Command+0)+0),f
u2547:
	decfsz	((??_Lcd_Command+0)+0),f
	goto	u2547
	decfsz	((??_Lcd_Command+0)+0+1),f
	goto	u2547
	clrwdt
opt asmopt_on

	line	19
	
l2965:	
;PWM USING PWM.c: 19: RD3 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(67/8),(67)&7
	line	21
	
l2967:	
;PWM USING PWM.c: 21: PORTD = ((cmd<<4) & 0xF0);
	movf	(Lcd_Command@cmd),w
	movwf	(??_Lcd_Command+0)+0
	movlw	(04h)-1
u2455:
	clrc
	rlf	(??_Lcd_Command+0)+0,f
	addlw	-1
	skipz
	goto	u2455
	clrc
	rlf	(??_Lcd_Command+0)+0,w
	andlw	0F0h
	movwf	(8)	;volatile
	line	22
	
l2969:	
;PWM USING PWM.c: 22: RD2 = 0;
	bcf	(66/8),(66)&7
	line	23
	
l2971:	
;PWM USING PWM.c: 23: RD3 = 1;
	bsf	(67/8),(67)&7
	line	24
	
l2973:	
;PWM USING PWM.c: 24: _delay((unsigned long)((5)*(20e6/4000.0)));
	opt asmopt_off
movlw	33
movwf	((??_Lcd_Command+0)+0+1),f
	movlw	118
movwf	((??_Lcd_Command+0)+0),f
u2557:
	decfsz	((??_Lcd_Command+0)+0),f
	goto	u2557
	decfsz	((??_Lcd_Command+0)+0+1),f
	goto	u2557
	clrwdt
opt asmopt_on

	line	25
	
l2975:	
;PWM USING PWM.c: 25: RD3 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(67/8),(67)&7
	line	26
	
l703:	
	return
	opt stack 0
GLOBAL	__end_of_Lcd_Command
	__end_of_Lcd_Command:
;; =============== function _Lcd_Command ends ============

	signat	_Lcd_Command,4216
	global	___awmod
psect	text224,local,class=CODE,delta=2
global __ptext224
__ptext224:

;; *************** function ___awmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\awmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] int 
;;  dividend        2    2[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  sign            1    6[COMMON] unsigned char 
;;  counter         1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         7       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_divider
;; This function uses a non-reentrant model
;;
psect	text224
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 6
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
l2923:	
	clrf	(___awmod@sign)
	line	9
	btfss	(___awmod@dividend+1),7
	goto	u2361
	goto	u2360
u2361:
	goto	l2927
u2360:
	line	10
	
l2925:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	clrf	(___awmod@sign)
	bsf	status,0
	rlf	(___awmod@sign),f
	goto	l2927
	line	12
	
l1621:	
	line	13
	
l2927:	
	btfss	(___awmod@divisor+1),7
	goto	u2371
	goto	u2370
u2371:
	goto	l2931
u2370:
	line	14
	
l2929:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	goto	l2931
	
l1622:	
	line	15
	
l2931:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u2381
	goto	u2380
u2381:
	goto	l2949
u2380:
	line	16
	
l2933:	
	clrf	(___awmod@counter)
	bsf	status,0
	rlf	(___awmod@counter),f
	line	17
	goto	l2939
	
l1625:	
	line	18
	
l2935:	
	movlw	01h
	
u2395:
	clrc
	rlf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	addlw	-1
	skipz
	goto	u2395
	line	19
	
l2937:	
	movlw	(01h)
	movwf	(??___awmod+0)+0
	movf	(??___awmod+0)+0,w
	addwf	(___awmod@counter),f
	goto	l2939
	line	20
	
l1624:	
	line	17
	
l2939:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u2401
	goto	u2400
u2401:
	goto	l2935
u2400:
	goto	l2941
	
l1626:	
	goto	l2941
	line	21
	
l1627:	
	line	22
	
l2941:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u2415
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u2415:
	skipc
	goto	u2411
	goto	u2410
u2411:
	goto	l2945
u2410:
	line	23
	
l2943:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	skipc
	decf	(___awmod@dividend+1),f
	subwf	(___awmod@dividend+1),f
	goto	l2945
	
l1628:	
	line	24
	
l2945:	
	movlw	01h
	
u2425:
	clrc
	rrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	addlw	-1
	skipz
	goto	u2425
	line	25
	
l2947:	
	movlw	low(01h)
	subwf	(___awmod@counter),f
	btfss	status,2
	goto	u2431
	goto	u2430
u2431:
	goto	l2941
u2430:
	goto	l2949
	
l1629:	
	goto	l2949
	line	26
	
l1623:	
	line	27
	
l2949:	
	movf	(___awmod@sign),w
	skipz
	goto	u2440
	goto	l2953
u2440:
	line	28
	
l2951:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	goto	l2953
	
l1630:	
	line	29
	
l2953:	
	movf	(___awmod@dividend+1),w
	clrf	(?___awmod+1)
	addwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	clrf	(?___awmod)
	addwf	(?___awmod)

	goto	l1631
	
l2955:	
	line	30
	
l1631:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
	global	___awdiv
psect	text225,local,class=CODE,delta=2
global __ptext225
__ptext225:

;; *************** function ___awdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\awdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] int 
;;  dividend        2    2[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    7[COMMON] int 
;;  sign            1    6[COMMON] unsigned char 
;;  counter         1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         4       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         9       0       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_divider
;;		_main
;; This function uses a non-reentrant model
;;
psect	text225
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 6
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l2883:	
	clrf	(___awdiv@sign)
	line	10
	btfss	(___awdiv@divisor+1),7
	goto	u2261
	goto	u2260
u2261:
	goto	l2887
u2260:
	line	11
	
l2885:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	clrf	(___awdiv@sign)
	bsf	status,0
	rlf	(___awdiv@sign),f
	goto	l2887
	line	13
	
l1553:	
	line	14
	
l2887:	
	btfss	(___awdiv@dividend+1),7
	goto	u2271
	goto	u2270
u2271:
	goto	l2893
u2270:
	line	15
	
l2889:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l2891:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	xorwf	(___awdiv@sign),f
	goto	l2893
	line	17
	
l1554:	
	line	18
	
l2893:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	19
	
l2895:	
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u2281
	goto	u2280
u2281:
	goto	l2915
u2280:
	line	20
	
l2897:	
	clrf	(___awdiv@counter)
	bsf	status,0
	rlf	(___awdiv@counter),f
	line	21
	goto	l2903
	
l1557:	
	line	22
	
l2899:	
	movlw	01h
	
u2295:
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u2295
	line	23
	
l2901:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	addwf	(___awdiv@counter),f
	goto	l2903
	line	24
	
l1556:	
	line	21
	
l2903:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u2301
	goto	u2300
u2301:
	goto	l2899
u2300:
	goto	l2905
	
l1558:	
	goto	l2905
	line	25
	
l1559:	
	line	26
	
l2905:	
	movlw	01h
	
u2315:
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u2315
	line	27
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u2325
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u2325:
	skipc
	goto	u2321
	goto	u2320
u2321:
	goto	l2911
u2320:
	line	28
	
l2907:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	29
	
l2909:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	goto	l2911
	line	30
	
l1560:	
	line	31
	
l2911:	
	movlw	01h
	
u2335:
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	addlw	-1
	skipz
	goto	u2335
	line	32
	
l2913:	
	movlw	low(01h)
	subwf	(___awdiv@counter),f
	btfss	status,2
	goto	u2341
	goto	u2340
u2341:
	goto	l2905
u2340:
	goto	l2915
	
l1561:	
	goto	l2915
	line	33
	
l1555:	
	line	34
	
l2915:	
	movf	(___awdiv@sign),w
	skipz
	goto	u2350
	goto	l2919
u2350:
	line	35
	
l2917:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	goto	l2919
	
l1562:	
	line	36
	
l2919:	
	movf	(___awdiv@quotient+1),w
	clrf	(?___awdiv+1)
	addwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	clrf	(?___awdiv)
	addwf	(?___awdiv)

	goto	l1563
	
l2921:	
	line	37
	
l1563:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
	global	_pluse
psect	text226,local,class=CODE,delta=2
global __ptext226
__ptext226:

;; *************** function _pluse *****************
;; Defined at:
;;		line 77 in file "E:\02-CODING\05-LYCASOFT CODING\02-CODING\23-PWM USING POT\CODE\PWM USING PWM.c"
;; Parameters:    Size  Location     Type
;;  x               2    0[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  Temp            2    2[COMMON] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text226
	file	"E:\02-CODING\05-LYCASOFT CODING\02-CODING\23-PWM USING POT\CODE\PWM USING PWM.c"
	line	77
	global	__size_of_pluse
	__size_of_pluse	equ	__end_of_pluse-_pluse
	
_pluse:	
	opt	stack 7
; Regs used in _pluse: [wreg+status,2+status,0]
	line	79
	
l2879:	
;PWM USING PWM.c: 78: int Temp;
;PWM USING PWM.c: 79: Temp=x;
	movf	(pluse@x+1),w
	clrf	(pluse@Temp+1)
	addwf	(pluse@Temp+1)
	movf	(pluse@x),w
	clrf	(pluse@Temp)
	addwf	(pluse@Temp)

	line	80
	
l2881:	
;PWM USING PWM.c: 80: CCPR1L = Temp;
	movf	(pluse@Temp),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	81
	
l721:	
	return
	opt stack 0
GLOBAL	__end_of_pluse
	__end_of_pluse:
;; =============== function _pluse ends ============

	signat	_pluse,4216
psect	text227,local,class=CODE,delta=2
global __ptext227
__ptext227:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
