/*C14474048 ASSIGNMENT 2, FUNDAMENTAL IDEA. DUCK HUNT. */

int ground;
void setup ()
{
  crosshair = new Crosshair();
  text = new Text();
  size(600, 600);
  ground=height/8;
}
//classes
Crosshair crosshair;
Text text;

void draw()
{
  background(#7ec0ee);
  crosshair.render();
  text.render();
  
}

