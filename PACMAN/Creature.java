  public interface Creature {
  //public int position;
    
   public void moveTo (Location l);
   
 
    public Location getLocation();
    
    public void putSelfInGrid();
    
    public void removeSelfFromGrid();
    
    public void beEaten();
    
    public String toString(); 
  }