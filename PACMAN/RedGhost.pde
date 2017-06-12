
  PImage red; 
  
public class RedGhost extends Ghost {
  public Location targetTile, cornerTile, redLoc;
  public boolean scatterMode, frightenedMode, chaseMode;
  public boolean inHouse;
  public int dotsEaten = 0;
  public int dotLimit = 0;
  public int r,c = 0;
  
  public RedGhost() {
    red = loadImage("redghost.png");
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
    image(red, r, c);
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
    if (l.getR() > this.getR()) {
      this.setR(this.getR() + 1);
      //this.setLocation(this.getR(), this.getC());
    }
    if (l.getC() > this.getC()) {
      this.setC(this.getC() + 1);
      //this.setLocation(this.getR(), this.getC());
    }
  }
    
}