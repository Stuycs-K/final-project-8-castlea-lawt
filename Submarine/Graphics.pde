PShape left,right,up,down,radar;
Map layout = new Map();
void setup(){
  ArrayList<Coordinate>tasks = new ArrayList<Coordinate>(9);//randomized or not? + placeholder c
  int taskCounter = 0;
  String[]images = new String[]{"task1.png","task2.jpg"}; //9 imgs will manually add names of images later on
  PImage photo;
  boolean rightLoco;
  fullScreen();
  background(100, 0, 0);
  fill(183,65,14);
  ellipse(width/2,height/2-200, 500, 500);  
  rectMode(CENTER);
  rect(width/2,height/2+255,1000,400);
  stroke(100);
  fill(50,0,0);
  ellipse(width/3,height/2+170,200,200);
  rect(width/3,height/2+310,200,75);
  rect(2*width/3,height/2+100,200,75);
  rect(2*width/3,height/2+180,200,75);
  left = createShape(RECT,width/4+75,height/2+400,170,100);
  right= createShape(RECT,width/3+85,height/2+400,170,100);
  up = createShape(RECT,2*width/3,height/2+270,100,100);
  down = createShape(RECT,2*width/3,height/2+375,100,100);
  shape(up);
  shape(down);
  shape(left);
  shape(right);
  fill(100);  
  stroke(0);
  triangle(width/4, height/2+400, width/3-10, height/2+450, width/3-10, height/2+350);
  triangle(width/3+155, height/2+400, width/3+10, height/2+450, width/3+10, height/2+350);
  triangle(2*width/3, height/2+225, 2*width/3+50, height/2+325, 2*width/3-50, height/2+325);
  triangle(2*width/3, height/2+425, 2*width/3+50, height/2+330, 2*width/3-50, height/2+330);
  fill(0,155,0);
  radar = createShape(TRIANGLE,width/3,height/2+100,width/3-10,height/2+200,width/3+10,height/2+200);
  shape(radar);
}
void draw(){
  //tammy integrate the camera method here from progress

}
