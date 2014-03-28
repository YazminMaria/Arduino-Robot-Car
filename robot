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
 for(int i=50; i<90; i++)
 {
  Rightservo.write(i);
 }
 for(int i=110; i<180; i++)
 {
  Leftservo.write(i);
 }
}

void leftForward()
{
 for(int i=110; i<180; i++)
 {
  Rightservo.write(i);
 }
 for(int i=50; i<90; i++)
 {
  Leftservo.write(i);
 }
}


void loop() 
{
  
  if (irrecv.decode(&results))
  {
    if (results.value==0x490)//volume up button
    {
      rightForward(); 
    }
    else if(results.value==0xC90) //Volume down button
    {
      leftForward();
    }
    else if(results.value==0x90) //Channel up button
    {
      forward();
    }
    else if(results.value==0x890) //Channel down button
    {
      reverse();
    }
     for(int z=0; z<2; z++){
    irrecv.resume();
  }
  }
} 
