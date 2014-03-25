#include <IRremote.h>

#include <Servo.h> 
int receiverpin=8;
IRrecv irrecv(receiverpin);
decode_results results;

Servo Rightservo;
Servo Leftservo;

void setup() 
{ 
  Rightservo.attach(9,90,180);
  Leftservo.attach(10,90,180);
   Serial.begin(9600);
  irrecv.enableIRIn();

} 

void forward(){
 for(int i=110; i<180; i++)
 {
  Rightservo.write(i);
}
for(int i=110; i<180; i++)
{
Leftservo.write(i);
}  
}

void reverse(){
 for(int i=50; i<90; i++)
 {
  Rightservo.write(i);
}
 for(int i=50; i<90; i++)
{
 Leftservo.write(i);
}
}

void rightForward()
{
  for(int i=110; i<18; i++)
{
Leftservo.write(i);
Rightservo.write(90);
}
}

void leftForward()
{
  for(int i=50; i<90; i++)
{
Rightservo.write(i);
Leftservo.write(90);
}
}


void loop() 
{
 if(irrecv.decode(&results)){
  if(results.value==0x090){
    forward();
  }
  else if(results.value==0x890){
    reverse();
  }
   else if(results.value==0x490){
     rightForward();
   }
   else if(results.value==0xC90){
     leftForward();
   }
    for(int z=0; z<2; z++){
    irrecv.resume();
  }
} 
