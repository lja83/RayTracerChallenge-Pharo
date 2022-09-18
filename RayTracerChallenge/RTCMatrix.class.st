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
RTCMatrix class >> rows: nRows columns: nColumns [
			
	| collection |
	collection := FloatArray ofSize: nRows * nColumns.
	^ self new
		rows: nRows;
		columns: nColumns;
		array: collection.
]

{ #category : #accessing }
RTCMatrix >> at: anObject [

	^ super at: (self indexAt: anObject).
]

{ #category : #accessing }
RTCMatrix >> at: anObject put: aNumber [

	^ super at: (self indexAt: anObject) put: aNumber.
]

{ #category : #api }
RTCMatrix >> columns: anInteger [ 
	columns := anInteger
]

{ #category : #accessing }
RTCMatrix >> data: aCollection [ 
	self array: aCollection.
]

{ #category : #accessing }
RTCMatrix >> indexAt: anObject [

	| index |
	index := [ (rows * (anObject x)) + (anObject y) + 1 ]
		on: MessageNotUnderstood
		do: [ anObject ].
	^ index.
]

{ #category : #accessing }
RTCMatrix >> rows: anInteger [ 
	rows := anInteger
]
