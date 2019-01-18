public class SimEnv {
  Sim sim;
  Camera cam;
  
  public SimEnv() {
    sim = new Sim();
    cam = new Camera();
  }
  
  public void refresh() {
    background(0);
  }
  
  public void setBasicSettings() {
    background(0);
    frameRate(SimConsts.framesRate);
    rectMode(CENTER);
  }
}
