import java.util.*;

abstract class Location implements Comparable<Location> {
    
    public int  r;
    public int  c;
    public boolean occupied;
    public int smell; 
    int avgDist; 
    int leeValue;
    
      
int[] xShift = {-1, 0,  0 ,1};
int[] yShift = { 0, 1, -1, 0};

    public int xPixel  () { 
      return c * 16  + 8;
    }
    
    void setLee (int num) { 
      leeValue = num; 
    } 
    
    abstract boolean isValid();
    
    int getLee () { 
      return leeValue;
    } 
    
    int computeShortestPath( Location g) { 
   /* LinkedList<Location> queue = new LinkedList<Location>();
 
    queue.add(f); 
    ArrayList<Location> explored = new ArrayList<Location>();
    explored.add(f);
    int i = 0;
    while(!queue.isEmpty()){
      Location current = queue.pollFirst();
            if(current.equals(g)) {
                return g.getLee();
            }
            else{
                    queue.addAll(current.getNeighbors());
            }
             current.setLee(i ); 
             i ++ 
        }
    return g.getLee(); */
    
    return Math.abs(getR() - g.getR()) + Math.abs(getC() - g.getC());
  
    }

    
   
    void setAvgDist(int num) { 
      avgDist = num;
    } 
    
    int getAvgDist() { return avgDist; } 

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
       
        smell = 0; 
    }
    abstract void setDot(Dot d);
    public int getSmell() { 
      return smell; 
    } 
    
    public void  setSmell(int sm) { 
      smell = sm;
    } 
 
   public  int compareTo (Location other) { 
     
     return avgDist - other.avgDist;
   }


public boolean equals (Location other) { 
  return r == other.r && c == other.c;
}
  

 public String toString () { 

    return "(" + r + "," +  c+ ")" ;
    } 

}