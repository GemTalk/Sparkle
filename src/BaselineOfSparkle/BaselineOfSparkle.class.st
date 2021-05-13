Class {
	#name : 'BaselineOfSparkle',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfSparkle'
}

{ #category : 'baselines' }
BaselineOfSparkle >> baseline: spec [

	<baseline>
	self baselineNoScaffolding: spec
]

{ #category : 'baselines' }
BaselineOfSparkle >> baselineNoScaffolding: spec [

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
			with: [ spec requires: 'Sparkle-Tools-Common-Test' ];
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
			with: [ spec requires: #('Sparkle-Presenters' 'Sparkle-Tools-Common-Test') ];
			package: 'Sparkle-UiTest'
			with: [ spec requires: #('Sparkle-Presenters' 'Sparkle-Tools-Common-Test') ];
			package: 'Sparkle-Application'
			with: [ spec requires: 'Sparkle-Presenters' ];
			package: 'Sparkle-Spextensions'.
		spec
			baseline: 'RemoteServiceReplication'
			with: [ spec repository: self rsrUrl ].
		spec
			baseline: 'SparkleFFI'
			with: [ spec repository: self sparkleFFIUrl ]  ]
]

{ #category : 'baselines' }
BaselineOfSparkle >> baselineWithScaffolding: spec [

	spec for: #pharo do: [ 
		spec
			postLoadDoIt: #postload:package:;
			package: 'Sparkle-Scaffolding-Common'
			with: [ spec 
				requires: 'Sparkle-Services-Common';
				includes: #('Sparkle-Scaffolding-Pharo' 'Sparkle-Scaffolding-Pharo-Deprecated') ];
			package: 'Sparkle-Scaffolding-Pharo-Deprecated'
			with: [ spec requires: 'Sparkle-Scaffolding-Common' ];
			package: 'Sparkle-Scaffolding-Pharo'
			with: [ spec requires: 'Sparkle-Scaffolding-Common' ];
			package: 'Sparkle-Tools-Common';
			package: 'Sparkle-Tools-Pharo'
			with: [ spec requires: 'Sparkle-Tools-Common' ];
			package: 'Sparkle-Tools-Common-Test'
			with: [ spec requires: 'Sparkle-Tools-Common' ];
			package: 'Sparkle-Tools-Pharo-Test'
			with: [ spec requires: 'Sparkle-Tools-Common' ];
			package: 'Sparkle-Services-Common'
			with: [ spec 
				requires: 'RemoteServiceReplication';
				includes: 'Sparkle-Scaffolding-Common' ];
			package: 'Sparkle-Services-PharoClient'
			with: [ spec requires: 'Sparkle-Services-Common' ];
			package: 'Sparkle-Services-PharoServer'
			with: [ 
				spec 
					requires:
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
			with: [ spec repository: self rsrUrl ].
		spec
			baseline: 'SparkleFFI'
			with: [ spec repository: self sparkleFFIUrl ] ]
]

{ #category : 'baselines' }
BaselineOfSparkle >> githubUrlForGemTalkProject: projectName [

	^ 'github://GemTalk/' , projectName , ':main'
]

{ #category : 'actions' }
BaselineOfSparkle >> postload: loader package: packageSpec [

	| lp adapter repo repositoryPath |
	lp := loader loaderPolicy.

	adapter := (lp repositoryMap associations
		            detect: [ :each | each key beginsWith: 'Sparkle-' ]
		            ifNone: [ 
			            ^ self
			            "If no Sparkle packages are being loaded, icons are 
							either already initialized or not needed." ])
		           value.
	repo := adapter repository.
	repositoryPath := repo location asPath.
	SpkIconLibrary loadFromPath: repositoryPath
]

{ #category : 'baselines' }
BaselineOfSparkle >> rsrUrl [

	^ self urlForProject: 'RemoteServiceReplication'
]

{ #category : 'baselines' }
BaselineOfSparkle >> sparkleFFIUrl [

	^ self urlForProject: 'SparkleFFI'
]

{ #category : 'baselines' }
BaselineOfSparkle >> urlForProject: projectName [

	| projectsHome path |
	projectsHome := OSEnvironment current
		                at: 'ROWAN_PROJECTS_HOME'
		                ifAbsent: [ 
		                ^ self githubUrlForGemTalkProject: projectName ].
	path := Path / projectsHome / projectName / 'src'.
	^ path asFileReference exists
		ifFalse: [ self githubUrlForGemTalkProject: projectName ]
		ifTrue: [ 'gitlocal://' , path pathString ]
]
