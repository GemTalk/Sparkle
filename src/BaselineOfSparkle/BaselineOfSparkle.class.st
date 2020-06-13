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
				package: 'Sparkle-Services-Common';
				package: 'Sparkle-Services-Pharo'
					with: [ spec requires: #('Sparkle-Services-Common') ];
				package: 'Sparkle-Presenters'
					with: [ spec requires: #('Sparkle-Services-Pharo') ];
				package: 'Sparkle-Application'
					with: [ spec requires: #('Sparkle-Presenters') ].
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
	^ 'filetree://' , projectsHome , '/RemoteServiceReplication/src'
]
