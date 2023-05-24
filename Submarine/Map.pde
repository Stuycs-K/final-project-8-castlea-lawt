public class Map{
  private char[][] map;
  private int SQUARESIZE;
  private Coordinate start;
  
  public Map(){
    map = new char[20][18];
    SQUARESIZE = 5;
    start = new Coordinate(3,4);
    makeMap();
  }
  
  public void makeMap(){
    for(int i = 0; i<map.length;i++){
      for(int x = 0; x<map[0].length; x++){
        map[i][x] = '#';
      }
    }
    map[start.getX()][start.getY()] = ' ';
    for(int i = 0; i<180; i++){
      int x = (int)(Math.random()*20);
      int y = (int)(Math.random()*18);
      map[x][y]=' ';
    }
  }
  
  void keyPressed(){
    if(key == 'N'||key=='n'){
      display();
    }
    if(key == 'C' || key == 'c'){
      cheatDisplay();
    }
  }
  
  public void display(){
    noStroke();
    for(int i = 0;i<20;i++){
      for(int x = 0; x<18; x++){
        char working = map[i][x];
        if(working==' '){
          if(map[i-1][x]=='#'&&map[i][x-1]=='#'){
            fill(0);
            triangle(i*SQUARESIZE,x*SQUARESIZE,i*SQUARESIZE+SQUARESIZE,x*SQUARESIZE,i*SQUARESIZE,x*SQUARESIZE+SQUARESIZE);
          }
          else{
            if(map[i+1][x]=='#'&&map[i][x]=='#'){
              fill(0);
              triangle(i*SQUARESIZE+SQUARESIZE,x*SQUARESIZE+SQUARESIZE,i*SQUARESIZE+SQUARESIZE,x*SQUARESIZE,i*SQUARESIZE,x*SQUARESIZE+SQUARESIZE);
            }
            else{
              fill(0,100,0);
              rect(i*SQUARESIZE,x*SQUARESIZE,SQUARESIZE,SQUARESIZE);
            }
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
