/*C14474048 ASSIGNMENT 2, FUNDAMENTAL IDEA. DUCK HUNT. */

int ground;
void setup ()
{
  crosshair = new Crosshair();
  size(600, 600);
  ground=height/8;
}
//classes
Crosshair crosshair;

void draw()
{

  background(#7ec0ee);

  crosshair.render();
  noStroke();
  fill(#61B329);
  rect(0, height-(ground*1.5), width, height-(ground*1.5));
  fill(#CD853F);
  rect(0, height-ground, width, height);
}

