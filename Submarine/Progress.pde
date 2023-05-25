public class Progress {
  ArrayList<Coordinate>tasks = new ArrayList<Coordinate>(9);//randomized or not? + placeholder c
  int taskCounter = 0;
  String[]images = new String[]{"task1.png","task2.jpg"}; //9 imgs will manually add names of images later on
  PImage photo;
  boolean rightLoco;
  public void camera(Coordinate loco) { //should be triggered by a key press? -> put in draw maybe?
    rightLoco = false;
    for (int i = 0; i < tasks.size(); i++) {
      if (loco.getX() == tasks.get(i).getX() && loco.getY()== tasks.get(i).getY()) {
        loadImage(images.get(taskCounter));
        photo = loadImage(images[taskCounter]);
        image(photo, width/2, height/2, 10, 10);
        taskCounter++;
        rightLoco = true;
        break;
        //do i still need to undisplay an image?
      }
    }
    if (!rightLoco) {
      textSize(50);
      text("Not a task location. Try again.", height/2, width/2, 10, 10); // width and then height of txt box
    }
  }
}
