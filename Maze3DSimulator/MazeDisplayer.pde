public class MazeDisplayer {
  
  public MazeDisplayer() { }
  
  public void displayZRect(float bX, float bY, float bZ, boolean NEG) {
    int s = SimConsts.SCALE;
    if (NEG) {
      translate(bX, bY, bZ - s);
      rect(0, 0, 2 * s, 2 * s);
      translate(-bX, -bY, -bZ + s);
    } else {
      translate(bX, bY, bZ + s);
      rect(0, 0, 2 * s, 2 * s);
      translate(-bX, -bY, -bZ - s);
    }
  }
  
  public void displayYRect(float bX, float bY, float bZ, boolean NEG) {
    int s = SimConsts.SCALE;
    if (NEG) {
      translate(bX, bY - s, bZ);
      rotateX(PI / 2);
      rect(0, 0, 2 * s, 2 * s);
      rotateX(-PI / 2);
      translate(-bX, -bY + s, -bZ);
    } else {
      translate(bX, bY + s, bZ);
      rotateX(PI / 2);
      rect(0, 0, 2 * s, 2 * s);
      rotateX(-PI / 2);
      translate(-bX, -bY - s, -bZ);
    }
  }
  
  public void displayXRect(float bX, float bY, float bZ, boolean NEG) {
    int s = SimConsts.SCALE;
    if (NEG) {
      translate(bX - s, bY, bZ);
      rotateY(PI / 2);
      rect(0, 0, 2 * s, 2 * s);
      rotateY(-PI / 2);
      translate(-bX + s, -bY, -bZ);
    } else {
      translate(bX + s, bY, bZ);
      rotateY(PI / 2);
      rect(0, 0, 2 * s, 2 * s);
      rotateY(-PI / 2);
      translate(-bX - s, -bY, -bZ);
    }
  }
}
