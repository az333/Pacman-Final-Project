void setup() {
  
}

void draw() {
  size(448,576);
  background(255);
  int rows = 36;
  int cols = 28;
  String[] lines = loadStrings("MainMaze.txt");
  String[] mazeLines = new String[lines.length];
  char[][] maze = new char[28][36];
  
  }
  // idea is to take the array of strings in lines 
  // and somehow convert them to a 2d array of chars
  // then assign each char to a wall tile