Class {
	#name : #BaselineOfSparkle,
	#superclass : #BaselineOf,
	#category : #BaselineOfSparkle
}

{ #category : #baselines }
BaselineOfSparkle >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				package: 'Sparkle-Services-Common';
				package: 'Sparkle-Services-Pharo'
					with: [ spec requires: #('Sparkle-Services-Common') ];
				package: 'Sparkle-Presenters'
					with: [ spec requires: #('Sparkle-Services-Pharo') ];
				package: 'Sparkle-Application'
					with: [ spec requires: #('Sparkle-Presenters') ] ]
	"I think the following does not work because RSR is currently in a private repository"
	"spec
		baseline: 'RemoteServiceReplication'
		with: [ spec
				repository: 'https://github.com/GemTalk/RemoteServiceReplication.git' ]"
]
