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
RTCMatrixTest >> testMatrixMultiply [

	| a b r |
	a := RTCMatrix rows: 4 columns: 4.
	a data: { 1. 2. 3. 4.
	          5. 6. 7. 8.
	          9. 8. 7. 6.
	          5. 4. 3. 2. }.
	b := RTCMatrix rows: 4 columns: 4.
	b data: { -2.  1.  2.  3.
	           3.  2.  1. -1.
	           4.  3.  6.  5.
	           1.  2.  7.  8. }.
	r := RTCMatrix rows: 4 columns: 4.
	r data: { 20.  22.  50.  48.
	          44.  54. 114. 108.
	          40.  58. 110. 102.
	          16.  26.  46.  42. }.
	self assert: (a * b) equals: r.
]

{ #category : #tests }
RTCMatrixTest >> testMatrixMultiplyTuple [

	| a b r |
	a := RTCMatrix rows: 4 columns: 4.
	a data: { 1. 2. 3. 4.
	          2. 4. 4. 2.
	          8. 6. 4. 1.
	          0. 0. 0. 1. }.
	b := RTCTuple newFrom: { 1. 2. 3. 1. }.
	r := RTCTuple newFrom: { 18. 24. 33. 1. }.
	self assert: (a * b) equals: r.
]

{ #category : #tests }
RTCMatrixTest >> testMultiplyMatrixByIdentity [

	| a |
	a := RTCMatrix rows: 4 columns: 4.
	a data: { 0.  1.  2.  4.
	          1.  2.  4.  8.
	          2.  4.  8. 16.
	          4.  8. 16. 32. }.
	self assert: (a * RTCMatrix identity) equals: a.
]

{ #category : #tests }
RTCMatrixTest >> testMultiplyTupleByIdentity [

	| a |
	a := RTCTuple newFrom: { 1. 2. 3. 4. }.
	self assert: (RTCMatrix identity * a) equals: a.
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

{ #category : #tests }
RTCMatrixTest >> testTransposeIdentity [

	self assert: RTCMatrix identity transposed equals: RTCMatrix identity.
]

{ #category : #tests }
RTCMatrixTest >> testTransposeMatrix [

	| m t |
	m := RTCMatrix rows: 4 columns: 4.
	m data: { 0. 9. 3. 0.
	          9. 8. 0. 8.
	          1. 8. 5. 3.
	          0. 0. 5. 8. }.
	t := RTCMatrix rows: 4 columns: 4.
	t data: { 0. 9. 1. 0.
	          9. 8. 8. 0.
	          3. 0. 5. 5.
	          0. 8. 3. 8. }.
	self assert: m transposed equals: t.
]
