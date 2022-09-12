"
I am the base class for RTCColor and RTCTuple and implement closeTo:precision: and enforce 4 dimensions
"
Class {
	#name : #RTCFloatArray,
	#superclass : #FloatArray,
	#type : #words,
	#category : #RayTracerChallenge
}

{ #category : #comparing }
RTCFloatArray >> closeTo: aCollection precision: aNumber [

	^ (1 to: self size) allSatisfy: [ :i | 
		  (self at: i) closeTo: (aCollection at: i) precision: aNumber ]
]
