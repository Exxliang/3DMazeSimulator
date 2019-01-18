public static abstract class SimConsts {
  static final int SIM_LENGTH = 17; // x-axis measurement
  static final int SIM_WIDTH = 17; // y-axis measurement
  static final int SIM_HEIGHT = 17; // z-axis measurement
  
  static final int framesRate = 60;
  static final int smoothAmount = 5;
  static final int SIDES = 6;
  static final int visibDist = 3;
  static final int illumination = IlluminationMode.BRIGHT;
  
  static final int SCALE = 100;
  static final int MOVE_SPEED = 20;
  static final int randomizationLevel = 2; // 2 - 10 range
  static final int maxMarkerCount = max(1, int((SIM_LENGTH + SIM_WIDTH + SIM_HEIGHT) / 3.0) - 8);
  
  static final float absMouseXBound = PI/4.0;
  static final float absMouseYBound = PI/4.0;
  
  static final boolean enableTransparency = false;
  
  // Constants for initialization
  static final String INIT_MOVE_STATUS = MovingStatus.S;
  static final int INIT_TURNVALUE = 0;
  static final int INIT_PPOSX = 1;
  static final int INIT_PPOSY = 1;
  static final int INIT_PPOSZ = 1;
  static final int INIT_FDIR = LookingStatus.POSX;
  static final int INIT_RDIR = LookingStatus.NEGZ;
  static final int INIT_UDIR = LookingStatus.POSY;
  static final int INIT_PDX = 0;
  static final int INIT_PDY = 0;
  static final int INIT_PDZ = 0;
  static final float INIT_CAMDX = 1;
  static final float INIT_CAMDY = 0;
  static final float INIT_CAMDZ = 0;
}
