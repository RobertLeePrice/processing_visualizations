class Airplane {
  float xpos, ypos, speed; 
  Airplane (float x, float y, float s) {  
    xpos = x;
    ypos = y;
    speed = s; 
  } 
  void update() {
    xpos += speed; 
    ypos = waveAmplitude * sin((TWO_PI / waveLength) * (xpos-1)) + startPositionY;
    //if (ypos > height) { 
    //  ypos = 0; 
    //} 
    fill(#000000);
    ellipse(xpos, ypos, 10, 10); 
    
    if (xpos > 750) {
      ypos = xpos+2;
   
    }
  } 
} 
