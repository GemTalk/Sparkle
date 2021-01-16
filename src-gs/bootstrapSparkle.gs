! Copyright (C) GemTalk Systems 1986-2020.  All Rights Reserved.
! Class Declarations
! Generated file, do not Edit

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
	subclass: 'Announcement'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Announcements-Core-GemStone';
		comment: 'This class is the superclass for events that someone might want to announce, such as a button click or an attribute change. Typically you create subclasses for your own events you want to announce.';
		immediateInvariant.
true.
%

removeallmethods Announcement
removeallclassmethods Announcement

doit
(Announcement
	subclass: 'AnnouncementMockA'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Announcements-Core-GemStone-Test';
		comment: 'This is a simple test mock.';
		immediateInvariant.
true.
%

removeallmethods AnnouncementMockA
removeallclassmethods AnnouncementMockA

doit
(Announcement
	subclass: 'AnnouncementMockB'
	instVarNames: #( parameter )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Announcements-Core-GemStone-Test';
		comment: 'This is a simple test mock';
		immediateInvariant.
true.
%

removeallmethods AnnouncementMockB
removeallclassmethods AnnouncementMockB

doit
(AnnouncementMockB
	subclass: 'AnnouncementMockC'
	instVarNames: #( announcingCounter )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Announcements-Core-GemStone-Test';
		comment: 'This is a simple test mock';
		immediateInvariant.
true.
%

removeallmethods AnnouncementMockC
removeallclassmethods AnnouncementMockC

doit
(Announcement
	subclass: 'AnnouncementMockD'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Announcements-Core-GemStone-Test';
		immediateInvariant.
true.
%

removeallmethods AnnouncementMockD
removeallclassmethods AnnouncementMockD

doit
(Announcement
	subclass: 'GemToGemAnnouncement'
	instVarNames: #( signalMessage sessionSerialNum )
	classVars: #( RegisteredSessions Registry )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Announcements-Core-GemStone';
		immediateInvariant.
true.
%

removeallmethods GemToGemAnnouncement
removeallclassmethods GemToGemAnnouncement

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
(Object
	subclass: 'AnnouncementSubscription'
	instVarNames: #( announcer announcementClass subscriber action )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Announcements-Core-GemStone';
		comment: 'The subscription is a single entry in a SubscriptionRegistry.
Several subscriptions by the same object is possible.

I know how to make myself weak or strong, only use this capability if it can''t be determined at subscribe time though, as it uses become: (for thread-safety), which is quite slow.';
		immediateInvariant.
true.
%

removeallmethods AnnouncementSubscription
removeallclassmethods AnnouncementSubscription

doit
(Object
	subclass: 'Announcer'
	instVarNames: #( registry deliveryErrorHandler )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Announcements-Core-GemStone';
		comment: 'The implementation uses a threadsafe subscription registry, in the sense that registering, unregistering, and announcing from an announcer at the same time in different threads should never cause failures.

GemStone adds a "delivery error handler" to catch errors during delivery of announcements.
The default handler invokes the default action for the exception.
The ignore handler ignores the error and simply returns from the #deliver: method.
The report to GCI handler bypasses any default action and immediately returns to the GCI.
A developer can specify a customer block, as desired.
Additionally, one can specify a custom handler around the #announce: message senf and automatically revert to the previous handler afterward.';
		immediateInvariant.
true.
%

removeallmethods Announcer
removeallclassmethods Announcer

doit
(Object
	subclass: 'AnnouncerSubscriberMockA'
	instVarNames: #( announcer )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Announcements-Core-GemStone-Test';
		comment: 'I am a mock class for testing in announcers';
		immediateInvariant.
true.
%

removeallmethods AnnouncerSubscriberMockA
removeallclassmethods AnnouncerSubscriberMockA

doit
(AnnouncerSubscriberMockA
	subclass: 'AnnouncerSubscriberMockB'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Announcements-Core-GemStone-Test';
		comment: 'I am a mock class for testing in announcers';
		immediateInvariant.
true.
%

removeallmethods AnnouncerSubscriberMockB
removeallclassmethods AnnouncerSubscriberMockB

doit
(Object
	subclass: 'MessageSend'
	instVarNames: #( receiver selector arguments )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Announcements-Core-GemStone';
		immediateInvariant.
true.
%

removeallmethods MessageSend
removeallclassmethods MessageSend

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
	subclass: 'SpkInspectorFieldTool'
	instVarNames: #( explorerTool inspectorTool value name index selfDescription )
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
(SpkInspectorFieldTool
	subclass: 'SpkInspectorIndexedInstvarTool'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-Common';
		comment: 'I provide tool-layer services for one indexed instvar of an inspected object.';
		immediateInvariant.
true.
%

removeallmethods SpkInspectorIndexedInstvarTool
removeallclassmethods SpkInspectorIndexedInstvarTool

doit
(SpkInspectorFieldTool
	subclass: 'SpkInspectorNamedInstvarTool'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-Common';
		comment: 'I provide tool-layer services for one named instvar of an inspected object.';
		immediateInvariant.
true.
%

removeallmethods SpkInspectorNamedInstvarTool
removeallclassmethods SpkInspectorNamedInstvarTool

doit
(SpkTool
	subclass: 'SpkInspectorTool'
	instVarNames: #( explorerTool inspectedObject fieldTools evaluatorTools )
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
(Object
	subclass: 'SubscriptionRegistry'
	instVarNames: #( subscriptions monitor )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Announcements-Core-GemStone';
		comment: 'The subscription registry is a threadsafe storage for the subscriptions to an Announcer.

In Pharo, subscriptionsFor: protocol is not implemented.
This is because Announcer does not provide public access to its registery for encapsulation reasons.
(We do not want access to the announcer from action blocks to break encapsulation to other subscribers)';
		immediateInvariant.
true.
%

removeallmethods SubscriptionRegistry
removeallclassmethods SubscriptionRegistry

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
(Set
	subclass: 'AnnouncementSet'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Announcements-Core-GemStone';
		comment: 'If you want to register the same action for multiple events, simply create an AnnouncementSet using a comma: 

	Parent>>initialize 
	    super initialize. 
	    self session announcer on: AddChild, RemoveChild do: [:it | self changeChild: it child]
	
Motivation example: Often the UI is built after/independently from the model. You want to have the model raise fine-grained announcements to enable the layers on top, but sometimes it is easier in the UI to refresh everything whenever something happens.';
		immediateInvariant.
true.
%

removeallmethods AnnouncementSet
removeallclassmethods AnnouncementSet

doit
(TestCase
	subclass: 'AnnouncementSetTest'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Announcements-Core-GemStone-Test';
		comment: 'SUnit tests for announcement sets';
		immediateInvariant.
true.
%

removeallmethods AnnouncementSetTest
removeallclassmethods AnnouncementSetTest

doit
(TestCase
	subclass: 'AnnouncerTest'
	instVarNames: #( announcer )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Announcements-Core-GemStone-Test';
		comment: 'An AnnouncerTest is a test class used to test Announcer.

Instance Variables
	announcer:		<Announcer>  the announcer to test

announcer
	- the announcer that is tested
';
		immediateInvariant.
true.
%

removeallmethods AnnouncerTest
removeallclassmethods AnnouncerTest

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

! Class implementation for 'Announcement'

!		Class methods for 'Announcement'

category: 'public'
classmethod: Announcement
, anAnnouncementClass
	^ AnnouncementSet with: self with: anAnnouncementClass
%

category: 'public'
classmethod: Announcement
andSubclasses
	^ AnnouncementSet withAll: self withAllSubclasses
%

category: 'converting'
classmethod: Announcement
asAnnouncement
	^ self new
%

category: 'deprecated'
classmethod: Announcement
handles: anAnnouncement
	^ self handlesAnnouncement: anAnnouncement
%

category: 'testing'
classmethod: Announcement
handlesAnnouncement: anAnnouncement
	"The receiver acts as a filter to determine whether subscribers who used the receiver as signaling tag (event identifier class or symbol) should receive incoming announcement. In particular, registering to a superclass will receive the announcements from all subclasses."

	^ anAnnouncement isKindOf: self
%

category: 'instance creation'
classmethod: Announcement
new

	^super new
		initialize;
		yourself.
%

!		Instance methods for 'Announcement'

category: 'converting'
method: Announcement
asAnnouncement
	^ self
%

category: 'initialization'
method: Announcement
prepareForDelivery
	"This method will be executed once before subscriptions delivery.
	If nobody subscribed on me this method will not be called.
	It allows to put some heavy initialization logic here. It will be executed only 
	if there is interest on me"
%

! Class implementation for 'AnnouncementMockB'

!		Class methods for 'AnnouncementMockB'

category: 'instance creation'
classmethod: AnnouncementMockB
with: anObject
	^self new 
		parameter: anObject 
%

!		Instance methods for 'AnnouncementMockB'

category: 'accessing'
method: AnnouncementMockB
parameter
	^ parameter
%

category: 'accessing'
method: AnnouncementMockB
parameter: anObject
	parameter := anObject
%

! Class implementation for 'AnnouncementMockC'

!		Instance methods for 'AnnouncementMockC'

category: 'accessing'
method: AnnouncementMockC
announcingCounter
	^ announcingCounter
%

category: 'initialization'
method: AnnouncementMockC
initialize
	super initialize.
	announcingCounter := 0
%

category: 'initialization'
method: AnnouncementMockC
prepareForDelivery

	announcingCounter := announcingCounter + 1
%

! Class implementation for 'GemToGemAnnouncement'

!		Class methods for 'GemToGemAnnouncement'

category: 'accessing'
classmethod: GemToGemAnnouncement
announcer

	| ann |
	ann := SessionTemps current at: #GemToGemAnnouncement_Announcer otherwise: nil.
	ann == nil 
		ifTrue: [
			ann := Announcer new.
			SessionTemps current at: #GemToGemAnnouncement_Announcer put: ann].
	^ann
%

category: 'announcing'
classmethod: GemToGemAnnouncement
broadcast

	self new broadcast
%

category: 'announcing'
classmethod: GemToGemAnnouncement
broadcastMessage: aString

	(self new
		signalMessage: aString;
		yourself) broadcast
%

category: 'registration'
classmethod: GemToGemAnnouncement
cleanRegisteredSessions
	(self registeredSessions select: [ :each | ((System descriptionOfSessionSerialNum: each) at: 1) == nil ])
		do: [ :each | self registeredSessions remove: each ]
%

category: 'initialization'
classmethod: GemToGemAnnouncement
initialize
	"self initialize"
	
	RegisteredSessions := RcIdentityBag new: 100.
	Registry := Dictionary new.
	self allSubclasses do: [:cl | cl initialize].
%

category: 'announcing'
classmethod: GemToGemAnnouncement
installStaticHandler
  | handler |
  self registeredSessions add: GsCurrentSession currentSession serialNumber.
  handler := InterSessionSignal addDefaultHandler: [:ex |
     GemToGemAnnouncement signal: ex sentInt 
               message: ex sentMessage 
	      sessionSerialNum: ex sendingSession .
     System enableSignaledGemStoneSessionError .
     ex resume
  ].
  SessionTemps current at: #GemToGemStaticException put: handler.
  System enableSignaledGemStoneSessionError.
%

category: 'accessing'
classmethod: GemToGemAnnouncement
registeredSessions
	
	RegisteredSessions == nil ifTrue: [ RegisteredSessions := RcIdentityBag new: 100 ].
	^RegisteredSessions
%

category: 'registration'
classmethod: GemToGemAnnouncement
registerForGemToGemSignalling

	self registry at: self signalNumber put: self
%

category: 'accessing'
classmethod: GemToGemAnnouncement
registry

	Registry == nil ifTrue: [ Registry := Dictionary new ].
	^Registry
%

category: 'instance creation'
classmethod: GemToGemAnnouncement
signal: aSignal message: aString sessionSerialNum: aSerialNumber

	| cl  |
	cl := self registry at: aSignal ifAbsent: [ ^self ].
	self announcer announce: (cl new
		signalMessage: aString;
		sessionSerialNum: aSerialNumber;
		yourself)
%

category: 'constants'
classmethod: GemToGemAnnouncement
signalNumber

	^0
%

category: 'testing'
classmethod: GemToGemAnnouncement
staticHandlerInstalled

	^(SessionTemps current at: #GemToGemStaticException otherwise: nil) ~~ nil
%

category: 'announcing'
classmethod: GemToGemAnnouncement
uninstallStaticHandler

  | handler |
  self registeredSessions removeIfPresent: GsCurrentSession currentSession serialNumber.
  handler := SessionTemps current at: #GemToGemStaticException otherwise: nil.
  System disableSignaledGemStoneSessionError.
  handler ifNotNil: [ Exception removeStaticException: handler ].
%

!		Instance methods for 'GemToGemAnnouncement'

category: 'signalling'
method: GemToGemAnnouncement
broadcast

	| badSerialNumbers |
	badSerialNumbers := Array new.
	self registeredSessions do: [:aSessionSerialNumber |
		[System _sendSignal: self signalNumber toSess: aSessionSerialNumber withMessage: self signalMessage]
			on: Error
			do: [:ex | 
				"Gem is no longer around or no longer listening"
				badSerialNumbers add: aSessionSerialNumber.
				ex return]].
	self registeredSessions removeAll: badSerialNumbers
%

category: 'accessing'
method: GemToGemAnnouncement
registeredSessions

	^self class registeredSessions
%

category: 'signalling'
method: GemToGemAnnouncement
replyToSenderWithSignal: aSignalNumber message: aString

	System 
		_sendSignal: aSignalNumber 
		toSess: sessionSerialNum 
		withMessage: aString
%

category: 'accessing'
method: GemToGemAnnouncement
sessionSerialNum

	^sessionSerialNum
%

category: 'accessing'
method: GemToGemAnnouncement
sessionSerialNum: aSerialNumber

	sessionSerialNum := aSerialNumber
%

category: 'accessing'
method: GemToGemAnnouncement
signalMessage

	signalMessage == nil ifTrue: [ signalMessage := '' ].
	^signalMessage
%

category: 'accessing'
method: GemToGemAnnouncement
signalMessage: aString

	aString size > 1023 ifTrue: [self error: 'message too large for Gem to Gem Signalling'].
	signalMessage := aString
%

category: 'accessing'
method: GemToGemAnnouncement
signalNumber

	^self class signalNumber
%

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

! Class implementation for 'AnnouncementSubscription'

!		Instance methods for 'AnnouncementSubscription'

category: 'accessing'
method: AnnouncementSubscription
action

	^ action
%

category: 'accessing'
method: AnnouncementSubscription
action: anObject

	action := anObject
%

category: 'accessing'
method: AnnouncementSubscription
announcementClass

	^ announcementClass
%

category: 'accessing'
method: AnnouncementSubscription
announcementClass: anObject

	announcementClass := anObject
%

category: 'accessing'
method: AnnouncementSubscription
announcer

	^ announcer
%

category: 'accessing'
method: AnnouncementSubscription
announcer: anAnnouncer
	announcer := anAnnouncer
%

category: 'announcing'
method: AnnouncementSubscription
deliver: anAnnouncement
	" deliver an announcement to receiver. In case of failure, it will be handled in separate process"

	^ (self handlesAnnouncement: anAnnouncement ) ifTrue: [
		[action cull: anAnnouncement cull: announcer] 
"Pharo has:
			on: UnhandledError fork: [:ex | ex pass ]]
GemStone has:
"			on: Error
			do: announcer deliveryErrorHandler]
%

category: 'testing'
method: AnnouncementSubscription
handlesAnnouncement: anAnnouncement

	^ announcementClass handlesAnnouncement: anAnnouncement
%

category: 'accessing'
method: AnnouncementSubscription
subscriber
	^ subscriber
%

category: 'accessing'
method: AnnouncementSubscription
subscriber: aSubscriber
	subscriber := aSubscriber
%

category: 'accessing'
method: AnnouncementSubscription
valuable: aValuable
	"Used when subscriber should be extracted from valuable object"
	self action:  aValuable.
	self subscriber: aValuable receiver.
%

! Class implementation for 'Announcer'

!		Class methods for 'Announcer'

category: 'instance creation'
classmethod: Announcer
new

	^super new
		initialize;
		yourself.
%

!		Instance methods for 'Announcer'

category: 'announce'
method: Announcer
announce: anAnnouncement

	| announcement |
	announcement := anAnnouncement asAnnouncement.	
	registry ifNotNil: [
		registry deliver: announcement
		].
	^ announcement
%

category: 'private'
method: Announcer
basicSubscribe: subscription
	^ registry add: subscription
%

category: 'exception handling'
method: Announcer
defaultDeliveryErrors
	self deliveryErrorHandler: [ :ex | ex defaultAction ]
%

category: 'exception handling'
method: Announcer
deliveryErrorHandler
	"Answer the one argument block exception handler to be 
	 used when delivering announcements encounters an error.
	 The argument to the block will be the exception that
	 was thrown (Error or a subclass of it)."

	^ deliveryErrorHandler
%

category: 'exception handling'
method: Announcer
deliveryErrorHandler: aOneArgBlock
	"Set the exception handler to be used when delivering
	 announcements encounters an error.
	 The argument to the block will be the exception that
	 was thrown (Error or a subclass of it)."

	deliveryErrorHandler := aOneArgBlock
%

category: 'exception handling'
method: Announcer
during: aBlock handleDeliveryErrorsUsing: anExceptionHandler
	| savedHandler |
	savedHandler := self deliveryErrorHandler.
	self deliveryErrorHandler: anExceptionHandler.
	^ aBlock
		ensure: [ self deliveryErrorHandler: savedHandler ]
%

category: 'testing'
method: Announcer
handleSubscriberClass: eventClass
	^ self subscriptions 
		ifNil: [ false ]
		ifNotNil: [:subscriptions | subscriptions handleSubscriberClass: eventClass]
%

category: 'testing'
method: Announcer
hasSubscriber: anObject

	registry subscriptionsOf: anObject do: [:each | ^ true].
	^ false
%

category: 'exception handling'
method: Announcer
ignoreDeliveryErrors
	self deliveryErrorHandler: [ :ex | ex return ]
%

category: 'initialization'
method: Announcer
initialize
	super initialize.
	registry := SubscriptionRegistry new.
	self defaultDeliveryErrors.
%

category: 'statistics'
method: Announcer
numberOfSubscriptions
	^ registry numberOfSubscriptions
%

category: 'subscription'
method: Announcer
removeSubscription: subscription
	"Remove the given subscription from the receiver"
	
	^ registry remove: subscription
%

category: 'private'
method: Announcer
replace: subscription with: newOne
	^ registry replace: subscription with: newOne
%

category: 'exception handling'
method: Announcer
reportToGciOnDeliveryErrors
	self deliveryErrorHandler: [ :ex | ex _signalGciError ]
%

category: 'accessing'
method: Announcer
subscriptions

	^ registry
%

category: 'accessing'
method: Announcer
subscriptionsForClass: subscriberClass
	"Return the list of subscription for a given class"
	^ self subscriptions subscriptionsForClass: subscriberClass
%

category: 'subscription'
method: Announcer
unsubscribe: anObject
	"Unsubscribe all subscriptions of anObject from the receiver"
	
	registry removeSubscriber: anObject
%

category: 'registration api'
method: Announcer
when: anAnnouncementClass do: aValuable
	"Declare that when anAnnouncementClass is raised, aValuable is executed.  Pay attention that such method as well as #when:do: should not be used on weak announcer since the block holds the receiver and more strongly."
	
	aValuable hasReceiver ifFalse: [self error: 'Cannot determine aValuable''s subscriber. Use #when:do:for:, instead.'].
	^ self when: anAnnouncementClass do: aValuable for: aValuable receiver
%

category: 'subscription'
method: Announcer
when: anAnnouncementClass do: aValuable for: aSubscriber
	"Declare that when anAnnouncementClass is raised, aValuable is executed and define the subscriber."
	
	^ registry add: (
		AnnouncementSubscription new 
			announcer: self;
			announcementClass: anAnnouncementClass;
			valuable: aValuable;
			subscriber: aSubscriber;
			yourself)
%

category: 'registration api'
method: Announcer
when: anAnnouncementClass send: aSelector to: anObject
	"Declare that when anAnnouncementClass is raised, anObject should receive the message aSelector.
    When the message expects one argument (eg #fooAnnouncement:) the announcement is passed as argument.
    When the message expects two arguments (eg #fooAnnouncement:announcer:) both the announcement and 
    the announcer are passed as argument"

	^ self
		when: anAnnouncementClass
		do: (MessageSend receiver: anObject selector: aSelector)
%

! Class implementation for 'AnnouncerSubscriberMockA'

!		Instance methods for 'AnnouncerSubscriberMockA'

category: 'accessing'
method: AnnouncerSubscriberMockA
announcer
	^ announcer
%

category: 'accessing'
method: AnnouncerSubscriberMockA
announcer: anAnnouncer
	announcer := anAnnouncer
%

category: 'events'
method: AnnouncerSubscriberMockA
registerEvents
	self announcer when: AnnouncementMockA do: [ :evt | " something" ] for: self "GemStone can't identiy this block's receiver".
%

! Class implementation for 'MessageSend'

!		Class methods for 'MessageSend'

category: 'instance creation'
classmethod: MessageSend
message: aMessage to: anObject
	^ self
		receiver: anObject
		selector: aMessage selector
		arguments: aMessage arguments
%

category: 'instance creation'
classmethod: MessageSend
receiver: anObject selector: aSymbol
	^ self receiver: anObject selector: aSymbol arguments: #()
%

category: 'instance creation'
classmethod: MessageSend
receiver: anObject selector: aSymbol argument: aParameter
	^ self receiver: anObject selector: aSymbol arguments: (Array with: aParameter)
%

category: 'instance creation'
classmethod: MessageSend
receiver: anObject selector: aSymbol arguments: anArray
	^ self new
		receiver: anObject;
		selector: aSymbol;
		arguments: anArray
%

!		Instance methods for 'MessageSend'

category: 'comparing'
method: MessageSend
= anObject
	^ anObject species == self species 
		and: [receiver == anObject receiver
		and: [selector == anObject selector
		and: [arguments = anObject arguments]]]
%

category: 'accessing'
method: MessageSend
arguments
	^ arguments
%

category: 'accessing'
method: MessageSend
arguments: anArray
	arguments := anArray
%

category: 'private'
method: MessageSend
collectArguments: anArgArray
	"Private"

	| staticArgs |
	staticArgs := self arguments.
	^ anArgArray size = staticArgs size
		ifTrue: [ anArgArray ]
		ifFalse: [ 
			(staticArgs isEmpty
				ifTrue: [ staticArgs := Array new: selector numArgs ]
				ifFalse: [ staticArgs copy ])
				replaceFrom: 1
				to: (anArgArray size min: staticArgs size)
				with: anArgArray
				startingAt: 1 ]
%

category: 'evaluating'
method: MessageSend
cull: arg
	^ selector numArgs = 0
		ifTrue: [ self value ]
		ifFalse: [ self value: arg ]
%

category: 'evaluating'
method: MessageSend
cull: arg1 cull: arg2
	^ selector numArgs < 2
		ifTrue: [ self cull: arg1 ]
		ifFalse: [ self value: arg1 value: arg2 ]
%

category: 'evaluating'
method: MessageSend
cull: arg1 cull: arg2 cull: arg3
	^ selector numArgs < 3
		ifTrue: [ self cull: arg1 cull: arg2 ]
		ifFalse: [ self value: arg1 value: arg2 value: arg3 ]
%

category: 'comparing'
method: MessageSend
hash
	^ receiver hash bitXor: selector hash
%

category: 'testing'
method: MessageSend
hasReceiver

	^true
%

category: 'testing'
method: MessageSend
isMessageSend
	^true
%

category: 'testing'
method: MessageSend
isValid
	^true
%

category: 'accessing'
method: MessageSend
message
	^ Message selector: selector arguments: arguments
%

category: 'accessing'
method: MessageSend
numArgs
	"Answer the number of arguments in this message"

	^ arguments size
%

category: 'printing'
method: MessageSend
printOn: aStream
	aStream
		nextPutAll: self class name;
		nextPut: $(;
		print: selector;
		nextPutAll: ' -> ';
		print: receiver;
		nextPut: $)
%

category: 'accessing'
method: MessageSend
receiver
	^ receiver
%

category: 'accessing'
method: MessageSend
receiver: anObject
	receiver := anObject
%

category: 'accessing'
method: MessageSend
selector
	^ selector
%

category: 'accessing'
method: MessageSend
selector: aSymbol
	selector := aSymbol
%

category: 'evaluating'
method: MessageSend
value
	"Send the message and answer the return value"

	arguments ifNil: [ ^ receiver perform: selector ].

	^ receiver perform: selector withArguments: (self collectArguments: arguments)
%

category: 'evaluating'
method: MessageSend
value: anObject
	^ receiver perform: selector with: anObject
%

category: 'evaluating'
method: MessageSend
value: anObject1 value: anObject2
	^ receiver perform: selector with: anObject1 with: anObject2
%

category: 'evaluating'
method: MessageSend
value: anObject1 value: anObject2 value: anObject3
	^ receiver
		perform: selector
		with: anObject1
		with: anObject2
		with: anObject3
%

category: 'evaluating'
method: MessageSend
valueWithArguments: anArray
	^ receiver perform: selector withArguments: (self collectArguments: anArray)
%

category: 'evaluating'
method: MessageSend
valueWithEnoughArguments: anArray
	"call the selector with enough arguments from arguments and anArray"

	| args |
	args := Array new: selector numArgs.
	args
		replaceFrom: 1
		to: (arguments size min: args size)
		with: arguments
		startingAt: 1.
	args size > arguments size
		ifTrue: [ 
			args
				replaceFrom: arguments size + 1
				to: (arguments size + anArray size min: args size)
				with: anArray
				startingAt: 1 ].
	^ receiver perform: selector withArguments: args
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

	| context method resultObject |
	context := inspectorTool inspectedObject.

	[ method := self compileNewSourceCodeInContext: context ]
		on: self compilationExceptionClass
		do: [ :ex | ^ self toolForCompilationError: ex ].


	[ resultObject := self evaluateMethod: method inContext: context ]
		on: Error
		do: [ :ex | ^ self toolForRuntimeError: ex ].
	^ (SpkInspectorTool on: resultObject)
		  explorerTool: explorerTool;
		  yourself
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

category: 'tool creation'
method: SpkEvaluatorTool
toolForRuntimeError: anError

	^ SpkRuntimeErrorTool forException: anError
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

! Class implementation for 'SpkInspectorFieldTool'

!		Instance methods for 'SpkInspectorFieldTool'

category: 'accessing'
method: SpkInspectorFieldTool
explorerTool

	^ explorerTool
%

category: 'accessing'
method: SpkInspectorFieldTool
explorerTool: anObject

	explorerTool := anObject
%

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
inspectorTool

	^ inspectorTool
%

category: 'accessing'
method: SpkInspectorFieldTool
inspectorTool: anObject

	inspectorTool := anObject
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

category: 'accessing'
method: SpkInspectorFieldTool
selfDescription

	^ selfDescription
%

category: 'accessing'
method: SpkInspectorFieldTool
selfDescription: anObject

	selfDescription := anObject
%

category: 'accessing'
method: SpkInspectorFieldTool
value

	^ value
%

category: 'accessing'
method: SpkInspectorFieldTool
value: anObject

	value := anObject
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
explorerTool

	^ explorerTool
%

category: 'accessing'
method: SpkInspectorTool
explorerTool: anObject

	explorerTool := anObject
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
		value := SpkReflection
			         fetchIndexedInstvarAt: index
			         from: inspectedObject.
		fieldTool := SpkInspectorIndexedInstvarTool new.
		fieldTool
			value: value;
			explorerTool: explorerTool;
			inspectorTool: self;
			index: index;
			name: index printString;
			selfDescription: (self selfDescriptionOf: value).
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
		value := SpkReflection
			         fetchNamedInstvarAt: index
			         from: inspectedObject.
		fieldTool := SpkInspectorNamedInstvarTool new.
		fieldTool
			value: value;
			explorerTool: explorerTool;
			inspectorTool: self;
			index: index;
			name: (names at: index);
			selfDescription: (self selfDescriptionOf: value).
		fieldTools add: fieldTool ]
%

category: 'accessing'
method: SpkInspectorTool
inspectedObject

	^ inspectedObject
%

category: 'private'
method: SpkInspectorTool
inspectedObject: anObject

	inspectedObject := anObject
%

category: 'instance creation'
method: SpkInspectorTool
newEvaluator

	^ SpkEvaluatorTool new
		  inspectorTool: self;
		  yourself
%

category: 'accessing'
method: SpkInspectorTool
oop

	"In Pharo, this is the identity hash, or 0 if #identityHash is not understood."

	^ SpkReflection identifierOf: inspectedObject
%

category: 'accessing'
method: SpkInspectorTool
selfDescription

	^ self selfDescriptionOf: inspectedObject
%

category: 'private'
method: SpkInspectorTool
selfDescriptionOf: anObject

        "Answer a string showing how the object describes itself using printOn:.
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
                to: anObject
                ifNotUnderstood: [  ].
        ^ stream contents
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

! Class implementation for 'SubscriptionRegistry'

!		Class methods for 'SubscriptionRegistry'

category: 'instance creation'
classmethod: SubscriptionRegistry
new

	^super new
		initialize;
		yourself.
%

!		Instance methods for 'SubscriptionRegistry'

category: 'add/remove'
method: SubscriptionRegistry
add: subscription
	^ self protected: [
		subscriptions add: subscription  ]
%

category: 'announcing'
method: SubscriptionRegistry
deliver: anAnnouncement
	|  interestedSubscriptions |
	"using a copy, so subscribers can unsubscribe from announcer "
	
	subscriptions isEmpty ifTrue: [ ^ self ].
	self protected: [ 
		interestedSubscriptions := self subscriptionsHandling: anAnnouncement ].
	interestedSubscriptions isEmpty ifTrue: [ ^self ].
	
	anAnnouncement prepareForDelivery.
	self deliver: anAnnouncement to: interestedSubscriptions
%

category: 'private'
method: SubscriptionRegistry
deliver: anAnnouncement to: subs
	^ self deliver: anAnnouncement to: subs startingAt: 1
%

category: 'private'
method: SubscriptionRegistry
deliver: anAnnouncement to: subs startingAt: startIndex
	
	startIndex to: subs size do: [ :index| | subscription |
		subscription := subs at: index.
		[ subscription deliver: anAnnouncement ] 
			"Ensure delivery to remaining announcements"
			ifCurtailed: [
				self deliver: anAnnouncement to: subs startingAt: index + 1 ]]
%

category: 'testing'
method: SubscriptionRegistry
handleSubscriberClass: eventClass
	"Return true if the receiver has a callback subscribed for the event class"

	^ subscriptions anySatisfy: [ :sub | sub subscriber isKindOf: eventClass ]
%

category: 'initialization'
method: SubscriptionRegistry
initialize
	monitor := Semaphore forMutualExclusion.
	self reset
%

category: 'accessing'
method: SubscriptionRegistry
numberOfSubscriptions
	^ subscriptions size
%

category: 'private'
method: SubscriptionRegistry
protected: aBlock
	^ monitor critical: [ aBlock value ]
%

category: 'add/remove'
method: SubscriptionRegistry
remove: subscription
	^ self protected: [
		subscriptions remove: subscription ifAbsent: nil ]

%

category: 'add/remove'
method: SubscriptionRegistry
removeSubscriber: subscriber
	
	^ self protected: [
		subscriptions removeAllSuchThat: [:subscription | subscription subscriber == subscriber ]]

%

category: 'add/remove'
method: SubscriptionRegistry
replace: subscription with: newOne

	" Note that it will signal an error if subscription is not there "
	self protected: [
		subscriptions remove: subscription.
		subscriptions add: newOne 
	].
	^ newOne
%

category: 'initialization'
method: SubscriptionRegistry
reset
	"subscriber -> subscriptions"
	
	subscriptions := IdentitySet new
	


%

category: 'accessing'
method: SubscriptionRegistry
subscriptions
	^ subscriptions
%

category: 'accessing'
method: SubscriptionRegistry
subscriptionsForClass: subscriberClass
	"Return the list of subscription for a given class"

	^ Array
		streamContents: [ :s | 
			subscriptions
				do: [ :each | 
					(each subscriber isKindOf: subscriberClass)
						ifTrue: [ s nextPut: each subscriber ] ] ]
%

category: 'accessing'
method: SubscriptionRegistry
subscriptionsHandling: anAnnouncement
	^ Array streamContents: [ :s|
			subscriptions do: [:each| 
				(each handlesAnnouncement: anAnnouncement)
					ifTrue: [ s nextPut: each ]]]
%

category: 'iterating'
method: SubscriptionRegistry
subscriptionsOf: aSubscriber do: aBlock
	| copy |
	
	self protected: [ copy := subscriptions copy ].
	
	copy do: 
		[:subscription | 
			subscription subscriber == aSubscriber 
				ifTrue: [ aBlock value: subscription ]	]
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

	fields := OrderedCollection new.
	tool fieldTools do: [ :fieldTool | 
		fields add: (SpkInspectorFieldServiceServer new
				 parentService: self;
				 initializeFromTool: fieldTool;
				 yourself) ]
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

	| objectToInspect newTool |
	objectToInspect := tool value.
	newTool := (SpkInspectorTool on: objectToInspect)
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

! Class implementation for 'AnnouncementSet'

!		Instance methods for 'AnnouncementSet'

category: 'adding'
method: AnnouncementSet
, anAnnouncementClass
	self add: anAnnouncementClass
%

category: 'deprecated'
method: AnnouncementSet
handles: anAnnouncement
	^ self handlesAnnouncement: anAnnouncement
%

category: 'testing'
method: AnnouncementSet
handlesAnnouncement: anAnnouncement
	"If any of the set handles the announcements, subscribers should receive it."
	^ self anySatisfy: [ :each | each handlesAnnouncement: anAnnouncement ]
%

! Class implementation for 'AnnouncementSetTest'

!		Instance methods for 'AnnouncementSetTest'

category: 'tests'
method: AnnouncementSetTest
testIncludeOnlyOnce
	| set |
	set := AnnouncementMockA , AnnouncementMockB , AnnouncementMockA.
	self assert: set size equals: 2
%

category: 'tests'
method: AnnouncementSetTest
testInstanceCreation
	| set |
	set := AnnouncementMockA , AnnouncementMockB.
	self assert: set size equals: 2
%

! Class implementation for 'AnnouncerTest'

!		Instance methods for 'AnnouncerTest'

category: 'private'
method: AnnouncerTest
newAnnouncer
	^ Announcer new
%

category: 'running'
method: AnnouncerTest
setUp
	super setUp.
	announcer := self newAnnouncer
%

category: 'tests - subscribers'
method: AnnouncerTest
testAccessingSubscribers
	| subscribers |
	subscribers := announcer subscriptionsForClass: self class.
	self assert: subscribers size equals: 0.
	
	announcer
		when: AnnouncementMockA
		do: [ "1" ]
		for: self "GemStone can't identiy this block's receiver".
	announcer
		when: AnnouncementMockB
		do: [ "2" ]
		for: self "GemStone can't identiy this block's receiver".
	subscribers := announcer subscriptionsForClass: self class.
	self assert: subscribers size equals: 2.
	
	subscribers do: [ :subscriber |	announcer unsubscribe: subscriber ].
	
	subscribers := announcer subscriptionsForClass: self class.
	self assert: subscribers size equals: 0.
	
%

category: 'tests'
method: AnnouncerTest
testAnnounceClass
	self assert: (announcer announce: AnnouncementMockA) class equals: AnnouncementMockA
%

category: 'tests'
method: AnnouncerTest
testAnnounceInstance
	| instance |
	instance := AnnouncementMockA new.
	self assert: (announcer announce: instance) equals: instance
%

category: 'tests - subscribing'
method: AnnouncerTest
testAnnounceWorkWithinExceptionHandlerBlocks
	|  found |
	
	announcer when: Announcement do: [ found := true ].
	
	[ "NotFound" Error signal ]
		on: "NotFound" Error
		do: [ announcer announce: Announcement new ].
		
	self assert: found
%

category: 'tests'
method: AnnouncerTest
testAnnouncingReentrant
	"Test that it is safe to announce when handling announcement,
	so announcer are reentrant"
 
	| bool ok |

	ok := bool := false.
	announcer when: Announcement do: [
		bool ifFalse: [
			bool := true.
			announcer announce:  Announcement new. ]
		ifTrue: [ ok := true ] 
	].

	self should: [ announcer announce: Announcement new. ] notTakeMoreThan: (Duration seconds: 1).
	self assert: ok

%

category: 'tests - subscribers'
method: AnnouncerTest
testHandleSubscriberClass
	announcer
		when: AnnouncementMockA
		do: [  ]
		for: self "GemStone can't identiy this block's receiver".
	self assert: (announcer handleSubscriberClass: self class).
	self deny: (announcer handleSubscriberClass: AnnouncementMockA).
%

category: 'tests'
method: AnnouncerTest
testIssue253
	"unsubscribe during announcement ... hard to duplicate problem since we're using an IdentityDictionary 
	 and collistionbucket density is a function of oop density"
	
	| block |
	block := [ :ann | announcer unsubscribe: block ].
	announcer
		when: AnnouncementMockA
			send: #value:
			to: block;
		when: AnnouncementMockB
			send: #value:
			to: block;
		when: AnnouncementMockC
			send: #value:
			to: block;
		when: AnnouncementMockD
			send: #value:
			to: block;
		yourself.
		
	announcer announce: AnnouncementMockA.
%

category: 'tests'
method: AnnouncerTest
testNoArgBlock
	"we are supposed to accept zero-argument blocks as actions "

	| counter |
	counter := nil.
	announcer
		when: AnnouncementMockA
		do: [ counter := 1 ]
		for: self "GemStone can't identiy this block's receiver".
	announcer announce: AnnouncementMockA new.
	self assert: counter equals: 1
%

category: 'tests'
method: AnnouncerTest
testPreparationAnnouncementDelivery
	| announcement |
	
	announcer when: AnnouncementMockC send: #value: to: [ :ann | #firstBlock ].
	announcer when: AnnouncementMockC send: #value: to: [ :ann | #lastBlock ].	
		
	announcement := AnnouncementMockC new.
	announcer announce: announcement.
	self assert: announcement announcingCounter equals: 1.
	announcer announce: announcement.
	self assert: announcement announcingCounter equals: 2.
	announcement := announcer announce: AnnouncementMockC.
	self assert: announcement announcingCounter equals: 1

%

category: 'tests'
method: AnnouncerTest
testPreparationAnnouncementDeliveryWhenNoSubscriptions

	| instance |
	announcer when: AnnouncementMockA send: #value: to: [ :ann | ].
		
	instance := announcer announce: AnnouncementMockC.
	
	self assert: instance announcingCounter equals: 0
%

category: 'tests - subscribing'
method: AnnouncerTest
testSubscribeBlock
	| announcement instance |
	announcer
		when: AnnouncementMockA
		do: [ :ann | announcement := ann ]
		for: self "GemStone can't identiy this block's receiver".
	announcement := nil.
	instance := announcer announce: AnnouncementMockA.
	self assert: announcement equals: instance.
	announcement := nil.
	instance := announcer announce: AnnouncementMockB.
	self assert: announcement isNil
%

category: 'test - subscribers'
method: AnnouncerTest
testSubscribersForClass
	| subscribers mockA mockB |
	self assert: announcer numberOfSubscriptions equals: 0.
	
	mockA := AnnouncerSubscriberMockA new.
	mockA announcer: announcer.
	mockB := AnnouncerSubscriberMockB new.
	mockB announcer: announcer.
	mockA registerEvents.
	mockB registerEvents.
	
	self assert: announcer numberOfSubscriptions > 0.
	subscribers := announcer subscriptionsForClass: AnnouncerSubscriberMockA.
	self assert: subscribers size equals: 2.
	"AnnouncerSubscriberMockB inherits AnnouncerSubscriberMockA"
	subscribers := announcer subscriptionsForClass: AnnouncerSubscriberMockB.
	self assert: subscribers size equals: 1.
	subscribers := announcer subscriptionsForClass: self class.
	self assert: subscribers size equals: 0.
%

category: 'tests - subscribing'
method: AnnouncerTest
testSubscribeSend
	| announcement instance |
	announcer when: AnnouncementMockA send: #value: to: [ :ann | announcement := ann ].
		
	announcement := nil.
	instance := announcer announce: AnnouncementMockA.
	self assert: announcement equals: instance.
	
	announcement := nil.
	instance := announcer announce: AnnouncementMockB new.
	self assert: announcement isNil
%

category: 'tests - subscribing'
method: AnnouncerTest
testSubscribeSet
	| announcement instance |
	announcer
		when: AnnouncementMockA , AnnouncementMockC
		do: [ :ann | announcement := ann ]
		for: self "GemStone can't identiy this block's receiver".
	announcement := nil.
	instance := announcer announce: AnnouncementMockA.
	self assert: announcement equals: instance.
	announcement := nil.
	instance := announcer announce: AnnouncementMockB.
	self assert: announcement isNil.
	announcement := nil.
	instance := announcer announce: AnnouncementMockC.
	self assert: announcement equals: instance
%

category: 'tests - subscribing'
method: AnnouncerTest
testSubscribeSubclass
	| announcement instance |
	announcer
		when: AnnouncementMockB
		do: [ :ann | announcement := ann ]
		for: self "GemStone can't identiy this block's receiver".
	announcement := nil.
	instance := announcer announce: AnnouncementMockA.
	self assert: announcement isNil.
	announcement := nil.
	instance := announcer announce: AnnouncementMockB.
	self assert: announcement equals: instance.
	announcement := nil.
	instance := announcer announce: AnnouncementMockC.
	self assert: announcement equals: instance
%

category: 'tests'
method: AnnouncerTest
testTwoArgBlock
	"we are supposed to accept two-argument blocks as actions "

	| flag |
	flag := false.
	announcer
		when: AnnouncementMockA
		do: [ :ann :announcer2 | flag := announcer2 == announcer ].
	announcer announce: AnnouncementMockA new.
	self assert: flag
%

category: 'tests - unsubscribing'
method: AnnouncerTest
testUnsubscribeBlock
	| announcement |
	announcer
		when: AnnouncementMockA
		do: [ :ann | announcement := ann ]
		for: self "GemStone can't identiy this block's receiver".
	announcer unsubscribe: self.
	announcement := nil.
	announcer announce: AnnouncementMockA new.
	self assert: announcement isNil
%

category: 'tests - unsubscribing'
method: AnnouncerTest
testUnsubscribeSend
	| announcement receiver |
	announcer when: AnnouncementMockA send: #value: to: (receiver := [ :ann | announcement := ann ]).
	announcer unsubscribe: receiver.

	announcement := nil.
	announcer announce: AnnouncementMockA new.
	self assert: announcement isNil
%

category: 'tests - unsubscribing'
method: AnnouncerTest
testUnsubscribeSet
	| announcement |
	announcer
		when: AnnouncementMockA , AnnouncementMockB
		do: [ :ann | announcement := ann ]
		for: self "GemStone can't identiy this block's receiver".
	announcer unsubscribe: self.
	announcement := nil.
	announcer announce: AnnouncementMockA new.
	self assert: announcement isNil.
	announcement := nil.
	announcer announce: AnnouncementMockB new.
	self assert: announcement isNil
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

! Class extensions for 'Collection'

!		Instance methods for 'Collection'

category: '*Announcements-Extensions-GemStone'
method: Collection
removeAllSuchThat: aBlock
	"Remove all elements of the receiver for which aBlock returns true.
	 Answer the removed elements.
	 This is a fallback implementation. It is not efficient."

	| toBeRemoved |
	toBeRemoved := self select: aBlock.
	self removeAll: toBeRemoved.
	^ toBeRemoved
%

! Class extensions for 'ExecBlock'

!		Instance methods for 'ExecBlock'

category: '*Announcements-Extensions-GemStone'
method: ExecBlock
hasReceiver
	"Not all blocks record the receiver, so we need to know whether a block has done so."

	^ (staticLink notNil and: [self selfOffsetInVC > 1])
		or: [self _selfOffsetInSelf > 0]
%

category: '*Announcements-Extensions-GemStone'
method: ExecBlock
receiver

	^self selfValue
%

! Class extensions for 'Object'

!		Instance methods for 'Object'

category: '*Announcements-Extensions-GemStone'
method: Object
initialize
	"Placeholder so that subclasses can always safely use 'super initialize'."
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
	^ method _executeInContext: context
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

! Class extensions for 'TestAsserter'

!		Instance methods for 'TestAsserter'

category: '*Announcements-Extensions-GemStone'
method: TestAsserter
should: aBlock notTakeMoreThan: aDuration
	"Throw an exception if aBlock should take longer than aDuration to run.
	 This is a toy implementation. It is should stop after the time limit.
	 Instead, it just sees how long it took and complains if it was too long."

	| msToRun actualDuration |
	msToRun := Time millisecondsElapsedTime: aBlock.
	actualDuration := Duration seconds: msToRun / 1000.
	self assert: actualDuration <= aDuration
		description: 'Block evaluation took more than the expected ', aDuration printString.
	^ actualDuration
%

! Class Initialization

run
GemToGemAnnouncement initialize.
SpkExplorerServiceServer initialize.
true
%
