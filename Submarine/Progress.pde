import java.util.*;
public class Progress {
  ArrayList<Coordinate>tasks = new ArrayList<Coordinate>(10)//randomized or not? + placeholder c
  int taskCounter = 0;
  String[]images = new String[10] //placeholder, will manually add names of images later on
  Pimage photo;
  boolean rightLoco;
  public void camera(Coordinate loco) { //should be triggered by a key press? -> put in draw maybe?
    rightLoco = false;
    for (int i = 0; i < tasks.size(); i++) {
      if (Arrays.equals(loco, tasks.get(i))) {
        //show corresponding img
        //loadImage("name-of-img") -> display for how long? till key press?
        photo = loadImage(images[taskCounter]);
        image(photo, width/2, height/2, 10, 10);
        delay(5000); //delay for 5 seconds
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
