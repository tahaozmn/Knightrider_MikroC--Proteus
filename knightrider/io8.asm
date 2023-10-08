
_main:

;io8.c,6 :: 		void main() {
;io8.c,7 :: 		TRISB=0;
	CLRF       TRISB+0
;io8.c,8 :: 		TRISC=0;
	CLRF       TRISC+0
;io8.c,9 :: 		ANSEL=ANSELH=0;
	CLRF       ANSELH+0
	CLRF       ANSEL+0
;io8.c,10 :: 		PORTC = 0b00010100;
	MOVLW      20
	MOVWF      PORTC+0
;io8.c,11 :: 		PORTB = 0b00101000;
	MOVLW      40
	MOVWF      PORTB+0
;io8.c,12 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	NOP
;io8.c,14 :: 		while(1)
L_main1:
;io8.c,17 :: 		if(PORTB >= 0b10100000 && sag_b==1)
	MOVLW      160
	SUBWF      PORTB+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main5
	MOVLW      0
	XORWF      _sag_b+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main40
	MOVLW      1
	XORWF      _sag_b+0, 0
L__main40:
	BTFSS      STATUS+0, 2
	GOTO       L_main5
L__main38:
;io8.c,19 :: 		sol_b=1;
	MOVLW      1
	MOVWF      _sol_b+0
	MOVLW      0
	MOVWF      _sol_b+1
;io8.c,20 :: 		}
L_main5:
;io8.c,22 :: 		if(PORTB >= 0b10100000 || sol_b==1)
	MOVLW      160
	SUBWF      PORTB+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L__main37
	MOVLW      0
	XORWF      _sol_b+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main41
	MOVLW      1
	XORWF      _sol_b+0, 0
L__main41:
	BTFSC      STATUS+0, 2
	GOTO       L__main37
	GOTO       L_main8
L__main37:
;io8.c,24 :: 		PORTB = PORTB>>1;
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;io8.c,25 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	NOP
;io8.c,26 :: 		sag_b=0;
	CLRF       _sag_b+0
	CLRF       _sag_b+1
;io8.c,27 :: 		}
L_main8:
;io8.c,29 :: 		if(PORTB <= 0b00000101 && sol_b==1)
	MOVF       PORTB+0, 0
	SUBLW      5
	BTFSS      STATUS+0, 0
	GOTO       L_main12
	MOVLW      0
	XORWF      _sol_b+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main42
	MOVLW      1
	XORWF      _sol_b+0, 0
L__main42:
	BTFSS      STATUS+0, 2
	GOTO       L_main12
L__main36:
;io8.c,31 :: 		sag_b=1;
	MOVLW      1
	MOVWF      _sag_b+0
	MOVLW      0
	MOVWF      _sag_b+1
;io8.c,32 :: 		}
L_main12:
;io8.c,34 :: 		if(PORTB <= 0b00000101 || sag_b==1)
	MOVF       PORTB+0, 0
	SUBLW      5
	BTFSC      STATUS+0, 0
	GOTO       L__main35
	MOVLW      0
	XORWF      _sag_b+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main43
	MOVLW      1
	XORWF      _sag_b+0, 0
L__main43:
	BTFSC      STATUS+0, 2
	GOTO       L__main35
	GOTO       L_main15
L__main35:
;io8.c,36 :: 		PORTB = PORTB<<1;
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;io8.c,37 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main16:
	DECFSZ     R13+0, 1
	GOTO       L_main16
	DECFSZ     R12+0, 1
	GOTO       L_main16
	NOP
;io8.c,38 :: 		sol_b=0;
	CLRF       _sol_b+0
	CLRF       _sol_b+1
;io8.c,39 :: 		}
L_main15:
;io8.c,40 :: 		if(PORTB >= 0b10100000 && sag_c==1)
	MOVLW      160
	SUBWF      PORTB+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main19
	MOVLW      0
	XORWF      _sag_c+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main44
	MOVLW      1
	XORWF      _sag_c+0, 0
L__main44:
	BTFSS      STATUS+0, 2
	GOTO       L_main19
L__main34:
;io8.c,42 :: 		sol_c=1;
	MOVLW      1
	MOVWF      _sol_c+0
	MOVLW      0
	MOVWF      _sol_c+1
;io8.c,43 :: 		}
L_main19:
;io8.c,45 :: 		if(PORTB >= 0b10100000 || sol_c==1)
	MOVLW      160
	SUBWF      PORTB+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L__main33
	MOVLW      0
	XORWF      _sol_c+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main45
	MOVLW      1
	XORWF      _sol_c+0, 0
L__main45:
	BTFSC      STATUS+0, 2
	GOTO       L__main33
	GOTO       L_main22
L__main33:
;io8.c,47 :: 		PORTB = PORTB>>1;
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;io8.c,48 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main23:
	DECFSZ     R13+0, 1
	GOTO       L_main23
	DECFSZ     R12+0, 1
	GOTO       L_main23
	NOP
;io8.c,49 :: 		sag_c=0;
	CLRF       _sag_c+0
	CLRF       _sag_c+1
;io8.c,50 :: 		}
L_main22:
;io8.c,52 :: 		if(PORTB <= 0b00000101 && sol_c==1)
	MOVF       PORTB+0, 0
	SUBLW      5
	BTFSS      STATUS+0, 0
	GOTO       L_main26
	MOVLW      0
	XORWF      _sol_c+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main46
	MOVLW      1
	XORWF      _sol_c+0, 0
L__main46:
	BTFSS      STATUS+0, 2
	GOTO       L_main26
L__main32:
;io8.c,54 :: 		sag_c=1;
	MOVLW      1
	MOVWF      _sag_c+0
	MOVLW      0
	MOVWF      _sag_c+1
;io8.c,55 :: 		}
L_main26:
;io8.c,57 :: 		if(PORTB <= 0b00000101 || sag_c==1)
	MOVF       PORTB+0, 0
	SUBLW      5
	BTFSC      STATUS+0, 0
	GOTO       L__main31
	MOVLW      0
	XORWF      _sag_c+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main47
	MOVLW      1
	XORWF      _sag_c+0, 0
L__main47:
	BTFSC      STATUS+0, 2
	GOTO       L__main31
	GOTO       L_main29
L__main31:
;io8.c,59 :: 		PORTB = PORTB<<1;
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;io8.c,60 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main30:
	DECFSZ     R13+0, 1
	GOTO       L_main30
	DECFSZ     R12+0, 1
	GOTO       L_main30
	NOP
;io8.c,61 :: 		sol_c=0;
	CLRF       _sol_c+0
	CLRF       _sol_c+1
;io8.c,62 :: 		}
L_main29:
;io8.c,63 :: 		}
	GOTO       L_main1
;io8.c,64 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
