class Bullet {

  // static variables
  float xpos, ypos, initX, initY, targetX, targetY, dx, dy, speed, theta;
  
  // constructor
  Bullet (float x, float y, float tx, float ty, float s) {  
    xpos = x;
    ypos = y;
    initX = x;
    initY = y;
    targetX = tx;
    targetY = ty;
    speed = s; 
    theta = atan((targetY - ypos) / (targetX - xpos));
  } 
  
  // call update functions
  void update() {
    simulate();
    render();
  }
  
  // update simulated data elements
  void simulate() {
    
    // calculate position
    if (targetX > initX) {
      xpos += speed * cos(theta);
      ypos += speed * sin(theta);
    } else if (targetX < initX) {
      xpos += speed * -cos(theta);
      ypos += speed * -sin(theta);
    }
    
  }
  
  // update render step
  void render() {
    noStroke();
    fill(#000000);
    ellipse(xpos, ypos, 4, 4);
  }
  
} 
