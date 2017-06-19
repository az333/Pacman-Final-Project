  import java.util.*;
   
   public class EmptySpace extends Location {
  
      private Dot dot;
       
      boolean occupied;
      
    /*int red = Math.abs(locRed.getR() - r) + Math.abs(locRed.getC() - c); 
    int blue = Math.abs(locBlue.getR() - r) + Math.abs(locBlue.getC() - c); 
    int pink = Math.abs(locPink.getR() - r) + Math.abs(locPink.getC() - c);
    int orange = Math.abs(locOrange.getR() - r) + Math.abs(locOrange.getC() - c); */
 
    public int compareTo (Location other) {return 0; }
    
  
      public EmptySpace (int r, int c) {
  	    super(r,c);
        dot = new Dot (false, false); 
        occupied = false; 
        
      }
      
    ArrayList<Location> getNeighbors() { 
            
   
     ArrayList<Location> neighbors = new ArrayList<Location> (); 
     for (int i = 0; i < xShift.length; i ++) { 
   
         if ((r + xShift[i]) >= 0 && (r + xShift[i]) < 36 && (c + yShift[i]) >= 0 && (c + yShift[i]) < 28) { 
            Location temp = maze[r + xShift[i]][c + yShift[i]];
            //System.out.println(temp);
         if (temp.isValid()) { 
         neighbors.add(temp);
         }
       } 

     }
     return neighbors;
    
   }
    
   
  
      public boolean isValid () {
    	return r >= 0 && r < 36 && c >= 0 && c < 28 && !occupied;
      }
  

     public boolean hasDot() {
  	return !dot.isNull();
      }
  
      public Dot getDot () {
  	return dot;
      } 
      
    
      public void setDot(Dot d) { 
        dot = d;
      }
      
        void resetLee() { 
    
    for (int a = 0; a < maze.length; a ++) { 
      for (int b =0 ; b < maze[a].length; b ++) { 
        maze[a][b].setLee(-1);
      } 
    }
  }
  }