// rhythm.ck
// DrumCircle

// Sound networks
Gain master => Pan2 p => dac;
SndBuf kick => master;
SndBuf hihat => master;
SndBuf snare => master;

//set master gain
0.6 => master.gain;

//path to my directory
me.dir(-1) => string path;

// set files
path + "/audio/kick_03.wav" => kick.read;
path + "/audio/hihat_01.wav" => hihat.read;
path + "/audio/snare_03.wav" => snare.read;

BPM tempo;
tempo.tempo(60000.0/625);


// snare make function
fun void snareMaker()
{
    while (true)
    {
        Math.random2(-1,1) => p.pan;
        tempo.sixteenthNote => dur sixteenth;
        for (0 => int beat; beat < 8; beat++)
        {
            if (beat == 3)
            {
                0 => snare.pos;
                0.4 => snare.rate;
            }
            sixteenth => now;
        }
    }
}

// hihat make function
fun void hihatMaker()
{
    while (true)
    {
        Math.random2(-1,1) => p.pan;
        tempo.eighthNote => dur eighth;
        for (0 => int beat; beat < 8; beat++)
        {
            if (beat == 1 || beat == 5 || beat == 7)
            {
                0 => hihat.pos;
                Math.random2f(.8,1.4) => hihat.rate;
            }
            eighth => now;
        }
    }
}

spork ~ snareMaker();
spork ~ hihatMaker();


//MAIN PROGRAMM
// infinite time loop
while(true)
{
    Math.random2(-1,1) => p.pan;
    tempo.eighthNote => dur eighth;
    for (0 => int beat; beat < 8; beat++)
    {
        if (beat == 0 || beat == 2 || beat == 4 || beat == 6)
        {
            // kick sound
            0 => kick.pos;
        }
        eighth => now;
    }
}