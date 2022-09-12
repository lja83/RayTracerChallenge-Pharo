"
I am the base class for RTCColor and RTCTuple and implement closeTo:precision: and enforce 4 dimensions
"
Class {
	#name : #RTCFloatArray,
	#superclass : #FloatArray,
	#type : #words,
	#category : #RayTracerChallenge
}

{ #category : #'instance creation' }
RTCFloatArray class >> new [

	^ self newFrom: { 0. 0. 0. 0. }
]

{ #category : #'instance creation' }
RTCFloatArray class >> newFrom: aCollection [

	| collection |
	collection := self ofSize: 4.
	1 to: 4 do: [ :i|
		(aCollection size >= i)
			ifTrue: [collection at: i put: (aCollection at: i)]
			ifFalse: [ collection at: i put: 0. ].
	].
	^ collection.
]

{ #category : #comparing }
RTCFloatArray >> closeTo: aCollection precision: aNumber [

	^ (1 to: self size) allSatisfy: [ :i | 
		  (self at: i) closeTo: (aCollection at: i) precision: aNumber ]
]
