public class Spaceship {
 
  private ObjectGenerator3D og;
  private PVector position;
  private int size;
  private PShape object;
  
  public Spaceship(PVector position, int size) {
    this.position = position;
    this.size = size;
    this.og = new ObjectGenerator3D();
    this.object = loadShape("ufo.obj");
  }
  
  public void render() {
    push();
    translate(position.x, position.y, position.z);
    rotateX(PI/2);
    lights();
    scale(0.1);
    /*og.compass();
    push();
    rotateX(PI/2);
      fill(0, 100, 100);
      og.triangle(size / 3, size / 3, size);
        push();
          translate(0, 0, -size-size/3);
          rotateX(PI);
          og.triangle(size / 3, size / 3, size / 3);    
        
        pop();
    pop();
    noFill();*/
    shape(this.object, 0, 0);
    pop();
  }
  
}
