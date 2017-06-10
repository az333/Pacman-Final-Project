  void setup() {
    size(448,576);
    background(255);
    int rows = 36;
    int cols = 28;
    String[] lines = loadStrings("MainMaze.txt");
    //String[] mazeLines = new String[lines.length];
    Location[][] maze = new Location[36][28];
 
    for (int r = 0; r < lines.length; r ++) { 
      for (int c = 0; c < lines[0].length(); c ++) { 
        //System.out.println("row: " + r + " col: " + c);
        if (lines[r].charAt(c) == '0') { 
          maze[r][c] = new Wall (r, c); 
        } else {
          maze[r][c] = new EmptySpace(r,c); 
        }
      }
    }
    int x = 0, y = 0; 
    for (int r = 0; r < maze.length; r ++) {
      for (int c =  0; c < maze[r].length; c ++) { 
        if (!maze[r][c].isValid()) { 
          rect (x, y, 10, 10);
          x += 10; 
          y += 10;
        }
      }
          
    }
    
  }
    // idea is to take the array of strings in lines 
    // and somehow convert them to a 2d array of chars
    // then assign each char to a wall tile
  
  void draw() {
    fill(127, 0, 0);
    //stroke(127,0, 0);
    // rect(0, 64, width, 16);
  }