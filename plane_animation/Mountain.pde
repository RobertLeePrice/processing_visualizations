class Mountain {
  
  // static variables
  float xpos, ypos, mountainWidth, mountainHeight;
  color treeColor;
  
  // constructor
  Mountain (float x, float y) {  
    xpos = x;
    ypos = y;
    mountainWidth = random(mountainMinWidth, mountainMaxWidth);
    mountainHeight = random(mountainMinHeight, mountainMaxHeight);
  } 
  
  // call update functions
  void update() {
    xpos += -groundSpeed; 
    
    if (xpos < 0 - mountainWidth) {
      xpos = width;  
    }
    
    // mountain left
    noStroke();
    fill(mountainColorLight);
    triangle(
      xpos,
      ypos,
      xpos + mountainWidth / 2,
      ypos - mountainHeight,
      xpos + mountainWidth / 2,
      ypos
    );
    
    // mountain right
    noStroke();
    fill(mountainColorDark);
    triangle(
      xpos + mountainWidth / 2 - 1,
      ypos,
      xpos + mountainWidth / 2 - 1,
      ypos - mountainHeight,
      xpos + mountainWidth - 1,
      ypos
    );
    
  } 
} 
