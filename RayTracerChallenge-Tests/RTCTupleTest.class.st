Class {
	#name : #RTCTupleTest,
	#superclass : #TestCase,
	#category : #'RayTracerChallenge-Tests'
}

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
	self assert: p =~ p2
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
	self assert: v =~ v2
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
