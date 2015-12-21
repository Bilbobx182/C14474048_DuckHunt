class Duck
{
  int x, y, w, s;
  int mod;
  int x2;//random x location to fly to.
  boolean dead;

  Duck()
  {
    s=1;
    x=(int)random(width);
    y=height/2;
    w=30;
    dead=false;
    x2=(int)random(width);
    mod=3;
  } 

  void render()
  {
    //feet
    stroke(255, 255, 0);
    line(x-(w/4), y, x, y+w);//left foot
    line(x-(w/4), y, x+(w/4), y+w);//right foot

    //    //visual hitbox for me to see
    //    rectMode(CENTER);
    //    fill(255, 0, 0, 60);
    //    rect(x-(w/2), y, w*3, w*3);
    //    fill(0);
    //    rectMode(CORNER);

    noStroke();
    //body
    // fill(random(160),random(240),random(200));
    ellipse(x, y, w+(w/2), w);
    //nose
    fill(235, 165, 61);
    ellipse(x-(w*1.5), y-(w/3), w+(w/10), w/2);
   
    if (s==0)
    {
      //wing on body
      fill(#49311C);
      ellipse(x+w/3.8, y-(w*.2), w, w/2);
    } else if (s==1)
    {
      //wing position up
      fill(#49311C);
      ellipse(x, y-w, w-(w/3), w+(w/2));
    }
    else if (s==2)
    {
      //wing position down
      fill(#49311C);
      ellipse(x, y+w/2, w-(w/3), w+(w/2));
    } 
    else
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
  }
  //suppose it makes sense to put this here.
  void bound()
  {
    if (mouseX> (duck.x - duck.w * 2) && mouseX < (duck.x  + duck.w) && mouseY > (duck.y - duck.w) && mouseY < (duck.y  + duck.w) )
    {
      println("DUCK IS UNDER THE CROSSHAIR");
    } else
    {
      //  println("NOT");
    }
  }//end bound
  
  void movement()
  {
    if(duck.x>duck.x2 )
    {
      duck.x--;
      duck.y=duck.y-mod;
    }
    else
    {
      duck.x++;
      duck.y=duck.y-mod;
    }
    
  }


  void sound()
  {
  }
}

