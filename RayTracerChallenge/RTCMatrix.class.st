"
I represent a matrix of any dimension
"
Class {
	#name : #RTCMatrix,
	#superclass : #RTCFloatArray,
	#instVars : [
		'rows',
		'columns'
	],
	#category : #RayTracerChallenge
}

{ #category : #'instance creation' }
RTCMatrix class >> identity [
			
	| collection |
	collection := FloatArray ofSize: 4.
	^ self new
		rows: 4;
		columns: 4;
		array: { 1. 0. 0. 0.
		         0. 1. 0. 0.
		         0. 0. 1. 0.
		         0. 0. 0. 1. }.
]

{ #category : #'instance creation' }
RTCMatrix class >> rows: nRows columns: nColumns [
			
	| collection |
	collection := FloatArray ofSize: nRows * nColumns.
	^ self new
		rows: nRows;
		columns: nColumns;
		array: collection.
]

{ #category : #arithmetic }
RTCMatrix >> * anObject [

	| result |
	anObject isNumber ifTrue: [ ^ super * anObject ].
	result := self class rows: rows columns: anObject columns.
	result array withIndexDo: [ :e :i |
		| r c s |
		r := result rowAt: i.
		c := result columnAt: i.
		s := 0.
		0 to: (result rows) - 1 do: [ :j | 
			s := s + ((self at: r@j) * (anObject at: j@c)) ].
		result at: i put: s ].
	^ result.
	
]

{ #category : #accessing }
RTCMatrix >> at: anObject [

	^ super at: (self indexAt: anObject).
]

{ #category : #accessing }
RTCMatrix >> at: anObject put: aNumber [

	^ super at: (self indexAt: anObject) put: aNumber.
]

{ #category : #accessing }
RTCMatrix >> columnAt: anIndex [
	"Answer the row number corresponding to anIndex"
	"anIndex is 1-based but answer is 0-based"
	^ ((anIndex - 1) % columns) asInteger.
]

{ #category : #accessing }
RTCMatrix >> columns [
	^ columns
]

{ #category : #api }
RTCMatrix >> columns: anInteger [ 
	columns := anInteger
]

{ #category : #accessing }
RTCMatrix >> data: aCollection [
	(aCollection size = (rows * columns))
		ifFalse: [ SizeMismatch signal. ].
	self array: aCollection.
]

{ #category : #accessing }
RTCMatrix >> indexAt: anObject [

	| index |
	index := [ (columns * (anObject x)) + (anObject y) + 1 ]
		on: MessageNotUnderstood
		do: [ anObject ].
	^ index.
]

{ #category : #accessing }
RTCMatrix >> rowAt: anIndex [
	"Answer the row number corresponding to anIndex"
	"anIndex is 1-based but answer is 0-based"
	^ ((anIndex - 1) / columns) asInteger.
]

{ #category : #accessing }
RTCMatrix >> rows [
	^ rows
]

{ #category : #accessing }
RTCMatrix >> rows: anInteger [ 
	rows := anInteger
]
