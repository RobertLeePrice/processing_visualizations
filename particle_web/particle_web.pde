// global constants
boolean WEB_EFFECT = false;
int NUM_PARTICLES = 80;
color PARTICLE_ALPHA = 255;
color[] PARTICLE_COLORS = new color[] { #E84F5E, #B3CCBA, #2EACB3, #F7F0DD, #EEA857 };
float MIN_DIAMETER = 2;
float MAX_DIAMETER = 16;
float BOARDER_PADDING = 10;
float MIN_SPAWN_WIDTH = BOARDER_PADDING + MAX_DIAMETER;
float MAX_SPAWN_WIDTH = 800 - BOARDER_PADDING - MAX_DIAMETER;
float MIN_SPAWN_HEIGHT = BOARDER_PADDING + MAX_DIAMETER;
float MAX_SPAWN_HEIGHT = 500 - BOARDER_PADDING + MAX_DIAMETER;
float PAIR_DISTANCE = 60;

// create particle array
Particle[] particles = new Particle[NUM_PARTICLES];

void setup() {
  size(800, 500);
  
  // initialize particles
  for(int i = 0; i < particles.length; i++) {
    particles[i] = new Particle();
  }
  
}

void draw() {
  
  // draw background
  if (WEB_EFFECT) {
    noStroke();
    fill(#1D1C1A, 40);
    rect(0, 0, width, height); 
  } else {
    background(#1D1C1A); 
  }
  
  // draw particles
  for(int i = 0; i < particles.length; i++) {
    particles[i].move();
    particles[i].connect(particles);
    particles[i].render();
  }
  
}
