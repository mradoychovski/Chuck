// clarinet.ck
// CrumCircle

// Part of your composition goes here
Clarinet solo => JCRev rev => dac;
0.1 => rev.mix;
1 => solo.gain;

// Clarinet make function
fun void clarinetMaker(int modeArr[], int root)
{
    // set Clarinet frequency and gain
    Std.mtof(modeArr[(root+4) % modeArr.cap()]+24) => solo.freq;
    0.8 => solo.gain;
}

// Ab_Aeolian mode array
[48, 50, 52, 53, 55, 57, 59, 60] @=> int C[];

BPM tempo;
tempo.tempo(60000.0/625);
// MAIN PROGRAMM
// Sound loop
while ( true )
{
    tempo.sixteenthNote => dur sixteenth;
    for (0 => int beat; beat < 8; beat++)
    {
        if (Math.random2(1,3) > 1)
        {
            // Clarinet sound
            clarinetMaker(C, Math.random2(0, C.cap()-1));
            // Clarinet on
            Math.random2f(.2,.7) => solo.noteOn;
        }
        else
        {
            // Clarinet off
            Math.random2f(.2,.7) => solo.noteOff;
        }
        // advance time
        Math.random2(1,3)*sixteenth => now;
    }
}