public class Dot {

    private boolean isFruit;
    private boolean isBig;

    public Dot (boolean fruit, boolean big) {
	    isFruit = fruit;
	    isBig = big; 
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