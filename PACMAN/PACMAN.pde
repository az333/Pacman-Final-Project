  Dot little, big, fruit;
  Location locPac; 
  Pacman pac;
  Location maze[][]; 
  int x, y;
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
    maze = new Location[36][28];
 
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
      int x1 = 0, y1 = 0; 
      int c;
      for (int r = 0; r < maze.length; r ++) {
        for (c =  0; c < maze[r].length; c ++) { 
          y1 = (width / 28) * r; //+75;
          x1 = (height / 36) * c; 
          if (!maze[r][c].isValid()) { // if it's wall
            noFill();
            rect (x1, y1, (width/ 28), (height/36));
          } 
          else if (maze[r][c].isValid()){ // if it's an open space
          //System.out.println ("x: " + r + " y: " + c);
          
            fill(#000000); 
            //noStroke(); (add this in later when we're done)
            rect (x1, y1, (width/ 28), (height/36));
            // for tiny dots
           little = new Dot(false, false);
            if (little.isLittleDot()) {
              fill(#FFEC00);
              noStroke();
              ellipse(x1 + 8, y1 + 8, 8, 8);
            } 
          }
        }   
      }
      
     pac = new Pacman (); 
    locPac = maze[pac.getX()][pac.getY()]; 

  }
  
  void draw() {
    
   
    color col = color(0, 255, 0);
    fill(col);
    noStroke();
    x = locPac.getX() * (width / 28) + 16;
    y = locPac.getY() * (height/ 36) + 8;
    ellipse (x, y , 16, 16);

    }
    
      void keyPressed() {
     
    if (key == CODED) {
     // System.out.println ("x: " + pac.getX() + " y: " + pac.getY());
      //System.out.println (maze[13][26].isValid());
      if (keyCode == UP) {
        
        if (maze[pac.getY()-1][pac.getX()].isValid()) 
        locPac = maze[pac.getY()-1][pac.getX()];
      } else if (keyCode == DOWN) {
        if (maze[pac.getY()+1][pac.getX()].isValid()) 
        locPac = maze[pac.getY()+1][pac.getX()];
      } else if (keyCode == RIGHT) { 
        if (maze[pac.getY()][pac.getX() + 1].isValid()) { 
          //System.out.println ("true");
        locPac = maze[pac.getY()][pac.getX() + 1];
        }
        //System.out.println ("false");
      } else if (keyCode == LEFT) { 
        if (maze[pac.getY()][pac.getX() -1 ].isValid()) 
        locPac = maze[pac.getY()][pac.getX() -1];
      }
  }
}
  