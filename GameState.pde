public class GameState extends State {
  
  float widthTerrain;
  float heightTerrain;
  
  Terrain terrain;
  Spaceship spaceship;
  private ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();
  private ArrayList<Projectile> projectiles = new ArrayList();
  
  public GameState(PApplet context) {
    super("game", context);
    
    widthTerrain = width * 2;
    heightTerrain = height * 1.3;
    
    terrain = new Terrain(new PVector(0,0,-200), (int) widthTerrain, (int) heightTerrain);
    spaceship = new Spaceship(new PVector(0, 1200, 0));
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
      asteroids.add(new Asteroid(new PVector(x, -300, z), new PVector(random(-3, 3), random(20,50), 0), (int) random(10,50)));
    }
    
    spaceship.updatePosition(map(mouseX, 0, width, 0, widthTerrain), spaceship.getPosition().y, map(mouseY, 0, height, 400, -200));
    /*if (leap.hasHands()) {
      Hand h = leap.getHands().get(0);
      positionSpaceShip.x = h.getPosition().x;
      positionSpaceShip.z = h.getPosition().z;
      println(mouseX);
    } else {
      
    }*/
    
    background(230,70,10);
    
    rotateX(PI/2-0.3);
    rotateX(radians(map(mouseY, 0, height, -5, 5)));
    rotateY(radians(map(mouseX, 0, width, -5, 5)));
    
    translate(-width, -heightTerrain+150);
    
    lights();
    //terrain.render();
    spaceship.render();
    
    for(int i = 0; i < asteroids.size(); i++) {
      asteroids.get(i).draw();
    }
    
    for (int i = 0; i < this.projectiles.size(); i++) {
      this.projectiles.get(i).render();
    }
    
    this.collisionDetecting();
    
    for(int i = 0; i < this.asteroids.size(); i++) {
      if(this.asteroids.get(i).delete) {
        this.asteroids.remove(this.asteroids.get(i));
      };
    }
    
    for (int i = 0; i < this.projectiles.size(); i++) {
       if(this.projectiles.get(i).delete) {
          this.projectiles.remove(this.projectiles.get(i));
        };
    }
  }
  
  private void collisionDetecting() {
    Projectile p;
    Asteroid a;
    for (int i = 0; i < this.projectiles.size(); i++) {
      for (int j = 0; j < this.asteroids.size(); j++) {
        p = this.projectiles.get(i);
        a = this.asteroids.get(j);
        if (boxSphereCollision(a, p)) {
          p.delete = true;
          a.delete = true;
        }
      
      }
    }
  }
  
  private float distancePVector(PVector pv1, PVector pv2) {
    return dist(pv1.x, pv1.y, pv1.z, pv2.x, pv2.y, pv2.z);
  }
  
  private boolean boxSphereCollision(Asteroid a, Projectile p) {
  // get box closest point to sphere center by clamping
  float x = Math.max(p.position.x - p.projectileWidth / 2, Math.min(a.position.x, p.position.x + p.projectileWidth / 2));
  float y = Math.max(p.position.y - p.projectileLenght / 2, Math.min(a.position.y, p.position.y + p.projectileLenght / 2));
  float z = Math.max(p.position.z - p.projectileHeight / 2, Math.min(a.position.z, p.position.z + p.projectileHeight / 2));

  // this is the same as isPointInsideSphere
  double distance = Math.sqrt((x - a.position.x) * (x - a.position.x) +
                           (y - a.position.y) * (y - a.position.y) +
                           (z - a.position.z) * (z - a.position.z));
  
  return distance < a.size;
  }

}
