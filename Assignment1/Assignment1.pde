import processing.sound.*;

float border = height * 1.5f;
int qtyStar = 50;
Star myStar[] = new Star[qtyStar];

Radar radar;

boolean keys[] = new boolean[1024];

Control control;

boolean space = false;

SoundFile sound; 

void setup()
{
  size(600, 600);
  //fullScreen();
 
  for (int i = 0; i < qtyStar; i ++)
  {
    myStar[i] = new Star(border);
  }
  
  radar = new Radar(width / 2, height - (border/2));
  
  control = new Control(border);
  
  sound = new SoundFile(this, "UFO.mp3");
}

void draw()
{
  background(0);
  stroke(0, 255, 0);
  fill(255);


  if (space == true)
  {
    drawGrid();
    control.targetPoint();
    control.targetdisplay();
    control.shipdisplay();
    control.update();
    control.mapdisplay();
  }
  
  //drawGrid();
  drawAbove();
  drawBelow();
  drawButton();
  
  radar.render();
  radar.update();
  
  for (int i = 0; i < qtyStar; i ++)
  {
    myStar[i].display();
    myStar[i].move();
  }
  
  if (space == true)
  {
    control.targetPoint();
    control.targetdisplay();
    control.shipdisplay();
    control.update();
    control.mapdisplay();
  }
  
}

void drawGrid()
{
  line(0, height - border, width, height - border);
  
  for(int xg = 0 ; xg <= 5 ; xg ++)
  {
    float xpos = map(xg, 0, 5, 0, width);
    float ypos = map(xg, 0, 5, border / 2, height - border);
    
    line(0, ypos, width, ypos);
    line(xpos, border / 2, xpos, height - border);   
  }  
}

void drawAbove()
{
  stroke(255);
  strokeWeight(1);
  fill(0, 255, 0, 20);
  rect(0, 0, width, border / 2);
}

void drawBelow()
{
  stroke(255);
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

void drawButton()
{
  ////stroke(255);
  //fill(0, 255, 0);
  //rect(width - border, height - border/2.0f, width - border/2.0f, height - border/4.0f);
  //fill(255);
  ////textAlign(CENTER, CENTER);
  //text("Ship", (width - border/1.3f), (height - border/4.0f) - 15 );
  
  fill(0, 255, 0, 20);
  rect(width - width/3.0f, height - border, width, height);
  stroke(255);
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
    sound.play();
  }
  
  if (mouseX > width - (width/3.0f) && mouseX < width && mouseY > height - border/2.0f && mouseY < height)
  {
    space = false;
    sound.play();
  }
}

void keyPressed()
{
  println("Key pressed");
  keys[keyCode] = true;
}

void keyReleased()
{
  println("Key released");
  keys[keyCode] = false;
}

boolean checkKey(int k)
{
  return keys[Character.toLowerCase(k)] || keys[Character.toUpperCase(k)]; 
}