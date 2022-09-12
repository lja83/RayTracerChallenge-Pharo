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
	a contents atAllPut: (RTCColor new).
	^ a.
]

{ #category : #converting }
RTCCanvas >> asForm [

	| f |
	f := ColorForm extent: (self width @ self height) depth: 8.
	0 to: self height - 1 do: [ :y |
		0 to: self width - 1 do: [ :x |
			f colorAt: x@y put: ((self at: x@y) asColor) ] ].
	^ f.
]

{ #category : #converting }
RTCCanvas >> asMorph [

	^ self asForm asMorph.
]

{ #category : #converting }
RTCCanvas >> asPPM [

	| stream headerLines |
	stream := WriteStream on: (String new).
	headerLines := {
		'P3'.
		self width asString , ' ' , self height asString.
		'255'
	}.
	headerLines do: [ :line |
		stream nextPutAll: line; lf ].
	1 to: numberOfRows do: [ :row |
		| colorStrings |
		colorStrings := OrderedCollection new.
		1 to: numberOfColumns do: [ :column |
			| stringArray |
			stringArray :=
				(self at: row at: column)        "Get the RTCCOlor"
				asIntegerArray                   "Convert to array of values from 0-255"
				collect: [ :i | i asString ].    "Convert to array of strings"
			colorStrings add: (' ' join: stringArray).
		].
		stream nextPutAll: (' ' join: colorStrings); lf.
	].
	^ stream contents.
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
