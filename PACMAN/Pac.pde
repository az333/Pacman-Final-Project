class Pacman implements Creature {
   int x, y;
   int score; 
  
  
  public Pacman() {
    putSelfInGrid(); 
  }
  
  public int getX () { return x; } 
  public int getY () { return y; } 
  
  public Location getLocation () {
  return null;}
  
   public void moveTo(Location l) {
     x = l.getX(); 
     y = l.getY();
   }
 
    public void putSelfInGrid() {
       x = 13; 
       y = 26;
    }
    
    public void removeSelfFromGrid() {}
    
    public void beEaten() {}
   
}