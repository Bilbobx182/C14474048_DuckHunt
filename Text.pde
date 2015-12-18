class Text 
{

  int kills;
  int bullets;
  float x, y;
  int points;

Text()
{
  x=10;
  y=height*.9;
  kills=points=0;
  bullets=5;
}

  void render()
  {
    fill(0);
    text("Lacha marbh:"+kills, x, y);
    text("Piléar fágtha:"+bullets, x, y*1.05);
    text("Scór:"+points, x, y*1.10);
  }
}

