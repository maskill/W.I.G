import ddf.minim.*; //<>//
import processing.serial.*;

Minim songList; //setting songs(1-4) to play

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

int currSong;
int x;//rect position

void setup(){
  size(640,480); //Screen settings
  background(100,100,100);//
  
  x = (width/2) - (200/2);
  
  songList = new Minim(this);

  player1 = songList.loadFile( "Im_ok.mp3");
  player2 = songList.loadFile( "Lazy_Song.mp3");
  player3 = songList.loadFile( "Starting_Something.mp3");
  player4 = songList.loadFile( "Ridin_Solo.mp3");

  String portName = Serial.list()[0]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);
  printArray(Serial.list()); //checks all ports 
  myPort.clear();// Clear out the first reading, in case we started reading in the mid of a value.
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
    SongSelect();
  }
  Controller(currSong);

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
  }
}


void SongSelect(){
  if(inByte == 1){
    player1.play();
    currSong = 1;
    println("song1");
  }
  
  if(inByte == 2){
    player2.play();
    currSong = 2;
    println("song2");
    delay(15);
  }

  if(inByte == 3){
    player3.play();
    currSong = 3;
    println("song3");
  }

  if(inByte == 4){
    player4.play();
    currSong = 4;
    println("song4");
  }
}


void Controller(int songNum){
  if(songNum == 1){
    if(inByte == 2){player1.pause();}
    if(inByte == 3){player1.skip(-1000);}
    if(inByte == 4){player1.skip(500);}
  }

  if(songNum == 2){
    if(inByte == 2){player2.pause();}
    if(inByte == 3){player2.skip(-1000);}
    if(inByte == 4){player2.skip(500);}
  }
  
  if(songNum == 3){
    if(inByte == 2){player3.pause();}
    if(inByte == 3){player3.skip(-1000);}
    if(inByte == 4){player3.skip(500);}
  }
  
  if(songNum == 4){
    if(inByte == 2){player4.pause();}
    if(inByte == 3){player4.skip(-1000);}
    if(inByte == 4){player4.skip(500);}
  }
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