#line 1 "//Mac/Home/Desktop/MikroProject/microC/MikroDenetleyiciProje.c"







float sayma;
float frekans;
#line 23 "//Mac/Home/Desktop/MikroProject/microC/MikroDenetleyiciProje.c"
void main() {
#line 50 "//Mac/Home/Desktop/MikroProject/microC/MikroDenetleyiciProje.c"
ADCON0 = 0b10001110;;



TRISA = 0b00000001;


TRISB = 0;
TRISC = 0;
TRISD = 0;
TRISE = 0;


PORTA = 0;
PORTB = 0;
PORTC = 0;
PORTD = 0;
PORTE = 0;

ADC_Init();

while(1){


sayma = Adc_Read(0);




frekans = sayma *5;
frekans = frekans / 1024;
#line 93 "//Mac/Home/Desktop/MikroProject/microC/MikroDenetleyiciProje.c"
if (frekans <= 0 && frekans == 1 ) {

  PORTB.B6  = 1 ;
  PORTB.B5  = 0 ;
  PORTB.B4  = 0 ;
  PORTB.B3  = 0 ;
  PORTB.B2  = 0 ;
  PORTB.B1  = 0 ;

 } else if (frekans > 1 && frekans <= 2 ) {

  PORTB.B6  = 1 ;
  PORTB.B5  = 1 ;
  PORTB.B4  = 0 ;
  PORTB.B3  = 0 ;
  PORTB.B2  = 0 ;
  PORTB.B1  = 0 ;

 } else if (frekans > 2 && frekans <= 3) {

  PORTB.B6  = 1 ;
  PORTB.B5  = 1 ;
  PORTB.B4  = 1 ;
  PORTB.B3  = 0 ;
  PORTB.B2  = 0 ;
  PORTB.B1  = 0 ;

 } else if (frekans > 3 && frekans <= 4) {


  PORTB.B6  = 1 ;
  PORTB.B5  = 1 ;
  PORTB.B4  = 1 ;
  PORTB.B3  = 1 ;
  PORTB.B2  = 0 ;
  PORTB.B1  = 0 ;

 } else if (frekans > 4 && frekans <= 5) {

  PORTB.B6  = 1 ;
  PORTB.B5  = 1 ;
  PORTB.B4  = 1 ;
  PORTB.B3  = 1 ;
  PORTB.B2  = 1 ;
  PORTB.B1  = 0 ;

 } else if (frekans > 5 && frekans <= 6) {

  PORTB.B6  = 1 ;
  PORTB.B5  = 1 ;
  PORTB.B4  = 1 ;
  PORTB.B3  = 1 ;
  PORTB.B2  = 1 ;
  PORTB.B1  = 1 ;
 }

}



}
