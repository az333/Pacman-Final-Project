import java.util.*;

public class QueueFrontier {
    private ArrayDeque<Location> q;
    private int size;

    public QueueFrontier() {
  q = new ArrayDeque<Location>();
    }

    public void add(Location loc) {
  q.add(loc);
  size++;
    }

    public Location next() {
  size--;
  return q.poll();
    }
    
    public int size() {
  return size;
    }
}