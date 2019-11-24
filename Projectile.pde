class Projectile extends Element {
  
  ObjectGenerator3D og;
  color colour;
  
  public Projectile(PVector position, PVector velocity) {
    super(position, velocity);
    this.og = new ObjectGenerator3D();
    this.colour = color(50, 100, 100);
    stroke(this.colour);
    this.shape = createShape(BOX, 4, 100, 4);
    
    //println(this.shape.getWidth(), this.shape.getHeight(), this.shape.getDepth());
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
    //filter( BLUR, 6 );
    shape(this.shape);
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
