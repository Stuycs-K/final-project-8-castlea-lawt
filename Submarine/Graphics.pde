PShape left, right, up, down, radar;
Map layout;
ArrayList<Coordinate>tasks = new ArrayList<Coordinate>(9);//randomized or not? + placeholder c
//int taskCounter = 0;
String[]images = new String[]{"task1.png", "task2.jpg"}; //9 imgs will manually add names of images later on
PImage photo;
boolean displayImg = false;
Submarine sub;
int countdown = 0;
int flicker = 0;


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
  fullScreen();
  tasks.add(new Coordinate(3, 4));
  tasks.add(new Coordinate(15, 16));
  tasks.add(new Coordinate(12, 17));
  tasks.add(new Coordinate(3, 10));
  tasks.add(new Coordinate(10, 6));
  tasks.add(new Coordinate(7, 13));
  tasks.add(new Coordinate(2, 14));
  tasks.add(new Coordinate(19, 17));
  tasks.add(new Coordinate(1, 10));
  radar = createShape(TRIANGLE, width/3, height/2+100, width/3-10, height/2+200, width/3+10, height/2+200);
  layout = new Map(1);
  sub = new Submarine(layout.randX, layout.randY);
  displayScreen();
}

void draw() {
  displayScreen();
  layout.display();
  if (flicker > 0) {
    flicker--;
  }
  if (flicker == 0) {
    fill(#EFF2C0);
    if (sub.getPosX() != sub.getXMax() - 1 && layout.getAt(sub.getPosX()+1, sub.getPosY()) == '#') {
      println("display blue dot to the right");
      circle(width/3 + 85, height/2 + 165, 20);
    }
    if (sub.getPosY() != sub.getYMax() - 1 && layout.getAt(sub.getPosX(), sub.getPosY() + 1) == '#') {
      println("display blue dot to thebottom");
      circle(width/3, height/2 + 250, 20);
    }
    if (sub.getPosX() != 0 && layout.getAt(sub.getPosX() - 1, sub.getPosY()) == '#') {
      println("display blue dot to the left");
      circle(width/3 - 85, height/2 + 165, 20);
    }
    if (sub.getPosY() != 0 && layout.getAt(sub.getPosX(), sub.getPosY() - 1) == '#') {
      println("display blue dot to the top");
      circle(width/3, height/2 + 90, 20);
    }
    flicker += 30;
  }
  if (countdown > 0) {
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
    } else if (key == CODED && countdown == 0) { // && countdown == 0
      if (keyCode == UP) {
        countdown += 10;
        sub.calcForward(sub.getDeg());
        println("moving forward x is " + sub.getPosX() + " y is " + sub.getPosY());
      } else if (keyCode == DOWN) {
        countdown += 10;
        sub.calcBackward(sub.getDeg());
        println("moving backward x is " + sub.getPosX() + " y is " + sub.getPosY());
      } else if (keyCode == LEFT) {
        countdown += 10;
        sub.changeDeg(sub.getDeg()- 1);
        if (sub.getDeg() < 0) {
          sub.changeDeg(359);
        }
        if (sub.getDeg() % 45 == 0) {
          radar.rotate(-PI/4);
        }
        println("subtract degree - 1, degree is now " + sub.getDeg());
      } else if (keyCode == RIGHT) {
        countdown += 10;
        sub.changeDeg(sub.getDeg() + 1);
        if (sub.getDeg() > 359) {
          sub.changeDeg(0);
        }
        if (sub.getDeg()%45==0) {
          radar.rotate(PI/4);
        }
        println("add degree + 1, degree is now " + sub.getDeg()  );
      }
    }
  }
}
