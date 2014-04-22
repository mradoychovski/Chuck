// mandolin.ck
// DrumCircle

// patch
Mandolin mandolin => JCRev r => dac;
.05 => r.mix;

BPM tempo;
tempo.tempo(60000.0/625);

// Ab_Aeolian mode array
[48, 50, 52, 53, 55, 57, 59, 60] @=> int C[];

// infinite time loop
while( true )
{
    tempo.sixteenthNote => dur sixteenth;
    for (0 => int beat; beat < 8; beat++)
    {
        // freq
        Math.random2( 0, C.cap()-1) => int winner;
        Std.mtof( C[winner] ) => mandolin.freq;

        // pluck!
        Math.random2f( 0.4, 0.9 ) => mandolin.noteOn;
    }

    // advance time
    // note: Math.randomf() returns value between 0 and 1
    Math.random2(1,2)*sixteenth => now;
}