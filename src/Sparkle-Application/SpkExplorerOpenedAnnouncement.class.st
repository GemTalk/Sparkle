Class {
	#name : 'SpkExplorerOpenedAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'explorer'
	],
	#category : 'Sparkle-Application'
}

{ #category : 'accessing' }
SpkExplorerOpenedAnnouncement >> explorer [

	^ explorer
]

{ #category : 'accessing' }
SpkExplorerOpenedAnnouncement >> explorer: anObject [

	explorer := anObject
]
