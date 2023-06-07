public void menu(){
  background(0);
  noStroke();
  textAlign(CENTER);
  textSize(150);
  fill(255);
  text("IRON LUNG",width/2,height/4);
  textSize(100);
  text("Controls [E]",width/2,2*height/5);
  text("Instructions [Q]",width/2,height/2);
  textSize(80);
  text("Easy Mode [0], Hard Mode [1], Extra Hard Mode [2]",width/2,3*height/5);
  textSize(50);
  text("(Please select a mode by pressing the corresponding button before you start)",width/2,13*height/20);
  textSize(100);
  text("Start [S]",width/2,4*height/5);
  if(keyPressed){
    if(key=='E'||key=='e'){
      background(0);
      textSize(150);
      fill(255);
      text("IRON LUNG",width/2,height/4);
      textSize(70);
      text("left and right arrow keys -- change degrees", width/2,2*height/5);
      text("up and down arrow keys -- move forward or backward", width/2,height/2);
      text("[P] -- take a picture",width/2,3*height/5);
    }
    if(key=='Q'||key=='q'){
      background(0);
      textSize(150);
      fill(255);
      text("IRON LUNG",width/2,height/4);
      textSize(65);
      text("You are exploring an uncharted part of the ocean.",width/2,2*height/5);
      text("You need to take pictures at the designated locations (red squares)",width/2,height/2);
      text("before you run out of oxygen (green bar).",width/2,3*height/5);
      text("Due to the amount of pressure your ship is under, you are going to",width/2,7*height/10);
      text("have to rely on your map and your radar to navigate.",width/2,4*height/5);
      text("Good luck.",width/2,9*height/10);
    }
    if(key=='0'){
      layout = new Map(0);
      sub = new Submarine(layout.randX, layout.randY);
      subShape = createShape();
      subShape.beginShape();
      subShape.vertex((sub.getPosX()*layout.SQUARESIZE),(sub.getPosY()*layout.SQUARESIZE)+15);
      subShape.vertex((sub.getPosX()*layout.SQUARESIZE)+15,sub.getPosY()*layout.SQUARESIZE);
      subShape.vertex((sub.getPosX()*layout.SQUARESIZE)+15,(sub.getPosY()*layout.SQUARESIZE)+30);
      subShape.endShape(CLOSE);
      fill(0,150,20);
      textSize(80);
      text("Easy Mode [0]",width/5-20,3*height/5);
    }
    if(key=='1'){
      layout = new Map(1);
      fill(250,0,0);
      textSize(80);
      text("Hard Mode [1]",width/2-95,3*height/5);
    }
    if(key=='2'){
      layout = new Map(2);
      fill(150,0,20);
      textSize(80);
      text("Extra Hard Mode [2]",3*width/4+20,3*height/5);
    }
    if(key=='S'||key=='s'){
      menu = false;
      fill(150,0,20);
      text("Start [S]",width/2,4*height/5);
      System.out.println("Start");
    }
  }
  textAlign(LEFT);
}
