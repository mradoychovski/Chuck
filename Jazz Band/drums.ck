// drums.ck
// Fusion

// Sound networks
Gain master => Pan2 p => dac;
SndBuf kick => master;
SndBuf hihat => master;
SndBuf snare => master;

//set master gain
.8 => master.gain;

//path to my directory
me.dir(-1) => string path;

// set files
path + "/audio/kick_01.wav" => kick.read;
path + "/audio/hihat_01.wav" => hihat.read;
path + "/audio/snare_01.wav" => snare.read;

// snare make function
fun void snareMaker()
{
    0 => snare.pos;
    Math.random2f(0.0,.4) => snare.rate;
}

// hihat make function
fun void hihatMaker()
{
    0 => hihat.pos;
    Math.random2f(.8,1.6) => snare.rate;
}
// set beat counter
0 => int counter;

//MAIN PROGRAMM
// infinite time loop
while(true)
{
    Math.random2(-1,1) => p.pan;
    counter % 8 => int beat;
    
    if (beat == 3 || beat == 7)
    {
        // snare sound
        snareMaker();
    }
    else if (beat == 0 || beat == 2 || beat == 4 || beat == 6)
    {
        // kick sound
        0 => kick.pos;  
    }
    // hihat sound
    hihatMaker();
    (.625/2.0)::second => now;
    counter++;
}