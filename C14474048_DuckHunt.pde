/*C14474048 ASSIGNMENT 2, FUNDAMENTAL IDEA. DUCK HUNT. */

import ddf.minim.*;
Minim minim;
Crosshair crosshair;
Text text;
Duck duck;
Stats[] stats =  new Stats [1];
Highscores[] highscores = new Highscores[10];


void setup ()
{
  minim = new Minim(this);
  size(600, 600);
 loaddata();
  setupobjects();
  stats[0].plays++;
  output();
}

//CREATING PERSISTANT DATA, so that it can read in and write out high scores.
PrintWriter output2;
void output()
{
  // output1 = createWriter("highscore.csv"); 

//writes the stats to the folder of "data" so that it saves to the same place it read in.
  output2 = createWriter("data/stats.csv"); 
  println(stats[0].kills, stats[0].shots, stats[0].plays);
  output2.print(stats[0].kills);
  output2.print(",");
  output2.print(stats[0].shots);
  output2.print(",");
  output2.print(stats[0].plays);
  
 output2.flush();  // Writes the data
 output2.close();  //Closes the file
}

void setupobjects()
{
  crosshair = new Crosshair();
  text = new Text();
  duck= new Duck();
}

void loaddata()
{
  for (int i=0; i<10; i++)
  {
    highscores[i] = new Highscores();
  }
  stats[0]=new Stats();
  String[] s1 = loadStrings("highscore.csv");
  String[] s2 = loadStrings("stats.csv");
  int i=0;

  for (String line : s1)
  {
    String[] splitter=line.split(",");

    highscores[i].i=Integer.parseInt(splitter[0]);
    highscores[i].score=Integer.parseInt(splitter[1]);
    i++;
  }
  i=0;
  for (String line : s2)
  {
    String[] splitter=line.split(",");
    stats[0].kills=Integer.parseInt(splitter[0]);
    stats[0].shots=Integer.parseInt(splitter[1]);
    stats[0].plays=Integer.parseInt(splitter[2]);
    i++;
  }
}

void draw()
{
  background(#7ec0ee);
  duck.render();
  crosshair.render();
  bound();
  text.render();
  //testing it loaded in.
  // println(stats[0].plays);
}
void bound()
{
  if (mouseX> (duck.x - duck.w * 2) && mouseX < (duck.x  + duck.w) && mouseY > (duck.y - duck.w) && mouseY < (duck.y  + duck.w) )
  {
    //   println("DUCK IS UNDER THE CROSSHAIR");
  } else
  {
    //  println("NOT");
  }
}

void mousePressed()
{
  text.render();
}

