//draws 4 boxes and displays name of audio files in them.
void MainMenu(){
  data1 = player1.getMetaData();
  data2 = player2.getMetaData();
  data3 = player3.getMetaData();
  data4 = player4.getMetaData();
  
  for(int i=1; i <=4; i++){
    stroke(0,63,200);
    fill(0,83,190, 100);
    rect(x, i*80, 200, 60);
  }
  
  textSize(14);
  stroke(255,255,255);
  fill(255);
  text(data1.fileName(), x+10, (1*80)+35);
  text(data2.fileName(), x+10, (2*80)+35);
  text(data3.fileName(), x+10, (3*80)+35);
  text(data4.fileName(), x+10, (4*80)+35);
}