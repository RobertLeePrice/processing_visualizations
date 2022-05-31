class Tree {
  
  // static variables
  float xpos, ypos, treeWidth, treeHeight, trunkWidth, trunkHeight; 
  color treeColor;
  
  // constructor
  Tree (float x, float y) {  
    xpos = x;
    ypos = y;
    treeWidth = random(treeMinWidth, treeMaxWidth);
    treeHeight = random(treeMinHeight, treeMaxHeight);
    trunkWidth = treeWidth * .2;
    trunkHeight = treeHeight * .3;
    treeColor = treeColors[round(random(0, 4))];
  } 
  
  // call update functions
  void update() {
    xpos += -groundSpeed; 
    
    if (xpos < 0 - treeWidth) {
      xpos = width;  
    }
    
    // tree branches
    noStroke();
    fill(treeColor);
    triangle(
      xpos,
      ypos - treeHeight,
      xpos - treeWidth / 2,
      ypos - trunkHeight,
      xpos + treeWidth / 2,
      ypos - trunkHeight
    );
    
    // tree trunk
    noStroke();
    fill(treeTrunkColor);
    rect(xpos - trunkWidth / 2, ypos - trunkHeight, trunkWidth, trunkHeight);
  } 
} 
