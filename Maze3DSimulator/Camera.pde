public class Camera {
  public Camera() {
    this.mapMouse();
  }
  
  public void mapMouse() {
    cameraVars.MDX = map(mouseX - width/2, -width/2, width/2, -SimConsts.absMouseXBound + 0.01, SimConsts.absMouseXBound - 0.01);
    cameraVars.MDY = map(-mouseY + height/2, -height/2, height/2, -SimConsts.absMouseYBound + 0.01, SimConsts.absMouseYBound - 0.01);
  }
  
  public void updateCamera() {
    camera(mazeVars.scalify(playerVars.getAbsX()),
           mazeVars.scalify(playerVars.getAbsY()),
           mazeVars.scalify(playerVars.getAbsZ()),
           mazeVars.scalify(playerVars.getAbsX()) + cameraVars.DX,
           mazeVars.scalify(playerVars.getAbsY()) + cameraVars.DY,
           mazeVars.scalify(playerVars.getAbsZ()) + cameraVars.DZ,
           0, -1, 0);
  }
  
  public void fLook() {
    if (abs(float(playerVars.FDIR)) == 1) {
      cameraVars.DX = utilities.getDir(playerVars.FDIR);
      cameraVars.DZ = utilities.getDir(playerVars.RDIR) * tan(cameraVars.MDX + PI * cameraVars.turnValue / (2 * SimConsts.MOVE_RESISTANCE));
    } else
    if (abs(float(playerVars.FDIR)) == 3) {
      cameraVars.DZ = utilities.getDir(playerVars.FDIR);
      cameraVars.DX = utilities.getDir(playerVars.RDIR) * tan(cameraVars.MDX + PI * cameraVars.turnValue / (2 * SimConsts.MOVE_RESISTANCE));
    }
    cameraVars.DY = tan(cameraVars.MDY);
  }
}
