class Crosshair
{
  int crosshair;
  int crossmod;
  void render()
  {
    crosshair=width/15;
    crossmod=width/30;

    noFill();
    stroke(255, 0, 0);
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
  }
}

