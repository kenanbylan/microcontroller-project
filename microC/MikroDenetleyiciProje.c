#define LED6 PORTB.B1
#define LED5 PORTB.B2
#define LED4 PORTB.B3
#define LED3 PORTB.B4
#define LED2 PORTB.B5
#define LED1 PORTB.B6

float sayma;
float frekans;

/*
void interrupt(){


if(CCP1IF){  //böyle bir flag varmi sorgulariz.
     CCP1IF_bit = 0;  //int flag resetler
     TMR1L=0;  //timer resetler
     TMR1H=0;
}
}
*/

void main() {

 //TRISB = 0; //TÜM B PORTLARI CIKIS YAPILDI.
 //interrupt()
 
  //TRISB = 0x00;
  //T1CON = 0x21;

  //CCPR1L = 0x00;
  //CCPR1L = 0x00;
  //CCP1CON = 0x05;

  // CCP1 modül: tek yükselen kenar yakalama modu,
  //INTCON.GIE =1; // GIE : Tüm kesmeler için izin
  //INTCON.PEIE=1; //// PEIE: kesme izin
  //CCP1IE_bit= 1; // CCP1: kesme izin
  //TMR1L = 0x00;
  //TMR1H = 0x00; //register reset ;


//char txt[7];
//int okunan = 0;
//char value = 0;

//ADCON0 = 0b10001110; // bu komuT ile sadece AN0 girisi analog yapildigi digerleri digital 10 bit dönüþümlerde sonuc saga yasli.
         // an0 hariç digerleir digital an0 analog sinyal girdisi aliriz.

ADCON0 = 0b10001110;; //0.+5V giris,
//ADCON1 = 0b00001000;
//ADCON1=0x80;

TRISA = 0b00000001;
//TRISA = 0xFF; //port a giris;

TRISB = 0;
TRISC = 0;
TRISD = 0;
TRISE = 0;

//port adan led baglarsan hepsi sonuk gelir.
PORTA = 0;
PORTB = 0;
PORTC = 0;
PORTD = 0;
PORTE = 0;

ADC_Init();

while(1){


sayma = Adc_Read(0); //AN0 kanalindan deger okundu ve sonuc float tipindeki degiskene atandi.
//okunan = okunan / 170;


//sayma 0...1023
frekans = sayma *5;
frekans = frekans / 1024;

//0 - 0
// 2.5 - 512
// 5V - 1023


//sayma=CCPR1H;
//sayma=sayma<<8;  //ayrik 2x8 bit veriyi
//sayma=sayma+CCPR1L; // degiskene aktarma

//frekans=500000/Sayma; // frekans degerine çevirme;

if (frekans <= 0 && frekans == 1 ) {

   LED1 = 1 ;
   LED2 = 0 ;
   LED3 = 0 ;
   LED4 = 0 ;
   LED5 = 0 ;
   LED6 = 0 ;

 } else if (frekans >  1 && frekans <= 2  ) {

   LED1  = 1 ;
   LED2 = 1 ;
   LED3 = 0 ;
   LED4 = 0 ;
   LED5 = 0 ;
   LED6 = 0 ;

 } else if (frekans > 2 && frekans <= 3) {

   LED1  = 1 ;
   LED2 = 1 ;
   LED3 = 1 ;
   LED4 = 0 ;
   LED5 = 0 ;
   LED6 = 0 ;

 } else if (frekans > 3 && frekans <= 4) {


   LED1  = 1 ;
   LED2 = 1 ;
   LED3 = 1 ;
   LED4 = 1 ;
   LED5 = 0 ;
   LED6 = 0 ;

 } else if (frekans > 4 && frekans <= 5) {

   LED1 = 1 ;
   LED2 = 1 ;
   LED3 = 1 ;
   LED4 = 1 ;
   LED5 = 1 ;
   LED6 = 0 ;

 }  else if (frekans > 5 && frekans <= 6) {

   LED1 = 1 ;
   LED2 = 1 ;
   LED3 = 1 ;
   LED4 = 1 ;
   LED5 = 1 ;
   LED6 = 1 ;
 }

}



}