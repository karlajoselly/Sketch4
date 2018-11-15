class Rob{
  
  float x ,y, radSec ;
  
  Rob( float xTemp, float yTemp) {
     x=xTemp;
     y=yTemp;
     radSec =2;
  }
  
  void display () {
    pushMatrix();
    PImage rob2;
    scale(0.5);
    rob2 = loadImage("data/robert2.png");
    
    rotate(radians(radSec));
    image(rob2, -rob2.width/x,-rob2.height/y);
    popMatrix();
    
  }
  void move () {
    radSec = radSec+5;
   
    x= x + xSpeed;
    y= y + ySpeed;
    //Set image boundaries
    if((x > width) || (x<0)) {
      xSpeed = xSpeed *-1;
    }
    if((y > height) || (y<0)) {
      ySpeed = ySpeed *-1;
    }
    
  }
  
}
