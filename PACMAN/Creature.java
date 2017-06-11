public interface Creature {
  //public int position;
  
  void moveTo (Location l);
  
  Location getLocation();
  
  void putSelfInGrid();
  
  void removeSelfFromGrid();
  
  void beEaten();
  
  String toString();
  
}