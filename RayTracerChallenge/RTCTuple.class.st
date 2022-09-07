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

{ #category : #comparing }
RTCTuple >> =~ aRTCTuple [ 
	^ (x =~ aRTCTuple x) & (y =~ aRTCTuple y) & (z =~ aRTCTuple z) & (w =~ aRTCTuple w). 
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
