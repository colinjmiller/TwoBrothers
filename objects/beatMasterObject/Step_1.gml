/// @description All the beat-related events rely on these values being set correctly
///              during their step events, so we calculate them when each step begins
///              so they're guarenteed to be correct when objects access them.

// Exact beats last a frame; set them to false if it was true the last frame
if (onExactBeat) { onExactBeat = false; }
if (onBeatWindowBegin) { onBeatWindowBegin = false; }
if (onBeatWindowEnd) { onBeatWindowEnd = false; }

// Establish variables necessary for calculating beat events
var previousMillisecondsTime = millisecondsSinceStart;
var currentMillisecondsTime = previousMillisecondsTime + delta_time;
millisecondsSinceStart = previousMillisecondsTime + delta_time;
var currentDurationInBeat = currentMillisecondsTime % millisecondsPerBeat;
var previousDurationInBeat = previousMillisecondsTime % millisecondsPerBeat;

/*
We check for exact beats by comparing the current duration in the beat to the
previous duration in the beat. Generally, these will be something like
> currentDurationInBeat = 100,000ms
> previousDurationInBeat = 90,000ms
And this clearly shows 10,000ms have elapsed between steps.
Since these are _durations_ in the current beat, sometimes we'll see
> currentDurationInBeat = 5,000ms
> previousDurationInBeat = 495,000ms
Which shows we've begun a new beat. This is when we trigger the exact beat event.
*/
if (currentDurationInBeat < previousDurationInBeat) {
	onExactBeat = true;
}

if (previousDurationInBeat < windowBeginMilliseconds &&
	currentDurationInBeat >= windowBeginMilliseconds) {
	onBeatWindowBegin = true;
}

if (previousDurationInBeat <= windowEndMilliseconds &&
	currentDurationInBeat > windowEndMilliseconds) {
	onBeatWindowEnd = true;
}

if (currentDurationInBeat >= windowBeginMilliseconds ||
	currentDurationInBeat < windowEndMilliseconds) {
	onBeatWindow = true;		
} else {
	onBeatWindow = false;
}

millisecondsSinceStart = currentMillisecondsTime;