public class Submarine {
  private int positionX, positionY, degrees; // set to a default value later maybe

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
    if (degrees <= 45) {
      changePos(getPosX(), getPosY()-1);
    } else if (degrees <= 90) {
      changePos(getPosX() + 1, getPosY() - 1);
    } else if (degrees <= 135) {
      changePos(getPosX() + 1, getPosY());
    } else if (degrees <=180) {
      changePos(getPosX() + 1, getPosY() + 1);
    } else if (degrees <= 225) {
      changePos(getPosX(), getPosY() + 1);
    } else if (degrees <= 270) {
      changePos(getPosX() - 1, getPosY() + 1);
    } else if (degrees <= 315) {
      changePos(getPosX() - 1, getPosY());
    } else {
      changePos(getPosX() - 1, getPosY() - 1);
    }
  }

  public void calcBackward(int degrees) {
    if (degrees <= 45) {
      changePos(getPosX(), getPosY()+1);
    } else if (degrees <= 90) {
      changePos(getPosX() - 1, getPosY() + 1);
    } else if (degrees <= 135) {
      changePos(getPosX() - 1, getPosY());
    } else if (degrees <=180) {
      changePos(getPosX() - 1, getPosY() - 1);
    } else if (degrees <= 225) {
      changePos(getPosX(), getPosY() - 1);
    } else if (degrees <= 270) {
      changePos(getPosX() + 1, getPosY() - 1);
    } else if (degrees <= 315) {
      changePos(getPosX() + 1, getPosY());
    } else {
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
