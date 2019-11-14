public class Terrain {
  
  int cols = 10;
  int rows = 10;
  int scl = 15;
  
  float[][] terrain;
  float flyingVal = 0;
  float flyingSpeed = 0.005;
  
  public Terrain(int w, int h) {
    cols = w / scl;
    rows = h / scl;
    terrain = new float[cols][rows];
  }
  
  private void calculateTerrain() {
    flyingVal -= flyingSpeed;
    float yoff = flyingVal;
    for (int y = 0; y < rows; y++) {
      float xoff = 0;
      for (int x = 0; x < cols; x++) {
          terrain[x][y] = map(noise(xoff,yoff), 0, 1, -50, 50);
          xoff += 0.1;
      }
      yoff += 0.1;
    }
  
  }
  
  public void render() {
    this.calculateTerrain();
    for (int y = 0; y < rows-1; y++) {
      beginShape(TRIANGLE_STRIP);
        for (int x = 0; x < cols; x++) {
        vertex(x*scl, y*scl, terrain[x][y]);
        vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
  
      }
      endShape();
    }
    
  }
}
