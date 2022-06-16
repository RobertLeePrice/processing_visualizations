/* SETTINGS FOR GROUND */
float GROUND_HEIGHT = 540;
color GROUND_COLOR = #080A17;

/* SETTINGS FOR STARS */
int MAX_STARS = 4000;
float star_alpha = 255;
color[] STAR_COLORS = new color[] { #9EA6BF, #DFFBFF, #75AED1, #D7D9E3, #FFFCD9, #FFFAC4, #ed8e8c };

/* SETTINGS FOR BUILDINGS */
float num_skyscrapers = 0;
int MAX_SKYSCRAPERS = 170;
color SKYSCRAPER_MID = #0F1739;
color SKYSCRAPER_TALL = #131D4C;
String[] SKYSCRAPER_STYLES = new String[] { "RECT", "POINT", "SLOPE"};
float SKYSCRAPER_MAX_HEIGHT = 200;
float skyscraper_birth_rate = 0.005;

/* INITIALIZE ARRAYS */ 
static ArrayList<Star> stars = new ArrayList();
static ArrayList<Skyscraper> skyscrapers = new ArrayList();

/* SETTINGS FOR TIMERS */ 
color GRADIENT_DARK = #0a183b; // DARK SKY COLOR
color GRADIENT_LIGHT = #2E3681; // LIGHT SKY COLOR
color GRADIENT_EXTRA_LIGHT = #6d76c7; // EXTRA LIGHT SKY COLOR
int FADE_COLOR_TIMER = 10000; // in milliseconds

/* TIMER INSTANCES */
FadeColorTimer fadeColorTop;
FadeColorTimer fadeColorBottom;

void setup() {
  // general settings
  size(800, 600);
  frameRate(30);
  
  // create fade color timers
  fadeColorTop = new FadeColorTimer(GROUND_COLOR, GRADIENT_DARK, FADE_COLOR_TIMER);
  fadeColorBottom = new FadeColorTimer(GRADIENT_DARK, GRADIENT_EXTRA_LIGHT, FADE_COLOR_TIMER);
  
  // initialize stars
  for (int i = 0; i < MAX_STARS; i++) {
    stars.add(new Star());
  }
  
  // initialize skyscrapers
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


void backgroundGradient(int x, int y, int w, int h, color c1, color c2) {
    for (int i = y; i <= y + h; i++) {
        float inter = map(i, y, y + h, 0, 1);
        color c = lerpColor(c1, c2, inter);
        stroke(c);
        line(x, i, x + w, i);
    }
}

void draw() {
  
  // create background gradient
  noStroke();
  backgroundGradient(0, 0, width, height-60, fadeColorTop.c(), fadeColorBottom.c());
    
  // update stars
  for (int i = 0; i < MAX_STARS; i++) {
    Star s = stars.get(i);
    s.update(star_alpha);
  }
  
  // add new skyscrapers
  for (int i = 0; i < num_skyscrapers; i++) {
    Skyscraper s = skyscrapers.get(i);
    s.update();
  }
  
  // update star transparency
  if (star_alpha > 3) {
    star_alpha -= 0.2;
  }
  
  // update number of skyscrapers
  if (num_skyscrapers < MAX_SKYSCRAPERS - skyscraper_birth_rate) {
    num_skyscrapers += skyscraper_birth_rate; 
    skyscraper_birth_rate += 0.001;
  }

  // create ground
  noStroke();
  fill(GROUND_COLOR);
  rect(0, GROUND_HEIGHT, width, 60);

}
