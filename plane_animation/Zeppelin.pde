class Zeppelin {

  // static variables
  float xpos, ypos, speed, leftBound, rightBound, topBound, bottomBound; 
  int health;
  boolean is_active;
  
  // constructor
  Zeppelin () {  
    xpos = random(zeppelinSpawnMinX, zeppelinSpawnMaxX);
    ypos = random(zeppelinSpawnMinY, zeppelinSpawnMaxY);
    speed = random(zeppelinMinSpeed, zeppelinMaxSpeed); 
    health = zeppelinMaxHealth;
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
    
    if (SHOW_BOUNDING_BOX) {
      stroke(#e74c3c);
      noFill();
      rect(xpos - AIRCRAFT_ZEPPELIN.width / 2, ypos - AIRCRAFT_ZEPPELIN.height / 2, AIRCRAFT_ZEPPELIN.width, AIRCRAFT_ZEPPELIN.height);
    }
    
    imageMode(CENTER);
    image(AIRCRAFT_ZEPPELIN, xpos, ypos);
  }
  
} 
