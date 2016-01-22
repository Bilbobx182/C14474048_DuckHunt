class Bear  extends GO
{
  int bx, by;
  int bear;
  boolean l;
  AudioPlayer laugh;

  Bear()
  {
    bx=(int)random(width);
    by=height;
    bear=75;
    laugh = minim.loadFile("laugh.wav");
    l=false;
  }


  void render()
  {
    if (text.escaped == 5)
    {
      noStroke();
      fill(#8b6337);

      //head
      ellipse(bx, by, bear, bear);
      fill(255);
      ellipse(bx+bear/5, by-(bear/8), bear/5, bear/4);//eye white right
      ellipse(bx-bear/5, by-(bear/8), bear/5, bear/4);//eye  white left
      fill(0);
      ellipse(bx+bear/5, by-(bear/20), bear/10, bear/10);//eye black right
      ellipse(bx-bear/5, by-(bear/20), bear/10, bear/10); //eye black left
      ellipse(bx, by+5, bear/4, bear/8);//nose

      fill(#8b6337);
      //ears
      ellipse(bx+bear/2, by-(bear/2), bear/2, bear/2);//inner ear
      ellipse(bx-bear/2, by-(bear/2), bear/2, bear/2); //inner ear

      //body
      ellipse(bx, by+(bear), bear*.9, bear*1.8);

      //innerbody
      fill(#6b5238);
      ellipse(bx, by+(bear), bear/1.2, bear/1.2);
      fill(#8b6337);

      //arms
      ellipse(bx-bear/1.9, by+bear, bear/2, bear/1.2);//left
      ellipse(bx+bear/1.9, by+bear, bear/2, bear/1.2);//right

      //legs
      ellipse(bx+(bear/3), by+(bear*1.8), bear/3, bear/1.2);//right
      ellipse(bx-(bear/3), by+(bear*1.8), bear/3, bear/1.2);//left

      //feet
      ellipse(bx+(bear/3), by+(bear*2.3), bear/4, bear/3.5);//right
      ellipse(bx-(bear/3), by+(bear*2.3), bear/4, bear/3.5);//left
      by--;
      if (by<=height/2)
      {
        by=height*2;
      }
    }
  }

  void sound()
  {
    if (text.escaped == 5 && l == false)
    {
      laugh.play();
      l=true;
    }
  }
}

