/*C14474048 ASSIGNMENT 2, FUNDAMENTAL IDEA. DUCK HUNT. */

import ddf.minim.*;
Minim minim;
Crosshair crosshair;
Text text;
Duck duck;

void setup ()
{
  minim = new Minim(this);
  size(600, 600);
  setupobjects();
}

void setupobjects()
{
  crosshair = new Crosshair();
  text = new Text();
  duck= new Duck();
}

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

