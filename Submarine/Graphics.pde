import processing.sound.*;
SoundFile file;
SoundFile[] audio = new SoundFile[6];
String[] audNames = new String[]{"degree_tick.wav", "hit_wall.wav", "show_pic.wav", "soma_underwater.wav", "sub_move.wav", "take_pic.wav"};

PShape left, right, up, down, radar, subShape;
Map layout;
ArrayList<Coordinate>tasks = new ArrayList<Coordinate>(9);//randomized or not? + placeholder c
//int taskCounter = 0;
String[]images = new String[]{"task1.png", "task2.jpg", "task3.png", "task4.jpg", "task5.jpg", "task6.jpg", "task7.jpg", "task8.jpg", "task9.png"}; //9 imgs will manually add names of images later on
PImage[]loadedImg = new PImage[9];
PImage photo;
boolean displayImg = false;
boolean cheat = false;
boolean menu = true;
Submarine sub;
int countdown = 0;
int countMove = 0;
int flicker = 0;
int taskCounter = 0;
boolean flickMode = false;
static final int count = 5;
static final int mCount = 15;
int takePicCool = 0;
int showPicCool = 0;
int degCool = 0;


void displayScreen() {
  background(100, 0, 0);
  fill(183, 65, 14);
  ellipse(width/2, height/2-200, 500, 500);
  rectMode(CENTER);
  rect(width/2, height/2+255, 1000, 400);
  stroke(100);
  fill(50, 0, 0);
  ellipse(width/3, height/2+170, 200, 200);
  rect(width/3, height/2+310, 200, 75);
  rect(2*width/3, height/2+100, 200, 75);
  rect(2*width/3, height/2+180, 200, 75);
  left = createShape(RECT, width/4+75, height/2+400, 170, 100);
  right= createShape(RECT, width/3+85, height/2+400, 170, 100);
  up = createShape(RECT, 2*width/3, height/2+270, 100, 100);
  down = createShape(RECT, 2*width/3, height/2+375, 100, 100);
  shape(up);
  shape(down);
  shape(left);
  shape(right);
  fill(255);
  textSize(80);
  text("" + sub.getDeg(), width/4+70, height/2+340); //displaying degrees
  text("x: " + sub.getPosX(), 2*width/3 - 95, height/2 +120);
  text("y: " + sub.getPosY(), 2*width/3 - 95, height/2 +200);
  fill(100);
  stroke(0);
  triangle(width/4, height/2+400, width/3-10, height/2+450, width/3-10, height/2+350);
  triangle(width/3+155, height/2+400, width/3+10, height/2+450, width/3+10, height/2+350);
  triangle(2*width/3, height/2+225, 2*width/3+50, height/2+325, 2*width/3-50, height/2+325);
  triangle(2*width/3, height/2+425, 2*width/3+50, height/2+330, 2*width/3-50, height/2+330);
  fill(0, 155, 0);
  shape(radar);
}

void setup() {
  for(int i = 0; i < images.length; i++){
     loadedImg[i] = loadImage(images[i]); 
     loadedImg[i].resize(width/2, height/2);
  }
  for(int i = 0; i < audNames.length; i++){
   audio[i] = new SoundFile(this, audNames[i]); 
  }
  fullScreen();
  audio[3].play();
  tasks.add(new Coordinate(3, 4));
  tasks.add(new Coordinate(15, 16));
  tasks.add(new Coordinate(12, 16));
  tasks.add(new Coordinate(3, 10));
  tasks.add(new Coordinate(10, 6));
  tasks.add(new Coordinate(7, 13));
  tasks.add(new Coordinate(2, 14));
  tasks.add(new Coordinate(18, 16));
  tasks.add(new Coordinate(1, 10));
  //radar = createShape(TRIANGLE, width/3, height/2+100, width/3-10, height/2+200, width/3+10, height/2+200);
  radar = createShape();
  radar.beginShape();
  radar.vertex(width/3, height/2+100);
  radar.vertex(width/3-10, height/2+200);
  radar.vertex(width/3+10, height/2+200);
  radar.endShape(CLOSE);
  layout = new Map(0);
  sub = new Submarine(layout.randX, layout.randY);
  subShape = createShape();
  subShape.beginShape();
  subShape.vertex((sub.getPosX()*layout.SQUARESIZE),(sub.getPosY()*layout.SQUARESIZE)+15);
  subShape.vertex((sub.getPosX()*layout.SQUARESIZE)+15,sub.getPosY()*layout.SQUARESIZE);
  subShape.vertex((sub.getPosX()*layout.SQUARESIZE)+15,(sub.getPosY()*layout.SQUARESIZE)+30);
  subShape.endShape(CLOSE);
  //println(" " + layout.randX  + " " + layout.randY);
  //displayScreen();
}

void draw() {
  if(menu){
    menu();
  }
  else{
  displayScreen();
  layout.display();
  if(isDone()){
    endScreen();
    noLoop();
  }
  if (flicker > 0) {
    flicker--;
  }
  if (flicker == 0) {
    fill(#EFF2C0);
    if (sub.getPosX() != sub.getXMax() - 1 && layout.getAt(sub.getPosX()+1, sub.getPosY()) == '#') {
      circle(width/3 + 85, height/2 + 165, 20); //right
    }
    if (sub.getPosY() != sub.getYMax() - 1 && layout.getAt(sub.getPosX(), sub.getPosY() + 1) == '#') {
      circle(width/3, height/2 + 250, 20); // down
    }
    if (sub.getPosX() != 0 && layout.getAt(sub.getPosX() - 1, sub.getPosY()) == '#') {
      circle(width/3 - 85, height/2 + 165, 20); //left
    }
    if (sub.getPosY() != 0 && layout.getAt(sub.getPosX(), sub.getPosY() - 1) == '#') {
      circle(width/3, height/2 + 90, 20); //  top
    }
    if ((sub.getPosY() != 0 && sub.getPosX() != 0) && (layout.getAt(sub.getPosX() - 1, sub.getPosY() - 1) == '#')) {
      circle(width/3 - 63, height/2 + 115, 20); // upper left
    }
    if ((sub.getPosY() != sub.getYMax() - 1 && sub.getPosX() != sub.getXMax() - 1) && (layout.getAt(sub.getPosX() + 1, sub.getPosY() + 1) == '#')) {
      circle(width/3 + 60, height/2 + 230, 20); //bottom right
    }
    if ((sub.getPosY() != 0 && sub.getPosX() != sub.getXMax() - 1) && (layout.getAt(sub.getPosX() + 1, sub.getPosY()-1) == '#')) {
      circle(width/3 + 65, height/2 + 115, 20); //upper right
    }
    if ((sub.getPosX() != 0 && sub.getPosY() != sub.getYMax() - 1) && (layout.getAt(sub.getPosX() - 1, sub.getPosY() + 1) == '#')) {
      circle(width/3- 63, height/2+230, 20);  //bottom left
    }
    if (flickMode) {
      flicker += 60;
    }
  }

  if (countdown > 0) {
    countdown--;
  }
  if( countMove > 0){
   countMove--; 
  }
  if (keyPressed) {
    if (key == 'p' || key == 'P') {
      if(takePicCool == 0){
      audio[5].play();
      takePicCool++;
      }
      {displayImg = false;
        for (int i = 0; i < tasks.size(); i++) {
          if (sub.getPosX() == tasks.get(i).getX() && sub.getPosY()== tasks.get(i).getY()) {
            if(showPicCool == 0){
            audio[2].play();
            showPicCool++;
            }
            image(loadedImg[i], width/4, height/4);
            displayImg = true;
            layout.gotIt(sub.getPosX(),sub.getPosY());
            break;
          }
        }
        if (!displayImg) {
          fill(255, 0, 0);
          textSize(75);
          text("Not a task location. Try again.", height/2 + 230, width/2 -780, 350, 500); // width and then height of txt box
        }
      }
    } else if (key == 'f' || key == 'F') {
      flickMode = !flickMode;
    }
    else if (key == CODED) { // && countdown == 0
      if (keyCode == UP && countMove == 0) {
        countMove += mCount;
        sub.calcForward(sub.getDeg());
        println("moving forward");
      } else if (keyCode == DOWN && countMove == 0) {
        countMove += mCount;
        sub.calcBackward(sub.getDeg());
        println("moving backward");
      } else if (keyCode == LEFT && countdown == 0) {
        audio[0].play();
        countdown += count;
        sub.changeDeg(sub.getDeg()- 1);
        if (sub.getDeg() < 0) {
          sub.changeDeg(359);
        }
        if (sub.getDeg()== 359 || (sub.getDeg() != 0 && sub.getDeg() % 45 == 0)) {
          //radar.rotate(-PI/4);
          rotateLeft();
        }
        //println("subtract degree - 1, degree is now " + sub.getDeg());
      } else if (keyCode == RIGHT && countdown == 0) {
        audio[0].play();
        countdown += count;
        sub.changeDeg(sub.getDeg() + 1);
        if (sub.getDeg() > 359) {
          sub.changeDeg(0);
        }
        if (sub.getDeg() == 0 || (sub.getDeg()!= 1 && sub.getDeg()%45==1)) {
          //radar.rotate(PI/4);
          rotateRight();
        }
        //println("add degree + 1, degree is now " + sub.getDeg()  );
      }
    }
  }
  }
}

/*public void keyReleased(){
  println("key released");
 if(keyCode == LEFT || keyCode == RIGHT){
   println("degree audio has been stopped");
   audio[0].stop();
   degCool = 0;
 }
 else if(key == 'p' || key == 'P'){
   takePicCool = 0;
   showPicCool = 0;
 }
}*/

public void rotateRight() {
  for (int i = 0; i<radar.getVertexCount(); i++) {
    PVector vertex = radar.getVertex(i);
    float originalX = vertex.x-(width/3);
    float originalY = vertex.y-(height/2+150);
    float rotateAroundX = vertex.x-(width/3);
    float rotateAroundY = vertex.y-(height/2+150);
    vertex.set(vertex.x-rotateAroundX, vertex.y-rotateAroundY);
    rotateAroundX = originalX * cos(PI/4) - originalY * sin(PI/4);
    rotateAroundY = originalX * sin(PI/4) + originalY * cos(PI/4);
    vertex.set(vertex.x+rotateAroundX, vertex.y+rotateAroundY);
    radar.setVertex(i, vertex);
  }
}

public void rotateLeft() {
  for (int i = 0; i<radar.getVertexCount(); i++) {
    PVector vertex = radar.getVertex(i);
    float originalX = vertex.x-(width/3);
    float originalY = vertex.y-(height/2+150);
    float rotateAroundX = vertex.x-(width/3);
    float rotateAroundY = vertex.y-(height/2+150);
    vertex.set(vertex.x-rotateAroundX, vertex.y-rotateAroundY);
    rotateAroundX = originalX * cos(-PI/4) - originalY * sin(-PI/4);
    rotateAroundY = originalX * sin(-PI/4) + originalY * cos(-PI/4);
    vertex.set(vertex.x+rotateAroundX, vertex.y+rotateAroundY);
    radar.setVertex(i, vertex);
  }
}

public boolean isDone(){
  if(taskCounter==9){
    return true;
  }
  else{
    return false;
  }
}

public void keyPressed(){
  if(key==ENTER||key==RETURN){
    loop();
    taskCounter = 0;
    radar.setVertex(0,new PVector(width/3, height/2+100));
    radar.setVertex(1,new PVector(width/3-10, height/2+200));
    radar.setVertex(2,new PVector(width/3+10, height/2+200));
    menu = true;
  }
}

public void endScreen(){
  background(0);
  fill(255);
  textSize(128);
  text("GAME OVER", width/3, height/6); 
  text("Press Enter To Return to Menu",width/8,5*(height/6));
}
