class PlayerAirplane {
  
  // static variables
  float xpos, ypos, dx, dy, speed, theta;
  float targetX, targetY;
  float barrelX, barrelY;
  float radius = 50;
  
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
    dx = mouseX - xpos;
    xpos += dx * speedEasing * speed;
    
    // calculate Y position
    dy = mouseY - ypos;
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
    
    // calculate barrel position
    barrelX = xpos + (AIRCRAFT_PLAYER.width / 4) * sin(theta);
    barrelY = ypos - (AIRCRAFT_PLAYER.height / 2) * cos(theta);

    // calculate target position
    targetX = xpos + width * cos(theta);
    targetY = ypos / 2 + height * sin(theta);
    
    // update aircraft position
    pushMatrix();
    
    translate(xpos, ypos);
    rotate(theta);
    
    if (SHOW_BOUNDING_BOX) {
      stroke(#e74c3c);
      noFill();
      rect(-AIRCRAFT_PLAYER.width, -AIRCRAFT_PLAYER.height, AIRCRAFT_PLAYER.width, AIRCRAFT_PLAYER.height);
    }

    image(AIRCRAFT_PLAYER, -AIRCRAFT_PLAYER.width / 2, -AIRCRAFT_PLAYER.height / 2);
    
    popMatrix();
 
  }
}
