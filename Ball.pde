  import java.util.*;

  public class Ball{

    //parameters, the initialized values are just suggested values (except for the boolean parameter "taken") 
    // (in the constructor infact the wil be ovewrited)
    private String name;
    private int circleDiameter;          //Diameter of the circle : 200
    private double circleX;          //circle starting X position : width/2;
    private double circleY; //circle starting Y position : circleDiameter/2
    private double speedY;                  //circle starting speedY : 0
    private double gravity;                //gravity felt by the circle : 7
    private String breed = "";

    private boolean taken = false;             // boolean value that senses if the object is picked by the mouse
    private int errorX;                        
    private int errorY;
    private LinkedList<Ball> interactors = new LinkedList();  //list of others balls that can interact with this ball
    

    public Ball(String name, int circleDiameter, int circleX, double circleY, double speedY, double gravity,String breed){
      this.name=name;
      this.circleDiameter = circleDiameter;
      this.circleX = circleX;
      this.circleY = circleY;
      this.speedY = speedY;
      this.gravity = gravity;
      this.breed = breed;
    
    }

//___________________________UPDATE METHOD_________________________________________________
    
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


      ellipse((int)circleX,(int)circleY,circleDiameter, circleDiameter);   //drawing the ball


     
      
    }

//____________________________________________BASICS__________________________________________________________
    
    public void isTaken(){                            //method made in order to verify if the object is picked or not
      if(mousePressed){
      
        if(Math.sqrt( Math.pow(circleX-mouseX, 2) + Math.pow(circleY-mouseY,2)) <= 
          (circleDiameter/2)){
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

//____________________________________ACTIONS_________________________________________
    public void addInteractor(Ball ball){        //method that adds an object to the list of the objects that can interact with this ball 

      interactors.add(ball);
    }

     public void decrease(){

      circleDiameter -= 1;
    }
    


//___________________________________GETTERS AND SETTERS____________________________
    
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

    public String getBreed(){

      return breed;

    }

   







    

    public void interacting(){

      for(Ball interactor : interactors){


        if(Math.sqrt( Math.pow(circleX-interactor.getX(), 2) + Math.pow(circleY-interactor.getY(),2)) <= 
          ((circleDiameter/2)+interactor.getDiameter()/2)){

          //code if two balls are interacting

          if(breed=="carnivoro" && interactor.getBreed()=="erbivoro" &&interactor.getDiameter()>0){
            circleDiameter+=1;
            interactor.decrease();
          }

        }else{


          //code if they're not interacting

          
        }
      }

    }

}
    