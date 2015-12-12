/*
C14474048
 ASSIGNMENT 2, FUNDAMENTAL IDEA. DUCK HUNT. 
 */
float crosshair;
float crossmod;
int ground;
void setup ()
{
  size(600, 600);
  long startTime = System.currentTimeMillis();
  crosshair=width/15;
  crossmod=width/30;
  ground=height/8;
  for (int i=0; i<10000000.f; i++) {
  }
  long endTime   = System.currentTimeMillis();
  long totalTime = endTime - startTime;
  System.out.println(totalTime);
}

void draw()
{
  println(ground);
  background(0);
  noFill();
  stroke(255, 0, 0);
  ellipse(mouseX, mouseY, crosshair, crosshair);
  line((mouseX+crossmod), mouseY, mouseX,mouseY);
  line((mouseX-crossmod), mouseY, mouseX,mouseY);
  line(mouseX, mouseY+crossmod, mouseX,mouseY);
  line(mouseX, mouseY, mouseX,mouseY-crossmod);
  
  noStroke();
  fill(#61B329);
  rect(0,height-(ground*1.5),width,height-(ground*1.5));
   fill(#CD853F);
  rect(0,height-ground,width,height);
}

