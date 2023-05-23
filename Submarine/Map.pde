public class Map{
  private char[][] map;
  private int mode;
  //private Coordinate start,end;
  
  public Map(int mo){
    map = new char[20][18];
    mode = mo;
  }
  
  public void makeMap(){
    for(int i = 0; i<map.length;i++){
      for(int x = 0; x<map[0].length; x++){
        map[i][x] = '#';
      }
    }
    carveMap();
  }
  
  private void carveMap(){
    
  }
}
