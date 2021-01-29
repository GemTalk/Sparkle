"
Tests to test server-side services (and sometimes their underlying tools) on the server, without needing an RSR connection
"
Class {
	#name : 'SpkServiceServerTest',
	#superclass : 'TestCase',
	#category : 'Sparkle-Tools-GemStone-Test'
}

{ #category : 'tests' }
SpkServiceServerTest >> testDefaultTaskspaceLayout [
	"Basically, can we create a default taskspace and all its server-side bitses"

	| server layout |
	server := SpkTaskspaceRegistryServiceServer new.
	layout := server newDefaultTaskspaceLayout.
	self assert: layout class equals: SpkTaskspaceLayoutServiceServer
]
