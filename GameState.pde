public class GameState extends State {
  
  float widthTerrain;
  float heightTerrain;
  
  Terrain terrain;
  Spaceship spaceship;
  ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();
  private ArrayList<Projectile> projectiles = new ArrayList();
  
  public GameState(PApplet context) {
    super("game", context);
    
    widthTerrain = width * 2;
    heightTerrain = height * 1.3;
    
    terrain = new Terrain(new PVector(0,0,-200), (int) widthTerrain, (int) heightTerrain);
    spaceship = new Spaceship(new PVector(0, 1200, 0), 200);
  }

  public void setup() {
  
  }
  
  void mouseEvent(MouseEvent event) {
    if (event.getAction() == MouseEvent.CLICK) {
      this.projectiles.add(new Projectile(this.spaceship.position.copy(), new PVector(0, -60, 0)));
    }
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
  
  private void collisionDetecting() {
    for (int i = 0; i < this.projectiles.size(); i++) {
      for (int j = 0; j < this.asteroids.size(); j++) {
        float distancePVector = distancePVector(this.projectiles.get(i).getPosition(), this.asteroids.get(i).getPosition());
        if (distancePVector < this.projectiles.get(i).getSize() + this.asteroids.get(j).getSize()) {
          println("collision");
        }
      
      }
    }
  
  }
  
  private float distancePVector(PVector pv1, PVector pv2) {
    return dist(pv1.x, pv1.y, pv1.z, pv2.x, pv2.y, pv2.z);
  
  }

}
