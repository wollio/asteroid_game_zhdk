public class Spaceship {
 
  private ObjectGenerator3D og;
  private int x;
  private int y;
  private int z;
  private int size;
  
  public Spaceship(int x, int y, int z, int size) {
    this.x = x;
    this.y = y;  
    this.z = z;
    this.size = size;
    this.og = new ObjectGenerator3D();
  }
  
  public void render(PVector positionSpaceship) {
    push();
    
    translate(positionSpaceship.x, y, positionSpaceship.z);
    rotateZ(PI/2);
    rotateY(PI/2);
    
    og.triangle(size / 3, size / 3, size);
    og.compass();
    
    push();
      translate(0, 0, -size-size/3);
      rotateX(PI);
      og.triangle(size / 3, size / 3, size / 3);    
    
    pop();
    
    pop();
    
    
    
  }
  
}
