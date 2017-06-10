public abstract class Location {
    
    public int  x ;
    public int  y ;

    public int getRow () {
	return x ;
    }
    public int  getCol () {
	return y ;
    }
   
    public void setRow  (int newX) {
	x = newX ;
    }
    public void setCol (int y) {
	this.y = y;
    }
	   
    public Location (int x, int  y) {
	this.x = x; 
	this.y = y;      
    }

    public boolean isValid () {
    }

    public String toString () { 

	return "(" + x + "," + y + ")" ;
    } 

} 
