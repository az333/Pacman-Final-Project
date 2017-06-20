import java.util.*;


abstract class Location implements Comparable<Location> {

  public int  r;
  public int  c;
  public boolean occupied;
  public int smell; 
  float avgDist; 
  int leeValue;


  int[] xShift = {-1, 0, 0, 1};
  int[] yShift = { 0, 1, -1, 0};


  public int xPixel  () { 
    return c * 16  + 8;
  }


  void setLee (int num) { 
    leeValue = num;
  } 

  boolean hasLee () { 
    return leeValue != -1;
  } 

  abstract boolean isValid();

  int getLee () { 
    return leeValue;
  } 

  int computeShortestPath( Location g) { 
    LinkedList<Location> queue = new LinkedList<Location>();
    this.setLee(0);
    queue.add(this); 

    //ArrayList<Location> explored = new ArrayList<Location>();
    Location current = this; 
    while (!queue.isEmpty()) {

      current = queue.removeFirst();
      //  System.out.println (current.getLee());
      if (!(current.getR() == g.getR() && current.getC() == g.getC())) {
        for (Location neigh : current.getNeighbors()) { 
          if (!neigh.hasLee()) { 

            neigh.setLee(current.getLee() + 1);
            queue.add(neigh);
          }
        }
      } else { 
        break;
      }
    }
    int temp = current.getLee(); 
    resetLee();
    //System.out.println(current.getLee());
    return temp;


    //return Math.abs(getR() - g.getR()) + Math.abs(getC() - g.getC());
  }


  abstract void resetLee();

  abstract ArrayList<Location> getNeighbors();

  void setAvgDist(float num) { 
    avgDist = num;
  } 

  float getAvgDist() { 
    return avgDist;
  } 

  public int yPixel () { 

    return r * 16 + 8;
  }

  public int getR() {
    return r ;
  }
  public int getC () {
    return c ;
  }

  public void setOccupied (boolean o) { 
    occupied = o;
  }
  public void setR (int newX) {
    r = newX ;
  }
  public void setC (int y) {
    this.c = y;
  }


  abstract boolean hasDot(); 

  public boolean isOccupied () { 
    return occupied;
  } 


  public Location (int x, int y) {
    this.r = x; 
    this.c = y;     
    leeValue = -1;
  }

  abstract void setDot(Dot d); 



  public  int compareTo (Location other) { 

    System.out.println(Math.round(avgDist - other.avgDist));

    return Math.round(avgDist - other.avgDist);
  }


  public String toString () { 

    return "(" + r + "," +  c+ ")" ;
  }
}


class LocCompare implements Comparator<Location> {

  @Override
    public int compare(Location o1, Location o2) {
    // write comparison logic here like below , it's just a sample
    return Math.round( o2.getAvgDist() - o1.getAvgDist()) ;
  }
}