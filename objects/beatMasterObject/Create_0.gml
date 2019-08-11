/// @description The beatMasterObject keeps track of all things relating to the music and only
///				 the music. You can "listen" for onBeat and onBeatWindow events within
///				 other objects to see if the music is exactly on a beat or within the beat
///				 window, respectively.

/*
 * Setup the globals that others can listen for
 */
onExactBeat = false;
onBeatWindow = false;
onBeatWindowBegin = false;
onBeatWindowEnd = false;

millisecondsSinceStart = 0;

/*
 * Music configuration
 */
 
// The jukebox stores the individual songs
var jukebox = ds_map_create();

// Individual songs contain references to the sound asset and BPM
var metranome60BPS = ds_map_create();
metranome60BPS[? "name"] = metranome60BPMSound;
metranome60BPS[? "bpm"] = 60;

var metranome120BPS = ds_map_create();
metranome120BPS[? "name"] = metranome120BPMSound;
metranome120BPS[? "bpm"] = 120;

var bulletMouse = ds_map_create();
bulletMouse[? "name"] = music120BPMSound;
bulletMouse[? "bpm"] = 120;

var rockitRocket = ds_map_create();
rockitRocket[? "name"] = rockitRocketSound;
rockitRocket[? "bpm"] = 160;

// Put all the songs in the jukebox
jukebox[? "metranome60BPS"] = metranome60BPS;
jukebox[? "metranome120BPS"] = metranome120BPS;
jukebox[? "bulletMouse"] = bulletMouse;
jukebox[? "rockitRocket"] = rockitRocket;

// Play one!
var song = jukebox[? "rockitRocket"];
var MILLISECONDS_PER_MINUTE = 60000000;
var PERCENTAGE_WINDOW = .25;
millisecondsPerBeat = MILLISECONDS_PER_MINUTE / song[? "bpm"];
windowBeginMilliseconds = millisecondsPerBeat * (1 - PERCENTAGE_WINDOW);
windowEndMilliseconds = millisecondsPerBeat * PERCENTAGE_WINDOW;
audio_play_sound(song[? "name"], 10, true);