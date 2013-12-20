// piano.ck
// Fusion

// patch
Rhodey piano[4];

//set array elements to dac
for (0 => int i;i < piano.cap(); i++)
{
    if (i == 0)
    {
        piano[i] => dac.left;
    }
    else if (i == piano.cap()-1)
    {
        piano[i] => dac.right;
    }
    else
    {
        piano[i] => dac;
    }
}

// chord 2D array
[[46,49,53,56], [51,54,58,60], [48,51,53,56]] @=> int chords[][];

//MAIN PROGRAMM
// infinite time loop
while(true){
    // set and play chords
    for (0 => int i; i < 4; i++)
    {
        Std.mtof(chords[0][i]) => piano[i].freq;
        Math.random2f(0.5,1.0) => piano[i].noteOn;
    }
    for (0 => int i; i < 4; i++)
    {
        Std.mtof(chords[2][i]) => piano[i].freq;
        Math.random2f(0.5,1.0) => piano[i].noteOn;
    }
    for (0 => int i; i < 4; i++)
    {
        Std.mtof(chords[1][i]) => piano[i].freq;
        Math.random2f(0.5,1.0) => piano[i].noteOn;
    }
    // advance time
    (Math.random2(1,2)*0.625)::second => now;
}