"
I represent a color with alpha channel
"
Class {
	#name : #RTCColor,
	#superclass : #RTCFloatArray,
	#type : #words,
	#category : #RayTracerChallenge
}

{ #category : #'accessing - structure variables' }
RTCColor >> a [

	^ self at: 4.
]

{ #category : #'accessing - structure variables' }
RTCColor >> a: aNumber [

	self at: 4 put: aNumber.
]

{ #category : #'accessing - structure variables' }
RTCColor >> b [

	^ self at: 3.
]

{ #category : #'accessing - structure variables' }
RTCColor >> b: aNumber [

	self at: 3 put: aNumber.
]

{ #category : #'accessing - structure variables' }
RTCColor >> g [

	^ self at: 2.
]

{ #category : #'accessing - structure variables' }
RTCColor >> g: aNumber [

	self at: 2 put: aNumber.
]

{ #category : #'accessing - structure variables' }
RTCColor >> r [

	^ self at: 1.
]

{ #category : #'accessing - structure variables' }
RTCColor >> r: aNumber [

	self at: 1 put: aNumber.
]
