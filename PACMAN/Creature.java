  public interface Creature {
  //public int position;
  int r, c;
    
   public void moveTo (Location l);
   
   default int xPixel () { 
      return c * 16  + 8;
    }
    default int yPixel () { 
      return r * 16 + 8; 
    }
 
    public Location getLocation();
    
    public void putSelfInGrid();
    
    public void removeSelfFromGrid();
    
    public void beEaten();
    
    public String toString(); 
  }