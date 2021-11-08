Class {
	#name : 'SpkProcessListServiceServer',
	#superclass : 'SpkProcessListService',
	#instVars : [
		'tool'
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

	processes := tool processTools collect: [:each | (SpkServiceFactory serviceForTool: each) parentService: self; yourself].
	^true
]

{ #category : 'accessing' }
SpkProcessListServiceServer >> tool [

	^tool
]
