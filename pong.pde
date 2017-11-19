import processing.serial.*;

Serial my_port;
char val = '4';

int num_val;

//x and y coordinates
int x = 10;
int y = 20;

void setup(){
  size(800,500);
  background(0,0,0);
  noStroke();
  
  //SERIAL SETUP
  //CHANGE PORTNAME TO MATCH ARDUINO PORT
  String port_name = "/dev/ttyUSB0";
  my_port = new Serial(this,port_name,9600);
  //rect(x, y, 60, 120);
}


void draw(){
  //testing rect
  //rect(x,y,60,120);
  
 background(0,0,0);
 rect(x, y, 50, 100);
 
  if (my_port.available() > 0)
  {
   val = my_port.readChar();
  }
  
  pot_check();
  
  
  
  
  
  //end of draw

  }
  
  
  
  void pot_check(){
    
  if (val >= '0' && val < '4'){
   y = y - 120; 
   println("moving up");
  }
  else if (val >= '4' && val <= '5'){
   y = y; 
   println("staying still");
  }
  else if (val > '5' && val <='9'){
   y = y + 120; 
   println( "moving down");
  }
  if ( y <= 0){
    y = 0;
  }
  if ( y >= 380){
    y = 380;
  }
  } 
    
  /*
  println(val);
    if (val == '4'){
   y = y - 120; 
   println("moving down");
}
*/

//THIS WORKS
/*
  void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      y -= 10;
    } else if (keyCode == DOWN) {
      y += 10;
    }
  }
}
  */