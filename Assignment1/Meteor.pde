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
    speed = random(7, 10);
    radius = random(3, 5);
  }
  
  //Meteor()
  //{
  //  super();
  //  speed = random(7, 10);
  //}
  
  void display()
  {
    noStroke();
    pushMatrix();
    translate(xpos, ypos);
    fill(255, 255, 0);
    ellipse(0, 0, radius*3.0f, radius*3.0f);
    fill(255, 0, 0);
    ellipse(0, 0, radius*1.5f, radius*1.5f);
    popMatrix();
  }
  
  void move()
  {
    xpos += speed;
    ypos += speed;
    if (xpos > width)
    {
      xpos = 0;
    }   
    if (ypos > height - border)
    {
      ypos = border/2.0f;
    }
  }
  
}