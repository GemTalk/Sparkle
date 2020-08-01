Class {
	#name : 'BaselineOfSparkle',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfSparkle'
}

{ #category : 'baselines' }
BaselineOfSparkle >> baseline: spec [
	<baseline>
	spec for: #pharo do: [ 
		spec
			package: 'Sparkle-Tools-Common';
			package: 'Sparkle-Tools-Pharo'
			with: [ spec requires: 'Sparkle-Tools-Common' ];
			package: 'Sparkle-Services-Common'
			with: [ spec requires: 'RemoteServiceReplication' ];
			package: 'Sparkle-Services-PharoClient'
			with: [ spec requires: #( 'Sparkle-Services-Common' ) ];
			package: 'Sparkle-Services-PharoServer'
			with: [ spec requires: #( 'Sparkle-Services-Common' ) ];
			package: 'Sparkle-Presenters' with: [ 
				spec requires:
						#( 'Sparkle-Spextensions' 'Sparkle-Services-PharoClient' ) ];
			package: 'Sparkle-Application';
			package: 'Sparkle-Test'
			with: [ spec requires: #( 'Sparkle-Presenters' ) ];
			package: 'Sparkle-Spextensions';
			package: 'Sparkle-Experiments' with: [ 
				spec requires:
						#( 'Sparkle-Spextensions' 'Sparkle-Services-PharoClient'
						   'RemoteServiceReplication' ) ].
		spec
			baseline: 'RemoteServiceReplication'
			with: [ spec repository: self rsrUrl ] ]
]

{ #category : 'actions' }
BaselineOfSparkle >> postload: loader package: packageSpec [

	self halt.
]

{ #category : 'baselines' }
BaselineOfSparkle >> rsrUrl [
	| projectsHome |
	projectsHome := OSEnvironment current
		at: 'ROWAN_PROJECTS_HOME'
		ifAbsent: [ self error: '$ROWAN_PROJECTS_HOME not defined' ].
	^ 'gitlocal://' , projectsHome , '/RemoteServiceReplication/src'
]
