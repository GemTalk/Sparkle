Extension { #name : 'TonelSTONWriter' }

{ #category : '*Sparkle-TonelFixes' }
TonelSTONWriter >> encodeKey: key value: value [
	"All Tonel values are strings.
	Some need to be converted from Symbols"

	super encodeKey: key value: value asTonelValue
]
