import java.util.*; 

public class RedGhost extends Ghost {
  Location targetTile, cornerTile, redLoc;
  boolean scatterMode, frightenedMode, chaseMode;
  boolean inHouse;
  int dotsEaten = 0;
  int dotLimit = 0;
  String colory; 




  public RedGhost() {

    red = loadImage("redghost.png");
    putSelfInGrid();
    scatterMode = false;

    //setChaseMode();
    //moveToPac();
  }

  public RedGhost(String col) { 
    red = loadImage("redghost.png");
    putSelfInGrid();
    scatterMode = false;
    colory = col;
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

  public int getR() { 
    return r;
  } 
  public int getC() { 
    return c;
  } 

  public void setR(int changeBy) { 
    r = changeBy;
  } 
  public void setC(int changeBy) { 
    c = changeBy;
  } 

  public void moveTo (Location l) { 
    maze[r][c].setOccupied(false);
    r = l.getR(); 
    c = l.getC();
    maze[r][c].setOccupied(true);
  } 
  public void moveCloser (Location l) {
    ArrayList<Location> locs = new ArrayList<Location>(); 
    locs.clear();
    for (int i = 0; i < xShift.length; i ++) { 
      if (r + xShift[i] > 0 && r + xShift[i] < 36 && c + yShift[i] > 0 && c + yShift[i] < 28) { 
        if ( maze[r + xShift[i]][c + yShift[i]].isValid()) { 
          locs.add(maze[r + xShift[i]][c + yShift[i]]);
        }
      }
    } 
    java.util.Collections.sort(locs);
    System.out.println(locs);
    for (Location loc : locs) {
      moveTo(loc); 
      if (loc.equals(locPac)) { 
        System.out.println ("game over");
      }
    }
  }

  void set( RedGhost ghost) { 
    r = ghost.getR(); 
    c = ghost.getC(); 
    colory = ghost.colory;
  } 

  String toString() { 
    return colory;
  } 
  void moveRandom() { 
    Random gen = new Random(); 
    r = gen.nextInt(36); 
    c = gen.nextInt(28);
    while (!maze[r][c].isValid()) { 
      r = gen.nextInt(36); 
      c = gen.nextInt(28);
    } 
    moveTo(maze[r][c]);
  }
}