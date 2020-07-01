Class {
	#name : 'BaselineOfSparkle',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfSparkle'
}

{ #category : 'baselines' }
BaselineOfSparkle >> baseline: spec [
	<baseline>
	spec
		for: #pharo
		do: [ spec
				package: 'Sparkle-Services-Common'
					with: [ spec requires: 'RemoteServiceReplication' ];
				package: 'Sparkle-Services-Pharo'
					with: [ spec requires: #('Sparkle-Services-Common') ];
				package: 'Sparkle-Tools-Common'
					with: [ spec requires: #('Sparkle-Services-Pharo') ];
				package: 'Sparkle-Presenters'
					with: [ spec requires: #('Sparkle-Tools-Common') ];
				package: 'Sparkle-Application'
					with: [ spec requires: #('Sparkle-Presenters') ];
				package: 'Sparkle-Test'
					with: [ spec requires: #('Sparkle-Application') ];
				package: 'Sparkle-Experiments'
					with: [ spec requires: #('Sparkle-Test') ].
			spec
				baseline: 'RemoteServiceReplication'
				with: [ spec repository: self rsrUrl ] ]
]

{ #category : 'baselines' }
BaselineOfSparkle >> rsrUrl [
	| projectsHome |
	projectsHome := OSEnvironment current
		at: 'ROWAN_PROJECTS_HOME'
		ifAbsent: [ self error: '$ROWAN_PROJECTS_HOME not defined' ].
	^ 'gitlocal://' , projectsHome , '/RemoteServiceReplication/src'
]
