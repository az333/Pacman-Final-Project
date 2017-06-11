abstract class Location {
    
    public int  r;
    public int  c;


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
   
    public void setR (int newX) {
	r = newX ;
    }
    public void setC (int y) {
	this.c = y;
    }
    
    abstract boolean hasDot();
    
    abstract void setDot (Dot d);
	   
    public Location (int x, int  y) {
	      this.r = x; 
	      this.c = y;      
    }

    abstract boolean isValid ();

    public String toString () { 

  	return "(" + r+ "," + c+ ")" ;
    } 

}