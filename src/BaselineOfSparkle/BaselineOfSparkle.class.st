Class {
	#name : 'BaselineOfSparkle',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfSparkle'
}

{ #category : 'baselines' }
BaselineOfSparkle >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				package: 'Sparkle-TonelFixes';
				package: 'Sparkle-Services-Common'
					with: [ spec requires: #('Sparkle-TonelFixes') ];
				package: 'Sparkle-Services-Pharo'
					with: [ spec requires: #('Sparkle-Services-Common') ];
				package: 'Sparkle-Presenters'
					with: [ spec requires: #('Sparkle-Services-Pharo') ];
				package: 'Sparkle-Application'
					with: [ spec requires: #('Sparkle-Presenters') ] ]
]
