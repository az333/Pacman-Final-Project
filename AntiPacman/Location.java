abstract class Location implements Comparable<Location> {
    
    public int  r;
    public int  c;
    public boolean occupied;
    public int smell; 

    public int xPixel  () { 
      return c * 16  + 8;
    }
    
    public int yPixel () { 
      return r * 16 + 8; 
    }
    
    public int getR() {
	return r ;
    }
    public int getC () {
	return c ;
    }
   
     public void setOccupied (boolean o) { 
        occupied = o; 
      }
    public void setR (int newX) {
	r = newX ;
    }
    public void setC (int y) {
	this.c = y;
    }
    
    abstract boolean hasDot();
    
    public boolean isOccupied () { 
      return occupied; 
    } 
    
    abstract void setDot (Dot d);
	   
    public Location (int x, int y, Location previous) {
	      this.r = x; 
	      this.c = y;     
        this.previous = previous;
        smell = 0; 
    }
    
    public int getSmell() { 
      return smell; 
    } 
    
    public void  setSmell(int sm) { 
      smell = sm;
    } 
    
    public int compareTo (Location other) { 
      return  smell - other.smell;
    } 

    abstract boolean isValid ();

    public String toString () { 

  	return "(" + r+ "," + c+ ")" ;
    } 

}