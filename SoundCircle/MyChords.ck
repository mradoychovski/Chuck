public class Chords
{
    Rhodey osc[3];
    osc[0] => JCRev r => Echo a => Echo b => Echo c => dac;
    osc[1] => r;
    osc[2] => r;
    0.02 => r.mix;
    
    fun void chordNotes(int root, int third, int fifth)
    {
        osc[0].freq(Std.mtof(root));
        osc[1].freq(Std.mtof(third));
        osc[2].freq(Std.mtof(fifth));
    }
    
    fun void chordFreq(float root, float third, float fifth)
    {
        osc[0].freq(root);
        osc[1].freq(third);
        osc[2].freq(fifth);
    }
    fun void play(dur length)
    {
        // set and play chords
        for (0 => int i; i < osc.cap(); i++)
        {
            Math.random2f(0.5,1.0) => osc[i].noteOn;
        }
        length => now;
    }
}

