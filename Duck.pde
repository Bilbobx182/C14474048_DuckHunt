class Duck extends GO
{
  float x, y, s;
  float w;
  int mod;
  float x2;//random x location to fly to.
  boolean mo;
  boolean db;//duck boole for the sound.
  AudioPlayer quack;

  int dx, dy;

  Duck()
  {
    s=1; // State of the wings
    x2=x=random(width);//xpos of the bird
    y=height/2;//ypos of the bird
    w=30;//width modifier used for both width and height
    db=true;
    mod=3; //y axis speed mod
    quack = minim.loadFile("quack.wav");
    mo=false;
  } 

  void deadduck()
  {
    //feet
    stroke(255, 255, 0);
    line(dx+(w/4), dy+(w*2.5), dx+(w/4), dy+w);//left foot
    line(dx-(w/4), dy+(w*2.5), dx-(w/4), dy+w);//right foot
    noStroke();

    //wings
    if (text.kills>=0 && text.kills<hellmod)
    {  
      fill(#49311C);
    } else
    {
      fill(#2BBBFF);
    }

    ellipse(dx+(dx/20), dy+w/2, w+(w/2), w-(w/4));
    ellipse(dx-(dx/20), dy+w/2, w+(w/2), w-(w/4));
    //body
    if (text.kills>=0 && text.kills<hellmod)
    {  
      fill(0);
    } else
    {
      fill(#007f00);
    }
    ellipse(dx, dy+(w*.8), w, w*2);

    //nose 
    fill(235, 165, 61);
    ellipse(dx-(w*.7), dy-(w/3), w+(w/10), w/2);

    //head
    if (text.kills>=0 && text.kills<hellmod)
    { 
      fill(0);
    } else
    {
      fill(#007f00);
    }
    ellipse(dx, dy-(w/2), w, w);

    //eyewhite
    fill(255);
    ellipse(dx-(w/3), dy-(w/2), (w/4), (w/2));

    //eyeblack
    fill(0);
    ellipse(dx-(w/3), dy-(w/2.8), (w/6), (w/6));
  }

  void render()
  {
    //NON HELL MODE DUCK SKIN
    //feet   
    fill(255, 255, 0);
    line(x-(w/4), y, x, y+w);//left foot
    line(x-(w/4), y, x+(w/4), y+w);//right foot
    fill(255, 255, 0);

    noStroke();
    //body
    if (text.kills>=0 && text.kills<hellmod)
    {
      fill(0);
    } else
    {
      fill(#007f00);
    }
    ellipse(x, y, w+(w/2), w);
    //nose
    if (text.kills>=0 && text.kills<hellmod)
    {
      fill(235, 165, 61);
    } else
    {
      fill(235, 165, 61);
    }
    //nose
    ellipse(x-(w*1.5), y-(w/3), w+(w/10), w/2);

    if (s==0)
    {
      //wing position up
      if (text.kills>=0 && text.kills<hellmod)
      {
        fill(#49311C);
      } else
      {
        fill(#2BBBFF);
      }
      ellipse(x, y-w, w-(w/3), w+(w/2));
      s++;
    } else if (s==1)
    {
      //wing position up state 2
      if (text.kills>=0 && text.kills<hellmod)
      {
        fill(#49311C);
      } else
      {
        fill(#2BBBFF);
      }
      ellipse(x, y-(w/2), w-(w/3), w+(w/2));
      s++;
    } else if (s==2)
    {
      //wing position down
      if (text.kills>=0 && text.kills<hellmod)
      {
        fill(#49311C);
      } else
      {
        fill(#2BBBFF);
      }
      ellipse(x, y+w, w-(w/3), w+(w/2));
      s++;
    } else if (s==3)
    {
      //wing position down
      if (text.kills>=0 && text.kills<hellmod)
      {
        fill(#49311C);
      } else
      {
        fill(#2BBBFF);
      }
      ellipse(x, y+w/2, w-(w/3), w+(w/2)); 
      s++;
    } else
    {
      s=0;
    }
    if (text.kills>=0 && text.kills<hellmod)
    {
      fill(0);
    } else
    {
      fill(#2BBBFF);
    }

    //head
    noStroke();
    if (text.kills>=0 && text.kills<hellmod)
    {
      fill(0);
    } else
    {
      fill(#007f00);
    }
    ellipse(x-w, y-(w/2), w, w);
    //eyewhite
    fill(255);
    ellipse(x-(w*1.2), y-(w/2), (w/4), (w/2));
    fill(0);
    ellipse(x-(w*1.2), y-(w/2.8), (w/6), (w/6));
  }

  void bound()
  {
    if (mouseX> (x - (w *2.5) ) && mouseX < (x  + (w *2.5)) && mouseY > (y - (w *2.5)) && mouseY < (y  + (w *2.5)) )
    {
      mo=true;
    } else
    {
      mo=false;
    }

    if (duck.y + w <=0)
    {
      if (text.bullets !=0)
      { 
        text.points-=25;
      }
      text.escaped++;
      y=height-w;
      x=(int)random(width);
      x2=(int)random((w*2),width-(w*2));

      text.combo = 0; //combo breaker if it escapes but doesn't break the max combo
    }
  }//end bound

  void movement()
  {
    if (duck.x>duck.x2 )
    {
      duck.x--;
      duck.y=duck.y-mod;
    } else
    {
      duck.x++;
      duck.y=duck.y-mod;
    }
  }


  void sound()
  {
    if (text.bullets>0)
    {
      if (db==true)
      {
        if (qcount%3==0)
        {
          quack.rewind();
          quack.play();
          db=false;
        }
      }

      if (duck.y > (height-(crosshair.ground *1.5)) && duck.y  > height/2 )
      {
        db=true;
      }
    }
  }
}

