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
    //for changing position
    // if there is a space at this coordinate then change
    // else stays the same
    if (Map.map[x][y] = '#') {
    } else {
      positionX = x;
      positionY = y;
    }
  }

  void calcDirection() {
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
