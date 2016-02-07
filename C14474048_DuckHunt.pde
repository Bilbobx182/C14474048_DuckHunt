/*C14474048 ASSIGNMENT 2, FUNDAMENTAL IDEA. DUCK HUNT. */
int alt;
int hellmod, maxtiny;
int qcount;
PFont font2;
PFont font;
int px, py;
boolean paused;
import ddf.minim.*;
Minim minim;//for audio later
boolean dbool, nopew;

Crosshair crosshair;//crosshair and terrain
Text text;//displaying text
Duck duck;//basic duck
Duck d2; //menu duck
Bear bear;//laughing bear
Stats[] stats =  new Stats [1];

void setup ()
{
  size(700, 700);
  minim = new Minim(this);
  alt=1;
  qcount=0;
  hellmod=20;
  maxtiny=3;
  font2=loadFont("CoolveticaRg-Regular-15.vlw");

  //GAME BGM
  AudioPlayer BGM;
  BGM = minim.loadFile("wolfpack.mp3");
  BGM.play();
  BGM.loop();

  //functions that need to be called.
  loaddata();
  setupobjects();
  stats[0].plays++;
  output();
  noCursor();//hides cursor.
  font = loadFont("Aniron-24.vlw");
  font2=loadFont("CoolveticaRg-Regular-15.vlw");
}

//-----Objects-------------
void setupobjects()
{
  crosshair = new Crosshair();
  text = new Text();
  duck= new Duck();
  d2=new Duck();
  bear=new Bear();
  d2.w = d2.w * 3 ;
  d2.x=width-d2.w;
  d2.y=height-d2.w;
}
//-------------INTRO------
void Intro()
{
  String I1="TORRAÍOCHT NA LACHA";
  String I2=" Brú anseo chun tosaigh!";
  textFont(font);
  //INTRO SCREEN
  background(#7ec0ee);

  rectMode(CENTER);
  strokeWeight(9);
  stroke(#996515);
  fill(#ccac00);
  rect(width/2, 0, textWidth(I1), height/3);
  fill(0);
  noStroke();
  rectMode(CORNER);

  textAlign(CENTER);
  text(I1, width/2, height/8);
  text(I2, width/2, height/4);


  text("deaschliceáil anseo", width/2, height-(height/3));
  text("le haghaidh d'uas-scór", width/2, height-(height/3.5));
  textAlign(LEFT);
  textFont(font2);
  strokeWeight(2);
  d2.render();
}
//---------LOAD DATA-------------
void loaddata()
{

  stats[0]=new Stats();

  String[] s2 = loadStrings("stats.csv");
  int i=0;

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

//------------FILES-------------------
//CREATING PERSISTANT DATA, so that it can read in and write out high scores.
PrintWriter output2;
void output()
{
  // output1 = createWriter("highscore.csv"); 

  //writes the stats to the folder of "data" so that it saves to the same place it read in.
  output2 = createWriter("data/stats.csv"); 
  output2.print(stats[0].kills);
  output2.print(",");
  output2.print(stats[0].shots);
  output2.print(",");
  output2.print(stats[0].plays);

  output2.flush();  // Writes the data
  output2.close();
}

int prealt;
//-----------DRAW--------------
void draw()
{
  if (alt!=3)
  {
    prealt=alt;
  }
  //dealing with each screen.
  if (alt==1)
  {
    cursor(HAND);
  } else
  {
    noCursor();
  }
  switch (alt)
  { 
  case 1:

    Intro();
    break;

  case 2:
  //each element of the main game and it being called depending on it all.
    bgm();
    crosshair.mountain();
    crosshair.ch();

    duck.bound();
    duck.sound();
    duck.bound();
    duck.render();
    if (dbool)
    {//checking to see if the duck is dead, if it is draw a dead duck and increment the y axis of the dead duck/
      duck.deadduck();
      duck.dy+=5;
    }
    crosshair.render();
    crosshair.rc();
    text.render();
    duck.movement();
    bear.render();
    bear.sound();
    break;

  case 3:
    Paused();
    break;

    //reset everything for when they want to play again
  case 9:
    setupobjects();
    alt=2;
    break;

  default:
    alt=1;
    break;
  }
}
//
void bgm()
{
  if (text.kills>-1 && text.kills<hellmod)

  {
    background(#7ec0ee);
  } else
  {
    background(#FFAEB9 );
    //makes the duck faster if it's in hellmode
    duck.mod=7;
  }
}

//------Mouseclicked---------
void mouseReleased()
{

  //checking to see if it's firing or opening the menu
  if (mouseButton == LEFT)
  {
    
    switch (alt)
    {
      //if they're in the main menu it won't decrement the counter and it will bring them to the game.
    case 1:
      if (mouseY<height/2)
      {
        alt=2;
      } else
      {
        alt=3;
      }

      break;

    case 2:
    //now if it's firing at ducks
      crosshair.bang();
      duck.dy=mouseY;
      duck.dx=mouseX;
      if (text.bullets>0)
      {
        //if it's over the duck and a shot is fired
        if (duck.mo == true)
        {
          qcount++;
          text.kills++; 
          if (duck.w > maxtiny)
          {
            duck.w-=random(.15);
          }

          duck.x=(int)random(width);
          duck.y=height-height/7;
          text.points=text.points+30;
          text.combo++;
          dbool=true;
          duck.dx=mouseX;
          duck.dy=mouseY;
          //combo bonus
          //a hidden minor combo bonus is added to the players score to make them feel special.
          if (text.combo % 10 == 0)
          {
            text.points=text.points + 50;
          }
        } else
        {
          text.bullets--;
          text.points=text.points-50;
          text.combo=0;
          dbool=false;
        }
        break;
      }
    }
  }

  if (mouseButton == RIGHT) 
  {
    if (paused==false)
    {
      paused=true;
      alt=3;
    }
    else
    {

      alt=prealt;
      paused=false;
    }
  }
}

void keyPressed()
{
  if (key >= '0' && key <='9' )
  {
    alt = key - '0';
  }
}

void Paused()
{

  background(255);
  fill(0);
  textAlign(CENTER);
  textFont(font);
  textSize(32);
  text("chur tú cluiche ar shos", width/2, height/9);
  textFont(font2);
  textSize(18);
  text("D'Uas scór  :" + stats[0].shots, width/2, height/2);
  text("Do dhreas buillí is mó  :"+stats[0].kills, width/2, height/2 +20);
  text("am imeartha  :"+stats[0].plays, width/2, height/2+50);
  textAlign(LEFT);
}

