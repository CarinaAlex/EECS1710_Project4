import processing.sound.*;
Ratios ratios;

Oscillator osc;
float note = 261.6256; // middle C on a piano
float playnote;
color waveform_color;

// vibrato parameters
float vibrato_amplitude=1, vibrato_freq = 1, max_vibrato_amplitude = 100,  max_vibrato_freq = 2, angle = 0;
boolean key_held = false;

void setup() {
  size(1080, 800);

  osc = new Oscillator(this);
  osc.stop();
  ratios = new Ratios();

}


void draw() {
  stroke(255);
  background(0);
  
  // if left mouse button is clicked, apply a frequency-modulated vibrato
  // the X value of the mouse location increases the amplitude (intensity) of the vibrato
  // the Y value of the mouse location increases the frequency (speed) of the vibrato
  if (mousePressed && (mouseButton == LEFT)){
    vibrato_amplitude = ((float)mouseX / (float)width) * max_vibrato_amplitude;
    vibrato_freq = ((float)mouseY / (float)width) * max_vibrato_freq;
    angle += 1 * vibrato_freq;
    if(angle >= 360) angle = 0;
    playnote += vibrato_amplitude * sin(angle);
    osc.freq(playnote);
  }
  
  // custom chromesthesia color function
  // returns a color continuously given any frequency and corresponds to Scriabin keyboard
  // any frequency in between piano notes can be given and a color in between keys will be returned
  waveform_color = ratios.get_color_from_freq(playnote);

  // plot audio waveform as an oscilloscope
  osc.plot_waveform(waveform_color);
}


void keyPressed(){
  
  // if the key pressed is the designed "keyboard" (number row) play an oscillator note
  // all 12 notes of the western note scale are playable
  if(osc.is_keyboard() && !key_held){
    key_held = true;
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
      
    osc.freq(playnote);
    osc.play();
  }
  
  // best performance if modes changed while not playing notes
  if(key == 'q') // change to square wave
    osc.square();
  else if(key == 'w') // change to sawtooth wave
    osc.sawtooth();
  else if(key == 't') // change to triangle wave
    osc.triangle();
  else if(key == 'd') // stack two oscillators together with separate frequencies (but spaced close together)
    osc.dubble();  
  else if(key == 's') // return to one oscillator again
    osc.single();
  else if((key == CODED) && (keyCode == UP)) // increase spacing between pairs of oscillators
    osc.spacing_inc();
  else if((key == CODED) && (keyCode == DOWN)) // decrease spacing between pairs of oscillators
    osc.spacing_dec();
  else if((key == CODED) && (keyCode == LEFT)) // up octave
    osc.octave_down();
  else if((key == CODED) && (keyCode == RIGHT)) // down octave
    osc.octave_up();

}


// when number row key is released, stop oscillator
void keyReleased(){
  if(osc.is_keyboard()){
    osc.stop();
    key_held = false;
  }
}
