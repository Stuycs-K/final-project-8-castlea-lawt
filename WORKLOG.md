# Work Log

## GROUP MEMBER 1: Tammy Law

### 5/22/23
Submarine_Tab: //Made constructor
               // functions for getting the positions (x,y) of the Submarine
               //created KeyPress Function for movement and added bounds for that

### 5/23/23
Submarine_Tab: //Resolved error with the Submarine_Tab in that setup() and draw() must be in only one tab
               //changed variables in Submarine_Tab from double to int to match with map

Made Progress Tab: // Added a for loop to check for if there is an img available at that position
                   // changed img arr to img arrlist
                   // Made taskCounter to keep track of how much correct images the player has gotten
                   // Made boolean rightLoco for if right location or not
                   // added error message if incorrest location

### 5/24/23
Progress_Tab; // Resolved syntax issues -> Compiled -> Graphics fits lab screen
              // Can now compare the coordinates of the img at the player location with img from arr
              // Added a couple of test imgs
              // Working on making the Camera method -> Cannot undisplay img in processing -> Step Below
              // Integrated and moved over code from Progress_Tab into Graphics_Tab

Graphics_Tab: // Removed rightLoco and replaced with boolean displayImg
              // Added instance variable of Submarine because it can only use non static methods
              // Moved most of graphics code into a displayScreen() method
              // Moved the Camera method into draw() which I made a keyPressed() for

### 5/25/23
Submarine_Tab: // Altered the ChangePos() method, however still have issues accessing the map
               // Finished calcdirection() method
               // Added degrees instance variable
               // Integrated the above two methods into keyPressed()

### 5/26/23
Submarine_Tab://Made getDeg() Function
              //Made changeDeg() Function
              //split changeDirec() function into a changeForward() and changeBackward() function, will add bounds later to avoid exception

Graphics_Tab: //Changed so that left and right only alters degree, and then use up and down to move

## GROUP MEMBER 2 : Anabella Castle

### 5/22/23

Graphics_Tab: // Completed a very basic background for the game -> now when the program is run we go straight into the submarine screen that mimics the source material.
              // Made arrows that we may or may not use -> could potentially be used as buttons instead of the arrow keys as a bonus feature.

### 5/23/23

Graphics_Tab: // made very basic graphics for radar -> to be used in later code

Map_Tab:  // Made the fields and constructors for Map
          // Made a carveMap function

Coordinates_Tab: // Wrote the constructors, fields, mutator methods and accessor methods. -> we now have a class that holds an (x,y) pairing with access to those x and y values

### 5/24/23

Map_Tab:  // Made a random map generator -> char[][] with '#' and spaces
          // Coded a display function that doesn't work yet -- having issues with the trigger I think
          // made a keyPressed function
          // changed keyPressed to MouseClicked -> still isn't working quite right
          // fixed some merge errors

### 5/25/23

Map_Tab:  // made map arr public, some edits to display in process
          // adjusted display so that is doesn't return any errors, it now displays the map when program runs
          // The map now displays with no issues after putting in a bunch of if statements.
          // Also added a char value to corners for later accessibility
          // added accessor method getAt(x,y) in Map Class
          // more efficient carve method, added a for loop and a while loop to try and create different paths

Graphics_Tab: // Added Map.display to setup
