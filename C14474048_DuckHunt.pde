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
  bound();
  text.render();
}
void bound()
{
  if (mouseX> (duck.x - duck.w * 2) && mouseX < (duck.x  + duck.w) && mouseY > (duck.y - duck.w) && mouseY < (duck.y  + duck.w) )
  {
    println("DUCK IS UNDER THE CROSSHAIR");
  }
  else
  {
     println("NOT");
  }
}

void mousePressed()
{

  text.render();
}

