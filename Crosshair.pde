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
  }
}

