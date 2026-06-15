Class {
	#name : 'SpkTonelFileServiceServer',
	#superclass : 'SpkTonelFileService',
	#traits : 'SpkTHierarchicalService',
	#classTraits : 'SpkTHierarchicalService classTrait',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-TonelBrowser-Services-PharoServer',
	#package : 'Sparkle-TonelBrowser-Services-PharoServer'
}

{ #category : 'initialization' }
SpkTonelFileServiceServer >> initializeFromTool: aTool [

	tool := aTool.
	filename := tool filename
]

{ #category : 'accessing' }
SpkTonelFileServiceServer >> tool [

	^ tool
]
