#include <Arduino.h>
#include <Servo.h>

const int SERVO_LEFT = D0;
const int SERVO_RIGHT = D1;
Servo servo_left;
Servo servo_right;
int servo_left_ctr = 90;
int servo_right_ctr = 90;
unsigned long times;
void setup() {
    Serial.begin(115200);

    servo_left.attach(SERVO_LEFT);
    servo_right.attach(SERVO_RIGHT);

}

void loop() {
  times = millis();
  while(millis()-times<=5000){
    drive(180,90);
    }
}

void drive(int left, int right) {
  servo_left.write(left);
  servo_right.write(right);
}
