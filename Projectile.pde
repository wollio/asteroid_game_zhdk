class Projectile {
  
  private PVector position;
  private PVector velocity;
  
  
  public Projectile(PVector position, PVector velocity) {
    this.position = position;
    this.velocity = velocity;
  }
  
  public void render() {
    push();
    translate(this.position.x, this.position.y, this.position.z);
    stroke(50, 100, 100);
    sphere(6);
    this.position.add(this.velocity);
    pop();
  }
  
  

}
