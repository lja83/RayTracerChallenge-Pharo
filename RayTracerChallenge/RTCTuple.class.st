"
I am a tuple of numbers representing either an RTCPoint or an RTCVector.
"
Class {
	#name : #RTCTuple,
	#superclass : #RTCFloatArray,
	#type : #words,
	#category : #RayTracerChallenge
}

{ #category : #'instance creation' }
RTCTuple class >> new [

	^ self newFrom: { 0. 0. 0. 0. }
]

{ #category : #'instance creation' }
RTCTuple class >> newFrom: aCollection [

	| collection |
	collection := self ofSize: 4.
	1 to: 4 do: [ :i|
		(aCollection size >= i)
			ifTrue: [collection at: i put: (aCollection at: i)]
			ifFalse: [ collection at: i put: 0. ].
	].
	^ collection.
]

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
RTCTuple >> cross: aRTCTuple [ 
	^ self class newVector
		x: (self y * aRTCTuple z) - (self z * aRTCTuple y);
		y: (self z * aRTCTuple x) - (self x * aRTCTuple z);
		z: (self x * aRTCTuple y) - (self y * aRTCTuple x).
]

{ #category : #arithmetic }
RTCTuple >> dot: aRTCTuple [ 
	^ (self x * (aRTCTuple x)) + (self y * (aRTCTuple y)) + (self z * (aRTCTuple z)) + (self w * (aRTCTuple w)).
]

{ #category : #arithmetic }
RTCTuple >> magnitude [
	^ self squared sum sqrt.
]

{ #category : #arithmetic }
RTCTuple >> normalized [

	^ self / (self magnitude).
]

{ #category : #accessing }
RTCTuple >> point [
	^ self w closeTo: 1.0
]

{ #category : #accessing }
RTCTuple >> vector [
	^ self w closeTo: 0.0
]

{ #category : #accessing }
RTCTuple >> w [
	^ self at: 4.
]

{ #category : #'accessing - structure variables' }
RTCTuple >> w: aNumber [ 
	self at: 4 put: aNumber.
]

{ #category : #accessing }
RTCTuple >> x [
	^ self at: 1.
]

{ #category : #'accessing - structure variables' }
RTCTuple >> x: aNumber [ 
	self at: 1 put: aNumber.
]

{ #category : #accessing }
RTCTuple >> y [
	^ self at: 2.
]

{ #category : #'accessing - structure variables' }
RTCTuple >> y: aNumber [ 
	self at: 2 put: aNumber.
]

{ #category : #accessing }
RTCTuple >> z [
	^ self at: 3.
]

{ #category : #'accessing - structure variables' }
RTCTuple >> z: aNumber [ 
	self at: 3 put: aNumber.
]
