public class Maze {

    private Location[][] board; 

    
    public Maze (String og) {
	try {
	    File text = new File(og);
	    Scanner inf = new Scanner(text);
	    String textstr = "";
	    int numrows = 0;
	    int numcols = 0; 
	    while(inf.hasNextLine()){
		String nextLine = inf.nextLine();
		numcols = nextLine.length();
		textstr += nextLine + "\n";
		numrows ++; 
	    }

	    board = new Location[numrows][numcols];
		       
	    int i = 0;
	    int row = 0;
	    for (int r = 0 ; r < numrows; r ++) {
		for (int c = 0; c < numcols; c ++) {
		    if (textstr.charAt(i) == '\n') {
			row ++;
			i ++;
		    } 
		
		    board[row][c] = new Location(row, c, textstr.charAt(i));

		    if (textstr.charAt(i) == 'S') {
			startX = row;
			startY = c;
		    }
		    i ++;

		} 
	    }
	} catch (FileNotFoundException e) {
	    System.out.println ("File not found");
	    System.exit(1);
	    
	} 
	setAnimate(false); 
    }




} 
