public class Submarine {
  private int positionX, positionY, degrees, xMax, yMax; // set to a default value later maybe
  xMax = 20;
  yMax = 18;
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
    char wall = layout.getAt(x, y);
    if (wall == '#') {
    } else {
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
    } else if (degrees <= 270 && (getPosY() > yMax - 1 && getPosX() > 0)) {
      changePos(getPosX() - 1, getPosY() + 1);
    } else if (degrees <= 315 && getPosX() > 0) {
      changePos(getPosX() - 1, getPosY());
    } else if (degrees <= 360 && (getPosX() > 0 && getPosY() > 0)){
      changePos(getPosX() - 1, getPosY() - 1);
    }
  }

  public void calcBackward(int degrees) {
    if (degrees <= 45 && getPosY() < yMax - 1) {
      changePos(getPosX(), getPosY()+1);
    } else if (degrees <= 90 && (getPosY() > yMax - 1 && getPosX() > 0)) {
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
    } else if (degrees <= 360 && (getPosY() < yMax - 1 && getPosX() < xMax - 1)) {
      changePos(getPosX() + 1, getPosY() + 1);
    }
  }

  public void keyPressed() {
    //while (keyPressed) {
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
        radar.rotate(radians(-1));
        calcDirection(degrees);
        println("turning left");
      } else if (keyCode == RIGHT) {
        degrees++;
        if (degrees > 360) {
          degrees = 0;
        }
        radar.rotate(radians(1));
        calcDirection(degrees);
        println("turning right");
      }
    }
  }
  //}
}
