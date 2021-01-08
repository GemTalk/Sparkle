Class {
	#name : 'SpkScaffoldingServiceClient',
	#superclass : 'SpkScaffoldingAbstractServiceClient',
	#category : 'Sparkle-Scaffolding-GemStone'
}

{ #category : 'accessing' }
SpkScaffoldingServiceClient >> debuggerService [
	super debuggerService.
	GsFile
		gciLogServer:
			'client accessor ' , debuggerService printString , ' (' , self asOop printString
				, ')'.
	^ debuggerService
]
