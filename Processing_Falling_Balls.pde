  
  int width = 1900;                  //window width
  int height = 1700;                 //window height
  int heightV  = 200 ;               //floor height ( 0 means ground level )
  Ball palla1 = new Ball(200, width/2, 0,0 ,2);
  Ball palla2 = new Ball(100, (int)width/3, 0,0 ,4);
  Ball palla3 = new Ball(300, (int) width-500,0,0,7);
  

    
void setup(){
  

  
  
  
 
  surface.setSize(width,height);     //setting up window dimensions
 
           
  
}

void draw(){
  
  background(0);                    //black background
  
  stroke(255,255,0);                  //limit line color (in RGB)
  
  fill(0,0,255);
  
  rect(0,height - heightV,width,0); //limit line creator
 
  palla1.update();
  palla2.update();
  palla3.update();
  
  
  
  
 
  
  
}