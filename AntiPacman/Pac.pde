
class Pacman extends Creature {

   int score; 
   int[] orientations = {1, 2, 3, 4}; 
   // 1 = up, 2 = down, 3 = left,4 = right 
  
  
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
 
 
   public void moveTo(Location l) {
     maze[r][c].setOccupied(false);
     r = l.getR(); 
     c = l.getC();
     maze[r][c].setOccupied(true);
   }
   
   public Location getLocation () { 
     return maze[r][c];
   }
 
    public void putSelfInGrid() {
       c = 13; 
       r = 26;
       maze[26][13].setOccupied(true); 
    }
    

    public void setScore (int score) { 
      this.score = score; 
    } 
    
    public int getScore () { return score; } 
    

    public void removeSelfFromGrid() {}
    
    public void beEaten() {}
   
}