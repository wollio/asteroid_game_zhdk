public class EndState extends State {

  PFont pixelFont;
  Button b = new Button(new PVector(width/2 + 110, height/2), 200, 100, "restart");
  Button saveResult = new Button(new PVector(width/2 - 110, height /2), 200, 100, "save result");
  AudioPlayer song;
  BeatDetect beat;
  BeatListener bl;
  float cRadius;
  color c;
  Table table;
  String file = "highscores.csv";
  String playerName = "";
  
  public EndState(PApplet context) {
    super("end", context);
    pixelFont = createFont("font-pixel.ttf",18);
    this.table = loadTable(file, "header");
  }
  
  public void setup() {
    
  }
  
  public void draw() {
    drawBackground(color(0,0,0));
    cam.beginHUD();      
      textFont(this.pixelFont);
      textAlign(CENTER, CENTER);
      textSize(32);
      text("game over", width/2, height/2 - 200);
      text(this.getCurrentScore(), width/2, height/2 -150);
      textSize(18);
      this.b.render();
      this.saveResult.render();
    cam.endHUD();
  }
  
  public void mouseEvent(MouseEvent event) {
    if (b.isMouseHover(new PVector(event.getX(), event.getY()))) {
      b.bgColor = color(230, 100, 100);
      b.textColor = color(0, 100, 100);
      if (event.getAction() == MouseEvent.CLICK) {
        this.setCurrentState("game");
      }
    } else {
      b.textColor = color(200, 100, 100);
    }
  }
  
  private void saveScore(int score, String name) {
    if (table == null) {
      table = new Table();
      table.addColumn("Score");
      table.addColumn("Name");
      saveTable(table, file);
    }
    TableRow newRow = table.addRow();
    newRow.setString("Name", name);
    newRow.setInt("Score", score);
    saveTable(table, "data/"+file);
  }
  
  
  
}
