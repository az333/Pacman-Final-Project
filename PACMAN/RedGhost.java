PImage red;

public class RedGhost implements Ghost {
  public Location targetTile, cornerTile;
  public boolean scatterMode, frightenedMode, chaseMode;
  public boolean inHouse;
  public int dotsEaten = 0;
  public int dotLimit = 0;
  
  public RedGhost() {
    scatterMode = false;
    setChaseMode();
    moveToPac();
    red = loadImage("redghost.png");
    image(red, x, y);
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
    return null;
  }
  
  public void moveToPac() {
    if (getLocation != pac.getLocation()) {
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
  }
  
  public void moveTo (Location l) {
    if (getLocation != pac.getLocation()) {
      moveTo(pac.getLocation());
    }
    else {
      removeSelfFromGrid();
    }
  }
    
}