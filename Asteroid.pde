public class Asteroid {
  
  private PVector position;
  private PVector velocity;
  private float size;
  private color strokeColor;
  private boolean isExploding;
  private ParticleSystem particles;
  private PImage texture = loadImage("earth.jpg");
  private PShape sphere;
  
  public Asteroid(PVector position, PVector velocity, int size) {
    this.position = position;
    this.velocity = velocity;
    this.size = size;
    this.strokeColor = color(0, 100, 0);
    this.particles = new ParticleSystem(this.position);
    this.sphere = createShape(SPHERE, size);
    this.sphere.setTexture(this.texture);
    this.sphere.setFill(false);
    this.sphere.setStroke(false);
  }
  
  private void updateState() {
    this.position.add(this.velocity);
  }
  
  public void render() {
    push();
    translate(this.position.x, this.position.y, this.position.z);
    sphereDetail(12);
    //
    this.sphere.setFill(false);
    this.sphere.setStroke(false);
    //this.particles.addParticle();
    //this.particles.run();
    shape(this.sphere);
    this.updateState();
    noFill();
    pop();
  }
  
}
