/*C14474048 ASSIGNMENT 2, FUNDAMENTAL IDEA. DUCK HUNT. */

int ground;
void setup ()
{
  crosshair = new Crosshair();
  text = new Text();
  duck= new Duck();
  size(600, 600);
  ground=height/8;
  println(ground);
}
//classes
Crosshair crosshair;
Text text;
Duck duck;

void draw()
{
  background(#7ec0ee);
  duck.render();
  crosshair.render();
  text.render();
}
 void mousePressed()
  {
    
    text.render();
  }

