public class Spaceship {
 
  private ObjectGenerator3D og;
  private PVector position;
  private int size;
  
  public Spaceship(PVector position, int size) {
    this.position = position;
    this.size = size;
    this.og = new ObjectGenerator3D();
  }
  
  public void render(PVector positionSpaceship) {
    push();
    translate(positionSpaceship.x, position.y, positionSpaceship.z);
    og.compass();
    
    push();
    rotateX(PI/2);
    
    
      og.triangle(size / 3, size / 3, size);
      
      
        push();
          translate(0, 0, -size-size/3);
          rotateX(PI);
          og.triangle(size / 3, size / 3, size / 3);    
        
        pop();
    pop();
    
    pop();
    
    
    
  }
  
}
