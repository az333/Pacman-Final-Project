  import java.util.*;
   
   public class EmptySpace extends Location {
  
      private Dot dot;
      int r, c;
 
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
  
      public boolean isValid () {
    	return r >= 0 && r <= 36 && c >= 0 && c <= 28 && !occupied;
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
  }