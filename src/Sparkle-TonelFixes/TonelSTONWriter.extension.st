Extension { #name : 'TonelSTONWriter' }

{ #category : '*Sparkle-TonelFixes' }
TonelSTONWriter >> encodeKey: key value: value [
	super encodeKey: key value: value asTonelValue
]
