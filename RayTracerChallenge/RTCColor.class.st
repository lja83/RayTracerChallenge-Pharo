"
I represent a color with alpha channel
"
Class {
	#name : #RTCColor,
	#superclass : #RTCFloatArray,
	#type : #words,
	#category : #RayTracerChallenge
}

{ #category : #'instance creation' }
RTCColor class >> fromColor: aColor [

	^ self new
		r: aColor red;
		g: aColor green;
		b: aColor blue.
]

{ #category : #'instance creation' }
RTCColor class >> new [

	^ self newFrom: { 0. 0. 0. }
]

{ #category : #'accessing - structure variables' }
RTCColor >> asColor [

	^ Color r: self r g: self g b: self b alpha: 1.0.
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
