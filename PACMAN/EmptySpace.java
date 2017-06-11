  public class EmptySpace extends Location {
  
      private Dot dot;
      int r, c;
    
  
      public EmptySpace (int r, int c) {
  	super(r,c);
  dot = new Dot (false, false); 
      }
  
      public boolean isValid () {
  	return true;
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