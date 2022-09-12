Class {
	#name : #RTCCanvasTest,
	#superclass : #TestCase,
	#category : #'RayTracerChallenge-Tests'
}

{ #category : #tests }
RTCCanvasTest >> testAsForm [

	| c f |
	c := RTCCanvas rows: 20 columns: 10.
	f := c asForm.
	self assert: (f colorAt: 0@0) equals: Color black.
]

{ #category : #tests }
RTCCanvasTest >> testCanvasToPPM [

	| c c1 c2 c3 ppm header lines |
	c := RTCCanvas rows: 3 columns: 5.
	c1 := RTCColor newFrom: { 1.5. 0. 0. }.
	c2 := RTCColor newFrom: { 0. 0.5. 0. }.
	c3 := RTCColor newFrom: { -0.5. 0. 1. }.
	c
		at: 0@0 put: c1;
		at: 2@1 put: c2;
		at: 4@2 put: c3.
	ppm := c asPPM.
	header := { 'P3'. '5 3'. '255' }.
	lines := { '255 0 0 0 0 0 0 0 0 0 0 0 0 0 0'.
	           '0 0 0 0 0 0 0 128 0 0 0 0 0 0 0'.
	           '0 0 0 0 0 0 0 0 0 0 0 0 0 0 255'. }.
	self assert: (ppm lines first: 3) equals: header.
	self assert: (ppm lines allButFirst: 3) equals: lines.
]

{ #category : #tests }
RTCCanvasTest >> testCanvasToPPMHeader [

	| c ppm lines |
	c := RTCCanvas rows: 3 columns: 5.
	ppm := c asPPM.
	lines := { 'P3'. '5 3'. '255'. }.
	self assert: (ppm lines first: 3) equals: lines.
]

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
RTCCanvasTest >> testPPMEndsWithNewline [

	| c ppm |
	c := RTCCanvas rows: 3 columns: 5.
	ppm := c asPPM.
	self assert: ppm last equals: Character lf.
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
