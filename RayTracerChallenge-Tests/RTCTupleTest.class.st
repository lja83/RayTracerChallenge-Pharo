Class {
	#name : #RTCTupleTest,
	#superclass : #TestCase,
	#category : #'RayTracerChallenge-Tests'
}

{ #category : #tests }
RTCTupleTest >> testAddTwoTuples [
	"Adding two tuples"
	
	| a1 a2 |
	a1 := RTCTuple new
		x: 3;
		y: -2;
		z: 5;
		w: 1.
	a2 := RTCTuple new
		x: -2;
		y: 3;
		z: 1;
		w: 0.
	self assert: (a1 + a2) equals: (RTCTuple new x: 1; y: 1; z: 6; w: 1).
]

{ #category : #tests }
RTCTupleTest >> testNewPoint [
	"A tuple with w = 1.0 is a point"
	
	| p p2 |
	p := RTCTuple newPoint
			x: 4.3;
			y: -4.2;
			z: 3.1.
	p2 := RTCTuple new
			x: 4.3;
			y: -4.2;
			z: 3.1;
			w: 1.0.
	self assert: p equals: p2
]

{ #category : #tests }
RTCTupleTest >> testNewVector [
	"A tuple with w = 1.0 is a point"
	
	| v v2 |
	v := RTCTuple newVector
			x: 4.3;
			y: -4.2;
			z: 3.1.
	v2 := RTCTuple new
			x: 4.3;
			y: -4.2;
			z: 3.1;
			w: 0.0.
	self assert: v equals: v2
]

{ #category : #tests }
RTCTupleTest >> testSubtractTwoPoints [
	
	| p1 p2 |
	p1 := RTCTuple newPoint
		x: 3;
		y: 2;
		z: 1.
	p2 := RTCTuple newPoint
		x: 5;
		y: 6;
		z: 7.
	self assert: (p1 - p2) equals: (RTCTuple newVector x: -2; y: -4; z: -6).
]

{ #category : #tests }
RTCTupleTest >> testSubtractTwoVectors [
	"Subtracing two vectors should produce a new vector"
	
	| v1 v2 |
	v1 := RTCTuple newVector
		x: 3;
		y: 2;
		z: 1.
	v2 := RTCTuple newVector
		x: 5;
		y: 6;
		z: 7.
	self assert: (v1 - v2) equals: (RTCTuple newVector x: -2; y: -4; z: -6).
]

{ #category : #tests }
RTCTupleTest >> testSubtractVectorFromPoint [
	"Subtracing a vector from a point should produce a new point"
	
	| p1 v2 |
	p1 := RTCTuple newPoint
		x: 3;
		y: 2;
		z: 1.
	v2 := RTCTuple newVector
		x: 5;
		y: 6;
		z: 7.
	self assert: (p1 - v2) equals: (RTCTuple newPoint x: -2; y: -4; z: -6).
]

{ #category : #tests }
RTCTupleTest >> testSubtractVectorFromZeroVector [
	
	| v |
	v := RTCTuple newVector
		x: 1;
		y: -2;
		z: 3.
	self assert: (v negated) equals: (RTCTuple newVector x: -1; y: 2; z: -3).
]

{ #category : #tests }
RTCTupleTest >> testTupleW0isVector [
	"A tuple with w = 0.0 is a vector"
	
	| a |
	a := RTCTuple new
			x: 4.3;
			y: -4.2;
			z: 3.1;
			w: 0.0.
	self assert: (a x) closeTo: 4.3.
	self assert: (a y) closeTo: -4.2.
	self assert: (a z) closeTo: 3.1.
	self assert: (a w) closeTo: 0.0.
	self assert: a point not.
	self assert: a vector.
]

{ #category : #tests }
RTCTupleTest >> testTupleW1isPoint [
	"A tuple with w = 1.0 is a point"
	
	| a |
	a := RTCTuple new
			x: 4.3;
			y: -4.2;
			z: 3.1;
			w: 1.0.
	self assert: (a x) closeTo: 4.3.
	self assert: (a y) closeTo: -4.2.
	self assert: (a z) closeTo: 3.1.
	self assert: (a w) closeTo: 1.0.
	self assert: a point.
	self assert: a vector not.
]
