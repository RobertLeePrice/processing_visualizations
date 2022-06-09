class NpcAirplane {

  // static variables
  float xpos, ypos, xprev, yprev, speed, theta, leftBound, rightBound, topBound, bottomBound; 
  int health;
  boolean is_active;
  
  // constructor
  NpcAirplane (float x, float y, float s) {  
    xpos = x;
    ypos = y;
    xprev = 0;
    yprev = 0;
    speed = s; 
    theta = 0;
    health = damageMax;
    is_active = true;
  } 
  
  // call update functions
  void update() {
    simulate();
    render();
  }

  // update simulated data elements
  void simulate() {
    
    // update speed and position
    xpos += speed; 
    ypos = waveAmplitude * sin((TWO_PI / waveLength) * (xpos-1)) + startPositionY;
    
    // update angle    
    theta = 0.5 * sin((TWO_PI / waveLength) * (xpos + AIRCRAFT_NPC.width + 10));

    // update bounding box
    if (is_active) {
      leftBound = xpos - AIRCRAFT_NPC.width / 2;
      rightBound = xpos + AIRCRAFT_NPC.width / 2;
      topBound = ypos - AIRCRAFT_NPC.height / 2;
      bottomBound = ypos + AIRCRAFT_NPC.height / 2;
    } else {
      leftBound = 0;
      rightBound = 0;
      topBound = 0;
      bottomBound = 0;
    }
  
  } 
  
  // update render step
  void render() {
    //imageMode(CENTER);
    
    pushMatrix();
    
    translate(xpos, ypos);
    rotate(theta);
    
    if (SHOW_BOUNDING_BOX) {
      stroke(#e74c3c);
      noFill();
      rect(-AIRCRAFT_NPC.width, -AIRCRAFT_NPC.height, AIRCRAFT_NPC.width, AIRCRAFT_NPC.height);
    }

    image(AIRCRAFT_NPC, -AIRCRAFT_NPC.width / 2, -AIRCRAFT_NPC.height / 2);
    
    popMatrix();
    
    xprev = xpos;
    yprev = ypos;
  }
  
} 
