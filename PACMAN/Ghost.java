public interface Ghost extends Creature {
  //public Location targetTile, cornerTile;
  //public boolean scatterMode, frightenedMode, chaseMode;
  //public boolean inHouse;
  //public int dotsEaten = 0;
  //public int dotLimit;
  
  //void eatPacMan();
  boolean scatter();
  boolean frightened();
  void setTargetTile();
  boolean chase();
  void setCornerTile();
  
}