
// colors 
color skyColor = #53E8FC; // #D6ECFF;
color groundColor = #7ac631; // #27ae60;
color treeColor = #2ecc71;
color treeTrunkColor = #000000;


// tree constants
float treeMinHeight = 60;
float treeMaxHeight = 150;
float treeMinWidth = 30;
float treeMaxWidth = 50;

// background constants
float groundHeight = height / 5;
float groundSpeed = 1;

// plane constants
float waveAmplitude = 60;
float waveLength = 275;
float planeSpeed = 0.5;
float startPositionX = 0;
float startPositionY = 180;

  
Airplane biplane = new Airplane(startPositionX, startPositionY, planeSpeed);
Tree tree = new Tree(800, 500 - groundHeight);


void setup() {
  // defaults
  background(skyColor);
  size(800, 500);
  // plan
}

void draw() {
  background(skyColor);
  biplane.update(); 
  tree.update();
  
   // ground
  noStroke();
  fill(groundColor);
  rect(0, height - groundHeight, width, groundHeight);
  
}
