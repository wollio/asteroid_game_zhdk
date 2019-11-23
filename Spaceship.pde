public class Spaceship extends Element {
 
  private PShape object;
  
  public Spaceship(PVector position) {
    super(position, null);
    this.object = loadShape("ufo.obj");
    this.shape = createShape(BOX, 70, 70, 15);
  }
  
  protected void updateState() {
  
  }
  
  public void updatePosition(float x, float y, float z) {
    this.position.x = x;
    this.position.y = y;
    this.position.z = z;
  }
  
  public void render() {
    push();
    translate(position.x, position.y, position.z);
    shape(this.shape);
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
