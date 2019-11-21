class Projectile extends Element {
  
  ObjectGenerator3D og;
  color colour = color(50, 100, 100);
  public int projectileHeight = 5;
  public int projectileWidth = 5;
  public int projectileLenght = 300;
  
  public Projectile(PVector position, PVector velocity) {
    super(position, velocity);
    this.og = new ObjectGenerator3D();
  }
  
  protected void updateState() {
    if (this.position.y <= -1000) {
      this.delete = true;
    }
    this.position.add(this.velocity);  
  }
  
  public void render() {
    push();
    translate(this.position.x, this.position.y, this.position.z);
    stroke(colour);
    box(projectileWidth, projectileLenght, projectileHeight);
    og.compass();
    this.updateState();
    pop();
  }
  
  public PVector getPosition() {
    return this.position;
  }
  
  public float getSize() {
    return 6;
  }

}
