// score.ck
// Fusion

// Add your composition files when you want them to come in

// set bass file
Machine.add(me.dir() + "/bass.ck") => int bassID;

5::second => now;

// set drums and piano files
Machine.add(me.dir() + "/drums.ck") => int drumID;
Machine.add(me.dir() + "/piano.ck") => int pianoID;

5::second => now;

// set sax file
Machine.add(me.dir() + "/sax.ck") => int saxID;

15::second => now;

//remove files
Machine.remove(drumID);
Machine.remove(bassID);
Machine.remove(saxID);
Machine.remove(pianoID);