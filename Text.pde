class Text 
{
  
  int kills=0;
  int bullets=5;
  float x, y;
  int points=0;

  String kill = "Lacha marbh:";
  String bleft ="Piléar fágtha:";
  String score="Scór:";
  void render()
  {
    x=10;
    y=height*.9;

    fill(0);
    text(kill+kills, x, y);
    text(bleft+bullets, x,y*1.05);
    text(score+points,x,y*1.10);

  }
 
}

