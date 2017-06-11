class Pacman implements Creature {
   int r, c;
   int score; 
  
  
  public Pacman() {
    putSelfInGrid(); 
  }
  
  public int getR() { return r; } 
  public int getC() { return c; } 
  
  public Location getLocation () {
  return null;}
  
   public void moveTo(Location l) {
     x = l.getR(); 
     y = l.getC();
   }
 
    public void putSelfInGrid() {
       c = 13; 
       r = 26;
    }
    
    public void removeSelfFromGrid() {}
    
    public void beEaten() {}
   
}