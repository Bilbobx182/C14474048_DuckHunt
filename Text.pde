class Text extends GO
{
  int kills;
  int bullets;
  float x, y;
  int points;
  int escaped;
  int combo;
  int maxcombo;

  Text()
  {
    x=10;
    y=height*.9;
    kills=points=0;
    bullets=5;
    escaped=0;
    combo=0;
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
      text("Lacha marbh: "+kills, x, y);
      text("Piléar fágtha: "+bullets, x, y*1.05);
      text("Scór:"+points, x, y*1.10);
      text("Scaoilte: "+escaped, width-(width/2), y);
      text("Dreas Buili: "+combo, width-width/2, y*1.05);
       text("Uasmhéid Dreas Buili: "+maxcombo, width-width/2, y*1.10);
    }

    if (maxcombo< combo)
    {
      maxcombo=combo;
    }
  }

  void reboot()
  {
    if (stats[0].shots < text.points)
    {
      stats[0].shots=text.points;
      output2.flush();
    }
    if (stats[0].kills<text.maxcombo)
    {
      stats[0].kills=text.maxcombo;
      output2.flush();
    }
    background(0);
    textAlign(CENTER);
    text("Deireadh an gcluiche, 'sé do scór ná: " + points, width/2, height/2);
    text("Brú  9 ansin 2 chun chur tús leis arís !", width/2, height/2 +20);
    textAlign(LEFT);
    output();
  }
}

