int sag_b=0;
int sol_b=1;
int sag_c=1;
int sol_c=0;

void main() {
TRISB=0;
TRISC=0;
ANSEL=ANSELH=0;
PORTC = 0b00010100;
PORTB = 0b00101000;
delay_ms(10);

while(1)
{

if(PORTB >= 0b10100000 && sag_b==1)
{
sol_b=1;
}

if(PORTB >= 0b10100000 || sol_b==1)
{
PORTB = PORTB>>1;
delay_ms(10);
sag_b=0;
}

if(PORTB <= 0b00000101 && sol_b==1)
{
sag_b=1;
}

if(PORTB <= 0b00000101 || sag_b==1)
{
PORTB = PORTB<<1;
delay_ms(10);
sol_b=0;
}
   if(PORTB >= 0b10100000 && sag_c==1)
{
sol_c=1;
}

if(PORTB >= 0b10100000 || sol_c==1)
{
PORTB = PORTB>>1;
delay_ms(10);
sag_c=0;
}

if(PORTB <= 0b00000101 && sol_c==1)
{
sag_c=1;
}

if(PORTB <= 0b00000101 || sag_c==1)
{
PORTB = PORTB<<1;
delay_ms(10);
sol_c=0;
}
}
}