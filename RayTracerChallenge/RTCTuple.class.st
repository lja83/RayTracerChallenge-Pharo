"
I am a tuple of numbers representing either an RTCPoint or an RTCVector.
"
Class {
	#name : #RTCTuple,
	#superclass : #RTCFloatArray,
	#category : #RayTracerChallenge
}

{ #category : #'instance creation' }
RTCTuple class >> newFrom: aCollection [

	| collection |
	collection := FloatArray ofSize: 4.
	1 to: 4 do: [ :i|
		(aCollection size >= i)
			ifTrue: [collection at: i put: (aCollection at: i)]
			ifFalse: [ collection at: i put: 0. ].
	].
	^ super newFrom: collection.
]

{ #category : #arithmetic }
RTCTuple >> - aPoint [

	| r |
	r := super - aPoint.
	(r w closeTo: 0)
		ifTrue: [ ^ RTCVector newFrom: r ].
	(r w closeTo: 1)
		ifTrue: [ ^ RTCPoint newFrom: r ].
	^ self class newFrom: r.
]

{ #category : #initialization }
RTCTuple >> initialize [
	
	super initialize.
	array := FloatArray newFrom: { 0. 0. 0. 0. }.
]

{ #category : #accessing }
RTCTuple >> point [
	^ self w closeTo: 1.
]

{ #category : #accessing }
RTCTuple >> vector [
	^ self w closeTo: 0.
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
