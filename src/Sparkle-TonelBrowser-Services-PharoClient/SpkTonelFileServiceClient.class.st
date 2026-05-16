Class {
	#name : 'SpkTonelFileServiceClient',
	#superclass : 'SpkTonelFileService',
	#traits : 'SpkTPromise + SpkTModel + SpkTLinkedService',
	#classTraits : 'SpkTPromise classTrait + SpkTModel classTrait + SpkTLinkedService classTrait',
	#category : 'Sparkle-TonelBrowser-Services-PharoClient',
	#package : 'Sparkle-TonelBrowser-Services-PharoClient'
}

{ #category : 'testing' }
SpkTonelFileServiceClient >> hasExtension: extensionString [

	^ filename endsWith: '.' , extensionString
]
