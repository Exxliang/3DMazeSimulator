public class Sim {
  private Maze maze;
  private ActionHandler ah;
  
  public Sim() {
    maze = new Maze();
    ah = new ActionHandler();
  }
  
  public void initMaze() {
    maze.initMazeRegion();
  }
  
  public void createMaze() {
    maze.constructMaze();
  }
  
  public void openMaze() {
    maze.makeOpenings();
  }
  
  public void drawMaze() {
    maze.displayMaze();
  }
  
  public void drawMarkers() {
    if (markers.size() > 0) {
      for (int i = 0; i < markers.size(); i++){
        Marker marker = markers.get(i);
        marker.displayMarker();
      }
    }
  }
  
  public void handleAction(char a) {
    ah.setAction(a);
  }
  
  public void applyMotionUpdate() {
    ah.moveAnimate();
  }
}
