Class {
	#name : #RTCTupleTest,
	#superclass : #TestCase,
	#category : #'RayTracerChallenge-Tests'
}

{ #category : #'tests - arithmetic' }
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

{ #category : #'tests - arithmetic' }
RTCTupleTest >> testCrossProductTwoVectors [

	| a b |
	a := RTCTuple newVector x: 1; y: 2; z: 3.
	b := RTCTuple newVector x: 2; y: 3; z: 4.
	self assert: (a cross: b) equals: (RTCTuple newVector x: -1; y: 2; z: -1).
	self assert: (b cross: a) equals: (RTCTuple newVector x: 1; y: -2; z: 1).
]

{ #category : #'tests - arithmetic' }
RTCTupleTest >> testDividingTupleByScalar [
	
	| a |
	a := RTCTuple new
		x: 1;
		y: -2;
		z: 3;
		w: -4.
	self assert: (a / 2) equals: (RTCTuple new x: 0.5; y: -1; z: 1.5; w: -2).
]

{ #category : #'tests - arithmetic' }
RTCTupleTest >> testDotProductTwoTuples [

	| a b |
	a := RTCTuple newVector x: 1; y: 2; z: 3.
	b := RTCTuple newVector x: 2; y: 3; z: 4.
	self assert: (a dot: b) equals: 20.
]

{ #category : #tests }
RTCTupleTest >> testMagnitudeofVector_0_0_1 [
			
	| v |
	v := RTCTuple newVector x: 0; y: 0; z: 1.
	self assert: v magnitude closeTo: 1.0.
]

{ #category : #tests }
RTCTupleTest >> testMagnitudeofVector_0_1_0 [
			
	| v |
	v := RTCTuple newVector x: 0; y: 1; z: 0.
	self assert: v magnitude closeTo: 1.0.
]

{ #category : #tests }
RTCTupleTest >> testMagnitudeofVector_1_0_0 [
			
	| v |
	v := RTCTuple newVector x: 1; y: 0; z: 0.
	self assert: v magnitude closeTo: 1.0.
]

{ #category : #tests }
RTCTupleTest >> testMagnitudeofVector_1_2_3 [
			
	| v |
	v := RTCTuple newVector x: 1; y: 2; z: 3.
	self assert: v magnitude closeTo: 14 sqrt.
]

{ #category : #tests }
RTCTupleTest >> testMagnitudeofVector_n1_n2_n3 [
			
	| v |
	v := RTCTuple newVector x: -1; y: -2; z: -3.
	self assert: v magnitude closeTo: 14 sqrt.
]

{ #category : #'tests - arithmetic' }
RTCTupleTest >> testMultiplyingTupleByAFraction [
	
	| a |
	a := RTCTuple new
		x: 1;
		y: -2;
		z: 3;
		w: -4.
	self assert: (a * 0.5) equals: (RTCTuple newVector x: 0.5; y: -1; z: 1.5; w: -2).
]

{ #category : #'tests - arithmetic' }
RTCTupleTest >> testMultiplyingTupleByScalar [
	
	| a |
	a := RTCTuple new
		x: 1;
		y: -2;
		z: 3;
		w: -4.
	self assert: (a * 3.5) equals: (RTCTuple newVector x: 3.5; y: -7; z: 10.5; w: -14).
]

{ #category : #'tests - arithmetic' }
RTCTupleTest >> testNegatingATuple [
	
	| a |
	a := RTCTuple new
		x: 1;
		y: -2;
		z: 3;
		w: -4.
	self assert: (a negated) equals: (RTCTuple newVector x: -1; y: 2; z: -3; w: 4).
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

{ #category : #'tests - arithmetic' }
RTCTupleTest >> testNormalizeVectorMagnitude [

	| v |
	v := RTCTuple newVector
		x: 1;
		y: 2;
		z: 3.
	self assert: v normalized magnitude equals: 1.
]

{ #category : #'tests - arithmetic' }
RTCTupleTest >> testNormalizeVector_1_2_3 [

	| v result |
	v := RTCTuple newVector
		x: 1;
		y: 2;
		z: 3.
	result := RTCTuple newVector
		x: 0.26726;
		y: 0.53452;
		z: 0.80178.
	self assert: v normalized equals: result.
]

{ #category : #'tests - arithmetic' }
RTCTupleTest >> testNormalizeVector_4_0_0 [

	| v |
	v := RTCTuple newVector
		x: 4;
		y: 0;
		z: 0.
	self assert: v normalized equals: (RTCTuple newVector x: 1; y: 0; z: 0).
]

{ #category : #'tests - arithmetic' }
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

{ #category : #'tests - arithmetic' }
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

{ #category : #'tests - arithmetic' }
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

{ #category : #'tests - arithmetic' }
RTCTupleTest >> testSubtractVectorFromZeroVector [
	
	| v |
	v := RTCTuple newVector
		x: 1;
		y: -2;
		z: 3.
	self assert: (RTCTuple newZeroVector - v) equals: (RTCTuple newVector x: -1; y: 2; z: -3).
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
