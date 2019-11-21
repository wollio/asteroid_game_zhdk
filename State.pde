abstract class State {
  
  private String name;
  private PApplet context;
  
  public State(String name, PApplet context) {
    this.name = name;
    this.context = context;
    this.context.registerMethod("mouseEvent", this);
    this.setup();
  }
  
  abstract public void setup();
  
  abstract void draw();
  
  abstract void mouseEvent(MouseEvent event);
  
  public String getName() {
    return this.name;
  }


}
