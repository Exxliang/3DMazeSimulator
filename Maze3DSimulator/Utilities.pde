public class Utilities {
  public Utilities() { }
  
  public float getDir(int k) {
    return k / abs(float(k));
  }
  
  public int getBinPow(int k) {
    return int(pow(2, k));
  }
  
  public int removeKthBit(int num, int k) {
    if ((num & getBinPow(k)) == 0) return num;
    return int(num - getBinPow(k));
  }
  
  public boolean wallPresent(int x, int y, int z, int k) {
    return !((mazeVars.WALLS[x][y][z] & getBinPow(k)) == 0);
  }
  
  public void dirSwitch(String move) {
    int tempAxis = playerVars.FDIR;
    if (move == MovingStatus.R) {
      playerVars.FDIR = playerVars.RDIR;
      playerVars.RDIR = -tempAxis;
    } else
    if (move == MovingStatus.L) {
      playerVars.FDIR = -playerVars.RDIR;
      playerVars.RDIR = tempAxis;
    }
  }
  
  public void calcDispBoundaries() {
    mazeVars.minXDISP = max(1, playerVars.PPOSX - SimConsts.visibDist);
    mazeVars.maxXDISP = min(SimConsts.SIM_LENGTH, playerVars.PPOSX + SimConsts.visibDist);
    mazeVars.minYDISP = max(1, playerVars.PPOSY - SimConsts.visibDist);
    mazeVars.maxYDISP = min(SimConsts.SIM_WIDTH, playerVars.PPOSY + SimConsts.visibDist);
    mazeVars.minZDISP = max(1, playerVars.PPOSZ - SimConsts.visibDist);
    mazeVars.maxZDISP = min(SimConsts.SIM_HEIGHT, playerVars.PPOSZ + SimConsts.visibDist);
    for (int i = 0; i < markers.size(); i++) {
      Marker marker = markers.get(i);
      marker.inRange = marker.Mx >= mazeVars.minXDISP &&
                       marker.Mx <= mazeVars.maxXDISP &&
                       marker.My >= mazeVars.minYDISP &&
                       marker.My <= mazeVars.maxYDISP &&
                       marker.Mz >= mazeVars.minZDISP &&
                       marker.Mz <= mazeVars.maxZDISP;
    }
  }
}
