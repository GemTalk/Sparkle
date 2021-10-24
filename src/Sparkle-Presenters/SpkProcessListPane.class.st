Class {
	#name : 'SpkProcessListPane',
	#superclass : 'SpkPane',
	#traits : 'SpkTHeader + SpkTList',
	#classTraits : 'SpkTHeader classTrait + SpkTList classTrait',
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'accessing' }
SpkProcessListPane >> headerClass [

	^ SpkProcessListPaneHeader
]
