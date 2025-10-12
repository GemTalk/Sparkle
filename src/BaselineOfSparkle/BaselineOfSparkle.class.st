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
			tonelBrowserToolsBaseline: spec ]
]

{ #category : 'baselines' }
BaselineOfSparkle >> baselineOLD: spec [

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
			package: 'Sparkle-TonelBrowser-Services-PharoClient'
			with: [ spec requires: 'RemoteServiceReplication' ];
			package: 'Sparkle-Services-PharoServer'
			with: [
				spec requires:
						#( 'Sparkle-Services-Common' 'Sparkle-Tools-Pharo' ) ];
			package: 'Sparkle-TonelBrowser-Services-PharoServer'
			with: [
				spec requires:
						#( 'Sparkle-TonelBrowser-Services-Common' 'Sparkle-TonelBrwoser-Tools' ) ];
			package: 'Sparkle-Presenters' with: [
				spec requires:
						#( 'Sparkle-Spextensions' 'Sparkle-Services-PharoClient'
						   'PharoGemStoneFFI' ) ];
			package: 'Sparkle-TonelBrowser-Presenters' with: [
				spec requires:
						#( 'Sparkle-Spextensions' 'Sparkle-TonelBrowser-Services-PharoClient' ) ];
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
			with: [ spec repository: self ffiUrl ].
		spec
			baseline: 'TonelReadWrite'
			with: [ spec repository: self tonelUrl ] ]
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
		package: 'Sparkle-TestBase-Pharo';
		package: 'Sparkle-Application'
		with: [ spec requires: 'Sparkle-Presenters' ];
		package: 'Sparkle-Spextensions'
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
		package: 'Sparkle-Services-Common'
		with: [ spec requires: 'RemoteServiceReplication' ];
		package: 'Sparkle-Services-PharoClient'
		with: [ spec requires: 'Sparkle-Services-Common' ];
		package: 'Sparkle-Services-PharoServer'
		with: [
			spec requires: #( 'Sparkle-Services-Common'
				   'Sparkle-Tools-Pharo' ) ]
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
		package: 'Sparkle-TonelBrowser-Services-PharoClient'
		with: [ spec requires: 'RemoteServiceReplication' ];
		package: 'Sparkle-TonelBrowser-Services-PharoServer' with: [
			spec requires: #( 'Sparkle-TonelBrowser-Services-Common'
					   'Sparkle-TonelBrowser-Tools' ) ]
]

{ #category : 'baselines' }
BaselineOfSparkle >> tonelBrowserToolsBaseline: spec [

	spec package: 'Sparkle-TonelBrowser-Tools'
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
