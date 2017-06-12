public class Wall extends Location {
  int r, c; 

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
    
    public void setDot (Dot d) {} 
}