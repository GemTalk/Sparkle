Class {
	#name : 'BaselineOfSparkle',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfSparkle',
	#package : 'BaselineOfSparkle'
}

{ #category : 'baselines' }
BaselineOfSparkle >> baseline: spec [

	<baseline>
	spec for: #pharo do: [
		self
			miscBaseline: spec;
			externalProjectsBaseline: spec;
			presentersBaseline: spec;
			servicesBaseline: spec;
			toolsBaseline: spec;
			testsBaseline: spec;
			tonelBrowserPresentersBaseline: spec;
			tonelBrowserServicesBaseline: spec;
			tonelBrowserToolsBaseline: spec;
			stopwatchBaseline: spec ]
]

{ #category : 'baselines' }
BaselineOfSparkle >> externalProjectsBaseline: spec [

	spec
		baseline: 'RemoteServiceReplication'
		with: [ spec repository: self rsrUrl ];
		baseline: 'PharoGemStoneFFI' with: [ spec repository: self ffiUrl ];
		baseline: 'TonelReadWrite' with: [ spec repository: self tonelUrl ]
]

{ #category : 'private' }
BaselineOfSparkle >> ffiUrl [

	^ self urlForProject: 'PharoGemStoneFFI'
]

{ #category : 'private' }
BaselineOfSparkle >> githubUrlForGemTalkProject: projectName [

	^ 'github://GemTalk/' , projectName , ':main'
]

{ #category : 'baselines' }
BaselineOfSparkle >> miscBaseline: spec [

	spec
		postLoadDoIt: #postload:package:;
		package: 'Sparkle-Application' with: [
			spec requires:
					#( 'Sparkle-Presenters' 'Sparkle-Stopwatch' 'Sparkle-TonelBrowser-Presenters' ) ];
		package: 'Sparkle-Services-Utility-Server';
		package: 'Sparkle-Spextensions';
		package: 'Sparkle-TestBase-Pharo'
]

{ #category : 'actions' }
BaselineOfSparkle >> postload: loader package: packageSpec [

	SpkIconLibrary loadFromGitClone
]

{ #category : 'baselines' }
BaselineOfSparkle >> presentersBaseline: spec [

	spec package: 'Sparkle-Presenters' with: [
		spec requires:
			#( 'Sparkle-Spextensions' 'Sparkle-Services-PharoClient'
			   'PharoGemStoneFFI' ) ]
]

{ #category : 'private' }
BaselineOfSparkle >> rsrUrl [

	^ self urlForProject: 'RemoteServiceReplication'
]

{ #category : 'baselines' }
BaselineOfSparkle >> servicesBaseline: spec [

	spec
		package: 'Sparkle-Services-Common' with: [
			spec requires:
					#( 'RemoteServiceReplication' 'Sparkle-Tools-Common'
					   'Sparkle-Tools-Pharo' ) ];
		package: 'Sparkle-Services-PharoClient'
		with: [ spec requires: 'Sparkle-Services-Common' ];
		package: 'Sparkle-Services-PharoServer' with: [
			spec requires:
					#( 'Sparkle-Services-Utility-Server'
					   'Sparkle-Services-Common' 'Sparkle-Tools-Pharo' ) ]
]

{ #category : 'baselines' }
BaselineOfSparkle >> stopwatchBaseline: spec [

	spec
		package: 'Sparkle-Stopwatch'
		with: [ spec requires: #( 'Sparkle-Presenters' ) ]
]

{ #category : 'baselines' }
BaselineOfSparkle >> testsBaseline: spec [

	spec
		package: 'Sparkle-Tools-Common-Test'
		with: [
			spec requires: #( 'Sparkle-Tools-Common' 'Sparkle-TestBase-Pharo' ) ];
		package: 'Sparkle-Tools-Pharo-Test'
		with: [ spec requires: 'Sparkle-Tools-Common-Test' ];
		package: 'Sparkle-Presenters-Test' with: [
			spec requires:
					#( 'Sparkle-Presenters' 'Sparkle-Tools-Common-Test' ) ];
		package: 'Sparkle-UiTest' with: [
			spec requires:
					#( 'Sparkle-Presenters' 'Sparkle-Tools-Common-Test' ) ]
]

{ #category : 'baselines' }
BaselineOfSparkle >> tonelBrowserPresentersBaseline: spec [

	spec package: 'Sparkle-TonelBrowser-Presenters' with: [
		spec requires:
			#( 'Sparkle-Spextensions' 'Sparkle-TonelBrowser-Services-PharoClient' ) ]
]

{ #category : 'baselines' }
BaselineOfSparkle >> tonelBrowserServicesBaseline: spec [

	spec
		package: 'Sparkle-TonelBrowser-Services-Common'
		with: [ spec requires: 'RemoteServiceReplication' ];
		package: 'Sparkle-TonelBrowser-Services-PharoClient' with: [
			spec requires:
					#( 'Sparkle-Services-PharoClient' 'Sparkle-TonelBrowser-Services-Common' ) ];
		package: 'Sparkle-TonelBrowser-Services-PharoServer' with: [
			spec requires:
					#( 'Sparkle-Services-Utility-Server'
					   'Sparkle-Services-Common' 'Sparkle-TonelBrowser-Services-Common'
					   'Sparkle-TonelBrowser-Tools' ) ]
]

{ #category : 'baselines' }
BaselineOfSparkle >> tonelBrowserToolsBaseline: spec [

	spec
		package: 'Sparkle-TonelBrowser-Tools'
		with: [ spec requires: 'Sparkle-Tools-Common' ]
]

{ #category : 'private' }
BaselineOfSparkle >> tonelUrl [

	^ self urlForProject: 'TonelReadWrite'
]

{ #category : 'baselines' }
BaselineOfSparkle >> toolsBaseline: spec [

	spec
		package: 'Sparkle-Tools-Common';
		package: 'Sparkle-Tools-Pharo'
		with: [ spec requires: 'Sparkle-Tools-Common' ]
]

{ #category : 'private' }
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
