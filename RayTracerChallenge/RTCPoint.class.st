"
I represent a point.
"
Class {
	#name : #RTCPoint,
	#superclass : #RTCTuple,
	#category : #RayTracerChallenge
}

{ #category : #initialization }
RTCPoint >> initialize [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	
	super initialize.
	self w: 1.0.
]
