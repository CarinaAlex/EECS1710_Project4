import processing.sound.*;
Ratios ratios;
TriOsc sawtooth;
float note = 261.6256;
float playnote;
Waveform waveform;
int bands = 1080;
float[] spectrum = new float[bands];

void setup() {
  size(1080, 800);
  sawtooth = new TriOsc(this);
  sawtooth.stop();
  ratios = new Ratios();
  waveform = new Waveform(this, bands);
  waveform.input(sawtooth);
  //note = ;
 
}


void draw() {
  background(0);
  stroke(255);
  
  waveform.analyze();
  
  color waveform_color = ratios.get_color_from_freq(playnote);
  fill(waveform_color);
  beginShape();
  for(int i = 0; i < bands; i++)
  {
    vertex(
      map(i, 0, bands, 0, width),
      map(waveform.data[i], -1, 1, 0, height)
    );
  }
  endShape();

}


void keyPressed(){
  
  print(playnote);
  print(" ");
  print(ratios.freq_to_norm_note(playnote));
  print("\n");

  if(key == '`')
    playnote = note;
  else if(key == '1')
    playnote = ratios.m2*note;
  else if(key == '2')
    playnote = ratios.M2*note;
  else if(key == '3')
    playnote = ratios.m3*note;
  else if(key == '4')
    playnote = ratios.M3*note;
  else if(key == '5')
    playnote = ratios.p4*note;
  else if(key == '6')
    playnote = ratios.tt*note;
  else if(key == '7')
    playnote = ratios.p5*note;
  else if(key == '8')
    playnote = ratios.m6*note;
  else if(key == '9')
    playnote = ratios.M6*note;
  else if(key == '0')
    playnote = ratios.m7*note;
  else if(key == '-')
    playnote = ratios.M7*note;
  else if(key == '=')
    playnote = ratios.oct*note;
  
  sawtooth.freq(playnote);
  sawtooth.play();


}


void keyReleased(){
  sawtooth.stop();

}
