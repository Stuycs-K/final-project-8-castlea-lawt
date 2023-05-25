public class Map{
  private char[][] map;
  private int mode, SQUARESIZE;
  private Coordinate start;
  
  public Map(int mo){
    map = new char[20][18];
    mode = mo;
    SQUARESIZE = 30;
    start = new Coordinate(3,4);
    makeMap();
  }
  
  public char getAt(int x, int y){
    return map[x][y];
  }
  
  public void makeMap(){
    for(int i = 0; i<map.length;i++){
      for(int x = 0; x<map[0].length; x++){
        map[i][x] = '#';
      }
    }
    map[start.getX()][start.getY()] = ' ';
    for(int i = 0; i<250; i++){
      int x = (int)(Math.random()*20);
      int y = (int)(Math.random()*18);
      map[x][y]=' ';
    }
  }
  
  void mouseClicked(){
    if(mode == 1){
      display();
    }
    if(mode == 2){
      cheatDisplay();
    }
  }
  
  public void display(){
    noStroke();
    rectMode(CORNER);
    for(int i = 0;i<20;i++){
      for(int x = 0; x<18; x++){
        char working = map[i][x];
        if(working==' '){
          if(i>0&&x>0){
            if(map[i-1][x]=='#'&&map[i][x-1]=='#'){
              fill(0);
              triangle(i*SQUARESIZE,x*SQUARESIZE,i*SQUARESIZE+SQUARESIZE,x*SQUARESIZE,i*SQUARESIZE,x*SQUARESIZE+SQUARESIZE);
              map[i][x]='/';
              fill(0,50,0);
              triangle(i*SQUARESIZE+SQUARESIZE,x*SQUARESIZE+SQUARESIZE,i*SQUARESIZE+SQUARESIZE,x*SQUARESIZE,i*SQUARESIZE,x*SQUARESIZE+SQUARESIZE);
            }
            else{
              if(i<map.length-1){
                if(map[i+1][x]=='#'&&map[i][x]=='#'){
                  fill(0);
                  triangle(i*SQUARESIZE+SQUARESIZE,x*SQUARESIZE+SQUARESIZE,i*SQUARESIZE+SQUARESIZE,x*SQUARESIZE,i*SQUARESIZE,x*SQUARESIZE+SQUARESIZE);
                  map[i][x]='>'; //meant to be \, but that doesn't work as a char
                  fill(0,50,0);
                  triangle(i*SQUARESIZE,x*SQUARESIZE,i*SQUARESIZE+SQUARESIZE,x*SQUARESIZE,i*SQUARESIZE,x*SQUARESIZE+SQUARESIZE);
                }
                else{
                  fill(0,50,0);
                  rect(i*SQUARESIZE,x*SQUARESIZE,SQUARESIZE,SQUARESIZE);
                }
              }
              else{
                 fill(0,50,0);
                 rect(i*SQUARESIZE,x*SQUARESIZE,SQUARESIZE,SQUARESIZE);
               }
            }
          }
          else{
            fill(0,50,0);
             rect(i*SQUARESIZE,x*SQUARESIZE,SQUARESIZE,SQUARESIZE);
          }
        }
        else{
          fill(0);
          rect(i*SQUARESIZE,x*SQUARESIZE,SQUARESIZE,SQUARESIZE);
        }
      }
    }
  }
  
  public void cheatDisplay(){

    
  }
}
