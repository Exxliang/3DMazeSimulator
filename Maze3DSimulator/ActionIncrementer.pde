public class ActionIncrementer {
  private boolean incrIP;
  private boolean doneFlag;
  
  public ActionIncrementer() {
    incrIP = false;
    doneFlag = true;
  }
  
  public void initIncr() {
    this.incrIP = true;
    this.doneFlag = false;
  }
  
  public void INCR() {
    if (playerVars.movingStatus == MovingStatus.F) {
      if (abs(playerVars.FDIR) == 1) {
        playerVars.PDX += utilities.getDir(playerVars.FDIR);
        if (abs(playerVars.PDX) == SimConsts.MOVE_RESISTANCE) {
          playerVars.PDX = 0;
          playerVars.PPOSX += utilities.getDir(playerVars.FDIR);
          this.incrIP = false;
          this.doneFlag = true;
        }
      } else
      if (abs(playerVars.FDIR) == 3) {
        playerVars.PDZ += utilities.getDir(playerVars.FDIR);
        if (abs(playerVars.PDZ) == SimConsts.MOVE_RESISTANCE) {
          playerVars.PDZ = 0;
          playerVars.PPOSZ += utilities.getDir(playerVars.FDIR);
          this.incrIP = false;
          this.doneFlag = true;
        }
      }
    } else
    if (playerVars.movingStatus == MovingStatus.U) {
      playerVars.PDY++;
      if (abs(playerVars.PDY) == SimConsts.MOVE_RESISTANCE) {
        playerVars.PDY = 0;
        playerVars.PPOSY += 1;
        this.incrIP = false;
        this.doneFlag = true;
      }
    } else
    if (playerVars.movingStatus == MovingStatus.D) {
      playerVars.PDY--;
      if (abs(playerVars.PDY) == SimConsts.MOVE_RESISTANCE) {
        playerVars.PDY = 0;
        playerVars.PPOSY -= 1;
        this.incrIP = false;
        this.doneFlag = true;
      }
    } else
    if (playerVars.movingStatus == MovingStatus.R) {
      cameraVars.turnValue++;
      if (cameraVars.turnValue == SimConsts.MOVE_RESISTANCE / 2) {
        utilities.dirSwitch(playerVars.movingStatus);
        cameraVars.turnValue = -SimConsts.MOVE_RESISTANCE / 2;
      } else
      if (cameraVars.turnValue == 0) {
        this.incrIP = false;
        this.doneFlag = true;
      }
    } else
    if (playerVars.movingStatus == MovingStatus.L) {
      cameraVars.turnValue--;
      if (cameraVars.turnValue == -SimConsts.MOVE_RESISTANCE / 2) {
        utilities.dirSwitch(playerVars.movingStatus);
        cameraVars.turnValue = SimConsts.MOVE_RESISTANCE / 2;
      } else
      if (cameraVars.turnValue == 0) {
        this.incrIP = false;
        this.doneFlag = true;
      }
    }
  }
  
  public boolean incrComplete() {
    return !this.incrIP && this.doneFlag;
  }
}
