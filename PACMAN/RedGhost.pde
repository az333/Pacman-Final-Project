import java.*; 

public class RedGhost extends Ghost {
  public Location targetTile, cornerTile, redLoc;
  public boolean scatterMode, frightenedMode, chaseMode;
  public boolean inHouse;
  public int dotsEaten = 0;
  public int dotLimit = 0;

  
  int[] xShift = {-1, 0,  0 ,1};
  int[] yShift = { 0, 1, -1, 0};

  
  public RedGhost() {
   
    red = loadImage("redghost.png");
    putSelfInGrid();
    scatterMode = false;
   
    //setChaseMode();
    //moveToPac();
  }
  
  public boolean scatter() {
    return scatterMode;
  }
  
  void setScatterMode() {
    scatterMode = true;
    //frigthenedMode = false;
    chaseMode = false;
  }
  
  void setChaseMode() {
    chaseMode = true;
    //frigthenedMode = false;
    //scatteredMode = false;
  }
  
  void setfrightenedMode() {
    frightenedMode = true;
    scatterMode = false;
    chaseMode = false;
  }
  
  public boolean frightened() {
    return frightenedMode;
  }
  
  public boolean chase() {
    return chaseMode;
  }
  
  public int getDotsEaten() {
    return dotsEaten;
  }
  
  public void setDotsEaten() {
    dotsEaten++;
  }
  
  public boolean insideGhostHouse() {
    return inHouse;
  }
  
  public Location getLocation() {
    return maze[r][c];
  }
  
  public void moveToPac() {
    if (getLocation() != pac.getLocation()) {
      moveCloser(pac.getLocation());
    }
  }
  
  void setCornerTile() {
    cornerTile = maze[width - 32][0];
  }
  
  void setTargetTile() {
    targetTile = pac.getLocation();
  }
  
  void beEaten() {
    removeSelfFromGrid();
  }
  
  void removeSelfFromGrid() {
  }
  
void putSelfInGrid() {

  r = 16; 
  c = 13;
  //color col = color(255, 0, 0); 
  //fill(col);
  //ellipse(xPixel() , yPixel(), 16 , 16);
  //System.out.println ("xpix: " + xPixel() + " ypix: " + yPixel());
   maze[16][13].setOccupied(true);
    
  }
  
  public int getR() { return r; } 
  public int getC() { return c; } 
  
  public void setR(int changeBy) { 
    r+=changeBy;
} 
  public void setC(int changeBy) { 
    c+=changeBy; 
} 

public void moveTo (Location l) { 
     maze[r][c].setOccupied(false);
     r = l.getR(); 
     c = l.getC();
     maze[r][c].setOccupied(true);
 
} 
  public void moveCloser (Location l) {
    ArrayList<Location> locs = new ArrayList<Location>(); 
       for (int i = 0; i < xShift.length; i ++) { 
         if(r + xShift[i] > 0 && r + xShift[i] < 36 && c + yShift[i] > 0 && c + yShift[i] < 28) { 
          
         if ( maze[r + xShift[i]][c + yShift[i]].isValid()) { 
           locs.add(maze[r + xShift[i]][c + yShift[i]]); 
         } 
         }
       } 
       java.util.Collections.sort(locs);
       System.out.println(locs);
 
        moveTo(locs.get(0)); 
       
      
    }
  }
    