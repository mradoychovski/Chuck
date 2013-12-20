// flute.ck
// Fusion

// Part of your composition goes here
Saxofony solo => JCRev rev => dac;
0.1 => rev.mix;
0.7 => solo.gain;

// sax make function
fun void saxMaker(int modeArr[], int root)
{
    // set Saxofony frequency and gain
    Std.mtof(modeArr[(root+4) % modeArr.cap()]+12) => solo.freq;
    0.8 => solo.gain;
}

// Ab_Aeolian mode array
[46, 48, 49, 51, 53, 54, 56, 58] @=> int Ab_aeolian[];

// Saxofony make function
fun void saxMaker(int modeArr[], int root)
{
    // set Saxofony frequency and gain
    Std.mtof(modeArr[(root+2) % modeArr.cap()]+12) => solo.freq;
    0.5 => solo.gain;
}

// set beat counter
0 => int counter;

// MAIN PROGRAMM
// Sound loop
while ( true )
{
    counter % 8 => int beat;
    
    if (Math.random2(1,3) > 1)
    {
        // Saxofony sound
        saxMaker(Ab_aeolian, Math.random2(0,Ab_aeolian.cap()-1));
        // Saxofony on
        Math.random2f(.2,.7) => solo.noteOn;
    }
    else
    {
        // Saxofony off
        Math.random2f(.2,.7) => solo.noteOff;
    }
    // advance time
    Math.random2(1,5)*(.625/2.0)::second => now;
    
    // increase beat counter
    counter++;
}