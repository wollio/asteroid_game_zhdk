class Projectile extends Element {
  
  ObjectGenerator3D og;
  color colour = color(50, 100, 100);
  public int projectileHeight = 1;
  public int projectileWidth = 1;
  public int projectileLenght = 100;
  
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
    //filter( BLUR, 6 );
    box(projectileWidth, projectileLenght, projectileHeight);
    //filter(null);
    //og.compass();
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
