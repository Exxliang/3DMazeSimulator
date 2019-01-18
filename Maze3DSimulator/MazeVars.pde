public class MazeVars {
  int[][][] WALLS = new int[SimConsts.SIM_LENGTH + 2]
                           [SimConsts.SIM_WIDTH + 2]
                           [SimConsts.SIM_HEIGHT + 2];
  boolean[][][] VISITED = new boolean[SimConsts.SIM_LENGTH + 2]
                                     [SimConsts.SIM_WIDTH + 2]
                                     [SimConsts.SIM_HEIGHT + 2];
  boolean initialized, randomized, completed;
  int minXDISP, maxXDISP, minYDISP, maxYDISP, minZDISP, maxZDISP;
  
  public MazeVars() {
    initialized = false;
    randomized = false;
    completed = false;
  }
  
  public float scalify(float k) {
    return 2 * SimConsts.SCALE * k;
  }
}
