class Tree {
  float xpos, ypos, treeWidth, treeHeight, trunkWidth, trunkHeight; 
  Tree (float x, float y) {  
    xpos = x;
    ypos = y;
    treeWidth = random(treeMinWidth, treeMaxWidth);
    treeHeight = random(treeMinHeight, treeMaxHeight);
    trunkWidth = treeWidth * .2;
    trunkHeight = treeHeight * .3;
  } 
  void update() {
    xpos += -groundSpeed; 
    
    if (xpos < 0) {
      xpos = width;  
    }
    
    // tree branches
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
    fill(treeTrunkColor);
    rect(xpos, ypos, trunkWidth, trunkHeight);
  } 
} 
