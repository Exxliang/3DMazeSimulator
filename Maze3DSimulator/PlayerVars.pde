public class PlayerVars {
  public int PPOSX, PPOSY, PPOSZ;
  public int FDIR, RDIR, UDIR;
  public int PDX, PDY, PDZ;
  public String movingStatus;
  
  public PlayerVars() {
    PPOSX = SimConsts.INIT_PPOSX;
    PPOSY = SimConsts.INIT_PPOSY;
    PPOSZ = SimConsts.INIT_PPOSZ;
    FDIR = SimConsts.INIT_FDIR;
    RDIR = SimConsts.INIT_RDIR;
    UDIR = SimConsts.INIT_UDIR;
    PDX = SimConsts.INIT_PDX;
    PDY = SimConsts.INIT_PDY;
    PDZ = SimConsts.INIT_PDZ;
    movingStatus = SimConsts.INIT_MOVE_STATUS;
  }
  
  public float getAbsX() {
    return float(this.PPOSX) + float(this.PDX) / float(SimConsts.MOVE_SPEED);
  }
  
  public float getAbsY() {
    return float(this.PPOSY) + float(this.PDY) / float(SimConsts.MOVE_SPEED);
  }
  
  public float getAbsZ() {
    return float(this.PPOSZ) + float(this.PDZ) / float(SimConsts.MOVE_SPEED);
  }
}
