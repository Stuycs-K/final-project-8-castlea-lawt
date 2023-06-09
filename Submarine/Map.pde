public class Map {
 private char[][] map;
  private int mode, SQUARESIZE;
  private Coordinate start;
  private String[] notes = new String[]{"They sent you here to die","You'll never make it out in time","Why are you still trying?","You were never meant to see these things","Secrets like this like to stay BURIED"};
  boolean cheat = false;
  int EASY = 0;
  int HARD = 1;
  int EXTRAHARD = 2;
  int randX = (int)(Math.random()*19)+1;
  int randY = (int)(Math.random()*17)+1;
  public Map(int mo) {
    map = new char[20][18];
    mode = mo;
    SQUARESIZE = 30;
    //int randX = (int)(Math.random()*20);
    //int randY = (int)(Math.random()*18);
    start = new Coordinate(randX, randY);
    makeMap();
  }
  
  public int getMode(){
    return mode;
  }
  public char getAt(int x, int y) {
    return map[x][y];
  }
  public void makeMap() {
    for (int i = 0; i<map.length; i++) {
      for (int x = 0; x<map[0].length; x++) {
        map[i][x] = '#';
      }
    }
    carve(start,2);
    for(int i = 0; i<2; i++){
      int x = (int)(Math.random()*19)+1;
      int y = (int)(Math.random()*17)+1;
      carve(new Coordinate(x,y),0);
    }
    for(int i = 0; i<tasks.size(); i++){
      carve(tasks.get(i),1);
    }
    makeEasterEggs();
  }
  
  public void carve(Coordinate startSpot, int special){
    int x = startSpot.getX();
    int y = startSpot.getY();
    if(special == 0){map[x][y]=' ';}
    if(special == 1){map[x][y]='*';}
    if(special == 2){map[x][y]='x';}
    int z = 0;
    while(z<50){
      int rand = (int)(Math.random()*5)+1;
      switch(rand){
        case 1:
        if(x>1){
          x--;
          z++;
        }
        break;
        case 2:
        if(x<map.length-2){
          x++;
          z++;
        }
        break; //
        case 3:
        if(y>1){
          y--;
          z++;
        }
        break;
        case 4:
        if(y<map[1].length-2){
          y++;
          z++;
        }
        break;
        default:
        if(x<map.length-2&&x>1&&y>1&&y<map[1].length-2){
          if(map[x-1][y]=='#'){
            map[x-1][y] = ' ';
          }
          if(map[x+1][y]=='#'){
            map[x+1][y] = ' ';
          }
          if(map[x][y-1]=='#'){
            map[x][y-1] = ' ';
          }
          if(map[x][y+1]=='#'){
            map[x][y+1] = ' ';
          }
          if(x<map.length-3){x+=2;}
          z++;
        }
        break;
      }
      if(map[x][y]=='#'){
        map[x][y] = ' ';
      }
    }
  }

  public void gotIt(int x,int y){
    if(map[x][y]=='*'){
      map[x][y] = '@';
      taskCounter++;
    }
    if(map[x][y]=='!'){
      map[x][y] = ' ';
    }
  }
  
  public void resetTasks(){
    for(int i = 0; i<tasks.size(); i++){
      map[tasks.get(i).getX()][tasks.get(i).getY()] = '*';
    }
  }
  
  public void makeEasterEggs(){
    int i = 0;
    while(i<5){
      int rX = (int)(Math.random()*19)+1;
      int rY = (int)(Math.random()*17)+1;
      if(map[rX][rY]==' '){
        map[rX][rY]='!';
        i++;
      }
    }
  }
  
  public void openNote(int whichNote){
    if(whichNote<notes.length){
      background(0);
      fill(255);
      textSize(150);
      textAlign(CENTER);
      text(notes[whichNote],width/4,height/4,width/2,2*height/3);
      textAlign(LEFT);
    }
  }

  public void display(){
    rectMode(CORNER);
    fill(0,150,200);
    rect(start.getX()*SQUARESIZE,start.getY()*SQUARESIZE,SQUARESIZE,SQUARESIZE);
    for(int i = 0;i<20;i++){
      for(int x = 0; x<18; x++){
        char working = map[i][x];
        if(working==' '||working=='!'){
          fill(#9AD5CA);
          rect(i*SQUARESIZE,x*SQUARESIZE,SQUARESIZE,SQUARESIZE);
        }
        else{
          if(working == '*'){
            fill(#c913ff);
            rect(i*SQUARESIZE,x*SQUARESIZE,SQUARESIZE,SQUARESIZE);
          }
          else{
            if(working == '@'){
              fill(#5c01fe);
              rect(i*SQUARESIZE,x*SQUARESIZE,SQUARESIZE,SQUARESIZE);
            }
            else{
              if(working =='!'){
                fill(0,0,200);
                rect(i*SQUARESIZE,x*SQUARESIZE,SQUARESIZE,SQUARESIZE);
              }
              else{
                if(working != 'x'){
                  fill(0);
                  rect(i*SQUARESIZE,x*SQUARESIZE,SQUARESIZE,SQUARESIZE);
                }
              }
            }
          }
        }
      }
    }
    if(mode==EASY){
      fill(100,0,100);
      shape(subShape);
    }
  }
}
