  import java.util.*;

  public class Ball{

    //parameters, the initialized values are just suggested values (except for the boolean parameter "taken") 
    // (in the constructor infact the wil be ovewrited)
    private String name;
    private int circleDiameter = 200;          //Diameter of the circle
    private double circleX = width/2;             //circle starting X position
    private double circleY = circleDiameter/2; //circle starting Y position
    private double speedY = 0;                  //circle starting speedY
    private double gravity = 7;                //gravity felt by the circle 
    private boolean taken = false;             // boolean value that senses if the object is picked by the mouse

    private int errorX;                        
    private int errorY;
    private LinkedList<Ball> interactors = new LinkedList();  //list of others balls that can interact with this ball
    
    public Ball(String name, int circleDiameter, int circleX, double circleY, double speedY, double gravity){
      this.name=name;
      this.circleDiameter = circleDiameter;
      this.circleX = circleX;
      this.circleY = circleY;
      this.speedY = speedY;
      this.gravity = gravity;
    
    }
    
    public void update(){            //speed and position updates
      
      

      if(!taken){               //normal updates
        speedY += gravity;                 
        circleY += speedY;  
      }else{                    //updates if the object is picked 
        
        speedY=0;
        circleX=mouseX-errorX;
        circleY=mouseY-errorY;
      }                               
  
      if(circleY+circleDiameter/2 >=height - heightV){   //corrections in order to remain in the screen bounds
    
        circleY = height - heightV - circleDiameter/2;
        speedY=-speedY;
   
      }
   
      isTaken();
      
      interacting();
      ellipse((int)circleX,(int)circleY,circleDiameter, circleDiameter);   //drawing of the ball
      
      
    }
    
    public void isTaken(){                            //method made in order to verify if the object is picked or not
      if(mousePressed){
      
        if((Math.abs(mouseX-circleX)<circleDiameter/2 )&&(Math.abs(mouseY-circleY)<circleDiameter/2)){
        taken=true;
        errorX=mouseX-(int)circleX;
        errorY=mouseY-(int)circleY;
    
        }
      }else{
        if(taken){
      
          taken=false;
        }
      }
    
    }
    


    
    
    public int getX(){
      return (int) circleX;
    }
    
    public int getY(){
      return (int) circleY;
    }
    
    public int getDiameter(){
      return circleDiameter;
    }

    public String getName(){

      return name;
    }







    public void addInteractor(Ball ball){        //method that adds an object to the list of the objects that can interact with this ball 

      interactors.add(ball);
    }

    public void interacting(){

      for(Ball interactor : interactors){


        if(Math.sqrt( Math.pow(circleX-interactor.getX(), 2) + Math.pow(circleY-interactor.getY(),2)) <= 
          ((circleDiameter/2)+interactor.getDiameter()/2)){

          fill(255,0,0);
        }else{
          fill(0,0,255);
        }


    
    
    
    }

  }

}
    