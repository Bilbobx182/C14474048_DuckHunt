class Duck
{
  int x, y, w, s;
  int mod;
  int x2;//random x location to fly to.
  boolean mo;
  boolean db;//duck boole for the sound.
  AudioPlayer quack;


  Duck()
  {
    s=1; // State of the wings
    x2=x=(int)random(width);//xpos of the bird
    y=height/2;//ypos of the bird
    w=30;//width modifier used for both width and height
    db=true;
    mod=3; //y axis speed mod
    quack = minim.loadFile("quack.wav");
    mo=false;
  } 

  void render()
  {
    //NON HELL MODE DUCK SKIN
    if (text.kills>=0 && text.kills<hellmod)
    {
      //feet
      stroke(255, 255, 0);
      line(x-(w/4), y, x, y+w);//left foot
      line(x-(w/4), y, x+(w/4), y+w);//right foot

      //    // visual hitbox for me to see
      //    rectMode(CENTER);
      //    fill(255, 0, 0, 60);
      //    rect(x-(w/2), y, w*3, w*3);
      //    fill(0);
      //    rectMode(CORNER);

      noStroke();
      //body
      fill(0);
      ellipse(x, y, w+(w/2), w);
      //nose
      fill(235, 165, 61);
      ellipse(x-(w*1.5), y-(w/3), w+(w/10), w/2);

      if (s==0)
      {
        //wing position up
        fill(#49311C);
        ellipse(x, y-w, w-(w/3), w+(w/2));
        s++;
      } else if (s==1)
      {
        //wing position up state 2
        fill(#49311C);
        ellipse(x, y-(w/2), w-(w/3), w+(w/2));
        s++;
      } else if (s==2)
      {
        //wing position down
        fill(#49311C);
        ellipse(x, y+w, w-(w/3), w+(w/2));
        s++;
      } else if (s==3)
      {
        //wing position down
        fill(#49311C);
        ellipse(x, y+w/2, w-(w/3), w+(w/2)); 
        s++;
      } else
      {
        s=0;
      }

      fill(0);
      //head
      ellipse(x-w, y-(w/2), w, w);
      fill(255);
      //eyewhite
      ellipse(x-(w*1.2), y-(w/2), (w/4), (w/2));
      //eyeblack
      fill(0);
      ellipse(x-(w*1.2), y-(w/2.8), (w/6), (w/6));
    } else
    {
      //feet
      stroke(255, 255, 0);
      line(x-(w/4), y, x, y+w);//left foot
      line(x-(w/4), y, x+(w/4), y+w);//right foot

      //    // visual hitbox for me to see
      //    rectMode(CENTER);
      //    fill(255, 0, 0, 60);
      //    rect(x-(w/2), y, w*3, w*3);
      //    fill(0);
      //    rectMode(CORNER);

      noStroke();
      //body
      fill(#007f00);
      ellipse(x, y, w+(w/2), w);
      //nose
      fill(235, 165, 61);
      ellipse(x-(w*1.5), y-(w/3), w+(w/10), w/2);

      if (s==0)
      {
        //wing position up
        fill(#2BBBFF);
        ellipse(x, y-w, w-(w/3), w+(w/2));
        s++;
      } else if (s==1)
      {
        //wing position up state 2
        fill(#2BBBFF);
        ellipse(x, y-(w/2), w-(w/3), w+(w/2));
        s++;
      } else if (s==2)
      {
        fill(#2BBBFF);
        //wing position down
        ellipse(x, y+w, w-(w/3), w+(w/2));
        s++;
      } else if (s==3)
      {
        fill(#2BBBFF);
        //wing position down
        ellipse(x, y+w/2, w-(w/3), w+(w/2)); 
        s++;
      } else
      {
        s=0;
      }

      fill(#007f00);
      //head
      ellipse(x-w, y-(w/2), w, w);
      fill(255);
      //eyewhite
      ellipse(x-(w*1.2), y-(w/2), (w/4), (w/2));
      //eyeblack
      fill(0);
      ellipse(x-(w*1.2), y-(w/2.8), (w/6), (w/6));
    }
  }

 

  void bound()
  {
    if (mouseX> (x - (w *2.5) ) && mouseX < (x  + (w *2.5 )) && mouseY > (y - (w *2.5 )) && mouseY < (y  + (w *2.5 )) )
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
      x2=(int)random(width);

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
    if (db==true)
    {
      quack.rewind();
      quack.play();
      db=false;
    }

    if (duck.y > (height-(crosshair.ground *1.5)) && duck.y  > height/2 )
    {
      db=true;
    }
  }
}

