class Radar
{
  float xpos, ypos;
  float radius;
  float theta;
  float speed;
  float frequency;
  
  Radar(float cx, float cy)
  {
    xpos = cx; 
    ypos = cy;
    radius = 60;
    frequency = 0.5;
    speed = (TWO_PI / 60.0) * frequency;
    this.theta = 0;
  }
  
  void update()
  {
    theta += speed;
  }
  
  void render()
  {
    stroke(255, 20);
    noFill();
    fill(0, 255, 0, 10);
    ellipse(xpos, ypos, radius * 2, radius * 2);
    int trailLength = 10;
    float greenIntensity = 255 / (float)trailLength;
    for (int i = 1 ; i <= trailLength ; i ++)
    {
      // set color each lines
      stroke(0, i * greenIntensity, 0);
      float x = xpos + sin(theta + i * speed) * radius;
      float y = ypos -cos(theta + i * speed) * radius;
      line(xpos, ypos, x, y);
    }
    stroke(175, 30);
    //line(xpos - radius, ypos, xpos + radius, ypos);
    //line(xpos, ypos - radius, xpos, ypos + radius);
    
    line(0, ypos, width/3.0f, ypos);
    line(xpos, height - border, xpos, height); 
    
    for (int i = -5; i <= 5; i ++)
    {
      float lx = map(i, -5, 5, 0, width/3.0f);
      float ly = map(i, -5, 5, height - border, height);
      line(lx, ypos + 5, lx, ypos - 5);
      line(xpos - 5, ly, xpos + 5, ly); 
    }
    
    //for (int y = -5, y <= 5; y ++)
  }
}