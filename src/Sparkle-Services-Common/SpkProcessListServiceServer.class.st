Class {
	#name : 'SpkProcessListServiceServer',
	#superclass : 'SpkProcessListService',
	#instVars : [
		'tool',
		'toolServiceMapping'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'instance creation' }
SpkProcessListServiceServer class >> forTool: aProcessListTool [

	^self new
		initializeFromTool: aProcessListTool;
		yourself
]

{ #category : 'initialization' }
SpkProcessListServiceServer >> initialize [

	super initialize.
	toolServiceMapping := IdentityDictionary new
]

{ #category : 'initialization' }
SpkProcessListServiceServer >> initializeFromTool: aProcessListTool [

	tool := aProcessListTool.
	tool
		when: SpkExecutionAnnouncement
		send: #'receiveExecutionAnnouncement:'
		to: self.
	self refreshFromTool.
]

{ #category : 'processing announcements' }
SpkProcessListServiceServer >> receiveExecutionAnnouncement: anAnnouncement [

	self refreshFromTool ifTrue: [anAnnouncement updatedServices add: self]
]

{ #category : 'initialization' }
SpkProcessListServiceServer >> refreshFromTool [

	| oldToolServiceMapping changed |
	oldToolServiceMapping := toolServiceMapping.
	toolServiceMapping := IdentityDictionary new.
	processes := Set new.
	changed := false.
	tool processToolsDo:
		[:processTool | | service |
		service := oldToolServiceMapping
			at: processTool
			ifAbsent:
				[changed := true.
				(SpkServiceFactory serviceForTool: processTool)
					parentService: self;
					yourself].
		toolServiceMapping at: processTool put: service.
		processes add: service.
		changed := changed | service refreshFromTool].
	changed := changed | (toolServiceMapping size ~= oldToolServiceMapping size).
	^changed
]

{ #category : 'updating' }
SpkProcessListServiceServer >> synchronizeTaskspace [

	| announcement |
	updatedServices := Set new.
	announcement := SpkExecutionAnnouncement new
		                updatedServices: updatedServices;
		                yourself.
	tool synchronizeTaskspaceAnnouncing: announcement.
	^self
]

{ #category : 'accessing' }
SpkProcessListServiceServer >> tool [

	^tool
]
