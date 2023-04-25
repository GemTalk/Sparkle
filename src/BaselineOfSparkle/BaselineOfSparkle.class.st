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
			postLoadDoIt: #postload:package:;
			package: 'Sparkle-Tools-Common';
			package: 'Sparkle-TestBase-Pharo';
			package: 'Sparkle-Tools-Pharo'
			with: [ spec requires: 'Sparkle-Tools-Common' ];
			package: 'Sparkle-Tools-Common-Test'
			with: [ 
				spec requires:
						#( 'Sparkle-Tools-Common' 'Sparkle-TestBase-Pharo' ) ];
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
			package: 'Sparkle-Presenters-Test' with: [ 
				spec requires:
						#( 'Sparkle-Presenters' 'Sparkle-Tools-Common-Test' ) ];
			package: 'Sparkle-UiTest' with: [ 
				spec requires:
						#( 'Sparkle-Presenters' 'Sparkle-Tools-Common-Test' ) ];
			package: 'Sparkle-Application'
			with: [ spec requires: 'Sparkle-Presenters' ];
			package: 'Sparkle-Spextensions'.
		spec
			baseline: 'RemoteServiceReplication'
			with: [ spec repository: self rsrUrl ].
		spec
			baseline: 'PharoGemStoneFFI'
			with: [ spec repository: self ffiUrl ] ]
]

{ #category : 'baselines' }
BaselineOfSparkle >> ffiUrl [

	^ self urlForProject: 'PharoGemStoneFFI'
]

{ #category : 'baselines' }
BaselineOfSparkle >> githubUrlForGemTalkProject: projectName [

	^ 'github://GemTalk/' , projectName , ':main'
]

{ #category : 'actions' }
BaselineOfSparkle >> postload: loader package: packageSpec [

	SpkIconLibrary loadFromGitClone
]

{ #category : 'baselines' }
BaselineOfSparkle >> rsrUrl [

	^ self urlForProject: 'RemoteServiceReplication'
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
