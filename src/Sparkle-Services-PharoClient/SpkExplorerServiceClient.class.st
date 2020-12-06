Class {
	#name : 'SpkExplorerServiceClient',
	#superclass : 'SpkExplorerService',
	#traits : 'SpkTModel',
	#classTraits : 'SpkTModel classTrait',
	#category : 'Sparkle-Services-PharoClient-Services'
}

{ #category : 'initialization' }
SpkExplorerServiceClient >> defaultLayout [

	^ SpkExplorerLayoutServiceClient new
]
