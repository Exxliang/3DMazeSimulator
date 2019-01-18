public class ActionHandler {
  ActionIncrementer ai;
  
  public ActionHandler() {
    ai = new ActionIncrementer();
  }
  
  public boolean validMove(String move) {
    if (move == MovingStatus.F) {
      if (playerVars.FDIR == LookingStatus.POSX) {
        return !utilities.wallPresent(playerVars.PPOSX, playerVars.PPOSY, playerVars.PPOSZ, WallEnum.POSX);
      } else
      if (playerVars.FDIR == LookingStatus.NEGX) {
        return !utilities.wallPresent(playerVars.PPOSX, playerVars.PPOSY, playerVars.PPOSZ, WallEnum.NEGX); 
      } else
      if (playerVars.FDIR == LookingStatus.POSZ) {
        return !utilities.wallPresent(playerVars.PPOSX, playerVars.PPOSY, playerVars.PPOSZ, WallEnum.POSZ); 
      } else
      if (playerVars.FDIR == LookingStatus.NEGZ) {
        return !utilities.wallPresent(playerVars.PPOSX, playerVars.PPOSY, playerVars.PPOSZ, WallEnum.NEGZ); 
      } else {
        return false;
      }
    } else
    if (move == MovingStatus.U) {
      return !utilities.wallPresent(playerVars.PPOSX, playerVars.PPOSY, playerVars.PPOSZ, WallEnum.POSY); 
    } else
    if (move == MovingStatus.D) {
      return !utilities.wallPresent(playerVars.PPOSX, playerVars.PPOSY, playerVars.PPOSZ, WallEnum.NEGY); 
    } else {
      return false;
    }
  }
  
  public void setAction(char action) {
    switch (action) {
      case 'a':
        playerVars.movingStatus = MovingStatus.L;
        break;
      case 'd':
        playerVars.movingStatus = MovingStatus.R;
        break;
      case 'w':
        if (!validMove(MovingStatus.U)) return;
        playerVars.movingStatus = MovingStatus.U;
        break;
      case 's':
        if (!validMove(MovingStatus.F)) return;
        playerVars.movingStatus = MovingStatus.F;
        break;
      case 'x':
        if (!validMove(MovingStatus.D)) return;
        playerVars.movingStatus = MovingStatus.D;
        break;
      case ' ':
        if (markers.size() < SimConsts.maxMarkerCount) {
          markers.add(new Marker(playerVars.PPOSX, 
                                 playerVars.PPOSY, 
                                 playerVars.PPOSZ));
        }
        break;
      default:
        playerVars.movingStatus = MovingStatus.S;
    }
    if (playerVars.movingStatus != MovingStatus.S) {
      ai.initIncr();
    }
  }
  
  public void moveAnimate() {
    ai.INCR();
    if (ai.incrComplete()) {
      playerVars.movingStatus = MovingStatus.S;
      utilities.calcDispBoundaries();
    }
  }
}
