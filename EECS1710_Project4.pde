import processing.sound.*;
Ratios ratios;
SawOsc sawtooth;
float note = 440;
FFT fft;
int bands = 512;
float[] spectrum = new float[bands];

void setup() {
  size(1080, 800);
  sawtooth = new SawOsc(this);
  ratios = new Ratios();
  fft = new FFT(this, bands);
  fft.input(sawtooth);
 
}


void draw() {
  background(155);
  stroke(0);
  
  fft.analyze(spectrum);
  
  for(int i = 0; i < bands; i++){
    // The result of the FFT is normalized
    // draw the line for frequency band i scaling it up by 5 to get more amplitude.
    line( i, height, i, height - spectrum[i]*height*5 );
    }

}


void keyPressed(){
  
  sawtooth.play();
  if(key == '`')
    sawtooth.freq(note);
  else if(key == '1')
    sawtooth.freq(ratios.m2*note);
  else if(key == '2')
    sawtooth.freq(ratios.M2*note);
  else if(key == '3')
    sawtooth.freq(ratios.m3*note);
  else if(key == '4')
    sawtooth.freq(ratios.M3*note);
  else if(key == '5')
    sawtooth.freq(ratios.p4*note);
  else if(key == '6')
    sawtooth.freq(ratios.tt*note);
  else if(key == '7')
    sawtooth.freq(ratios.p5*note);
  else if(key == '8')
    sawtooth.freq(ratios.m6*note);
  else if(key == '9')
    sawtooth.freq(ratios.M6*note);
  else if(key == '0')
    sawtooth.freq(ratios.m7*note);
  else if(key == '-')
    sawtooth.freq(ratios.M7*note);
  else if(key == '=')
    sawtooth.freq(ratios.oct*note);


}


void keyReleased(){
  sawtooth.stop();

}
