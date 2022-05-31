class PlayerAirplane {
  
  // static variables
  float xpos, ypos, dx, dy, speed, theta;
  float targetX;
  float targetY;
  
  // constructor
  PlayerAirplane(float x, float y, float s) {
    xpos = x;
    ypos = y;
    speed = s;
    theta = 0.0;
  }
  
  // call update functions
  void update() {
    simulate();
    render();
  }
  
  // update simulated data elements
  void simulate() {
    
    // calculate X position
    targetX = mouseX;
    dx = targetX - xpos;
    xpos += dx * speedEasing * speed;
    
    // calculate Y position
    targetY = mouseY;
    dy = targetY - ypos;
    ypos += dy * speedEasing * speed;
    
    // calculate aircraft angle
    theta = atan2(dy, dx); 
    
    // manual player control of the speed
    if (keyPressed && key == CODED) {
      if (keyCode == UP) {
        if (speed < 0.8) {
          speed += speedIncrement; 
        }
      }
      if (keyCode == DOWN) {
        if (speed > 0.2) {
         speed -= speedIncrement;
        }
      }
    }
    
  }
  
  // update render step
  void render() {
    imageMode(CENTER);
    pushMatrix();
        
    if (SHOW_BOUNDING_BOX) {
      stroke(#e74c3c);
      noFill();
      rect(xpos - AIRCRAFT_PLAYER.width / 2, ypos - AIRCRAFT_PLAYER.height / 2, AIRCRAFT_PLAYER.width, AIRCRAFT_PLAYER.height);
    }

    translate(xpos, ypos);
    rotate(theta);
    image(AIRCRAFT_PLAYER, 0, 0);
    
    popMatrix();
 
  }
}
