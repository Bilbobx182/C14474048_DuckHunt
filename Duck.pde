class Duck
{
  int x, y, w;
  boolean dead;

  Duck()
  {
    x=width/2;
    y=height/2;
    w=30;
    dead=false;
  } 

  void render()
  {
    //feet
    stroke(255, 255, 0);
    line(x-(w/4), y, x, y+w);//left foot
    line(x-(w/4), y, x+(w/4), y+w);//right foot

    //visual hitbox for me to see
    rectMode(CENTER);
    fill(255, 0, 0, 60);
    rect(x-(w/2), y, w*3, w*3);
    fill(0);
    rectMode(CORNER);

    noStroke();
    //body
    // fill(random(160),random(240),random(200));
    ellipse(x, y, w+(w/2), w);
    //nose
    fill(235,165,61);
    ellipse(x-(w*1.5), y-(w/3), w+(w/10), w/2);
    fill(0);
    //head
    ellipse(x-w, y-(w/2), w, w);
    fill(255);
    //eyewhite
    ellipse(x-(w*1.2), y-(w/2), (w/4), (w/2));
    //eyeblack
    fill(0);
    ellipse(x-(w*1.2), y-(w/2.8), (w/6), (w/6));
    //wing STATE:1
    //rect(x-(w/4), y, w/2, -w);
    //wing STATE:2
    //rect(x-(w/4), y, w/2, +w);
  }

  void sound()
  {
  }
}

