Class {
	#name : #RTCCanvasTest,
	#superclass : #TestCase,
	#category : #'RayTracerChallenge-Tests'
}

{ #category : #tests }
RTCCanvasTest >> testCreateCanvas [
			
	| c black |
	c := RTCCanvas rows: 20 columns: 10.
	self assert: c width equals: 10.
	self assert: c height equals: 20.
	black := RTCColor newFrom: { 0. 0. 0. }.
	1 to: c height do: [ :y |
		1 to: c width do: [ :x |
			self assert: (c at: y at: x) closeTo: black ] ]
]

{ #category : #tests }
RTCCanvasTest >> testWritePixel [

	| c red |
	c := RTCCanvas rows: 20 columns: 10.
	red := RTCColor newFrom: { 1. 0. 0 }.
	c at: 2@3 put: red.
	c at: 0@0 put: red.
	c at: 9@19 put: red.
	self assert: (c at: 2@3) closeTo: red.
	self assert: (c at: 0@0) closeTo: red.
	self assert: (c at: 9@19) closeTo: red.
]
