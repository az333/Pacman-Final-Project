   public class EmptySpace extends Location {
  
      private Dot dot;
      int r, c;
    
  
      public EmptySpace (int r, int c) {
  	super(r,c);
  dot = new Dot (false, false); 
      }
  
      public boolean isValid () {
    	return r >= 0 && r <= 36 && c >= 0 && c <= 28;
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