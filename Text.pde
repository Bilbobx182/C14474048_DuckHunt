class Text 
{

  int kills;
  int bullets;
  float x, y;
  int points;
  int escaped;

  Text()
  {
    x=10;
    y=height*.9;
    kills=points=0;
    bullets=5;
    escaped=0;
  }

  void render()
  {
    if (bullets<=0)
    {
      reboot();
    } else
    {

      textFont(font2);
      fill(0);
      text("Lacha marbh:"+kills, x, y);
      text("Piléar fágtha:"+bullets, x, y*1.05);
      text("Scór:"+points, x, y*1.10);
      text("Scaoilte"+escaped, width-(width/2), y);
    }
  }
  
  void reboot()
  {
    background(0);
    text("GAME OVER", width/2, height/2);
    text("PRESS 9 THEN 2 to Restart!",width/2,height/2 +20);
  }
}

