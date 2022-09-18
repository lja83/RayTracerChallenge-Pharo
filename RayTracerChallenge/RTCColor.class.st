"
I represent a color with alpha channel
"
Class {
	#name : #RTCColor,
	#superclass : #RTCFloatArray,
	#category : #RayTracerChallenge
}

{ #category : #'instance creation' }
RTCColor class >> fromColor: aColor [

	^ self new
		r: aColor red;
		g: aColor green;
		b: aColor blue.
]

{ #category : #'accessing - structure variables' }
RTCColor >> asColor [

	^ Color r: self r g: self g b: self b alpha: 1.0.
]

{ #category : #converting }
RTCColor >> asIntegerArray [

	^ { (self r * 255) rounded asInteger beBetween: 0 and: 255.
	    (self g * 255) rounded asInteger beBetween: 0 and: 255.
	    (self b * 255) rounded asInteger beBetween: 0 and: 255. }.
]

{ #category : #'accessing - structure variables' }
RTCColor >> b [

	^ array at: 3.
]

{ #category : #'accessing - structure variables' }
RTCColor >> b: aNumber [

	self at: 3 put: aNumber.
]

{ #category : #'accessing - structure variables' }
RTCColor >> g [

	^ array at: 2.
]

{ #category : #'accessing - structure variables' }
RTCColor >> g: aNumber [

	self at: 2 put: aNumber.
]

{ #category : #initialization }
RTCColor >> initialize [

	array := FloatArray ofSize: 3.
]

{ #category : #'accessing - structure variables' }
RTCColor >> r [

	^ array at: 1.
]

{ #category : #'accessing - structure variables' }
RTCColor >> r: aNumber [

	self at: 1 put: aNumber.
]
