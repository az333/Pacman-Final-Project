
public class RedGhost extends Ghost {
  public Location targetTile, cornerTile, redLoc;
  public boolean scatterMode, frightenedMode, chaseMode;
  public boolean inHouse;
  public int dotsEaten = 0;
  public int dotLimit = 0;
  
   private static final int[] xShift = {-1, 0,  0 ,1};
   private static final int[] yShift = { 0, 1, -1, 0};

  
  public RedGhost() {
   
    red = loadImage("redghost.png");
    putSelfInGrid();
    scatterMode = false;
    //moveToPac();
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
      moveTo(pac.getLocation());
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
    Location ary[] = new Location[4]; 
    for (int i = 0; i < xShift.length; i++) {
      int newR = r + xShift[i]; 
      int newC = c + yShift[i];
    } 
    

    if (l.isValid()) { 
      maze[r][c].setOccupied(false);
      this.setR(this.getR() + 1);
      this.setC(this.getC() + 1);]
      maze[r][c].setOccupied(true); 
      
    }
    }
  }
    
}