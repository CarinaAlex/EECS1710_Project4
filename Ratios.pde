class Ratios{
  
  // frequency ratios for all 12 notes in the western musical scale
  float m2 = 1.05946;
  float M2 = 1.12246;
  float m3 = 1.18921;
  float M3 = 1.25992;
  float p4 = 1.33484;
  float tt = 1.41421;
  float p5 = 1.49831;
  float m6 = 1.5874;
  float M6 = 1.68179;
  float m7 = 1.78179;
  float M7 = 1.88775;
  float oct = 2.0;
  
  // math constant
  float one_over_log_twelfth_root_2 = 39.8631371386;
  
  Ratios() {
  }
  
  
  int normalize_color(float base_freq, float play_freq){
    int int_base_freq = (int)base_freq;
    int int_play_freq = (int)play_freq;
    
    return (int)(((play_freq - base_freq) / base_freq) * 255);
  }
  
  // takes in frequency in Hertz and returns a normalized continuous note score between 0 and 12
  float freq_to_norm_note(float freq){
    float piano_key_approx = 12 * log2(freq / 440.0) + 46;
    return (piano_key_approx) % 12;
  }
  
  // log base 2
  float log2(float x) {
  return (log(x) / log(2));
  }
  
  // get Scriabin color from normalized note score
  color get_color_from_freq(float freq){
    float norm_note = freq_to_norm_note(freq);
    return color(map_norm_note_red_channel(norm_note), map_norm_note_green_channel(norm_note), map_norm_note_blue_channel(norm_note));
  }
  
  // Scriabin colors are generated using 12 unique piecewise linear functions (for all 3 channels, 36 total functions)
  // These functions take a normalized note score between 0 and 12 (floating point)
  // When the note score is a whole number, you get exact Scriabin colors
  // When the note scores are between whole numbers, you get transitional Scriabin colors
  // Scriabin color generator from normalized not value (float from 0 to 11.99) for red channel
  int map_norm_note_red_channel(float norm_note){
    int red_ch = 0;
    if((norm_note > 0) && (norm_note < 1)) red_ch = (int)(226 * norm_note) + 4;
    else if((norm_note > 1) && (norm_note < 2)) red_ch = (int)(-42 * norm_note) + 272;
    else if((norm_note > 2) && (norm_note < 3)) red_ch = (int)(57 * norm_note) + 70;
    else if((norm_note > 3) && (norm_note < 4)) red_ch = (int)(-151 * norm_note) + 700;
    else if((norm_note > 4) && (norm_note < 5)) red_ch = (int)(129 * norm_note) - 420;
    else if((norm_note > 5) && (norm_note < 6)) red_ch = (int)(-69 * norm_note) + 570;
    else if((norm_note > 6) && (norm_note < 7)) red_ch = (int)(-121 * norm_note) + 882;
    else if((norm_note > 7) && (norm_note < 8)) red_ch = (int)(207 * norm_note) - 1414;
    else if((norm_note > 8) && (norm_note < 9)) red_ch = (int)(-2 * norm_note) + 258;
    else if((norm_note > 9) && (norm_note < 10)) red_ch = (int)(-220 * norm_note) + 2220;
    else if((norm_note > 10) && (norm_note < 11)) red_ch = (int)(113 * norm_note) - 1110;
    else if((norm_note > 11) && (norm_note < 12)) red_ch = (int)(-129 * norm_note) + 1552;
    return red_ch;
  }
  
  // Scriabin color generator from normalized not value (float from 0 to 11.99) for green channel
  int map_norm_note_green_channel(float norm_note){
    int green_ch = 0;
    if((norm_note > 0) && (norm_note < 1)) green_ch = (int)(7 * norm_note) + 11;
    else if((norm_note > 1) && (norm_note < 2)) green_ch = (int)(132 * norm_note) - 114;
    else if((norm_note > 2) && (norm_note < 3)) green_ch = (int)(80 * norm_note) - 10;
    else if((norm_note > 3) && (norm_note < 4)) green_ch = (int)(-140 * norm_note) + 650;
    else if((norm_note > 4) && (norm_note < 5)) green_ch = (int)(150 * norm_note) - 510;
    else if((norm_note > 5) && (norm_note < 6)) green_ch = (int)(-209 * norm_note) + 1285;
    else if((norm_note > 6) && (norm_note < 7)) green_ch = (int)(201 * norm_note) - 1175;
    else if((norm_note > 7) && (norm_note < 8)) green_ch = (int)(-119 * norm_note) + 1065;
    else if((norm_note > 8) && (norm_note < 9)) green_ch = (int)(-87 * norm_note) + 809;
    else if((norm_note > 9) && (norm_note < 10)) green_ch = (int)(170 * norm_note) - 1504;
    else if((norm_note > 10) && (norm_note < 11)) green_ch = (int)(-63 * norm_note) + 826;
    else if((norm_note > 11) && (norm_note < 12)) green_ch = (int)(-122 * norm_note) + 1475;
    return green_ch;
  }
  
  // Scriabin color generator from normalized not value (float from 0 to 11.99) for blue channel
  int map_norm_note_blue_channel(float norm_note){
    int blue_ch = 0;
    if((norm_note > 0) && (norm_note < 1)) blue_ch = (int)(-183 * norm_note) + 201;
    else if((norm_note > 1) && (norm_note < 2)) blue_ch = (int)(199 * norm_note) - 181;
    else if((norm_note > 2) && (norm_note < 3)) blue_ch = (int)(-177 * norm_note) + 571;
    else if((norm_note > 3) && (norm_note < 4)) blue_ch = (int)(105 * norm_note) - 275;
    else if((norm_note > 4) && (norm_note < 5)) blue_ch = (int)(94 * norm_note) - 231;
    else if((norm_note > 5) && (norm_note < 6)) blue_ch = (int)(-225 * norm_note) + 1364;
    else if((norm_note > 6) && (norm_note < 7)) blue_ch = (int)(218 * norm_note) - 1294;
    else if((norm_note > 7) && (norm_note < 8)) blue_ch = (int)(-232 * norm_note) + 1856;
    else if((norm_note > 8) && (norm_note < 9)) blue_ch = (int)(236 * norm_note) - 1888;
    else if((norm_note > 9) && (norm_note < 10)) blue_ch = (int)(-199 * norm_note) + 2027;
    else if((norm_note > 10) && (norm_note < 11)) blue_ch = (int)(96 * norm_note) - 923;
    else if((norm_note > 11) && (norm_note < 12)) blue_ch = (int)(68 * norm_note) - 615;
    return blue_ch;
  }
  
  
  
}
