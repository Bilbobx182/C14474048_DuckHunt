class Crosshair extends GO
{
  int crosshair;
  int crossmod;
  int ground;
  float grass;
  float radius;
  boolean face;
  int mx, my, mountain;

  AudioPlayer pew;

  Crosshair()
  {
    crosshair=width/15;
    crossmod=width/30;
    ground=height/8;
    grass=height-(ground*1.2);
    radius=50;
    pew = minim.loadFile("pew.wav");
    face =false;
    mx=width/2;
    my=height/2;
    mountain=50;
  }

  void render()
  {

    //hell mode modifier.
    if (text.kills>-1 && text.kills<hellmod)
    {
      //TERRAIN
      noStroke();
      fill(#61B329);
      rect(0, height-(ground*1.5), width, height-(ground*1.5));
      //Brown dirt terrain
      fill(#CD853F);
      rect(0, height-ground, width, height);
    } else
    {
      //TERRAIN
      noStroke();
      fill(#4F2F4F);
      rect(0, height-(ground*1.5), width, height-(ground*1.5));
      //Brown dirt terrain
      fill(#F6A8B6  );
      rect(0, height-ground, width, height);
    }

    //face

    if (text.combo >= 5 && text.combo != 0)
    {
      face=true;
    } else
    {
      face=false;
    }
    if (face==false)
    {
      //happy combo
      noFill();
      stroke(0);
      line( width-width/12, text.y, width-width/12, text.y*1.05);
      line( width-width/8, text.y, width-width/8, text.y*1.05);
      line(width-width/7, text.y *1.08, width-width/14, text.y * 1.08);
      noStroke();
    } else if (face == true)
    {
      //happy combo
      noFill();
      stroke(0);
      line( width-width/12, text.y, width-width/12, text.y*1.05);
      line( width-width/8, text.y, width-width/8, text.y*1.05);
      arc(width-width/10, text.y*1.04, 75, 75, 0, PI);
      noStroke();
    }
  }//end render

  void rc()
  {
    //clouds
   noStroke();
    fill(170);
    //far left
    ellipse(radius*2, radius, radius*1.7, radius/2);
    ellipse(radius*2.5, radius-15, radius*1.7, radius/2);
    //far right
    ellipse(radius*10, radius, radius*1.7, radius/2);
    ellipse(radius*10.5, radius+15, radius*1.7, radius/2);
    //center clouds
    ellipse(radius*5, radius, radius*2, radius/2);
    ellipse(radius*5, radius, radius*3, radius*.9);
  }

  void mountain()
  {
    noStroke();
    fill(255);
    ellipse(mx-(mx/2), my+(my/4), mountain*6, mountain*9); //LEFT SNOW
    ellipse(mx+(mx/2), my+(my/4), mountain*6, mountain*9);
    fill(#613f10);
    ellipse(mx-(mx/2), my+(my/4), mountain*6.5, mountain*8);
    ellipse(mx+(mx/2), my+(my/4), mountain*6.5, mountain*8);
    fill(#29841d);
    if (text.kills>=0 && text.kills<hellmod)
    {
      fill(#29841d);
    } else {
      fill(#E55EA2);
    }
    ellipse(mx-(mx/2), my+(my/2), mountain*8, mountain*8);
    ellipse(mx+(mx/2), my+(my/3), mountain*8, mountain*8);
  }

  void ch()
  {
    noFill();
    stroke(#2f2721);
    ellipse(mouseX, mouseY, crosshair, crosshair);
    line((mouseX+crossmod), mouseY, mouseX, mouseY);
    line((mouseX-crossmod), mouseY, mouseX, mouseY);
    line(mouseX, mouseY+crossmod, mouseX, mouseY);
    line(mouseX, mouseY, mouseX, mouseY-crossmod);
  }

  void bang()
  {
    if (text.bullets>0)
    {
      stroke(#DD6435);

      float segments=9;
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
        float  x= mouseX - sin(theta) * r;
        float  y= mouseY + cos(theta) * r;

        line(mouseX, mouseY, x, y);
      }
    }//end for
  }//end bang
}//end of the class

