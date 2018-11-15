PImage rob1;
PImage rob2;
PImage landscape;
int startTime;
float x= 100;
float y= 100;
float xSpeed =3;
float ySpeed = 1;
float mapColor;
PFont storyFont;
Rob robert = new Rob (600,300);
Rob robertM = new Rob(200,500);
String string1 = "In a galaxy far away...";
String string2 = "Robert traveled aimlessly";
String string3 = "To find alternative versions of himself";
boolean glitchComplete = false;
boolean glitchSaved = false;
void setup() {
  size(1400, 788);
  smooth();
  //Load Images
  rob1 = loadImage("data/robert1.png");
  rob2 = loadImage("data/robert2.png");
  landscape = loadImage("data/landscape.png");
  //background(landscape);
  //load font
  startTime = millis();
  storyFont = createFont("BrandonGrotesqueBold.otf",32);
  textFont(storyFont,32);
  
}

void draw() { 
  loadPixels();
  //set backgrouhnd color
  background(255);
  image(landscape,0,0);
  //Add timed animation
 pushMatrix();
  if (millis() - startTime > 5000){ //&& millis() - startTime < 40000){
    animationRob();
    } 
 popMatrix();
 
 //Use map to generate a filter map for posterize amongst the y axis
    mapColor = map(mouseY,0,height,2,255);
   filter(POSTERIZE,mapColor);
    pushMatrix();
    translate(900,600);
    //call robert to move in a circle 
    robert.move();
    robert.display();
popMatrix();

pushMatrix();
//Display second robert image
translate(200,500);
//filter(THRESHOLD,200);
robertM.display();
popMatrix();

stroke(255);
//Display text 
 fill(random(100,140),random(100,140),random(150,255));
  text(string1, 30,750); 
   //Display text sentence 2 after 5 seconds
   if (millis() - startTime > 5000){ //&& millis() - startTime < 40000){
   
     text(string2, 350,750);
    
    }
    //Display text sentence 3 after 7 seconds
      if (millis() - startTime > 7000){ //&& millis() - startTime < 40000){
        
    text(string3, 750,750);
    }
   
   
   //Posterize filter for image map
   mapColor = map(mouseY,0,height,2,255);
   filter(POSTERIZE,mapColor);
   //When mouse is clicked load pixels to create a glitch effect
   if (mousePressed) {
     loadPixels();
     filter(THRESHOLD);
     //Keep track of whether or not the previous pixel was glitched
     boolean previousPixelGlitched = false;
     
    // Generate a new random color for RGB
    color randomColor = color(random(255), random(255), random(255), 255);

    // for each column of pixels
    for (int x = 0; x < width; x++) {

      // for each row of pixels
      for (int y = 0; y < height; y++) {

        // 25% chance to glitch this pixels, a second 80% chance if the previous pixel was glitched
        if (random(100) < 25 || (previousPixelGlitched == true && random(100) < 80))
        {
          
          previousPixelGlitched = true;

          // dilate filter
     
          // get the color for the pixel at coordinates x/y
          color pixelColor = pixels[y + x * height];

          // percentage to mix
          float mixPercentage = .8 + random(50)/100;

          // mix colors by random percentage of new random color
          pixels[y + x * height] =  lerpColor(pixelColor, randomColor, mixPercentage);
        } else
        {
          // didn't glitch this pixel
          previousPixelGlitched = false;

          randomColor = color(random(255), random(255), random(255), 255);
        }
      }
    }

    updatePixels();
    glitchComplete = true;
     
   }
   
   
   
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




  
