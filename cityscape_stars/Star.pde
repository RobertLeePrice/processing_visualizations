class Star {
  
  float x, y, r, speed, theta;
  float visibility;
  color c;
  float a;
  
  Star() {
    this.x = 0;
    this.y = 0;
    this.r = random(0.8, 2);
    this.speed = random(0.4, 1.4);
    this.visibility = 0;
    this.theta = random(TWO_PI);
    this.c = STAR_COLORS[round(random(0, STAR_COLORS.length - 1))];
  }
  
  void update(float alpha) {
    this.move();
    //this.collision();
    this.render(alpha);
  }

  void move() {
    this.visibility += 1;
    this.x += cos(this.theta) * this.speed * this.visibility / 40;
    this.y += sin(this.theta) * this.speed * this.visibility / 40;
  }
  
  //void collision() {
  //   if ((this.x > width + this.r) || (this.x < -this.r) || (this.y > height + this.r) || (this.x < -this.r)) {
  //    stars.remove(this);
  //  } 
  //}
    
  void render(float alpha) {
    pushMatrix();
    translate(width /2 , height / 3);
    //fill(#DFFBFF, 50);
    fill(c, int(alpha));
    circle(this.x, this.y, this.r * this.visibility / 40);
    popMatrix();
  }
}
