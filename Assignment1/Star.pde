class Star
{  
  float xpos;
  float ypos;
  float speed;
  float radius;
  
  Star(float border)
  {
    xpos = random(width);
    ypos = random(border / 2, height - (border - 0.1f));
    speed = random(1, 2);
    radius = random(3, 5);
  }
  
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
    //if (checkKey('a'))
    //{
    //  xpos += speed;
    //  if (xpos > width)
    //  {
    //    xpos = 0;
    //  }
    //}
    
    //if (checkKey('d'))
    //{
    //  xpos -= speed;
    //  if (xpos < 0)
    //  {
    //    xpos = width;
    //  }
    //}
    
    //if (checkKey('s'))
    //{
    //  ypos -= speed;
    //  if (ypos < border / 2)
    //  {
    //    ypos = height - border;
    //  }
    //}
    
    //if (checkKey('w'))
    //{
    //  ypos += speed;
    //  if (ypos >height - border)
    //  {
    //    ypos = border / 2;
    //  }
    //}
    
    xpos += speed;
    if (xpos > width)
    {
      xpos = 0;
    }
  }
  
}