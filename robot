#include <Servo.h> 

Servo leftservo;
Servo rightservo;


void setup() 
{ 
  leftservo.attach(10);
  leftservo.write(90);
  rightservo.attach(9);
  rightservo.write(90);
} 

void loop() {
leftservo.write(0);
rightservo.write(0);
} 
