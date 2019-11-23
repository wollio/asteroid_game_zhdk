public class StartState extends State {

  PFont pixelFont;
  Button b = new Button(new PVector(width/2, height/2), 200, 100, "restart");
  AudioPlayer song;
  BeatDetect beat;
  BeatListener bl;
  float cRadius;
  
  public StartState(PApplet context) {
    super("start", context);
    pixelFont = createFont("font-pixel.ttf",18);
    song = minim.loadFile("blade.mp3", 4096);
    song.play();
    beat = new BeatDetect(song.bufferSize(), song.sampleRate());
    beat.setSensitivity(300);
    // make a new beat listener, so that we won't miss any buffers for the analysis
    bl = new BeatListener(beat, song);
    this.setup();
  }
  
  public void setup() {
    
  }
  
  public void draw() {
    drawBackground();
    cam.beginHUD();
    //beat.detect(song.mix);
    // draw a green rectangle for every detect band
    // that had an onset this frame
    float rectW = width / beat.detectSize();
    for(int i = 0; i < beat.detectSize(); ++i)
    {
      // test one frequency band for an onset
      if ( beat.isOnset(i) )
      {
        fill(120,100,100);
        rect( i*rectW, 0, rectW, height);
      }
    }
    
    // draw an orange rectangle over the bands in 
    // the range we are querying
    int lowBand = 5;
    int highBand = 15;
    // at least this many bands must have an onset 
    // for isRange to return true
    int numberOfOnsetsThreshold = 4;
    if ( beat.isRange(lowBand, highBand, numberOfOnsetsThreshold) )
    {
      fill(30, 80, 100);
      rect(rectW*lowBand, 0, (highBand-lowBand)*rectW, height);
    }
      
      textFont(this.pixelFont);
      textAlign(CENTER, CENTER);
      text("you suck", width/2,-height/9);
      this.b.render();
    cam.endHUD();
  }
  
  public void mouseEvent(MouseEvent event) {
    if (b.isMouseHover(new PVector(event.getX(), event.getY()))) {
      b.bgColor = color(0, 100, 100);
    } else {
      b.bgColor = color(200, 100, 100);
    }
  
  }
  
  
}
