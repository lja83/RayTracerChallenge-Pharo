"
I represent a vector
"
Class {
	#name : #RTCVector,
	#superclass : #RTCTuple,
	#category : #RayTracerChallenge
}

{ #category : #'instance creation' }
RTCVector class >> newZeroVector [
	^ self new x: 0; y: 0; z: 0.
]

{ #category : #arithmetic }
RTCVector >> cross: aRTCTuple [ 
	^ self class new
		x: (self y * aRTCTuple z) - (self z * aRTCTuple y);
		y: (self z * aRTCTuple x) - (self x * aRTCTuple z);
		z: (self x * aRTCTuple y) - (self y * aRTCTuple x).
]

{ #category : #arithmetic }
RTCVector >> dot: aRTCTuple [ 
	^ (self x * (aRTCTuple x)) + (self y * (aRTCTuple y)) + (self z * (aRTCTuple z)) + (self w * (aRTCTuple w)).
]

{ #category : #arithmetic }
RTCVector >> magnitude [
	^ self array squared sum sqrt.
]

{ #category : #arithmetic }
RTCVector >> normalized [

	^ self / (self magnitude).
]
