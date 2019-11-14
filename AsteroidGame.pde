import peasy.PeasyCam;
import de.voidplus.leapmotion.*;


PeasyCam cam;
LeapMotion leap;

Terrain terrain;
Spaceship spaceship;
ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();

ObjectGenerator3D og;

private PVector positionSpaceShip = new PVector(width, height-300, 200);

public void setup() {
  size(1000, 800, P3D);
  pixelDensity(2);
  colorMode(HSB, 360, 100, 100);
  cam = new PeasyCam(this, 400);
  stroke(255);
  noFill();
  leap = new LeapMotion(this);
  og = new ObjectGenerator3D();
  terrain = new Terrain(width, height);
  spaceship = new Spaceship(width,height-300, 200,200);
}

public void draw() {
  
  if (random(-10, 1) > 0) {
    int x = (int) random(0, 2000);
    int y = (int) random(100, 300);
    asteroids.add(new Asteroid(new PVector(x, 0, y), new PVector(random(-1, 1), random(2,4), 0), 20));
  }
  
  if (leap.hasHands()) {
    Hand h = leap.getHands().get(0);
    positionSpaceShip.x = mouseX;
    positionSpaceShip.z = mouseY;
    println(mouseX);
  }
  
  background(0);
  
  rotateX(PI/2-0.3);
  translate(-width, -height*1.3);
  
  push();
    terrain.render();
    og.compass();
  pop();
  
  push();
    spaceship.render(positionSpaceShip);
  pop();
  
  for(Asteroid a : asteroids) {
    a.render();
  }
  
  if (asteroids.size() > 100) {
    asteroids.remove(0);
  }
}
