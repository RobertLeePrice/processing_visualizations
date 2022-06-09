
class Particle {
  
  float x, y, r;
  color f;
  float speedX, speedY;
 
  Particle () {
    this.x = random(MIN_SPAWN_WIDTH, MAX_SPAWN_WIDTH);
    this.y = random(MIN_SPAWN_HEIGHT, MAX_SPAWN_HEIGHT);
    this.r = random(MIN_DIAMETER, MAX_DIAMETER);
    this.f = PARTICLE_COLORS[int(random(0, PARTICLE_COLORS.length))];
    this.speedX = random(-2, 1.5);
    this.speedY = random(-1, 1);
  }
  
  void move() {
    if(this.x < 0 + r / 2 || this.x > width - r / 2 ) {
      this.speedX *= -1;
    }

    if(this.y < 0 + r / 2 || this.y > height - r / 2) {
      this.speedY *= -1;
    }
      
    this.x += this.speedX;
    this.y += this.speedY;
  }
  
  void connect(Particle[] ps) {
    for (Particle p: ps) {
      float distance = dist(this.x, this.y, p.x, p.y);
      if (distance < PAIR_DISTANCE) {
        stroke(#FFFFFF, 40);
        line(this.x, this.y, p.x, p.y);
      }
    }
  }
  
  void render() {
    noStroke();
    fill(f, PARTICLE_ALPHA);
    circle(this.x, this.y, this.r);
  }
  
}
