import ddf.minim.*; //<>//
import processing.serial.*;

Minim song1; //setting songs(1-4) to play
Minim song2;
Minim song3;
Minim song4;
AudioPlayer player1; //audio player(1-4)
AudioPlayer player2;
AudioPlayer player3;
AudioPlayer player4;
AudioMetaData data1;
AudioMetaData data2;
AudioMetaData data3;
AudioMetaData data4;

Serial myPort;  // Create object from Serial class
int inByte;  //val to hold incoming data

int x;//rect position

void setup(){
  size(640,480); //Screen settings
  background(100,100,100);//
  
  x = (width/2) - (200/2);
  
  song1 = new Minim(this);
  song2 = new Minim(this);
  song3 = new Minim(this);
  song4 = new Minim(this);
  player1 = song1.loadFile( "Im_ok.mp3");
  player2 = song1.loadFile( "Lazy_Song.mp3");
  player3 = song1.loadFile( "Starting_Something.mp3");
  player4 = song1.loadFile( "Till_I_Collapse.mp3");

  //String portName = Serial.list()[0]; //change the 0 to a 1 or 2 etc. to match your port
  //myPort = new Serial(this, portName, 9600);
  //printArray(Serial.list()); //checks all ports 
  //myPort.clear();// Clear out the first reading, in case we started reading in the mid of a value.
}

void serialEvent (Serial myPort) {
  if (myPort.available() > 0) {  // If data is available.
    inByte = myPort.read();
    println("bytes:"+inByte);
  }
}

void draw(){
  background(100,100,100);//
  InfoTxt();
  
  if(player1.isPlaying() == false && player2.isPlaying() == false && player3.isPlaying() == false && player4.isPlaying() == false){
    MainMenu();  
    //SongSelect();
  }
  
  if(keyPressed && key == 'q' && player2.isPlaying() == false && player3.isPlaying() == false && player4.isPlaying() == false){
    player1.play();
    //println("song 1" + player1.isPlaying());
  }
  if(keyPressed && key == 'w' && player1.isPlaying() == false && player3.isPlaying() == false && player4.isPlaying() == false){
     player2.play();
     //println("song 2" + player2.isPlaying());
  }
  if(keyPressed && key == 'e' && player1.isPlaying() == false && player2.isPlaying() == false && player4.isPlaying() == false){
     player3.play();
     //println("song 3" + player3.isPlaying());
  }
  if(keyPressed && key == 'r' && player1.isPlaying() == false && player2.isPlaying() == false && player3.isPlaying() == false){
     player4.play();
     //println("song 4" + player4.isPlaying());
  }

  SongScreen(player1);
  SongScreen(player2);
  SongScreen(player3);
  SongScreen(player4);
}

void SongScreen(AudioPlayer name){
  int Xpos = (width/2) - (name.length() / width)/2;
  
  if(name.isPlaying() == true){
    noStroke();
    fill(0,0,0);// black background
    rect( Xpos, (height/2), name.length() / width, 50);// total song length
    
    fill(255,0,0);// red status bar
    rect(Xpos, (height/2), (name.position()/ width), 50);// current song position
    
    text((name.position()/1000), (Xpos), (height/2)+70);// display cur/total time
    text("/" + (name.length()/1000) + " Seconds", (Xpos + 30), (height/2)+70);// display total time
    
  if(keyPressed && key == 'p'){name.pause(); println("draw pause symbol next to paused song");}
  }
}


void SongSelect(){
  if(inByte == 1){
    player1.play();
  }
  
  if(inByte == 2){}
}

/*Copmmands
  .play();
  .pause();
  .rewind();
  .position();
  .length();
  .skip(milliseconds); //does fast forward(+num) && rewind(-num)
  .isPlaying(); //returns true or false
*/