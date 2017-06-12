abstract class  Ghost extends Creature {
  //public Location targetTile, cornerTile;
  //public boolean scatterMode, frightenedMode, chaseMode;
  //public boolean inHouse;
  //public int dotsEaten = 0;
  //public int dotLimit;
  
  //void eatPacMan();
  abstract boolean scatter();
  abstract boolean frightened();
  abstract void setTargetTile();
  abstract boolean chase();
  abstract void setCornerTile();
  
}