# EECS1710_Project4

Scriabin Monophonic Synthesizer

Use the number row keys as a full octave 13 note keyboard. There are 12 unique notes, and the top and bottom keys are an octave apart. The notes played produce an oscilloscope in the running window. The color of the waves in the oscilloscope correspond to the [Scriabin Chromesthesia Keyboard](https://en.wikipedia.org/wiki/Chromesthesia)

The keyboard produces discrete notes, but the vibrato function allows for frequencies in between piano notes. The oscilloscope will color those frequencies between notes on the Scriabin keyboard accurately. An original piecewise linear function was designed with 12 segments per color channel (36 total linear functions) to allow for smooth and generalized transitioning of colors between notes on the Scriabin keyboard. 

---
### Settings

Best performance is acheieved by not changing settings while holding note keys down. The following keys change the settings:

- 's': square wave, a brash tone with odd harmonics
- 'w': sawtooth wave, a rich tone with even harmonics
- 't': triangle wave, a smooth tone and pleasing tone with odd harmonics
- 'd': double oscillators with spacing, this produces a chorusing effect
- 's': single oscillator, returns to a single tone
- up: increase spacing between the two oscillators, increase the intensity of the chorusing effect, or transpose the second oscillator all the way to a different note and produce power chords or octaves.
- down: decrease the spacing between the two oscillators, decrease the intensity of the chorusing effect
- left: down an octave
- up: up an octave

---
### Vibrato 

While the left mouse button is clicked, a vibrato functionality will modulate the frequency of the synthesizer. Increasing the mouse X position (to the right of the screen) will increase the intensity of the vibrato, while increasing the mouse Y position will increase the speed of the vibrato. The top left corner is the most tame; the top right corner has big intense swoops, the bottom left corner has subtle but quick vibrato; and the bottom right corner makes the craziest sounds. The most musical section would be somewhere in the middle left of the screen. 