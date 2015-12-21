/*C14474048 ASSIGNMENT 2, FUNDAMENTAL IDEA. DUCK HUNT. */
int alt;
import ddf.minim.*;
Minim minim;//for audio later
Crosshair crosshair;//crosshair and terrain
Text text;//displaying text
Duck duck;//basic duck
Duck d2; //menu duck
Stats[] stats =  new Stats [1];
Highscores[] highscores = new Highscores[10];
PFont font;

void setup ()
{
  // minim = new Minim(this);
  size(600, 600);
  alt=1;
  loaddata();
  setupobjects();
  stats[0].plays++;
  output();
}

void Intro()
{
  PFont font;
  font = loadFont("Aniron-24.vlw");

  textFont(font);
  //INTRO SCREEN
  background(#7ec0ee);
  d2.render();  

  textAlign(CENTER);
  text("TORRAÍOCHT NA LACHA", width/2, height/3);
  text(" 'Duck Hunt' as Gaeilge", width/2, height/3 +d2.w);
  textAlign(LEFT);
  textFont(font);
  d2.render();
}


void draw()
{
  switch (alt)
  { 
  case 1:
    Intro();
    break;

  case 2:
   background(#7ec0ee);
   duck.movement();
    duck.render();
    duck.bound();
    crosshair.render();
    text.render();
    break;
  }
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
  d2=new Duck();
  d2.w = d2.w * 3 ;
  d2.x=width-d2.w;
  d2.y=height-d2.w;
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

void keyPressed()
{
  if (key >= '0' && key <='9' )
  {
    alt = key - '0';
  }
}

void mouseClicked()
{

  crosshair.bang();


}

