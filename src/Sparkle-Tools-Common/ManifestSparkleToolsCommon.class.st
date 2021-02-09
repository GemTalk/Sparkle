"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestSparkleToolsCommon',
	#superclass : 'PackageManifest',
	#category : 'Sparkle-Tools-Common-Manifest'
}

{ #category : 'code-critics' }
ManifestSparkleToolsCommon class >> ruleSelfSentNotImplementedRuleV1FalsePositive [
	^ #(#(#(#RGPackageDefinition #(#'Sparkle-Tools-Common')) #'2021-02-07T19:15:36.785135-08:00') )
]

{ #category : 'code-critics' }
ManifestSparkleToolsCommon class >> ruleSentNotImplementedRuleV1FalsePositive [
	^ #(#(#(#RGPackageDefinition #(#'Sparkle-Tools-Common')) #'2021-02-07T19:15:40.782435-08:00') )
]

{ #category : 'code-critics' }
ManifestSparkleToolsCommon class >> ruleTempsReadBeforeWrittenRuleV1FalsePositive [
	^ #(#(#(#RGPackageDefinition #(#'Sparkle-Tools-Common')) #'2021-02-07T19:15:31.877582-08:00') )
]

{ #category : 'code-critics' }
ManifestSparkleToolsCommon class >> ruleUnclassifiedMethodsRuleV1FalsePositive [
	^ #(#(#(#RGPackageDefinition #(#'Sparkle-Tools-Common')) #'2021-02-07T19:15:46.281302-08:00') )
]
