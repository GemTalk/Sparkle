"
Concrete service classes for Pharo. Mostly service clients, though if there's a client service that runs in GemStone the corresponding server service in Pharo will be in this package.
"
Class {
	#name : 'ManifestSparkleServicesPharoClient',
	#superclass : 'PackageManifest',
	#category : 'Sparkle-Services-PharoClient-Manifest'
}

{ #category : 'code-critics' }
ManifestSparkleServicesPharoClient class >> ruleReGuardClauseRuleV1FalsePositive [
	^ #(#(#(#RGPackageDefinition #(#'Sparkle-Services-PharoClient')) #'2020-08-16T20:46:53.296473-07:00') )
]
