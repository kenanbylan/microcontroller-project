
_main:

;MikroDenetleyiciProje.c,23 :: 		void main() {
;MikroDenetleyiciProje.c,50 :: 		ADCON0 = 0b10001110;; //0.+5V giris,
	MOVLW      142
	MOVWF      ADCON0+0
;MikroDenetleyiciProje.c,54 :: 		TRISA = 0b00000001;
	MOVLW      1
	MOVWF      TRISA+0
;MikroDenetleyiciProje.c,57 :: 		TRISB = 0;
	CLRF       TRISB+0
;MikroDenetleyiciProje.c,58 :: 		TRISC = 0;
	CLRF       TRISC+0
;MikroDenetleyiciProje.c,59 :: 		TRISD = 0;
	CLRF       TRISD+0
;MikroDenetleyiciProje.c,60 :: 		TRISE = 0;
	CLRF       TRISE+0
;MikroDenetleyiciProje.c,63 :: 		PORTA = 0;
	CLRF       PORTA+0
;MikroDenetleyiciProje.c,64 :: 		PORTB = 0;
	CLRF       PORTB+0
;MikroDenetleyiciProje.c,65 :: 		PORTC = 0;
	CLRF       PORTC+0
;MikroDenetleyiciProje.c,66 :: 		PORTD = 0;
	CLRF       PORTD+0
;MikroDenetleyiciProje.c,67 :: 		PORTE = 0;
	CLRF       PORTE+0
;MikroDenetleyiciProje.c,69 :: 		ADC_Init();
	CALL       _ADC_Init+0
;MikroDenetleyiciProje.c,71 :: 		while(1){
L_main0:
;MikroDenetleyiciProje.c,74 :: 		sayma = Adc_Read(0); //AN0 kanalindan deger okundu ve sonuc float tipindeki degiskene atandi.
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _word2double+0
	MOVF       R0+0, 0
	MOVWF      _sayma+0
	MOVF       R0+1, 0
	MOVWF      _sayma+1
	MOVF       R0+2, 0
	MOVWF      _sayma+2
	MOVF       R0+3, 0
	MOVWF      _sayma+3
;MikroDenetleyiciProje.c,79 :: 		frekans = sayma *5;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _frekans+0
	MOVF       R0+1, 0
	MOVWF      _frekans+1
	MOVF       R0+2, 0
	MOVWF      _frekans+2
	MOVF       R0+3, 0
	MOVWF      _frekans+3
;MikroDenetleyiciProje.c,80 :: 		frekans = frekans / 1024;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      137
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _frekans+0
	MOVF       R0+1, 0
	MOVWF      _frekans+1
	MOVF       R0+2, 0
	MOVWF      _frekans+2
	MOVF       R0+3, 0
	MOVWF      _frekans+3
;MikroDenetleyiciProje.c,93 :: 		if (frekans <= 0 && frekans == 1 ) {
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	CLRF       R0+0
	CLRF       R0+1
	CLRF       R0+2
	CLRF       R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main4
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      127
	MOVWF      R4+3
	MOVF       _frekans+0, 0
	MOVWF      R0+0
	MOVF       _frekans+1, 0
	MOVWF      R0+1
	MOVF       _frekans+2, 0
	MOVWF      R0+2
	MOVF       _frekans+3, 0
	MOVWF      R0+3
	CALL       _Equals_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main4
L__main30:
;MikroDenetleyiciProje.c,95 :: 		LED1 = 1 ;
	BSF        PORTB+0, 6
;MikroDenetleyiciProje.c,96 :: 		LED2 = 0 ;
	BCF        PORTB+0, 5
;MikroDenetleyiciProje.c,97 :: 		LED3 = 0 ;
	BCF        PORTB+0, 4
;MikroDenetleyiciProje.c,98 :: 		LED4 = 0 ;
	BCF        PORTB+0, 3
;MikroDenetleyiciProje.c,99 :: 		LED5 = 0 ;
	BCF        PORTB+0, 2
;MikroDenetleyiciProje.c,100 :: 		LED6 = 0 ;
	BCF        PORTB+0, 1
;MikroDenetleyiciProje.c,102 :: 		} else if (frekans >  1 && frekans <= 2  ) {
	GOTO       L_main5
L_main4:
	MOVF       _frekans+0, 0
	MOVWF      R4+0
	MOVF       _frekans+1, 0
	MOVWF      R4+1
	MOVF       _frekans+2, 0
	MOVWF      R4+2
	MOVF       _frekans+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      0
	MOVWF      R0+2
	MOVLW      127
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main8
	MOVF       _frekans+0, 0
	MOVWF      R4+0
	MOVF       _frekans+1, 0
	MOVWF      R4+1
	MOVF       _frekans+2, 0
	MOVWF      R4+2
	MOVF       _frekans+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      0
	MOVWF      R0+2
	MOVLW      128
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main8
L__main29:
;MikroDenetleyiciProje.c,104 :: 		LED1  = 1 ;
	BSF        PORTB+0, 6
;MikroDenetleyiciProje.c,105 :: 		LED2 = 1 ;
	BSF        PORTB+0, 5
;MikroDenetleyiciProje.c,106 :: 		LED3 = 0 ;
	BCF        PORTB+0, 4
;MikroDenetleyiciProje.c,107 :: 		LED4 = 0 ;
	BCF        PORTB+0, 3
;MikroDenetleyiciProje.c,108 :: 		LED5 = 0 ;
	BCF        PORTB+0, 2
;MikroDenetleyiciProje.c,109 :: 		LED6 = 0 ;
	BCF        PORTB+0, 1
;MikroDenetleyiciProje.c,111 :: 		} else if (frekans > 2 && frekans <= 3) {
	GOTO       L_main9
L_main8:
	MOVF       _frekans+0, 0
	MOVWF      R4+0
	MOVF       _frekans+1, 0
	MOVWF      R4+1
	MOVF       _frekans+2, 0
	MOVWF      R4+2
	MOVF       _frekans+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      0
	MOVWF      R0+2
	MOVLW      128
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main12
	MOVF       _frekans+0, 0
	MOVWF      R4+0
	MOVF       _frekans+1, 0
	MOVWF      R4+1
	MOVF       _frekans+2, 0
	MOVWF      R4+2
	MOVF       _frekans+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      64
	MOVWF      R0+2
	MOVLW      128
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main12
L__main28:
;MikroDenetleyiciProje.c,113 :: 		LED1  = 1 ;
	BSF        PORTB+0, 6
;MikroDenetleyiciProje.c,114 :: 		LED2 = 1 ;
	BSF        PORTB+0, 5
;MikroDenetleyiciProje.c,115 :: 		LED3 = 1 ;
	BSF        PORTB+0, 4
;MikroDenetleyiciProje.c,116 :: 		LED4 = 0 ;
	BCF        PORTB+0, 3
;MikroDenetleyiciProje.c,117 :: 		LED5 = 0 ;
	BCF        PORTB+0, 2
;MikroDenetleyiciProje.c,118 :: 		LED6 = 0 ;
	BCF        PORTB+0, 1
;MikroDenetleyiciProje.c,120 :: 		} else if (frekans > 3 && frekans <= 4) {
	GOTO       L_main13
L_main12:
	MOVF       _frekans+0, 0
	MOVWF      R4+0
	MOVF       _frekans+1, 0
	MOVWF      R4+1
	MOVF       _frekans+2, 0
	MOVWF      R4+2
	MOVF       _frekans+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      64
	MOVWF      R0+2
	MOVLW      128
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main16
	MOVF       _frekans+0, 0
	MOVWF      R4+0
	MOVF       _frekans+1, 0
	MOVWF      R4+1
	MOVF       _frekans+2, 0
	MOVWF      R4+2
	MOVF       _frekans+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      0
	MOVWF      R0+2
	MOVLW      129
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main16
L__main27:
;MikroDenetleyiciProje.c,123 :: 		LED1  = 1 ;
	BSF        PORTB+0, 6
;MikroDenetleyiciProje.c,124 :: 		LED2 = 1 ;
	BSF        PORTB+0, 5
;MikroDenetleyiciProje.c,125 :: 		LED3 = 1 ;
	BSF        PORTB+0, 4
;MikroDenetleyiciProje.c,126 :: 		LED4 = 1 ;
	BSF        PORTB+0, 3
;MikroDenetleyiciProje.c,127 :: 		LED5 = 0 ;
	BCF        PORTB+0, 2
;MikroDenetleyiciProje.c,128 :: 		LED6 = 0 ;
	BCF        PORTB+0, 1
;MikroDenetleyiciProje.c,130 :: 		} else if (frekans > 4 && frekans <= 5) {
	GOTO       L_main17
L_main16:
	MOVF       _frekans+0, 0
	MOVWF      R4+0
	MOVF       _frekans+1, 0
	MOVWF      R4+1
	MOVF       _frekans+2, 0
	MOVWF      R4+2
	MOVF       _frekans+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      0
	MOVWF      R0+2
	MOVLW      129
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main20
	MOVF       _frekans+0, 0
	MOVWF      R4+0
	MOVF       _frekans+1, 0
	MOVWF      R4+1
	MOVF       _frekans+2, 0
	MOVWF      R4+2
	MOVF       _frekans+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      32
	MOVWF      R0+2
	MOVLW      129
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main20
L__main26:
;MikroDenetleyiciProje.c,132 :: 		LED1 = 1 ;
	BSF        PORTB+0, 6
;MikroDenetleyiciProje.c,133 :: 		LED2 = 1 ;
	BSF        PORTB+0, 5
;MikroDenetleyiciProje.c,134 :: 		LED3 = 1 ;
	BSF        PORTB+0, 4
;MikroDenetleyiciProje.c,135 :: 		LED4 = 1 ;
	BSF        PORTB+0, 3
;MikroDenetleyiciProje.c,136 :: 		LED5 = 1 ;
	BSF        PORTB+0, 2
;MikroDenetleyiciProje.c,137 :: 		LED6 = 0 ;
	BCF        PORTB+0, 1
;MikroDenetleyiciProje.c,139 :: 		}  else if (frekans > 5 && frekans <= 6) {
	GOTO       L_main21
L_main20:
	MOVF       _frekans+0, 0
	MOVWF      R4+0
	MOVF       _frekans+1, 0
	MOVWF      R4+1
	MOVF       _frekans+2, 0
	MOVWF      R4+2
	MOVF       _frekans+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      32
	MOVWF      R0+2
	MOVLW      129
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main24
	MOVF       _frekans+0, 0
	MOVWF      R4+0
	MOVF       _frekans+1, 0
	MOVWF      R4+1
	MOVF       _frekans+2, 0
	MOVWF      R4+2
	MOVF       _frekans+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      64
	MOVWF      R0+2
	MOVLW      129
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main24
L__main25:
;MikroDenetleyiciProje.c,141 :: 		LED1 = 1 ;
	BSF        PORTB+0, 6
;MikroDenetleyiciProje.c,142 :: 		LED2 = 1 ;
	BSF        PORTB+0, 5
;MikroDenetleyiciProje.c,143 :: 		LED3 = 1 ;
	BSF        PORTB+0, 4
;MikroDenetleyiciProje.c,144 :: 		LED4 = 1 ;
	BSF        PORTB+0, 3
;MikroDenetleyiciProje.c,145 :: 		LED5 = 1 ;
	BSF        PORTB+0, 2
;MikroDenetleyiciProje.c,146 :: 		LED6 = 1 ;
	BSF        PORTB+0, 1
;MikroDenetleyiciProje.c,147 :: 		}
L_main24:
L_main21:
L_main17:
L_main13:
L_main9:
L_main5:
;MikroDenetleyiciProje.c,149 :: 		}
	GOTO       L_main0
;MikroDenetleyiciProje.c,153 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
