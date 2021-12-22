class Oscillator{

  // This class acts as a pair of oscillators with changeable waveforms, much like an analog monophonic synthesizer
  // All Processing Sound library abstractions are encapsulated within this class to allow it to behave as a single oscillator to the main sketch.  

  SqrOsc sqr1;
  SqrOsc sqr2;
  SawOsc saw1;
  SawOsc saw2;
  TriOsc tri1;
  TriOsc tri2;
  
  Waveform wav1;
  Waveform wav2;
  Waveform wav3;
  Waveform wav4;
  Waveform wav5;
  Waveform wav6;
  
  Delay d1;
  Delay d2;
  float time = 1;
  float feedback = 0.7;
  boolean delay = false;
  
  float freq = 440;
  int samples = 1000;
  float[] wave = new float[samples];
  float octave = 1;  
  String active = "square";
  boolean dubble = false;
  float spacing = 1.02;
  boolean playing = false;
  
  
  Oscillator(PApplet p) {
    sqr1 = new SqrOsc(p);
    sqr2 = new SqrOsc(p);
    saw1 = new SawOsc(p);
    saw2 = new SawOsc(p);
    tri1 = new TriOsc(p);
    tri2 = new TriOsc(p);
    
    sqr1.freq(freq);
    sqr2.freq(0);
    saw1.freq(freq);
    saw2.freq(0);
    tri1.freq(freq);
    tri2.freq(0);
    
    wav1 = new Waveform(p, samples);
    wav2 = new Waveform(p, samples);
    wav3 = new Waveform(p, samples);
    wav4 = new Waveform(p, samples);
    wav5 = new Waveform(p, samples);
    wav6 = new Waveform(p, samples);
    
    wav1.input(sqr1);
    wav2.input(sqr2);
    wav3.input(saw1);
    wav4.input(saw2);
    wav5.input(tri1);
    wav6.input(tri2);
    
    d1 = new Delay(p);
    d2 = new Delay(p);
    d1.feedback(feedback);
    d2.feedback(feedback);
  }
  
  void play(){
    switch(active) {
      case "square": 
        sqr1.play();
        sqr2.play();
        saw1.stop();
        saw2.stop();
        tri1.stop();
        tri2.stop();
        break;
      case "sawtooth": 
        sqr1.stop();
        sqr2.stop();
        saw1.play();
        saw2.play();
        tri1.stop();
        tri2.stop();
        break;
      case "triangle": 
        sqr1.stop();
        sqr2.stop();
        saw1.stop();
        saw2.stop();
        tri1.play();
        tri2.play();
        break;
    }
    playing = true;
  }
  
  void stop(){
    sqr1.stop();
    sqr2.stop();
    saw1.stop();
    saw2.stop();
    tri1.stop();
    tri2.stop();
    playing = false;
  }
  
  void square(){
    active = "square";
    if(playing) play();
    if(delay) delay_on();
  }
  
  void sawtooth(){
    active = "sawtooth";
    if(playing) play();
    if(delay) delay_on();
  }
  
  void triangle(){
    active = "triangle";
    if(playing) play();
    if(delay) delay_on();
  }
  
  void single(){
    sqr2.freq(0);
    saw2.freq(0);
    tri2.freq(0);
    dubble = false;
  }
  
  void dubble(){
    sqr2.freq(freq * spacing);
    saw2.freq(freq * spacing);
    tri2.freq(freq * spacing);
    dubble = true;
  }
  
  void freq(float _freq){
    freq = _freq * octave;
    sqr1.freq(freq);
    saw1.freq(freq);
    tri1.freq(freq);
    
    if(dubble) dubble();
  }
  
  void spacing_inc(){
    spacing += 0.005;
  }
  
  void spacing_dec(){
    spacing -= 0.005;
  }

  void analyze(){
    wav1.analyze();
    wav2.analyze();
    wav3.analyze();
    wav4.analyze();
    wav5.analyze();
    wav6.analyze();
  }
  
  void plot_waveform(color c){
    analyze();
    
    fill(c);
    beginShape();
    for(int i = 0; i < samples; i++)
    {
      vertex(
        map(i, 0, samples, 0, width),
        map((wav1.data[i] + wav2.data[i] + wav3.data[i] + wav4.data[i] + wav5.data[i] + wav6.data[i]) / 6, -1, 1, 0, height)
      );
    }
    endShape();
  }
  
  boolean is_keyboard(){ 
    return (key == '`') || (key == '1') || (key == '2') || (key == '3') || (key == '4') || (key == '5') || (key == '6') || (key == '7') || (key == '8') || (key == '9') || (key == '0') || (key == '-') || (key == '=');
  }
 
   
  void delay_on(){
    switch(active) {
      case "square": 
        d1.process(sqr1, 5);
        d2.process(sqr2, 5);
        break;
      case "sawtooth": 
        d1.process(saw1, 5);
        d2.process(saw2, 5);
        break;
      case "triangle": 
        d1.process(tri1, 5);
        d2.process(tri2, 5);
        break;
    }
    delay = true;
  }
  
  void delay_off(){
    d1.stop();
    d2.stop();
    delay = false;
  }
  
  void delay_time(float _time){
    time = _time;
    d1.time(time);
    d2.time(time);
  }
  
  void octave_down(){
    octave /= 2;
    freq(freq);
  }
  
  void octave_up(){
    octave *= 2;
    freq(freq);
    freq(freq * 2);
  }
}
