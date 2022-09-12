"
I represent a canvas on which to draw. I can be indexed like an Array2D or I can be indexed with Point objects.

Point objects are zero-based but Array2D is one-based.  Therefore, Point values will be converted to Array indicies by adding 1.
"
Class {
	#name : #RTCCanvas,
	#superclass : #Array2D,
	#category : #RayTracerChallenge
}

{ #category : #'instance creation' }
RTCCanvas class >> rows: rowNumber columns: columnNumber [

	| a |
	a := super rows: rowNumber columns: columnNumber.
	a contents atAllPut: (RTCColor newFrom: { 0. 0. 0. 0. }).
	^ a.
]

{ #category : #accessing }
RTCCanvas >> at: aPoint [

	^ self at: aPoint y + 1 at: aPoint x + 1.
]

{ #category : #accessing }
RTCCanvas >> at: aPoint put: aRTCColor [

	^ self at: aPoint y + 1 at: aPoint x + 1 put: aRTCColor.
]

{ #category : #accessing }
RTCCanvas >> height [
	^ self rowCount.
]

{ #category : #accessing }
RTCCanvas >> width [
	^ self columnCount.
]
