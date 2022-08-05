"
Things common to all pane-level services
"
Trait {
	#name : 'SpkTPaneService',
	#category : 'Sparkle-Services-PharoClient-Support'
}

{ #category : 'announcing' }
SpkTPaneService >> announceIndependentExplorer: xServ for: requestId [

	| announcement |
	announcement := SpkIndependentExplorerAnnouncement new
		                xServ: xServ;
		                requestId: requestId;
		                yourself.
	self announce: announcement
]

{ #category : 'actions' }
SpkTPaneService >> moveToNewExplorerFor: requestId [

	| promise |
	promise := self remoteSelf moveToNewExplorer.
	promise
		when: [ :newXServ | 
			self
				announceIndependentExplorer: newXServ for: requestId;
				announceActionComplete ]
		catch: self defaultCatchBlock
]
