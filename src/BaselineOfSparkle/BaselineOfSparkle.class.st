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
				package: 'Sparkle-Services';
				package: 'Sparkle-Presenters'
					with: [ spec requires: #('Sparkle-Services') ];
				package: 'Sparkle-Application'
					with: [ spec requires: #('Sparkle-Presenters') ] ]
	"I think the following does not work because RSR is currently in a private repository"
	"spec
		baseline: 'RemoteServiceReplication'
		with: [ spec
				repository: 'https://github.com/GemTalk/RemoteServiceReplication.git' ]"
]
