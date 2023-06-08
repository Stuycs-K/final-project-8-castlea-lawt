import processing.sound.*;
public class Submarine {
  private int positionX, positionY, degrees; // set to a default value later maybe
  private static final int xMax = 20;
  private static final int yMax = 18;
  private int oxygen, change, time, max;
  
  public void leak(){
   oxygen -= change; 
   //return ox;
  }
  
  public int getOx(){
   return oxygen; 
  }
  
  public int getCh(){
   return change; 
  }
  
  public int getTi(){
   return time; 
  }
  
  public int getM(){
   return max; 
  }
  
  public void setO2(int ox){
    oxygen = ox;
    max = oxygen;
  }
  
  public void setChange(int ch){
     change = ch; 
  }
  
  public void setTime(int rate){
   time = rate; 
  }
  
  public int getXMax(){
   return xMax; 
  }
  
  public int getYMax(){
    return yMax;
  }
  
  public int getPosX() {
    return positionX;
  }

  public int getPosY() {
    return positionY;
  }

  public int getDeg() {
    return degrees;
  }

  public void changeDeg(int newDeg) {
    degrees= newDeg;
  }

  public Submarine(int x, int y) {
    positionX = x;
    positionY = y;
  }

  public void changePos(int x, int y) {
    println("changing pos");
    char wall = layout.getAt(x, y);
    if (wall == '#') {
      audio[1].play();
      println("wall");
    } else {
      audio[4].play();
      if(layout.getMode()==layout.EASY){
        subShape.translate((x*layout.SQUARESIZE)-(positionX*layout.SQUARESIZE),(y*layout.SQUARESIZE)-(positionY*layout.SQUARESIZE));
      }
      positionX = x;
      positionY = y;
    }
  }

  public void calcForward(int degrees) {
    if (degrees <= 45 && getPosY() > 0) {
      changePos(getPosX(), getPosY()-1);
    } else if (degrees <= 90 && (getPosY() > 0 && getPosX() < xMax - 1)) {
      changePos(getPosX() + 1, getPosY() - 1);
    } else if (degrees <= 135 && getPosX() < xMax - 1) {
      changePos(getPosX() + 1, getPosY());
    } else if (degrees <=180 && (getPosY() < yMax - 1 && getPosX() < xMax - 1)) {
      changePos(getPosX() + 1, getPosY() + 1);
    } else if (degrees <= 225 && getPosY() < yMax - 1) {
      changePos(getPosX(), getPosY() + 1);
    } else if (degrees <= 270 && (getPosY() < yMax - 1 && getPosX() > 0)) {
      changePos(getPosX() - 1, getPosY() + 1);
    } else if (degrees <= 315 && getPosX() > 0) {
      changePos(getPosX() - 1, getPosY());
    } else if (degrees <= 359 && (getPosX() > 0 && getPosY() > 0)) {
      changePos(getPosX() - 1, getPosY() - 1);
    }
  }

  public void calcBackward(int degrees) {
    if (degrees <= 45 && getPosY() < yMax - 1) {
      changePos(getPosX(), getPosY()+1);
    } else if (degrees <= 90 && (getPosY() < yMax - 1 && getPosX() > 0)) {
      changePos(getPosX() - 1, getPosY() + 1);
    } else if (degrees <= 135 && getPosX() > 0) {
      changePos(getPosX() - 1, getPosY());
    } else if (degrees <=180 && (getPosX() > 0 && getPosY() > 0)) {
      changePos(getPosX() - 1, getPosY() - 1);
    } else if (degrees <= 225 && getPosY() > 0) {
      changePos(getPosX(), getPosY() - 1);
    } else if (degrees <= 270 && (getPosY() > 0 && getPosX() < xMax - 1)) {
      changePos(getPosX() + 1, getPosY() - 1);
    } else if (degrees <= 315 && getPosX() < xMax - 1) {
      changePos(getPosX() + 1, getPosY());
    } else if (degrees <= 359 && (getPosY() < yMax - 1 && getPosX() < xMax - 1)) {
      changePos(getPosX() + 1, getPosY() + 1);
    }
  }
}
