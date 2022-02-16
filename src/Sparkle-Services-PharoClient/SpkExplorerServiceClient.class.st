Class {
	#name : 'SpkExplorerServiceClient',
	#superclass : 'SpkExplorerService',
	#traits : 'SpkTModel',
	#classTraits : 'SpkTModel classTrait',
	#category : 'Sparkle-Services-PharoClient-Services'
}

{ #category : 'accessing' }
SpkExplorerServiceClient >> singlePaneService [

	"This message should only be sent when initializing, when 
	I'm expected to have exactly one paneService."

	self paneServices size = 1 ifFalse: [ 
		self error: 'Expected exactly one pane service.' ].
	self paneServices do: [ :result | ^ result ]
]
