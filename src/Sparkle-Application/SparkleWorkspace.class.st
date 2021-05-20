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
SparkleWorkspace class >> menuCommandOn: aBuilder [ 
	"Add a custom menu item to the world menu"	
	<worldMenu> 
	
	(aBuilder item: #'Sparky Versions')
		order: 0.95; 
		icon: nil;  
		parent: #'Tools'; "This appears as the Library menu option for whatever reason"
		keyText: 'L'; "hot key doesn't work yet" 
		help: 'Sparkle versions on client & server';
		action: [ self versionSoup ]
]

{ #category : 'examples' }
SparkleWorkspace class >> printServerLoadedVersions [ 

	| inspectorService promise printString sem |
	inspectorService := SpkScaffoldingInspectorServiceClient new 
		                    registerWith:
		                    SpkConnectionProfile defaultConnection.
	promise := inspectorService printLoadedVersions.
	sem := Semaphore new.
	promise
		when: [ :result | 
			printString := result.
			sem signal ]
		catch: [ :reason | 
			printString := 'Unexpected Error getting printString '
			               , reason printString.
			sem signal ].
	sem wait.
	^ printString
]

{ #category : 'examples' }
SparkleWorkspace class >> versionSoup [

	"What the heck do I have loaded?"

	<example>
	| inst writeStream |
	SpkConnectionProfile defaultConnection ifNil:[^self notify: 'Not Connected']. 
	inst := self new start.
	writeStream := WriteStream on: String new.
	writeStream
		cr;
		nextPutAll: 'Client:';
		cr;
		tab;
		nextPutAll: 'Pharo ' , WelcomeHelp pharoVersionString.

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
	writeStream nextPutAll: self printServerLoadedVersions.
	inst text: writeStream contents
]

{ #category : 'running' }
SparkleWorkspace >> start [

	| presenter |
	(presenter := self new: SpkStandAloneWorkspacePresenter) openWithSpec.
	^ presenter
]
