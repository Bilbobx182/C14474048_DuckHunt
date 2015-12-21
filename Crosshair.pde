class Crosshair
{
  int crosshair;
  int crossmod;
  int ground;
  float grass;

  Crosshair()
  {
    crosshair=width/15;
    crossmod=width/30;
    ground=height/8;
    grass=height-(ground*1.5);
  }

  void render()
  {
    noFill();
    stroke(#2f2721);
    ellipse(mouseX, mouseY, crosshair, crosshair);
    line((mouseX+crossmod), mouseY, mouseX, mouseY);
    line((mouseX-crossmod), mouseY, mouseX, mouseY);
    line(mouseX, mouseY+crossmod, mouseX, mouseY);
    line(mouseX, mouseY, mouseX, mouseY-crossmod);

    //TERRAIN
    noStroke();
    fill(#61B329);
    rect(0, height-(ground*1.5), width, height-(ground*1.5));
    fill(#CD853F);
    rect(0, height-ground, width, height);

    //grass
    for (int i=0; i< (width*9); i++)
    {
      stroke(random(17), random(173), random(73), 40);
      line(i, grass, i+random(ground), grass-random(ground/2));
    }
  }

  
}

