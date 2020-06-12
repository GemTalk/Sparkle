Extension { #name : 'Array' }

{ #category : '*Sparkle-TonelFixes' }
Array >> asTonelValue [
	^ self collect: [ :each | each asTonelValue ]
]
