int potPin = A0;
int val;
int map_val;

void setup() {
  Serial.begin(9600);
  pinMode(potPin,INPUT);
}

void loop() {
  /*
int sensorValue = analogRead(potPin);
Serial.println(sensorValue);
*/

//to use with processing

val = analogRead(potPin);
map_val = map(val,0,1023,0,9);
String my_str = String(map_val);
Serial.println(my_str);
delay(300);
}
