import processing.sound.*;

float border = height * 1.5f;
int qtyStar = 50;
int qtyMeteor = 20;

Star myStar[] = new Star[qtyStar];
Meteor myMeteor[] = new Meteor[qtyStar];

Radar radar;

boolean keys[] = new boolean[1024];

Control control;

// check ship take-off / landing
boolean space = false;

// chosse backgrounds
boolean BG = true;


// check take-off / landing button
boolean Bcol = true;

// check star / meteor button
boolean BGcol = true;

// chnage planets
boolean planet = true;

// sound files
SoundFile landing; 
SoundFile takeOff; 
SoundFile spaceSound;
SoundFile meteorSound;
SoundFile starSound;

//ArrayList<Planet> planets = new ArrayList<Planet>();

//int mode = 0;

void setup()
{
  //size(600, 600);
  fullScreen();
 
  for (int i = 0; i < qtyStar; i ++)
  {
    myStar[i] = new Star();
  }
  for (int i = 0; i < qtyMeteor; i ++)
  {
    myMeteor[i] = new Meteor();
  }

  radar = new Radar(width/6.0f, height - border/2.0f);
  
  control = new Control(border);
  
  landing = new SoundFile(this, "UFOLanding.mp3");
  takeOff = new SoundFile(this, "UFOTakeOff.mp3");
  spaceSound = new SoundFile(this, "space.mp3");
  meteorSound = new SoundFile(this, "meteor.mp3");
  starSound = new SoundFile(this, "star.mp3");
  
  spaceSound.play();
}

void draw()
{
  background(0);
  //stroke(0, 255, 0);
  fill(255);
  
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
  drawBackground();
  drawBelow();
  drawShipButton();
  
  if (BG)
  {
    for (int i = 0; i < qtyStar; i ++)
    {
      myStar[i].display();
      myStar[i].move();
    }
  }
  else
  {
    for (int i = 0; i < qtyMeteor; i ++)
    {
      myMeteor[i].display();
      myMeteor[i].move();
    }
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
  rect(0, 0, width, border / 2.0f);
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

void drawBackground()
{
  textAlign(CENTER);
  textSize(15);
  fill(0, 255, 0);
  text("Stars", width/4.0f, border/4.0f);
  text("Meteor", width/2.0f + width/4.0f, border/4.0f); 
  
  if (BGcol)
  {
    fill(255, 0, 0, 20);
    rect(0, 0, width/2.0f, border/2.0f);
    fill(0, 255, 0, 20);
    rect(width/2.0f, 0, width, border/2.0f);
  }
  else
  {
    fill(0, 255, 0, 20);
    rect(0, 0, width/2.0f, border/2.0f);
    fill(255, 0, 0, 20);
    rect(width/2.0f, 0, width, border/2.0f);
  }
  
  stroke(0, 255, 0);
  line(width/2.0f, 0, width/2.0f, border/2.0f);
}

void mousePressed()
{
  // take-off
  if (mouseX > width - (width/3.0f) && mouseX < width && mouseY > height - border && mouseY < height - border/2.0f)
  {
    space = true;
    Bcol = false;
    takeOff.play();
  }
  
  // landing
  if (mouseX > width - (width/3.0f) && mouseX < width && mouseY > height - border/2.0f && mouseY < height)
  {
    space = false;
    Bcol = true;
    landing.play();
  }
  
  // stars
  if (mouseX > 0 && mouseX < width/2.0f && mouseY > 0 && mouseY < border/2.0f)
  {
    BG = true;
    BGcol = true;
    starSound.play();
  }
  
  // meteors
  if (mouseX > width/2.0f && mouseX < width && mouseY > 0 && mouseY < border/2.0f)
  {
    BG = false;
    BGcol = false;
    meteorSound.play();
  }
}