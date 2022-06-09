class Skyscraper {
  
  float x, y, w, h, targetHeight, growSpeed;
  color c;
  String style;
  float pointHeight, targetPointHeight;
  
  Skyscraper(float minHeight, float maxHeight, color fillColor) {
    this.x = random(0, 800);
    this.y = 0;
    this.w = random(20, 60);
    this.h = 0;
    this.targetHeight = random(minHeight, maxHeight);
    this.growSpeed = random(0.4, 0.8);
    this.c = fillColor;
    this.style = SKYSCRAPER_STYLES[round(random(0, SKYSCRAPER_STYLES.length - 1))];
    this.pointHeight = 0;
    this.targetPointHeight = random(10, 30);
  }
  
  void update() {
    //this.move();
    this.grow();
    this.render();
  }

  void grow() {
    if (this.h < targetHeight) {
      this.h += growSpeed;
    } else if (this.pointHeight < targetPointHeight) {
      this.pointHeight += growSpeed;
    }
  }
    
  void render() {
    pushMatrix();
    translate(x, GROUND_HEIGHT);
    fill(c);
    
    if (style == "RECT") {
      rect(this.x - w, this.y - h, this.w, this.h);
    }
    if (style == "POINT") {
      rect(this.x, this.y - h, this.w, this.h);
      if (this.h > targetHeight - 10) {
        rect(this.x + this.w / 4, this.y - h - pointHeight, this.w / 2, pointHeight);
      }
    }
    if (style == "SLOPE") {
      rect(this.x, this.y - h, this.w, this.h);
      if (this.h > targetHeight - 10) {
        triangle(
          this.x,
          this.y - this.h,
          this.x + this.w,
          this.y - this.h,
          this.x + this.w,
          this.y - this.h - this.pointHeight
        );
      }
    }
    popMatrix();
  }
}
