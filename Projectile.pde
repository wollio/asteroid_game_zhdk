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
    /*beginShape();
    vertex(this.position.x, this.position.y, this.position.z);
    this.position.add(this.velocity);
    vertex(this.position.x, this.position.y, this.position.z);
    endShape();*/
    sphere(30);
    pop();
  }
  
  

}
