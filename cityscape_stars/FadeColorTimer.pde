/*
* Jeremy Douglass
* February 2017
* https://forum.processing.org/two/discussion/20861/change-between-colors-over-time.html
* 
* This class fades between two colors over a set duration.  
*/

class FadeColorTimer {
  color c1, c2, c;
  int start, duration;
  FadeColorTimer(color _c1, color _c2, int _duration){
    c1 = _c1;
    c2 = _c2;
    start = millis();
    duration = _duration;
  }
  color c(){
    c = lerpColor( c1, c2, map(millis(), start, start + duration, 0.0, 1.0));
    return c;
  }
}
