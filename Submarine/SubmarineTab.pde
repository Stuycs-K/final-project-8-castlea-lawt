public class Submarine {
  private int positionX, positionY; // set to a default value later maybe

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
    if (x < 0 ) {
      positionX = 0;
    }
    /*else if(x > //map len){
     positionX = //map len;
     }*/
    else {
      positionX = x;
    }

    if (y < 0 ) {
      positionY = 0;
    }
    /*else if(y > //map len){
     positionY = //map len;
     }*/
    else {
      positionY = y;
    }
  }

  void keyPressed() {
    if (key == CODED) {
      if (keyCode == UP) {
        changePos(getPosX(), getPosY() - 1);
      } else if (keyCode == DOWN) {
        changePos(getPosX(), getPosY() + 1);
      } else if (keyCode == LEFT) {
        changePos(getPosX() - 1, getPosY());
      } else {
        changePos(getPosX() + 1, getPosY());
      }
    }
  }
}
