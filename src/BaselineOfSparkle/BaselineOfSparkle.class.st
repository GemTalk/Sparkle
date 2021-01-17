Class {
	#name : #BaselineOfSparkle,
	#superclass : #BaselineOf,
	#category : #BaselineOfSparkle
}

{ #category : #baselines }
BaselineOfSparkle >> baseline: spec [

	<baseline>
	spec for: #pharo do: [ 
		spec
			postLoadDoIt: #postload:package:;
			package: 'Sparkle-Tools-Common';
			package: 'Sparkle-Tools-Pharo'
			with: [ spec requires: 'Sparkle-Tools-Common' ];
			package: 'Sparkle-Tools-Common-Test'
			with: [ spec requires: 'Sparkle-Tools-Common' ];
			package: 'Sparkle-Tools-Pharo-Test'
			with: [ spec requires: 'Sparkle-Tools-Common' ];
			package: 'Sparkle-Services-Common'
			with: [ spec requires: 'RemoteServiceReplication' ];
			package: 'Sparkle-Services-PharoClient'
			with: [ spec requires: 'Sparkle-Services-Common' ];
			package: 'Sparkle-Services-PharoServer'
			with: [ 
				spec requires:
						#( 'Sparkle-Services-Common' 'Sparkle-Tools-Pharo' ) ];
			package: 'Sparkle-Presenters' with: [ 
				spec requires:
						#( 'Sparkle-Spextensions' 'Sparkle-Services-PharoClient' ) ];
			package: 'Sparkle-Presenters-Test'
			with: [ spec requires: 'Sparkle-Presenters' ];
			package: 'Sparkle-UiTest'
			with: [ spec requires: 'Sparkle-Presenters' ];
			package: 'Sparkle-Application'
			with: [ spec requires: 'Sparkle-Presenters' ];
			package: 'Sparkle-Spextensions'.
		spec
			baseline: 'RemoteServiceReplication'
			with: [ spec repository: self rsrUrl ] ]
]

{ #category : #actions }
BaselineOfSparkle >> postload: loader package: packageSpec [
	| repositoriesSpec map urlString |
	repositoriesSpec := packageSpec repositories.
	map := repositoriesSpec map.
	map size = 1 ifFalse: [ 
		self error:
			'Expected Sparkle baseline load to come from exactly one repository' ].
	urlString := map keys first.
	SpkIconLibrary loadFromLocalSrcUrlString: urlString
]

{ #category : #baselines }
BaselineOfSparkle >> rsrUrl [
	| projectsHome |
	projectsHome := OSEnvironment current
		at: 'ROWAN_PROJECTS_HOME'
		ifAbsent: [ self error: '$ROWAN_PROJECTS_HOME not defined' ].
	^ 'gitlocal://' , projectsHome , '/RemoteServiceReplication/src'
]
