   public class EmptySpace extends Location {
  
      private Dot dot;
      int r, c;
 
      boolean occupied;

    
  
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