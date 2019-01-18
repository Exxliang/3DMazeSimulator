SimEnv simEnv;

void setup() {
  size(900,900,P3D);
  smooth(SimConsts.smoothAmount);
  simEnv = new SimEnv();
  simEnv.setBasicSettings();
  simEnv.sim.initMaze();
  simEnv.sim.createMaze();
  simEnv.sim.openMaze();
  utilities.calcDispBoundaries();
}

void draw() {
  simEnv.refresh();
  simEnv.cam.updateCamera();
  simEnv.cam.mapMouse();
  simEnv.sim.drawMaze();
  simEnv.sim.drawMarkers();
  if (playerVars.movingStatus != MovingStatus.S) {
    simEnv.sim.applyMotionUpdate();
  }
  simEnv.cam.fLook();
}

void keyPressed() {
  if (playerVars.movingStatus == MovingStatus.S) {
    simEnv.sim.handleAction(key);
  }
}
