public class Asteroid {
  
  private PVector position;
  private PVector velocity;
  private float size;
  private color strokeColor;
  private boolean isExploding;
  private ParticleSystem particles;
  
  public Asteroid(PVector position, PVector velocity, int size) {
    this.position = position;
    this.velocity = velocity;
    this.size = size;
    this.strokeColor = color(0, 100, 0);
    this.particles = new ParticleSystem(this.position);
  }
  
  private void updateState() {
    this.position.add(this.velocity);
  }
  
  public void render() {
    push();
    translate(this.position.x, this.position.y, this.position.z);
    sphereDetail(8);
    this.particles.addParticle();
    //this.particles.run();
    sphere(size);
    this.updateState();
    pop();
  }
  
}
