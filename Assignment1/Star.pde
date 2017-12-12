class Star
{  
  float xpos;
  float ypos;
  float speed;
  float radius;
  
  Star()
  {
    xpos = random(width);
    ypos = random(border / 2, height - (border - 0.1f));
    speed = random(0.5f, 1.5f);
    radius = random(3, 5);
  }
  //Star()
  //{
  //  super();  
  //}
  
  void display()
  {
    noStroke();
    fill(255);
    pushMatrix();
    translate(xpos, ypos);
    ellipse(0, 0, radius, radius);
    popMatrix();
  }
  
  void move()
  {
    xpos += speed;
    if (xpos > width)
    {
      xpos = 0;
    }
  }
 
}