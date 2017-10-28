  public class Ball{
    int circleDiameter = 200;          //Diameter of the circle
    int circleX = width/2;             //circle starting X position
    double circleY = circleDiameter/2; //circle starting Y position
    double speedY = 0;                  //circle starting speedY
    double gravity = 7;                //gravity felt by the circle 
    
    public Ball(int circleDiameter, int circleX, double circleY, double speedY, double gravity){
      
      this.circleDiameter = circleDiameter;
      this.circleX = circleX;
      this.circleY = circleY;
      this.speedY = speedY;
      this.gravity = gravity;
    
    }
    
    public void update(){
      
      speedY += gravity;                 //speedY and gravity updates
      circleY += speedY;  
      if(circleY+circleDiameter/2 >=height - heightV){   //corrections in order to remain in the bounds
    
        circleY = height - heightV - circleDiameter/2;
        speedY=-speedY;
      }
      
      ellipse(circleX,(int)circleY,circleDiameter, circleDiameter);
      
    }
    
    
    
    
  }