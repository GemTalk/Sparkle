Class {
	#name : #BaselineOfSparkle,
	#superclass : #BaselineOf,
	#category : #BaselineOfSparkle
}

{ #category : #baselines }
BaselineOfSparkle >> baseline: spec [
	spec
		for: #common
		do: [ spec
				package: #'Sparkle-Services';
				package: #'Sparkle-Presenters'
					with: [ spec requires: #(#'Sparkle-Services') ];
				package: #'Sparkle-Application'
					with: [ spec requires: #(#'Sparkle-Presenters') ] ]
]
