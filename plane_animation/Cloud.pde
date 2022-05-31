class Cloud {
  
  // static variables
  float xpos, ypos, cloudWidth, cloudHeight; 
  int numCircles = 5;
  
  // constructor
  Cloud (float x, float y) {  
    xpos = x;
    ypos = y;
    cloudWidth = random(cloudMinWidth, cloudMaxWidth);
    cloudHeight = random(cloudMinHeight, cloudMaxHeight);
  } 
  
  // call update functions
  void update() {
    xpos += -groundSpeed; 
    
    if (xpos < 0 - cloudWidth) {
      xpos = width;  
    }
    
    noStroke();
    fill(cloudColor, 75);
    ellipse(xpos, ypos, cloudWidth, cloudHeight); 
     
    // cloud circles
    //for (int i = 0; i < numCircles; i++) {
    //  //randomSeed(i);
    //  float cX = xpos + random(-cloudWidth, cloudWidth);
    //  float cY = ypos + random(-cloudHeight, cloudHeight);
    //  float cWidth = random(cloudWidth / 2, cloudWidth / 5);
    //  float cHeight = random(cloudHeight / 2, cloudHeight / 5);
    //  noStroke();
    //  fill(cloudColor, 70);
    //  ellipse(cX, cY, cWidth, cHeight);  
    //}
  } 
} 
