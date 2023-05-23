public class Map{
  private char[][] map;
  private int mode;
<<<<<<< HEAD
  //private Coordinate start,end;
=======
  private Coordinate start,end;
>>>>>>> ea3cb70bce2c2f61d093c34748f54d63d5849980
  
  public Map(int mo){
    map = new char[20][18];
    mode = mo;
<<<<<<< HEAD
=======
    start = new Coordinate(
>>>>>>> ea3cb70bce2c2f61d093c34748f54d63d5849980
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
