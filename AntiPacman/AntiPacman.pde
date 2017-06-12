  import java.util.*;
  
  Dot little, big, fruit;
  Location locPac; 
  Location locRed; 
  Location locBlue; 
  Location locOrange; 
  Location locPink;
  Location locExit;
  Pacman pac;
  RedGhost redd;
  RedGhost blue; 
  RedGhost pink; 
  RedGhost exit;
  RedGhost orange; 
  RedGhost n ;
  Location locN;
  
  public Location[][] maze;
  int x, y;
  PImage mazeimg;
  PImage pacman;
  PImage red; 
  boolean called = true; 
  int a = 0;
   
  
int[] xShift = {-1, 0,  0 ,1};
int[] yShift = { 0, 1, -1, 0};

  void setup() {
    size(448, 576);
    //size(448, 726);
    //surface.setResizable(true);
    background(255);
    mazeimg = loadImage("mazeimg.png");
    image(mazeimg, 0, 0);


    //System.out.println(start);
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
  
    redd = new RedGhost("red");
    locRed = maze[redd.getR()][redd.getC()]; 
    redd.moveTo(maze[16][12]);
    ellipse ( redd.xPixel() , redd.yPixel(), 16, 16);
    
     
    pink = new RedGhost("pink");
    locPink = maze[pink.getR()][pink.getC()]; 
    pink.moveTo(maze[16][15]);
     ellipse (pink.xPixel() , pink.yPixel(), 16, 16);
     
    blue = new RedGhost("blue");
    locBlue = maze[blue.getR()][blue.getC()]; 
    blue.moveTo(maze[18][12]);
    ellipse ( blue.xPixel() , blue.yPixel(), 16, 16);
    
     
    orange = new RedGhost("orange");
    locOrange = maze[orange.getR()][orange.getC()]; 
    orange.moveTo(maze[18][15]);
     ellipse (orange.xPixel() , orange.yPixel(), 16, 16);
     
     n = redd;

     exit = new RedGhost();
     locExit = maze[exit.getR()][exit.getC()];
     exit.moveTo(maze[int(random(0.0, 28.0))][int(random(0.0, 36.0))]);
     ellipse(exit.xPixel() , exit.yPixel(), 16, 16);
     
      //System.out.println("red: "+ maze[redd.getR()][redd.getC()]);
    
       //  image (loadImage("pacman2", "gif"), pac.xPixel(), pac.yPixel());

  
  }
  
  void draw() {
    if (!n.toString().equals("red"))
    System.out.println (n);
     a++; 
  
  
    if (called && a == 40) { 
      System.out.println (true);
      redd.moveRandom(); 
         pink.moveRandom(); 
         blue.moveRandom(); 
         orange.moveRandom();
         called = false;
    } 
    
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
    locPac = maze[pac.getR()][pac.getC()]; 
    ellipse (pac.xPixel(), pac.yPixel() , 16, 16);
     
     
    fill (color(255,0,0));
    locRed= maze[redd.getR()][redd.getC()]; 
    ellipse (redd.xPixel(), redd.yPixel(), 16, 16);
     
     
    fill (#FFC0CB) ;
    locPink = maze[pink.getR()][pink.getC()];
    ellipse (pink.xPixel(), pink.yPixel(), 16, 16);
     
     
    fill(#0000FF);
    locBlue = maze[blue.getR()][blue.getC()]; 
    ellipse (blue.xPixel(), blue.yPixel(), 16, 16);
    
    fill (#FFA500) ;
    locOrange = maze[orange.getR()][orange.getC()]; 
    ellipse (orange.xPixel(), orange.yPixel(), 16, 16);

    //long difference = System.nanoTime() - start;
    //System.out.println (difference * Math.pow(10,-9));

    fill(#ffffff);
    ellipse (exit.xPixel(), exit.yPixel(), 16, 16);    
      
   }
  
 
    
    /*ArrayList<Location> getNeighbors(Location l) { 
     ArrayList<Location> neighbors = new ArrayList<Location>();
     neighbors.clear();
     
      for (int i = 0; i < xShift.length; i ++) { 
         if(pac.getR() + xShift[i] > 0 && pac.getR() + xShift[i] < 36 && pac.getC() + yShift[i] > 0 && pac.getC() + yShift[i] < 28) { 
         if ( maze[pac.getR() + xShift[i]][pac.getC() + yShift[i]].isValid()) { 
           neighbors.add(maze[pac.getR() + xShift[i]][pac.getC() + yShift[i]]); 
         } 
         }
      }
    } */
  
    

     ArrayList<Location> neighbors = new ArrayList<Location>();
     neighbors.clear();
     
      for (int i = 0; i < xShift.length; i ++) { 
         if(pac.getR() + xShift[i] > 0 && pac.getR() + xShift[i] < 36 && pac.getC() + yShift[i] > 0 && pac.getC() + yShift[i] < 28) { 
         if ( maze[pac.getR() + xShift[i]][pac.getC() + yShift[i]].isValid()) { 
           neighbors.add(maze[pac.getR() + xShift[i]][pac.getC() + yShift[i]]); 
         } 
         }
      }
    

      for (Location n: neighbors) {
        
         int reddist= n.computeShortestPath(redd.getLocation()); 
         int pinkdist = n.computeShortestPath(pink.getLocation()); 
         int bluedist = n.computeShortestPath(blue.getLocation());
         int orangedist = n.computeShortestPath(orange.getLocation()); 
        
        n.setAvgDist((reddist + pinkdist + bluedist +orangedist)/5);
      }
      
       java.util.Collections.sort(neighbors);
       
       for (Location local: neighbors) { 
         
         pac.moveTo(local);
       } 
            
  }

 
 

   // System.out.println (redd.getR()); 
  
   //System.out.println (redd.getC()); 
  
   
    

  

   
 
   
    
    // ellipse ( pac.xPixel(), pac.yPixel() , 16, 16);
    
/* public void solve() {

  QueueFrontier<Location> front = new QueueFrontier<Location>();
  // throw exception if style >= 4??

  while (front.size() > 0) {
      Location current = front.next();
      // if not done, set the spots u searched to a .
      maze.set(current.getR(), current.getC())); // i think you have to add another redghost object instead
      // adding frontiers
    for (Location neighbor:getValidNeighbors(current, style == 3)) {
        front.add(neighbor);
        //System.out.println("front added");
        maze.set(neighbor.getR(), neighbor.getC(), '?'); 
    } 

    //System.out.println("xcor: " + current.getR() + " ycor: " + current.getC());
    //System.out.println(front.toString());
  }
} */
    


    
   /* private int distToGoal(int r, int c) {
  Location end = maze.getEnd();
  return Math.abs(locExit.getR() - pacLoc.getR()) + Math.abs(locExit.getC() - pacLoc.getC());
    } */ 

    
      void keyPressed() {
        
    
     /*if (locPac.getR() == 17 && locPac.getC() == 27) { 
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
      locPac.setDot(new Dot("empty")); */ 
    

      // 1 = red, 2 = pink, 3 =  orange, 4 = blue;
      
      if (key == '1') { 
        
        n = redd; 
      } else if (key == '2') { 
        n = pink; 
      } else if (key == '3') { 
        n = orange;       
      } else if (key == '4') { 
        n = blue;
      } 
 
  
      locN = maze[n.getR()][n.getC()];
      System.out.println(locN);
    
      //System.out.println(n.getLocation());
        if (key == CODED) {

      if (keyCode == UP) {

        if (n.getR() > 0 && maze[n.getR() -1][n.getC()].isValid()) 
 
        locN = maze[n.getR()- 1][n.getC()];
        System.out.println(locN);
            //System.out.println(n.getLocation());
      } else if (keyCode == DOWN) {
        if (n.getR() < 35 && maze[n.getR() + 1][n.getC()].isValid()) 
        locN = maze[n.getR()+1][n.getC()];
            //System.out.println(n.getLocation());
      } else if (keyCode == RIGHT) { 
        if (n.getC() < 27 && maze[n.getR()][n.getC() + 1].isValid()) { 
          //System.out.println ("true");
        locN = maze[n.getR()][n.getC() + 1];
            //System.out.println(n.getLocation());
        }
        //System.out.println ("false");
      } else if (keyCode == LEFT) { 
        if (n.getC() > 0 && maze[n.getR()][n.getC() - 1].isValid()) 
        locN = maze[n.getR()][n.getC() - 1];
            //System.out.println(n.getLocation());
      }
        }
        
    
   
    //}
      //pac.getLocation().setSmell(9);
     /* for (int row = 0; row < maze.length; row ++) {
        for (int col = 0; col < maze[row].length; col ++) { 
          if (maze[row][col].getSmell() > 0) { 
            maze[row][col].setSmell(maze[row][col].getSmell() - 1);
          }
        }}  
      pac.moveTo(locPac);
      locPac.setSmell(10);
      redd.moveCloser(locPac); */ 
     // System.out.println (locN);
   
        n.moveTo(maze[locN.getR()][locN.getC()]);
     
    

}
  