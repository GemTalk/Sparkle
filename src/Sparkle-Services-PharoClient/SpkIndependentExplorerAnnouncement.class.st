Class {
	#name : 'SpkIndependentExplorerAnnouncement',
	#superclass : 'SpkIdentifiedAnnouncement',
	#instVars : [
		'xServ'
	],
	#category : 'Sparkle-Services-PharoClient-Announcements',
	#package : 'Sparkle-Services-PharoClient',
	#tag : 'Announcements'
}

{ #category : 'accessing' }
SpkIndependentExplorerAnnouncement >> xServ [

	^ xServ
]

{ #category : 'accessing' }
SpkIndependentExplorerAnnouncement >> xServ: anObject [

	xServ := anObject
]
