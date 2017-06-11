  Dot little, big, fruit;
  
  PImage mazeimg;
  
  void setup() {
    size(448, 576);
    //size(448, 726);
    //surface.setResizable(true);
    background(255);
    mazeimg = loadImage("mazeimg.png");
    image(mazeimg, 0, 0);
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
      int c;
      for (int r = 0; r < maze.length; r ++) {
        for (c =  0; c < maze[r].length; c ++) { 
          y = (width / 28) * r; //+75;
          x = (height / 36) * c; 
          if (!maze[r][c].isValid()) { // if it's wall
            noFill();
            rect (x, y, (width/ 28), (height/36));
          } 
          else if (maze[r][c].isValid()){ // if it's an open space
            fill(#000000); 
            //noStroke(); (add this in later when we're done)
            rect (x, y, (width/ 28), (height/36));
            // for tiny dots
            little = new Dot(false, false);
            if (little.isLittleDot()) {
              fill(#FFEC00);
              noStroke();
              ellipse(x + 8, y + 8, 8, 8);
            } 
          }
        }   
      }
      
    }
  
  void draw() {
    Pacman pac = new Pacman();
  }