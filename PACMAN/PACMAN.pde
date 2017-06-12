  Dot little, big, fruit;
  Location locPac; 
  Location locRed; 
  Location locBlue; 
  Location locOrange; 
  Location locPink;
  Pacman pac;
  RedGhost redd;
  Location maze[][]; 
  int x, y;
  PImage mazeimg;
  PImage pacman;
  PImage red; 
  long start; 
  
  
  void setup() {
    size(448, 576);
    //size(448, 726);
    //surface.setResizable(true);
    background(255);
    mazeimg = loadImage("mazeimg.png");
    image(mazeimg, 0, 0);
  
    //start = System.nanoTime() * 0.000000001; 
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
          
             
          }
        }   
      }
      
    pac = new Pacman (); 
    locPac = maze[pac.getR()][pac.getC()]; 
    
  ellipse (pac.xPixel(), pac.yPixel() , 16, 16);
  
    redd = new RedGhost();
    locRed = maze[redd.getR()][redd.getC()]; 
    ellipse ( redd.xPixel() , redd.yPixel(), 16, 16);
     redd.moveTo(maze[14][13]);
     
      //System.out.println("red: "+ maze[redd.getR()][redd.getC()]);
    
       //  image (loadImage("pacman2", "gif"), pac.xPixel(), pac.yPixel());

  
  }
  
  void draw() {
    
  
    color col = color(0, 255, 0);
    fill(col);
    noStroke();
    y = locPac.getR() * (width / 28) + 16;
    x = locPac.getC() * (height/ 36) + 8;
      background (0); 
    background(255);
    mazeimg = loadImage("mazeimg.png");
    image(mazeimg, 0, 0);
    for (int r = 0; r < maze.length; r ++) { 
      for (int c = 0; c < maze[r].length; c ++) { 
        if (maze[r][c].isValid() && maze[r][c].hasDot()){ 
           fill(#FFEC00);
              noStroke();
              ellipse(maze[r][c].xPixel(), maze[r][c].yPixel(), 8, 8);

        } 
   

        }
        
    fill (color(0,255,0));
    ellipse (pac.xPixel(), pac.yPixel() , 16, 16);
    fill (color(255,0,0));
    ellipse (redd.xPixel(), redd.yPixel(), 16, 16);
     
 
    
   // System.out.println (redd.getR()); 
  
   //System.out.println (redd.getC()); 
  
    
  

  
    }
   
    
    }
    
    // ellipse ( pac.xPixel(), pac.yPixel() , 16, 16);

    
      void keyPressed() {
    
    
     if (locPac.getR() == 17 && locPac.getC() == 27) { 
          pac.moveTo(maze[17][0]);
          maze[17][0].setSmell(10);
          maze[17][27].setSmell(9);
    } else if (locPac.getR() == 17 && locPac.getC() == 0) { 
       pac.moveTo(maze[17][27]);
       maze[17][27].setSmell(10);   
       maze[17][0].setSmell(9);
    } 
    
     if (locPac.hasDot()) { 
      pac.setScore (pac.getScore() + 1); 
      locPac.setDot(new Dot("empty"));
    }
    
    //System.out.println (locPac);
   
    locPac = maze[pac.getR()][pac.getC()]; 
    
     if (locPac.hasDot()) { 
      pac.setScore (pac.getScore() + 1); 
      locPac.setDot(new Dot("empty"));
    }
    
    if (key == CODED) {
     // System.out.println ("x: " + pac.getR() + " y: " + pac.getY());
      //System.out.println (maze[13][26].isValid());
      if (keyCode == UP) {
        if (pac.getR() > 0 && maze[pac.getR() -1][pac.getC()].isValid()) 
        locPac = maze[pac.getR()- 1][pac.getC()];
      } else if (keyCode == DOWN) {
        if (pac.getR() < 35 && maze[pac.getR() + 1][pac.getC()].isValid()) 
        locPac = maze[pac.getR()+1][pac.getC()];
      } else if (keyCode == RIGHT) { 
        if (pac.getC() < 27 && maze[pac.getR()][pac.getC() + 1].isValid()) { 
          //System.out.println ("true");
        locPac = maze[pac.getR()][pac.getC() + 1];
        }
        //System.out.println ("false");
      } else if (keyCode == LEFT) { 
        if (pac.getC() > 0 && maze[pac.getR()][pac.getC() - 1].isValid()) 
        locPac = maze[pac.getR()][pac.getC() - 1];
      }
    }
      pac.getLocation().setSmell(9);
      pac.moveTo(locPac);
      locPac.setSmell(10);
      redd.moveCloser(locPac);
    
   
    

    System.out.println (locPac);
    
}
  