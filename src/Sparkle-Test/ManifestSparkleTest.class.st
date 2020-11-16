"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestSparkleTest',
	#superclass : 'PackageManifest',
	#category : 'Sparkle-Test-Manifest'
}

{ #category : 'code-critics' }
ManifestSparkleTest class >> ruleCollectionMessagesToExternalObjectRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'SpkTestInspectorServiceClient class' #cuddles #true)) #'2020-11-15T17:01:26.159037-08:00') )
]
