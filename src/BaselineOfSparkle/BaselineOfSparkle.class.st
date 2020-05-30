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
				package: 'Sparkle-Services'
					with: [ spec requires: 'RemoteServiceReplication' ];
				package: 'Sparkle-Presenters'
					with: [ spec requires: #('Sparkle-Services') ];
				package: 'Sparkle-Application'
					with: [ spec requires: #('Sparkle-Presenters') ] ].
	spec
		baseline: 'RemoteServiceReplication'
		with: [ spec
				repository: 'ssh://git@github.com:GemTalk/RemoteServiceReplication.git' ]
]
