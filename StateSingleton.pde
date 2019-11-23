static class StateSingleton {
 
  private static StateSingleton inst;
  private static PApplet p;
  public String state = "start";
 
  private StateSingleton() {
  } 
 
  static StateSingleton getInstance(PApplet papp) { 
    if (inst == null) {
      inst = new StateSingleton();
      p = papp;
    }
    return inst;
  }
  
  public void updateState(String name) {
    this.state = name;
  }
 
}
