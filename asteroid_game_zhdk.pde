import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import peasy.PeasyCam;
import de.voidplus.leapmotion.*;

PeasyCam cam;
LeapMotion leap;

HashMap<String, State> states = new HashMap<String, State>();
String activeState = "start";

ObjectGenerator3D og;
Minim minim;

//gameengine --> logic and render function.
//lerp
//millis for animations.

public void setup() {
  
  //size(1200, 600, P3D);
  fullScreen(P3D);
  frameRate(25);
  pixelDensity(2);
  colorMode(HSB, 360, 100, 100);
  cam = new PeasyCam(this, 400);
  minim = new Minim (this);
  
  cam.setLeftDragHandler(null);
  cam.setRightDragHandler(null);
  cam.setCenterDragHandler(null);
  //cam.setWheelHandler(null);
  
  this.states.put("game", new GameState(this, minim));
  this.states.put("start", new StartState(this));
  
  stroke(255);
  noFill();
  leap = new LeapMotion(this);
  og = new ObjectGenerator3D();
  hint(DISABLE_DEPTH_TEST);
}

public void draw() {
  this.states.get(((State) this.states.values().toArray()[0]).getCurrentState()).draw();
  
  cam.beginHUD();
  fill(255);
  text(frameRate, 50, 50);
  cam.endHUD();
}

public void stop() {
  minim.stop();
  super.stop();
}
