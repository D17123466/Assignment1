class Meteor
{  
  float xpos;
  float ypos;
  float speed;
  float radius;
  
  Meteor()
  {
    xpos = random(width);
    ypos = random(border / 2, height - (border - 0.1f));
    speed = random(3, 5);
    radius = random(3, 5);
  }
  
  void display()
  {
    noStroke();
    pushMatrix();
    translate(xpos, ypos);
    fill(255, 255, 0);
    ellipse(0, 0, radius*1.5f, radius*1.5f);
    fill(255, 0, 0);
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