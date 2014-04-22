// chords.ck

Chords s;
BPM tempo;
tempo.tempo(60000.0/625);


[48, 50, 52, 53, 55, 57, 59, 60] @=> int C[];
while (true)
{
    tempo.quarterNote => dur quarter;
    for (0 => int beat; beat < 8; beat++)
    {
        // freq
        Math.random2(0, C.cap()-1) => int note;
        s.chordNotes(C[note]-12, C[(note+2)%C.cap()]-12, C[(note+4)%C.cap()]-12);
    }
    s.play(quarter*(Math.random2(1,2)*2));
}
