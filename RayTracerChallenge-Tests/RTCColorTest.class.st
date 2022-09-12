Class {
	#name : #RTCColorTest,
	#superclass : #TestCase,
	#category : #'RayTracerChallenge-Tests'
}

{ #category : #tests }
RTCColorTest >> testAddColors [

	| c1 c2 |
	c1 := RTCColor new r: 0.9; g: 0.6; b: 0.75; a: 1.0.
	c2 := RTCColor new r: 0.7; g: 0.1; b: 0.25; a: 1.0.
	self assert: (c1 + c2) closeTo: (RTCColor new r: 1.6; g: 0.7; b: 1.0; a: 2.0).
]

{ #category : #tests }
RTCColorTest >> testMultiplyColorByColor [

	| c1 c2 |
	c1 := RTCColor newFrom: { 1.0. 0.2. 0.4. 0.5. }.
	c2 := RTCColor newFrom: { 0.9. 1.0. 0.1. 0.01. }.
	self assert: (c1 * c2) closeTo: (RTCColor newFrom: { 0.9. 0.2. 0.04. 0.005 }).
]

{ #category : #tests }
RTCColorTest >> testMultiplyColorByScalar [

	| c |
	c := RTCColor newFrom: { 0.2. 0.3. 0.4. 1.0. }.
	self assert: (c * 2) closeTo: (RTCColor newFrom: { 0.4. 0.6. 0.8. 2.0. }).
]

{ #category : #tests }
RTCColorTest >> testSubtractColors [

	| c1 c2 |
	c1 := RTCColor new r: 0.9; g: 0.6; b: 0.75; a: 1.0.
	c2 := RTCColor new r: 0.7; g: 0.1; b: 0.25; a: 1.0.
	self assert: (c1 - c2) closeTo: (RTCColor new r: 0.2; g: 0.5; b: 0.5; a: 0.0).
]
