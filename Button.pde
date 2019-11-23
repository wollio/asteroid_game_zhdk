class Button {

  PVector position;
  int h;
  int w;
  String text;
  color bgColor = color(25, 100, 100);
  color textColor = color(244, 100, 100);
  
  public Button(PVector position, int w, int h, String text) {
    this.position = position;
    this.w  = w;
    this.h = h;
    this.text = text;
  }
  
  public void render() {
    
    push();
    translate(this.position.x, this.position.y);
    rectMode(CENTER);
    fill(bgColor);
    rect(0,0,this.w, this.h);
    fill(textColor);
    textAlign(CENTER, CENTER);
    text(this.text, 0, 0);
    pop();
    
  }
  
  boolean isMouseHover(PVector mousePosition) {
    return mousePosition.x > this.position.x - w/2 && mousePosition.x < this.position.x + w/2 && mousePosition.y > this.position.y - h /2 && mousePosition.y < this.position.y + h/2;
  }

}
