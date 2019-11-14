public class ObjectGenerator3D {

  private ObjectGenerator3D() {}
  
  public void compass() {
    //sphere
    stroke(0, 0, 100);
    sphereDetail(8);
    sphere(3);
    
    //x-axis - red
    stroke(0, 100, 100);
    line(0, 0, 0, 100, 0, 0);
    
    //y-axis - green
    stroke(120, 100, 100);
    line(0, 0, 0, 0, 100, 0);
    
    //z-axis - blue
    stroke(240, 100, 100);
    line(0, 0, 0, 0, 0, 100);
  }
  
  public void triangle(int width1, int width2, int h) {
    push();
    translate(-width1/2,-width2/2,-h);
    //base
    rect(0,0,width1,width2);
    beginShape();
    vertex(0, 0, 0);
    vertex(width1/2, width2/2, h);
    vertex(width1, 0, 0);
    endShape();
    beginShape();
    vertex(width1, 0, 0);
    vertex(width1/2, width2/2, h);
    vertex(width1, width2, 0);
    endShape();
    beginShape();
    vertex(0, width2, 0);
    vertex(width1/2, width2/2, h);
    vertex(width1, width2, 0);
    endShape();
    beginShape();
    vertex(0, width2, 0);
    vertex(width1/2, width2/2, h);
    vertex(0, 0, 0);
    endShape();
    pop();
  }
  
}
