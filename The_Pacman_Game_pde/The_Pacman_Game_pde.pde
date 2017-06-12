import java.util.*;

Set<Position> dots = new HashSet<Position>();
Set<Position> uberDots = new HashSet<Position>();
Set<Position> free = new HashSet<Position>();
Map<Position, Integer> smell = new HashMap<Position, Integer>();
List<Ghost> ghosts = new ArrayList<Ghost>();
PacMan pacman = new PacMan();
int score = 0;
PImage mazeimg;
int scaredGhosts = 0;
Ghost toDie = null;

int rows = 36;
int cols = 28;

Position one = new Position(17, 27);
Position two = new Position(17, 0);

  
void setup() {
    size(448, 576);
    background(255);
    mazeimg = loadImage("mazeimg.png");
    image(mazeimg, 0, 0);
    ellipseMode(RADIUS);
    noStroke();
  
    String[] lines = loadStrings("MainMaze.txt");

    for (int r = 0; r < rows; r++) {
	for (int c = 0; c < cols; c++) {
	    if (lines[r].charAt(c) != '0') {
		Position p = new Position(r, c);
		free.add(p);
		if (random(1)<0.96)
		    dots.add(p);
		else
		    uberDots.add(p);
		smell.put(p, 0);
	    } 
        }
    }

    initGhosts();
}
  
void draw() {
    background(255);
    mazeimg = loadImage("mazeimg.png");
    image(mazeimg, 0, 0);

    fill(#FFEC00);
    noStroke();
    for (Position pos: dots)
	ellipse(pos, 4);
    for (Position pos: uberDots)
	ellipse(pos, 7);

    drawAll();
}

void drawAll() {
    pacman.draw();

    for (Ghost g: ghosts)
	  g.draw();
}    

void keyPressed() {
    
    if (key == CODED) {
	pacman.perform();
	
	if (keyCode == UP)
	    if (valid(pacman.pos.up()))
		pacman.pos = pacman.pos.up();
	if (keyCode == DOWN)
	    if (valid(pacman.pos.down()))
		pacman.pos = pacman.pos.down();
	if (keyCode == RIGHT)
	    if (valid(pacman.pos.right()))
		pacman.pos = pacman.pos.right();
	if (keyCode == LEFT)
	    if (valid(pacman.pos.left()))
		pacman.pos = pacman.pos.left();
	for (Ghost g: ghosts)
	    g.perform();
	if (toDie != null) {
	    ghosts.remove(toDie);
	    toDie = null;
	}
    }
}

void initGhosts() {
    ghosts.add(new Ghost(new Position(4, 4), #ea82e5));
    ghosts.add(new Ghost(new Position(14, 14), #46bfee));
    ghosts.add(new Ghost(new Position(23, 18), #d03e19));
    ghosts.add(new Ghost(new Position(26, 3), #db851c));
}

boolean valid(Position p) {
    return free.contains(p);
}

void ellipse(Position p, int radius) {
    ellipse(p.c * 16 + 8, p.r * 16 + 8, radius, radius);
}

class Position {
    int r;
    int c;
    int smell;

    public Position(int r, int c) {
	this.r = r;
	this.c = c;
	smell = 0;
    }

    List<Position> neighbors() {
	return Arrays.asList(new Position[] {up(), right(), down(), left()});
    }
    
    Position left() {
	return new Position(r, c-1);}
    Position down() {
	return new Position(r+1, c);}
    Position right() {
	return new Position(r, c+1);}
    Position up() {
	return new Position(r-1, c);}
	

    int hashCode() {
	return r<<16 + c;}
    boolean equals(Object other) {
	if (!(other instanceof Position)) return false;
	Position p = (Position) other;
	return (p.r == r) && (p.c == c);
    }

}

class Ghost {
    Position pos;
    int colour;
    int prev = 0;
    
    public Ghost(Position pos, int colour) {
	this.pos = pos;
	this.colour = colour;
    }
    
    void draw() {
	if (scaredGhosts <= 0)
	    fill(colour);
	else
	    fill(0, 0, 255);
	ellipse(pos, 8);
    }

    class LinkedPosition {
	Position val;
	LinkedPosition prev;
	Position root;

	LinkedPosition(LinkedPosition l, Position p) {
	    this.prev = l;
	    this.val = p;
	    if (l!=null && p!=null)
		root = (l.root==null)? p: l.root;
	}
    }

    Position best() {
	Set<Position> touched = new HashSet<Position>();
	Queue<LinkedPosition> eval = new ArrayDeque<LinkedPosition>();
	touched.add(pos);
	eval.add(new LinkedPosition(null, pos));
	while (!eval.isEmpty()) {
	    LinkedPosition l = eval.remove();
	    if (l.val.equals(pacman.pos))
		return (l.root==null)? l.val: l.root;
	    for (Position p: l.val.neighbors())
		if (valid(p) && !touched.contains(p)) {
		    eval.add(new LinkedPosition(l, p));
		    touched.add(p);
		}
	}
	throw new IllegalStateException("nowhere to run");
    }

    void perform() {
	if (scaredGhosts<=0 || random(1)<0.6) {
	    Position best = best();
	    if (scaredGhosts--<=0) {
		pos = best;
	    } else {
		Position worst = new Position(2*pos.r - best.r, 2*pos.c - best.c);
		if (valid(worst))
		    pos = worst;
		else {
		    Position secondWorst = new Position(pos.c - best.c + pos.r, best.r - pos.r + pos.c);
		    if (valid(secondWorst))
			pos = secondWorst;
		    else
			pos = new Position(pos.c - worst.c + pos.r, worst.r - pos.r + pos.c);
		}
	    }
	}

	if (pos.equals(pacman.pos)) {
	    if (scaredGhosts <= 0) {
		draw();
		println("game over: " + score + " points earned");
		noLoop();
		try {
		    Thread.sleep(1000);
		} catch (Exception e) {exit();}
		exit();
	    } else {
		toDie = this;
		score += 20;
	    }
	}
    }
}

class PacMan {
    Position pos;

    public PacMan() {
	pos = new Position(26, 13);
    }
    
    void draw() {
	fill(255, 255, 0);
	ellipse(pos, 8);
    }

    void visit() {
	if (uberDots.contains(pos)) {
	    scaredGhosts = 10 * ghosts.size();
	    score+=5;
	    uberDots.remove(pos);
	}
	if (dots.contains(pos)) {
	    score++;
	    dots.remove(pos);
	}
    }
	
    void perform() {
	visit();
	if (pos.equals(one))
	    pos = two;
	else if (pos.equals(two))
	    pos = one;
	else return;
	visit();
    }
}