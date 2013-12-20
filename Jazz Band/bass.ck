// bass.ck
// Fusion


// patch
Mandolin bass => PRCRev r => dac;
.05 => r.mix;

// Ab_Aeolian mode array
[46, 48, 49, 51, 53, 54, 56, 58] @=> int Ab_aeolian[];

// infinite time loop
while( true )
{
    // freq
    Math.random2( 0, Ab_aeolian.cap()-1) => int winner;
    Std.mtof( Ab_aeolian[winner]-12 ) => bass.freq;

    // pluck!
    Math.random2f( 0.4, 0.9 ) => bass.noteOn;

    // advance time
    // note: Math.randomf() returns value between 0 and 1
    (Math.random2(1,2)*(.625/2.0))::second => now;
}