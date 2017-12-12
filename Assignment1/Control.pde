class Control
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector mouse;
  
  float speed;
  
  float lx;
  float ly;  
  
  float angle;
 
  float tpx;
  float tpy;
  
  float directx;
  float directy;
 
  float distant;
 
  float plotx1;
  float ploty1;
  float plotx2;
  float ploty2;
  
  float mapx;
  float mapy;
  
  Control(float border)
  {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    mouse = new PVector(width/2, height/2);
    speed = 2.0;
    
    // minimap location
    plotx1 = 0;
    ploty1 = height - border;
    plotx2 = width / 3;
    ploty2 = height;
    
    lx = - 10;
    ly = - 10;

  }
  
    
  void targetPoint()
  {
    if(mousePressed ==true)
    {
      mouse.x = mouseX;
      mouse.y = mouseY;
      
      lx = mouse.x;
      ly = mouse.y;
    }
  }
    
  void targetdisplay()
  {   
    strokeWeight(3);
    stroke(255, 0, 0);    
    line(lx-10, ly, lx+10, ly);
    line(lx, ly-10, lx, ly+10);
  }
  
  void update()
  {
    
    // subtract mouse and location
    // find distant
    PVector dir = PVector.sub(mouse, location);
      
    // calculate the magnitude of the Vector
    distant = dir.mag();
      
    // Normalize the vector to a length of 1
    dir.normalize();
      
      
    // Multiply a vector by a scalar
    dir.mult(0.5);
    
    acceleration = dir;
    
    // Adds x, y, and z components to a vector, one vector to another, or two independent vectors
    velocity.add(acceleration);
    
    // Limit the magnitude of the vector
    velocity.limit(speed);
    
    if(distant<5)
    {
      directx = velocity.x;
      directy = velocity.y;
      
      tpx = location.x;
      tpy = location.y;
      
      angle = atan2(velocity.y , velocity.x);
      velocity.mult(0);  
      
      // ship stopping
      pushMatrix();
      translate(tpx, tpy); 
      rotate(angle);
      rectMode(CENTER);
      noStroke();
      
      // body
      fill(255);
      rect(0, 0, 40, 30);    
      triangle(20, -15, 40, 0, 20, 15);
      
      // legs(left)
      stroke(255);
      line(0, 0, -10, -30);
      line(-10, -30, -20, -25);
      line(-25, -30, -25, -20);
      
      // legs(right)
      line(0, 0, -10, 30);
      line(-10, 30, -20, 25);
      line(-25, 30, -25, 20);
      
      // tail(red)
      noStroke();
      fill(255, 0, 0);
      triangle(-20, -6, -30, 0, -20, 6);
      
      // tail(yellow)
      fill(255, 255, 0);
      triangle(-20, -3, -25, 0, -20, 3);
      
      // window
      fill(0);
      ellipse(0, 0, 20, 20);
      
      popMatrix();      
    }  
    else
    {
      // ship moving
      pushMatrix();
      translate(location.x, location.y); 
      rotate(angle);
      rectMode(CENTER);
      noStroke();
      
      // body
      fill(255);
      rect(0, 0, 40, 30);
      triangle(20, -15, 40, 0, 20, 15);
      
      // legs(left)
      stroke(255);
      line(0, 0, -5, -30);
      line(-5, -30, -15, -30);
      line(-15, -35, -15, -25);
      
      // legs(right)
      line(0, 0, -5, 30);
      line(-5, 30, -15, 30);
      line(-15, 35, -15, 25);
      
      // tail(red)
      noStroke();
      fill(255, 0, 0);
      triangle(-20, -10, -40, 0, -20, 10);
      
      // tail(yellow)
      fill(255, 255, 0);
      triangle(-20, -5, -30, 0, -20, 5);
      
      // window
      fill(0);
      ellipse(0, 0, 20, 20);
      
      popMatrix();
    }
    
    location.add(velocity);          
    angle = atan2(velocity.y , velocity.x);      
  }
                  
           
  void shipdisplay()
  {
    textSize(15);
    text("Coordinate x of ship =  " + int(location.x), width - border*2.5f, border/4.0f);
    text("Coordinate y of ship =  " + int(location.y), width - border*2.5f, border/2.5f);
   }
   
  void mapdisplay()
  {
    fill(0, 255, 0, 20);
 
    rectMode(CORNERS);
    rect(plotx1, ploty1, plotx2, ploty2);
   
    mapx = map(location.x, 0, width, plotx1, plotx2);
    mapy = map(location.y, 0 , height, ploty1, ploty2);
    
    noStroke();
    fill(255, 0, 0);
    ellipse(mapx, mapy, 10, 10);
  }
}