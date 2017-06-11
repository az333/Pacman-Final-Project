abstract class Location {
    
    public int  r;
    public int  c;

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
	   
    public Location (int x, int  y) {
	this.r = x; 
	this.c = y;      
    }

    abstract boolean isValid ();

    public String toString () { 

  	return "(" + r+ "," + c+ ")" ;
    } 

} 