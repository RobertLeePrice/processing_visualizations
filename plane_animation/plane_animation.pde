/**
 * Zeppelin Game 
 * by Robert Price
 * 
 * All constants are defined at the top of the program. Mountains, 
 * trees, clouds, and zeppelins are generated dynamically. 
 * The NPC biplane and player biplane are created based on 
 * the constant value settings. The goal is to destroy all
 * NPC aircraft before they reach the end of the map. 
 */
 
 /** 
 * Questions
 * 1. Dynamic cloud generation with a shape object. 
 * 2. Bounding boxes changing with angle of rotation.
 * 3. Looping for bullet / plane collision detection.
 * 4. Random path generation.
 * curveVertex(beginShape, endShape), 
 * curveDetail, curvePoint - extract points off curve
 * align plane along path with atan2 theta is angle of rotation
 **/
 
 /**
 * TODO
 * 1. Update Questions
 * 2. Player Score
 * 3. Start Game Countdown
 **/

// control constants 
int NUM_TREES = 20;
int NUM_CLOUDS = 12;
int NUM_MOUNTAINS = 2;
int NUM_ZEPPELINS = 6;
boolean SHOW_BOUNDING_BOX = false;

// colors 
color skyColor = #53E8FC;
color groundColor = #7ac631; 
color[] treeColors = new color[]{ #16a085, #3A4F3F, #485E52, #587E60, #5F926A };
color treeTrunkColor = #6b3e2e;
color cloudColor = #FFFFFF;
color mountainColorLight = #34495e;
color mountainColorDark = #2c3e50;
color mountainSnow = #ecf0f1;

// mountain constants
float mountainMinHeight = 190;
float mountainMaxHeight = 280;
float mountainMinWidth = 110;
float mountainMaxWidth = 220;

// cloud constants
float cloudMinHeight = 20;
float cloudMaxHeight = 70;
float cloudMinWidth = 30;
float cloudMaxWidth = 90;

// tree constants
float treeMinHeight = 60;
float treeMaxHeight = 150;
float treeMinWidth = 30;
float treeMaxWidth = 50;

// background constants
float groundHeight = height / 5;
float groundSpeed = 1;

// NPC plane constants
PImage AIRCRAFT_NPC;
String AIRCRAFT_NPC_IMG = "biplane_yellow.png";
float AIRCRAFT_NPC_WIDTH;
float AIRCRAFT_NPC_HEIGHT;
int damageMax = 8;
float waveAmplitude = 60;
float waveLength = 275;
float planeSpeed = 0.5;
float startPositionX = 0;
float startPositionY = 180;

// NPC zeppelin constants
PImage AIRCRAFT_ZEPPELIN;
String AIRCRAFT_ZEPPELIN_IMG = "zeppelin.png";
float zeppelinSpawnMinX = -100;
float zeppelinSpawnMaxX = 600;
float zeppelinSpawnMinY = 50;
float zeppelinSpawnMaxY = 240;
float zeppelinMinSpeed = 0.05;
float zeppelinMaxSpeed = 0.15;
int zeppelinMaxHealth = 10;

// controlled plane constants
PImage AIRCRAFT_PLAYER;
String AIRCRAFT_PLAYER_IMG = "biplane_red.png";
float AIRCRAFT_PLAYER_WIDTH;
float AIRCRAFT_PLAYER_HEIGHT;
float AIRCRAFT_PLAYER_MIN_SPEED = 1.1;
float AIRCRAFT_PLAYER_MAX_SPEED = 3.4;
float playerStartPositionX = -100;
float playerStartPositionY = 50;
float speedIncrement = 0.1;
float speedEasing = 0.03;
float bulletVelocity = 4;

// generate target object
NpcAirplane target = new NpcAirplane(startPositionX, startPositionY, planeSpeed);

// generate player object
PlayerAirplane player = new PlayerAirplane(playerStartPositionX, playerStartPositionY, planeSpeed);

// generate zeppelins
//Zeppelin zeppelin = new Zeppelin(zeppelinStartPositionX, zeppelinStartPositionY, zeppelinSpeed);
static ArrayList<Zeppelin> zeppelins = new ArrayList();

// generate dynamic background
Mountain[] mountains = new Mountain[NUM_MOUNTAINS];
Tree[] trees = new Tree[NUM_TREES];
Cloud[] clouds = new Cloud[NUM_CLOUDS];

// generate dynamic bullet array
static ArrayList<Bullet> bullets = new ArrayList();

void setup() {
  // defaults
  background(skyColor);
  size(800, 500);
  
  // load NPC aircraft
  AIRCRAFT_NPC = loadImage(AIRCRAFT_NPC_IMG);
  //AIRCRAFT_NPC_WIDTH = AIRCRAFT_NPC.width;
  //AIRCRAFT_NPC_HEIGHT = AIRCRAFT_NPC.height;
  
  // load player aircraft
  AIRCRAFT_PLAYER = loadImage(AIRCRAFT_PLAYER_IMG);
  //AIRCRAFT_PLAYER_WIDTH = AIRCRAFT_PLAYER.width;
  //AIRCRAFT_PLAYER_HEIGHT = AIRCRAFT_PLAYER.height;
  
  // load NPC zeppelins
  AIRCRAFT_ZEPPELIN = loadImage(AIRCRAFT_ZEPPELIN_IMG);
  
  // initialize mountains
  for (int i = 0; i < mountains.length; i++) {
    mountains[i] = new Mountain(random(0, 800), 500 - groundHeight);
  }
  
  // initialize trees
  for (int i = 0; i < trees.length; i++) {
    trees[i] = new Tree(random(0, 800), 500 - groundHeight);
  }
  
  // initialize clouds
  for (int i = 0; i < clouds.length; i++) {
    clouds[i] = new Cloud(random(0, 800), random(50, 250));
  }
  
  // initialize NPC zeppelins
  for (int i = 0; i < NUM_ZEPPELINS; i++) {
    zeppelins.add(new Zeppelin());
  }
  
  
  
}

void draw() {
  // reset background
  background(skyColor);
  
  // update mountains
  for (Mountain mountain: mountains) {
    mountain.update();
  }
  
  // update trees
  for (Tree tree: trees) {
    tree.update();
  }
  
  // update clouds
  for (Cloud cloud: clouds) {
    cloud.update();
  }
  
  // update NPC zeppelin
  for (Zeppelin zeppelin: zeppelins) {
    if (zeppelin.health > 0) {
      zeppelin.update();
    }
  }
  
  // update NPC aircraft
  if (target.health > 0) {
    target.update(); 
  }
  
  // update player aircraft
  player.update();
 
  // update bullets
  for (int i = 0; i < bullets.size(); i++) {
    Bullet bullet = bullets.get(i);
    bullet.update();
       
    // remove bullet if out of bounds
    if ((bullet.xpos > width + 10) || (bullet.xpos < -10) || (bullet.ypos > height + 10) || (bullet.ypos < -10)) {
      bullets.remove(i);
    }
    
  }
  
  // reset ground
  noStroke();
  fill(groundColor);
  rect(0, height - groundHeight, width, groundHeight);
  
  // check collisions
  checkCollision();
  
}

void checkCollision() {
  
  // check bullet collision
  for (int i = 0; i < bullets.size(); i++) {
    Bullet b = bullets.get(i);
    
    // collision for target plane
    if (target.is_active) {
      // calculate inside target bounding box
      if ((b.xpos > target.leftBound) && (b.xpos < target.rightBound) && (b.ypos < target.bottomBound) && (b.ypos > target.topBound)) {
        
        // calculate remaining health
        target.health -= 1;
        
        if (target.health < 1) {
          target.is_active = false; 
        }
              
        // remove bullet if collision is detected
        bullets.remove(i);
      }
    }
    
    // collision for zeppelins
    for (int k = 0; k < zeppelins.size(); k++) {
      Zeppelin z = zeppelins.get(k);
      
      if (z.is_active) {
         // calculate inside target bounding box
        if ((b.xpos > z.leftBound) && (b.xpos < z.rightBound) && (b.ypos < z.bottomBound) && (b.ypos > z.topBound)) {
          
          // calculate remaining health
          z.health -= 1;
          
          if (z.health < 1) {    
            z.is_active = false; 
          }
                
          // remove bullet if collision is detected
          bullets.remove(i);
        } 
      }
    }
  }
  
}

void addBullet() {
  bullets.add(
    new Bullet(
    player.barrelX, 
    player.barrelY, 
    player.targetX, 
    player.targetY, 
    bulletVelocity)
  );
}

void keyPressed() {
  if (key==' ') addBullet();
}

void mouseClicked() {
  addBullet();
}
