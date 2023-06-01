public class Map {
  private char[][] map;
  private int mode, SQUARESIZE;
  private Coordinate start;
  int randX = (int)(Math.random()*19)+1;
  int randY = (int)(Math.random()*17)+1;

  public Map(int mo) {
    map = new char[20][18];
    mode = mo;
    SQUARESIZE = 30;
    //int randX = (int)(Math.random()*20);
    //int randY = (int)(Math.random()*18);
    start = new Coordinate(randX, randY);
    makeMap();
  }

  public char getAt(int x, int y) {
    return map[x][y];
  }

  public void makeMap() {
    for (int i = 0; i<map.length; i++) {
      for (int x = 0; x<map[0].length; x++) {
        map[i][x] = '#';
      }
    }
    carve(start,2);
    for(int i = 0; i<2; i++){
      int x = (int)(Math.random()*19)+1;
      int y = (int)(Math.random()*17)+1;
      carve(new Coordinate(x,y),0);
    }
    for(int i = 0; i<tasks.size(); i++){
      carve(tasks.get(i),1);
    }
  }
  
  public void carve(Coordinate startSpot, int special){
    int x = startSpot.getX();
    int y = startSpot.getY();
    if(special == 0){map[x][y]=' ';}
    if(special == 1){map[x][y]='*';}
    if(special == 2){map[x][y]='x';}
    int z = 0;
    while(z<50){
      int rand = (int)(Math.random()*5)+1;
      switch(rand){
        case 1:
        if(x>1){
          x--;
          z++;
        }
        break;
        case 2:
        if(x<map.length-2){
          x++;
          z++;
        }
        break; //
        case 3:
        if(y>1){
          y--;
          z++;
        }
        break;
        case 4:
        if(y<map[1].length-2){
          y++;
          z++;
        }
        break;
        default:
        if(x<map.length-2&&x>1&&y>1&&y<map[1].length-2){
          if(map[x-1][y]=='#'){
            map[x-1][y] = ' ';
          }
          if(map[x+1][y]=='#'){
            map[x+1][y] = ' ';
          }
          if(map[x][y-1]=='#'){
            map[x][y-1] = ' ';
          }
          if(map[x][y+1]=='#'){
            map[x][y+1] = ' ';
          }
          if(x<map.length-3){x+=2;}
          z++;
        }
        break;
      }
      if(map[x][y]=='#'){
        map[x][y] = ' ';
      }
    }
  }

  void mouseClicked() {
    if (mode == 1) {
      display();
    }
    if (mode == 2) {
      cheatDisplay();
    }
  }

   public void display(){
    noStroke();
    rectMode(CORNER);
    fill(0,150,200);
    rect(start.getX()*SQUARESIZE,start.getY()*SQUARESIZE,SQUARESIZE,SQUARESIZE);
    for(int i = 0;i<20;i++){
      for(int x = 0; x<18; x++){
        char working = map[i][x];
        if(working==' '){
          if(i>0&&x>0){
            if(map[i-1][x]=='#'&&map[i][x-1]=='#'){
              fill(0);
              triangle(i*SQUARESIZE,x*SQUARESIZE,i*SQUARESIZE+SQUARESIZE,x*SQUARESIZE,i*SQUARESIZE,x*SQUARESIZE+SQUARESIZE);
              map[i][x]='/';
              fill(0,50,0);
              triangle(i*SQUARESIZE+SQUARESIZE,x*SQUARESIZE+SQUARESIZE,i*SQUARESIZE+SQUARESIZE,x*SQUARESIZE,i*SQUARESIZE,x*SQUARESIZE+SQUARESIZE);
            }
            else{
              if(i<map.length-1){
                if(map[i+1][x]=='#'&&map[i][x]=='#'){
                  fill(0);
                  triangle(i*SQUARESIZE+SQUARESIZE,x*SQUARESIZE+SQUARESIZE,i*SQUARESIZE+SQUARESIZE,x*SQUARESIZE,i*SQUARESIZE,x*SQUARESIZE+SQUARESIZE);
                  map[i][x]='>'; //meant to be \, but that doesn't work as a char
                  fill(0,50,0);
                  triangle(i*SQUARESIZE,x*SQUARESIZE,i*SQUARESIZE+SQUARESIZE,x*SQUARESIZE,i*SQUARESIZE,x*SQUARESIZE+SQUARESIZE);
                }
                else{
                  fill(0,50,0);
                  rect(i*SQUARESIZE,x*SQUARESIZE,SQUARESIZE,SQUARESIZE);
                }
              }
              else{
                 fill(0,50,0);
                 rect(i*SQUARESIZE,x*SQUARESIZE,SQUARESIZE,SQUARESIZE);
               }
            }
          }
          else{
            fill(0,50,0);
            rect(i*SQUARESIZE,x*SQUARESIZE,SQUARESIZE,SQUARESIZE);
          }
        }
        else{
          if(working == '*'){
            fill(150,0,20);
            rect(i*SQUARESIZE,x*SQUARESIZE,SQUARESIZE,SQUARESIZE);
          }
          else{
            if(working != 'x'){
              fill(0);
              rect(i*SQUARESIZE,x*SQUARESIZE,SQUARESIZE,SQUARESIZE);
            }
          }
        }
      }
    }
  }
  public void cheatDisplay() {
  }
}
