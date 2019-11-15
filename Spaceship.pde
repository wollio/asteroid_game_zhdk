public class Spaceship {
 
  private ObjectGenerator3D og;
  private PVector position;
  private int size;
  private ArrayList<Projectile> projectiles = new ArrayList();
  
  public Spaceship(PVector position, int size) {
    this.position = position;
    this.size = size;
    this.og = new ObjectGenerator3D();
  }
  
  public void render() {
    push();
    translate(position.x, position.y, position.z);
    og.compass();
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
    for (int i = 0; i < this.projectiles.size(); i++) {
      this.projectiles.get(i).render();
    }
    noFill();
    pop();
  }
  
  public void shoot() {
    this.projectiles.add(new Projectile(new PVector(0,0,0), new PVector(0, 30, 0)));
  }
  
}
