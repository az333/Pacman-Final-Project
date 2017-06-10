public class EmptySpace extends Location {

    private Dot dot;


    public EmptySpace (int r, int c) {
	super(r,c);
    }

    public boolean isValid () {
	return true;
    }

    public boolean hasDot () {
	return dot != null;
    }

    public Dot getDot () {
	return dot;
    } 
}