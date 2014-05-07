// score.ck
// DrumCircle

// Add your composition files when you want them to come in
// set bass file
Machine.add(me.dir() + "/mandolin.ck") => int manID;

5::second => now;

// set drums and piano files
Machine.add(me.dir() + "/rhythm.ck") => int drumID;
Machine.add(me.dir() + "/chords.ck") => int pianoID;

// set clarinet file
Machine.add(me.dir() + "/clarinet.ck") => int clarID;

20::second => now;

//remove files
//Machine.remove(drumID);
Machine.remove(clarID);
//Machine.remove(pianoID);

for (0 => int i; i < 5; i++)
{
    Math.random2(2,5)::second => now;

    // set drums and piano files
    //Machine.add(me.dir() + "/rhythm.ck") => drumID;
    //Machine.add(me.dir() + "/chords.ck") => pianoID;

    // set clarinet file
    Machine.add(me.dir() + "/clarinet.ck") => clarID;

    22::second => now;

    //remove files
    //Machine.remove(drumID);
    Machine.remove(clarID);
    //Machine.remove(pianoID);
}
Machine.remove(drumID);
Machine.remove(pianoID);

5::second => now;
Machine.remove(manID);

