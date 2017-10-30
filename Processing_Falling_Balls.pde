  import java.util.*;
  int width = 1900;                  //window width
  int height = 1700;                 //window height
  int heightV  = 200 ;               //floor height ( 0 means ground level )
  
  LinkedList<Ball> fauna = new LinkedList();
  Ball palla1 = new Ball("palla1",200, (int)0, 0,8 ,1,"carnivoro");
  Ball palla2 = new Ball("palla2",150, (int) 201,0,0,7,"erbivoro");
  Ball palla3 = new Ball("palla3",50, (int) 252,0,0,7,"erbivoro");
  Ball palla4 = new Ball("palla4",180, (int) 433,0,0,7,"erbivoro");
  Ball palla5 = new Ball("palla5",50, (int) 484,0,0,7,"erbivoro");
  Ball palla6 = new Ball("palla6",160, (int) 645,0,0,7,"erbivoro");
  Ball palla7 = new Ball("palla7",240, (int) 886,0,0,7,"erbivoro");
  Ball palla8 = new Ball("palla8",100, (int) 987,0,0,7,"erbivoro");
  Ball palla9 = new Ball("palla9",50, (int) 1100,0,0,7,"erbivoro");
  Ball palla10 = new Ball("palla10",100, (int) 1287,0,0,7,"erbivoro");
  Ball palla11 = new Ball("palla11",50, (int) 1400,0,0,7,"erbivoro");
  Ball palla12 = new Ball("palla12",100, (int) 1587,0,0,7,"erbivoro");
  Ball palla13 = new Ball("palla13",50, (int) 1700,0,8,1,"carnivoro");
  


  
  


  

    
void setup(){

  fauna.add(palla1);
  fauna.add(palla2);
  fauna.add(palla3);
  fauna.add(palla4);
  fauna.add(palla5);
  fauna.add(palla6);
  fauna.add(palla7);
  fauna.add(palla8);
  fauna.add(palla9);
  fauna.add(palla10);
  fauna.add(palla11);
  fauna.add(palla12);
  fauna.add(palla13);
  

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