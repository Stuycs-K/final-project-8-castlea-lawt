PShape left, right, up, down, radar;
Map layout;
ArrayList<Coordinate>tasks = new ArrayList<Coordinate>(9);//randomized or not? + placeholder c
//int taskCounter = 0;
String[]images = new String[]{"task1.png", "task2.jpg"}; //9 imgs will manually add names of images later on
PImage photo;
boolean displayImg = false;
Submarine sub = new Submarine(0, 0);
int countdown = 0;


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
  text("" + sub.getDeg(),width/4+70, height/2+340); //displaying degrees
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
  fullScreen();
  tasks.add(new Coordinate(3,4));
  tasks.add(new Coordinate(15,16));
  tasks.add(new Coordinate(12,17));
  tasks.add(new Coordinate(3,10));
  tasks.add(new Coordinate(10,6));
  tasks.add(new Coordinate(7,13));
  tasks.add(new Coordinate(2,14));
  tasks.add(new Coordinate(19,17));
  tasks.add(new Coordinate(1,10));
  //radar = createShape(TRIANGLE, width/3, height/2+100, width/3-10, height/2+200, width/3+10, height/2+200);
  radar = createShape();
  radar.beginShape();
  radar.vertex(width/3, height/2+100);
  radar.vertex(width/3-10, height/2+200);
  radar.vertex(width/3+10, height/2+200);
  radar.endShape(CLOSE);
  displayScreen();
  layout = new Map(1);
}

void draw() {
  //tammy integrate the camera method here from progress
  displayScreen();
  layout.display();
  if(countdown > 0){
   countdown--; 
  }
  if (keyPressed) {
    if (key == 'p' || key == 'P') {
      if (displayImg) {
        displayScreen();
        displayImg = false;
      } else {
        for (int i = 0; i < tasks.size(); i++) {
          if (sub.getPosX() == tasks.get(i).getX() && sub.getPosY()== tasks.get(i).getY()) {
            loadImage(images[i]);
            photo = loadImage(images[i]);
            image(photo, width/2, height/2, 10, 10);
            displayImg = true;
            break;
          }
        }
        if (!displayImg) {
          fill(255);
          textSize(50);
          text("Not a task location. Try again.", height/2, width/2, 10, 10); // width and then height of txt box
          delay(5000);
          displayScreen();
        }
      }
    }
    else if (key == CODED) { // && countdown == 0
        if (keyCode == UP) {
          countdown += 15;
          sub.calcForward(sub.getDeg());
          println("moving forward");
        } else if (keyCode == DOWN) {
          countdown += 15;
          sub.calcBackward(sub.getDeg());
          println("moving backward");
        } else if (keyCode == LEFT) {
          countdown += 15;
          sub.changeDeg(sub.getDeg()- 1);
          if (sub.getDeg() < 0) {
            sub.changeDeg(359);
          }
          if(sub.getDeg() % 45 == 0){
           //radar.rotate(-PI/4); 
           rotateLeft();
          }
          println("subtract degree - 1, degree is now " + sub.getDeg());
        } else if (keyCode == RIGHT) {
          countdown += 15;
          sub.changeDeg(sub.getDeg() + 1);
          if (sub.getDeg() > 359) {
            sub.changeDeg(0);
          }
          if(sub.getDeg()%45==0){
            //radar.rotate(PI/4);
            rotateRight();
          }
          println("add degree + 1, degree is now " + sub.getDeg()  );
        }
      }
  }
}

public void rotateRight(){
  for(int i = 0; i<radar.getVertexCount(); i++){
   PVector vertex = radar.getVertex(i);
   float originalX = vertex.x-(width/3);
   float originalY = vertex.y-(height/2+150);
   float rotateAroundX = vertex.x-(width/3);
   float rotateAroundY = vertex.y-(height/2+150);
   vertex.set(vertex.x-rotateAroundX,vertex.y-rotateAroundY);
   rotateAroundX = originalX * cos(PI/4) - originalY * sin(PI/4);
   rotateAroundY = originalX * sin(PI/4) + originalY * cos(PI/4);
   vertex.set(vertex.x+rotateAroundX,vertex.y+rotateAroundY);
   radar.setVertex(i,vertex);
  }
}

public void rotateLeft(){
   for(int i = 0; i<radar.getVertexCount(); i++){
   PVector vertex = radar.getVertex(i);
   float originalX = vertex.x-(width/3);
   float originalY = vertex.y-(height/2+150);
   float rotateAroundX = vertex.x-(width/3);
   float rotateAroundY = vertex.y-(height/2+150);
   vertex.set(vertex.x-rotateAroundX,vertex.y-rotateAroundY);
   rotateAroundX = originalX * cos(-PI/4) - originalY * sin(-PI/4);
   rotateAroundY = originalX * sin(-PI/4) + originalY * cos(-PI/4);
   vertex.set(vertex.x+rotateAroundX,vertex.y+rotateAroundY);
   radar.setVertex(i,vertex);
  }
}
