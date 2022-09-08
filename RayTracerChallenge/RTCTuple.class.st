"
I am a tuple of numbers representing either an RTCPoint or an RTCVector.
"
Class {
	#name : #RTCTuple,
	#superclass : #Object,
	#instVars : [
		'x',
		'y',
		'z',
		'w'
	],
	#category : #RayTracerChallenge
}

{ #category : #'instance creation' }
RTCTuple class >> newPoint [
			
	^ self new w: 1.0
]

{ #category : #'instance creation' }
RTCTuple class >> newVector [
			
	^ self new w: 0.0
]

{ #category : #'instance creation' }
RTCTuple class >> newZeroVector [
	^ self newVector x: 0; y: 0; z: 0.
]

{ #category : #arithmetic }
RTCTuple >> * aNumber [ 
	^ self class new
		x: x * aNumber;
		y: y * aNumber;
		z: z * aNumber;
		w: w * aNumber.
]

{ #category : #arithmetic }
RTCTuple >> + aRTCTuple [ 
	^ self class new
		x: x + aRTCTuple x;
		y: y + aRTCTuple y;
		z: z + aRTCTuple z;
		w: w + aRTCTuple w.
]

{ #category : #arithmetic }
RTCTuple >> - aRTCTuple [ 
	^ self class new
		x: x - aRTCTuple x;
		y: y - aRTCTuple y;
		z: z - aRTCTuple z;
		w: w - aRTCTuple w.
]

{ #category : #arithmetic }
RTCTuple >> / aNumber [ 
	^ self class new
		x: x / aNumber;
		y: y / aNumber;
		z: z / aNumber;
		w: w / aNumber.
]

{ #category : #comparing }
RTCTuple >> = aRTCTuple [ 
	^ (x =~ aRTCTuple x) & (y =~ aRTCTuple y) & (z =~ aRTCTuple z) & (w =~ aRTCTuple w). 
]

{ #category : #comparing }
RTCTuple >> =~ aRTCTuple [ 
	^ (x =~ aRTCTuple x) & (y =~ aRTCTuple y) & (z =~ aRTCTuple z) & (w =~ aRTCTuple w). 
]

{ #category : #arithmetic }
RTCTuple >> magnitude [
	^ ((x squared) + (y squared) + (z squared) + (w squared)) sqrt.
]

{ #category : #arithmetic }
RTCTuple >> negated [
	^ self class new x: x negated; y: y negated; z: z negated; w: w negated.
]

{ #category : #arithmetic }
RTCTuple >> normalized [

	| magnitude |
	magnitude := self magnitude.
	^ self class new
		x: x / magnitude;
		y: y / magnitude;
		z: z / magnitude;
		w: w / magnitude.
]

{ #category : #accessing }
RTCTuple >> point [
	^ w closeTo: 1.0
]

{ #category : #accessing }
RTCTuple >> vector [
	^ w closeTo: 0.0
]

{ #category : #accessing }
RTCTuple >> w [
	^ w
]

{ #category : #'accessing - structure variables' }
RTCTuple >> w: aNumber [ 
	w := aNumber.
]

{ #category : #accessing }
RTCTuple >> x [
	^ x
]

{ #category : #'accessing - structure variables' }
RTCTuple >> x: aNumber [ 
	x := aNumber.
]

{ #category : #accessing }
RTCTuple >> y [
	^ y
]

{ #category : #'accessing - structure variables' }
RTCTuple >> y: aNumber [ 
	y := aNumber.
]

{ #category : #accessing }
RTCTuple >> z [
	^ z
]

{ #category : #'accessing - structure variables' }
RTCTuple >> z: aNumber [ 
	z := aNumber.
]
