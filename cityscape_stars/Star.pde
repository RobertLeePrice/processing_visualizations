class Star {
  
  float x, y, r, speed, theta;
  color c;
  float a;
  
  Star() {
    this.x = random(-width / 1.2, width / 1.2);
    this.y = random(-width / 1.2, width / 1.2);
    this.r = random(0.7, 1.6);
    this.speed = random(0.4, 1.4);
    this.theta = 0;
    this.c = STAR_COLORS[round(random(0, STAR_COLORS.length - 1))];
  }
  
  void update(float alpha) {
    this.render(alpha);
  }

  void render(float alpha) {
    pushMatrix();
    noStroke();
    
    translate(width / 2, height - 100);
    rotate(radians(frameCount) * 0.1);
      
    fill(c, int(alpha));
    circle(this.x, this.y, this.r);
    popMatrix();
  }
}
