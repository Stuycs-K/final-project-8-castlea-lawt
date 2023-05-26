public class Submarine {
  private int positionX, positionY, degrees; // set to a default value later maybe

  public int getPosX() {
    return positionX;
  }

  public int getPosY() {
    return positionY;
  }

  public Submarine(int x, int y) {
    positionX = x;
    positionY = y;
  }

  public void changePos(int x, int y) {
    if ( getAt(x, y) = '#') {
    } else {
      positionX = x;
      positionY = y;
    }
  }

  void calcDirection(degrees) {
    //quadrant 1: degrees 0-90
    //quadrant 2: degrees 91-180
    //quadrant 3: degrees 181-270
    //quadrant 4: degrees 271-360
    if (degrees <= 45) {
      changePos(getPosX(), getPosY()-1);
    }
    else if(degrees <= 90){
      changePos(getPosX() + 1, getPosY() - 1);
    }
    else if(degrees <= 135){
      changePos(getPosX() + 1, getPosY());
    }
    else if(degrees <=180){
      changePos(getPosX() + 1, getPosY() + 1);
    }
    else if(degrees <= 225){
      changePos(getPosX(), getPosY() + 1);
    }
    else if(degrees <= 270){
      changePos(getPosX() - 1, getPosY() + 1);
    }
    else if(degrees <= 315){
      changePos(getPosX() - 1, getPosY());
    }
    else{
      changePos(getPosX() - 1, getPosY() - 1);
    }
  }

  void keyPressed() {
    if (key == CODED) {
      if (keyCode == UP) {
        changePos(getPosX(), getPosY() - 1);
      } else if (keyCode == DOWN) {
        changePos(getPosX(), getPosY() + 1);
      } else if (keyCode == LEFT) {
        degrees--;
        if (degrees < 0) {
          degrees = 0;
        }
        //changePos(getPosX() - 1, getPosY());
      } else {
        //changePos(getPosX() + 1, getPosY());
        degrees++;
        if (degrees > 360) {
          degrees = 0;
        }
      }
    }
  }
}
