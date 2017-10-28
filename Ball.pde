  public class Ball{
    int circleDiameter = 200;          //Diameter of the circle
    int circleX = width/2;             //circle starting X position
    double circleY = circleDiameter/2; //circle starting Y position
    double speedY = 0;                  //circle starting speedY
    double gravity = 7;                //gravity felt by the circle 
    boolean taken = false;
    int errorX;
    int errorY;
    
    public Ball(int circleDiameter, int circleX, double circleY, double speedY, double gravity){
      
      this.circleDiameter = circleDiameter;
      this.circleX = circleX;
      this.circleY = circleY;
      this.speedY = speedY;
      this.gravity = gravity;
    
    }
    
    public void update(){
      
      
      if(!taken){
        speedY += gravity;                 //speedY and gravity updates
        circleY += speedY;  
      }else{
        
        speedY=0;
        circleX=mouseX-errorX;
        circleY=mouseY-errorY;
      }                               
  
      if(circleY+circleDiameter/2 >=height - heightV){   //corrections in order to remain in the bounds
    
        circleY = height - heightV - circleDiameter/2;
        speedY=-speedY;
   
      }
   
      isTaken();
      
      ellipse(circleX,(int)circleY,circleDiameter, circleDiameter);
      
      
    }
    
    public void isTaken(){
      if(mousePressed){
      
        if((mouseX-circleX<circleDiameter/2 && mouseX-circleX>-circleDiameter/2)&&
      (mouseY-circleY<circleDiameter/2 && mouseY-circleY>-circleDiameter/2)){
        taken=true;
        errorX=mouseX-circleX;
        errorY=mouseY-(int)circleY;
    
        }
      }else{
        if(taken){
      
          taken=false;
        }
      }
    
    }
    
    
    
    
  }