public class Coordinate{
  int[] coordinate;
  int coorX,coorY;
  public Coordinate(int x, int y){
    coorX = x;
    coorY = y;
    coordinate = new int[] {x,y};
  }
  
  public int getX(){
    return coorX;
  }
  public int getY(){
    return coorY;
  }
  public int[] getCoordinate(){
    return coordinate;
  }
  public void setX(int newX){
    coorX = newX;
  }
  public void setY(int newY){
    coorY = newY;
  }
}
