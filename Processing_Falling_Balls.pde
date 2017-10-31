  import java.util.*;
  int width = 3500;                  //window width
  int height = 1900;                 //window height
  int heightV  = 200 ;               //floor height ( 0 means ground level )
  
  LinkedList<Ball> fauna = new LinkedList();

  Random dado = new Random();

    
void setup(){


  for(int i = 0; i<=13;i++){

    fauna.add( new Ball(("palla"+i),dado.nextInt(width/14)+16, dado.nextInt(width), 0,dado.nextInt(5) ,dado.nextInt(7),"erbivoro"));
  }

  fauna.add( new Ball("pallaX",200, (int)0, 0,8 ,1,"carnivoro"));

  for( Ball palla : fauna){


    for(Ball pallan : fauna){

      palla.addInteractor(pallan);
    }
  }
  
 
  surface.setSize(width,height);     //setting up window dimensions
 
           
  
}

void draw(){
  
  background(0);                    //black background
  
  stroke(255,255,0);                  //limit line color (in RGB)

  fill(0,0,255);
  
  
  
  
  rect(0,height - heightV,width,0); //limit line creator
 


 

  
  



  for(Ball palla: fauna){

    palla.update();
  }


 
 

  
  
  
  
 
  
  
}