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

### 5/27/23
Submarine_Tab: //Made constant variables yMax and xMax for the row and col length of the Map
               //Set bounds for the changeDirec() functions

Graphics_Tab: //Integrated changeDirec() function from Submarine_Tab, preparing to test

### 5/28/23
Graphics_Tab: //Made a countdown variable to add delay between pressing buttons, may need to make one for each individual button though?
              //Small change to how the degrees changed, it can now go backwards from 0 to 360
              //Experimenting and having trouble with rotating the PShape radar and on displaying text

### 5/29/23
Submarine_Tab: //Changed max degree from 360 to 359

Graphics_Tab: //Made display for degrees and the coordinates of the Submarine
              //Changed PShape radar to it's original color
              //Temporarily removed delay between keypresses so easier to test
              //Radar rotates every 45 degrees, backwards and forwards now

### 5/30/23
Submarine_Tab: //Added get YMax and get xMax methods

Graphics_Tab: //Set location of Submarine to the start location so now it can actually move
              //Made wall indicators that flicker every 30 seconds or so when there is a wall on the 4 sides(might add for the corners as well)
              //When there is no task at spot, error msg shows up

### 5/31/23
Map_Tab: // Changed color of the start location so it is more visible

Graphics_Tab // Added a key press to turn on/off flickering for the radar's wall indicators because the flickering hurts my eyes x . x
             // All images are loaded and resized in setup instead of in draw
             // If you hold onto key, image will continue to be displayed(no more flickering)
             // Fixed the system with the counter and key presses so it works properly

### 6/1/23
Graphics_Tab: // Adjusted bounds for when the radar rotates

### 6/6/23
Repo: // Added mp3 files for audio -> Converted and replaced to wav files
      // These files included a sound effect for when submarine hits wall, when submarine moves(not yet implemented),
        when altering degrees, when taking a picture, when showing a picture and ambience music.

Submarine_Tab: //Fixed forward movement for degrees from 46-90 and fixed backward and forward movement for degrees 226 - 270

Graphics_Tab:  // Sound is loaded in setup
               // Made variables countMove and mCount to make a timer for moving the sub separate from the timer for altering degrees
               // Made variables takePicCool and showPicCool so sound is only played once(instead of on loop) when the key 'p' is pressed
               // Made a keyReleased function for sound cooldown/stopping

### 6/7/23
Repo: // Deleted Progress and RunSubmarine Tab because we no longer use/need them anymore

Graphics_Tab: // Add instructions for flicker mode on the menu screen
              // Made tickCount variable for oxygen mechanic and started working on
              // Made PShape for the oxygen bar and working on it

Submarine_Tab: // Made public variables oxygen, change, time and max and their corresponding set methods

### 6/8/23
Repo: // Shortened audio for degree tick, sub move and take pic

Submarine_Tab: // incorporated audio for whenever submarine moves and doesn't hit wall
               // Made oxygen mechanic variables private and made accessor methods, removed the set methods for change and time

Graphics_Tab: // Removed degree tick from keyReleased function
              // Changed color of radar wall indicators and also for oxygen bar which shrinks as oxygen decreases
              // Made displays for the oxygen
              // Finished Oxygen Mechanic, oxygen also does not decrease while looking at picture, when oxygen reaches 0 end screen appears

Map_Tab: // Changed color of the map

MenuScreen_Tab: // Set conditions for each difficulty mode

### 6/9/23
MenuScreen_Tab: // Decreased time limit for extra hard mode

Graphics_Tab: // Atmospheric music now loops over

### 6/10/23
Repo: // Updated ReadMe.md

Graphics_Tab: // Added a counter for flick so now the radar's flickermode works consistently
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

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

### 5/26/13

Submarine_Tab: // Fixed ChangePos by using the variable layout

Map_Tab:  // Added a for loop that will put the tasks on the map display
          // adjusted that for loop into an if statement by adding the tasks into the carve method, both ensuring that there will be a path to every task and making the drawing easier
          // made a new color square for start spot, now have to figure out why not all of the coordinates are displaying
          // added an if statement to see if that would help with displaying

Graphics_Tab: // added values to task list

### 5/30/23

Map_Tab:  // Fixed the display so that it actually shows all of the tasks and the start position.

Graphics_Tab // Added a rotateRight and rotateLeft function that correctly rotates the radar.

### 5/31/23

Map_Tab:  // Made a new method for carving to make the code easier to parse through
          // edited carve code to incorporate a solid border around the edge of the Map
          // removed mode field
          // incorporated "cheat" into display in an attempt to get subShape to present

Graphics_Tab: // edited tasks to make sure they don't impede on the border
              // created boolean "cheat"
              // created PShape "subShape"
              // Tried to incorporate these two into setup and keyPressed

### 6/1/23

Graphics_Tab: // More work on cheatMode, tried putting it in the draw function
              // moved where in keypressed cheatMode came into play

### 6/2/23

Graphics_Tab: // Made subShape have vertexes, moved the creation of the shape into setup
              // Tried utilizing "setVisible()" to toggle whether subShape would be seen

Map_Tab:  // removed subShape setup from display

### 6/4/23

Graphics_Tab: // Figured out how to get subShape to be visible via setup

Map_Tab:  // reintegrated mode field, created an "easy" and "hard" mode
          // made getMode() accessor method
          // added "if mode == easy" at the end of display to actually display subShape

Submarine_Tab: // edited translation of subShape within ChangePos

### 6/5/23

Graphics_Tab: // made an isDone() function and moved the variable taskCounter from progress tab
              // added if statement to end the game
              // made a way to count the tasks gotten and incorporated that into keyPressed function
              // worked on endScreen() function

Map_Tab:  // made a gotIt() function to change the color of the tasks after you get them, and to increase the taskCounter only once
          // added color change to display

### 6/6/23

Graphics_Tab: // coded the endScreen() function
              // added to keyPressed() to incorporate returning to menu and resetting the screen
              // added menu function and if statement to draw
              // if statement in keypressed (up) to try and get a message to display when you pass a note

MenuScreen_Tab: // Created a boolean "menu" to implement menu in draw
                // Set up menu screen with keyPressed booleans
                // Instructions, controls, mode choices, and the start button are now available in the menu

### 6/7/23

Graphics_Tab: // Made an edit to try an reset the radar when you play a new game.
              // Created a value for the number of notes found, and a boolean for if a note has been found
              // Also incorporated the way to access the notes ([z]) into keyPressed()

Map_Tab:  // Created a function (easterEggs()) that made five random spots a note
          // Put the individual notes into an array
          // incorporated finding notes into the gotit() function
          // Made an openNote() function that displays the notes when you find one

### 6/9/23

Graphics_Tab: // Got rid of the notes ArrayList because it was useless
              // moved if statement from keyPressed (up) into its own boolean, now the message pops up
              // made subShape move with radar

Map_Tab:  // Small edits to the carve function to get rid of the non-existent walls

MenuScreen_Tab: // added some more lore to the instructions screen, also made the format nicer
                // adjusted what happens when you select easy mode

### 6/12/23

Graphics_Tab/MenuScreen_Tab: // changed the subShape into a circle
