public class Maze {
  MazeDisplayer md;
  
  public Maze() {
    md = new MazeDisplayer();
  }
  
  public void initMazeRegion() {
    int l = SimConsts.SIM_LENGTH;
    int w = SimConsts.SIM_WIDTH;
    int h = SimConsts.SIM_HEIGHT;
    
    for (int i = 0; i < l + 2; i++) {
      for (int j = 0; j < w + 2; j++) {
        for (int k = 0; k < h + 2; k++) {
          mazeVars.VISITED[i][j][k] = true;
          mazeVars.WALLS[i][j][k] = 0;
        }
      }
    }
    
    for (int i = 1; i < l + 1; i++) {
      for (int j = 1; j < w + 1; j++) {
        for (int k = 1; k < h + 1; k++) {
          mazeVars.VISITED[i][j][k] = false;
          mazeVars.WALLS[i][j][k] = utilities.getBinPow(WallEnum.ALL) - 1;
        }
      }
    }
  }
  
  public void constructMaze() {
    if (!mazeVars.initialized) {
      println(MessageHeader.STATE_INFO, "Initiated maze construction.");
      walk(SimConsts.INIT_PPOSX, SimConsts.INIT_PPOSY, SimConsts.INIT_PPOSZ);
      mazeVars.initialized = true;
      println(MessageHeader.STATE_INFO, "Completed maze construction.");
    }
    if (!mazeVars.randomized) {
      println(MessageHeader.STATE_INFO, "Initiated maze randomization.");
      randomize();
      mazeVars.randomized = true;
      println(MessageHeader.STATE_INFO, "Completed maze randomization.");
    }
    if (mazeVars.initialized && mazeVars.randomized) {
      mazeVars.completed = true;
      mazeVars.VISITED = null;
      println(MessageHeader.STATE_INFO, "Ready for simualation.");
    }
  }
  
  private IntList createSideList() {
    IntList sideList = new IntList();
    sideList.append(0);
    sideList.append(1);
    sideList.append(2);
    sideList.append(3);
    sideList.append(4);
    sideList.append(5);
    sideList.shuffle();
    return sideList;
  }
  
  private void walk(int x, int y, int z) {
    mazeVars.VISITED[x][y][z] = true;
    IntList sideList = createSideList();
    int[][] DIRS = {{x+1,y,z},{x-1,y,z},{x,y+1,z},{x,y-1,z},{x,y,z+1},{x,y,z-1}};
    int DX,DY,DZ;
    
    for (int n = 0; n < SimConsts.SIDES; n++) {
      int nVal = sideList.get(n);
      DX = DIRS[nVal][0];
      DY = DIRS[nVal][1];
      DZ = DIRS[nVal][2];
      if (!mazeVars.VISITED[DX][DY][DZ]) {
        if (DX == x && DY == y) {
          mazeVars.WALLS[DX][DY][min(DZ,z)] = utilities.removeKthBit(mazeVars.WALLS[DX][DY][min(DZ,z)], WallEnum.POSZ);
          mazeVars.WALLS[DX][DY][max(DZ,z)] = utilities.removeKthBit(mazeVars.WALLS[DX][DY][max(DZ,z)], WallEnum.NEGZ);
        } else
        if (DX == x && DZ == z) {
          mazeVars.WALLS[DX][min(DY,y)][DZ] = utilities.removeKthBit(mazeVars.WALLS[DX][min(DY,y)][DZ], WallEnum.POSY);
          mazeVars.WALLS[DX][max(DY,y)][DZ] = utilities.removeKthBit(mazeVars.WALLS[DX][max(DY,y)][DZ], WallEnum.NEGY);
        } else
        if (DY == y && DZ == z) {
          mazeVars.WALLS[min(DX,x)][DY][DZ] = utilities.removeKthBit(mazeVars.WALLS[min(DX,x)][DY][DZ], WallEnum.POSX);
          mazeVars.WALLS[max(DX,x)][DY][DZ] = utilities.removeKthBit(mazeVars.WALLS[max(DX,x)][DY][DZ], WallEnum.NEGX);
        }
        walk(DX, DY, DZ);
      }
    }
  }
  
  public void randomize() {
    for (int i = 0; i < int(SimConsts.SIM_LENGTH * 
                            SimConsts.SIM_WIDTH * 
                            SimConsts.SIM_HEIGHT / float(18 - SimConsts.randomizationLevel)); i++) {
      int x = floor(random(2, SimConsts.SIM_LENGTH));
      int y = floor(random(2, SimConsts.SIM_WIDTH));
      int z = floor(random(2, SimConsts.SIM_HEIGHT));
      int s = floor(random(0, SimConsts.SIDES));
      if (mazeVars.VISITED[x][y][z]) {
        switch (s) {
          case WallEnum.NEGZ:
            mazeVars.WALLS[x][y][z] = utilities.removeKthBit(mazeVars.WALLS[x][y][z], WallEnum.NEGZ);
            mazeVars.WALLS[x][y][z-1] = utilities.removeKthBit(mazeVars.WALLS[x][y][z-1], WallEnum.POSZ);
            break;
          case WallEnum.POSZ:
            mazeVars.WALLS[x][y][z] = utilities.removeKthBit(mazeVars.WALLS[x][y][z], WallEnum.POSZ);
            mazeVars.WALLS[x][y][z+1] = utilities.removeKthBit(mazeVars.WALLS[x][y][z+1], WallEnum.NEGZ);
            break;
          case WallEnum.NEGY:
            mazeVars.WALLS[x][y][z] = utilities.removeKthBit(mazeVars.WALLS[x][y][z], WallEnum.NEGY);
            mazeVars.WALLS[x][y-1][z] = utilities.removeKthBit(mazeVars.WALLS[x][y-1][z], WallEnum.POSY);
            break;
          case WallEnum.POSY:
            mazeVars.WALLS[x][y][z] = utilities.removeKthBit(mazeVars.WALLS[x][y][z], WallEnum.POSY);
            mazeVars.WALLS[x][y+1][z] = utilities.removeKthBit(mazeVars.WALLS[x][y+1][z], WallEnum.NEGY);
            break;
          case WallEnum.NEGX:
            mazeVars.WALLS[x][y][z] = utilities.removeKthBit(mazeVars.WALLS[x][y][z], WallEnum.NEGX);
            mazeVars.WALLS[x-1][y][z] = utilities.removeKthBit(mazeVars.WALLS[x-1][y][z], WallEnum.POSX);
            break;
          case WallEnum.POSX:
            mazeVars.WALLS[x][y][z] = utilities.removeKthBit(mazeVars.WALLS[x][y][z], WallEnum.POSX);
            mazeVars.WALLS[x+1][y][z] = utilities.removeKthBit(mazeVars.WALLS[x+1][y][z], WallEnum.NEGX);
            break;
        }
      }
    }
  }
  
  public void makeOpenings() {
    mazeVars.WALLS[1][1][1] = utilities.removeKthBit(mazeVars.WALLS[1][1][1], WallEnum.NEGX);
    mazeVars.WALLS[SimConsts.SIM_LENGTH][SimConsts.SIM_WIDTH][SimConsts.SIM_HEIGHT] = utilities.removeKthBit(mazeVars.WALLS[SimConsts.SIM_LENGTH][SimConsts.SIM_WIDTH][SimConsts.SIM_HEIGHT], WallEnum.POSX);
  }
  
  private float distance(float x, float y, float z) {
    return sqrt(pow(x - mazeVars.scalify(playerVars.getAbsX()) - cameraVars.DX, 2) +
                pow(y - mazeVars.scalify(playerVars.getAbsY()) - cameraVars.DY, 2) +
                pow(z - mazeVars.scalify(playerVars.getAbsZ()) - cameraVars.DZ, 2));
  }
  
  private float gradient(float dist) {
    return SimConsts.illumination * exp(-pow(dist, 2) / 100000);
  }
  
  private void addOpTrans(float val) {
    if (SimConsts.enableTransparency) {
      fill(val,100);
    } else {
      fill(val);
    }
  }
  
  public void displayMaze() {
    stroke(0);
    for (int i = mazeVars.minXDISP; i <= mazeVars.maxXDISP; i++) {
      for (int j = mazeVars.minYDISP; j <= mazeVars.maxYDISP; j++) {
        for (int k = mazeVars.minZDISP; k <= mazeVars.maxZDISP; k++) {
          float SI = mazeVars.scalify(i);
          float SJ = mazeVars.scalify(j);
          float SK = mazeVars.scalify(k);
          if (utilities.wallPresent(i, j, k, WallEnum.NEGZ)) {
            addOpTrans(gradient(distance(SI, SJ, SK - SimConsts.SCALE)));
            md.displayZRect(SI, SJ, SK, true);
          }
          if (utilities.wallPresent(i, j, k, WallEnum.POSZ)) {
            addOpTrans(gradient(distance(SI, SJ, SK + SimConsts.SCALE)));
            md.displayZRect(SI, SJ, SK, false);
          }
          if (utilities.wallPresent(i, j, k, WallEnum.NEGY)) {
            addOpTrans(gradient(distance(SI, SJ - SimConsts.SCALE, SK)));
            md.displayYRect(SI, SJ, SK, true);
          }
          if (utilities.wallPresent(i, j, k, WallEnum.POSY)) {
            addOpTrans(gradient(distance(SI, SJ + SimConsts.SCALE, SK)));
            md.displayYRect(SI, SJ, SK, false);
          }
          if (utilities.wallPresent(i, j, k, WallEnum.NEGX)) {
            addOpTrans(gradient(distance(SI - SimConsts.SCALE, SJ, SK)));
            md.displayXRect(SI, SJ, SK, true);
          }
          if (utilities.wallPresent(i, j, k, WallEnum.POSX)) {
            addOpTrans(gradient(distance(SI + SimConsts.SCALE, SJ, SK)));
            md.displayXRect(SI, SJ, SK, false);
          }
        }
      }
    }
  }
}
