public class Marker {
  float Mx, My, Mz;
  float SMx, SMy, SMz;
  boolean inRange;
  
  Marker(float x, float y, float z) {
    Mx = x;
    My = y;
    Mz = z;
    SMx = 2 * SimConsts.SCALE * Mx;
    SMy = 2 * SimConsts.SCALE * My;
    SMz = 2 * SimConsts.SCALE * Mz;
    inRange = true;
  }
  
  void displayMarker(){
    stroke(75, 206, 219);
    noFill();
    translate(SMx, SMy, SMz);
    sphere(SimConsts.SCALE / 4.0);
    translate(-SMx, -SMy, -SMz);
  }
}
