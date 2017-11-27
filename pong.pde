import processing.serial.*;

Serial my_port;
char val = '4';

int num_val;

//player x and y coordinates
int player_x = 10;
int player_y = 20;

//ball x and y coordinates
int ball_x = 100;
//int ball_y = 20;
int ball_y = 120;

int player_collider = player_x + 65;

//testing
int x_movement = 10;

int y_movement = 10;


int score = 0;

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
 rect(player_x, player_y, 50, 100);
 
 ellipse(ball_x,ball_y,30,30);
 //x 750
 //y 475
  if (my_port.available() > 0)
  {
   val = my_port.readChar();
  }
  
  pot_check();

  
  ball_x = ball_x  + x_movement;
  ball_y = ball_y + y_movement;
  
  //bouncing off x edges
  if (ball_x  >= 775){
    x_movement = -10;     
  }
 
 //bouncing off y edges
 if (ball_y <= 15){
  y_movement = 10; 
 }
 if (ball_y >= 475){
  y_movement = -10;
 }
  
//end of draw
//player_collider = 75 in left bound testing

//player and ball collision

if (ball_x <= player_collider && (ball_y >= player_y && ball_y <= player_y + 100)){
   x_movement = 10; 
   score ++;
  }
  
  //if paddle and ball dont hit 
  //GAME OVER BRANCH
else if (ball_x <= 0){
 
  textSize(100);
  text("gameOver", 10, 200); 
  delay(1000);
  //text(score,10,260);
  
 
  //delay(000);
  //score = 0;
  }

//score ++;
//end of main function
  }
  
  
  
 
  
void pot_check(){
    
  if (val >= '0' && val < '4'){
   player_y = player_y - 110; 
   println("moving up");
  }
  else if (val >= '4' && val <= '5'){
    //no change to block
   player_y = player_y; 
   println("staying still");
  }
  else if (val > '5' && val <='9'){
   player_y = player_y + 110; 
   println( "moving down");
  }
  
  //player bound checking
  if ( player_y <= 0){
    player_y = 0;
  }
  if ( player_y >= 395){
    player_y = 395;
  }
  
  //end of pot_check function
} 
    
    
    
    
    
    //TO DO 
    //ADD SCORING 
    // FIX GAME OVER BRANCH
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
  //x left bound testing (should not use in actual game because it should bounce off when hit with paddle
  /*
  if (ball_x <= 75){
   x_movement = 10; 
  }
 */