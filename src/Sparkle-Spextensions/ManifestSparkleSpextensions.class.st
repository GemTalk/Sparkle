"
Various Sparkle-specific extensions to Spec2 (mostly through subclassing rather than extension methods) and Morphic.
"
Class {
	#name : 'ManifestSparkleSpextensions',
	#superclass : 'PackageManifest',
	#category : 'Sparkle-Spextensions-Manifest'
}

{ #category : 'code-critics' }
ManifestSparkleSpextensions class >> ruleCodeCruftLeftInMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#SpkTMorphEnablement #logEnablement #false)) #'2021-04-25T13:28:10.895159-07:00') )
]
