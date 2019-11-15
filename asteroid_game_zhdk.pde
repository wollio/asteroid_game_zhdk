import peasy.PeasyCam;
import de.voidplus.leapmotion.*;

PeasyCam cam;
LeapMotion leap;

float widthTerrain;
float heightTerrain;

Terrain terrain;
Spaceship spaceship;
ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();

ObjectGenerator3D og;

//gameengine --> logic and render function.

private PVector positionSpaceShip = new PVector(width, 0, 200);

public void setup() {
  fullScreen(P3D);
  pixelDensity(2);
  colorMode(HSB, 360, 100, 100);
  cam = new PeasyCam(this, 400);
  
  cam.setLeftDragHandler(null);
  cam.setRightDragHandler(null);
  cam.setCenterDragHandler(null);
  
  widthTerrain = width * 2;
  heightTerrain = height * 1.3;
  
  stroke(255);
  noFill();
  leap = new LeapMotion(this);
  og = new ObjectGenerator3D();
  terrain = new Terrain(new PVector(0,0,-200), (int) widthTerrain, (int) heightTerrain);
  spaceship = new Spaceship(new PVector(0, -500, 0), 200);
}

public void draw() {
  
  if (random(-10, 1) > 0) {
    int x = (int) random(0, 2000);
    int y = (int) random(100, 300);
    asteroids.add(new Asteroid(new PVector(x, y, 500), new PVector(random(-1, 1), random(2,20), -5), (int) random(10,30)));
  }
  
  if (leap.hasHands()) {
    Hand h = leap.getHands().get(0);
    positionSpaceShip.x = h.getPosition().x;
    positionSpaceShip.z = h.getPosition().z;
    println(mouseX);
  } else {
    positionSpaceShip.x = map(mouseX, 0, width, 0, widthTerrain);
    positionSpaceShip.z = map(mouseY, 0, height, height, -200);
  }
  
  background(230,70,50);
  
  rotateX(PI/2-0.3);
  
  translate(-width, -heightTerrain+150);
  
  terrain.render();
  spaceship.render(positionSpaceShip);
  
  for(int i = 0; i < asteroids.size(); i++) {
    asteroids.get(i).render();
    if (asteroids.get(i).position.z < -200) {
      asteroids.remove(asteroids.get(i));
    }
  }
  
  if (asteroids.size() > 100) {
    asteroids.remove(0);
  }
}
