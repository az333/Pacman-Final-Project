public class Dot {

    private boolean isFruit;
    private boolean isBig;
    private boolean isNull;

    public Dot (boolean fruit, boolean big) {
	    isFruit = fruit;
	    isBig = big; 
       isNull = false;
    }

    public Dot (String str) { 
      if (str.equals("empty")){ 
        isNull = true; 
      } 
    }
      public boolean isNull () { 
        return isNull;
      }
        
    public boolean isFruit () {
	    return isFruit;
    }

    public boolean isBig () {
	    return isBig;
    }
   
   public boolean isLittleDot() {
     return !isFruit() && !isBig();
   }

   public boolean isBigDot() {
     return !isFruit() && isBig();
   }
   
   public boolean isFruitDot() {
     return isFruit() && !isBig();
   }
  
} 