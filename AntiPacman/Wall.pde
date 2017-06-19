public class Wall extends Location {

    public Wall (int r, int c) {
	super (r, c);
    }

    public boolean isValid () {
	    return false;
    } 
    
    public boolean hasDot() { 
      return false; 
    }
    
    public boolean isOccupied() { 
      return false;
    }
    
      void resetLee() { 
    
    for (int a = 0; a < maze.length; a ++) { 
      for (int b =0 ; b < maze[a].length; b ++) { 
        maze[a][b].setLee(0);
      } 
    }
  }
    public void setDot (Dot d) {} 
    
       ArrayList<Location> getNeighbors() { 
            
     ArrayList<Location> neighbors = new ArrayList<Location> (); 
     for (int i = 0; i < xShift.length; i ++) { 
       if ((r + xShift[i]) >= 0 && (r + xShift[i]) < 36 && (c + yShift[i]) >= 0 && (c + yShift[i]) < 28) { 
         Location temp = maze[r + xShift[i]][c + yShift[i]];
         if (temp.isValid()) { 
         neighbors.add(temp);
         }
       } 
       
       
     } 
     return neighbors;
    
   }
    
   
    
}