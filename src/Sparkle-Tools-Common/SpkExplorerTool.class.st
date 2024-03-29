"
An ExplorerTool handles the server-side coordination of a grouping of other tools into an ""explorer.""
An explorer might be a single window at the GUI level, but the tools layer doesn't really know about that. An ExplorerTool keeps a layout, which could be used by a presentation layer to lay out an explorer window, but that's the business of the presentation layer. To the ExplorerTool, a layout is just some obscure data that it remembers without knowing its meaning. The main reason for the tool layer to have any knowledge of layout is to allow layouts to be persisted.
 
Internal Representation and Key Implementation Points.

    Instance Variables
-	layout:		<Object>
-	panes:		<Set of tools>


    Implementation Points
"
Class {
	#name : 'SpkExplorerTool',
	#superclass : 'SpkToolWithUndoManager',
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'instance creation' }
SpkExplorerTool >> newInspectorToolOn: anObject [
	^ (SpkInspectorTool newInExplorer: self)
		inspectedObject: anObject;
		yourself
]
