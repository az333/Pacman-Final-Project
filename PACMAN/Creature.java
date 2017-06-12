
  abstract class  Creature {
  //public int position;
  int r = 0, c = 0;
    
   abstract void moveTo (Location l);
   
    int xPixel () { 
      return c * 16  + 8;
    }
     int yPixel () { 
      return r * 16 + 8; 
    }
 

    abstract void putSelfInGrid();
    
    abstract Location getLocation(); 
    
    abstract void removeSelfFromGrid(); 
    
    abstract void beEaten();  
    

  }