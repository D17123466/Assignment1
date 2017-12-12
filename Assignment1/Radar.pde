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
    stroke(255);
    noFill();
    ellipse(xpos, ypos, radius * 2, radius * 2);
    int trailLength = 10;
    float greenIntensity = 255 / (float)trailLength;
    for(int i = 1 ; i <= trailLength ; i ++)
    {
      // set color each lines
      stroke(0, i * greenIntensity, 0);
      float x = xpos + sin(theta + i * speed) * radius;
      float y = ypos -cos(theta + i * speed) * radius;
      line(xpos, ypos, x, y);
    }
  }
}