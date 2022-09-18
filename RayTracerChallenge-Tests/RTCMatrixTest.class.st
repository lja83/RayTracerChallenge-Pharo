Class {
	#name : #RTCMatrixTest,
	#superclass : #TestCase,
	#category : #'RayTracerChallenge-Tests'
}

{ #category : #tests }
RTCMatrixTest >> testConstructing4x4Matrix [

	| m |
	m := RTCMatrix rows: 4 columns: 4.
	m data: { 1.     2.    3.    4.
	          5.5.   6.5.  7.5.  8.5.
	          9.     10.   11.   12.
	          13.5.  14.5. 15.5. 16.5. }.
	self assert: (m at: 0@0) closeTo: 1.
	self assert: (m at: 0@3) closeTo: 4.
	self assert: (m at: 1@0) closeTo: 5.5.
	self assert: (m at: 1@2) closeTo: 7.5.
	self assert: (m at: 2@2) closeTo: 11.
	self assert: (m at: 3@0) closeTo: 13.5.
	self assert: (m at: 3@2) closeTo: 15.5.
]
