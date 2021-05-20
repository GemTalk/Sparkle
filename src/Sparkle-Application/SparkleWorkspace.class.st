Class {
	#name : 'SparkleWorkspace',
	#superclass : 'SpkApplication',
	#category : 'Sparkle-Application'
}

{ #category : 'examples' }
SparkleWorkspace class >> example [ 
	<example>
	self new start
]

{ #category : 'examples' }
SparkleWorkspace class >> versionSoup [

	"What the heck do I have loaded?"

	<example>
	| inst writeStream |
	inst := self new start.
	writeStream := WriteStream on: String new.
	writeStream
		cr;
		nextPutAll: 'Pharo ' , WelcomeHelp pharoVersionString;
		flush.
	writeStream
		cr;
		nextPutAll: 'Loaded repositories:'.
	IceRepository registry do: [ :repository | 
		writeStream
			cr;
			tab;
			nextPutAll: repository name;
			tab;
			space;
			nextPutAll: repository branch name;
			tab;
			space;
			nextPutAll: repository branch commit shortId ].
	inst text: writeStream contents
]

{ #category : 'running' }
SparkleWorkspace >> start [

	| presenter |
	(presenter := self new: SpkStandAloneWorkspacePresenter) openWithSpec.
	^ presenter
]
