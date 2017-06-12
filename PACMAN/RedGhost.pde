
public class RedGhost extends Ghost {
  public Location targetTile, cornerTile, redLoc;
  public boolean scatterMode, frightenedMode, chaseMode;
  public boolean inHouse;
  public int dotsEaten = 0;
  public int dotLimit = 0;
  
  // private static final int[] xShift = {-1, 0,  0 ,1};
  // private static final int[] yShift = { 0, 1, -1, 0};

  
  public RedGhost() {
   
    red = loadImage("redghost.png");
    putSelfInGrid();
    scatterMode = false;
    moveToPac();
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
    
  int newR, newC;
      newR = l.getR(); 
        newC = l.getC();
    
      maze[r][c].setOccupied(false);
      if (l.getR() > getR()) {
        newR = getR() + 1;
      } else if (l.getR() < getR()) { 
        newR = getR() + 1; 
      } else if (l.getC() > getC()) { 
        newC = getC() + 1; 
      } else if (l.getC() < getC()) { 
        newC = getC() - 1; 
      } 
    
      
      if (newR > 0 && newR < 36 && newC > 0 && newC < 28 && maze[newR][newC].isValid()) 
      moveTo(maze[newR][newC]);
      
    
    }
  }
    