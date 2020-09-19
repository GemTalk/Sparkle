"
A service to coordinate a workspace. A workspace is displayed on the Pharo client as a window with panes in columns.
The workspace service generally stays out of operations that only concern a single pane. 
It is concerned with operations that affect the workspace as a whole. This includes
* The creation and deletion of pane services (such as inspectors)
* Undo and redo operations. Although a single undo or redo operation typically affects only a single pane, there is one sequence of user operations that can be undone or redone for the entire workspace.

Internal Representation and Key Implementation Points.

Instance Variables
* layoutService:		<LayoutService> Theoretical at this point, records what columns and positions the panes are, for sharing or continuing a development session.
* paneServices:		<Set of pane services> What panes are in the workspace at this point


    Implementation Points
"
Class {
	#name : 'SpkWorkspaceService',
	#superclass : 'RsrService',
	#instVars : [
		'paneServices',
		'layoutService'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'accessing' }
SpkWorkspaceService class >> templateClassName [

	^ #SpkWorkspaceService
]
