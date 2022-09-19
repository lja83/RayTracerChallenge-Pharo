Class {
	#name : #RTCMatrixTest,
	#superclass : #TestCase,
	#category : #'RayTracerChallenge-Tests'
}

{ #category : #tests }
RTCMatrixTest >> testConstructing2x2Matrix [

	| m |
	m := RTCMatrix rows: 2 columns: 2.
	m data: { -3.  5.
	           1. -2. }.
	self assert: (m at: 0@0) closeTo: -3.
	self assert: (m at: 0@1) closeTo: 5.
	self assert: (m at: 1@0) closeTo: 1.
	self assert: (m at: 1@1) closeTo: -2.
]

{ #category : #tests }
RTCMatrixTest >> testConstructing3x3Matrix [

	| m |
	m := RTCMatrix rows: 3 columns: 3.
	m data: { -3.  5.  0.
	           1. -2. -7.
	           0.  1.  1. }.
	self assert: (m at: 0@0) closeTo: -3.
	self assert: (m at: 0@1) closeTo: 5.
	self assert: (m at: 0@2) closeTo: 0.
	self assert: (m at: 1@0) closeTo: 1.
	self assert: (m at: 1@1) closeTo: -2.
	self assert: (m at: 1@2) closeTo: -7.
	self assert: (m at: 2@0) closeTo: 0.
	self assert: (m at: 2@1) closeTo: 1.
	self assert: (m at: 2@2) closeTo: 1.
]

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

{ #category : #tests }
RTCMatrixTest >> testMatrixEquality [

	| m1 m2 |
	m1 := (RTCMatrix rows: 4 columns: 4)
		data: { 1. 2. 3. 4.
		        5. 6. 7. 8.
		        9. 8. 7. 6.
		        5. 4. 3. 2. }.
	m2 := (RTCMatrix rows: 4 columns: 4)
		data: { 1. 2. 3. 4.
		        5. 6. 7. 8.
		        9. 8. 7. 6.
		        5. 4. 3. 2. }.
	self assert: m1 equals: m2.
]

{ #category : #tests }
RTCMatrixTest >> testMatrixInequality [

	| m1 m2 |
	m1 := (RTCMatrix rows: 4 columns: 4) data:
		      { 1. 2. 3. 4.
		        5. 6. 7. 8.
		        9. 8. 7. 6.
		        5. 4. 3. 2 }.
	m2 := (RTCMatrix rows: 4 columns: 4) data:
		      { 2. 3. 4. 5.
		        6. 7. 8. 9.
		        8. 7. 6. 5.
		        4. 3. 2. 1 }.
	self assert: m1 ~= m2
]

{ #category : #tests }
RTCMatrixTest >> testSetWrongData [

	| m d |
	m := RTCMatrix rows: 2 columns: 2.
	d := { -3.  5.
	        1. -2.
	        1.  2. }.
	self should: [ m data: d ] raise: SizeMismatch.
]
