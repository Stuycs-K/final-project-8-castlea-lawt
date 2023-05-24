public class Map{
  private char[][] map;
  private int mode;
  private Coordinate start;
  
  public Map(int mo){
    map = new char[20][18];
    mode = mo;
    start = new Coordinate(3,4);
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
  
  public void display(){
    for(int i = 0;i<20;i++){
      for(int x = 0; x<18; x++){
        char working = map[i][x];
        if(working==' '){
          if(map[i-1][x]=='#'&&map[i][x-1]=='#'){
            
          }
        }
      }
    }
  }
}
