public class Submarine{
  private double positionX, positionY; // set to a default value later maybe

public double getPosX(){
 return positionX; 
}

public double getPosY(){
  return positionY;
}

public Submarine(double x, double y){
  positionX = x;
  positionY = y;
}

public void changePos(double x, double y){
  positionX = x;
  positionY = y;
}

void keyPressed(){
 if(key == CODED){
  if(keyCode == UP){
   //change position accordingly 
  }
  else if(keyCode == DOWN){
   //change position accordingly 
  }
  else if(keyCode == LEFT){
    //change posit
  }
  else{
   //change positon 
  }
 }
}
}
