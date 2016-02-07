class Bear  extends GO
{

  int bear;
  PVector bloc;//bear locoation
  boolean l;
  AudioPlayer laugh;

  Bear()
  {
    bloc = new PVector((int)random(width), height); 
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
      ellipse(bloc.x, bloc.y, bear, bear);
      fill(255);
      ellipse(bloc.x+bear/5, bloc.y-(bear/8), bear/5, bear/4);//eye white right
      ellipse(bloc.x-bear/5, bloc.y-(bear/8), bear/5, bear/4);//eye  white left

      fill(0);
      ellipse(bloc.x+bear/5, bloc.y-(bear/20), bear/10, bear/10);//eye black right
      ellipse(bloc.x-bear/5, bloc.y-(bear/20), bear/10, bear/10); //eye black left

      ellipse(bloc.x, bloc.y+5, bear/4, bear/8);//nose

      fill(#8b6337);
      //ears
      ellipse(bloc.x+bear/2, bloc.y-(bear/2), bear/2, bear/2);//inner ear
      ellipse(bloc.x-bear/2, bloc.y-(bear/2), bear/2, bear/2); //inner ear

      //body
      ellipse(bloc.x, bloc.y+(bear), bear*.9, bear*1.8);

      //innerbody
      fill(#6b5238);
      ellipse(bloc.x, bloc.y+(bear), bear/1.2, bear/1.2);
      fill(#8b6337);

      //arms
      ellipse(bloc.x-bear/1.9, bloc.y+bear, bear/2, bear/1.2);//left
      ellipse(bloc.x+bear/1.9, bloc.y+bear, bear/2, bear/1.2);//right

      //legs
      ellipse(bloc.x+(bear/3), bloc.y+(bear*1.8), bear/3, bear/1.2);//right
      ellipse(bloc.x-(bear/3), bloc.y+(bear*1.8), bear/3, bear/1.2);//left

      //feet
      ellipse(bloc.x+(bear/3), bloc.y+(bear*2.3), bear/4, bear/3.5);//right
      ellipse(bloc.x-(bear/3), bloc.y+(bear*2.3), bear/4, bear/3.5);//left
      bloc.y--;
      if (bloc.y<=height/2)
      {
        bloc.y=height*2;
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

