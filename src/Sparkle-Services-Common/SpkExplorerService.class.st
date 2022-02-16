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
	#category : 'Sparkle-Services-Common'
}

{ #category : 'accessing' }
SpkExplorerService class >> templateClassName [

	^ #SpkExplorerService
]
