/*play,pause,reverse,forward FullStop
1]player connects index finger to tumb.
2]arduino searches file index for first .wav file.
3]RGB led lights up(Fade) green to show a song is playing.
4]arduino plays .wav file.

5]the user presses the "Full Stop" button(on palm).
6] RGB fades out then lights up read.
*/
const int RLed = 3; //Pins for RGB led
const int GLed = 5; //
const int BLed = 6; //

int fing1Pin = 8;int fing1Trig; //Pins for finger/switchs
int fing2Pin = 9;int fing2Trig; //
int fing3Pin = 10;int fing3Trig; //
int fing4Pin = 11;int fing4Trig; //


void setup(){
  Serial.begin(9600);
  pinMode(RLed, OUTPUT);
  pinMode(GLed, OUTPUT);
  pinMode(BLed, OUTPUT);
  
  pinMode(fing1Pin, INPUT);
  pinMode(fing2Pin, INPUT);
  pinMode(fing3Pin, INPUT);
  pinMode(fing4Pin, INPUT);
}

void loop(){
  //read if the button is pressed
  fing1Trig = digitalRead(fing1Pin);
  fing2Trig = digitalRead(fing2Pin);
  fing3Trig = digitalRead(fing3Pin);
  fing4Trig = digitalRead(fing4Pin);
  
   if(fing1Trig == HIGH){
     ColorLED(0,200,0);
     Serial.write(1);
     delay(50);
     Serial.write(0);
     delay(100);
  }
  
  if(fing2Trig == HIGH){
    ColorLED(255,0,0);
    Serial.write(2);
    delay(50);
    Serial.write(0);
    delay(100);
  }
  
  if(fing3Trig == HIGH){
    ColorLED(0,200,200);
    Serial.write(3);
    delay(50);
    Serial.write(0);
    delay(100);
  }
  
  if(fing4Trig == HIGH){
    ColorLED(150,0,200);
    Serial.write(4);
    delay(50);
    Serial.write(0);
    delay(100);
  }
  
}

void ColorLED(int col1, int col2, int col3){ 
  analogWrite(RLed, col1); //lights up the RGB led based on indivdual color codes
  analogWrite(GLed, col2); //
  analogWrite(BLed, col3); //
}
