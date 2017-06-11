class Pacman extends Creature {
   int r, c;
   int score; 
  
  
  public Pacman() {
    putSelfInGrid(); 
  }
  
     public int xPixel () { 
      return c * 16  + 8;
    }
    public int yPixel () { 
      return r * 16 + 8; 
    }
    
  public int getR() { return r; } 
  public int getC() { return c; } 
  
  public Location getLocation () {
  return null;
}
  
   public void moveTo(Location l) {
     r = l.getR(); 
     c = l.getC();
   }
 
    public void putSelfInGrid() {
       c = 13; 
       r = 26;
    }
    
    public void setScore (int score) { 
      this.score = score; 
    } 
    
    public int getScore () { return score; } 
    
    public void removeSelfFromGrid() {}
    
    public void beEaten() {}
   
}