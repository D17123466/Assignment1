import processing.sound.*;

float border = height * 1.5f;
int qtyStar = 50;
Star myStar[] = new Star[qtyStar];

Radar radar;

boolean keys[] = new boolean[1024];

Control control;

// check ship take-off / landing
boolean space = false;

// check take-off / landing button
boolean Bcol = true;

// sound files
SoundFile landing; 
SoundFile takeOff; 

void setup()
{
  size(600, 600);
  //fullScreen();
 
  for (int i = 0; i < qtyStar; i ++)
  {
    myStar[i] = new Star(border);
  }
  
  radar = new Radar(width/6.0f, height - border/2.0f);
  
  control = new Control(border);
  
  landing = new SoundFile(this, "UFOLanding.mp3");
  takeOff = new SoundFile(this, "UFOTakeOff.mp3");
}

void draw()
{
  background(0);
  //stroke(0, 255, 0);
  //fill(255);


  if (space == true)
  {
    drawGrid();
    control.targetPoint();
    control.targetdisplay();
    control.shipdisplay();
    control.update();
    control.mapdisplay();
    radar.render();
    radar.update();
  }
  
  //drawGrid();
  drawAbove();
  drawBelow();
  drawShipButton();
  
  //radar.render();
  //radar.update();
  
  for (int i = 0; i < qtyStar; i ++)
  {
    myStar[i].display();
    myStar[i].move();
  }
  
}

void drawGrid()
{
  stroke(0, 255, 0, 20);
  //strokeWeight(2);
  line(0, height - border, width, height - border);
  
  for(int xg = 0 ; xg <= 10 ; xg ++)
  {
    float xpos = map(xg, 0, 10, 0, width);
    float ypos = map(xg, 0, 10, border / 2, height - border);
    
    line(0, ypos, width, ypos);
    line(xpos, border / 2, xpos, height - border);   
  }  
}

void drawAbove()
{
  stroke(0, 255, 0);
  strokeWeight(2);
  fill(0, 255, 0, 20);
  rect(0, 0, width, border / 2);
}

void drawBelow()
{
  stroke(0, 255, 0);
  //strokeWeight(1);
  fill(0, 255, 0, 20);
  
  // background
  rect(0, height - border, width, height);
  
  // make three space
  for (float x = 1; x <= 4; x ++)
  {
    float lx = map(x, 1, 4, 0, width);
    line(lx, height - border, lx, height);
  }
}

void drawShipButton()
{
  textAlign(CENTER);
  //strokeWeight(3);
  textSize(15);
  fill(0, 255, 0);
  text("TakeOff", width - width/6.0f, height - border/1.5f);
  text("Landing", width - width/6.0f, height - border/4.0f);
  
  if (Bcol)
  {
    fill(0, 255, 0, 20);
    rect(width - width/3.0f, height - border, width, height - border/2.0f);
    fill(255, 0, 0, 20);
    rect(width - width/3.0f, height - border/2.0f, width, height);
  }
  else
  {
    fill(255, 0, 0, 20);
    rect(width - width/3.0f, height - border, width, height - border/2.0f);
    fill(0, 255, 0, 20);
    rect(width - width/3.0f, height - border/2.0f, width, height);
  }
  
  //rect(width - width/3.0f, height - border, width, height);
  
  stroke(0, 255, 0);
  line(width - (width/3.0f), height - border/2.0f, width, height - border/2.0f);
  
}

void mousePressed()
{
  //if (mouseX > width - border && mouseX < width - border/2.0f && mouseY > height - border/2.0f && mouseY < height - border/4.0f)
  //{
  //  space = true;
  //  sound.play();
  //}
  if (mouseX > width - (width/3.0f) && mouseX < width && mouseY > height - border && mouseY < height - border/2.0f)
  {
    space = true;
    Bcol = false;
    takeOff.play();
  }
  
  if (mouseX > width - (width/3.0f) && mouseX < width && mouseY > height - border/2.0f && mouseY < height)
  {
    space = false;
    Bcol = true;
    landing.play();
  }
}

//void keyPressed()
//{
//  println("Key pressed");
//  keys[keyCode] = true;
//}

//void keyReleased()
//{
//  println("Key released");
//  keys[keyCode] = false;
//}

//boolean checkKey(int k)
//{
//  return keys[Character.toLowerCase(k)] || keys[Character.toUpperCase(k)]; 
//}