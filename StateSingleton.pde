static class StateSingleton {
 
  private static StateSingleton inst;
  private static PApplet p;
  private String state = "end";
  private int score;
 
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
  
  public int getScore() {
    return this.score;
  }
  
  public void setScore(int score) {
    this.score = score;
  }
 
}
