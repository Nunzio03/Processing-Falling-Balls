  
  int width = 1900;                  //window width
  int height = 1700;                 //window height
  int heightV  = 200 ;               //floor height ( 0 means ground level )
  int circleDiameter = 200;          //Diameter of the circle
  int circleX = width/2;             //circle starting X position
  double circleY = circleDiameter/2; //circle starting Y position
  double speedY = 0;                  //circle starting speedY
  double gravity = 7;                //gravity felt by the circle 
  boolean taken=false;
  int errorX;
  int errorY;
  
  
void setup(){ 

 
  surface.setSize(width,height);     //setting up window dimensions
 
           
  
}

void draw(){
  
  background(0);                    //black background
  
  stroke(255,255,255);                  //limit line color (in RGB)
  
  fill(0,0,255);
  
  rect(0,height - heightV,width,0); //limit line creator
  
  
  if(!taken){
    speedY += gravity;                 //speedY and gravity updates
    circleY += speedY;  
  }else{
      speedY=0;
      circleX=mouseX-errorX;
      circleY=mouseY-errorY;
    }                               //
  
  if(circleY+circleDiameter/2 >=height - heightV){   //corrections in order to remain in the bounds
    
    circleY = height - heightV - circleDiameter/2;
    speedY=-speedY;
   
  }
    //<>//

  ellipse(circleX,(int)circleY,circleDiameter, circleDiameter);
  
 
  
  
}

void mousePressed(){
  if((mouseX-circleX<circleDiameter/2 && mouseX-circleX>-circleDiameter/2)&&
  (mouseY-circleY<circleDiameter/2 && mouseY-circleY>-circleDiameter/2)){
    taken=true;
    errorX=mouseX-circleX;
    errorY=mouseY-(int)circleY;
    
  }
}

void mouseReleased(){
  
  if(taken){
      
    taken=false;
  }
  
}