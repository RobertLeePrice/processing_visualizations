int MAX_STARS = 1000;
int MAX_SKYSCRAPERS = 170;
float num_stars = 0;
float star_alpha = 120;
float num_skyscrapers = 0;
color[] STAR_COLORS = new color[] { #9EA6BF, #DFFBFF, #D7D9E3};
color SKY_COLOR = #0a183b;
color GROUND_COLOR = #080A17;
color SKYSCRAPER_MID = #0F1739;
color SKYSCRAPER_TALL = #131D4C;
String[] SKYSCRAPER_STYLES = new String[] { "RECT", "POINT", "SLOPE"};
float STAR_BIRTH_RATE = 0.65;
float skyscraper_birth_rate = 0.005;
float GROUND_HEIGHT = 540;
float SKYSCRAPER_MAX_HEIGHT = 200;
float light_pollution = 0;
float light_pollution_rate = 0.05;


static ArrayList<Star> stars = new ArrayList();
static ArrayList<Skyscraper> skyscrapers = new ArrayList();

void setup() {
  size(800, 600);
  
  for (int i = 0; i < MAX_STARS; i++) {
    stars.add(new Star());
  }
  
  for (int i = 0; i < MAX_SKYSCRAPERS; i++) {
    if (i < 60) {
      skyscrapers.add(new Skyscraper(120, 300, SKYSCRAPER_TALL));
    } else if (i < 95) {
      skyscrapers.add(new Skyscraper(70, 240, SKYSCRAPER_MID));
    } else {
      skyscrapers.add(new Skyscraper(15, 110, GROUND_COLOR));
    }
  }
  
}

void draw() {
  //background(0);
  noStroke();
  fill(SKY_COLOR, 100);
  rect(0, 0, width, height);
  
  noStroke();
  fill(#FEF9A8, light_pollution);
  ellipse(width / 2, height, width + 300, height + 80);
    
  for (int i = 0; i < num_stars; i++) {
    Star s = stars.get(i);
    s.update(star_alpha);
  }
  
  for (int i = 0; i < num_skyscrapers; i++) {
    Skyscraper s = skyscrapers.get(i);
    s.update();
  }
  
  if (star_alpha > 3) {
    star_alpha -= 0.15;
  }
  
  if (num_stars < MAX_STARS - STAR_BIRTH_RATE) {
    num_stars += STAR_BIRTH_RATE; 
  }
  
  if (num_skyscrapers < MAX_SKYSCRAPERS - skyscraper_birth_rate) {
    num_skyscrapers += skyscraper_birth_rate; 
    skyscraper_birth_rate += 0.001;
  }
 
   noStroke();
   fill(GROUND_COLOR);
   rect(0, GROUND_HEIGHT, width, 60);
   
   if (star_alpha < 60) {
      if (light_pollution < 150) {
       light_pollution += light_pollution_rate;
       light_pollution_rate += 0.001;
     }
   }

 
}
