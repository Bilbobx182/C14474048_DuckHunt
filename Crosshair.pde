class Crosshair
{
  int crosshair;
  int crossmod;
  int ground;
  float grass;
  float radius;
float r2;
AudioPlayer pew;

  Crosshair()
  {
    crosshair=width/15;
    crossmod=width/30;
    ground=height/8;
    grass=height-(ground*1.5);
    radius=50;
    r2=radius/2;
     pew = minim.loadFile("pew.wav");
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
    //Brown dirt terrain
    fill(#CD853F);
    rect(0, height-ground, width, height);
    

    //grass
    for (int i=0; i< (width*9); i++)
    {
      stroke(random(17), random(173), random(73), 40);
      line(i, grass, i+random(ground), grass-random(ground/2));
    }
  }//end render

  void bang()
  {
    stroke(#DD6435);
    
    float segments=18;
    float small=segments/2;
    float theta2=TWO_PI/segments;
    
     pew.rewind();
     pew.play();

    for (float point=0; point<segments; point++)
    {
      float theta = point * theta2;
      float r;

      if (point%2==0)
      {
        r=radius;
      } else
      {
        r=radius/2;
      }
      float  x= mouseX + sin(theta) * r;
      float  y= mouseY + cos(theta) * r;
      
      line(mouseX, mouseY, x, y);
    }//end for
  }//end bang


  
  
}//end of the class

