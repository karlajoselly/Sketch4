PImage rob1;
PImage rob2;
PImage landscape;
PImage astronaut;
int mosaicSize = 12;
int startTime;
float x= 100;
float y= 100;
float xSpeed =3;
float ySpeed = 1;
float mapColor;
Rob robert = new Rob (600,300);;

void setup() {
  size(1400, 788);
  smooth();
  //Load Images
  rob1 = loadImage("data/robert1.png");
  rob2 = loadImage("data/robert2.png");
  landscape = loadImage("data/landscape.png");
  //background(landscape);
  startTime = millis();

}

void draw() { 
  loadPixels();
  background(255);
  image(landscape,0,0);
  //Add timed animation
 pushMatrix();
  if (millis() - startTime > 5000){ //&& millis() - startTime < 40000){
    animationRob();
    } 
    popMatrix();
    mapColor = map(mouseY,0,height,2,255);
   filter(POSTERIZE,mapColor);
    translate(900,600);
    robert.move();
    robert.display();

    println(width);
}
void animationRob(){
//scale image


x= x + xSpeed;
y= y + ySpeed;
//Set image boundaries
if((x > width) || (x<0)) {
  xSpeed = xSpeed *-1;
}
if((y > height) || (y<0)) {
  ySpeed = ySpeed *-1;
}
scale(0.3);
image(rob1,x,y);


}


  
