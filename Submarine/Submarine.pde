public class SubmarineObj{
  private double positionX, positionY; // set to a default value later maybe

public double getPosX(){
 return positionX; 
}

public double getPosY(){
  return positionY;
}

public SubmarineObj(double x, double y){
  positionX = x;
  positionY = y;
}

public void changePos(double x, double y){
  if(x < 0 ){
    positionX = 0;
  }
  else if(x > //map len){
   positionX = //map len; 
  }
  else{
    positionX = x;
  }
  
   if(y < 0 ){
    positionY = 0;
  }
  else if(y > //map len){
   positionY = //map len; 
  }
  else{
    positionY = y;
  }
}

void keyPressed(){
 if(key == CODED){
  if(keyCode == UP){
   changePos(getPosX(), getPosY() - 1);
  }
  else if(keyCode == DOWN){
   changePos(getPosX(), getPosY() + 1);
  }
  else if(keyCode == LEFT){
   changePos(getPosX() - 1, getPosY());
  }
  else{
   changePos(getPosX() + 1, getPosY());
  }
 }
}

void draw(){
  //draw submarine on the map
}

void setup(){
  //set submarine at default position
}
}
