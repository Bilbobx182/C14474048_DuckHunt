class Text 
{
  int lives;
  int kills;
  float x, y;
  String input = "Saol fágtha:";
  String kill = "Lacha marbh:";
  String bleft ="Piléar fágtha:";
  String score="Scór:";
  void render()
  {
    x=10;
    y=height*.9;

    fill(0);
    text(input, x, y);
    text(kill, x,y*1.05);
    text(bleft,x,y*1.10);
    text(score,width-x*16,y);
  }
}

