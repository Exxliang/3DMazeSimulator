public class CameraVars {
  float DX, DY, DZ;
  float MDX, MDY;
  int turnValue;
  
  public CameraVars() {
    DX = SimConsts.INIT_CAMDX;
    DY = SimConsts.INIT_CAMDY;
    DZ = SimConsts.INIT_CAMDZ;
    turnValue = SimConsts.INIT_TURNVALUE;
  }
}
