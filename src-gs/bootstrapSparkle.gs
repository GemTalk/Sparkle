! Copyright (C) GemTalk Systems 1986-2020.  All Rights Reserved.
! Class Declarations
! Generated file, do not Edit

doit
(Announcement
	subclass: 'SpkContentsChangedAnnouncement'
	instVarNames: #( newContents )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Services-Common';
		immediateInvariant.
true.
%

removeallmethods SpkContentsChangedAnnouncement
removeallclassmethods SpkContentsChangedAnnouncement

doit
(Announcement
	subclass: 'SpkNewExplorerToolAnnouncement'
	instVarNames: #( tool )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-Common';
		immediateInvariant.
true.
%

removeallmethods SpkNewExplorerToolAnnouncement
removeallclassmethods SpkNewExplorerToolAnnouncement

doit
(Announcement
	subclass: 'SpkUnsavedChangesAnnouncement'
	instVarNames: #( hasUnsavedChanges )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Services-Common';
		immediateInvariant.
true.
%

removeallmethods SpkUnsavedChangesAnnouncement
removeallclassmethods SpkUnsavedChangesAnnouncement

doit
(nil
	subclass: 'SpkTestSubclassOfNil'
	instVarNames: #( first second )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-Common-Test';
		immediateInvariant.
true.
%

removeallmethods SpkTestSubclassOfNil
removeallclassmethods SpkTestSubclassOfNil

doit
(Object
	subclass: 'SpkObject'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-Common';
		comment: 'This class does nothing in Pharo. 
Sparkle classes that exist in GemStone subclass from this class.
The GemStone version of this class automatically sends #initialize during #new, but that is standard in Pharo, so this class does not have anything to do.';
		immediateInvariant.
true.
%

removeallmethods SpkObject
removeallclassmethods SpkObject

doit
(SpkObject
	subclass: 'SpkAction'
	instVarNames: #( target )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-Common';
		comment: 'Abstract class for undoable/redoable actions

Public API and Key Messages

- performAction -- Do or redo myself
- undoAction -- Undo a performAction
 
Internal Representation and Key Implementation Points.

    Instance Variables
-	target:		<Object> The object upon which I act.
 

    Implementation Points
An Action is created by a Tool, and acts upon a target object designated by that Tool. Actions are expected to be coordinated by an UndoManager, which ensures that the performing and undoing of Actions happens in some sensible order.';
		immediateInvariant.
true.
%

removeallmethods SpkAction
removeallclassmethods SpkAction

doit
(SpkAction
	subclass: 'SpkEvaluatorAction'
	instVarNames: #( newSourceCode oldSourceCode )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-Common';
		comment: 'Abstract.
An action performed for and upon an evaluator in an inspector tool.
 
Internal Representation and Key Implementation Points.

    Instance Variables
-	newSourceCode:		<String> The code that, at the time of my creation, matches the code that the user sees in the GUI.
-	oldSourceCode:		<String> The code that, at the time of my creation, is the code most recently accepted. If no code has yet been accepted in this evaluator, this is the empty string.
';
		immediateInvariant.
true.
%

removeallmethods SpkEvaluatorAction
removeallclassmethods SpkEvaluatorAction

doit
(SpkEvaluatorAction
	subclass: 'SpkEvaluatorAcceptAction'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-Common';
		comment: 'An action for evaluating my newSourceCode, at which point my oldSourceCode becomes equal to the newSourceCode.

To undo, we can''t actually undo the evaluation, but we can (and do) restore the oldSourceCode.';
		immediateInvariant.
true.
%

removeallmethods SpkEvaluatorAcceptAction
removeallclassmethods SpkEvaluatorAcceptAction

doit
(SpkEvaluatorAction
	subclass: 'SpkEvaluatorCancelAction'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-Common';
		comment: 'An action to discard the newSourceCode being edited and make it equal to the oldSourceCode.

Undo restores the newSourceCode that was discarded.';
		immediateInvariant.
true.
%

removeallmethods SpkEvaluatorCancelAction
removeallclassmethods SpkEvaluatorCancelAction

doit
(SpkObject
	subclass: 'SpkReflection'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-GemStone';
		comment: 'Object reflection services for debugging tools,
with a common interface across GemStone and Pharo.';
		immediateInvariant.
true.
%

removeallmethods SpkReflection
removeallclassmethods SpkReflection

doit
(SpkObject
	subclass: 'SpkSmallStack'
	instVarNames: #( elements limit )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-Common';
		comment: 'A stack of limited size. When the stack is full, pushing an element will discard the bottom-most stack element.

Designed to hold actions for an undo manager.

 
Internal Representation and Key Implementation Points.

    **Instance Variables**
*	elements:		<OrderedCollection> The elements on the stack. The last element is the top element.
*	limit:		<Integer> How many elements are allowed to accumulate on the stack before the deepest item is discarded.
';
		immediateInvariant.
true.
%

removeallmethods SpkSmallStack
removeallclassmethods SpkSmallStack

doit
(SpkObject
	subclass: 'SpkTestClassWithInfinitePrintOn'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-Common-Test';
		immediateInvariant.
true.
%

removeallmethods SpkTestClassWithInfinitePrintOn
removeallclassmethods SpkTestClassWithInfinitePrintOn

doit
(SpkObject
	indexableSubclass: 'SpkTestClassWithNamedAndIndexedInstvars'
	instVarNames: #( first second third )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-Common-Test';
		immediateInvariant.
true.
%

removeallmethods SpkTestClassWithNamedAndIndexedInstvars
removeallclassmethods SpkTestClassWithNamedAndIndexedInstvars

doit
(SpkObject
	subclass: 'SpkTestUndoableAction'
	instVarNames: #( isDone )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-Common-Test';
		comment: 'A dummy action for tests that just knows whether it''s been done or not.
Used by the UndoManagerTest.';
		immediateInvariant.
true.
%

removeallmethods SpkTestUndoableAction
removeallclassmethods SpkTestUndoableAction

doit
(SpkObject
	subclass: 'SpkTool'
	instVarNames: #( announcer )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-Common';
		comment: 'General services needed by tool objects.';
		immediateInvariant.
true.
%

removeallmethods SpkTool
removeallclassmethods SpkTool

doit
(SpkTool
	subclass: 'SpkColumnLayoutTool'
	instVarNames: #( relativeWidth paneLayouts )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-Common';
		immediateInvariant.
true.
%

removeallmethods SpkColumnLayoutTool
removeallclassmethods SpkColumnLayoutTool

doit
(SpkTool
	subclass: 'SpkCompilationErrorTool'
	instVarNames: #( sourceCode errorMessage errorLocation )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-Common';
		immediateInvariant.
true.
%

removeallmethods SpkCompilationErrorTool
removeallclassmethods SpkCompilationErrorTool

doit
(SpkTool
	subclass: 'SpkDebuggerFrameTool'
	instVarNames: #( explorerTool process level frameContents description index )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-GemStone';
		comment: 'I represent and manipulate a single stack frame within a GsProcess (#process)
#level is my position in the stack using the GsProcess numbering system, where level 1 is the top frame of the stack.
#index is my position in the Sparkle numbering system, where index 1 is the *bottom* frame of the stack.
The Sparkle numbering system allows my index to stay the same during stepping, when the number of frames above me may change, changing my #level.';
		immediateInvariant.
true.
%

removeallmethods SpkDebuggerFrameTool
removeallclassmethods SpkDebuggerFrameTool

doit
(SpkTool
	subclass: 'SpkDebuggerTool'
	instVarNames: #( explorerTool process exception frames debugActionForContinue )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-GemStone';
		immediateInvariant.
true.
%

removeallmethods SpkDebuggerTool
removeallclassmethods SpkDebuggerTool

doit
(SpkTool
	subclass: 'SpkEvaluatorTool'
	instVarNames: #( explorerTool inspectorTool oldSourceCode newSourceCode )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-Common';
		immediateInvariant.
true.
%

removeallmethods SpkEvaluatorTool
removeallclassmethods SpkEvaluatorTool

doit
(SpkTool
	subclass: 'SpkExplorerLayoutTool'
	instVarNames: #( width height columnLayouts explorerTool )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-Common';
		immediateInvariant.
true.
%

removeallmethods SpkExplorerLayoutTool
removeallclassmethods SpkExplorerLayoutTool

doit
(SpkTool
	subclass: 'SpkInspectionTool'
	instVarNames: #( explorerTool inspectedObject )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-Common';
		immediateInvariant.
true.
%

removeallmethods SpkInspectionTool
removeallclassmethods SpkInspectionTool

doit
(SpkInspectionTool
	subclass: 'SpkInspectorFieldTool'
	instVarNames: #( name index )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-Common';
		comment: 'Abstract. 
I am a tool providing information about and the ability to manipulate one "field" of an object being inspected.
A field is some bit of information about the object. In the raw view this means an instance variable, named or indexed. In other views it might mean some other piece of information, such as an element of a Set. My subclasses handle the details.
 
Internal Representation and Key Implementation Points.

    **Instance Variables**
-	index:					<Integer> One-based index into named instvars, indexed instvars, or other elements depending on subclass.
-	inspectorTool:		<SpkInspectorTool> The inspector tool that I serve, and which refers to the object being inspected.
-	name:		<String>	The name of the field. Indexed instvars are named like the strings ''1'', ''2'', etc.
-	selfDescription:		<String>	The result of sending #printOn: to the value of the field. Empty string if #printOn: is not understood.
-	value:		<Object>	The actual object referred to by this field in the object under inspection.


    Implementation Points';
		immediateInvariant.
true.
%

removeallmethods SpkInspectorFieldTool
removeallclassmethods SpkInspectorFieldTool

doit
(SpkInspectionTool
	subclass: 'SpkInspectorTool'
	instVarNames: #( fieldTools evaluatorTools )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-Common';
		comment: 'I inspect a single object.
I''m the Tool layer counterpart of an inspector pane in the presentation layer.
 
Internal Representation and Key Implementation Points.

**Instance Variables**
- explorerTool	<SpkExplorerTool>	The tool that handles undo/redo for me.
- fieldTools		<OrderedCollection of SpkInspectorFieldTool>	One per field of the inspected object
- inspectedObject	<any object>		The actual object being inspected.

    Implementation Points
- My inspectedObject may be anything, even a subclass of nil that understands no messages at all. I use reflection primitives wherever possible, to avoid sending messages to the inspected object. Operations that require sending a message to the object are only performed if the object understands that message.
';
		immediateInvariant.
true.
%

removeallmethods SpkInspectorTool
removeallclassmethods SpkInspectorTool

doit
(SpkTool
	subclass: 'SpkPaneLayoutTool'
	instVarNames: #( relativeHeight paneCoordinate paneTool )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-Common';
		immediateInvariant.
true.
%

removeallmethods SpkPaneLayoutTool
removeallclassmethods SpkPaneLayoutTool

doit
(SpkTool
	subclass: 'SpkRuntimeErrorTool'
	instVarNames: #( stack title )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-Common';
		immediateInvariant.
true.
%

removeallmethods SpkRuntimeErrorTool
removeallclassmethods SpkRuntimeErrorTool

doit
(SpkTool
	subclass: 'SpkTaskspaceLayoutTool'
	instVarNames: #( explorerLayouts taskspaceTool )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-Common';
		immediateInvariant.
true.
%

removeallmethods SpkTaskspaceLayoutTool
removeallclassmethods SpkTaskspaceLayoutTool

doit
(SpkTool
	subclass: 'SpkToolWithUndoManager'
	instVarNames: #( undoManager )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-Common';
		immediateInvariant.
true.
%

removeallmethods SpkToolWithUndoManager
removeallclassmethods SpkToolWithUndoManager

doit
(SpkToolWithUndoManager
	subclass: 'SpkExplorerTool'
	instVarNames: #( panes )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-Common';
		comment: 'An ExplorerTool handles the server-side coordination of a grouping of other tools into an "explorer."
An explorer might be a single window at the GUI level, but the tools layer doesn''t really know about that. An ExplorerTool keeps a layout, which could be used by a presentation layer to lay out an explorer window, but that''s the business of the presentation layer. To the ExplorerTool, a layout is just some obscure data that it remembers without knowing its meaning. The main reason for the tool layer to have any knowledge of layout is to allow layouts to be persisted.
 
Internal Representation and Key Implementation Points.

    Instance Variables
-	layout:		<Object>
-	panes:		<Set of tools>


    Implementation Points';
		immediateInvariant.
true.
%

removeallmethods SpkExplorerTool
removeallclassmethods SpkExplorerTool

doit
(SpkToolWithUndoManager
	subclass: 'SpkTaskspaceTool'
	instVarNames: #( name explorerTools )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-Common';
		comment: 'A taskspace consists of some number of explorer windows containing some number of panes.

The TaskspaceTool''s responsibility is keeping track of what explorers there are.

Its undo and redo operations have to do with the addition and removal of explorer tools.

A TaskspaceTool can be persistent, and can be named. If named, it can be recalled by name upon login.

Internal Representation and Key Implementation Points.

    Instance Variables
-	explorerTools:		<Set of SpkExplorerTool>
-	name: 					<String> The name by which this taskspace can be looked up.


    Implementation Points';
		immediateInvariant.
true.
%

removeallmethods SpkTaskspaceTool
removeallclassmethods SpkTaskspaceTool

doit
(SpkObject
	subclass: 'SpkUndoManager'
	instVarNames: #( undo redo )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-Common';
		comment: 'Controls undo/redo for a Tool.

Public API and Key Messages

- create instances by sending #withLimit: 
- hasUndoableAction -- true if undo stack not empty
- hasRedoableAction -- true if the redo stack not empty
- performAction: anAction -- perform the action and push it on the undo stack.
- undo -- pop an action from the undo stack, undo it, and push it on the redo stack. 
- redo -- pop an action from the redo stack, perform it, and push it on the undo stack.

if hasRedoableAction, redo the action on top of the redo stack and push it on
   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    **Instance Variables**
-	redo:		<SpkSmallStack> Actions that have been undone and are available to be redone
-	undo:		<SpkSmallStack> Actions that have been done or redone and are available to be undone


    Implementation Points';
		immediateInvariant.
true.
%

removeallmethods SpkUndoManager
removeallclassmethods SpkUndoManager

doit
(RsrService
	subclass: 'SpkColumnLayoutService'
	instVarNames: #( relativeWidth paneLayouts )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Services-Common';
		comment: 'I represent the layout of a column within an SpkExplorer window, in a way that can be transmitted to and from the server independently of the pane services themselves, since the pane services must know nothing of the UI they live to serve.
 
**Internal Representation and Key Implementation Points.**

**Instance Variables**
* paneLayouts:			<OrderedCollection of SpkPaneLayoutService> Layout of the panes in the column
* relativeWidth:		<Number>	A positive number indicating the width of the column. See below.


**Implementation Points**

The relative width, together with the relative widths of the other columns in this window, can be used to calculate the actual width of this columns and the actual height of panes. These numbers are not in any unit, but are relative to each other. For example, if column A has a relativeWidth of 13, and column B has a relativeWidth of 24, column B will be slightly less than twice as wide as column A.
An individual column will have the pixel width 
`relativeWidth * (windowWidth / <sumOfAllColumnRelativeWidths>)`';
		immediateInvariant.
true.
%

removeallmethods SpkColumnLayoutService
removeallclassmethods SpkColumnLayoutService

doit
(SpkColumnLayoutService
	subclass: 'SpkColumnLayoutServiceServer'
	instVarNames: #( tool )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Services-Common';
		immediateInvariant.
true.
%

removeallmethods SpkColumnLayoutServiceServer
removeallclassmethods SpkColumnLayoutServiceServer

doit
(RsrService
	subclass: 'SpkCompilationErrorService'
	instVarNames: #( sourceCode errorMessage errorLocation )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Services-Common';
		immediateInvariant.
true.
%

removeallmethods SpkCompilationErrorService
removeallclassmethods SpkCompilationErrorService

doit
(SpkCompilationErrorService
	subclass: 'SpkCompilationErrorServiceServer'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Services-Common';
		immediateInvariant.
true.
%

removeallmethods SpkCompilationErrorServiceServer
removeallclassmethods SpkCompilationErrorServiceServer

doit
(RsrService
	subclass: 'SpkDebuggerFrameService'
	instVarNames: #( description source currentStartPosition currentEndPosition localVariables )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Services-Common';
		immediateInvariant.
true.
%

removeallmethods SpkDebuggerFrameService
removeallclassmethods SpkDebuggerFrameService

doit
(SpkDebuggerFrameService
	subclass: 'SpkDebuggerFrameServiceServer'
	instVarNames: #( tool )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Services-Common';
		immediateInvariant.
true.
%

removeallmethods SpkDebuggerFrameServiceServer
removeallclassmethods SpkDebuggerFrameServiceServer

doit
(RsrService
	subclass: 'SpkDebuggerService'
	instVarNames: #( processName processIdentifier processPriority exceptionDescription frames )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Services-Common';
		immediateInvariant.
true.
%

removeallmethods SpkDebuggerService
removeallclassmethods SpkDebuggerService

doit
(SpkDebuggerService
	subclass: 'SpkDebuggerServiceServer'
	instVarNames: #( tool )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Services-Common';
		immediateInvariant.
true.
%

removeallmethods SpkDebuggerServiceServer
removeallclassmethods SpkDebuggerServiceServer

doit
(RsrService
	subclass: 'SpkExplorerLayoutService'
	instVarNames: #( explorerService width height columnLayouts )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Services-Common';
		comment: 'I represent the layout of an SpkExplorer window, in a way that can be transmitted to and from the server independently of the pane services themselves, since the pane services must know nothing of the UI they live to serve.
 
Internal Representation and Key Implementation Points.

**Instance Variables**
* columnLayouts:		<OrderedCollection of SpkColumnLayoutService> Layouts of the columns in the window
* height:		<Number>	Height in pixels of the explorer window 
* width:		<Number>	Width in pixels of the explorer window


**Implementation Points**

';
		immediateInvariant.
true.
%

removeallmethods SpkExplorerLayoutService
removeallclassmethods SpkExplorerLayoutService

doit
(SpkExplorerLayoutService
	subclass: 'SpkExplorerLayoutServiceServer'
	instVarNames: #( tool )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Services-Common';
		immediateInvariant.
true.
%

removeallmethods SpkExplorerLayoutServiceServer
removeallclassmethods SpkExplorerLayoutServiceServer

doit
(RsrService
	subclass: 'SpkExplorerService'
	instVarNames: #( paneServices layoutService )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Services-Common';
		comment: 'A service to coordinate a Sparkle explorer. An explorer is displayed on the Pharo client as a window with panes in columns.
The explorer service generally stays out of operations that only concern a single pane. 
It is concerned with operations that affect the workspace as a whole. This includes
* The creation and deletion of pane services (such as inspectors)
* Undo and redo operations. Although a single undo or redo operation typically affects only a single pane, there is one sequence of user operations that can be undone or redone for the entire explorer.

Internal Representation and Key Implementation Points.

Instance Variables
* layoutService:		<LayoutService> Records what columns and positions the panes are, for sharing or continuing a development session.
* paneServices:		<Set of pane services> What panes are in the workspace at this point
';
		immediateInvariant.
true.
%

removeallmethods SpkExplorerService
removeallclassmethods SpkExplorerService

doit
(SpkExplorerService
	subclass: 'SpkExplorerServiceServer'
	instVarNames: #( tool )
	classVars: #(  )
	classInstVars: #( serviceClassesForToolTypes )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Services-Common';
		immediateInvariant.
true.
%

removeallmethods SpkExplorerServiceServer
removeallclassmethods SpkExplorerServiceServer

doit
(RsrService
	subclass: 'SpkInspectorService'
	instVarNames: #( oop classMembershipDescription selfDescription fields evaluators )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Services-Common';
		comment: 'A service for inspecting one GemStone object.

Instance Variables
*	oop:		<Integer> The GemStone object ID of the object being inspected (in GemStone, an oop is a unique ID, unlike an identity hash)
*	classMambershipDescription	<String> For an instance of Date, ''a Date''. For the class Date, ''Date''. For the metaclass, ''Date class''.
*	selfDescription		<String> How the object describes itself; the result of a #printOn: of the object being inspected.
*  fields				<OrderedCollection of SpkInspectorFielsService> Names and description of each of the object''s fields.
*  evaluators: 		<OrderedCollection of SpkEvaluatorService> Any evaluators that are open for this inspector

';
		immediateInvariant.
true.
%

removeallmethods SpkInspectorService
removeallclassmethods SpkInspectorService

doit
(SpkInspectorService
	subclass: 'SpkInspectorServiceServer'
	instVarNames: #( tool )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Services-Common';
		immediateInvariant.
true.
%

removeallmethods SpkInspectorServiceServer
removeallclassmethods SpkInspectorServiceServer

doit
(RsrService
	subclass: 'SpkLinkableSubService'
	instVarNames: #( parentService linkedService )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Services-Common';
		comment: 'Abstract. My subclasses represent parts of a larger service, and can have a service linked to them
 
Internal Representation and Key Implementation Points.

    Instance Variables
*	linkedService:		<Object>
*	parentService:		<Object>


    Implementation Points';
		immediateInvariant.
true.
%

removeallmethods SpkLinkableSubService
removeallclassmethods SpkLinkableSubService

doit
(SpkLinkableSubService
	subclass: 'SpkCodeEditorService'
	instVarNames: #( oldSourceCode newSourceCode )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Services-Common';
		comment: 'Abstract. A service for editing code. Notable concrete subclasses edit workspace code (no method pattern) or methods (with method pattern).

    Instance Variables
	savedSource:		<String> The version of the source code previously accepted
	unsavedSource:		<String> Source code as it currently exists in the editor, accepted or not.


    Implementation Points

	We keep both saved and unsaved source so we can tell whether there are unsaved 
	changes through a simple comparison of these two strings.
	
	Saves and cancels are undo-able through the tool.';
		immediateInvariant.
true.
%

removeallmethods SpkCodeEditorService
removeallclassmethods SpkCodeEditorService

doit
(SpkCodeEditorService
	subclass: 'SpkEvaluatorService'
	instVarNames: #( evaluationContext )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Services-Common';
		comment: 'I''m an RSR service template for code evaluation.

unsavedSource  <String> Source code being edited that will, if accepted, be evaluated.

savedSource <String> The empty string, or the source code that was most recently attempted to be evaluated. Note that the attempt might have resulted in a syntax or runtime error, nonetheless the source becomes "saved."

evaluationContext <nil or InspectorService> Specifies what object is bound to "self" during evaluation. Instance variables of this object will also be available by name to the source code.';
		immediateInvariant.
true.
%

removeallmethods SpkEvaluatorService
removeallclassmethods SpkEvaluatorService

doit
(SpkEvaluatorService
	subclass: 'SpkEvaluatorServiceServer'
	instVarNames: #( tool )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Services-Common';
		immediateInvariant.
true.
%

removeallmethods SpkEvaluatorServiceServer
removeallclassmethods SpkEvaluatorServiceServer

doit
(SpkLinkableSubService
	subclass: 'SpkDebuggerFrameDescriptionService'
	instVarNames: #( description index )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Services-Common';
		immediateInvariant.
true.
%

removeallmethods SpkDebuggerFrameDescriptionService
removeallclassmethods SpkDebuggerFrameDescriptionService

doit
(SpkDebuggerFrameDescriptionService
	subclass: 'SpkDebuggerFrameDescriptionServiceServer'
	instVarNames: #( tool )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Services-Common';
		immediateInvariant.
true.
%

removeallmethods SpkDebuggerFrameDescriptionServiceServer
removeallclassmethods SpkDebuggerFrameDescriptionServiceServer

doit
(SpkLinkableSubService
	subclass: 'SpkInspectorFieldService'
	instVarNames: #( name description )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Services-Common';
		comment: 'Describes one field (named instvar or indexed instvar or some kind of virtual field) of an object being inspected.

Collaborates with SpkInspectorService.

**Internal Representation and Key Implementation Points.**

    Instance Variables
*	description:		<String>
*	name:		<String>
* 	parentService:	<SpkInspectorService>	The inspector service for which I am a field.
*	linkedInspectorService: <nil or SpkInspectorService>	 Inspector for the object referenced by this field, if one has been created.


    Implementation Points

Even when inspecting indexed instvars, name is always a string. Strings like ''1'', ''2'', and so on.';
		immediateInvariant.
true.
%

removeallmethods SpkInspectorFieldService
removeallclassmethods SpkInspectorFieldService

doit
(SpkInspectorFieldService
	subclass: 'SpkInspectorFieldServiceServer'
	instVarNames: #( tool )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Services-Common';
		immediateInvariant.
true.
%

removeallmethods SpkInspectorFieldServiceServer
removeallclassmethods SpkInspectorFieldServiceServer

doit
(RsrService
	subclass: 'SpkPaneLayoutService'
	instVarNames: #( relativeHeight paneCoordinate paneService )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Services-Common';
		comment: 'I represent the layout of a column within an SpkExplorer window, in a way that can be transmitted to and from the server independently of the pane services themselves, since the pane services must know nothing of the UI they live to serve.
 
**Internal Representation and Key Implementation Points**

**Instance Variables**
*	paneCoordinate:		<Array of Number> The vector from an SpkPaneCoordinate
*	paneService:		<RsrService> The service for the pane this layout applies to
*	relativeHeight:		<Number> Relative height of this pane within its column.


**Implementation Points**

See the comment of SpkColumnLayoutService for details of relativeHeight.

';
		immediateInvariant.
true.
%

removeallmethods SpkPaneLayoutService
removeallclassmethods SpkPaneLayoutService

doit
(SpkPaneLayoutService
	subclass: 'SpkPaneLayoutServiceServer'
	instVarNames: #( tool )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Services-Common';
		immediateInvariant.
true.
%

removeallmethods SpkPaneLayoutServiceServer
removeallclassmethods SpkPaneLayoutServiceServer

doit
(RsrService
	subclass: 'SpkRuntimeErrorService'
	instVarNames: #( stack title )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Services-Common';
		immediateInvariant.
true.
%

removeallmethods SpkRuntimeErrorService
removeallclassmethods SpkRuntimeErrorService

doit
(SpkRuntimeErrorService
	subclass: 'SpkRuntimeErrorServiceServer'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Services-Common';
		immediateInvariant.
true.
%

removeallmethods SpkRuntimeErrorServiceServer
removeallclassmethods SpkRuntimeErrorServiceServer

doit
(RsrService
	subclass: 'SpkTaskspaceLayoutService'
	instVarNames: #( taskspaceService explorerLayoutServices )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Services-Common';
		immediateInvariant.
true.
%

removeallmethods SpkTaskspaceLayoutService
removeallclassmethods SpkTaskspaceLayoutService

doit
(SpkTaskspaceLayoutService
	subclass: 'SpkTaskspaceLayoutServiceServer'
	instVarNames: #( tool )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Services-Common';
		immediateInvariant.
true.
%

removeallmethods SpkTaskspaceLayoutServiceServer
removeallclassmethods SpkTaskspaceLayoutServiceServer

doit
(RsrService
	subclass: 'SpkTaskspaceRegistryService'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Services-Common';
		immediateInvariant.
true.
%

removeallmethods SpkTaskspaceRegistryService
removeallclassmethods SpkTaskspaceRegistryService

doit
(SpkTaskspaceRegistryService
	subclass: 'SpkTaskspaceRegistryServiceServer'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Services-Common';
		immediateInvariant.
true.
%

removeallmethods SpkTaskspaceRegistryServiceServer
removeallclassmethods SpkTaskspaceRegistryServiceServer

doit
(RsrService
	subclass: 'SpkTaskspaceService'
	instVarNames: #( explorers )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Services-Common';
		comment: 'This is the RSR taskspace service. On the GemStone server, it interacts with a taskspace tool.

A Sparkle taskspace is where a developer works. A taskspace:

* Keeps track of some number of explorer windows
* When active (logged in) occupies one gem, and has exclusive use of that gem.
* May be persisted so a that a developer can log out of a taskspace, then later log back in and find things where they were left.


Typically:
* A taskspace is not shared between developers, unless they are pair programming in real time.
* Each developer has only one taskspace for each project they are working on.';
		immediateInvariant.
true.
%

removeallmethods SpkTaskspaceService
removeallclassmethods SpkTaskspaceService

doit
(SpkTaskspaceService
	subclass: 'SpkTaskspaceServiceServer'
	instVarNames: #( tool )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Services-Common';
		immediateInvariant.
true.
%

removeallmethods SpkTaskspaceServiceServer
removeallclassmethods SpkTaskspaceServiceServer

doit
(RsrTestCase
	subclass: 'SpkLimitedWriteStreamTest'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-GemStone-Test';
		immediateInvariant.
true.
%

removeallmethods SpkLimitedWriteStreamTest
removeallclassmethods SpkLimitedWriteStreamTest

doit
(TestCase
	subclass: 'SpkEvaluationTest'
	instVarNames: #( inspectorTool evaluatorTool )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-GemStone-Test';
		immediateInvariant.
true.
%

removeallmethods SpkEvaluationTest
removeallclassmethods SpkEvaluationTest

doit
(SpkEvaluationTest
	subclass: 'SpkDebuggerServiceTest'
	instVarNames: #( debuggerService )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-GemStone-Test';
		immediateInvariant.
true.
%

removeallmethods SpkDebuggerServiceTest
removeallclassmethods SpkDebuggerServiceTest

doit
(SpkEvaluationTest
	subclass: 'SpkDebuggerToolTest'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-GemStone-Test';
		immediateInvariant.
true.
%

removeallmethods SpkDebuggerToolTest
removeallclassmethods SpkDebuggerToolTest

doit
(SpkEvaluationTest
	subclass: 'SpkEvaluatorToolTest'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-GemStone-Test';
		immediateInvariant.
true.
%

removeallmethods SpkEvaluatorToolTest
removeallclassmethods SpkEvaluatorToolTest

doit
(TestCase
	subclass: 'SpkInspectorToolTest'
	instVarNames: #( tool )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-GemStone-Test';
		immediateInvariant.
true.
%

removeallmethods SpkInspectorToolTest
removeallclassmethods SpkInspectorToolTest

doit
(TestCase
	subclass: 'SpkServiceServerTest'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-GemStone-Test';
		comment: 'Tests to test server-side services (and sometimes their underlying tools) on the server, without needing an RSR connection';
		immediateInvariant.
true.
%

removeallmethods SpkServiceServerTest
removeallclassmethods SpkServiceServerTest

doit
(TestCase
	subclass: 'SpkSmallStackTest'
	instVarNames: #( stack )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-Common-Test';
		immediateInvariant.
true.
%

removeallmethods SpkSmallStackTest
removeallclassmethods SpkSmallStackTest

doit
(TestCase
	subclass: 'SpkUndoManagerTest'
	instVarNames: #( manager )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-Common-Test';
		immediateInvariant.
true.
%

removeallmethods SpkUndoManagerTest
removeallclassmethods SpkUndoManagerTest

doit
(WriteStreamPortable
	subclass: 'SpkLimitedWriteStream'
	instVarNames: #( limit limitBlock )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-GemStone';
		immediateInvariant.
true.
%

removeallmethods SpkLimitedWriteStream
removeallclassmethods SpkLimitedWriteStream

! Class implementation for 'SpkContentsChangedAnnouncement'

!		Instance methods for 'SpkContentsChangedAnnouncement'

category: 'accessing'
method: SpkContentsChangedAnnouncement
newContents
	^ newContents
%

category: 'accessing'
method: SpkContentsChangedAnnouncement
newContents: anObject
	newContents := anObject
%

! Class implementation for 'SpkNewExplorerToolAnnouncement'

!		Instance methods for 'SpkNewExplorerToolAnnouncement'

category: 'accessing'
method: SpkNewExplorerToolAnnouncement
tool

	^ tool
%

category: 'accessing'
method: SpkNewExplorerToolAnnouncement
tool: anObject

	tool := anObject
%

! Class implementation for 'SpkUnsavedChangesAnnouncement'

!		Class methods for 'SpkUnsavedChangesAnnouncement'

category: 'testing'
classmethod: SpkUnsavedChangesAnnouncement
hasUnsavedChanges: aBoolean

	^ self new
		  hasUnsavedChanges: aBoolean;
		  yourself
%

!		Instance methods for 'SpkUnsavedChangesAnnouncement'

category: 'accessing'
method: SpkUnsavedChangesAnnouncement
hasUnsavedChanges
	^ hasUnsavedChanges
%

category: 'accessing'
method: SpkUnsavedChangesAnnouncement
hasUnsavedChanges: anObject
	hasUnsavedChanges := anObject
%

! Class implementation for 'SpkAction'

!		Class methods for 'SpkAction'

category: 'instance creation'
classmethod: SpkAction
forTarget: targetObject

	^ self new
		  target: targetObject;
		  yourself
%

!		Instance methods for 'SpkAction'

category: 'public'
method: SpkAction
performAction

	self subclassResponsibility
%

category: 'accessing'
method: SpkAction
target: anObject

	target := anObject
%

category: 'public'
method: SpkAction
undoAction
	self subclassResponsibility 
%

! Class implementation for 'SpkEvaluatorAction'

!		Instance methods for 'SpkEvaluatorAction'

category: 'accessing'
method: SpkEvaluatorAction
newSourceCode: anObject

	newSourceCode := anObject
%

category: 'accessing'
method: SpkEvaluatorAction
oldSourceCode: anObject

	oldSourceCode := anObject
%

! Class implementation for 'SpkEvaluatorAcceptAction'

!		Instance methods for 'SpkEvaluatorAcceptAction'

category: 'public'
method: SpkEvaluatorAcceptAction
performAction

	"Accepting makes the tool's oldSourceCode and newSourceCode the same."

	target oldSourceCode: newSourceCode.
	^ target evaluateCode
%

category: 'public'
method: SpkEvaluatorAcceptAction
undoAction
	"Cannot undo the actual execution, but can restore the code"

	target oldSourceCode: oldSourceCode.
	^ nil
%

! Class implementation for 'SpkEvaluatorCancelAction'

!		Instance methods for 'SpkEvaluatorCancelAction'

category: 'public'
method: SpkEvaluatorCancelAction
performAction

	"Canceling throws away the tool's newSourceCode, making it equal to the oldSourceCode."

	target newSourceCode: oldSourceCode.
	^ nil
%

category: 'public'
method: SpkEvaluatorCancelAction
undoAction

	"Undoing a canceling restores the newSourceCode"

	target newSourceCode: newSourceCode.
	^ nil
%

! Class implementation for 'SpkReflection'

!		Class methods for 'SpkReflection'

category: 'messaging'
classmethod: SpkReflection
carefullySend: aSelector withArguments: argArray to: anObject ifNotUnderstood: aBlock
	| class |
	class := self classOf: anObject.
	^ ((class canUnderstand: aSelector)
		and: [ class canUnderstand: #'perform:withArguments:' ])
		ifTrue: [ anObject perform: aSelector withArguments: argArray ]
		ifFalse: aBlock
%

category: 'querying'
classmethod: SpkReflection
classOf: anObject
	^ Reflection classOf: anObject
%

category: 'reading'
classmethod: SpkReflection
fetchIndexedInstvarAt: index from: anObject
	^ Reflection fetchFrom: anObject at: index + (self namedSizeOf: anObject)
%

category: 'reading'
classmethod: SpkReflection
fetchNamedInstvarAt: index from: anObject
	^ Reflection fetchFrom: anObject at: index
%

category: 'querying'
classmethod: SpkReflection
identifierOf: anObject
	"In GemStone, identifier is the oop, and it is unique."

	^ Reflection oopOf: anObject
%

category: 'querying'
classmethod: SpkReflection
indexedSizeOf: anObject
	^ (Reflection sizeOf: anObject) - (self namedSizeOf: anObject)
%

category: 'querying'
classmethod: SpkReflection
isNonMetaclass: anObject
	"An object is a non-meta iff its class is a metaclass."

	| class |
	class := self classOf: anObject.
	^ class isMeta
%

category: 'querying'
classmethod: SpkReflection
namedSizeOf: anObject
	^ Reflection namedSizeOf: anObject
%

! Class implementation for 'SpkSmallStack'

!		Class methods for 'SpkSmallStack'

category: 'instance creation'
classmethod: SpkSmallStack
defaultLimit
	^ 20
%

category: 'instance creation'
classmethod: SpkSmallStack
new
	^ self basicNew
		initializeForLimit: self defaultLimit;
		yourself
%

!		Instance methods for 'SpkSmallStack'

category: 'accessing'
method: SpkSmallStack
clear
	"GemStone does not implement #removeAll"

	elements removeAllSuchThat: [ :element | true ]
%

category: 'accessing'
method: SpkSmallStack
collect: aBlock
	^ elements reverse collect: aBlock
%

category: 'private'
method: SpkSmallStack
enforceLimit
	[ elements size > limit ] whileTrue: [ elements removeFirst ]
%

category: 'initialization'
method: SpkSmallStack
initializeForLimit: maxElements
	limit := maxElements.
	elements := OrderedCollection new: maxElements
%

category: 'testing'
method: SpkSmallStack
isEmpty
	^ elements isEmpty
%

category: 'accessing'
method: SpkSmallStack
limit
	^ limit
%

category: 'accessing'
method: SpkSmallStack
limit: anObject
	limit := anObject.
	self enforceLimit
%

category: 'removing'
method: SpkSmallStack
pop
	^ elements removeLast
%

category: 'adding'
method: SpkSmallStack
push: anObject
	elements addLast: anObject.
	self enforceLimit.
	^ anObject
%

! Class implementation for 'SpkTestClassWithInfinitePrintOn'

!		Instance methods for 'SpkTestClassWithInfinitePrintOn'

category: 'printing'
method: SpkTestClassWithInfinitePrintOn
printOn: aStream

	[ aStream << 'done yet? ' ] repeat
%

! Class implementation for 'SpkTestUndoableAction'

!		Instance methods for 'SpkTestUndoableAction'

category: 'initialization'
method: SpkTestUndoableAction
initialize

	super initialize.
	isDone := false
%

category: 'accessing'
method: SpkTestUndoableAction
isDone

	^ isDone
%

category: 'public'
method: SpkTestUndoableAction
performAction

	isDone
		ifTrue: [ self error: 'Attempt to perform action already done' ]
		ifFalse: [ isDone := true ].
	^ 42
%

category: 'accessing'
method: SpkTestUndoableAction
undoAction

	isDone
		ifTrue: [ isDone := false ]
		ifFalse: [ self error: 'Attempt to undo action not done' ]
%

! Class implementation for 'SpkTool'

!		Instance methods for 'SpkTool'

category: 'accessing'
method: SpkTool
announce: anAnnouncement

	self announcer announce: anAnnouncement
%

category: 'accessing'
method: SpkTool
announcer

	^ announcer ifNil: [ announcer := Announcer new ]
%

category: 'accessing'
method: SpkTool
unsubscribe: anObject

	self announcer unsubscribe: anObject
%

category: 'accessing'
method: SpkTool
when: anAnnouncementClass send: aSelector to: anObject

	self announcer when: anAnnouncementClass send: aSelector to: anObject
%

! Class implementation for 'SpkColumnLayoutTool'

!		Instance methods for 'SpkColumnLayoutTool'

category: 'adding'
method: SpkColumnLayoutTool
addPaneLayout: aPaneLayoutTool

	paneLayouts add: aPaneLayoutTool
%

category: 'initialization'
method: SpkColumnLayoutTool
initialize

	super initialize.
	paneLayouts := OrderedCollection new.
	relativeWidth := 1
%

category: 'initialization'
method: SpkColumnLayoutTool
initializeFromTool: anExplorerTool

	"Put all of the tool's panes into my column, evenly distributed"

	| panes coordinateInterval thisCoord |
	panes := anExplorerTool panes.
	coordinateInterval := 1.0 / (panes size + 1). "Distance between coordinates"
	thisCoord := 0.0.
	panes do: [ :pane | 
		| paneLayout |
		thisCoord := thisCoord + coordinateInterval.
		paneLayout := SpkPaneLayoutTool new
			              paneTool: pane;
			              relativeHeight: 1;
			              paneCoordinate: { thisCoord };
			              yourself.
		self addPaneLayout: paneLayout ]
%

category: 'accessing'
method: SpkColumnLayoutTool
paneLayouts

	^ paneLayouts
%

category: 'accessing'
method: SpkColumnLayoutTool
paneLayouts: anObject

	paneLayouts := anObject
%

category: 'accessing'
method: SpkColumnLayoutTool
relativeWidth

	^ relativeWidth
%

category: 'accessing'
method: SpkColumnLayoutTool
relativeWidth: anObject

	relativeWidth := anObject
%

! Class implementation for 'SpkCompilationErrorTool'

!		Class methods for 'SpkCompilationErrorTool'

category: 'instance creation'
classmethod: SpkCompilationErrorTool
forException: aSyntaxErrorNotification

	^ self new
		  initializeFrom: aSyntaxErrorNotification;
		  yourself
%

!		Instance methods for 'SpkCompilationErrorTool'

category: 'accessing'
method: SpkCompilationErrorTool
errorLocation

	^ errorLocation
%

category: 'accessing'
method: SpkCompilationErrorTool
errorMessage

	^ errorMessage
%

category: 'accessing'
method: SpkCompilationErrorTool
sourceCode

	^ sourceCode
%

! Class implementation for 'SpkDebuggerFrameTool'

!		Instance methods for 'SpkDebuggerFrameTool'

category: 'private'
method: SpkDebuggerFrameTool
addArgAndTempToolsForIndex: anIndex to: aCollection
	| tool |
	tool := SpkInspectorFieldTool new.
	aCollection add: tool.
	tool
		index: aCollection size;
		name: (self argAndTempNames at: anIndex);
		inspectedObject: (self argAndTempValues at: anIndex)
%

category: 'private'
method: SpkDebuggerFrameTool
addArgAndTempToolsTo: aCollection
	1 to: self firstEvaluationTempIndex - 1 do: [ :anIndex | self addArgAndTempToolsForIndex: anIndex to: aCollection ]
%

category: 'private'
method: SpkDebuggerFrameTool
addEvaluationStackToolsTo: aCollection
	| names values |
	names := self argAndTempNames.
	values := self argAndTempValues.
	names size = values size
		ifFalse: [ self error: 'Name and value size mismatch' ].
	self firstEvaluationTempIndex to: names size do: [ :anIndex | self addArgAndTempToolsForIndex: anIndex to: aCollection ]
%

category: 'private'
method: SpkDebuggerFrameTool
addReceiverToolTo: aCollection
	| tool |
	tool := SpkInspectorFieldTool new.
	aCollection add: tool.
	tool
		index: aCollection size;
		name: 'receiver';
		inspectedObject: self frameReceiver
%

category: 'private'
method: SpkDebuggerFrameTool
argAndTempNames
	^ self frameContents at: 9
%

category: 'private'
method: SpkDebuggerFrameTool
argAndTempValues
	^ self frameContents copyFrom: 11 to: self frameContents size
%

category: 'accessing'
method: SpkDebuggerFrameTool
currentSourceInterval
	| startPos startChar source |
	source := self source.
	startPos := self method _sourceOffsetsAt: self stepPoint.
	startChar := self source at: startPos.	
	"Space for implicit return at end of method."
	startChar = $ 
		ifTrue: [ ^ startPos to: startPos ].	
	"Explicit return"
	startChar = $^
		ifTrue: [ ^ startPos to: startPos ].	
	"Assignment, assume = follows :"
	startChar = $:
		ifTrue: [ ^ startPos to: startPos + 1 ].	
	"Binary selector"
	(self isBinaryCharacter: startChar)
		ifTrue: [ ^ startPos to: (self lastBinaryCharacterIn: source startingAt: startPos) ].
	"Unary or keyword selector"
	(self isKeywordStartCharacter: startChar)
		ifTrue: [ ^ startPos to: (self lastKeywordCharacterIn: source startingAt: startPos) ].
	"Primitive number"
	(self isDecimalDigitCharacter: startChar)
		ifTrue: [ ^ startPos to: (self lastDecimalDigitCharacterIn: source startingAt: startPos) ].
	"Should not get here, but just in case we've missed a possibility..."
	^ startPos to: startPos
%

category: 'accessing'
method: SpkDebuggerFrameTool
description
	^ description ifNil: [ self initializeDescription ]
%

category: 'accessing'
method: SpkDebuggerFrameTool
explorerTool
	^explorerTool
%

category: 'accessing'
method: SpkDebuggerFrameTool
explorerTool: object
	explorerTool := object
%

category: 'private'
method: SpkDebuggerFrameTool
firstEvaluationTempIndex
	"Answer one greater than the number of normal args and temps.
	If there are any evaluation stack temps, this will be the index of the first one."

	| names |
	names := self argAndTempNames.

	1 to: names size do: [ :anIndex | 
		(names at: anIndex) first = $.
			ifTrue: [ ^ anIndex ] ].
	^ names size + 1
%

category: 'private'
method: SpkDebuggerFrameTool
frameContents
	^ frameContents
		ifNil: [ 
			(frameContents := process _frameContentsAt: level)
				ifNil: [ 
					self
						error:
							'Internal error -- nil frame contents for frame ' , level printString ] ]
%

category: 'private'
method: SpkDebuggerFrameTool
frameReceiver
	^ self frameContents at: 10
%

category: 'accessing'
method: SpkDebuggerFrameTool
index
	^index
%

category: 'accessing'
method: SpkDebuggerFrameTool
index: object
	index := object
%

category: 'private'
method: SpkDebuggerFrameTool
initializeDescription
	| meth receiver |
	meth := self method.
	receiver := process _receiverInFrameContents: self frameContents.
	description := meth _descrForStackPadTo: 0 rcvr: receiver.
	^ description
%

category: 'private'
method: SpkDebuggerFrameTool
isBinaryCharacter: aCharacter

	^ '+-\*~<>=|/&@%,?!' includes: aCharacter
%

category: 'private'
method: SpkDebuggerFrameTool
isDecimalDigitCharacter: aCharacter

	^ '0123456789' includes: aCharacter
%

category: 'private'
method: SpkDebuggerFrameTool
isKeywordCharacter: aCharacter
	^ (aCharacter = $: or: [ self isKeywordStartCharacter: aCharacter ])
		or: [ self isDecimalDigitCharacter: aCharacter ]
%

category: 'private'
method: SpkDebuggerFrameTool
isKeywordStartCharacter: aCharacter

	^ '_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz' includes: aCharacter
%

category: 'private'
method: SpkDebuggerFrameTool
lastBinaryCharacterIn: source startingAt: startPos
	"If source at: startPos is not a binary character, startPos - 1 will be returned"

	startPos to: source size do: [ :testPos | 
		(self isBinaryCharacter: (source at: testPos))
			ifFalse: [ ^ testPos - 1 ] ]
%

category: 'private'
method: SpkDebuggerFrameTool
lastDecimalDigitCharacterIn: source startingAt: startPos
	"If source at: startPos is not a numeric character, startPos - 1 will be returned"

	startPos to: source size do: [ :testPos | 
		(self isDecimalDigitCharacter: (source at: testPos))
			ifFalse: [ ^ testPos - 1 ] ]
%

category: 'private'
method: SpkDebuggerFrameTool
lastKeywordCharacterIn: source startingAt: startPos
	"If source at: startPos is not a keyword character, startPos - 1 will be returned"

	startPos to: source size do: [ :testPos | 
		(self isKeywordCharacter: (source at: testPos))
			ifFalse: [ ^ testPos - 1 ] ]
%

category: 'accessing'
method: SpkDebuggerFrameTool
level: anInteger
	level := anInteger
%

category: 'accessing'
method: SpkDebuggerFrameTool
localVariables
	"Answer an OrderedCollection of InspectorFieldTools, one for each local variable.
	Local variables for a method include the receiver (self), the contents of the evaluation stack, 
	formal parameters, and declared temporary variables.
	Local variables for a block differ in that the receiver is the ExecBlock, not self, and include
	any outer scope variables actually referenced by the block. 
	Variables from an outer scope variables that are not referenced by the source code are not
	necessarily visible in a block frame."

	| tools |
	tools := OrderedCollection new.
	self
		addReceiverToolTo: tools;
		addEvaluationStackToolsTo: tools;
		addArgAndTempToolsTo: tools.

	^ tools
%

category: 'private'
method: SpkDebuggerFrameTool
method
	^ process _methodInFrameContents: self frameContents
%

category: 'printing'
method: SpkDebuggerFrameTool
printOn: aStream
	level isNil | process isNil
		ifTrue: [ ^ super printOn: aStream ].
	aStream nextPutAll: self description
%

category: 'accessing'
method: SpkDebuggerFrameTool
process: aProcess
	process := aProcess
%

category: 'accessing'
method: SpkDebuggerFrameTool
source
	"Append a space that can be highlighted when at an implicit return self."

	^ self method sourceString , ' '
%

category: 'accessing'
method: SpkDebuggerFrameTool
stepPoint
	| method |
	method := self method.
	^ method == method homeMethod
		ifTrue: [ process _stepPointAt: level ]
		ifFalse: [ method homeMethod _stepPointForMeth: method ip: (frameContents at: 2) ]
%

! Class implementation for 'SpkDebuggerTool'

!		Instance methods for 'SpkDebuggerTool'

category: 'accessing'
method: SpkDebuggerTool
debugActionForContinue: aBlock
	"I must restore this block as the debugAction of the debugged process before I let it continue.
	Typically this is the same block that caused me to be created."

	debugActionForContinue := aBlock
%

category: 'accessing'
method: SpkDebuggerTool
exception: anException
	"The exception that caused me to be invoked."

	exception := anException
%

category: 'accessing'
method: SpkDebuggerTool
exceptionDescription
	| string |
	string := String new.
	string
		add: exception class name;
		add: self exceptionSpecificMessage.
	^ string
%

category: 'private'
method: SpkDebuggerTool
exceptionSpecificMessage
	| fullMessage commaIndex latterPart |
	fullMessage := exception buildMessageText.
	fullMessage ifNil: [ ^ '' ].
	commaIndex := fullMessage indexOf: $,.
	latterPart := commaIndex = 0
		ifTrue: [ fullMessage ]
		ifFalse: [ fullMessage copyFrom: commaIndex + 1 to: fullMessage size ].
	^ ' - ' , latterPart
%

category: 'accessing'
method: SpkDebuggerTool
explorerTool
	^explorerTool
%

category: 'accessing'
method: SpkDebuggerTool
explorerTool: object
	explorerTool := object
%

category: 'accessing'
method: SpkDebuggerTool
frameAt: anInteger
	^ self frames at: anInteger
%

category: 'accessing'
method: SpkDebuggerTool
frames
	^ frames ifNil: [ self initializeFramesFromProcess ]
%

category: 'initialization'
method: SpkDebuggerTool
initializeFramesFromProcess
	| stackDepth |
	stackDepth := process stackDepth.
	frames := Array new: process stackDepth.
	1 to: stackDepth do: [ :level | 
		| frame index |
		index := stackDepth - level + 1.
		frame := SpkDebuggerFrameTool new.
		frame
			explorerTool: explorerTool;
			process: process;
			level: level;
			index: index.
		frames at: index put: frame ].
	^ frames
%

category: 'accessing'
method: SpkDebuggerTool
process: aProcess
	"The GsProcess that I am to debug."

	process := aProcess
%

category: 'accessing'
method: SpkDebuggerTool
processIdentifier
	^ SpkReflection identifierOf: process
%

category: 'accessing'
method: SpkDebuggerTool
processName
	^ process name
%

category: 'accessing'
method: SpkDebuggerTool
processPriority
	^ process priority
%

! Class implementation for 'SpkEvaluatorTool'

!		Instance methods for 'SpkEvaluatorTool'

category: 'public'
method: SpkEvaluatorTool
accept

	"Evaluate newSourceCode through an undoable action. Answer a new Tool for the result."

	| action resultTool |
	action := SpkEvaluatorAcceptAction new
		          target: self;
		          oldSourceCode: oldSourceCode;
		          newSourceCode: newSourceCode;
		          yourself.
	resultTool := explorerTool performAction: action.
	self flag:
		'Need to make announcement here. All existing inspectors need to check whether their object changed state.'.
	^ resultTool
%

category: 'accessing'
method: SpkEvaluatorTool
evaluateCode
	"Evaluate the newSource and answer an appropriate tool for 
	whatever happens. This can be a syntax error, a runtime error, or an object.
	For an object, answer an InspectorTool on the object."

	| context method |
	context := inspectorTool inspectedObject.

	[ method := self compileNewSourceCodeInContext: context ]
		on: self compilationExceptionClass
		do: [ :ex | ^ self toolForCompilationError: ex ].


	^ self evaluateMethod: method inContext: context
%

category: 'accessing'
method: SpkEvaluatorTool
explorerTool: anObject

	explorerTool := anObject
%

category: 'initialization'
method: SpkEvaluatorTool
initialize

	super initialize.
	oldSourceCode := newSourceCode := ''
%

category: 'accessing'
method: SpkEvaluatorTool
inspectorTool: anObject

	inspectorTool := anObject
%

category: 'accessing'
method: SpkEvaluatorTool
newSourceCode

	^ newSourceCode
%

category: 'accessing'
method: SpkEvaluatorTool
newSourceCode: anObject

	newSourceCode := anObject
%

category: 'accessing'
method: SpkEvaluatorTool
oldSourceCode

	^ oldSourceCode
%

category: 'accessing'
method: SpkEvaluatorTool
oldSourceCode: anObject

	oldSourceCode := anObject
%

category: 'tool creation'
method: SpkEvaluatorTool
toolForCompilationError: aCompilationException

	^ SpkCompilationErrorTool forException: aCompilationException
%

! Class implementation for 'SpkExplorerLayoutTool'

!		Instance methods for 'SpkExplorerLayoutTool'

category: 'adding'
method: SpkExplorerLayoutTool
addColumnLayout: aColumnLayoutTool

	columnLayouts add: aColumnLayoutTool
%

category: 'accessing'
method: SpkExplorerLayoutTool
columnLayouts

	^ columnLayouts
%

category: 'accessing'
method: SpkExplorerLayoutTool
columnLayouts: anObject

	columnLayouts := anObject
%

category: 'accessing'
method: SpkExplorerLayoutTool
explorerTool

	^ explorerTool
%

category: 'accessing'
method: SpkExplorerLayoutTool
height

	^ height
%

category: 'accessing'
method: SpkExplorerLayoutTool
height: anObject

	height := anObject
%

category: 'initialization'
method: SpkExplorerLayoutTool
initialize

	super initialize.
	columnLayouts := OrderedCollection new.
	height := width := 900
%

category: 'initialization'
method: SpkExplorerLayoutTool
initializeForTool: anExplorerTool

	explorerTool := anExplorerTool.
	"Assume a small number of panes (like one for the default) so put them all in one column."
	columnLayouts add: (SpkColumnLayoutTool new
			 initializeFromTool: anExplorerTool;
			 yourself)
%

category: 'removing'
method: SpkExplorerLayoutTool
removeColumnLayout: aColumnLayoutTool

	columnLayouts remove: aColumnLayoutTool
%

category: 'accessing'
method: SpkExplorerLayoutTool
width

	^ width
%

category: 'accessing'
method: SpkExplorerLayoutTool
width: anObject

	width := anObject
%

! Class implementation for 'SpkInspectionTool'

!		Instance methods for 'SpkInspectionTool'

category: 'accessing'
method: SpkInspectionTool
explorerTool
	^explorerTool
%

category: 'accessing'
method: SpkInspectionTool
explorerTool: object
	explorerTool := object
%

category: 'accessing'
method: SpkInspectionTool
inspectedObject
	^inspectedObject
%

category: 'accessing'
method: SpkInspectionTool
inspectedObject: object
	inspectedObject := object
%

category: 'other'
method: SpkInspectionTool
selfDescription

        "Answer a string showing how the inspected object describes itself using printOn:.
        Objects that do not understand #printOn: will answer the empty string.
        Limit output size in case of very long or infinitely recursive implementation of #printOn:,
        but set a high limit."

        | stream |
        stream := SpkLimitedWriteStream on: String new.
        stream
                limit: 250000;
                limitBlock: [ ^ stream contents ].
        SpkReflection
                carefullySend: #printOn:
                withArguments: { stream }
                to: inspectedObject
                ifNotUnderstood: [  ].
        ^ stream contents
%

! Class implementation for 'SpkInspectorFieldTool'

!		Instance methods for 'SpkInspectorFieldTool'

category: 'accessing'
method: SpkInspectorFieldTool
index

	^ index
%

category: 'accessing'
method: SpkInspectorFieldTool
index: anObject

	index := anObject
%

category: 'accessing'
method: SpkInspectorFieldTool
name

	^ name
%

category: 'accessing'
method: SpkInspectorFieldTool
name: anObject

	name := anObject
%

! Class implementation for 'SpkInspectorTool'

!		Class methods for 'SpkInspectorTool'

category: 'instance creation'
classmethod: SpkInspectorTool
on: anObject

	^ self new
		  inspectedObject: anObject;
		  yourself
%

!		Instance methods for 'SpkInspectorTool'

category: 'initialization'
method: SpkInspectorTool
addEvaluator

	^ evaluatorTools add: (SpkEvaluatorTool new
			   inspectorTool: self;
			   explorerTool: explorerTool;
			   yourself)
%

category: 'accessing'
method: SpkInspectorTool
classMembershipDescription
	"Answer a string description of the object as an instance of its class"

	^ (SpkReflection isNonMetaclass: inspectedObject)
		ifTrue: [ 
			"inspectedObject is a class, and therefore should understand #name"
			inspectedObject name asString ]
		ifFalse: [ 
			| class title |
			class := self classOfInspectedObject.
			title := class name asString.
			(title first isVowel
				ifTrue: [ 'an ' ]
				ifFalse: [ 'a ' ]) , title ]
%

category: 'private'
method: SpkInspectorTool
classOfInspectedObject

	"The class is guaranteed to be a Behavior, so we can send it messages that Behavior understands"

	^ SpkReflection classOf: inspectedObject
%

category: 'accessing'
method: SpkInspectorTool
evaluatorTools

	^ evaluatorTools
%

category: 'accessing'
method: SpkInspectorTool
fieldTools

	^ fieldTools ifNil: [ self initializeFieldTools ]
%

category: 'initialization'
method: SpkInspectorTool
initialize

	super initialize.
	evaluatorTools := OrderedCollection new
%

category: 'private'
method: SpkInspectorTool
initializeFieldTools

	"Must have set inspectedObject already"

	fieldTools := OrderedCollection new.
	self
		initializeNamedInstvars;
		initializeIndexedInstvars.
	^ fieldTools
%

category: 'initialization'
method: SpkInspectorTool
initializeForDefault

	inspectedObject := nil.
	self addEvaluator
%

category: 'private'
method: SpkInspectorTool
initializeIndexedInstvars
	| size |
	size := SpkReflection indexedSizeOf: inspectedObject.
	1 to: size do: [ :index | 
		| value fieldTool |
		value := SpkReflection fetchIndexedInstvarAt: index from: inspectedObject.
		fieldTool := SpkInspectorFieldTool new.
		fieldTool
			inspectedObject: value;
			explorerTool: explorerTool;
			index: index;
			name: index printString.

		fieldTools add: fieldTool ]
%

category: 'private'
method: SpkInspectorTool
initializeNamedInstvars
	| class names |
	class := self classOfInspectedObject.
	names := class allInstVarNames.
	1 to: names size do: [ :index | 
		| value fieldTool |
		value := SpkReflection fetchNamedInstvarAt: index from: inspectedObject.
		fieldTool := SpkInspectorFieldTool new.
		fieldTool
			inspectedObject: value;
			explorerTool: explorerTool;
			index: index;
			name: (names at: index).
		fieldTools add: fieldTool ]
%

category: 'accessing'
method: SpkInspectorTool
oop

	"In Pharo, this is the identity hash, or 0 if #identityHash is not understood."

	^ SpkReflection identifierOf: inspectedObject
%

! Class implementation for 'SpkPaneLayoutTool'

!		Instance methods for 'SpkPaneLayoutTool'

category: 'accessing'
method: SpkPaneLayoutTool
paneCoordinate

	^ paneCoordinate
%

category: 'accessing'
method: SpkPaneLayoutTool
paneCoordinate: anObject

	paneCoordinate := anObject
%

category: 'accessing'
method: SpkPaneLayoutTool
paneTool

	^ paneTool
%

category: 'accessing'
method: SpkPaneLayoutTool
paneTool: anObject

	paneTool := anObject
%

category: 'accessing'
method: SpkPaneLayoutTool
relativeHeight

	^ relativeHeight
%

category: 'accessing'
method: SpkPaneLayoutTool
relativeHeight: anObject

	relativeHeight := anObject
%

! Class implementation for 'SpkRuntimeErrorTool'

!		Class methods for 'SpkRuntimeErrorTool'

category: 'instance creation'
classmethod: SpkRuntimeErrorTool
forException: anError

	^ self new
		  initializeFromException: anError;
		  yourself
%

!		Instance methods for 'SpkRuntimeErrorTool'

category: 'initialization'
method: SpkRuntimeErrorTool
initializeFromException: anError

	title := SpkReflection
		         carefullySend: #description
		         withArguments: #(  )
		         to: anError
		         ifNotUnderstood: [ 'Indescribable exception' ].
	stack := RsrProcessModel currentStackDump
%

category: 'accessing'
method: SpkRuntimeErrorTool
stack

	^ stack
%

category: 'accessing'
method: SpkRuntimeErrorTool
title

	^ title
%

! Class implementation for 'SpkTaskspaceLayoutTool'

!		Class methods for 'SpkTaskspaceLayoutTool'

category: 'instance creation'
classmethod: SpkTaskspaceLayoutTool
newDefault

	^ self new
		  initializeForDefault;
		  yourself
%

!		Instance methods for 'SpkTaskspaceLayoutTool'

category: 'adding'
method: SpkTaskspaceLayoutTool
addExplorerLayout: anExplorerLayoutTool

	explorerLayouts add: anExplorerLayoutTool
%

category: 'accessing'
method: SpkTaskspaceLayoutTool
explorerLayouts

	^ explorerLayouts
%

category: 'initialization'
method: SpkTaskspaceLayoutTool
initialize

	super initialize.
	explorerLayouts := Set new
%

category: 'initialization'
method: SpkTaskspaceLayoutTool
initializeForDefault

"	| taskspaceTool | -- see https://github.com/GemTalk/Sparkle/issues/9"
	taskspaceTool := SpkTaskspaceTool newDefault.
	self initializeForTool: taskspaceTool
%

category: 'initialization'
method: SpkTaskspaceLayoutTool
initializeForTool: aTaskspaceTool

	taskspaceTool := aTaskspaceTool.
	explorerLayouts := taskspaceTool explorerTools collect: [ :each | 
		                   SpkExplorerLayoutTool new
			                   initializeForTool: each;
			                   yourself ]
%

category: 'accessing'
method: SpkTaskspaceLayoutTool
taskspaceTool

	^ taskspaceTool
%

! Class implementation for 'SpkToolWithUndoManager'

!		Instance methods for 'SpkToolWithUndoManager'

category: 'initialization'
method: SpkToolWithUndoManager
initialize

	super initialize.
	undoManager := SpkUndoManager new
%

category: 'accessing'
method: SpkToolWithUndoManager
performAction: anAction

	^ undoManager performAction: anAction
%

! Class implementation for 'SpkExplorerTool'

!		Class methods for 'SpkExplorerTool'

category: 'instance creation'
classmethod: SpkExplorerTool
newDefault

	^ self new
		  initializeForDefault;
		  yourself
%

!		Instance methods for 'SpkExplorerTool'

category: 'adding'
method: SpkExplorerTool
addPane: aPaneTool

	panes add: aPaneTool
%

category: 'initialization'
method: SpkExplorerTool
initialize

	super initialize.
	panes := Set new
%

category: 'initialization'
method: SpkExplorerTool
initializeForDefault

	"A default explorer starts with an inspector pane on nil, with one evaluator"

	| inspector |
	inspector := SpkInspectorTool new
		             explorerTool: self;
		             initializeForDefault;
		             yourself.
	self addPane: inspector
%

category: 'accessing'
method: SpkExplorerTool
panes

	^ panes
%

! Class implementation for 'SpkTaskspaceTool'

!		Class methods for 'SpkTaskspaceTool'

category: 'instance creation'
classmethod: SpkTaskspaceTool
newDefault

	^ self new
		  initializeForDefault;
		  yourself
%

!		Instance methods for 'SpkTaskspaceTool'

category: 'adding'
method: SpkTaskspaceTool
addExplorer: anExplorerTool

	explorerTools add: anExplorerTool.
	self announceNewExplorer: anExplorerTool
%

category: 'announcing'
method: SpkTaskspaceTool
announceNewExplorer: anExplorerTool

	| announcement |
	announcement := SpkNewExplorerToolAnnouncement new.
	announcement tool: anExplorerTool.
	self announce: announcement
%

category: 'accessing'
method: SpkTaskspaceTool
explorerTools

	^ explorerTools
%

category: 'initialization'
method: SpkTaskspaceTool
initialize

	super initialize.
	explorerTools := IdentitySet new.
	name := ''
%

category: 'initialization'
method: SpkTaskspaceTool
initializeForDefault

	"The default initial taskspace has one default explorer."

	| explorer |
	explorer := SpkExplorerTool newDefault.
	self addExplorer: explorer
%

! Class implementation for 'SpkUndoManager'

!		Class methods for 'SpkUndoManager'

category: 'instance creation'
classmethod: SpkUndoManager
withLimit: anInteger

	^ self new
		  limit: anInteger;
		  yourself
%

!		Instance methods for 'SpkUndoManager'

category: 'testing'
method: SpkUndoManager
hasRedoableAction

	^ redo isEmpty not
%

category: 'testing'
method: SpkUndoManager
hasUndoableAction

	^ undo isEmpty not
%

category: 'initialization'
method: SpkUndoManager
initialize

	super initialize.
	undo := SpkSmallStack new.
	redo := SpkSmallStack new
%

category: 'accessing'
method: SpkUndoManager
limit: anInteger

	undo limit: anInteger.
	redo limit: anInteger
%

category: 'accessing'
method: SpkUndoManager
performAction: anAction

	| result |
	result := anAction performAction.
	redo clear.
	undo push: anAction.
	^ result
%

category: 'accessing'
method: SpkUndoManager
redo

	| action result |
	action := redo pop.
	result := action performAction.
	undo push: action.
	^ result
%

category: 'accessing'
method: SpkUndoManager
undo

	| action |
	action := undo pop.
	action undoAction.
	redo push: action.
	^ nil "Nil to cause an error if someone mistakenly tries to use the result."
%

! Class implementation for 'SpkColumnLayoutService'

!		Class methods for 'SpkColumnLayoutService'

category: 'accessing'
classmethod: SpkColumnLayoutService
templateClassName

	^ #SpkColumnLayoutService
%

!		Instance methods for 'SpkColumnLayoutService'

category: 'adding'
method: SpkColumnLayoutService
addPaneLayout: aPaneLayoutService

	paneLayouts add: aPaneLayoutService
%

category: 'initialization'
method: SpkColumnLayoutService
initialize

	super initialize.
	paneLayouts := OrderedCollection new
%

category: 'accessing'
method: SpkColumnLayoutService
paneLayouts
	^ paneLayouts
%

category: 'accessing'
method: SpkColumnLayoutService
relativeWidth
	^ relativeWidth
%

category: 'accessing'
method: SpkColumnLayoutService
relativeWidth: anObject
	relativeWidth := anObject
%

! Class implementation for 'SpkColumnLayoutServiceServer'

!		Class methods for 'SpkColumnLayoutServiceServer'

category: 'instance creation'
classmethod: SpkColumnLayoutServiceServer
forTool: aColumnLayoutTool

	^ self new
		  initializeFromTool: aColumnLayoutTool;
		  yourself
%

!		Instance methods for 'SpkColumnLayoutServiceServer'

category: 'initialization'
method: SpkColumnLayoutServiceServer
initializeFromTool: aColumnLayoutTool

	tool := aColumnLayoutTool.
	relativeWidth := tool relativeWidth
%

category: 'initialization'
method: SpkColumnLayoutServiceServer
initializePanesForExplorer: xServ

	paneLayouts := OrderedCollection new.
	tool paneLayouts do: [ :plTool | 
		| plServ pServ |
		plServ := SpkPaneLayoutServiceServer forTool: plTool.
		pServ := xServ paneServiceForTool: plTool paneTool.
		plServ paneService: pServ.

		paneLayouts add: plServ.
		xServ addPaneService: pServ ]
%

! Class implementation for 'SpkCompilationErrorService'

!		Class methods for 'SpkCompilationErrorService'

category: 'accessing'
classmethod: SpkCompilationErrorService
templateClassName

	^ #SpkCompilationErrorService
%

!		Instance methods for 'SpkCompilationErrorService'

category: 'accessing'
method: SpkCompilationErrorService
errorLocation

	^ errorLocation
%

category: 'accessing'
method: SpkCompilationErrorService
errorMessage

	^ errorMessage
%

category: 'accessing'
method: SpkCompilationErrorService
sourceCode

	^ sourceCode
%

! Class implementation for 'SpkCompilationErrorServiceServer'

!		Class methods for 'SpkCompilationErrorServiceServer'

category: 'instance creation'
classmethod: SpkCompilationErrorServiceServer
forTool: aColumnLayoutTool

	^ self new
		  initializeFromTool: aColumnLayoutTool;
		  yourself
%

!		Instance methods for 'SpkCompilationErrorServiceServer'

category: 'initialization'
method: SpkCompilationErrorServiceServer
initializeFromTool: aTool

	errorLocation := aTool errorLocation.
	errorMessage := aTool errorMessage.
	sourceCode := aTool sourceCode
%

! Class implementation for 'SpkDebuggerFrameService'

!		Class methods for 'SpkDebuggerFrameService'

category: 'other'
classmethod: SpkDebuggerFrameService
templateClassName
	^ #'SpkDebuggerFrameService'
%

!		Instance methods for 'SpkDebuggerFrameService'

category: 'accessing'
method: SpkDebuggerFrameService
currentEndPosition

	^ currentEndPosition
%

category: 'accessing'
method: SpkDebuggerFrameService
currentEndPosition: anObject

	currentEndPosition := anObject
%

category: 'accessing'
method: SpkDebuggerFrameService
currentStartPosition

	^ currentStartPosition
%

category: 'accessing'
method: SpkDebuggerFrameService
currentStartPosition: anObject

	currentStartPosition := anObject
%

category: 'accessing'
method: SpkDebuggerFrameService
description

	^ description
%

category: 'accessing'
method: SpkDebuggerFrameService
description: anObject

	description := anObject
%

category: 'accessing'
method: SpkDebuggerFrameService
localVariables

	^ localVariables
%

category: 'accessing'
method: SpkDebuggerFrameService
source

	^ source
%

category: 'accessing'
method: SpkDebuggerFrameService
source: anObject

	source := anObject
%

! Class implementation for 'SpkDebuggerFrameServiceServer'

!		Class methods for 'SpkDebuggerFrameServiceServer'

category: 'other'
classmethod: SpkDebuggerFrameServiceServer
forTool: aTool

	^ self new
		  initializeFromTool: aTool;
		  yourself
%

!		Instance methods for 'SpkDebuggerFrameServiceServer'

category: 'initialization'
method: SpkDebuggerFrameServiceServer
initializeFromTool: aTool

	tool := aTool.
	self refreshFromTool
%

category: 'initialization'
method: SpkDebuggerFrameServiceServer
refreshFromTool
	| currentSourceInterval |
	description := tool description.
	source := tool source.
	currentSourceInterval := tool currentSourceInterval.
	currentStartPosition := currentSourceInterval first.
	currentEndPosition := currentSourceInterval last.
	self refreshLocalVariablesFromTool
%

category: 'initialization'
method: SpkDebuggerFrameServiceServer
refreshLocalVariablesFromTool
	localVariables := tool localVariables
		collect: [ :fieldTool | 
			SpkInspectorFieldServiceServer new
				parentService: self;
				initializeFromTool: fieldTool;
				yourself ]
%

! Class implementation for 'SpkDebuggerService'

!		Class methods for 'SpkDebuggerService'

category: 'other'
classmethod: SpkDebuggerService
templateClassName

	^ #SpkDebuggerService
%

!		Instance methods for 'SpkDebuggerService'

category: 'accessing'
method: SpkDebuggerService
exceptionDescription

	^ exceptionDescription
%

category: 'accessing'
method: SpkDebuggerService
frames

	^ frames
%

category: 'accessing'
method: SpkDebuggerService
processIdentifier
	^ processIdentifier
%

category: 'accessing'
method: SpkDebuggerService
processName
	^ processName
%

category: 'accessing'
method: SpkDebuggerService
processPriority
	^ processPriority
%

! Class implementation for 'SpkDebuggerServiceServer'

!		Class methods for 'SpkDebuggerServiceServer'

category: 'other'
classmethod: SpkDebuggerServiceServer
forTool: aTool

	^ self new
		  initializeFromTool: aTool;
		  yourself
%

!		Instance methods for 'SpkDebuggerServiceServer'

category: 'other'
method: SpkDebuggerServiceServer
initializeFramesFromTool

	frames := tool frames collect: [ :frameTool | 
		          (SpkDebuggerFrameDescriptionServiceServer forTool:
				           frameTool)
			          parentService: self;
			          yourself ]
%

category: 'other'
method: SpkDebuggerServiceServer
initializeFromTool: aTool

	tool := aTool.
	self refreshFromTool
%

category: 'other'
method: SpkDebuggerServiceServer
refreshFromTool

	exceptionDescription := tool exceptionDescription.
	processName := tool processName.
	processIdentifier := tool processIdentifier.
	processPriority := tool processPriority.
	self initializeFramesFromTool
%

! Class implementation for 'SpkExplorerLayoutService'

!		Class methods for 'SpkExplorerLayoutService'

category: 'accessing'
classmethod: SpkExplorerLayoutService
templateClassName

	^ #SpkExplorerLayoutService
%

!		Instance methods for 'SpkExplorerLayoutService'

category: 'adding'
method: SpkExplorerLayoutService
addColumnLayout: aColumnLayoutService

	columnLayouts add: aColumnLayoutService
%

category: 'accessing'
method: SpkExplorerLayoutService
columnLayouts
	^ columnLayouts
%

category: 'accessing'
method: SpkExplorerLayoutService
explorerService

	^ explorerService
%

category: 'accessing'
method: SpkExplorerLayoutService
explorerService: anObject

	explorerService := anObject
%

category: 'accessing'
method: SpkExplorerLayoutService
height
	^ height
%

category: 'accessing'
method: SpkExplorerLayoutService
height: anObject
	height := anObject
%

category: 'initialization'
method: SpkExplorerLayoutService
initialize

	super initialize.
	columnLayouts := OrderedCollection new.
	height := width := 900
%

category: 'adding'
method: SpkExplorerLayoutService
removeColumnLayout: aColumnLayoutService

	columnLayouts remove: aColumnLayoutService
%

category: 'accessing'
method: SpkExplorerLayoutService
width
	^ width
%

category: 'accessing'
method: SpkExplorerLayoutService
width: anObject
	width := anObject
%

! Class implementation for 'SpkExplorerLayoutServiceServer'

!		Class methods for 'SpkExplorerLayoutServiceServer'

category: 'instance creation'
classmethod: SpkExplorerLayoutServiceServer
forTool: anExplorerLayoutTool

	^ self new
		  initializeFromTool: anExplorerLayoutTool;
		  yourself
%

!		Instance methods for 'SpkExplorerLayoutServiceServer'

category: 'initialization'
method: SpkExplorerLayoutServiceServer
initializeColumns

	"Create column and pane services and their layout services, based on my layout tool."

	columnLayouts := OrderedCollection new.
	tool columnLayouts do: [ :clTool | 
		| clServ |
		clServ := SpkColumnLayoutServiceServer forTool: clTool.
		columnLayouts add: clServ.
		clServ initializePanesForExplorer: explorerService ]
%

category: 'initialization'
method: SpkExplorerLayoutServiceServer
initializeFromTool: explorerLayoutTool

	tool := explorerLayoutTool.
	height := tool height.
	width := tool width
%

category: 'accessing'
method: SpkExplorerLayoutServiceServer
tool

	^ tool
%

! Class implementation for 'SpkExplorerService'

!		Class methods for 'SpkExplorerService'

category: 'accessing'
classmethod: SpkExplorerService
templateClassName

	^ #SpkExplorerService
%

!		Instance methods for 'SpkExplorerService'

category: 'accessing'
method: SpkExplorerService
addPaneService: aService

	"The given service should know how to be an explorer pane. Initially, the only 
	pane service is the inspector service."

	paneServices add: aService
%

category: 'initialization'
method: SpkExplorerService
defaultLayout

	"Server class on server, client on client"

	self subclassResponsibility
%

category: 'initialization'
method: SpkExplorerService
initialize

	super initialize.
	paneServices := Set new.
	layoutService := self defaultLayout
%

category: 'accessing'
method: SpkExplorerService
layoutService
	^ layoutService
%

category: 'accessing'
method: SpkExplorerService
layoutService: anObject
	layoutService := anObject
%

category: 'accessing'
method: SpkExplorerService
paneServices
	^ paneServices
%

category: 'accessing'
method: SpkExplorerService
removePane: aService

	"The given service should know how to be an explorer pane. Initially, the only 
	pane service is the inspector service."

	paneServices remove: aService
%

! Class implementation for 'SpkExplorerServiceServer'

!		Class methods for 'SpkExplorerServiceServer'

category: 'instance creation'
classmethod: SpkExplorerServiceServer
forTool: anExplorerTool

	^ self new
		  tool: anExplorerTool;
		  yourself
%

category: 'class initialization'
classmethod: SpkExplorerServiceServer
initialize
	self initializeServiceClassesForToolTypes
%

category: 'initialization'
classmethod: SpkExplorerServiceServer
initializeServiceClassesForToolTypes

	serviceClassesForToolTypes := IdentityDictionary new.
	^ serviceClassesForToolTypes
		  at: SpkCompilationErrorTool put: SpkCompilationErrorServiceServer;
		  at: SpkDebuggerTool put: SpkDebuggerServiceServer;
		  at: SpkRuntimeErrorTool put: SpkRuntimeErrorServiceServer;
		  at: SpkInspectorTool put: SpkInspectorServiceServer;
		  yourself
%

category: 'accessing'
classmethod: SpkExplorerServiceServer
serviceClassesForToolTypes

	^ serviceClassesForToolTypes
%

category: 'accessing'
classmethod: SpkExplorerServiceServer
serviceClassForToolClass: aToolClass

	^ self serviceClassesForToolTypes
		  at: aToolClass
		  ifAbsent: [ self error: 'Unrecognized tool class' ]
%

!		Instance methods for 'SpkExplorerServiceServer'

category: 'initialization'
method: SpkExplorerServiceServer
defaultLayout

	^ SpkExplorerLayoutServiceServer new
%

category: 'accessing'
method: SpkExplorerServiceServer
paneServiceForTool: aPaneTool

	| serviceClass |
	serviceClass := self class serviceClassForToolClass: aPaneTool class.
	^ serviceClass forTool: aPaneTool
%

category: 'accessing'
method: SpkExplorerServiceServer
tool

	^ tool
%

category: 'accessing'
method: SpkExplorerServiceServer
tool: anObject

	tool := anObject
%

! Class implementation for 'SpkInspectorService'

!		Class methods for 'SpkInspectorService'

category: 'accessing'
classmethod: SpkInspectorService
templateClassName

	^ #SpkInspectorService
%

!		Instance methods for 'SpkInspectorService'

category: 'accessing'
method: SpkInspectorService
classMembershipDescription
	^ classMembershipDescription
%

category: 'accessing'
method: SpkInspectorService
classMembershipDescription: anObject
	classMembershipDescription := anObject
%

category: 'accessing'
method: SpkInspectorService
evaluators

	^ evaluators
%

category: 'accessing'
method: SpkInspectorService
fields
	^ fields
%

category: 'accessing'
method: SpkInspectorService
fields: anObject
	fields := anObject
%

category: 'initialization'
method: SpkInspectorService
initialize

	super initialize.
	fields := OrderedCollection new.
	evaluators := OrderedCollection new
%

category: 'accessing'
method: SpkInspectorService
oop
	^ oop
%

category: 'accessing'
method: SpkInspectorService
oop: anObject
	oop := anObject
%

category: 'accessing'
method: SpkInspectorService
selfDescription
	^ selfDescription
%

category: 'accessing'
method: SpkInspectorService
selfDescription: anObject
	selfDescription := anObject
%

! Class implementation for 'SpkInspectorServiceServer'

!		Class methods for 'SpkInspectorServiceServer'

category: 'instance creation'
classmethod: SpkInspectorServiceServer
forTool: aTool

	^ self new
		  initializeFromTool: aTool;
		  yourself
%

!		Instance methods for 'SpkInspectorServiceServer'

category: 'initialization'
method: SpkInspectorServiceServer
initializeEvaluatorsFromTool

	evaluators := OrderedCollection new.
	tool evaluatorTools do: [ :evaluatorTool | 
		evaluators add: (SpkEvaluatorServiceServer new
				 parentService: self;
				 initializeFromTool: evaluatorTool;
				 yourself) ]
%

category: 'initialization'
method: SpkInspectorServiceServer
initializeFieldsFromTool
	fields := tool fieldTools
		collect: [ :fieldTool | 
			SpkInspectorFieldServiceServer new
				parentService: self;
				initializeFromTool: fieldTool;
				yourself ]
%

category: 'initialization'
method: SpkInspectorServiceServer
initializeFromTool: aTool

	tool := aTool.
	self refreshFromTool
%

category: 'initialization'
method: SpkInspectorServiceServer
refreshFromTool

	oop := tool oop.
	classMembershipDescription := tool classMembershipDescription.
	selfDescription := tool selfDescription.
	self initializeFieldsFromTool.
	self initializeEvaluatorsFromTool
%

category: 'accessing'
method: SpkInspectorServiceServer
tool

	^ tool
%

! Class implementation for 'SpkLinkableSubService'

!		Instance methods for 'SpkLinkableSubService'

category: 'accessing'
method: SpkLinkableSubService
linkedService

	^ linkedService
%

category: 'accessing'
method: SpkLinkableSubService
linkedService: anObject

	linkedService := anObject
%

category: 'accessing'
method: SpkLinkableSubService
parentService

	^ parentService
%

category: 'accessing'
method: SpkLinkableSubService
parentService: anObject

	parentService := anObject
%

! Class implementation for 'SpkCodeEditorService'

!		Instance methods for 'SpkCodeEditorService'

category: 'initialization'
method: SpkCodeEditorService
initialize

	super initialize.
	oldSourceCode := newSourceCode := ''
%

category: 'accessing'
method: SpkCodeEditorService
newSourceCode

	^ newSourceCode
%

category: 'accessing'
method: SpkCodeEditorService
newSourceCode: aString

	newSourceCode := aString
%

! Class implementation for 'SpkEvaluatorService'

!		Class methods for 'SpkEvaluatorService'

category: 'accessing'
classmethod: SpkEvaluatorService
templateClassName

	^ #SpkEvaluatorService
%

!		Instance methods for 'SpkEvaluatorService'

category: 'accessing'
method: SpkEvaluatorService
evaluationContext
	^ evaluationContext
%

category: 'accessing'
method: SpkEvaluatorService
evaluationContext: anObject
	evaluationContext := anObject
%

category: 'initialization'
method: SpkEvaluatorService
initialize

	super initialize.
	evaluationContext := nil
%

! Class implementation for 'SpkEvaluatorServiceServer'

!		Instance methods for 'SpkEvaluatorServiceServer'

category: 'actions'
method: SpkEvaluatorServiceServer
accept

	"Evaluate my newSourceCode, answer a new service for the result."

	| resultTool resultService |
	self tool newSourceCode: newSourceCode.
	resultTool := self tool accept.

	self refreshFromTool.
	resultService := self serviceForTool: resultTool.
	^ resultService
%

category: 'initialization'
method: SpkEvaluatorServiceServer
initializeFromTool: evaluatorTool

	"If we're restoring a taskspace I get initialized from my tool.
	If I'm being created from the client, I have to create a tool for myself to use."

	tool := evaluatorTool.
	self refreshFromTool
%

category: 'initialization'
method: SpkEvaluatorServiceServer
initializeTool

	"If we're restoring a taskspace I get initialized from my tool.
	If I'm being created from the client, I have to create a tool for myself to use."

	| inspectorTool |
	inspectorTool := parentService tool.
	tool := SpkEvaluatorTool new.
	^ tool
		oldSourceCode: oldSourceCode;
		newSourceCode: newSourceCode;
		inspectorTool: inspectorTool;
		explorerTool: inspectorTool explorerTool;
		yourself
%

category: 'initialization'
method: SpkEvaluatorServiceServer
refreshFromTool

	oldSourceCode := tool oldSourceCode.
	newSourceCode := tool newSourceCode
%

category: 'accessing'
method: SpkEvaluatorServiceServer
serviceForTool: aTool

	| serviceClass |
	serviceClass := SpkExplorerServiceServer serviceClassForToolClass:
		                aTool class.
	^ serviceClass forTool: aTool
%

category: 'initialization'
method: SpkEvaluatorServiceServer
tool
	"If we're restoring a taskspace I get initialized from my tool.
	If I'm being created from the client, I have to create a tool for myself to use."

	^ tool ifNil: [ self initializeTool ]
%

! Class implementation for 'SpkDebuggerFrameDescriptionService'

!		Class methods for 'SpkDebuggerFrameDescriptionService'

category: 'other'
classmethod: SpkDebuggerFrameDescriptionService
templateClassName

	^ #SpkDebuggerFrameDescriptionService
%

!		Instance methods for 'SpkDebuggerFrameDescriptionService'

category: 'accessing'
method: SpkDebuggerFrameDescriptionService
description

	^ description
%

category: 'accessing'
method: SpkDebuggerFrameDescriptionService
description: anObject

	description := anObject
%

category: 'accessing'
method: SpkDebuggerFrameDescriptionService
index
	^index
%

category: 'accessing'
method: SpkDebuggerFrameDescriptionService
index: object
	index := object
%

! Class implementation for 'SpkDebuggerFrameDescriptionServiceServer'

!		Class methods for 'SpkDebuggerFrameDescriptionServiceServer'

category: 'other'
classmethod: SpkDebuggerFrameDescriptionServiceServer
forTool: aTool

	^ self new
		  initializeFromTool: aTool;
		  yourself
%

!		Instance methods for 'SpkDebuggerFrameDescriptionServiceServer'

category: 'other'
method: SpkDebuggerFrameDescriptionServiceServer
createFrameService
	^ SpkDebuggerFrameServiceServer forTool: tool
%

category: 'other'
method: SpkDebuggerFrameDescriptionServiceServer
initializeFromTool: aTool

	tool := aTool.
	self refreshFromTool
%

category: 'other'
method: SpkDebuggerFrameDescriptionServiceServer
refreshFromTool

	description := tool description.
	index := tool index
%

! Class implementation for 'SpkInspectorFieldService'

!		Class methods for 'SpkInspectorFieldService'

category: 'instance creation'
classmethod: SpkInspectorFieldService
name: nameString description: descriptionString

	^ self new
		  name: nameString;
		  description: descriptionString;
		  yourself
%

category: 'accessing'
classmethod: SpkInspectorFieldService
templateClassName

	^ #SpkInspectorFieldService
%

!		Instance methods for 'SpkInspectorFieldService'

category: 'accessing'
method: SpkInspectorFieldService
description
	^ description
%

category: 'accessing'
method: SpkInspectorFieldService
description: anObject
	description := anObject
%

category: 'accessing'
method: SpkInspectorFieldService
name
	^ name
%

category: 'accessing'
method: SpkInspectorFieldService
name: anObject
	name := anObject
%

! Class implementation for 'SpkInspectorFieldServiceServer'

!		Instance methods for 'SpkInspectorFieldServiceServer'

category: 'inspecting'
method: SpkInspectorFieldServiceServer
createInspectorService
	| newTool |
	newTool := (SpkInspectorTool on: tool inspectedObject)
		explorerTool: tool explorerTool;
		yourself.
	^ SpkInspectorServiceServer forTool: newTool
%

category: 'initialization'
method: SpkInspectorFieldServiceServer
initializeFromTool: aFieldTool

	tool := aFieldTool.
	self refreshFromTool
%

category: 'initialization'
method: SpkInspectorFieldServiceServer
refreshFromTool

	name := tool name.
	description := tool selfDescription
%

! Class implementation for 'SpkPaneLayoutService'

!		Class methods for 'SpkPaneLayoutService'

category: 'accessing'
classmethod: SpkPaneLayoutService
templateClassName

	^ #SpkPaneLayoutService
%

!		Instance methods for 'SpkPaneLayoutService'

category: 'accessing'
method: SpkPaneLayoutService
paneCoordinate
	^ paneCoordinate
%

category: 'accessing'
method: SpkPaneLayoutService
paneCoordinate: anObject
	paneCoordinate := anObject
%

category: 'accessing'
method: SpkPaneLayoutService
paneService
	^ paneService
%

category: 'accessing'
method: SpkPaneLayoutService
paneService: anObject
	paneService := anObject
%

category: 'accessing'
method: SpkPaneLayoutService
relativeHeight
	^ relativeHeight
%

category: 'accessing'
method: SpkPaneLayoutService
relativeHeight: anObject
	relativeHeight := anObject
%

! Class implementation for 'SpkPaneLayoutServiceServer'

!		Class methods for 'SpkPaneLayoutServiceServer'

category: 'instance creation'
classmethod: SpkPaneLayoutServiceServer
forTool: aPaneLayoutTool

	^ self new
		  initializeFromTool: aPaneLayoutTool;
		  yourself
%

!		Instance methods for 'SpkPaneLayoutServiceServer'

category: 'initialization'
method: SpkPaneLayoutServiceServer
initializeFromTool: paneLayoutTool

	tool := paneLayoutTool.
	self refreshFromTool
%

category: 'initialization'
method: SpkPaneLayoutServiceServer
refreshFromTool

	"PaneCoordinate is an Array except in the presentation layer. 
	Copy so transactions and persistence will not affect the coordinate in the service layer."

	paneCoordinate := tool paneCoordinate copy.
	relativeHeight := tool relativeHeight
%

! Class implementation for 'SpkRuntimeErrorService'

!		Class methods for 'SpkRuntimeErrorService'

category: 'accessing'
classmethod: SpkRuntimeErrorService
templateClassName

	^ #SpkRuntimeErrorService
%

!		Instance methods for 'SpkRuntimeErrorService'

category: 'accessing'
method: SpkRuntimeErrorService
stack

	^ stack
%

category: 'accessing'
method: SpkRuntimeErrorService
title

	^ title
%

! Class implementation for 'SpkRuntimeErrorServiceServer'

!		Class methods for 'SpkRuntimeErrorServiceServer'

category: 'instance creation'
classmethod: SpkRuntimeErrorServiceServer
forTool: aColumnLayoutTool

	^ self new
		  initializeFromTool: aColumnLayoutTool;
		  yourself
%

!		Instance methods for 'SpkRuntimeErrorServiceServer'

category: 'initialization'
method: SpkRuntimeErrorServiceServer
initializeFromTool: aTool

	title := aTool title.
	stack := aTool stack
%

! Class implementation for 'SpkTaskspaceLayoutService'

!		Class methods for 'SpkTaskspaceLayoutService'

category: 'accessing'
classmethod: SpkTaskspaceLayoutService
templateClassName

	^ #SpkTaskspaceLayoutService
%

!		Instance methods for 'SpkTaskspaceLayoutService'

category: 'accessing'
method: SpkTaskspaceLayoutService
explorerLayoutServices

	^ explorerLayoutServices
%

category: 'initialization'
method: SpkTaskspaceLayoutService
initialize

	super initialize.
	explorerLayoutServices := Set new
%

category: 'accessing'
method: SpkTaskspaceLayoutService
taskspaceService

	^ taskspaceService
%

! Class implementation for 'SpkTaskspaceLayoutServiceServer'

!		Class methods for 'SpkTaskspaceLayoutServiceServer'

category: 'instance creation'
classmethod: SpkTaskspaceLayoutServiceServer
forTool: aTaskspaceLayoutTool

	^ self new
		  initializeFromTool: aTaskspaceLayoutTool;
		  yourself
%

!		Instance methods for 'SpkTaskspaceLayoutServiceServer'

category: 'initialization'
method: SpkTaskspaceLayoutServiceServer
initializeExplorerServices

	"Create the ExplorerLayoutServices and ExplorerServices."

	explorerLayoutServices := Set new.
	tool explorerLayouts do: [ :xlTool | 
		| xlServ xServ |
		xlServ := SpkExplorerLayoutServiceServer forTool: xlTool.
		xServ := SpkExplorerServiceServer forTool: xlTool explorerTool.
		xlServ explorerService: xServ.

		explorerLayoutServices add: xlServ.
		taskspaceService addExplorer: xServ.

		xlServ initializeColumns ]
%

category: 'initialization'
method: SpkTaskspaceLayoutServiceServer
initializeFromTool: aTaskspaceLayoutTool

	"We're creating new server services (by definition transient) for tools (which might be persistent)."

	tool := aTaskspaceLayoutTool.
	taskspaceService := SpkTaskspaceServiceServer forTool:
		                    tool taskspaceTool.
	self initializeExplorerServices
%

! Class implementation for 'SpkTaskspaceRegistryService'

!		Class methods for 'SpkTaskspaceRegistryService'

category: 'accessing'
classmethod: SpkTaskspaceRegistryService
templateClassName

	^ #SpkTaskspaceRegistryService
%

! Class implementation for 'SpkTaskspaceRegistryServiceServer'

!		Instance methods for 'SpkTaskspaceRegistryServiceServer'

category: 'defaults'
method: SpkTaskspaceRegistryServiceServer
newDefaultTaskspaceLayout

	"Create a new default taskspace layout tool, and answer a service for it."

	| tool |
	tool := SpkTaskspaceLayoutTool newDefault.
	^ SpkTaskspaceLayoutServiceServer forTool: tool
%

! Class implementation for 'SpkTaskspaceService'

!		Class methods for 'SpkTaskspaceService'

category: 'accessing'
classmethod: SpkTaskspaceService
templateClassName

	^ #SpkTaskspaceService
%

!		Instance methods for 'SpkTaskspaceService'

category: 'acccessing'
method: SpkTaskspaceService
addExplorer: anExplorerService

	explorers add: anExplorerService
%

category: 'accessing'
method: SpkTaskspaceService
explorers

	^ explorers
%

category: 'enumerating'
method: SpkTaskspaceService
explorersDo: aUnaryBlock

	explorers do: aUnaryBlock
%

category: 'initialization'
method: SpkTaskspaceService
initialize

	super initialize.
	explorers := Set new
%

category: 'acccessing'
method: SpkTaskspaceService
removeExplorer: anExplorerService

	explorers remove: anExplorerService
%

! Class implementation for 'SpkTaskspaceServiceServer'

!		Class methods for 'SpkTaskspaceServiceServer'

category: 'instance creation'
classmethod: SpkTaskspaceServiceServer
forTool: aTaskspaceTool

	^ self new
		  tool: aTaskspaceTool;
		  yourself
%

!		Instance methods for 'SpkTaskspaceServiceServer'

category: 'initialization'
method: SpkTaskspaceServiceServer
tool: aTaskspaceTool

	tool := aTaskspaceTool
%

! Class implementation for 'SpkLimitedWriteStreamTest'

!		Instance methods for 'SpkLimitedWriteStreamTest'

category: 'instance creation'
method: SpkLimitedWriteStreamTest
newStream
	^ self newStreamOn: String new
%

category: 'instance creation'
method: SpkLimitedWriteStreamTest
newStreamOn: aCollection
	^ self streamClass on: aCollection
%

category: 'accessing'
method: SpkLimitedWriteStreamTest
streamClass
	^ SpkLimitedWriteStream
%

category: 'accessing'
method: SpkLimitedWriteStreamTest
string
	^ 'testing' shallowCopy
%

category: 'accessing'
method: SpkLimitedWriteStreamTest
stringSize
	^ self string size
%

category: 'tests'
method: SpkLimitedWriteStreamTest
testLimit
	| stream overLimit |
	stream := self newStream.
	overLimit := false.
	stream
		limitBlock: [ overLimit := true ];
		nextPutAll: self string.
	self
		assert: stream limit equals: self streamClass defaultLimit;
		assert: (stream limit: self stringSize) identicalTo: stream;
		assert: stream limit equals: self stringSize;
		deny: overLimit.

	self stringSize - 1 to: 0 by: -1 do: [ :i | 
		overLimit := false.
		self
			assert: (stream limit: i) identicalTo: stream;
			assert: stream limit equals: i;
			assert: stream position equals: i;
			assert: stream contents equals: (self string copyFrom: 1 to: i);
			assert: overLimit ]
%

category: 'tests'
method: SpkLimitedWriteStreamTest
testLimitBlock
	| stream overLimit limitBlock |
	stream := self newStream.
	overLimit := false.
	limitBlock := [ overLimit := true ].
	self
		assert: stream limitBlock isNil;
		assert: (stream limitBlock: limitBlock) identicalTo: stream;
		assert: stream limitBlock identicalTo: limitBlock;
		deny: overLimit
%

category: 'tests'
method: SpkLimitedWriteStreamTest
testNextPut
	| stream overLimit |

	stream := self newStream.
	self string
		withIndexDo: [ :each :i | 
			self
				assert: (stream nextPut: each) equals: each;
				assert: stream position equals: i;
				assert: stream contents equals: (self string copyFrom: 1 to: i) ].

	stream := self streamClass on: String new limit: self stringSize limitBlock: [ overLimit := true ].
	overLimit := false.
	self string
		withIndexDo: [ :each :i | 
			self
				assert: (stream nextPut: each) equals: each;
				assert: stream position equals: i;
				assert: stream contents equals: (self string copyFrom: 1 to: i);
				deny: overLimit ].
	self string
		do: [ :each | 
			overLimit := false.
			self
				assert: (stream nextPut: each) equals: each;
				assert: stream position equals: self stringSize;
				assert: stream contents equals: self string;
				assert: overLimit ]
%

category: 'tests'
method: SpkLimitedWriteStreamTest
testNextPutAll
	| stream overLimit |
	stream := self newStream.
	self
		assert: (stream nextPutAll: self string) equals: self string;
		assert: stream position equals: self stringSize;
		assert: stream contents equals: self string.

	stream := self streamClass on: String new limit: self stringSize limitBlock: [ overLimit := true ].
	overLimit := false.
	self
		assert: (stream nextPutAll: self string) equals: self string;
		assert: stream position equals: self stringSize;
		assert: stream contents equals: self string;
		deny: overLimit.
	self
		assert: (stream nextPutAll: self string) equals: self string;
		assert: stream position equals: self stringSize;
		assert: stream contents equals: self string;
		assert: overLimit
%

category: 'tests'
method: SpkLimitedWriteStreamTest
testOn
	| collection stream |
	collection := String new.
	stream := self streamClass on: collection.
	self
		assert: stream originalContents identicalTo: collection;
		assert: stream position equals: 0;
		assert: stream contents isEmpty;
		assert: stream size equals: 0.

	stream := self newStream.
	self
		assert: stream limit equals: self streamClass defaultLimit;
		assert: stream limitBlock isNil
%

category: 'tests'
method: SpkLimitedWriteStreamTest
testOnFromTo
	| stream |
	stream := self streamClass on: self string , self string from: self stringSize + 1 to: self stringSize * 2.
	self
		assert: stream originalContents equals: self string , self string;
		assert: stream position equals: self stringSize;
		assert: stream contents equals: self string;
		assert: stream size equals: self stringSize * 2.

	stream := self streamClass on: self string , self string from: self stringSize + 1 to: self stringSize * 2.
	self
		assert: stream limit equals: self streamClass defaultLimit;
		assert: stream limitBlock isNil
%

category: 'tests'
method: SpkLimitedWriteStreamTest
testOnLimitLimitBlock
	| collection overLimit limitBlock stream |
	collection := String new.
	overLimit := false.
	limitBlock := [ overLimit := true ].
	stream := self streamClass on: collection limit: self stringSize limitBlock: limitBlock.
	self
		assert: stream originalContents identicalTo: collection;
		assert: stream position equals: 0;
		assert: stream limit equals: self stringSize;
		assert: stream limitBlock equals: limitBlock;
		deny: overLimit
%

category: 'tests'
method: SpkLimitedWriteStreamTest
testSetLimitLimitBlock
	| stream overLimit |
	stream := self newStream.
	overLimit := false.
	self assert: (stream setLimit: self stringSize limitBlock: [ overLimit := true ]) identicalTo: stream.
	stream nextPutAll: self string.
	self deny: overLimit.

	self stringSize - 1 to: 0 by: -1 do: [ :i | 
		overLimit := false.
		"ensure the new block argument is used when the new limit is less than
		the position by setting it to nil first"
		self assert: (stream setLimit: stream position limitBlock: nil) identicalTo: stream.
		self deny: overLimit.
		self assert: (stream setLimit: i limitBlock: [ overLimit := true ]) identicalTo: stream.
		self assert: overLimit ]
%

category: 'tests'
method: SpkLimitedWriteStreamTest
testWith
	"like on: except it starts writing at the end of its argument collection,
	and the initial position is the collection size and the initial contents
	is the collection"

	| stream overLimit |
	
	stream := self streamClass with: self string.
	self
		assert: stream originalContents equals: self string;
		assert: stream position equals: self stringSize;
		assert: stream contents equals: self string;
		assert: stream size equals: self stringSize.

	stream := self streamClass with: self string.
	overLimit := false.
	stream
		limit: self stringSize * 2;
		limitBlock: [ overLimit := true ].
	self string
		withIndexDo: [ :each :i | 
			self
				assert: (stream nextPut: each) equals: each;
				assert: stream position equals: self stringSize + i;
				assert: stream contents equals: self string , (self string copyFrom: 1 to: i);
				deny: overLimit ].
	self string
		do: [ :each | 
			overLimit := false.
			self
				assert: (stream nextPut: each) equals: each;
				assert: stream position equals: self stringSize * 2;
				assert: stream contents equals: self string , self string;
				assert: overLimit ]
%

category: 'tests'
method: SpkLimitedWriteStreamTest
testWithFromTo
	"like with: except it paritions its argument collection first using the
	from:/to: indexes"

	| stream overLimit |
	
	stream := self streamClass with: self string , self string from: 1 to: self stringSize.
	self
		assert: stream originalContents equals: self string;
		assert: stream position equals: self stringSize;
		assert: stream contents equals: self string;
		assert: stream size equals: self stringSize.

	stream := self streamClass with: self string , self string from: 1 to: self stringSize.
	overLimit := false.
	stream
		limit: self stringSize * 2;
		limitBlock: [ overLimit := true ].
	self string
		withIndexDo: [ :each :i | 
			self
				assert: (stream nextPut: each) equals: each;
				assert: stream position equals: self stringSize + i;
				assert: stream contents equals: self string , (self string copyFrom: 1 to: i);
				deny: overLimit ].
	self string
		do: [ :each | 
			overLimit := false.
			self
				assert: (stream nextPut: each) equals: each;
				assert: stream position equals: self stringSize * 2;
				assert: stream contents equals: self string , self string;
				assert: overLimit ]
%

! Class implementation for 'SpkEvaluationTest'

!		Instance methods for 'SpkEvaluationTest'

category: 'other'
method: SpkEvaluationTest
setUp
	super setUp.
	inspectorTool := SpkInspectorTool on: nil.
	evaluatorTool := SpkEvaluatorTool new
		inspectorTool: inspectorTool;
		yourself
%

! Class implementation for 'SpkDebuggerServiceTest'

!		Instance methods for 'SpkDebuggerServiceTest'

category: 'tests'
method: SpkDebuggerServiceTest
testCurrentSourceIntervalForPrimitive
	| frames frameDesc frame |
	self zork3.
	frames := debuggerService frames.
	frameDesc := frames first.
	self assert: frameDesc class equals: SpkDebuggerFrameDescriptionServiceServer.
	frame := frameDesc createFrameService.
	self
		assert: frame class equals: SpkDebuggerFrameServiceServer;
		assert: frame currentStartPosition > 100;
		assert: frame currentEndPosition - frame currentStartPosition = 3	"Four characters; the primitive number"
%

category: 'tests'
method: SpkDebuggerServiceTest
testExceptionDescription
	"Can we make a tree of services out of a DebuggerTool?"

	self zork3.
	self assert: debuggerService exceptionDescription equals: 'MessageNotUnderstood -  a SmallInteger does not understand  #''zork'''
%

category: 'tests'
method: SpkDebuggerServiceTest
testProcessFrameNumbering
	| frames |
	self zork3.
	frames := debuggerService frames.
	self assert: frames first index equals: 1
%

category: 'tests'
method: SpkDebuggerServiceTest
testProcessFrameQuantity
	| frames |
	self zork3.
	frames := debuggerService frames.
	self
		assert: (frames isKindOf: SequenceableCollection);
		assert: (frames size between: 10 and: 20)
%

category: 'tests'
method: SpkDebuggerServiceTest
testProcessIdentifier
	| id |
	self zork3.
	id := debuggerService processIdentifier.
	self
		assert: id class equals: SmallInteger;
		assert: (id bitAnd: 16rFF) equals: 1
%

category: 'tests'
method: SpkDebuggerServiceTest
testProcessName
	"Can we make a tree of services out of a DebuggerTool?"

	self zork3.
	self assert: debuggerService processName equals: 'Evaluation'
%

category: 'tests'
method: SpkDebuggerServiceTest
testProcessPriority
	| prio |
	self zork3.
	prio := debuggerService processPriority.
	self
		assert: prio class equals: SmallInteger;
		assert: prio equals: 15
%

category: 'support'
method: SpkDebuggerServiceTest
zork3
	| debuggerTool |
	evaluatorTool newSourceCode: '3 zork'.
	debuggerTool := evaluatorTool evaluateCode.
	debuggerService := SpkDebuggerServiceServer forTool: debuggerTool
%

! Class implementation for 'SpkDebuggerToolTest'

!		Instance methods for 'SpkDebuggerToolTest'

category: 'other'
method: SpkDebuggerToolTest
testCurrentSourceIntervalForPrimitive
	"Do we get a reasonable source code interval for a primitive method?"

	| debugger frameTool interval|
	evaluatorTool newSourceCode: '3 zork'.
	debugger := evaluatorTool evaluateCode.
	frameTool := debugger frames at: 1.
	interval := frameTool currentSourceInterval.
	self 
		assert: frameTool description equals: 'GsNMethod class >> _gsReturnToC';
		assert: frameTool stepPoint equals: 1;
		assert: interval class equals: Interval;
		assert: interval begin > 100;
		assert: interval size equals: 4
%

category: 'other'
method: SpkDebuggerToolTest
testFrameDescription
	"Is a frame's description reasonable?"

	| debugger doitFrames |
	evaluatorTool newSourceCode: '3 zork'.
	debugger := evaluatorTool evaluateCode.
	self assert: debugger class equals: SpkDebuggerTool.

	doitFrames := debugger frames
		select: [ :frame | 
			self assert: frame class equals: SpkDebuggerFrameTool.
			frame description = 'Executed Code ' ].
	self
		assert: doitFrames size equals: 1;
		assert: doitFrames first index equals: 6
%

category: 'other'
method: SpkDebuggerToolTest
testFrameIndex
	"Are frames indexed from the bottom of the stack?"

	| debugger frameTool |
	evaluatorTool newSourceCode: '3 zork'.
	debugger := evaluatorTool evaluateCode.
	frameTool := debugger frames at: 1.
	self
		assert: frameTool class equals: SpkDebuggerFrameTool;
		assert: frameTool index equals: 1;
		assert: frameTool description equals: 'GsNMethod class >> _gsReturnToC'
%

category: 'other'
method: SpkDebuggerToolTest
testNumberOfFrames
	"Can the debugger get frames from the process?"

	| debugger |
	evaluatorTool newSourceCode: '3 zork'.
	debugger := evaluatorTool evaluateCode.
	self assert: debugger class equals: SpkDebuggerTool.
	self assert: debugger frames size > 6
%

! Class implementation for 'SpkEvaluatorToolTest'

!		Instance methods for 'SpkEvaluatorToolTest'

category: 'other'
method: SpkEvaluatorToolTest
testEvaluationReferencingInstvar
	| result |
	inspectorTool inspectedObject: #'foo' -> 'bar'.
	evaluatorTool newSourceCode: 'value , ''n'''.
	result := evaluatorTool evaluateCode.
	self assert: result class equals: SpkInspectorTool.
	self assert: result inspectedObject equals: 'barn'
%

category: 'other'
method: SpkEvaluatorToolTest
testEvaluationUsingSelf
	| result |
	inspectorTool inspectedObject: 7.
	evaluatorTool newSourceCode: 'self - 4'.
	result := evaluatorTool evaluateCode.
	self assert: result class equals: SpkInspectorTool.
	self assert: result inspectedObject equals: 3
%

category: 'other'
method: SpkEvaluatorToolTest
testRuntimeError
	| result |
	evaluatorTool newSourceCode: '3 zork'.
	result := evaluatorTool evaluateCode.
	self assert: result class equals: SpkDebuggerTool
%

category: 'other'
method: SpkEvaluatorToolTest
testSimpleEvaluation
	| result |
	evaluatorTool newSourceCode: '3 + 4'.
	result := evaluatorTool evaluateCode.
	self assert: result class equals: SpkInspectorTool.
	self assert: result inspectedObject equals: 7
%

category: 'other'
method: SpkEvaluatorToolTest
testSyntaxError
	| result |
	evaluatorTool newSourceCode: '(self class'.
	result := evaluatorTool evaluateCode.
	self assert: result class equals: SpkCompilationErrorTool.
	self assert: result errorLocation equals: 12.
	self assert: (result errorMessage findPattern: #('expected') startingAt: 1) > 0
%

! Class implementation for 'SpkInspectorToolTest'

!		Instance methods for 'SpkInspectorToolTest'

category: 'tests'
method: SpkInspectorToolTest
testClassMembershipDescription

	tool := SpkInspectorTool on: nil.
	self
		assert: tool classMembershipDescription
		equals: 'an UndefinedObject'.

	tool := SpkInspectorTool on: nil class.
	self
		assert: tool classMembershipDescription
		equals: 'UndefinedObject'.

	tool := SpkInspectorTool on: 42.
	self assert: tool classMembershipDescription equals: 'a SmallInteger'.

	tool := SpkInspectorTool on: 'Hi!'.
	self assert: tool classMembershipDescription equals: 'a ' , '' class name asString.

	tool := SpkInspectorTool on: Object new.
	self assert: tool classMembershipDescription equals: 'an Object'.

	tool := SpkInspectorTool on: SpkTestSubclassOfNil basicNew.
	self
		assert: tool classMembershipDescription
		equals: 'a SpkTestSubclassOfNil'
%

category: 'tests'
method: SpkInspectorToolTest
testFieldToolsSize

	"Here, just testing that we get the right number of FieldTools back."

	tool := SpkInspectorTool on: nil.
	self assert: tool fieldTools size equals: 0.

	tool := SpkInspectorTool on: nil class.
	self assert: tool fieldTools size equals: 19.

	tool := SpkInspectorTool on: 42.
	self assert: tool fieldTools size equals: 0.

	tool := SpkInspectorTool on: 'Hi!'.
	self assert: tool fieldTools size equals: 3.

	tool := SpkInspectorTool on: Object new.
	self assert: tool fieldTools size equals: 0.

	tool := SpkInspectorTool on: SpkTestSubclassOfNil basicNew.
	self assert: tool fieldTools size equals: 2.

	tool := SpkInspectorTool on: SpkTestClassWithInfinitePrintOn new.
	self assert: tool fieldTools size equals: 0.

	"ZeroDivide has both inherited and declared named instvars"
	tool := SpkInspectorTool on: ZeroDivide new.
	self assert: tool fieldTools size equals: 11.

	"Class with both named and indexed instvars."
	tool := SpkInspectorTool on:
		        (SpkTestClassWithNamedAndIndexedInstvars new: 5).
	self assert: tool fieldTools size equals: 8
%

category: 'tests'
method: SpkInspectorToolTest
testOop
	| object |
	tool := SpkInspectorTool on: nil.
	self assert: tool oop equals: 16r14.
	tool := SpkInspectorTool on: 42.
	self assert: tool oop equals: 42 * 8 + 2.
	object := Object new.
	tool := SpkInspectorTool on: object.
	self assert: tool oop equals: object asOop.
	object := SpkTestSubclassOfNil basicNew.
	tool := SpkInspectorTool on: object.
	self assert: tool oop equals: (Reflection oopOf: object)
%

category: 'tests'
method: SpkInspectorToolTest
testSelfDescription

	| description |
	tool := SpkInspectorTool on: nil.
	self assert: tool selfDescription equals: 'nil'.

	tool := SpkInspectorTool on: nil class.
	self assert: tool selfDescription equals: 'UndefinedObject'.

	tool := SpkInspectorTool on: 42.
	self assert: tool selfDescription equals: '42'.

	tool := SpkInspectorTool on: 'Hi!'.
	self assert: tool selfDescription equals: '''Hi!'''.

	tool := SpkInspectorTool on: Object new.
	self assert: tool selfDescription equals: 'anObject'.

	tool := SpkInspectorTool on: SpkTestSubclassOfNil basicNew.
	self assert: tool selfDescription equals: ''.

	tool := SpkInspectorTool on: SpkTestClassWithInfinitePrintOn new.
	description := tool selfDescription.
	self
		assert: description size equals: 250000;
		assert: (description beginsWith: 'done yet? done yet? ');
		assert: (description endsWith: 'done yet? done yet? ')
%

! Class implementation for 'SpkServiceServerTest'

!		Instance methods for 'SpkServiceServerTest'

category: 'tests'
method: SpkServiceServerTest
testDefaultTaskspaceLayout
	"Basically, can we create a default taskspace and all its server-side bitses"

	| server layout |
	server := SpkTaskspaceRegistryServiceServer new.
	layout := server newDefaultTaskspaceLayout.
	self assert: layout class equals: SpkTaskspaceLayoutServiceServer
%

! Class implementation for 'SpkSmallStackTest'

!		Instance methods for 'SpkSmallStackTest'

category: 'running'
method: SpkSmallStackTest
setUp
	super setUp.
	stack := SpkSmallStack new
%

category: 'tests'
method: SpkSmallStackTest
testCollect
	self assert: stack isEmpty.
	stack push: 'first'.
	stack push: 'second'.
	stack push: 'third'.
	self
		assert: (stack collect: [ :each | each first ])
		equals: (OrderedCollection withAll: #($t $s $f))
%

category: 'tests'
method: SpkSmallStackTest
testEmptyStack
	self assert: stack isEmpty
%

category: 'tests'
method: SpkSmallStackTest
testPopWhenEmpty
	self should: [ stack pop ] raise: Error.
	stack push: 'aThing'.
	stack pop.
	self should: [ stack pop ] raise: Error
%

category: 'tests'
method: SpkSmallStackTest
testPushPop
	self assert: stack isEmpty.
	stack push: 'one'.
	self deny: stack isEmpty.
	stack push: 'two'.
	self deny: stack isEmpty.
	stack push: 'three'.
	self deny: stack isEmpty.
	self assert: stack pop equals: 'three'.
	self deny: stack isEmpty.
	self assert: stack pop equals: 'two'.
	self deny: stack isEmpty.
	self assert: stack pop equals: 'one'.
	self assert: stack isEmpty
%

category: 'tests'
method: SpkSmallStackTest
testReducingLimit
	self assert: stack limit equals: stack class defaultLimit.
	self assert: stack isEmpty.
	stack push: 'first'.
	stack push: 'second'.
	stack push: 'third'.
	stack limit: 2.
	self assert: stack pop equals: 'third'.
	self assert: stack pop equals: 'second'.
	self assert: stack isEmpty
%

category: 'tests'
method: SpkSmallStackTest
testStackLimit
	self assert: stack limit equals: stack class defaultLimit.
	stack limit: 2.
	self assert: stack isEmpty.
	stack push: 'first'.
	stack push: 'second'.
	stack push: 'third'.
	self assert: stack pop equals: 'third'.
	self assert: stack pop equals: 'second'.
	self assert: stack isEmpty
%

! Class implementation for 'SpkUndoManagerTest'

!		Instance methods for 'SpkUndoManagerTest'

category: 'support'
method: SpkUndoManagerTest
newAction

	^ SpkTestUndoableAction new
%

category: 'running'
method: SpkUndoManagerTest
setUp

	super setUp.
	manager := SpkUndoManager withLimit: 2
%

category: 'tests'
method: SpkUndoManagerTest
testDoClearsRedo

	"If you perform a new action (that is not a redo) the redo stack should be cleared. "

	| actions action1 action2 |
	actions := { 
		           (action1 := self newAction).
		           (action2 := self newAction) }.
	actions do: [ :action | manager performAction: action ].
	manager
		undo;
		undo.

	self deny: manager hasUndoableAction.
	self assert: manager hasRedoableAction.
	manager performAction: action1.
	self assert: manager hasUndoableAction.
	self deny: manager hasRedoableAction.
	self should: [ manager redo ] raise: Error
%

category: 'tests'
method: SpkUndoManagerTest
testEmptyUndo

	self
		deny: manager hasUndoableAction;
		deny: manager hasRedoableAction
%

category: 'tests'
method: SpkUndoManagerTest
testIndecision

	| action |
	action := self newAction.
	manager performAction: action.
	manager
		undo;
		redo;
		undo;
		redo.
	self
		assert: action isDone;
		assert: manager hasUndoableAction;
		deny: manager hasRedoableAction.
	manager undo.
	self
		deny: action isDone;
		deny: manager hasUndoableAction;
		assert: manager hasRedoableAction
%

category: 'tests'
method: SpkUndoManagerTest
testRedoUnderflow

	| actions action1 action2 action3 |
	actions := { 
		           (action1 := self newAction).
		           (action2 := self newAction).
		           (action3 := self newAction) }.
	actions do: [ :action | manager performAction: action ].
	manager
		undo;
		undo;
		redo;
		redo.

	self deny: manager hasRedoableAction.
	self should: [ manager redo ] raise: Error
%

category: 'tests'
method: SpkUndoManagerTest
testSingleRedo

	| action |
	action := self newAction.
	self
		assert: (manager performAction: action) equals: 42;
		assert: manager undo equals: nil;
		deny: action isDone;
		deny: manager hasUndoableAction;
		assert: manager hasRedoableAction;
		assert: manager redo equals: 42;
		assert: action isDone;
		assert: manager hasUndoableAction;
		deny: manager hasRedoableAction
%

category: 'tests'
method: SpkUndoManagerTest
testSingleUndo

	| action |
	action := self newAction.
	self
		deny: manager hasUndoableAction;
		deny: manager hasRedoableAction;
		deny: action isDone;
		assert: (manager performAction: action) equals: 42;
		assert: action isDone;
		assert: manager hasUndoableAction;
		deny: manager hasRedoableAction;
		assert: manager undo equals: nil;
		deny: action isDone;
		deny: manager hasUndoableAction;
		assert: manager hasRedoableAction
%

category: 'tests'
method: SpkUndoManagerTest
testUndoOverflow

	| actions action1 action2 action3 |
	actions := { 
		           (action1 := self newAction).
		           (action2 := self newAction).
		           (action3 := self newAction) }.
	actions do: [ :action | manager performAction: action ].
	actions do: [ :action | self assert: action isDone ].

	manager
		undo;
		redo;
		undo;
		undo.

	self
		assert: action1 isDone;
		deny: action2 isDone;
		deny: action3 isDone;
		deny: manager hasUndoableAction;
		assert: manager hasRedoableAction
%

category: 'tests'
method: SpkUndoManagerTest
testUndoUnderflow

	| actions action1 action2 action3 |
	actions := { 
		           (action1 := self newAction).
		           (action2 := self newAction).
		           (action3 := self newAction) }.
	actions do: [ :action | manager performAction: action ].
	manager
		undo;
		redo;
		undo;
		undo.

	self deny: manager hasUndoableAction.
	self should: [ manager undo ] raise: Error
%

! Class implementation for 'SpkLimitedWriteStream'

!		Class methods for 'SpkLimitedWriteStream'

category: 'accessing'
classmethod: SpkLimitedWriteStream
defaultLimit
	^ 200000
%

category: 'instance creation'
classmethod: SpkLimitedWriteStream
on: aCollection
	^ (self basicNew on: aCollection)
		setLimit: self defaultLimit
		limitBlock: nil
%

category: 'instance creation'
classmethod: SpkLimitedWriteStream
on: aCollection from: firstIndex to: lastIndex
	^ (self basicNew on: aCollection from: firstIndex to: lastIndex)
		setLimit: self defaultLimit
		limitBlock: nil
%

category: 'instance creation'
classmethod: SpkLimitedWriteStream
on: aCollection limit: anInteger limitBlock: aLimitBlock
	^ (self basicNew on: aCollection)
		setLimit: anInteger
		limitBlock: aLimitBlock
%

category: 'instance creation'
classmethod: SpkLimitedWriteStream
with: aCollection
	^ (self basicNew with: aCollection)
		setLimit: self defaultLimit
		limitBlock: nil
%

!		Instance methods for 'SpkLimitedWriteStream'

category: 'accessing'
method: SpkLimitedWriteStream
limit
	^ limit
%

category: 'accessing'
method: SpkLimitedWriteStream
limit: anInteger
	limit := anInteger.

	position > limit
		ifTrue: [ 
			position := limit.
			limitBlock value ]
%

category: 'accessing'
method: SpkLimitedWriteStream
limitBlock
	^ limitBlock
%

category: 'accessing'
method: SpkLimitedWriteStream
limitBlock: aBlock
	limitBlock := aBlock
%

category: 'accessing'
method: SpkLimitedWriteStream
nextPut: anObject
	"Ensure that the limit is not exceeded"

	position >= limit
		ifTrue: [ limitBlock value ]
		ifFalse: [ super nextPut: anObject ].
	^ anObject
%

category: 'accessing'
method: SpkLimitedWriteStream
nextPutAll: aCollection
	| newEnd |
	newEnd := position + aCollection size.

	newEnd > limit
		ifTrue: [ 
			collection size: limit.
			^ self nextPutAllUntilLimit: aCollection ].

	newEnd > writeLimit
		ifTrue: [ collection size: newEnd ].

	collection
		replaceFrom: position + 1
		to: newEnd
		with: aCollection
		startingAt: 1.
	position := newEnd.

	^ aCollection
%

category: 'private'
method: SpkLimitedWriteStream
nextPutAllUntilLimit: aCollection
	"Write up to the limit, and one beyond, so that #nextPut: will invoke the limit block."

	aCollection
		do: [ :each | 
			| isLastOne |
			isLastOne := position >= limit.
			self nextPut: each.
			isLastOne
				ifTrue: [ ^ aCollection ] ]
%

category: 'accessing'
method: SpkLimitedWriteStream
originalContents
	"Answer the receiver's actual contents collection, NOT a copy."

	^ collection
%

category: 'initialization'
method: SpkLimitedWriteStream
setLimit: anInteger limitBlock: aBlock
	"Limit the numer of elements this stream will write..."
	limit := anInteger.

	"Execute this (typically ^ contents) when that limit is exceded"
	limitBlock := aBlock.

	"To support legacy users, this test must be here too"
	position > limit
		ifTrue: [
			position := limit.
			limitBlock value ]
%

! Class extensions for 'SpkCompilationErrorTool'

!		Instance methods for 'SpkCompilationErrorTool'

category: '*Sparkle-Tools-GemStone'
method: SpkCompilationErrorTool
initializeFrom: aCompileError
	"Only report the first error detected."

	| errorDetails firstError |
	errorDetails := aCompileError errorDetails: nil.
	firstError := errorDetails at: 1.
	sourceCode := aCompileError sourceString.
	errorMessage := firstError at: 3.
	errorLocation := firstError at: 2
%

! Class extensions for 'SpkEvaluatorTool'

!		Instance methods for 'SpkEvaluatorTool'

category: '*Sparkle-Tools-GemStone'
method: SpkEvaluatorTool
compilationExceptionClass
        ^ CompileError
%

category: '*Sparkle-Tools-GemStone'
method: SpkEvaluatorTool
compileNewSourceCodeInContext: anObject
	^ newSourceCode
		_compileInContext: anObject
		symbolList: GsCurrentSession currentSession symbolList
%

category: '*Sparkle-Tools-GemStone'
method: SpkEvaluatorTool
evaluateMethod: method inContext: context
	| completion evaluatorDebugAction evaluationProcess resultTool debugAction |
	completion := Semaphore new.
	"Bugs in the debugger handled by evaluatorDebugAction."
	evaluatorDebugAction := Processor activeProcess debugActionBlock.
	debugAction := 
		[ :ex | | debuggerProcess processToDebug originalPriority|
		processToDebug := Processor activeProcess.
		originalPriority := processToDebug priority.
		debuggerProcess := 
			[ | debuggerTool |
			"Must suspend before initializing tool, or process state could change without the debugger realizing."
			processToDebug suspend. 
			debuggerTool := SpkDebuggerTool new 
				explorerTool: explorerTool;
				process: processToDebug;
				exception: ex;
				debugActionForContinue: debugAction.
			processToDebug == evaluationProcess
				ifTrue: [ resultTool := debuggerTool.
							completion signal ]
				ifFalse: [ self error: 'Not yet implemented'	"This error should be handled by RSR's debugAction block."	
							"debuggerTool announceInTaskspace: NeedToGetATaskspaceInScope" ] ] newProcess.
		self setPrioritiesOfDebugger: debuggerProcess relativeToDebugged: processToDebug.
		debuggerProcess
			debugActionBlock: evaluatorDebugAction;
		"This resume preempts processToDebug, and the debuggerProcess takes over."
			resume.
		" If I get here, the debugger has decided to proceed processToDebug.
		Its priority will have been changed if it was running at max priority, set it back before continuing."
		processToDebug priority: originalPriority  ].
	evaluationProcess := 
		[ | resultObject |
		resultObject := method _executeInContext: context.
		resultTool := (SpkInspectorTool on: resultObject)
			explorerTool: explorerTool;
			yourself.
		completion signal ] newProcess.
	evaluationProcess
		priority: self evaluationPriority;
		name: 'Evaluation';
		debugActionBlock: debugAction;
		breakpointLevel: 1;
		resume.
	completion wait.
	^ resultTool
%

category: '*Sparkle-Tools-GemStone'
method: SpkEvaluatorTool
evaluationPriority
	^ Processor userSchedulingPriority
%

category: '*Sparkle-Tools-GemStone'
method: SpkEvaluatorTool
setPrioritiesOfDebugger: debuggerProcess relativeToDebugged: processToDebug
	"In order to reliably suspend the debugged process, the debugger must run at a higher priority.
	Normally, just run the debugger one higher, but if that's impossible lower the debugged process priority.
	It will be restored upon continue (see #evaluateMethod:inContext:)."

	| debuggedPriority |
	debuggedPriority := processToDebug priority.
	debuggedPriority = Processor highestPriority
		ifFalse: [ debuggerProcess priority: debuggedPriority + 1 ]
		ifTrue: [ 
			debuggerProcess priority: debuggedPriority.
			processToDebug priority: debuggedPriority - 1 ]
%

! Class extensions for 'SpkObject'

!		Class methods for 'SpkObject'

category: '*Sparkle-Tools-GemStone'
classmethod: SpkObject
new
	^ super new initialize
%

!		Instance methods for 'SpkObject'

category: '*Sparkle-Tools-GemStone'
method: SpkObject
flag: anObject
	"Look at senders of #flag: to find code that needs further attention"
%

category: '*Sparkle-Tools-GemStone'
method: SpkObject
initialize
	"Subclasses can do what they like; default is to do nothing."
%

! Class Initialization

run
SpkExplorerServiceServer initialize.
true
%
