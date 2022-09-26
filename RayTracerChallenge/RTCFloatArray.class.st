"
I am the base class for RTCColor and RTCTuple and implement closeTo:precision: and enforce 4 dimensions
"
Class {
	#name : #RTCFloatArray,
	#superclass : #Object,
	#instVars : [
		'array'
	],
	#category : #RayTracerChallenge
}

{ #category : #'instance creation' }
RTCFloatArray class >> newFrom: anArray [
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"	
	
	| collection |
	collection := [ anArray array ]
		on: MessageNotUnderstood
		do: [ anArray ].
	^ self new array: (collection copy).
]

{ #category : #arithmetic }
RTCFloatArray >> * anObject [

	| rightSide |
	rightSide := [ anObject array ]
		on: MessageNotUnderstood
		do: [ anObject ].
	^ self class newFrom: (array * rightSide).
]

{ #category : #arithmetic }
RTCFloatArray >> + aRTCFloatArray [ 
	^ self class newFrom: (array + aRTCFloatArray array)
]

{ #category : #arithmetic }
RTCFloatArray >> - aRTCFloatArray [
	^ self class newFrom: (array - aRTCFloatArray array).
]

{ #category : #arithmetic }
RTCFloatArray >> / aNumber [ 
	^ self class newFrom: (array / aNumber)
]

{ #category : #comparing }
RTCFloatArray >> = aRTCFloatArray [

	^ array closeTo: aRTCFloatArray array.
]

{ #category : #accessing }
RTCFloatArray >> array [
	^ array
]

{ #category : #accessing }
RTCFloatArray >> array: aCollection [ 
	array := aCollection asFloatArray.
]

{ #category : #accessing }
RTCFloatArray >> at: aNumber [
	^ array at: aNumber.
]

{ #category : #accessing }
RTCFloatArray >> at: anIndex put: aNumber [
	^ array at: anIndex put: aNumber.
]

{ #category : #comparing }
RTCFloatArray >> closeTo: aCollection precision: aNumber [

	^ (1 to: self size) allSatisfy: [ :i | 
		  (self at: i) closeTo: (aCollection at: i) precision: aNumber ]
]

{ #category : #comparing }
RTCFloatArray >> hash [

	self shouldNotImplement.
]

{ #category : #arithmetic }
RTCFloatArray >> negated [
	^ self class newFrom: (array negated)
]

{ #category : #printing }
RTCFloatArray >> printOn: aStream [

	super printOn: aStream.
	array printElementsOn: aStream.
]

{ #category : #accessing }
RTCFloatArray >> size [
	^ array size.
]
