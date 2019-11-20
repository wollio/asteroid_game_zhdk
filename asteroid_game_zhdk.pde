import peasy.PeasyCam;
import de.voidplus.leapmotion.*;

PeasyCam cam;
LeapMotion leap;

float widthTerrain;
float heightTerrain;

Terrain terrain;
Spaceship spaceship;
ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();
private ArrayList<Projectile> projectiles = new ArrayList();

ObjectGenerator3D og;

//gameengine --> logic and render function.
//lerp
//millis for animations.

private PVector positionSpaceShip = new PVector(width, 0, 200);

public void setup() {
  
  fullScreen(P3D);
  //fullScreen(P3D);
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
  spaceship = new Spaceship(new PVector(0, 1200, 0), 200);
}

public void draw() {
  
  if (random(-1, 1) > 0) {
    int x = (int) random(widthTerrain / 2 - 500, widthTerrain / 2 + 500);
    int z = (int) random(-100, 200);
    asteroids.add(new Asteroid(new PVector(x, -300, z), new PVector(random(-3, 3), random(20,100), 0), (int) random(10,50)));
  }
  
  if (leap.hasHands()) {
    Hand h = leap.getHands().get(0);
    positionSpaceShip.x = h.getPosition().x;
    positionSpaceShip.z = h.getPosition().z;
    println(mouseX);
  } else {
    spaceship.position.x = map(mouseX, 0, width, 0, widthTerrain);
    spaceship.position.z = map(mouseY, 0, height, 400, -200);
  }
  
  background(230,70,50);
  
  rotateX(PI/2-0.3);
  rotateX(radians(map(mouseY, 0, height, -5, 5)));
  rotateY(radians(map(mouseX, 0, width, -5, 5)));
  
  translate(-width, -heightTerrain+150);
  
  lights();
  terrain.render();
  spaceship.render();
  
  for(int i = 0; i < asteroids.size(); i++) {
    asteroids.get(i).render();
    if (asteroids.get(i).position.y > heightTerrain + 200) {
      asteroids.remove(asteroids.get(i));
    }
  }
  
  for (int i = 0; i < this.projectiles.size(); i++) {
    this.projectiles.get(i).render();
  }
  
  if (asteroids.size() > 100) {
    asteroids.remove(0);
  }
}

void mouseClicked() {
  this.projectiles.add(new Projectile(this.spaceship.position.copy(), new PVector(0, -60, 0)));
}
