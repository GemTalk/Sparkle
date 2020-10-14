"
This is the RSR taskspace service. On the GemStone server, it interacts with a taskspace tool.

A Sparkle taskspace is where a developer works. A taskspace:

* Keeps track of some number of explorer windows
* When active (logged in) occupies one gem, and has exclusive use of that gem.
* May be persisted so a that a developer can log out of a taskspace, then later log back in and find things where they were left.


Typically:
* A taskspace is not shared between developers, unless they are pair programming in real time.
* Each developer has only one taskspace for each project they are working on.
"
Class {
	#name : 'SpkTaskspaceService',
	#superclass : 'RsrService',
	#instVars : [
		'workspaces'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'accessing' }
SpkTaskspaceService class >> templateClassName [

	^ #SpkTaskspaceService
]
