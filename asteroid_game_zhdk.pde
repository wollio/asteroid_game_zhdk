import peasy.PeasyCam;
import de.voidplus.leapmotion.*;

PeasyCam cam;
LeapMotion leap;

HashMap<String, State> states = new HashMap<String, State>();
String activeState = "game";

ObjectGenerator3D og;

//gameengine --> logic and render function.
//lerp
//millis for animations.

private PVector positionSpaceShip = new PVector(width, 0, 200);

public void setup() {
  
  //size(1200, 600, P3D);
  fullScreen(P3D);
  frameRate(25);
  //pixelDensity(2);
  colorMode(HSB, 360, 100, 100);
  cam = new PeasyCam(this, 400);
  
  cam.setLeftDragHandler(null);
  cam.setRightDragHandler(null);
  cam.setCenterDragHandler(null);
  
  this.states.put("game", new GameState(this));
  
  stroke(255);
  noFill();
  leap = new LeapMotion(this);
  og = new ObjectGenerator3D();
  hint(DISABLE_DEPTH_TEST);
}

public void draw() {
  this.states.get(this.activeState).draw();
  
  cam.beginHUD();
  fill(255);
  text(frameRate, 50, 50);
  cam.endHUD();
}
