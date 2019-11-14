public class Asteroid {
  
  private PVector position;
  private PVector velocity;
  private float size;
  
  public Asteroid(PVector position, PVector velocity, int size) {
    this.position = position;
    this.velocity = velocity;
    this.size = size;
  }
  
  private void updateState() {
    this.position.add(this.velocity);
  }
  
  public void render() {
    push();
    translate(this.position.x, this.position.y, this.position.z);
    sphere(size);
    this.updateState();
    pop();
  }
  
  
  
}
