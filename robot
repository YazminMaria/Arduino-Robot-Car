
#include <Servo.h> 

Servo Rightservo;
Servo Leftservo;

void setup() 
{ 
  Rightservo.attach(9,90,180);
  Leftservo.attach(10,90,180);
} 

void foward(){
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
leftForward();
} 
