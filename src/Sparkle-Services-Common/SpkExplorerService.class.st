"
A service to coordinate a Sparkle explorer. An explorer is displayed on the Pharo client as a window with panes in columns.
The explorer service generally stays out of operations that only concern a single pane. 
It is concerned with operations that affect the workspace as a whole. This includes
* The creation and deletion of pane services (such as inspectors)
* Undo and redo operations. Although a single undo or redo operation typically affects only a single pane, there is one sequence of user operations that can be undone or redone for the entire explorer.

Internal Representation and Key Implementation Points.

Instance Variables
* layoutService:		<LayoutService> Records what columns and positions the panes are, for sharing or continuing a development session.
* paneServices:		<Set of pane services> What panes are in the workspace at this point

"
Class {
	#name : 'SpkExplorerService',
	#superclass : 'RsrService',
	#instVars : [
		'paneServices',
		'layoutService'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'accessing' }
SpkExplorerService class >> templateClassName [

	^ #SpkExplorerService
]

{ #category : 'accessing' }
SpkExplorerService >> addPaneService: aService [

	"The given service should know how to be an explorer pane. Initially, the only 
	pane service is the inspector service."

	paneServices add: aService
]

{ #category : 'initialization' }
SpkExplorerService >> defaultLayout [

	"Server class on server, client on client"

	self subclassResponsibility
]

{ #category : 'initialization' }
SpkExplorerService >> initialize [

	super initialize.
	paneServices := Set new.
	layoutService := self defaultLayout
]

{ #category : 'accessing' }
SpkExplorerService >> layoutService [
	^ layoutService
]

{ #category : 'accessing' }
SpkExplorerService >> layoutService: anObject [
	layoutService := anObject
]

{ #category : 'accessing' }
SpkExplorerService >> paneServices [
	^ paneServices
]

{ #category : 'accessing' }
SpkExplorerService >> removePane: aService [

	"The given service should know how to be an explorer pane. Initially, the only 
	pane service is the inspector service."

	paneServices remove: aService
]
