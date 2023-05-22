PShape left,right,up,down;
void setup(){
  fullScreen();
  background(100, 0, 0);
  noStroke();
  fill(183,65,14);
  ellipse(width/2,height/2-200, 500, 500);  
  rectMode(CENTER);
  rect(width/2,height/2+255,1000,400);
  fill(50,0,0);
  ellipse(width/3,height/2+170,200,200);
  rect(width/3,height/2+310,200,75);
  rect(2*width/3,height/2+100,200,75);
  rect(2*width/3,height/2+180,200,75);
  fill(100);
  left = createShape(TRIANGLE,width/4, height/2+400, width/3-10, height/2+450, width/3-10, height/2+350);  
  right= createShape(TRIANGLE,width/3+155, height/2+400, width/3+10, height/2+450, width/3+10, height/2+350);
  up = createShape(TRIANGLE,2*width/3, height/2+225, 2*width/3+50, height/2+325, 2*width/3-50, height/2+325);
  down = createShape(TRIANGLE,2*width/3, height/2+425, 2*width/3+50, height/2+330, 2*width/3-50, height/2+330);
  shape(up);
  shape(down);
  shape(left);
  shape(right);
}
void draw(){
  
}
