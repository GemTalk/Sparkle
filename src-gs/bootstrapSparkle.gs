! Copyright (C) GemTalk Systems 1986-2021.  All Rights Reserved.
! Class Declarations
! Generated file, do not Edit

doit
(Error
	subclass: 'RsrError'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		immediateInvariant.
true.
%

removeallmethods RsrError
removeallclassmethods RsrError

doit
(RsrError
	subclass: 'RsrAlreadyRegistered'
	instVarNames: #( service intendedConnection )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		immediateInvariant.
true.
%

removeallmethods RsrAlreadyRegistered
removeallclassmethods RsrAlreadyRegistered

doit
(RsrError
	subclass: 'RsrConnectionFailed'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		immediateInvariant.
true.
%

removeallmethods RsrConnectionFailed
removeallclassmethods RsrConnectionFailed

doit
(RsrError
	subclass: 'RsrHandshakeError'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrHandshakeError
removeallclassmethods RsrHandshakeError

doit
(RsrHandshakeError
	subclass: 'RsrProtocolVersionNegotiationFailed'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrProtocolVersionNegotiationFailed
removeallclassmethods RsrProtocolVersionNegotiationFailed

doit
(RsrHandshakeError
	subclass: 'RsrTokenExchangeFailed'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrTokenExchangeFailed
removeallclassmethods RsrTokenExchangeFailed

doit
(RsrError
	subclass: 'RsrNonresumableError'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		immediateInvariant.
true.
%

removeallmethods RsrNonresumableError
removeallclassmethods RsrNonresumableError

doit
(RsrError
	subclass: 'RsrOutOfRange'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		immediateInvariant.
true.
%

removeallmethods RsrOutOfRange
removeallclassmethods RsrOutOfRange

doit
(RsrError
	subclass: 'RsrPromiseError'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		immediateInvariant.
true.
%

removeallmethods RsrPromiseError
removeallclassmethods RsrPromiseError

doit
(RsrPromiseError
	subclass: 'RsrAlreadyResolved'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		immediateInvariant.
true.
%

removeallmethods RsrAlreadyResolved
removeallclassmethods RsrAlreadyResolved

doit
(RsrPromiseError
	subclass: 'RsrBrokenPromise'
	instVarNames: #( reason )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		immediateInvariant.
true.
%

removeallmethods RsrBrokenPromise
removeallclassmethods RsrBrokenPromise

doit
(RsrError
	subclass: 'RsrRemoteError'
	instVarNames: #( originalClassName stack )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrRemoteError
removeallclassmethods RsrRemoteError

doit
(RsrError
	subclass: 'RsrResumableError'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		immediateInvariant.
true.
%

removeallmethods RsrResumableError
removeallclassmethods RsrResumableError

doit
(RsrError
	subclass: 'RsrSocketError'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		immediateInvariant.
true.
%

removeallmethods RsrSocketError
removeallclassmethods RsrSocketError

doit
(RsrSocketError
	subclass: 'RsrConnectFailed'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		immediateInvariant.
true.
%

removeallmethods RsrConnectFailed
removeallclassmethods RsrConnectFailed

doit
(RsrSocketError
	subclass: 'RsrInvalidBind'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		immediateInvariant.
true.
%

removeallmethods RsrInvalidBind
removeallclassmethods RsrInvalidBind

doit
(RsrSocketError
	subclass: 'RsrSocketClosed'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		immediateInvariant.
true.
%

removeallmethods RsrSocketClosed
removeallclassmethods RsrSocketClosed

doit
(RsrError
	subclass: 'RsrUnknownClass'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		immediateInvariant.
true.
%

removeallmethods RsrUnknownClass
removeallclassmethods RsrUnknownClass

doit
(RsrError
	subclass: 'RsrUnknownSID'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		immediateInvariant.
true.
%

removeallmethods RsrUnknownSID
removeallclassmethods RsrUnknownSID

doit
(RsrError
	subclass: 'RsrUnsupportedObject'
	instVarNames: #( object )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		immediateInvariant.
true.
%

removeallmethods RsrUnsupportedObject
removeallclassmethods RsrUnsupportedObject

doit
(RsrError
	subclass: 'RsrWaitForConnectionCancelled'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		immediateInvariant.
true.
%

removeallmethods RsrWaitForConnectionCancelled
removeallclassmethods RsrWaitForConnectionCancelled

doit
(Exception
	subclass: 'RsrUnhandledException'
	instVarNames: #( exception )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		comment: 'This class is used in GemStone and Dolphin to help process unhandled exceptions. Pharo will used the native UnhandledError class.

This should not be signaled outside of the framework.';
		immediateInvariant.
true.
%

removeallmethods RsrUnhandledException
removeallclassmethods RsrUnhandledException

doit
(nil
	subclass: 'RsrProtoObject'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-GemStone';
		immediateInvariant.
true.
%

removeallmethods RsrProtoObject
removeallclassmethods RsrProtoObject

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
	subclass: 'RsrAnnouncement'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		immediateInvariant.
true.
%

removeallmethods RsrAnnouncement
removeallclassmethods RsrAnnouncement

doit
(RsrAnnouncement
	subclass: 'RsrConnectionStateAnnouncement'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrConnectionStateAnnouncement
removeallclassmethods RsrConnectionStateAnnouncement

doit
(RsrConnectionStateAnnouncement
	subclass: 'RsrConnectionClosed'
	instVarNames: #( connection )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		comment: 'This Announcement is used to signal that the specified Connection was closed.';
		immediateInvariant.
true.
%

removeallmethods RsrConnectionClosed
removeallclassmethods RsrConnectionClosed

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
	subclass: 'SpkExecutionAnnouncement'
	instVarNames: #( updatedServices )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-Common';
		comment: 'Execution has occurred. Values in inspectors may have changed.';
		immediateInvariant.
true.
%

removeallmethods SpkExecutionAnnouncement
removeallclassmethods SpkExecutionAnnouncement

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
	subclass: 'RsrForwarder'
	instVarNames: #( _service )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-GemStone';
		immediateInvariant.
true.
%

removeallmethods RsrForwarder
removeallclassmethods RsrForwarder

doit
(Object
	subclass: 'RsrObject'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		immediateInvariant.
true.
%

removeallmethods RsrObject
removeallclassmethods RsrObject

doit
(RsrObject
	subclass: 'RsrAbstractReason'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		comment: 'The superclass for Reasons generated for breaking Promise instances generated by the framework.

If the reason will be replicated, the Reason should subclass RsrReasonService.';
		immediateInvariant.
true.
%

removeallmethods RsrAbstractReason
removeallclassmethods RsrAbstractReason

doit
(RsrAbstractReason
	subclass: 'RsrConnectionClosedBeforeReceivingResponse'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrConnectionClosedBeforeReceivingResponse
removeallclassmethods RsrConnectionClosedBeforeReceivingResponse

doit
(RsrAbstractReason
	subclass: 'RsrDecodingRaisedException'
	instVarNames: #( exception )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrDecodingRaisedException
removeallclassmethods RsrDecodingRaisedException

doit
(RsrObject
	subclass: 'RsrAbstractService'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-GemStone';
		immediateInvariant.
true.
%

removeallmethods RsrAbstractService
removeallclassmethods RsrAbstractService

doit
(RsrAbstractService
	subclass: 'RsrService'
	instVarNames: #( _id _connection remoteSelf )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		comment: 'I represent a class of Objects that know offer Rsr Services.';
		immediateInvariant.
true.
%

removeallmethods RsrService
removeallclassmethods RsrService

doit
(RsrService
	subclass: 'RsrReasonService'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		comment: 'This Service services as an abstract superclass for various Promise break reasons that must support replication.';
		immediateInvariant.
true.
%

removeallmethods RsrReasonService
removeallclassmethods RsrReasonService

doit
(RsrReasonService
	subclass: 'RsrRemoteException'
	instVarNames: #( exceptionClassName tag messageText stack )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrRemoteException
removeallclassmethods RsrRemoteException

doit
(RsrRemoteException
	subclass: 'RsrRemoteExceptionClient'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrRemoteExceptionClient
removeallclassmethods RsrRemoteExceptionClient

doit
(RsrRemoteException
	subclass: 'RsrRemoteExceptionServer'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrRemoteExceptionServer
removeallclassmethods RsrRemoteExceptionServer

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
	instVarNames: #( description source currentStartPosition currentEndPosition localVariables updatedServices )
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
	instVarNames: #( processName processIdentifier processPriority exceptionDescription frames updatedServices replacementService )
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
	instVarNames: #( parentService )
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
	instVarNames: #( evaluationContext updatedServices )
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
	instVarNames: #( columns )
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
	instVarNames: #( tool referencedObject )
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
	subclass: 'SpkProcessTerminatedService'
	instVarNames: #( oop )
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

removeallmethods SpkProcessTerminatedService
removeallclassmethods SpkProcessTerminatedService

doit
(SpkProcessTerminatedService
	subclass: 'SpkProcessTerminatedServiceServer'
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

removeallmethods SpkProcessTerminatedServiceServer
removeallclassmethods SpkProcessTerminatedServiceServer

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
(RsrObject
	subclass: 'RsrBufferedSocketStream'
	instVarNames: #( stream outBuffer writePosition nextToWrite )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrBufferedSocketStream
removeallclassmethods RsrBufferedSocketStream

doit
(RsrObject
	subclass: 'RsrChannel'
	instVarNames: #( connection )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		comment: 'No class-specific documentation for RsrChannel, hierarchy is:
Object
  RsrObject
    RsrChannel
';
		immediateInvariant.
true.
%

removeallmethods RsrChannel
removeallclassmethods RsrChannel

doit
(RsrChannel
	subclass: 'RsrBinaryStreamChannel'
	instVarNames: #( sink source inStream outStream )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		comment: 'No class-specific documentation for RsrSocketChannel, hierarchy is:
Object
  RsrObject
    RsrChannel
      RsrSocketChannel( reader writer socket stream)
';
		immediateInvariant.
true.
%

removeallmethods RsrBinaryStreamChannel
removeallclassmethods RsrBinaryStreamChannel

doit
(RsrChannel
	subclass: 'RsrInMemoryChannel'
	instVarNames: #( inQueue outQueue drainProcess )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		comment: 'Example usage:

	| aQueue bQueue channelA channelB |
	aQueue := SharedQueue new.
	bQueue := SharedQueue new.
	channelA := RsrInMemoryChannel
		inQueue: aQueue
		outQueue: bQueue.
	channelB := RsrInMemoryChannel
		inQueue: bQueue
		outQueue: aQueue.
	connectionA := RsrConnection
		channel: channelA
		transactionSpigot: RsrThreadSafeNumericSpigot naturals
		oidSpigot: RsrThreadSafeNumericSpigot naturals.
	connectionB := RsrConnection
		channel: channelB
		transactionSpigot: RsrThreadSafeNumericSpigot naturals negated
		oidSpigot: RsrThreadSafeNumericSpigot naturals negated.
	connectionA open.
	connectionB open.';
		immediateInvariant.
true.
%

removeallmethods RsrInMemoryChannel
removeallclassmethods RsrInMemoryChannel

doit
(RsrObject
	subclass: 'RsrClassResolver'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-GemStone';
		immediateInvariant.
true.
%

removeallmethods RsrClassResolver
removeallclassmethods RsrClassResolver

doit
(RsrObject
	subclass: 'RsrCodec'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrCodec
removeallclassmethods RsrCodec

doit
(RsrCodec
	subclass: 'RsrCommandCodec'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrCommandCodec
removeallclassmethods RsrCommandCodec

doit
(RsrCommandCodec
	subclass: 'RsrCommandDecoder'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		comment: 'No class-specific documentation for RsrDecoder, hierarchy is:
Object
  RsrObject
    RsrCodec
      RsrDecoder( registry connection decodeCommandMap)
';
		immediateInvariant.
true.
%

removeallmethods RsrCommandDecoder
removeallclassmethods RsrCommandDecoder

doit
(RsrCommandCodec
	subclass: 'RsrCommandEncoder'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrCommandEncoder
removeallclassmethods RsrCommandEncoder

doit
(RsrCodec
	subclass: 'RsrProtocolVersionNegotiationCodec'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrProtocolVersionNegotiationCodec
removeallclassmethods RsrProtocolVersionNegotiationCodec

doit
(RsrCodec
	subclass: 'RsrTokenExchangeCodec'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrTokenExchangeCodec
removeallclassmethods RsrTokenExchangeCodec

doit
(RsrObject
	subclass: 'RsrCommand'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		comment: 'No class-specific documentation for RsrCommand, hierarchy is:
Object
  RsrObject
    RsrCommand( encoding)
';
		immediateInvariant.
true.
%

removeallmethods RsrCommand
removeallclassmethods RsrCommand

doit
(RsrCommand
	subclass: 'RsrMessagingCommand'
	instVarNames: #( snapshots transaction )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrMessagingCommand
removeallclassmethods RsrMessagingCommand

doit
(RsrMessagingCommand
	subclass: 'RsrDeliverResponse'
	instVarNames: #( responseReference )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		comment: 'No class-specific documentation for RsrDeliverResponse, hierarchy is:
Object
  RsrObject
    RsrCommand( encoding)
      RsrDeliverResponse( transaction response roots retainList)
';
		immediateInvariant.
true.
%

removeallmethods RsrDeliverResponse
removeallclassmethods RsrDeliverResponse

doit
(RsrMessagingCommand
	subclass: 'RsrSendMessage'
	instVarNames: #( receiverReference selectorReference argumentReferences )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		comment: 'No class-specific documentation for RsrSendMessage, hierarchy is:
Object
  RsrObject
    RsrCommand( encoding)
      RsrSendMessage( transaction receiver selector arguments retainList)
';
		immediateInvariant.
true.
%

removeallmethods RsrSendMessage
removeallclassmethods RsrSendMessage

doit
(RsrCommand
	subclass: 'RsrReleaseServices'
	instVarNames: #( sids )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		comment: 'No class-specific documentation for RsrReleaseServices, hierarchy is:
Object
  RsrObject
    RsrCommand( encoding)
      RsrReleaseServices( oids)
';
		immediateInvariant.
true.
%

removeallmethods RsrReleaseServices
removeallclassmethods RsrReleaseServices

doit
(RsrObject
	subclass: 'RsrConnection'
	instVarNames: #( channel transactionSpigot oidSpigot log registry pendingMessages specification announcer )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		comment: 'Connection is the central mediator for RSR. When using the framework, an associated application will hold onto Connection. When terminating or otherwise done with RSR, it will close the Connection to signal this.

Connection offers a limited public interface. The private methods are subject to change and shouldn''t be used by any application.

The Connection can be monitored by subscribing to any of the Announcements defined under ConnectionStateAnnouncement. See #announcer.

The Connection is generally created indirectly via one of the ConnectionSpecification subclasses.';
		immediateInvariant.
true.
%

removeallmethods RsrConnection
removeallclassmethods RsrConnection

doit
(RsrObject
	subclass: 'RsrConnectionSpecification'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrConnectionSpecification
removeallclassmethods RsrConnectionSpecification

doit
(RsrConnectionSpecification
	subclass: 'RsrInternalConnectionSpecification'
	instVarNames: #( connectionA connectionB )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrInternalConnectionSpecification
removeallclassmethods RsrInternalConnectionSpecification

doit
(RsrInternalConnectionSpecification
	subclass: 'RsrInMemoryConnectionSpecification'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrInMemoryConnectionSpecification
removeallclassmethods RsrInMemoryConnectionSpecification

doit
(RsrInternalConnectionSpecification
	subclass: 'RsrInternalSocketConnectionSpecification'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrInternalSocketConnectionSpecification
removeallclassmethods RsrInternalSocketConnectionSpecification

doit
(RsrConnectionSpecification
	subclass: 'RsrSocketConnectionSpecification'
	instVarNames: #( host port )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		comment: 'This class is abstract and defines the interface for manufacturing RsrConnection instances which are connected to a peer.

Specialized subclasses are reponsible for either listening for or initiating connections with a peer.';
		immediateInvariant.
true.
%

removeallmethods RsrSocketConnectionSpecification
removeallclassmethods RsrSocketConnectionSpecification

doit
(RsrSocketConnectionSpecification
	subclass: 'RsrAcceptConnection'
	instVarNames: #( listener isListening isWaitingForConnection )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrAcceptConnection
removeallclassmethods RsrAcceptConnection

doit
(RsrAcceptConnection
	subclass: 'RsrGciAcceptConnection'
	instVarNames: #( token )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrGciAcceptConnection
removeallclassmethods RsrGciAcceptConnection

doit
(RsrSocketConnectionSpecification
	subclass: 'RsrInitiateConnection'
	instVarNames: #( token )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		comment: 'This class is responsible for initating a new RsrConnection. Sending #connect will result in an attempt to connect to the specified host and port. #connect is responsible for initating the attempted connection. If successful, an instance of RsrConnection is returned as a result.

Example: 

| initiator |
initiator := RsrInitiateConnection
	host: ''127.0.0.1''
	port: 51820.
^initiator connect';
		immediateInvariant.
true.
%

removeallmethods RsrInitiateConnection
removeallclassmethods RsrInitiateConnection

doit
(RsrInitiateConnection
	subclass: 'RsrGciInitiateConnection'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrGciInitiateConnection
removeallclassmethods RsrGciInitiateConnection

doit
(RsrObject
	subclass: 'RsrDateAndTime'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		immediateInvariant.
true.
%

removeallmethods RsrDateAndTime
removeallclassmethods RsrDateAndTime

doit
(RsrObject
	subclass: 'RsrEnvironment'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-GemStone';
		immediateInvariant.
true.
%

removeallmethods RsrEnvironment
removeallclassmethods RsrEnvironment

doit
(RsrObject
	subclass: 'RsrEphemeron'
	instVarNames: #( key mournAction )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-GemStone';
		immediateInvariant.
true.
%

removeallmethods RsrEphemeron
removeallclassmethods RsrEphemeron

doit
(RsrObject
	subclass: 'RsrGarbageCollector'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-GemStone';
		immediateInvariant.
true.
%

removeallmethods RsrGarbageCollector
removeallclassmethods RsrGarbageCollector

doit
(RsrObject
	subclass: 'RsrHandshake'
	instVarNames: #( steps stream )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrHandshake
removeallclassmethods RsrHandshake

doit
(RsrObject
	subclass: 'RsrHandshakeStep'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrHandshakeStep
removeallclassmethods RsrHandshakeStep

doit
(RsrHandshakeStep
	subclass: 'RsrProtocolVersionNegotiation'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		comment: 'This class serves as the abstract superclass for the classes which implement the actual handshake protocol.

When the Client opens a Socket to the Server, it is responsible for sending the first message.

Client -> Server: SupportedVersions
Server -> Client:
	alt: The Server and Client have overlap in their supported versions
		- Server -> Client: ChosenVersion
	alt: No overlap exists between the Client and Server.
		- Server -> Client: NoVersionOverlap
		- Server: Closes socket';
		immediateInvariant.
true.
%

removeallmethods RsrProtocolVersionNegotiation
removeallclassmethods RsrProtocolVersionNegotiation

doit
(RsrProtocolVersionNegotiation
	subclass: 'RsrProtocolVersionNegotiationClient'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrProtocolVersionNegotiationClient
removeallclassmethods RsrProtocolVersionNegotiationClient

doit
(RsrProtocolVersionNegotiation
	subclass: 'RsrProtocolVersionNegotiationServer'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrProtocolVersionNegotiationServer
removeallclassmethods RsrProtocolVersionNegotiationServer

doit
(RsrHandshakeStep
	subclass: 'RsrTokenExchange'
	instVarNames: #( token )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrTokenExchange
removeallclassmethods RsrTokenExchange

doit
(RsrTokenExchange
	subclass: 'RsrTokenReceiver'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrTokenReceiver
removeallclassmethods RsrTokenReceiver

doit
(RsrTokenExchange
	subclass: 'RsrTokenSender'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrTokenSender
removeallclassmethods RsrTokenSender

doit
(RsrObject
	subclass: 'RsrLog'
	instVarNames: #( verbosity sinks )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrLog
removeallclassmethods RsrLog

doit
(RsrObject
	subclass: 'RsrLogSink'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrLogSink
removeallclassmethods RsrLogSink

doit
(RsrLogSink
	subclass: 'RsrCustomSink'
	instVarNames: #( action )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrCustomSink
removeallclassmethods RsrCustomSink

doit
(RsrLogSink
	subclass: 'RsrTranscriptSink'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrTranscriptSink
removeallclassmethods RsrTranscriptSink

doit
(RsrObject
	subclass: 'RsrLogWithPrefix'
	instVarNames: #( prefix log )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrLogWithPrefix
removeallclassmethods RsrLogWithPrefix

doit
(RsrObject
	subclass: 'RsrMessageSend'
	instVarNames: #( receiver selector arguments )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrMessageSend
removeallclassmethods RsrMessageSend

doit
(RsrObject
	subclass: 'RsrNumericSpigot'
	instVarNames: #( current step )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrNumericSpigot
removeallclassmethods RsrNumericSpigot

doit
(RsrNumericSpigot
	subclass: 'RsrThreadSafeNumericSpigot'
	instVarNames: #( mutex )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrThreadSafeNumericSpigot
removeallclassmethods RsrThreadSafeNumericSpigot

doit
(RsrObject
	subclass: 'RsrPendingMessage'
	instVarNames: #( services promise )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrPendingMessage
removeallclassmethods RsrPendingMessage

doit
(RsrObject
	subclass: 'RsrPromise'
	instVarNames: #( mutex value state resolvedMutex resolutionActions )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		comment: 'Purpose: Provide a simple Promise interface for use in RSR.

A Promise may be in two high level states -- unresolved and resolved. Resolving a promise means either breaking or fulfilling the promise. Any users of the Notification Interface will be notified of the resolution. See individual methods for details.

Resolution Interface:
- #break:
- #fulfill:

Notification Interface:
- #when:catch:
- #wait
- #value

Example Usage:

```
	| promise |
	promise := Promise new.
	promise
		when: [:anObject | Transcript show: ''Promise fulfilled to: '', anObject asString; cr]
		catch: [:reason | Transcript show: ''Promise broken because of '', reason asString; cr].
	"Time passes"
	promise fulfill: Object new
```

```
	| promise |
	promise := Promise new.
	self runAsynCalculationThenFulfill: promise.
	promise wait.
```';
		immediateInvariant.
true.
%

removeallmethods RsrPromise
removeallclassmethods RsrPromise

doit
(RsrObject
	subclass: 'RsrPromiseResolutionAction'
	instVarNames: #( when catch )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrPromiseResolutionAction
removeallclassmethods RsrPromiseResolutionAction

doit
(RsrObject
	subclass: 'RsrProtocolVersionNegotiationMessage'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		comment: 'HandshakeMessage serves as a superclass for all Messages used while processing a Connection Handshake.';
		immediateInvariant.
true.
%

removeallmethods RsrProtocolVersionNegotiationMessage
removeallclassmethods RsrProtocolVersionNegotiationMessage

doit
(RsrProtocolVersionNegotiationMessage
	subclass: 'RsrChosenVersion'
	instVarNames: #( version )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		comment: 'This message is sent when a Server has chosen a version it is willing to talk w/ a client Connection. The Server expects the Client to speak this version.';
		immediateInvariant.
true.
%

removeallmethods RsrChosenVersion
removeallclassmethods RsrChosenVersion

doit
(RsrProtocolVersionNegotiationMessage
	subclass: 'RsrNoVersionOverlap'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		comment: 'This message is sent when a Server has determined it cannot talk any version of the protocol that the Client has requested to speak.';
		immediateInvariant.
true.
%

removeallmethods RsrNoVersionOverlap
removeallclassmethods RsrNoVersionOverlap

doit
(RsrProtocolVersionNegotiationMessage
	subclass: 'RsrSupportedVersions'
	instVarNames: #( versions )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		comment: 'When a Client connects to a Server. It is required to send this message w/ the list of supported protocol versions it is willing to speak. The preference of the client is signified by the order of the version numbers in <versions>.';
		immediateInvariant.
true.
%

removeallmethods RsrSupportedVersions
removeallclassmethods RsrSupportedVersions

doit
(RsrObject
	subclass: 'RsrReference'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #( referenceMapping )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		comment: 'RsrReference

Reference instances are created as a by-product of freezing the state of a Service. This typically happens when the framework creates a SendMessage or DeliverResponse command.

The Reference represents and is able to resolve the object it represents. In some cases, the value is immediate. In the case of ServiceReference, the stored Service Identifier is resolved in the context of a connection.

Resolving must occur in the context of a Connection. Though this is true, the minimal information necessary for a Reference to resolve is the Registry.

SendMessage and DeliverResponse store fields like receiver or result as references. They are resolved when the Command is set to execute.

Collaborators:
- ServiceSnapshot
- Encoder
- Decoder';
		immediateInvariant.
true.
%

removeallmethods RsrReference
removeallclassmethods RsrReference

doit
(RsrReference
	subclass: 'RsrImmediateReference'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		comment: 'No class-specific documentation for RsrImmediateReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference( value)
';
		immediateInvariant.
true.
%

removeallmethods RsrImmediateReference
removeallclassmethods RsrImmediateReference

doit
(RsrImmediateReference
	subclass: 'RsrBooleanReference'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		comment: 'No class-specific documentation for RsrBooleanReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference
        RsrBooleanReference
';
		immediateInvariant.
true.
%

removeallmethods RsrBooleanReference
removeallclassmethods RsrBooleanReference

doit
(RsrBooleanReference
	subclass: 'RsrFalseReference'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		comment: 'No class-specific documentation for RsrFalseReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference
        RsrFalseReference
';
		immediateInvariant.
true.
%

removeallmethods RsrFalseReference
removeallclassmethods RsrFalseReference

doit
(RsrBooleanReference
	subclass: 'RsrTrueReference'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		comment: 'No class-specific documentation for RsrTrueReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference( value)
        RsrTrueReference
';
		immediateInvariant.
true.
%

removeallmethods RsrTrueReference
removeallclassmethods RsrTrueReference

doit
(RsrImmediateReference
	subclass: 'RsrNilReference'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		comment: 'No class-specific documentation for RsrNilReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference
        RsrNilReference
';
		immediateInvariant.
true.
%

removeallmethods RsrNilReference
removeallclassmethods RsrNilReference

doit
(RsrImmediateReference
	subclass: 'RsrValueReference'
	instVarNames: #( intermediate )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		comment: 'No class-specific documentation for RsrValueReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference
        RsrValueReference( value)
';
		immediateInvariant.
true.
%

removeallmethods RsrValueReference
removeallclassmethods RsrValueReference

doit
(RsrValueReference
	subclass: 'RsrByteArrayReference'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		comment: 'No class-specific documentation for RsrByteArrayReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference
        RsrValueReference( value)
          RsrByteArrayReference
';
		immediateInvariant.
true.
%

removeallmethods RsrByteArrayReference
removeallclassmethods RsrByteArrayReference

doit
(RsrValueReference
	subclass: 'RsrCharacterArrayReference'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		comment: 'No class-specific documentation for RsrCharacterArrayReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference
        RsrCharacterArrayReference
';
		immediateInvariant.
true.
%

removeallmethods RsrCharacterArrayReference
removeallclassmethods RsrCharacterArrayReference

doit
(RsrCharacterArrayReference
	subclass: 'RsrStringReference'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		comment: 'No class-specific documentation for RsrStringReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference
        RsrCharacterArrayReference( value)
          RsrStringReference
';
		immediateInvariant.
true.
%

removeallmethods RsrStringReference
removeallclassmethods RsrStringReference

doit
(RsrCharacterArrayReference
	subclass: 'RsrSymbolReference'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		comment: 'No class-specific documentation for RsrSymbolReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference
        RsrCharacterArrayReference( value)
          RsrSymbolReference
';
		immediateInvariant.
true.
%

removeallmethods RsrSymbolReference
removeallclassmethods RsrSymbolReference

doit
(RsrValueReference
	subclass: 'RsrCharacterReference'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		comment: 'No class-specific documentation for RsrCharacterReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference
        RsrValueReference( value)
          RsrCharacterReference
';
		immediateInvariant.
true.
%

removeallmethods RsrCharacterReference
removeallclassmethods RsrCharacterReference

doit
(RsrValueReference
	subclass: 'RsrCollectionReference'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		comment: 'No class-specific documentation for RsrCollectionReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference
        RsrValueReference( value)
          RsrCollectionReference
';
		immediateInvariant.
true.
%

removeallmethods RsrCollectionReference
removeallclassmethods RsrCollectionReference

doit
(RsrCollectionReference
	subclass: 'RsrArrayReference'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		comment: 'No class-specific documentation for RsrArrayReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference
        RsrValueReference( value)
          RsrArrayReference
';
		immediateInvariant.
true.
%

removeallmethods RsrArrayReference
removeallclassmethods RsrArrayReference

doit
(RsrCollectionReference
	subclass: 'RsrDictionaryReference'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		comment: 'No class-specific documentation for RsrDictionaryReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference
        RsrValueReference( value)
          RsrDictionaryReference
';
		immediateInvariant.
true.
%

removeallmethods RsrDictionaryReference
removeallclassmethods RsrDictionaryReference

doit
(RsrCollectionReference
	subclass: 'RsrOrderedCollectionReference'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		comment: 'No class-specific documentation for RsrOrderedCollectionReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference
        RsrValueReference( value)
          RsrOrderedCollectionReference
';
		immediateInvariant.
true.
%

removeallmethods RsrOrderedCollectionReference
removeallclassmethods RsrOrderedCollectionReference

doit
(RsrCollectionReference
	subclass: 'RsrSetReference'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		comment: 'No class-specific documentation for RsrSetReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference
        RsrValueReference( value)
          RsrSetReference
';
		immediateInvariant.
true.
%

removeallmethods RsrSetReference
removeallclassmethods RsrSetReference

doit
(RsrValueReference
	subclass: 'RsrDateAndTimeReference'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		comment: 'No class-specific documentation for RsrDateAndTimeReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference
        RsrValueReference( value)
          RsrDateAndTimeReference
';
		immediateInvariant.
true.
%

removeallmethods RsrDateAndTimeReference
removeallclassmethods RsrDateAndTimeReference

doit
(RsrValueReference
	subclass: 'RsrDoubleReference'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		immediateInvariant.
true.
%

removeallmethods RsrDoubleReference
removeallclassmethods RsrDoubleReference

doit
(RsrValueReference
	subclass: 'RsrIntegerReference'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		comment: 'No class-specific documentation for RsrIntegerReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference
        RsrIntegerReference( value)
';
		immediateInvariant.
true.
%

removeallmethods RsrIntegerReference
removeallclassmethods RsrIntegerReference

doit
(RsrIntegerReference
	subclass: 'RsrNegativeIntegerReference'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		comment: 'No class-specific documentation for RsrNegativeIntegerReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference
        RsrIntegerReference( value)
          RsrNegativeIntegerReference
';
		immediateInvariant.
true.
%

removeallmethods RsrNegativeIntegerReference
removeallclassmethods RsrNegativeIntegerReference

doit
(RsrIntegerReference
	subclass: 'RsrPositiveIntegerReference'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		comment: 'No class-specific documentation for RsrPositiveIntegerReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference
        RsrIntegerReference( value)
          RsrPositiveIntegerReference
';
		immediateInvariant.
true.
%

removeallmethods RsrPositiveIntegerReference
removeallclassmethods RsrPositiveIntegerReference

doit
(RsrReference
	subclass: 'RsrServiceReference'
	instVarNames: #( sid )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		comment: 'No class-specific documentation for RsrServiceReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrServiceReference( sid)
';
		immediateInvariant.
true.
%

removeallmethods RsrServiceReference
removeallclassmethods RsrServiceReference

doit
(RsrObject
	subclass: 'RsrRegistryEntry'
	instVarNames: #( ephemeron strongStorage )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-GemStone';
		immediateInvariant.
true.
%

removeallmethods RsrRegistryEntry
removeallclassmethods RsrRegistryEntry

doit
(RsrObject
	subclass: 'RsrRemotePromiseResolver'
	instVarNames: #( mutex sendMessage connection extraRoots hasResolved )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		comment: 'This class is responsible for taking breaking or fulfilling its associated Promise. The Promise exists in the remote RSR instance.

This class may be mutated outside of the thread which created it. Therefore, it contains a protection mutex to ensure consistency.';
		immediateInvariant.
true.
%

removeallmethods RsrRemotePromiseResolver
removeallclassmethods RsrRemotePromiseResolver

doit
(RsrObject
	subclass: 'RsrScientist'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-GemStone';
		immediateInvariant.
true.
%

removeallmethods RsrScientist
removeallclassmethods RsrScientist

doit
(RsrObject
	subclass: 'RsrServiceEphemeron'
	instVarNames: #( service action )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-GemStone';
		immediateInvariant.
true.
%

removeallmethods RsrServiceEphemeron
removeallclassmethods RsrServiceEphemeron

doit
(RsrObject
	subclass: 'RsrServiceSnapshot'
	instVarNames: #( sid targetClassName slots )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		comment: 'RsrServiceSnapshot

When a SendMessage or DeliverResponse command is processed, the entire transition closure of the MessageSend/Response is analyzed.

A Snapshot of each Service found during this process is taken. The slots of the Service that need to be replicated are stored in the ServiceSnapshot as references.

In addition, information about the template and service is stored. This allows the peer to reify the correct type of Service. For instance, a local Client will be a Server remotely. A local Server will become a remote Client.

Collaborators:
- Encoder
- Decoder
- Reference';
		immediateInvariant.
true.
%

removeallmethods RsrServiceSnapshot
removeallclassmethods RsrServiceSnapshot

doit
(RsrObject
	subclass: 'RsrSnapshotAnalysis'
	instVarNames: #( roots snapshots connection analyzedObjects )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		comment: 'No class-specific documentation for RsrSnapshotAnalysis, hierarchy is:
Object
  RsrObject
    RsrSnapshotAnalysis( roots snapshots inFlight connection)
';
		immediateInvariant.
true.
%

removeallmethods RsrSnapshotAnalysis
removeallclassmethods RsrSnapshotAnalysis

doit
(RsrObject
	subclass: 'RsrSocket'
	instVarNames: #( nativeSocket )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-GemStone';
		immediateInvariant.
true.
%

removeallmethods RsrSocket
removeallclassmethods RsrSocket

doit
(RsrObject
	subclass: 'RsrStream'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrStream
removeallclassmethods RsrStream

doit
(RsrStream
	subclass: 'RsrSocketStream'
	instVarNames: #( socket )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrSocketStream
removeallclassmethods RsrSocketStream

doit
(RsrObject
	subclass: 'RsrStreamChannelLoop'
	instVarNames: #( process channel state )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		comment: 'No class-specific documentation for RsrEventLoop, hierarchy is:
Object
  RsrObject
    RsrEventLoop( process connection state)
';
		immediateInvariant.
true.
%

removeallmethods RsrStreamChannelLoop
removeallclassmethods RsrStreamChannelLoop

doit
(RsrStreamChannelLoop
	subclass: 'RsrCommandSink'
	instVarNames: #( queue )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		comment: 'No class-specific documentation for RsrCommandSink, hierarchy is:
Object
  RsrObject
    RsrEventLoop( process connection state)
      RsrCommandSink( queue)
';
		immediateInvariant.
true.
%

removeallmethods RsrCommandSink
removeallclassmethods RsrCommandSink

doit
(RsrStreamChannelLoop
	subclass: 'RsrCommandSource'
	instVarNames: #( decoder )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrCommandSource
removeallclassmethods RsrCommandSource

doit
(RsrObject
	subclass: 'RsrThreadSafeDictionary'
	instVarNames: #( mutex map )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		comment: 'I maintain the associations between locally stored objects and their remote counterparts.';
		immediateInvariant.
true.
%

removeallmethods RsrThreadSafeDictionary
removeallclassmethods RsrThreadSafeDictionary

doit
(RsrObject
	subclass: 'RsrTokenExchangeMessage'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		immediateInvariant.
true.
%

removeallmethods RsrTokenExchangeMessage
removeallclassmethods RsrTokenExchangeMessage

doit
(RsrTokenExchangeMessage
	subclass: 'RsrToken'
	instVarNames: #( bytes )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		immediateInvariant.
true.
%

removeallmethods RsrToken
removeallclassmethods RsrToken

doit
(RsrTokenExchangeMessage
	subclass: 'RsrTokenAccepted'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrTokenAccepted
removeallclassmethods RsrTokenAccepted

doit
(RsrTokenExchangeMessage
	subclass: 'RsrTokenRejected'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		immediateInvariant.
true.
%

removeallmethods RsrTokenRejected
removeallclassmethods RsrTokenRejected

doit
(Object
	subclass: 'RsrPlatformInitializer'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication';
		comment: 'Does load-time initialization of any class instance variables of classes defined in Base but that have platform-specific contents and thus can''t be initialized by their own package, and can''t be lazily initialized because that fails on GemStone for non-privileged users.';
		immediateInvariant.
true.
%

removeallmethods RsrPlatformInitializer
removeallclassmethods RsrPlatformInitializer

doit
(Object
	subclass: 'RsrProcessModel'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #( current )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Base';
		immediateInvariant.
true.
%

removeallmethods RsrProcessModel
removeallclassmethods RsrProcessModel

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
	instVarNames: #( newSourceCode oldSourceCode announcement )
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
	subclass: 'SpkProcessFrameInfo'
	instVarNames: #( frameContents level description isNativeStack calleeIsAsync )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-GemStone';
		comment: 'I hold a snapshot of the state of one frame of a process at one point in time.
I should be created by sending #forProcess:level:.';
		immediateInvariant.
true.
%

removeallmethods SpkProcessFrameInfo
removeallclassmethods SpkProcessFrameInfo

doit
(SpkObject
	subclass: 'SpkProcessManager'
	instVarNames: #( process taskspaceTool debuggerDebugAction debuggerTool )
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

removeallmethods SpkProcessManager
removeallclassmethods SpkProcessManager

doit
(SpkProcessManager
	subclass: 'SpkProcessLauncherAndManager'
	instVarNames: #( explorerTool processPriority processName processBreakpointLevel result resultReady )
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

removeallmethods SpkProcessLauncherAndManager
removeallclassmethods SpkProcessLauncherAndManager

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
	subclass: 'SpkTool'
	instVarNames: #( announcer taskspaceTool )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-Common';
		comment: 'General services needed by tool objects.

Every tool has a reference to the tool for the taskspace that it is part of.';
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
	instVarNames: #( explorerTool debuggerTool process currentState previousState index isValid )
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
	instVarNames: #( explorerTool processManager process exceptionOfRecord currentException frames mustInitiate replacementTool )
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
	instVarNames: #( explorerTool inspectorTool oldSourceCode newSourceCode updatedServices )
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
	instVarNames: #( explorerTool )
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
	instVarNames: #( columns referencedObject )
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

removeallmethods SpkInspectorFieldTool
removeallclassmethods SpkInspectorFieldTool

doit
(SpkInspectionTool
	subclass: 'SpkInspectorTool'
	instVarNames: #( evaluatorTools views currentView inspectedObject )
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

removeallmethods SpkInspectorTool
removeallclassmethods SpkInspectorTool

doit
(SpkInspectionTool
	subclass: 'SpkInspectorViewTool'
	instVarNames: #( numberOfColumns fieldTools inspectedObject )
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

removeallmethods SpkInspectorViewTool
removeallclassmethods SpkInspectorViewTool

doit
(SpkInspectorViewTool
	subclass: 'SpkInspectorRawViewTool'
	instVarNames: #(  )
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

removeallmethods SpkInspectorRawViewTool
removeallclassmethods SpkInspectorRawViewTool

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
	subclass: 'SpkProcessTerminatedTool'
	instVarNames: #( process )
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

removeallmethods SpkProcessTerminatedTool
removeallclassmethods SpkProcessTerminatedTool

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
	instVarNames: #( explorerLayouts )
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
	subclass: 'SpkServiceFactory'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #( serviceClassesForToolTypes )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Services-Common';
		comment: 'Makes service servers out of tools in a centralized way.';
		immediateInvariant.
true.
%

removeallmethods SpkServiceFactory
removeallclassmethods SpkServiceFactory

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

! Class implementation for 'RsrAlreadyRegistered'

!		Class methods for 'RsrAlreadyRegistered'

category: 'instance creation'
classmethod: RsrAlreadyRegistered
signalService: aService
intendedConnection: aConnection

	^self new
		service: aService;
		intendedConnection: aConnection;
		signal
%

!		Instance methods for 'RsrAlreadyRegistered'

category: 'accessing'
method: RsrAlreadyRegistered
intendedConnection

	^intendedConnection
%

category: 'accessing'
method: RsrAlreadyRegistered
intendedConnection: aConnection

	intendedConnection := aConnection
%

category: 'accessing'
method: RsrAlreadyRegistered
service

	^service
%

category: 'accessing'
method: RsrAlreadyRegistered
service: aService

	service := aService
%

! Class implementation for 'RsrNonresumableError'

!		Instance methods for 'RsrNonresumableError'

category: 'testing'
method: RsrNonresumableError
isResumable

	^false
%

! Class implementation for 'RsrBrokenPromise'

!		Class methods for 'RsrBrokenPromise'

category: 'signaling'
classmethod: RsrBrokenPromise
signalReason: aReason

	^self new
		reason: aReason;
		signal
%

!		Instance methods for 'RsrBrokenPromise'

category: 'accessing'
method: RsrBrokenPromise
reason

	^reason
%

category: 'accessing'
method: RsrBrokenPromise
reason: aReason

	reason := aReason
%

! Class implementation for 'RsrRemoteError'

!		Class methods for 'RsrRemoteError'

category: 'instance creation'
classmethod: RsrRemoteError
from: anException

	| tag |
	tag := anException tag
		ifNotNil:
			[[anException tag asString]
				on: Error
				do: [:ex | ex return: 'Unable to pack #tag containing an instance of ', anException tag class name]].
	^self new
		originalClassName: anException class name;
		tag: tag;
		messageText: anException messageText;
		stack: RsrProcessModel currentStackDump;
		yourself
%

!		Instance methods for 'RsrRemoteError'

category: 'accessing'
method: RsrRemoteError
originalClassName

	^originalClassName
%

category: 'accessing'
method: RsrRemoteError
originalClassName: aSymbol

	originalClassName := aSymbol
%

category: 'accessing'
method: RsrRemoteError
stack

	^stack
%

category: 'accessing'
method: RsrRemoteError
stack: aString

	stack := aString
%

! Class implementation for 'RsrResumableError'

!		Instance methods for 'RsrResumableError'

category: 'testing'
method: RsrResumableError
isResumable

	^true
%

! Class implementation for 'RsrUnsupportedObject'

!		Class methods for 'RsrUnsupportedObject'

category: 'exceptioninstantiator'
classmethod: RsrUnsupportedObject
signal: anObject

	^self new
		object: anObject;
		messageText: 'Instances of #', anObject class name, ' do not support replication.';
		signal
%

!		Instance methods for 'RsrUnsupportedObject'

category: 'accessing'
method: RsrUnsupportedObject
object

	^object
%

category: 'accessing'
method: RsrUnsupportedObject
object: anObject

	object := anObject
%

! Class implementation for 'RsrUnhandledException'

!		Class methods for 'RsrUnhandledException'

category: 'signaling'
classmethod: RsrUnhandledException
signal: anException
	"Signal the exception in reference to the provided exception."

	^self new
		exception: anException;
		signal
%

!		Instance methods for 'RsrUnhandledException'

category: 'acccessing'
method: RsrUnhandledException
exception
	"The exception that was unhandled."

	^exception
%

category: 'acccessing'
method: RsrUnhandledException
exception: anException
	"The exception that was unhandled."

	exception := anException
%

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

! Class implementation for 'RsrConnectionClosed'

!		Class methods for 'RsrConnectionClosed'

category: 'instance creation'
classmethod: RsrConnectionClosed
connection: aConnection

	^self new
		connection: aConnection;
		yourself
%

!		Instance methods for 'RsrConnectionClosed'

category: 'accessing'
method: RsrConnectionClosed
connection
	"The Connection that was closed."

	^connection
%

category: 'accessing'
method: RsrConnectionClosed
connection: aConnection
	"Store the Connection that was closed."

	connection := aConnection
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

! Class implementation for 'SpkExecutionAnnouncement'

!		Instance methods for 'SpkExecutionAnnouncement'

category: 'accessing'
method: SpkExecutionAnnouncement
addUpdatedService: aService
	updatedServices add: aService
%

category: 'initialization'
method: SpkExecutionAnnouncement
initialize
	super initialize.
	updatedServices := Set new.
%

category: 'accessing'
method: SpkExecutionAnnouncement
updatedServices
	^updatedServices
%

category: 'accessing'
method: SpkExecutionAnnouncement
updatedServices: object
	updatedServices := object
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

! Class implementation for 'RsrObject'

!		Class methods for 'RsrObject'

category: 'tracing'
classmethod: RsrObject
trace

	Transcript
		show: RsrProcessModel currentStackDump;
		cr;
		cr
%

!		Instance methods for 'RsrObject'

category: 'delaying'
method: RsrObject
minimalWait
	"Ensure the calling process is not schedulable for a short period of time."

	(Delay forMilliseconds: 1) wait
%

category: 'notes'
method: RsrObject
note: aString
	"This method can be used to leave a note in code. For instance, a code path that needs to be tested."
%

category: 'tracing'
method: RsrObject
trace

	Transcript
		show: RsrProcessModel currentStackDump;
		cr;
		cr
%

! Class implementation for 'RsrDecodingRaisedException'

!		Class methods for 'RsrDecodingRaisedException'

category: 'instance creation'
classmethod: RsrDecodingRaisedException
exception: anException

	^self new
		exception: anException;
		yourself
%

!		Instance methods for 'RsrDecodingRaisedException'

category: 'accessing'
method: RsrDecodingRaisedException
exception

	^exception
%

category: 'accessing'
method: RsrDecodingRaisedException
exception: anException

	exception := anException
%

! Class implementation for 'RsrService'

!		Class methods for 'RsrService'

category: 'accessing'
classmethod: RsrService
clientClass

	^RsrClassResolver classNamed: self clientClassName
%

category: 'accessing'
classmethod: RsrService
clientClassName

	^(self templateClassName, 'Client') asSymbol
%

category: 'testing'
classmethod: RsrService
isClientClass

	^self name == self clientClassName
%

category: 'testing'
classmethod: RsrService
isServerClass

	^self name == self serverClassName
%

category: 'testing'
classmethod: RsrService
isTemplateClass

	^self name == self templateClassName
%

category: 'accessing'
classmethod: RsrService
serverClass

	^RsrClassResolver classNamed: self serverClassName
%

category: 'accessing'
classmethod: RsrService
serverClassName

	^(self templateClassName, 'Server') asSymbol
%

category: 'accessing'
classmethod: RsrService
templateClass

	^RsrClassResolver classNamed: self templateClassName
%

category: 'accessing'
classmethod: RsrService
templateClassName

	self subclassResponsibility
%

category: 'instance creation'
classmethod: RsrService
_id: anId
connection: aConnection

	^super new
		_id: anId connection: aConnection;
		yourself
%

!		Instance methods for 'RsrService'

category: 'public-events'
method: RsrService
configureProcess
	"#configureProcess is called each time the framework calls into the framework to evaluate generic user code.
	#preUpdate and #postUpdate run in a configuration manner prescribed by the framework."

	Processor activeProcess
		priority: self serviceSchedulingPriority
%

category: 'public-accessing'
method: RsrService
connection
	"Returns the Connection associated w/ the receiver."

	^self _connection
%

category: 'public-debugging'
method: RsrService
debug: anException
raisedDuring: aMessageSend
answerUsing: aResolver

	aResolver break: (RsrRemoteException from: anException)
%

category: 'public-accessing'
method: RsrService
id
	"Returns the Service ID associated w/ the receiver."

	^self _id
%

category: 'public-testing'
method: RsrService
isClient

	^self class isClientClass
%

category: 'public-testing'
method: RsrService
isMirrored

	^_connection ~~ nil
%

category: 'public-testing'
method: RsrService
isNotMirrored

	^self isMirrored not
%

category: 'public-testing'
method: RsrService
isServer

	^self class isServerClass
%

category: 'public-events'
method: RsrService
postUpdate
	"#postUpdate is called just after the Service's shared variables are updated by the framework.
	This method can be overridden to ensure internal consistency."

	^self
%

category: 'public-events'
method: RsrService
preUpdate
	"#preUpdate is called just before the Service's shared variables are updated by the framework.
	This method can be overridden to ensure internal consistency.
	Note: If this method raises an exception, RSR will not signal #postUpdate."

	^self
%

category: 'public-registration'
method: RsrService
registerWith: aConnection

	aConnection _ensureRegistered: self
%

category: 'public-events'
method: RsrService
serviceSchedulingPriority

	^Processor userSchedulingPriority
%

category: 'public-synchronization'
method: RsrService
synchronize
	"Synchronize the service w/ its peer."

	remoteSelf == nil
		ifFalse: [remoteSelf _synchronize wait]
%

category: 'private-accessing'
method: RsrService
_connection
	"Private - Returns the Connection associated w/ the receiver."

	^_connection
%

category: 'private-accessing'
method: RsrService
_id
	"Private - Returns the Service ID associated w/ the receiver."

	^_id
%

category: 'private-accessing'
method: RsrService
_id: anRsrId
connection: aConnection
	"Private - Configure this Service w/ a Service ID and Connection. This is a side-effect of registering a Service w/ a Connection."

	_id := anRsrId.
	_connection := aConnection.
	remoteSelf := aConnection _forwarderClass on: self
%

category: 'private-synchronization'
method: RsrService
_synchronize
	"Return self to synchronize with the remote peer"

	^self
%

! Class implementation for 'RsrRemoteException'

!		Class methods for 'RsrRemoteException'

category: 'accessing'
classmethod: RsrRemoteException
clientClassName

	^#RsrRemoteExceptionClient
%

category: 'instance creation'
classmethod: RsrRemoteException
from: anException
	"Create an instance of the RemoteException reason.
	The client is used here because once we send it, we are done with it.
	The client will GC and the server will later GC. We don't care to have
	a server hanging around if we don't need it."

	| tag |
	tag := anException tag
		ifNotNil:
			[[anException tag asString]
				on: Error
				do: [:ex | ex return: 'Unable to pack #tag containing an instance of ', anException tag class name]].
	^self clientClass new
		exceptionClassName: anException class name;
		tag: tag;
		messageText: anException messageText;
		stack: RsrProcessModel currentStackDump;
		yourself
%

category: 'accessing'
classmethod: RsrRemoteException
serverClassName

	^#RsrRemoteExceptionServer
%

category: 'accessing'
classmethod: RsrRemoteException
templateClassName

	^#RsrRemoteException
%

!		Instance methods for 'RsrRemoteException'

category: 'accessing'
method: RsrRemoteException
exceptionClassName

	^exceptionClassName
%

category: 'accessing'
method: RsrRemoteException
exceptionClassName: aSymbol

	exceptionClassName := aSymbol
%

category: 'testing'
method: RsrRemoteException
isRemoteException
	"This is a RemoteException reason"

	^true
%

category: 'accessing'
method: RsrRemoteException
messageText

	^messageText
%

category: 'accessing'
method: RsrRemoteException
messageText: aString

	messageText := aString
%

category: 'printing'
method: RsrRemoteException
printOn: aStream

	aStream
		nextPutAll: exceptionClassName;
		cr;
		nextPutAll: messageText;
		cr;
		nextPutAll: '===================';
		cr;
		nextPutAll: stack
%

category: 'accessing'
method: RsrRemoteException
stack

	^stack
%

category: 'accessing'
method: RsrRemoteException
stack: aString

	stack := aString
%

category: 'accessing'
method: RsrRemoteException
tag

	^tag
%

category: 'accessing'
method: RsrRemoteException
tag: aString

	tag := aString
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
		plServ := SpkServiceFactory serviceForTool: plTool.
		pServ := SpkServiceFactory serviceForTool: plTool paneTool.
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

category: 'other'
method: SpkDebuggerFrameService
initialize
	super initialize.
	updatedServices := Set new
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

category: 'accessing'
method: SpkDebuggerFrameService
updatedServices
	^updatedServices
%

category: 'accessing'
method: SpkDebuggerFrameService
updatedServices: object
	updatedServices := object
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
	tool
		when: SpkExecutionAnnouncement
		send: #'receiveExecutionAnnouncement:'
		to: self.
	self refreshFromTool
%

category: 'other'
method: SpkDebuggerFrameServiceServer
receiveExecutionAnnouncement: announcement

	self refreshFromTool ifTrue: [ 
		announcement updatedServices add: self ]
%

category: 'initialization'
method: SpkDebuggerFrameServiceServer
refreshFromTool
	| changed oldValue currentSourceInterval |
	changed := false.

	oldValue := description.
	description := tool description.
	changed := changed | (description ~= oldValue).

	oldValue := source.
	source := tool source.
	changed := changed | (source ~= oldValue).

	currentSourceInterval := tool currentSourceInterval.

	oldValue := currentStartPosition.
	currentStartPosition := currentSourceInterval first.
	changed := changed | (currentStartPosition ~= oldValue).

	oldValue := currentEndPosition.
	currentEndPosition := currentSourceInterval last.
	changed := changed | (currentEndPosition ~= oldValue).

	^ changed | self refreshLocalVariablesFromTool
%

category: 'initialization'
method: SpkDebuggerFrameServiceServer
refreshLocalVariablesFromTool
	localVariables := tool localVariables
		collect: [ :fieldTool | 
			SpkInspectorFieldServiceServer new
				parentService: self;
				initializeFromTool: fieldTool;
				yourself ].
	SpkObject new flag: 'HACK!'.
	^ true
%

category: 'other'
method: SpkDebuggerFrameServiceServer
stepInto
	| announcement |
	updatedServices := Set new.
	announcement := SpkExecutionAnnouncement new
		updatedServices: updatedServices;
		yourself.
	tool stepIntoAnnouncing: announcement
%

category: 'other'
method: SpkDebuggerFrameServiceServer
stepOver
	| announcement |
	updatedServices := Set new.
	announcement := SpkExecutionAnnouncement new
		updatedServices: updatedServices;
		yourself.
	tool stepOverAnnouncing: announcement
%

category: 'other'
method: SpkDebuggerFrameServiceServer
stepThrough
	| announcement |
	updatedServices := Set new.
	announcement := SpkExecutionAnnouncement new
		updatedServices: updatedServices;
		yourself.
	tool stepThroughAnnouncing: announcement
%

category: 'other'
method: SpkDebuggerFrameServiceServer
tool
	^ tool
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

category: 'initialize'
method: SpkDebuggerService
initialize

	super initialize.
	updatedServices := Set new.
	frames := #().
	replacementService := self
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

category: 'accessing'
method: SpkDebuggerService
replacementService

	^ replacementService
%

category: 'accessing'
method: SpkDebuggerService
replacementService: anObject

	replacementService := anObject
%

category: 'accessing'
method: SpkDebuggerService
updatedServices

	^ updatedServices
%

category: 'accessing'
method: SpkDebuggerService
updatedServices: anObject

	updatedServices := anObject
%

! Class implementation for 'SpkDebuggerServiceServer'

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
	tool
		when: SpkExecutionAnnouncement
		send: #'receiveExecutionAnnouncement:'
		to: self.
	self refreshFromTool
%

category: 'other'
method: SpkDebuggerServiceServer
proceed
	| resultTool announcement |
	updatedServices := Set new.
	announcement := SpkExecutionAnnouncement new
		updatedServices: updatedServices;
		yourself.
	resultTool := tool proceedAnnouncing: announcement.
	^ resultTool == tool
		ifTrue: [ self ]
		ifFalse: [ SpkServiceFactory serviceForTool: resultTool ]
%

category: 'other'
method: SpkDebuggerServiceServer
receiveExecutionAnnouncement: announcement

	self refreshFromTool ifTrue: [ 
		announcement updatedServices add: self ]
%

category: 'other'
method: SpkDebuggerServiceServer
refreshExistingFrames
	| numberOfValidFrames frameTools |
	numberOfValidFrames := 0.
	frameTools := tool frames.
	1 to: (frames size min: frameTools size) do: [ :index | 
		(frames at: index) tool == (frameTools at: index)
			ifFalse: [ ^ numberOfValidFrames ].
		numberOfValidFrames := numberOfValidFrames + 1 ].
	^ numberOfValidFrames
%

category: 'other'
method: SpkDebuggerServiceServer
refreshFramesFromTool
	| changed numberOfValidFrames newStackDepth frameTools newFrames |
	changed := false.
	numberOfValidFrames := self refreshExistingFrames.
	changed := changed | (numberOfValidFrames ~= frames size).

	frameTools := tool frames.
	newStackDepth := frameTools size.
	newFrames := Array new: newStackDepth.
	changed := changed | (frames size ~= newStackDepth).

	newFrames
		replaceFrom: 1
		to: numberOfValidFrames
		with: frames
		startingAt: 1.

	numberOfValidFrames + 1 to: newStackDepth do: [ :index | 
		| frameTool |
		frameTool := frameTools at: index.
		newFrames
			at: index
			put:
				((SpkDebuggerFrameDescriptionServiceServer forTool: frameTool)
					parentService: self;
					yourself) ].
	frames := newFrames.
	^ changed
%

category: 'other'
method: SpkDebuggerServiceServer
refreshFromTool
	tool replacementTool == tool
		ifTrue: [ ^ self refreshTopLevelInfoFromTool | self refreshFramesFromTool ].	"
	The debugger is being replaced by something else. 
	Pass that something else on."
	replacementService := SpkServiceFactory serviceForTool: tool replacementTool.
	^ true
%

category: 'other'
method: SpkDebuggerServiceServer
refreshTopLevelInfoFromTool
	| changed oldValue |
	changed := false.

	oldValue := exceptionDescription.
	exceptionDescription := tool exceptionDescription.
	changed := changed | (exceptionDescription ~= oldValue).

	oldValue := processName.
	processName := tool processName.
	changed := changed | (processName ~= oldValue).

	oldValue := processIdentifier.
	processIdentifier := tool processIdentifier.
	changed := changed | (processIdentifier ~= oldValue).

	oldValue := processPriority.
	processPriority := tool processPriority.
	changed := changed | (processPriority ~= oldValue).

	^ changed
%

category: 'other'
method: SpkDebuggerServiceServer
terminate
	| resultTool announcement |
	updatedServices := Set new.
	announcement := SpkExecutionAnnouncement new
		updatedServices: updatedServices;
		yourself.
	resultTool := tool terminateAnnouncing: announcement.
	^ resultTool == tool
		ifTrue: [ self ]
		ifFalse: [ SpkServiceFactory serviceForTool: resultTool ]
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

!		Instance methods for 'SpkExplorerLayoutServiceServer'

category: 'initialization'
method: SpkExplorerLayoutServiceServer
initializeColumns
	"Create column and pane services and their layout services, based on my layout tool."

	columnLayouts := OrderedCollection new.
	tool columnLayouts
		do: [ :clTool | 
			| clServ |
			clServ := SpkServiceFactory serviceForTool: clTool.
			columnLayouts add: clServ.
			clServ initializePanesForExplorer: explorerService ]
%

category: 'initialization'
method: SpkExplorerLayoutServiceServer
initializeFromTool: explorerLayoutTool

	tool := explorerLayoutTool.
	height := tool height.
	width := tool width.
	explorerService := SpkServiceFactory serviceForTool: tool explorerTool.
	self initializeColumns
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
		  ifAbsent: [ self error: 'Unrecognized tool class ' , aToolClass name ]
%

!		Instance methods for 'SpkExplorerServiceServer'

category: 'initialization'
method: SpkExplorerServiceServer
defaultLayout

	^ SpkExplorerLayoutServiceServer new
%

category: 'accessing'
method: SpkExplorerServiceServer
initializeFromTool: aTool
	tool := aTool.
	self refreshFromTool
%

category: 'accessing'
method: SpkExplorerServiceServer
refreshFromTool
%

category: 'accessing'
method: SpkExplorerServiceServer
tool

	^ tool
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
initializeFromTool: aTool

	tool := aTool.
	tool
		when: SpkExecutionAnnouncement
		send: #receiveExecutionAnnouncement:
		to: self.
	self
		refreshFromTool;
		initializeEvaluatorsFromTool
%

category: 'accessing'
method: SpkInspectorServiceServer
receiveExecutionAnnouncement: announcement

	self refreshFromTool ifTrue: [ 
		announcement updatedServices add: self ]
%

category: 'initialization'
method: SpkInspectorServiceServer
refreshFieldsFromTool

	| changed fieldTools |
	changed := false.
	fields size < tool fieldTools size ifTrue: [ 
		changed := true.
		fields size + 1 to: tool fieldTools size do: [ :i | 
			fields add: (SpkInspectorFieldServiceServer new
					 parentService: self;
					 tool: (tool fieldTools at: i);
					 yourself) ] ].
	fields size > tool fieldTools size ifTrue: [ 
		changed := true.
		fields size - tool fieldTools size timesRepeat: [ fields removeLast ] ].
	fieldTools := tool fieldTools.
	1 to: fieldTools size do: [ :i | 
		| fieldTool field newField |
		fieldTool := fieldTools at: i.
		field := fields at: i.
		fieldTool == field tool ifFalse: [ 
			changed := true.
			newField := SpkInspectorFieldServiceServer new
				            parentService: self;
				            tool: fieldTool;
				            yourself.
			fields at: i put: newField.
			field := newField ].
		changed := changed | field refreshFromTool ].
	^ changed
%

category: 'initialization'
method: SpkInspectorServiceServer
refreshFromTool

	| changed |
	changed := false.
	oop = tool oop ifFalse: [ changed := true ].
	classMembershipDescription = tool classMembershipDescription 
		ifFalse: [ changed := true ].
	selfDescription = tool selfDescription ifFalse: [ changed := true ].
	oop := tool oop.
	classMembershipDescription := tool classMembershipDescription.
	selfDescription := tool selfDescription.
	changed := changed | self refreshFieldsFromTool.
	^ changed
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
	evaluationContext := nil.
	updatedServices := Set new
%

category: 'accessing'
method: SpkEvaluatorService
updatedServices

	^ updatedServices
%

category: 'accessing'
method: SpkEvaluatorService
updatedServices: anObject

	updatedServices := anObject
%

! Class implementation for 'SpkEvaluatorServiceServer'

!		Instance methods for 'SpkEvaluatorServiceServer'

category: 'actions'
method: SpkEvaluatorServiceServer
accept

	"Evaluate my newSourceCode, answer a new service for the result."

	| resultTool resultService announcement |
	updatedServices := Set new.
	announcement := SpkExecutionAnnouncement new
		                updatedServices: updatedServices;
		                yourself.
	self tool newSourceCode: newSourceCode.
	resultTool := self tool acceptAnnouncing: announcement.

	self refreshFromTool.
	resultService := SpkServiceFactory serviceForTool: resultTool.
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
		  taskspaceTool: inspectorTool taskspaceTool;
		  yourself
%

category: 'initialization'
method: SpkEvaluatorServiceServer
refreshFromTool
	oldSourceCode := tool oldSourceCode.
	newSourceCode := tool newSourceCode
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

category: 'printing'
method: SpkDebuggerFrameDescriptionService
printOn: aStream
	aStream nextPutAll: 'FrameDescriptionService '.
	description printOn: aStream
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

category: 'other'
method: SpkDebuggerFrameDescriptionServiceServer
tool
	^tool
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
columnAt: anInteger

	^ columns at: anInteger
%

category: 'accessing'
method: SpkInspectorFieldService
columns

	^ columns
%

category: 'accessing'
method: SpkInspectorFieldService
columns: anObject

	columns := anObject
%

category: 'initialization'
method: SpkInspectorFieldService
initialize

	super initialize.
	columns := #(  )
%

! Class implementation for 'SpkInspectorFieldServiceServer'

!		Instance methods for 'SpkInspectorFieldServiceServer'

category: 'inspecting'
method: SpkInspectorFieldServiceServer
createInspectorService

	| newTool |
	newTool := parentService tool newInspectorToolOn:
		           tool referencedObject.

	^ SpkServiceFactory serviceForTool: newTool
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

	| changed |
	changed := false.

	columns size = tool numberOfColumns ifFalse: [ 
		changed := true.
		columns := Array new: tool numberOfColumns ].
	tool referencedObject == referencedObject ifFalse: [ 
		changed := true.
		referencedObject := tool referencedObject ].

	1 to: columns size do: [ :i | 
		| toolColumn |
		toolColumn := tool columnAt: i.
		toolColumn = (columns at: i) ifFalse: [ 
			changed := true.
			columns at: i put: toolColumn ] ].
	^ changed
%

category: 'accessing'
method: SpkInspectorFieldServiceServer
tool

	^tool
%

category: 'accessing'
method: SpkInspectorFieldServiceServer
tool: anObject

	tool := anObject
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

! Class implementation for 'SpkProcessTerminatedService'

!		Class methods for 'SpkProcessTerminatedService'

category: 'other'
classmethod: SpkProcessTerminatedService
templateClassName

	^ #SpkProcessTerminatedService
%

!		Instance methods for 'SpkProcessTerminatedService'

category: 'accessing'
method: SpkProcessTerminatedService
oop
	^oop
%

category: 'accessing'
method: SpkProcessTerminatedService
oop: object
	oop := object
%

! Class implementation for 'SpkProcessTerminatedServiceServer'

!		Instance methods for 'SpkProcessTerminatedServiceServer'

category: 'other'
method: SpkProcessTerminatedServiceServer
initializeFromTool: aTool
	tool := aTool.
	oop := SpkReflection identifierOf: tool process
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

!		Instance methods for 'SpkTaskspaceLayoutServiceServer'

category: 'initialization'
method: SpkTaskspaceLayoutServiceServer
addDefaultExplorer 
	| xlTool xlServ |
	xlTool := SpkExplorerLayoutTool defaultInTaskspace: tool taskspaceTool.
	xlServ := SpkServiceFactory serviceForTool: xlTool.
	self addExplorerLayoutService: xlServ.
	^ xlServ
%

category: 'initialization'
method: SpkTaskspaceLayoutServiceServer
addExplorerLayoutService: xlServ
	explorerLayoutServices add: xlServ.
	taskspaceService addExplorer: xlServ explorerService
%

category: 'initialization'
method: SpkTaskspaceLayoutServiceServer
initializeExplorerServices
	"Create the ExplorerLayoutServices and ExplorerServices."

	explorerLayoutServices := Set new.
	tool explorerLayouts
		do: [ :xlTool | self addExplorerLayoutService: (SpkServiceFactory serviceForTool: xlTool) ]
%

category: 'initialization'
method: SpkTaskspaceLayoutServiceServer
initializeFromTool: aTaskspaceLayoutTool
	"We're creating new server services (by definition transient) for tools (which might be persistent)."

	tool := aTaskspaceLayoutTool.
	taskspaceService := SpkServiceFactory serviceForTool: tool taskspaceTool.
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
	^ SpkServiceFactory serviceForTool: tool
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

!		Instance methods for 'SpkTaskspaceServiceServer'

category: 'adding'
method: SpkTaskspaceServiceServer
addDefaultExplorer

	"Answer a new explorer service"

	| newExplorerTool |
	newExplorerTool := tool addDefaultExplorer.
	^ SpkServiceFactory serviceForTool: newExplorerTool
%

category: 'other'
method: SpkTaskspaceServiceServer
initializeFromTool: aTool
	tool := aTool
%

category: 'initialization'
method: SpkTaskspaceServiceServer
tool: aTaskspaceTool

	tool := aTaskspaceTool
%

! Class implementation for 'RsrBufferedSocketStream'

!		Class methods for 'RsrBufferedSocketStream'

category: 'instance creation'
classmethod: RsrBufferedSocketStream
on: aSocketStream

	^self new
		stream: aSocketStream;
		yourself
%

!		Instance methods for 'RsrBufferedSocketStream'

category: 'writing'
method: RsrBufferedSocketStream
atEnd

	^stream atEnd
%

category: 'writing'
method: RsrBufferedSocketStream
checkAutoFlush

	nextToWrite > 4096
		ifTrue: [ self flush ]
%

category: 'writing'
method: RsrBufferedSocketStream
close

	stream close
%

category: 'writing'
method: RsrBufferedSocketStream
flush

	writePosition = nextToWrite
		ifTrue: [^self].
	stream nextPutAll: (outBuffer copyFrom: writePosition to: nextToWrite - 1).
	writePosition := nextToWrite := 1.
	stream flush
%

category: 'writing'
method: RsrBufferedSocketStream
growOutBufferTo: aNumberOfBytes

	| rounding |
	rounding := ((aNumberOfBytes \\ 4096) + 1) * 4096.
	outBuffer := outBuffer , (ByteArray new: rounding - outBuffer size)
%

category: 'initialization'
method: RsrBufferedSocketStream
initialize

	super initialize.
	outBuffer := ByteArray new: 4096.
	nextToWrite := 1.
	writePosition := 1
%

category: 'writing'
method: RsrBufferedSocketStream
isConnected

	^stream isConnected
%

category: 'writing'
method: RsrBufferedSocketStream
next

	^self next: 1
%

category: 'writing'
method: RsrBufferedSocketStream
next: aCount

	^stream next: aCount
%

category: 'writing'
method: RsrBufferedSocketStream
nextPutAll: aByteArray

	(outBuffer size >= (aByteArray size + nextToWrite))
		ifFalse: [self growOutBufferTo: outBuffer size + nextToWrite].
	outBuffer
		replaceFrom: nextToWrite
		to: nextToWrite + aByteArray size - 1
		with: aByteArray
		startingAt: 1.
	nextToWrite := nextToWrite + aByteArray size.
	self checkAutoFlush
%

category: 'accessing'
method: RsrBufferedSocketStream
stream: aStream

	stream := aStream
%

! Class implementation for 'RsrChannel'

!		Instance methods for 'RsrChannel'

category: 'lifecycle'
method: RsrChannel
close
	"Ensure the channel is closed to further communication."

	^self subclassResponsibility
%

category: 'accessing'
method: RsrChannel
connection

	^connection
%

category: 'accessing'
method: RsrChannel
connection: aConnection

	connection := aConnection
%

category: 'events'
method: RsrChannel
genericError: anError

	^self connection unknownError: anError
%

category: 'testing'
method: RsrChannel
isConnected
	"Report whether the Channel is open between Connections."

	^self subclassResponsibility
%

category: 'accessing'
method: RsrChannel
log

	^self connection log
%

category: 'lifecycle'
method: RsrChannel
open
	"Ensure the channel is open and ready for communication."

	^self subclassResponsibility
%

category: 'events'
method: RsrChannel
received: aCommand
	"A command has come in over the channel. Propogate it to the Connection."

	self connection _receivedCommand: aCommand
%

category: 'events'
method: RsrChannel
send: aCommand
	"Send the provided command over the channel."

	^self subclassResponsibility
%

! Class implementation for 'RsrBinaryStreamChannel'

!		Class methods for 'RsrBinaryStreamChannel'

category: 'instance creation'
classmethod: RsrBinaryStreamChannel
inStream: inStream
outStream: outStream

	^self new
		inStream: inStream;
		outStream: outStream;
		yourself
%

!		Instance methods for 'RsrBinaryStreamChannel'

category: 'lifecycle'
method: RsrBinaryStreamChannel
close
	"Shutdown the Command sink and source."

	source stop.
	sink stop.
	outStream
		flush;
		close.
	inStream close
%

category: 'lifecycle'
method: RsrBinaryStreamChannel
disconnected
	"The socket has disconnected so the channel is no longer open."

	self connection channelDisconnected
%

category: 'initializing'
method: RsrBinaryStreamChannel
initialize

	super initialize.
	source := RsrCommandSource on: self.
	sink := RsrCommandSink on: self
%

category: 'accessing'
method: RsrBinaryStreamChannel
inStream
	"Returns the stream associated w/ reading"

	^inStream
%

category: 'accessing'
method: RsrBinaryStreamChannel
inStream: aBinaryReadStream
	"Sets the stream associated w/ reading"

	inStream := aBinaryReadStream
%

category: 'testing'
method: RsrBinaryStreamChannel
isConnected

	^self inStream atEnd not and: [self outStream atEnd not]
%

category: 'lifecycle'
method: RsrBinaryStreamChannel
open
	"Ensure the Command sink and source are running"

	source start.
	sink start
%

category: 'accessing'
method: RsrBinaryStreamChannel
outStream
	"Returns the stream associated w/ writing"

	^outStream
%

category: 'accessing'
method: RsrBinaryStreamChannel
outStream: aBinaryWriteStream
	"Sets the stream associated w/ writing"

	outStream := aBinaryWriteStream
%

category: 'command processing'
method: RsrBinaryStreamChannel
send: aCommand
	"Send the provided command over the channel"

	sink enqueue: aCommand
%

category: 'accessing'
method: RsrBinaryStreamChannel
sink

	^sink
%

category: 'accessing'
method: RsrBinaryStreamChannel
source

	^source
%

! Class implementation for 'RsrInMemoryChannel'

!		Class methods for 'RsrInMemoryChannel'

category: 'instance creation'
classmethod: RsrInMemoryChannel
inQueue: inQueue
outQueue: outQueue

	^self new
		inQueue: inQueue;
		outQueue: outQueue;
		yourself
%

!		Instance methods for 'RsrInMemoryChannel'

category: 'lifecycle'
method: RsrInMemoryChannel
close

	outQueue nextPut: nil.
	inQueue nextPut: nil
%

category: 'processing'
method: RsrInMemoryChannel
drainLoop

	| command |
	[command := inQueue next.
	command isNil]
		whileFalse:
			[self received: command].
	self connection channelDisconnected
%

category: 'accessing'
method: RsrInMemoryChannel
inQueue

	^inQueue
%

category: 'accessing'
method: RsrInMemoryChannel
inQueue: aSharedQueue

	inQueue := aSharedQueue
%

category: 'testing'
method: RsrInMemoryChannel
isConnected

	^drainProcess isNil not
%

category: 'lifecycle'
method: RsrInMemoryChannel
open

	drainProcess := RsrProcessModel
		fork:
			[RsrProcessModel configureCommunicationsProcess.
			self drainLoop.
			drainProcess := nil]
		named: 'InMemoryChannel Receiving'
%

category: 'accessing'
method: RsrInMemoryChannel
outQueue

	^outQueue
%

category: 'accessing'
method: RsrInMemoryChannel
outQueue: aSharedQueue

	outQueue := aSharedQueue
%

category: 'lifecycle'
method: RsrInMemoryChannel
send: aCommand

	outQueue nextPut: aCommand
%

! Class implementation for 'RsrClassResolver'

!		Class methods for 'RsrClassResolver'

category: 'accessing'
classmethod: RsrClassResolver
classNamed: aSymbol

	^self
		classNamed: aSymbol
		ifAbsent: [RsrUnknownClass signal: aSymbol]
%

category: 'accessing'
classmethod: RsrClassResolver
classNamed: aSymbol
ifAbsent: aBlock

	| assoc |
	assoc := System myUserProfile resolveSymbol: aSymbol.
	^assoc
		ifNil: aBlock
		ifNotNil: [assoc value]
%

! Class implementation for 'RsrCodec'

!		Instance methods for 'RsrCodec'

category: 'converting'
method: RsrCodec
bytesAsInteger: bytes

	| res |
	res := 0.
	bytes do: [:e | res := (res bitShift: 8) bitOr: e].
	^res
%

category: 'accessing'
method: RsrCodec
controlWordMax

	^(2 raisedTo: 63) - 1
%

category: 'accessing'
method: RsrCodec
controlWordMin

	^(2 raisedTo: 63) negated
%

category: 'decoding'
method: RsrCodec
decodeControlWord: aStream

	| bytes unsignedResult |
	bytes := aStream next: self sizeOfInteger.
	unsignedResult := self bytesAsInteger: bytes.
	^unsignedResult > self controlWordMax
		ifTrue: [(2 raisedTo: 64) negated + unsignedResult]
		ifFalse: [unsignedResult]
%

category: 'encoding'
method: RsrCodec
encodeControlWord: anInteger
onto: aStream

	| encodedInteger encodedBytes |
	(anInteger between: self controlWordMin and: self controlWordMax)
		ifFalse: [self error: anInteger printString, ' is outside the supported size of a control word.'].
	encodedInteger := (anInteger positive
		ifTrue: [anInteger]
		ifFalse: [(2 raisedTo: 64) + anInteger]).
	encodedBytes := self
		integerAsByteArray: encodedInteger
		ofSize: self sizeOfInteger.
	aStream nextPutAll: encodedBytes
%

category: 'converting'
method: RsrCodec
integerAsByteArray: anInteger
ofSize: aNumberOfBytes

	| bytes int |
	bytes := ByteArray new: aNumberOfBytes.
	int := anInteger.
	aNumberOfBytes
		to: 1
		by: -1
		do:
			[:i | | byte |
			byte := int bitAnd: 16rFF.
			int := int bitShift: -8.
			bytes at: i put: byte].
	int ~= 0
		ifTrue: [self error: 'Loss of precision detected'].
	^bytes
%

category: 'accessing'
method: RsrCodec
sizeOfInteger
	"Return the number of bytes used to encode an integer"

	^8
%

! Class implementation for 'RsrCommandCodec'

!		Instance methods for 'RsrCommandCodec'

category: 'private-accessing-commands'
method: RsrCommandCodec
deliverErrorResponseCommand

	^4
%

category: 'private-accessing-commands'
method: RsrCommandCodec
deliverResponseCommand

	^2
%

category: 'private-accessing'
method: RsrCommandCodec
immediateOID

	^0
%

category: 'private-accessing-commands'
method: RsrCommandCodec
releaseObjectsCommand

	^3
%

category: 'private-accessing-commands'
method: RsrCommandCodec
sendMessageCommand

	^1
%

! Class implementation for 'RsrCommandDecoder'

!		Class methods for 'RsrCommandDecoder'

category: 'instance creation'
classmethod: RsrCommandDecoder
registry: aRegistry

	^self new
		registry: aRegistry;
		yourself
%

!		Instance methods for 'RsrCommandDecoder'

category: 'decoding-commands'
method: RsrCommandDecoder
decodeCommand: aStream
	"Decode an object from the stream"

	| command |
	command := self decodeControlWord: aStream.
	command == self sendMessageCommand ifTrue: [^self decodeSendMessage: aStream].
	command == self deliverResponseCommand ifTrue: [^self decodeDeliverResponse: aStream].
	command == self releaseObjectsCommand ifTrue: [^self decodeReleaseServices: aStream].
	^RsrError signal: 'Unknown command identifier: ', command printString
%

category: 'decoding-commands'
method: RsrCommandDecoder
decodeDeliverResponse: aStream

    | transaction numServices serviceSnapshots response |
    transaction := self decodeControlWord: aStream.
    numServices := self decodeControlWord: aStream.
    serviceSnapshots := (1 to: numServices) collect: [:each | self decodeServiceSnapshot: aStream].
    response := self decodeReference: aStream.
    ^RsrDeliverResponse new
        transaction: transaction;
        snapshots: serviceSnapshots;
        response: response;
        yourself
%

category: 'decoding-services'
method: RsrCommandDecoder
decodeImmediateReference: aStream

	| referenceType |
	referenceType := self decodeControlWord: aStream.
	^(self instanceOfImmediate: referenceType)
		decode: aStream
		using: self
%

category: 'decoding'
method: RsrCommandDecoder
decodeReference: aStream

	| oid |
	oid := self decodeControlWord: aStream.
	oid = self immediateOID ifTrue: [^self decodeImmediateReference: aStream].
	^RsrServiceReference sid: oid
%

category: 'decoding-commands'
method: RsrCommandDecoder
decodeReleaseServices: aStream

	| count oids |
	count := self decodeControlWord: aStream.
	oids := Array new: count.
	1
		to: count
		do:
			[:i | | oid |
			oid := self decodeControlWord: aStream.
			oids at: i put: oid].
	^RsrReleaseServices sids: oids
%

category: 'decoding-commands'
method: RsrCommandDecoder
decodeSendMessage: aStream

	| transaction argCount receiverReference selector numServices serviceSnapshots arguments instance |
	transaction := self decodeControlWord: aStream.
	numServices := self decodeControlWord: aStream.
	serviceSnapshots := (1 to: numServices) collect: [:each | self decodeServiceSnapshot: aStream].
	receiverReference := self decodeReference: aStream.
	selector := self decodeReference: aStream.
	argCount := self decodeControlWord: aStream.
	arguments := (1 to: argCount) collect: [:each | self decodeReference: aStream].
	instance := RsrSendMessage
		transaction: transaction
		receiverReference: receiverReference
		selectorReference: selector
		argumentReferences: arguments.
	instance snapshots: serviceSnapshots.
	^instance
%

category: 'decoding-services'
method: RsrCommandDecoder
decodeServiceSnapshot: aStream

	| snapshot |
	snapshot := RsrServiceSnapshot new.
	snapshot
		decode: aStream
		using: self.
	^snapshot
%

category: 'decoding-services'
method: RsrCommandDecoder
instanceOfImmediate: aReferenceType

	aReferenceType = 1
		ifTrue: [^RsrSymbolReference new].
	aReferenceType = 2
		ifTrue: [^RsrStringReference new].
	aReferenceType = 3
		ifTrue: [^RsrPositiveIntegerReference new].
	aReferenceType = 4
		ifTrue: [^RsrNegativeIntegerReference new].
	aReferenceType = 5
		ifTrue: [^RsrCharacterReference new].
	aReferenceType = 6
		ifTrue: [^RsrNilReference new].
	aReferenceType = 7
		ifTrue: [^RsrTrueReference new].
	aReferenceType = 8
		ifTrue: [^RsrFalseReference new].
	aReferenceType = 9
		ifTrue: [^RsrArrayReference new].
	aReferenceType = 10
		ifTrue: [^RsrByteArrayReference new].
	aReferenceType = 11
		ifTrue: [^RsrSetReference new].
	aReferenceType = 12
		ifTrue: [^RsrOrderedCollectionReference new].
	aReferenceType = 13
		ifTrue: [^RsrDictionaryReference new].
	aReferenceType = 14
		ifTrue: [^RsrDateAndTimeReference new].
	aReferenceType = 15
		ifTrue: [^RsrDoubleReference new].
	self error: 'ReferenceType(', aReferenceType printString, ') not yet implemented'.
%

! Class implementation for 'RsrCommandEncoder'

!		Instance methods for 'RsrCommandEncoder'

category: 'private-encoding'
method: RsrCommandEncoder
encodeDeliverResponse: aDeliverResponse

	^ByteArray streamContents: [:stream | self encodeDeliverResponse: aDeliverResponse onto: stream]
%

category: 'private-encoding'
method: RsrCommandEncoder
encodeDeliverResponse: aDeliverResponse
onto: aStream

	self
		encodeControlWord: self deliverResponseCommand
		onto: aStream.
	self
		encodeControlWord: aDeliverResponse transaction
		onto: aStream.
	self
		encodeControlWord: aDeliverResponse snapshots size
		onto: aStream.
	aDeliverResponse snapshots do: [:each | self encodeServiceSnapshot: each onto: aStream].
	self
		encodeReference: aDeliverResponse response
		onto: aStream
%

category: 'private-encoding'
method: RsrCommandEncoder
encodeReference: aReference
onto: aStream

	aReference
		encode: aStream
		using: self
%

category: 'private-encoding'
method: RsrCommandEncoder
encodeReleaseServices: aReleaseServices

	^ByteArray streamContents: [:stream | self encodeReleaseServices: aReleaseServices onto: stream]
%

category: 'private-encoding'
method: RsrCommandEncoder
encodeReleaseServices: aReleaseServices
onto: aStream

	self
		encodeControlWord: self releaseObjectsCommand
		onto: aStream.
	self
		encodeControlWord: aReleaseServices sids size
		onto: aStream.
	aReleaseServices sids
		do:
			[:sid |
			self
				encodeControlWord: sid
				onto: aStream]
%

category: 'private-encoding'
method: RsrCommandEncoder
encodeSendMessage: aSendMessage

	^ByteArray streamContents: [:stream | self encodeSendMessage: aSendMessage onto: stream]
%

category: 'private-encoding'
method: RsrCommandEncoder
encodeSendMessage: aSendMessage
onto: aStream

	self
		encodeControlWord: self sendMessageCommand
		onto: aStream.
	self
		encodeControlWord: aSendMessage transaction
		onto: aStream.
	self
		encodeControlWord: aSendMessage snapshots size
		onto: aStream.
	aSendMessage snapshots
		do:
			[:each |
			self
				encodeServiceSnapshot: each
				onto: aStream].
	self
		encodeReference:  aSendMessage receiverReference
		onto: aStream.
	self
		encodeReference: aSendMessage selectorReference
		onto: aStream.
	self
		encodeControlWord: aSendMessage argumentReferences size
		onto: aStream.
	aSendMessage argumentReferences
		do:
			[:each |
			self
				encodeReference: each
				onto: aStream]
%

category: 'encoding'
method: RsrCommandEncoder
encodeServiceSnapshot: aServiceSnapshot

	^ByteArray
		streamContents:
			[:stream |
			self
				encodeServiceSnapshot: aServiceSnapshot
				onto: stream]
%

category: 'private-encoding'
method: RsrCommandEncoder
encodeServiceSnapshot: aServiceSnapshot
onto: aStream

	aServiceSnapshot
		encode: aStream
		using: self
%

! Class implementation for 'RsrProtocolVersionNegotiationCodec'

!		Instance methods for 'RsrProtocolVersionNegotiationCodec'

category: 'accessing'
method: RsrProtocolVersionNegotiationCodec
chosenVersionIdentifier

	^1
%

category: 'decoding'
method: RsrProtocolVersionNegotiationCodec
decode: aStream
	"Decode a message from <aStream>"

	| identifier |
	identifier := self decodeControlWord: aStream.
	identifier = self supportedVersionsIdentifier
		ifTrue: [^self decodeSupportedVersions: aStream].
	identifier = self chosenVersionIdentifier
		ifTrue: [^self decodeChosenVersion: aStream].
	identifier = self noVersionOverlapIdentifier
		ifTrue: [^self decodeNoVersionOverlap: aStream].
	^RsrProtocolVersionNegotiationFailed signal: 'Unknown identifier: ', identifier printString
%

category: 'decoding'
method: RsrProtocolVersionNegotiationCodec
decodeChosenVersion: aStream

	| version |
	version := self decodeControlWord: aStream.
	^RsrChosenVersion version: version
%

category: 'decoding'
method: RsrProtocolVersionNegotiationCodec
decodeNoVersionOverlap: aStream

	^RsrNoVersionOverlap new
%

category: 'decoding'
method: RsrProtocolVersionNegotiationCodec
decodeSupportedVersions: aStream

	| numberOfVersions versions |
	numberOfVersions := self decodeControlWord: aStream.
	versions := (1 to: numberOfVersions) collect: [:each | self decodeControlWord: aStream].
	^RsrSupportedVersions versions: versions
%

category: 'encoding'
method: RsrProtocolVersionNegotiationCodec
encodeChosenVersion: aChosenVersion
onto: aStream

	self
		encodeControlWord: self chosenVersionIdentifier
		onto: aStream.
	self
		encodeControlWord: aChosenVersion version
		onto: aStream
%

category: 'encoding'
method: RsrProtocolVersionNegotiationCodec
encodeNoVersionOverlap: aNoVersionOverlap
onto: aStream

	self
		encodeControlWord: self noVersionOverlapIdentifier
		onto: aStream
%

category: 'encoding'
method: RsrProtocolVersionNegotiationCodec
encodeSupportedVersions: aSupportedVersions
onto: aStream

	| versions |
	versions := aSupportedVersions versions.
	self
		encodeControlWord: self supportedVersionsIdentifier
		onto: aStream.
	self
		encodeControlWord: versions size
		onto: aStream.
	versions do: [:each | self encodeControlWord: each onto: aStream]
%

category: 'accessing'
method: RsrProtocolVersionNegotiationCodec
noVersionOverlapIdentifier

	^2
%

category: 'accessing'
method: RsrProtocolVersionNegotiationCodec
supportedVersionsIdentifier

	^0
%

! Class implementation for 'RsrTokenExchangeCodec'

!		Instance methods for 'RsrTokenExchangeCodec'

category: 'decoding'
method: RsrTokenExchangeCodec
decode: aStream

	| identifier |
	identifier := self decodeControlWord: aStream.
	identifier = self tokenIdentifier
		ifTrue: [^self decodeToken: aStream].
	identifier = self tokenAcceptedIdentifier
		ifTrue: [^RsrTokenAccepted new].
	identifier = self tokenRejectedIdentifier
		ifTrue: [^RsrTokenRejected new].
	^RsrTokenExchangeFailed signal: 'Unknown identifier: ', identifier printString
%

category: 'decoding'
method: RsrTokenExchangeCodec
decodeToken: aStream

	| size |
	size := self decodeControlWord: aStream.
	^RsrToken bytes: (aStream next: size)
%

category: 'encoding'
method: RsrTokenExchangeCodec
encodeToken: aToken
onto: aStream

	self
		encodeControlWord: self tokenIdentifier
		onto: aStream.
	self
		encodeControlWord: aToken bytes size
		onto: aStream.
	aStream nextPutAll: aToken bytes
%

category: 'encoding'
method: RsrTokenExchangeCodec
encodeTokenAccepted: aTokenAccepted
onto: aStream

	self
		encodeControlWord: self tokenAcceptedIdentifier
		onto: aStream
%

category: 'encoding'
method: RsrTokenExchangeCodec
encodeTokenRejected: aTokenRejected
onto: aStream

	self
		encodeControlWord: self tokenRejectedIdentifier
		onto: aStream
%

category: 'accessing'
method: RsrTokenExchangeCodec
tokenAcceptedIdentifier

	^1
%

category: 'accessing'
method: RsrTokenExchangeCodec
tokenIdentifier

	^0
%

category: 'accessing'
method: RsrTokenExchangeCodec
tokenRejectedIdentifier

	^2
%

! Class implementation for 'RsrCommand'

!		Instance methods for 'RsrCommand'

category: 'encoding'
method: RsrCommand
encode: aStream
using: anEncoder

	self subclassResponsibility
%

category: 'executing'
method: RsrCommand
executeFor: aConnection

	self subclassResponsibility
%

category: 'reporting'
method: RsrCommand
reportOn: aLog

	self subclassResponsibility
%

! Class implementation for 'RsrMessagingCommand'

!		Instance methods for 'RsrMessagingCommand'

category: 'executing'
method: RsrMessagingCommand
reifyAllIn: aConnection

	| servicesStrongly |
	"Must keep a strong reference to each service until we're sure a parent service is reified"
	servicesStrongly := snapshots collect: [ :each | 
		                    (each instanceIn: aConnection) preUpdate ].
	snapshots do: [ :each | each reifyIn: aConnection ].
	servicesStrongly do: [ :each | each postUpdate ].
	^ servicesStrongly "Sender must keep a strong reference until the root is anchored."
%

category: 'accessing'
method: RsrMessagingCommand
snapshots

	^snapshots
%

category: 'accessing'
method: RsrMessagingCommand
snapshots: anArrayOfSnapshots

	snapshots := anArrayOfSnapshots
%

category: 'accessing'
method: RsrMessagingCommand
transaction
	^ transaction
%

category: 'accessing'
method: RsrMessagingCommand
transaction: anObject
	transaction := anObject
%

! Class implementation for 'RsrDeliverResponse'

!		Class methods for 'RsrDeliverResponse'

category: 'instance creation'
classmethod: RsrDeliverResponse
transaction: aTransactionId
responseReference: aReference
snapshots: anArrayOfSnapshots

	^self new
		transaction: aTransactionId;
		responseReference: aReference;
		snapshots: anArrayOfSnapshots;
		yourself
%

!		Instance methods for 'RsrDeliverResponse'

category: 'encoding'
method: RsrDeliverResponse
encode: aStream
using: anEncoder

	anEncoder
		encodeDeliverResponse: self
		onto: aStream
%

category: 'executing'
method: RsrDeliverResponse
executeFor: aConnection

	| pendingMessage result servicesStrongly |
	pendingMessage := aConnection pendingMessages
		                  removeKey: self transaction
		                  ifAbsent: [ 
		                  ^ self reportUnknownTransactionIn: aConnection ].
	"Must keep a strong reference to each service until the roots are referenced."
	[ 
	servicesStrongly := self reifyAllIn: aConnection.
	result := self responseReference resolve: aConnection.
	"result should now be the root of the services graph"
	servicesStrongly := nil.
	result first == #fulfill
		ifTrue: [ pendingMessage promise fulfill: result last ]
		ifFalse: [ pendingMessage promise break: result last ] ]
		on: Error
		do: [ :ex | 
			pendingMessage promise break:
				(RsrDecodingRaisedException exception: ex) ]
%

category: 'reporting'
method: RsrDeliverResponse
reportOn: aLog

	aLog debug: 'RsrDeliverResponse(', self response class name, ')'
%

category: 'reporting'
method: RsrDeliverResponse
reportUnknownTransactionIn: aConnection

	aConnection log error: 'Unknown transaction (', self transaction asString, ') while processing Response'
%

category: 'accessing'
method: RsrDeliverResponse
response

	^self responseReference
%

category: 'accessing'
method: RsrDeliverResponse
response: anObject

	^self responseReference: anObject
%

category: 'accessing'
method: RsrDeliverResponse
responseReference

	^responseReference
%

category: 'accessing'
method: RsrDeliverResponse
responseReference: aReference

	responseReference := aReference
%

! Class implementation for 'RsrSendMessage'

!		Class methods for 'RsrSendMessage'

category: 'instance creation'
classmethod: RsrSendMessage
transaction: aTransactionId
receiverReference: aServiceReference
selectorReference: aSelectorReference
argumentReferences: anArrayOfReferences

	^self new
		transaction: aTransactionId;
		receiverReference: aServiceReference;
		selectorReference: aSelectorReference;
		argumentReferences: anArrayOfReferences;
		yourself
%

!		Instance methods for 'RsrSendMessage'

category: 'accessing'
method: RsrSendMessage
argumentReferences

	^argumentReferences
%

category: 'accessing'
method: RsrSendMessage
argumentReferences: anArrayOfReferences

	argumentReferences := anArrayOfReferences
%

category: 'encoding'
method: RsrSendMessage
encode: aStream
using: anEncoder

	anEncoder
		encodeSendMessage: self
		onto: aStream
%

category: 'executing'
method: RsrSendMessage
executeFor: aConnection

	| resolver servicesStrongly receiver selector arguments messageSend |
	resolver := RsrRemotePromiseResolver for: self over: aConnection.
	"Must keep a strong reference to each service until the roots are referenced."
	[[RsrProcessModel configureUnhandleExceptionProtection.
	servicesStrongly := self reifyAllIn: aConnection.
	receiver := self receiverReference resolve: aConnection.
	selector := self selectorReference resolve: aConnection.
	arguments := self argumentReferences collect: [:each | each resolve: aConnection].
	RsrProcessModel renameProcess: '', receiver class name, '>>', selector.
	"receiver and arguments should now be the roots of the service graph, discard strong references."
	servicesStrongly := nil.
	resolver addRoot: receiver. "Ensure we always send back the receiver -- this ensures sending a message results in by-directional syncing."
	messageSend := RsrMessageSend
		               receiver: receiver
		               selector: selector
		               arguments: arguments.
	self perform: messageSend answerUsing: resolver]
		on: self unhandledExceptionClass
		do: [:ex | 
			resolver break: (RsrRemoteException from: ex exception).
			ex return]]
		ensure:
			[resolver hasResolved
				ifFalse: [resolver break: 'Message send terminated without a result']]
%

category: 'reporting'
method: RsrSendMessage
logException: anException
to: aLog

	| message |
	message := String
		streamContents:
			[:stream |
			stream
				print: self receiverReference;
				nextPutAll: '>>';
				print: self selectorReference;
				nextPutAll: ' due to: ';
				nextPutAll: anException description].
	aLog error: message
%

category: 'executing'
method: RsrSendMessage
perform: aMessageSend
answerUsing: aResolver

	[| result |
	aMessageSend receiver configureProcess.
	result := aMessageSend perform.
	RsrProcessModel configureFrameworkProcess.
	aResolver fulfill: result]
		on: self unhandledExceptionClass
		do:
			[:ex | | debugResult |
			debugResult := [aMessageSend receiver
									debug: ex exception
									raisedDuring: aMessageSend
									answerUsing: aResolver]
									on: self unhandledExceptionClass
									do:
										[:debugEx |
										RsrProcessModel configureFrameworkProcess.
										aResolver break: (RsrRemoteException from: debugEx exception).
										ex return].
			RsrProcessModel configureFrameworkProcess.
			aResolver hasResolved
				ifTrue: [ex return]
				ifFalse:
					[ex exception isResumable
						ifTrue: [[ex resume: debugResult] ensure: [aMessageSend receiver configureProcess]] "This needs to be a protected call."
						ifFalse:
							[aResolver break: (RsrRemoteException from: ex exception).
							ex return]]]
%

category: 'accessing'
method: RsrSendMessage
receiverReference

	^receiverReference
%

category: 'accessing'
method: RsrSendMessage
receiverReference: aServiceReference

	receiverReference := aServiceReference
%

category: 'reporting'
method: RsrSendMessage
reportOn: aLog

	aLog debug: 'RsrSendMessage(', self receiverReference asString, '>>', self selectorReference asString, ')'
%

category: 'accessing'
method: RsrSendMessage
selectorReference

	^selectorReference
%

category: 'accessing'
method: RsrSendMessage
selectorReference: aSymbolReference

	selectorReference := aSymbolReference
%

category: 'accessing'
method: RsrSendMessage
unhandledExceptionClass
	"The class which signals that an unhandled execption has been signaled."

	^RsrProcessModel unhandledExceptionClass
%

! Class implementation for 'RsrReleaseServices'

!		Class methods for 'RsrReleaseServices'

category: 'instance creation'
classmethod: RsrReleaseServices
sids: anArrayOfServiceIDs

	^self new
		sids: anArrayOfServiceIDs;
		yourself
%

!		Instance methods for 'RsrReleaseServices'

category: 'encoding'
method: RsrReleaseServices
encode: aStream
using: anEncoder

	anEncoder
		encodeReleaseServices: self
		onto: aStream
%

category: 'executing'
method: RsrReleaseServices
executeFor: aConnection

	sids do: [:sid | aConnection _remoteClientReleased: sid]
%

category: 'reporting'
method: RsrReleaseServices
reportOn: aLog

	aLog debug: 'RsrReleaseObjects(', self sids printString, ')'
%

category: 'accessing'
method: RsrReleaseServices
sids

	^sids
%

category: 'accessing'
method: RsrReleaseServices
sids: anArrayOfServiceIDs

	sids := anArrayOfServiceIDs
%

! Class implementation for 'RsrConnection'

!		Class methods for 'RsrConnection'

category: 'instance creation'
classmethod: RsrConnection
channel: aChannel
transactionSpigot: aNumericSpigot
oidSpigot: anOidSpigot
	"Create a new Connection with an already Configured Channel.
	Provide spigots as their behavior is specified by the Channel creation
	protocols."

	^self
		specification: nil
		channel: aChannel
		transactionSpigot: aNumericSpigot
		oidSpigot: anOidSpigot
%

category: 'instance creation'
classmethod: RsrConnection
new
	"Instances of Connection should not be created via #new.
	Instead use ConnectionSpecification.
	See SystemTestCase>>#setUp for an example."

	self shouldNotImplement: #new
%

category: 'instance creation'
classmethod: RsrConnection
specification: aConnectionSpecification
channel: aChannel
transactionSpigot: aNumericSpigot
oidSpigot: anOidSpigot
	"Create a new Connection with an already Configured Channel.
	Provide spigots as their behavior is specified by the Channel creation
	protocols."

	^super new
		specification: aConnectionSpecification;
		channel: aChannel;
		transactionSpigot: aNumericSpigot;
		oidSpigot: anOidSpigot;
		yourself
%

!		Instance methods for 'RsrConnection'

category: 'public-accessing'
method: RsrConnection
announcer
	"Returns the announcer used by RSR to announce events."

	^announcer
%

category: 'private-accessing'
method: RsrConnection
channel

	^channel
%

category: 'private-accessing'
method: RsrConnection
channel: aChannel

	channel := aChannel.
	channel connection: self
%

category: 'private-events'
method: RsrConnection
channelDisconnected

	self log info: 'Disconnected'.
	self close
%

category: 'public-lifecycle'
method: RsrConnection
close

	| pm temp |
	channel close.
	temp := Dictionary new.
	pm := pendingMessages.
	pendingMessages := temp.
	pm do: [:each | each promise break: RsrConnectionClosedBeforeReceivingResponse new].
	registry := RsrThreadSafeDictionary new.
	announcer announce: (RsrConnectionClosed connection: self)
%

category: 'private-initialization'
method: RsrConnection
initialize

	super initialize.
	transactionSpigot := RsrThreadSafeNumericSpigot naturals.
	pendingMessages := RsrThreadSafeDictionary new.
	registry := RsrThreadSafeDictionary new.
	log := RsrLog new.
	announcer := Announcer new
%

category: 'public-testing'
method: RsrConnection
isOpen

	^channel isConnected
%

category: 'private-accessing'
method: RsrConnection
log

	^log
%

category: 'private-service management'
method: RsrConnection
mournActionForClientSID: aSID

	^[registry removeKey: aSID.
			self _releaseSID: aSID]
%

category: 'private-service management'
method: RsrConnection
mournActionForServerSID: aSID

	^[registry removeKey: aSID]
%

category: 'private-accessing'
method: RsrConnection
oidSpigot

	^oidSpigot
%

category: 'private-accessing'
method: RsrConnection
oidSpigot: anIntegerSpigot

	oidSpigot := anIntegerSpigot
%

category: 'public-lifecycle'
method: RsrConnection
open

	channel open
%

category: 'private-accessing'
method: RsrConnection
pendingMessages

	^pendingMessages
%

category: 'private-service management'
method: RsrConnection
serviceAt: aSID

	^self
		serviceAt: aSID
		ifAbsent: [RsrUnknownSID signal: aSID printString]
%

category: 'private-service management'
method: RsrConnection
serviceAt: aSID
ifAbsent: aBlock
	"Return the service associated with the provided SID."

	| entry |
	entry := registry at: aSID ifAbsent: [nil].
	"Ensure we do not hold the lock for long."
	entry == nil
		ifTrue: [^aBlock value].
	"The Service may have been garbage collected but
	the entry may not yet be removed. Ensure we
	evaluate the block in that case as well."
	^entry service
		ifNil: aBlock
		ifNotNil: [:service | service]
%

category: 'public-accessing'
method: RsrConnection
specification
	"Returns the Specification used to create this Connection.
	If the Connection was not create using a Specification, returns nil."

	^specification
%

category: 'public-accessing'
method: RsrConnection
specification: aConnectionSpecification
	"Store the Specification used to the create this Connection."

	specification := aConnectionSpecification
%

category: 'private-accessing'
method: RsrConnection
transactionSpigot

	^transactionSpigot
%

category: 'private-accessing'
method: RsrConnection
transactionSpigot: anObject

	transactionSpigot := anObject
%

category: 'private-events'
method: RsrConnection
unknownError: anException

	self close
%

category: 'public-waiting'
method: RsrConnection
waitUntilClose

	| semaphore |
	semaphore := Semaphore new.
	announcer
		when: RsrConnectionClosed
		send: #signal
		to: semaphore.
	semaphore wait
%

category: 'private-service management'
method: RsrConnection
_ensureRegistered: aService

	aService _connection == nil
		ifTrue: [^self _register: aService as: oidSpigot next].
	aService _connection == self
		ifFalse: [^RsrAlreadyRegistered signalService: aService intendedConnection: self]
%

category: 'private-accessing'
method: RsrConnection
_forwarderClass

	^RsrForwarder
%

category: 'private-handling commands'
method: RsrConnection
_receivedCommand: aCommand
	"Execute the command in the context of the receiving Connection."

	RsrProcessModel
		fork:
			[RsrProcessModel configureFrameworkProcess.
			aCommand executeFor: self]
		named: 'Processing ', aCommand class name
%

category: 'private-service management'
method: RsrConnection
_register: aService
as: sid

	| registryEntry mournAction |
	aService
		_id: sid
		connection: self.
	mournAction := aService isClient
		ifTrue: [self mournActionForClientSID: sid]
		ifFalse: [self mournActionForServerSID: sid].
	registryEntry := RsrRegistryEntry
		service: aService
		onMourn: mournAction.
	registry
		at: sid
		put: registryEntry
%

category: 'private-coordination'
method: RsrConnection
_releaseSID: aSID

	| command |
	self isOpen
		ifFalse: [^self].
	self log trace: 'Cleaning up OID:', aSID printString.
	command := RsrReleaseServices sids: (Array with: aSID).
	self _sendCommand: command
%

category: 'private-service management'
method: RsrConnection
_remoteClientReleased: aSID
	"Remotely, a Client instance has been garbage collected.
	Ensure we only reference the associated service weakly."

	| entry |
	entry := registry
		at: aSID
		ifAbsent: [^self].
	entry becomeWeak.
%

category: 'private-handling commands'
method: RsrConnection
_sendCommand: aCommand
	"Send the provided Command to our peer."

	channel send: aCommand
%

category: 'private-handling commands'
method: RsrConnection
_sendMessage: aMessage
to: aService

"Open coordination window"
	"Send dirty transitive closure of aRemoteMessage"
	"Send DispatchMessage command"
"Coorination window closed"
	"Return Promise"
	| analysis receiverReference selectorReference argumentReferences dispatchCommand promise pendingMessage |
	self isOpen
		ifFalse: [self error: 'Connection is not open'].
	analysis := RsrSnapshotAnalysis
		roots: (Array with: aService), aMessage arguments
		connection: self.
	analysis perform.
	receiverReference := RsrReference from: aService.
	selectorReference := RsrReference from: aMessage selector.
	argumentReferences := aMessage arguments collect: [:each | RsrReference from: each].
	dispatchCommand := RsrSendMessage
		transaction: self transactionSpigot next
		receiverReference: receiverReference
		selectorReference: selectorReference
		argumentReferences: argumentReferences.
	dispatchCommand snapshots: analysis snapshots.
	promise := RsrPromise new.
	pendingMessage := RsrPendingMessage
		services: nil "I don't think we need to cache services here. They will remain on the stack unless they were removed from the transitive closure by another proc"
		promise: promise.
	self pendingMessages
		at: dispatchCommand transaction
		put: pendingMessage.
	self _sendCommand: dispatchCommand.
	^promise
%

category: 'private-service management'
method: RsrConnection
_stronglyRetain: aServer
	"Retain the already registered server strongly."

	| entry |
	entry := registry
		at: aServer _id
		ifAbsent: [RsrUnknownSID signal: aServer _id printString].
	entry becomeStrong
%

! Class implementation for 'RsrInternalConnectionSpecification'

!		Instance methods for 'RsrInternalConnectionSpecification'

category: 'asserting'
method: RsrInternalConnectionSpecification
assertOpen
	"Assert that connectionA and connectionB are open.
	Signal RsrConnectionFailed if they are not."

	(connectionA isOpen and: [connectionB isOpen])
		ifFalse: [RsrConnectionFailed signal]
%

category: 'connecting'
method: RsrInternalConnectionSpecification
connect
	"Establish an internal Connection pair."

	self subclassResponsibility
%

category: 'accessing'
method: RsrInternalConnectionSpecification
connectionA

	^connectionA
%

category: 'accessing'
method: RsrInternalConnectionSpecification
connectionA: anObject

	^ connectionA := anObject
%

category: 'accessing'
method: RsrInternalConnectionSpecification
connectionB

	^connectionB
%

category: 'accessing'
method: RsrInternalConnectionSpecification
connectionB: anObject

	connectionB := anObject
%

! Class implementation for 'RsrInMemoryConnectionSpecification'

!		Instance methods for 'RsrInMemoryConnectionSpecification'

category: 'connecting'
method: RsrInMemoryConnectionSpecification
connect
	"Establish an internal Connection pair via SharedQueues."

	| aQueue bQueue channelA channelB |
	aQueue := SharedQueue new.
	bQueue := SharedQueue new.
	channelA := RsrInMemoryChannel
		inQueue: aQueue
		outQueue: bQueue.
	channelB := RsrInMemoryChannel
		inQueue: bQueue
		outQueue: aQueue.
	connectionA := RsrConnection
		specification: self
		channel: channelA
		transactionSpigot: RsrThreadSafeNumericSpigot naturals
		oidSpigot: RsrThreadSafeNumericSpigot naturals.
	connectionB := RsrConnection
		specification: self
		channel: channelB
		transactionSpigot: RsrThreadSafeNumericSpigot naturals negated
		oidSpigot: RsrThreadSafeNumericSpigot naturals negated.
	connectionA open.
	connectionB open.
	self assertOpen.
	^connectionA
%

! Class implementation for 'RsrInternalSocketConnectionSpecification'

!		Instance methods for 'RsrInternalSocketConnectionSpecification'

category: 'connecting'
method: RsrInternalSocketConnectionSpecification
connect
	"Establish an internal Connection pair via socket."

	| acceptor initiator |
	acceptor := RsrAcceptConnection port: self defaultPort.
	initiator := RsrInitiateConnection host: '127.0.0.1' port: self defaultPort.
	RsrProcessModel
		fork: [connectionA := acceptor waitForConnection]
		named: 'Pending AcceptConnection'.
	self minimalWait. "Allow other process to schedule."
	connectionB := initiator connect.
	self minimalWait. "Allow other process to schedule."
	self assertOpen.
	connectionA specification: self.
	connectionB specification: self.
	^connectionA
%

category: 'accessing'
method: RsrInternalSocketConnectionSpecification
defaultPort
	"Returns the default port number used to listen for connections."

	^61982
%

! Class implementation for 'RsrSocketConnectionSpecification'

!		Class methods for 'RsrSocketConnectionSpecification'

category: 'instance creation'
classmethod: RsrSocketConnectionSpecification
host: hostnameOrAddress
port: port

	^self new
		host: hostnameOrAddress;
		port: port;
		yourself
%

!		Instance methods for 'RsrSocketConnectionSpecification'

category: 'accessing'
method: RsrSocketConnectionSpecification
host
	"Return the configured hostname or IP address"

	^host
%

category: 'accessing'
method: RsrSocketConnectionSpecification
host: hostnameOrAddress
	"The hostname or IP address used to establish a connection."

	host := hostnameOrAddress
%

category: 'accessing'
method: RsrSocketConnectionSpecification
port
	"The port number used for establishing a socket"

	^port
%

category: 'accessing'
method: RsrSocketConnectionSpecification
port: aPort
	"The port number used for establishing a socket"

	port := aPort
%

category: 'accessing'
method: RsrSocketConnectionSpecification
socketClass
	"Return the class that should be used for creating Socket instances."

	^RsrSocket
%

! Class implementation for 'RsrAcceptConnection'

!		Class methods for 'RsrAcceptConnection'

category: 'instance creation'
classmethod: RsrAcceptConnection
port: aPortInteger

	^super
		host: self wildcardAddress
		port: aPortInteger
%

category: 'accessing'
classmethod: RsrAcceptConnection
wildcardAddress

	^'0.0.0.0'
%

category: 'accessing'
classmethod: RsrAcceptConnection
wildcardPort

	^0
%

!		Instance methods for 'RsrAcceptConnection'

category: 'actions'
method: RsrAcceptConnection
cancelWaitForConnection

	listener ifNotNil: [:socket | socket close]
%

category: 'actions'
method: RsrAcceptConnection
ensureListening

	isListening ifTrue: [^self].
	listener
		bindAddress: self host
		port: self port.
	listener listen: 1.
	isListening := true
%

category: 'accessing'
method: RsrAcceptConnection
handshakeSteps
	"Returns a sequence of steps needed to perform a successful handshake."

	^Array
		with: RsrProtocolVersionNegotiationServer new
%

category: 'other'
method: RsrAcceptConnection
initialize

	super initialize.
	listener := self socketClass new.
	isWaitingForConnection := false.
	isListening := false
%

category: 'testing'
method: RsrAcceptConnection
isWaitingForConnection

	^isWaitingForConnection
%

category: 'accessing'
method: RsrAcceptConnection
listeningPort
	"Return the port the underlying socket is listening on.
	This is useful when using the wildcard port to dynamically
	assign a port number."

	isListening ifFalse: [^nil].
	^listener port
%

category: 'actions'
method: RsrAcceptConnection
waitForConnection

	| socket stream handshake channel connection |
	self ensureListening.
	[isWaitingForConnection := true.
	socket := [listener accept]
		on: RsrSocketError
		do: [:ex | ex resignalAs: RsrWaitForConnectionCancelled new]]
			ensure:
				[listener close.
				listener := nil.
				isWaitingForConnection := false].
	stream := RsrSocketStream on: socket.
	handshake := RsrHandshake
		steps: self handshakeSteps
		stream: stream.
	handshake perform.
	channel := RsrBinaryStreamChannel
		inStream: stream
		outStream: stream.
	connection := RsrConnection
		specification: self
		channel: channel
		transactionSpigot: RsrThreadSafeNumericSpigot naturals
		oidSpigot: RsrThreadSafeNumericSpigot naturals.
	^connection open
%

! Class implementation for 'RsrGciAcceptConnection'

!		Class methods for 'RsrGciAcceptConnection'

category: 'instance creation'
classmethod: RsrGciAcceptConnection
host: hostnameOrAddress
port: port
token: aToken

	^self new
		host: hostnameOrAddress;
		port: port;
		token: aToken;
		yourself
%

!		Instance methods for 'RsrGciAcceptConnection'

category: 'accessing'
method: RsrGciAcceptConnection
handshakeSteps
	"Returns a sequence of steps needed to perform a successful handshake."

	^Array
		with: RsrProtocolVersionNegotiationServer new
		with: (RsrTokenReceiver token: self token)
%

category: 'initializing'
method: RsrGciAcceptConnection
initialize

	super initialize.
	token := RsrToken newRandom
%

category: 'accessing'
method: RsrGciAcceptConnection
token
	"Returns the token used during handshake."

	^token
%

category: 'accessing'
method: RsrGciAcceptConnection
token: aToken
	"Stores the token used during handshake."

	token := aToken
%

! Class implementation for 'RsrInitiateConnection'

!		Instance methods for 'RsrInitiateConnection'

category: 'connecting'
method: RsrInitiateConnection
connect

	| socket stream handshake channel connection |
	socket := self socketClass new.
	socket
		connectToHost: self host
		port: self port.
	stream := RsrSocketStream on: socket.
	handshake := RsrHandshake
		steps: self handshakeSteps
		stream: stream.
	handshake perform.
	channel := RsrBinaryStreamChannel
		inStream: stream
		outStream: stream.
	connection := RsrConnection
		specification: self
		channel: channel
		transactionSpigot: RsrThreadSafeNumericSpigot naturals negated
		oidSpigot: RsrThreadSafeNumericSpigot naturals negated.
	^connection open
%

category: 'accessing'
method: RsrInitiateConnection
handshakeSteps
	"Returns a sequence of steps needed to perform a successful handshake."

	^Array
		with: RsrProtocolVersionNegotiationClient new
%

! Class implementation for 'RsrGciInitiateConnection'

!		Class methods for 'RsrGciInitiateConnection'

category: 'instance creation'
classmethod: RsrGciInitiateConnection
host: hostnameOrAddress
port: port
token: aToken

	^self new
		host: hostnameOrAddress;
		port: port;
		token: aToken;
		yourself
%

!		Instance methods for 'RsrGciInitiateConnection'

category: 'accessing'
method: RsrGciInitiateConnection
handshakeSteps
	"Returns a sequence of steps needed to perform a successful handshake."

	^Array
		with: RsrProtocolVersionNegotiationClient new
		with: (RsrTokenSender token: self token)
%

category: 'accessing'
method: RsrGciInitiateConnection
token
	"Returns the token used during handshake."

	^token
%

category: 'accessing'
method: RsrGciInitiateConnection
token: aToken
	"Stores the token used during handshake."

	token := aToken
%

! Class implementation for 'RsrEnvironment'

!		Class methods for 'RsrEnvironment'

category: 'branching'
classmethod: RsrEnvironment
ifPharo: aPharoBlock
ifGemStone: aGemStoneBlock
ifDolphin: aDolphinBlock

	^aGemStoneBlock value
%

! Class implementation for 'RsrEphemeron'

!		Class methods for 'RsrEphemeron'

category: 'instance-creation'
classmethod: RsrEphemeron
on: anObject
mournAction: aBlock

	^self new
        key: anObject;
        mournAction: aBlock;
        beEphemeron: true;
        yourself
%

!		Instance methods for 'RsrEphemeron'

category: 'accessing'
method: RsrEphemeron
key

	^key
%

category: 'accessing'
method: RsrEphemeron
key: anObject

	key := anObject
%

category: 'mourning'
method: RsrEphemeron
mourn

	mournAction value.
    key := mournAction := nil
%

category: 'accessing'
method: RsrEphemeron
mournAction: aBlock

	mournAction := aBlock
%

! Class implementation for 'RsrGarbageCollector'

!		Class methods for 'RsrGarbageCollector'

category: 'cleaning'
classmethod: RsrGarbageCollector
maximumReclamation

	| object ephemeron sema |
	object := Object new.
	sema := Semaphore new.
	ephemeron := RsrEphemeron
		on: object
		mournAction: [sema signal].
	object := nil.
	System
		_generationScavenge_vmMarkSweep;
		_generationScavenge_vmMarkSweep.
	^sema waitForMilliseconds: 10
%

! Class implementation for 'RsrHandshake'

!		Class methods for 'RsrHandshake'

category: 'instance creation'
classmethod: RsrHandshake
steps: anArrayOfSteps
stream: aStream

	^self new
		steps: anArrayOfSteps;
		stream: aStream;
		yourself
%

!		Instance methods for 'RsrHandshake'

category: 'performing'
method: RsrHandshake
perform
	"Perform the sequence of configured steps."

	self steps do: [:each | each performOver: self stream]
%

category: 'accessing'
method: RsrHandshake
steps
	"The sequence of handshake steps to perform."

	^steps
%

category: 'accessing'
method: RsrHandshake
steps: anArrayOfSteps
	"The sequence of handshake steps to perform."

	steps := anArrayOfSteps
%

category: 'accessing'
method: RsrHandshake
stream
	"The stream used by each step."

	^stream
%

category: 'accessing'
method: RsrHandshake
stream: aStream
	"The stream used by each step."

	stream := aStream
%

! Class implementation for 'RsrHandshakeStep'

!		Instance methods for 'RsrHandshakeStep'

category: 'performing'
method: RsrHandshakeStep
performOver: aStream
	"Perform the work for this step."

	^self subclassResponsibility
%

! Class implementation for 'RsrProtocolVersionNegotiation'

!		Instance methods for 'RsrProtocolVersionNegotiation'

category: 'accessing'
method: RsrProtocolVersionNegotiation
codec

	^RsrProtocolVersionNegotiationCodec new
%

! Class implementation for 'RsrProtocolVersionNegotiationClient'

!		Instance methods for 'RsrProtocolVersionNegotiationClient'

category: 'handshaking'
method: RsrProtocolVersionNegotiationClient
performOver: aStream
	"Perform the Client's porition of the handshake"

	| supportedVersions answer |
	supportedVersions := RsrSupportedVersions versions: #(1).
	self codec
		encodeSupportedVersions: supportedVersions
		onto: aStream.
	aStream flush.
	answer := self codec decode: aStream.
	answer hasSharedVersion
		ifFalse: [^RsrProtocolVersionNegotiationFailed signal: 'The Client and Server could not agree on an RSR protocol version.']
%

! Class implementation for 'RsrProtocolVersionNegotiationServer'

!		Instance methods for 'RsrProtocolVersionNegotiationServer'

category: 'handshaking'
method: RsrProtocolVersionNegotiationServer
performOver: aStream
	"Peform the Server's side of the handshake."

	| supportedVersions |
	supportedVersions := self codec decode: aStream.
	(supportedVersions versions includes: 1)
		ifTrue:
			[self codec
				encodeChosenVersion: (RsrChosenVersion version: 1)
				onto: aStream.
			aStream flush]
		ifFalse:
			[self codec
				encodeNoVersionOverlap: RsrNoVersionOverlap new
				onto: aStream.
			aStream flush; close.
			^RsrProtocolVersionNegotiationFailed signal: 'Client versions did not overlap w/ Server']
%

! Class implementation for 'RsrTokenExchange'

!		Class methods for 'RsrTokenExchange'

category: 'accessing'
classmethod: RsrTokenExchange
token: aToken

	^self new
		token: aToken;
		yourself
%

!		Instance methods for 'RsrTokenExchange'

category: 'accessing'
method: RsrTokenExchange
codec

	^RsrTokenExchangeCodec new
%

category: 'accessing'
method: RsrTokenExchange
token

	^token
%

category: 'accessing'
method: RsrTokenExchange
token: aToken

	token := aToken
%

! Class implementation for 'RsrTokenReceiver'

!		Instance methods for 'RsrTokenReceiver'

category: 'performing'
method: RsrTokenReceiver
performOver: aStream
	"Send the token. Wait for confirmation."

	| receivedToken |
	receivedToken := self codec decode: aStream.
	receivedToken = self token
		ifTrue:
			[self codec
				encodeTokenAccepted: nil "RsrTokenAccepted new"
				onto: aStream.
			aStream flush]
		ifFalse:
			[self codec
				encodeTokenRejected: nil "RsrTokenRejected new"
				onto: aStream.
			aStream flush.
			RsrTokenExchangeFailed signal]
%

! Class implementation for 'RsrTokenSender'

!		Instance methods for 'RsrTokenSender'

category: 'performing'
method: RsrTokenSender
performOver: aStream
	"Send the token. Wait for confirmation."

	| confirmation |
	self codec
		encodeToken: self token
		onto: aStream.
	aStream flush.
	confirmation := self codec decode: aStream.
	confirmation wasAccepted
		ifFalse: [RsrTokenExchangeFailed signal: 'Token was rejected']
%

! Class implementation for 'RsrLog'

!		Instance methods for 'RsrLog'

category: 'configuring'
method: RsrLog
addSink: aLogSink

	sinks add: aLogSink
%

category: 'logging'
method: RsrLog
critical: aString

	self verbosity >= self levelCritical
		ifTrue: [self log: aString level: #critical]
%

category: 'logging'
method: RsrLog
debug: aString

	self verbosity >= self levelDebug
		ifTrue: [	self log: aString level: #debug]
%

category: 'logging'
method: RsrLog
error: aString

	self verbosity >= self levelError
		ifTrue: [self log: aString level: #error]
%

category: 'logging'
method: RsrLog
info: aString

	self verbosity >= self levelInfo
		ifTrue: [self log: aString level: #info]
%

category: 'initialization'
method: RsrLog
initialize

	super initialize.
	verbosity := self levelTrace.
	sinks := OrderedCollection new
%

category: 'accessing'
method: RsrLog
levelCritical

	^0
%

category: 'accessing'
method: RsrLog
levelDebug

	^4
%

category: 'accessing'
method: RsrLog
levelError

	^1
%

category: 'accessing'
method: RsrLog
levelInfo

	^3
%

category: 'accessing'
method: RsrLog
levelTrace

	^5
%

category: 'accessing'
method: RsrLog
levelWarn

	^2
%

category: 'logging'
method: RsrLog
log: aMessage
level: aLevelString

	| message |
	message := RsrDateAndTime now printString, '-', aLevelString, '-', aMessage.
	sinks do: [:each | each write: message]
%

category: 'logging'
method: RsrLog
trace: aString

	self verbosity >= self levelTrace
		ifTrue: [self log: aString level: #trace]
%

category: 'accessing'
method: RsrLog
verbosity

	^verbosity
%

category: 'accessing'
method: RsrLog
verbosity: aLogLevel

	verbosity := aLogLevel
%

category: 'logging'
method: RsrLog
warning: aString

	self verbosity >= self levelWarn
		ifTrue: [self log: aString level: #warning]
%

! Class implementation for 'RsrLogSink'

!		Instance methods for 'RsrLogSink'

category: 'writing'
method: RsrLogSink
write: aMessage

	self subclassResponsibility
%

! Class implementation for 'RsrCustomSink'

!		Class methods for 'RsrCustomSink'

category: 'instance creation'
classmethod: RsrCustomSink
action: aBlock

	^self new
		action: aBlock;
		yourself
%

!		Instance methods for 'RsrCustomSink'

category: 'accessing'
method: RsrCustomSink
action

	^action
%

category: 'accessing'
method: RsrCustomSink
action: aBlock

	action := aBlock
%

category: 'writing'
method: RsrCustomSink
write: aMessage

	self action value: aMessage
%

! Class implementation for 'RsrTranscriptSink'

!		Instance methods for 'RsrTranscriptSink'

category: 'writing'
method: RsrTranscriptSink
write: aMessageString

	Transcript
		show: aMessageString;
		cr
%

! Class implementation for 'RsrLogWithPrefix'

!		Class methods for 'RsrLogWithPrefix'

category: 'logging'
classmethod: RsrLogWithPrefix
log: aLog

	^self new
		log: aLog;
		yourself
%

category: 'logging'
classmethod: RsrLogWithPrefix
prefix: aString
log: aLog

	^self new
		prefix: aString;
		log: aLog;
		yourself
%

!		Instance methods for 'RsrLogWithPrefix'

category: 'debugging'
method: RsrLogWithPrefix
debug: aString

	^self log debug: self prefix, '/', aString
%

category: 'accessing'
method: RsrLogWithPrefix
log

	^log
%

category: 'accessing'
method: RsrLogWithPrefix
log: aLog

	log := aLog
%

category: 'accessing'
method: RsrLogWithPrefix
prefix

	^prefix
%

category: 'accessing'
method: RsrLogWithPrefix
prefix: aString

	prefix := aString
%

! Class implementation for 'RsrMessageSend'

!		Class methods for 'RsrMessageSend'

category: 'instance creation'
classmethod: RsrMessageSend
receiver: anObject
selector: aSelector
arguments: anArray

	^self new
		receiver: anObject;
		selector: aSelector;
		arguments: anArray;
		yourself
%

!		Instance methods for 'RsrMessageSend'

category: 'accessing'
method: RsrMessageSend
arguments

	^arguments
%

category: 'accessing'
method: RsrMessageSend
arguments: anArray

	arguments := anArray
%

category: 'evaluating'
method: RsrMessageSend
perform

	^self receiver
		perform: self selector
		withArguments: self arguments
%

category: 'accessing'
method: RsrMessageSend
receiver

	^receiver
%

category: 'accessing'
method: RsrMessageSend
receiver: anObject

	receiver := anObject
%

category: 'accessing'
method: RsrMessageSend
selector

	^selector
%

category: 'accessing'
method: RsrMessageSend
selector: aSelector

	selector := aSelector
%

! Class implementation for 'RsrNumericSpigot'

!		Class methods for 'RsrNumericSpigot'

category: 'instance creation'
classmethod: RsrNumericSpigot
naturals

	^self
		start: 1
		step: 1
%

category: 'instance creation'
classmethod: RsrNumericSpigot
new

	^self
		start: 0
		step: 1
%

category: 'instance creation'
classmethod: RsrNumericSpigot
start: aNumber
step: anIncrement

	^super new
		start: aNumber;
		step: anIncrement;
		yourself
%

!		Instance methods for 'RsrNumericSpigot'

category: 'accessing'
method: RsrNumericSpigot
negated

	^self class
		start: current negated
		step: step negated
%

category: 'accessing'
method: RsrNumericSpigot
next

	| result |
	result := current.
	current := current + step.
	^result
%

category: 'accessing'
method: RsrNumericSpigot
next: aCount

	| result |
	result := Array new: aCount.
	1 to: aCount do: [:i | result at: i put: self next].
	^result
%

category: 'accessing'
method: RsrNumericSpigot
start: aNumber

	current := aNumber
%

category: 'accessing'
method: RsrNumericSpigot
step

	^step
%

category: 'accessing'
method: RsrNumericSpigot
step: anIncrement

	step := anIncrement
%

! Class implementation for 'RsrThreadSafeNumericSpigot'

!		Instance methods for 'RsrThreadSafeNumericSpigot'

category: 'initialization'
method: RsrThreadSafeNumericSpigot
initialize

	super initialize.
	mutex := Semaphore forMutualExclusion
%

category: 'accessing'
method: RsrThreadSafeNumericSpigot
next

	^mutex critical: [super next]
%

! Class implementation for 'RsrPendingMessage'

!		Class methods for 'RsrPendingMessage'

category: 'instance creation'
classmethod: RsrPendingMessage
services: aList
promise: aPromise

	^self new
		services: aList;
		promise: aPromise;
		yourself
%

!		Instance methods for 'RsrPendingMessage'

category: 'accessing'
method: RsrPendingMessage
promise

	^promise
%

category: 'accessing'
method: RsrPendingMessage
promise: aPromise

	promise := aPromise
%

category: 'accessing'
method: RsrPendingMessage
services

	^services
%

category: 'accessing'
method: RsrPendingMessage
services: aList

	services := aList
%

! Class implementation for 'RsrPromise'

!		Instance methods for 'RsrPromise'

category: 'private'
method: RsrPromise
assertNotResolved

	self isResolved
		ifTrue: [RsrAlreadyResolved signal].
%

category: 'resolving'
method: RsrPromise
break: aReason
	"Notify the receiver's observers that the Promise will not be fulfilled."

	mutex
		critical:
			[self assertNotResolved.
			value := aReason.
			state := #Broken].
	self notifyActions.
	resolvedMutex signal
%

category: 'resolving'
method: RsrPromise
fulfill: anObject
	"Fulfill the receiver and notify any observers."

	mutex
		critical:
			[self assertNotResolved.
			value := anObject.
			state := #Fulfilled].
	self notifyActions.
	resolvedMutex signal
%

category: 'private'
method: RsrPromise
initialize

	super initialize.
	mutex := Semaphore forMutualExclusion.
	resolvedMutex := Semaphore new.
	state := #PendingResolution.
	resolutionActions := OrderedCollection new
%

category: 'testing'
method: RsrPromise
isBroken
	"Report if the receiver is currently broken"

	^state == #Broken
%

category: 'testing'
method: RsrPromise
isFulfilled
	"Report is the receiver is currently fulfilled"

	^state == #Fulfilled
%

category: 'testing'
method: RsrPromise
isResolved
	"Report if the receiver is currently resolved."

	^self isFulfilled or: [self isBroken]
%

category: 'private'
method: RsrPromise
notifyActions
	"Activate any registered action's fulfillment blocks.
	Ensure that they are activated only once and that
	future actions are allowed."

	| actions |
	mutex
		critical:
			[actions := resolutionActions.
			resolutionActions := OrderedCollection new].
	actions
		do:
			[:each |
			self isFulfilled
				ifTrue: [RsrProcessModel fork: [each when value: value] named: 'Promise Fulfillment Notification']
				ifFalse: [RsrProcessModel fork: [each catch value: value] named: 'Promise Break Notification']]
%

category: 'observing'
method: RsrPromise
value
	"Alias for #wait"

	^self wait
%

category: 'observing'
method: RsrPromise
wait
	"Wait for a the receiver to be Resolved.
	If fulfilled - return the fulfillment value.
	If broken - raise an RsrBrokenPromise exception w/ the reason."

	self waitForResolution.
	^self isBroken
		ifTrue: [RsrBrokenPromise signalReason: value]
		ifFalse: [value]
%

category: 'private'
method: RsrPromise
waitForResolution
	"There doesn't seem to be a great way to implement this method.
	The ensure below is generally safe but does have a side-effect of signaling
	the mutex when the process is terminated while waiting.
	Removing the ensure allows the signal to be lost if the process is terminated
	just after #wait but before #signal is processed.
	In order to solve this, the loop verifies the promise is actually resolved before
	continuing."

	self isResolved
		ifTrue: [^self].
	[[self isResolved] whileFalse: [resolvedMutex wait]] ensure: [resolvedMutex signal]
%

category: 'observing'
method: RsrPromise
when: aWhenBlock
catch: aCatchBlock
	"Activate an appropriate block when the receiver is resolved.
	If the receiver is currently resolved, schedule the block activation.
	The block is activated in a new thread. The thread is not given any specific
	error handler.
	<aWhenBlock> will be sent #value: with the same value provided to #fulfill:.
	<aCatchBlock> will be sent #value: with the same reason provided to #break:."

	| action shouldNotifyActions |
	action := RsrPromiseResolutionAction
		when: aWhenBlock
		catch: aCatchBlock.
	mutex
		critical:
			[shouldNotifyActions := self isResolved.
			resolutionActions add: action].
	shouldNotifyActions ifTrue: [self notifyActions]
%

! Class implementation for 'RsrPromiseResolutionAction'

!		Class methods for 'RsrPromiseResolutionAction'

category: 'instance creation'
classmethod: RsrPromiseResolutionAction
when: aWhenBlock
catch: aCatchBlock

	^self new
		when: aWhenBlock;
		catch: aCatchBlock;
		yourself
%

!		Instance methods for 'RsrPromiseResolutionAction'

category: 'accessing'
method: RsrPromiseResolutionAction
catch

	^catch
%

category: 'accessing'
method: RsrPromiseResolutionAction
catch: aBlock

	catch := aBlock
%

category: 'accessing'
method: RsrPromiseResolutionAction
when

	^when
%

category: 'accessing'
method: RsrPromiseResolutionAction
when: aBlock

	when := aBlock
%

! Class implementation for 'RsrChosenVersion'

!		Class methods for 'RsrChosenVersion'

category: 'instance creation'
classmethod: RsrChosenVersion
version: aVersionNumber

	^self new
		version: aVersionNumber;
		yourself
%

!		Instance methods for 'RsrChosenVersion'

category: 'comparing'
method: RsrChosenVersion
= aChosenVersion

	^self class = aChosenVersion class and: [self version = aChosenVersion version]
%

category: 'testing'
method: RsrChosenVersion
hasSharedVersion
	"Answer whether there is a valid shared protocol version between the Client and Server."

	^true
%

category: 'accessing'
method: RsrChosenVersion
version

	^version
%

category: 'accessing'
method: RsrChosenVersion
version: aVersionNumber

	version := aVersionNumber
%

! Class implementation for 'RsrNoVersionOverlap'

!		Instance methods for 'RsrNoVersionOverlap'

category: 'comparing'
method: RsrNoVersionOverlap
= aNoVersionOverlap

	^self class = aNoVersionOverlap class
%

category: 'comparing'
method: RsrNoVersionOverlap
hash

	^self class hash
%

category: 'testing'
method: RsrNoVersionOverlap
hasSharedVersion
	"Answer whether there is a valid shared protocol version between the Client and Server."

	^false
%

! Class implementation for 'RsrSupportedVersions'

!		Class methods for 'RsrSupportedVersions'

category: 'instance creation'
classmethod: RsrSupportedVersions
versions: anArray

	^self new
		versions: anArray;
		yourself
%

!		Instance methods for 'RsrSupportedVersions'

category: 'comparing'
method: RsrSupportedVersions
= aSupportedVersions

	self class = aSupportedVersions class
		ifFalse: [^false].
	^self versions = aSupportedVersions versions
%

category: 'comparing'
method: RsrSupportedVersions
hash

	^self versions hash
%

category: 'accessing'
method: RsrSupportedVersions
versions

	^versions
%

category: 'accessing'
method: RsrSupportedVersions
versions: anArray

	versions := anArray
%

! Class implementation for 'RsrReference'

!		Class methods for 'RsrReference'

category: 'analyzing'
classmethod: RsrReference
analyze: anObject
using: anAnalyzer

	^self subclassResponsibility
%

category: 'instance creation'
classmethod: RsrReference
from: anObject

	| referenceClass |
	referenceClass := self referenceClassFor: anObject.
	^referenceClass from: anObject
%

category: 'accessing'
classmethod: RsrReference
referenceMapping

	^referenceMapping
%

category: 'accessing'
classmethod: RsrReference
typeIdentifier

	^self subclassResponsibility
%

!		Instance methods for 'RsrReference'

category: 'resolving'
method: RsrReference
resolve: aConnection
	"Resolve the reference in the context of the provided Connection."

	^self subclassResponsibility
%

category: 'accessing'
method: RsrReference
typeIdentifier

	^self class typeIdentifier
%

! Class implementation for 'RsrImmediateReference'

!		Class methods for 'RsrImmediateReference'

category: 'analyzing'
classmethod: RsrImmediateReference
analyze: anObject
using: anAnalyzer

	^anAnalyzer analyzeImmediate: anObject
%

category: 'instance creation'
classmethod: RsrImmediateReference
from: anObject

	^self subclassResponsiblity
%

!		Instance methods for 'RsrImmediateReference'

category: 'accessing'
method: RsrImmediateReference
immediateOID

	^0
%

! Class implementation for 'RsrBooleanReference'

!		Class methods for 'RsrBooleanReference'

category: 'instance creation'
classmethod: RsrBooleanReference
from: aBoolean

	^aBoolean
		ifTrue: [RsrTrueReference new]
		ifFalse: [RsrFalseReference new]
%

!		Instance methods for 'RsrBooleanReference'

category: 'encoding/decoding'
method: RsrBooleanReference
decode: aStream
using: aDecoder

	"Boolean has no additional value"
%

category: 'encoding/decoding'
method: RsrBooleanReference
encode: aStream
using: anEncoder

	anEncoder
		encodeControlWord: anEncoder immediateOID
		onto: aStream.
	anEncoder
		encodeControlWord: self typeIdentifier
		onto: aStream
%

! Class implementation for 'RsrFalseReference'

!		Class methods for 'RsrFalseReference'

category: 'accessing'
classmethod: RsrFalseReference
typeIdentifier

	^8
%

!		Instance methods for 'RsrFalseReference'

category: 'resolving'
method: RsrFalseReference
resolve: aConnection

	^false
%

! Class implementation for 'RsrTrueReference'

!		Class methods for 'RsrTrueReference'

category: 'accessing'
classmethod: RsrTrueReference
typeIdentifier

	^7
%

!		Instance methods for 'RsrTrueReference'

category: 'resolving'
method: RsrTrueReference
resolve: aConnection

	^true
%

! Class implementation for 'RsrNilReference'

!		Class methods for 'RsrNilReference'

category: 'instance creation'
classmethod: RsrNilReference
from: aNil

	^self new
%

category: 'accessing'
classmethod: RsrNilReference
typeIdentifier

	^6
%

!		Instance methods for 'RsrNilReference'

category: 'encoding/decoding'
method: RsrNilReference
decode: aStream
using: aDecoder

	"Nil has no additional value"
%

category: 'encoding/decoding'
method: RsrNilReference
encode: aStream
using: anEncoder

	anEncoder
		encodeControlWord: anEncoder immediateOID
		onto: aStream.
	anEncoder
		encodeControlWord: self typeIdentifier
		onto: aStream
%

category: 'resolving'
method: RsrNilReference
resolve: aConnection

	^nil
%

! Class implementation for 'RsrValueReference'

!		Class methods for 'RsrValueReference'

category: 'instance creation'
classmethod: RsrValueReference
intermediate: anObject

	^self new
		intermediate: anObject;
		yourself
%

!		Instance methods for 'RsrValueReference'

category: 'private-accessing'
method: RsrValueReference
intermediate: anObject
	"Store the intermediate form of this object"

	intermediate := anObject
%

category: 'resolving'
method: RsrValueReference
resolve: aConnection

	^intermediate
%

! Class implementation for 'RsrByteArrayReference'

!		Class methods for 'RsrByteArrayReference'

category: 'instance creation'
classmethod: RsrByteArrayReference
from: aByteArray

	^self intermediate: aByteArray copy
%

category: 'accessing'
classmethod: RsrByteArrayReference
typeIdentifier

	^10
%

!		Instance methods for 'RsrByteArrayReference'

category: 'encoding/decoding'
method: RsrByteArrayReference
decode: aStream
using: aDecoder

	| length |
	length := aDecoder decodeControlWord: aStream.
	intermediate := aStream next: length
%

category: 'encoding/decoding'
method: RsrByteArrayReference
encode: aStream
using: anEncoder

	anEncoder
		encodeControlWord: anEncoder immediateOID
		onto: aStream.
	anEncoder
		encodeControlWord: self typeIdentifier
		onto: aStream.
	anEncoder
		encodeControlWord: intermediate size
		onto: aStream.
	aStream nextPutAll: intermediate
%

! Class implementation for 'RsrCharacterArrayReference'

!		Class methods for 'RsrCharacterArrayReference'

category: 'instance creation'
classmethod: RsrCharacterArrayReference
from: aCharacterArray

	| bytes |
	bytes := self convertToBytes: aCharacterArray.
	^self intermediate: bytes
%

!		Instance methods for 'RsrCharacterArrayReference'

category: 'encoding/decoding'
method: RsrCharacterArrayReference
decode: aStream
using: aDecoder

	| length |
	length := aDecoder decodeControlWord: aStream.
	intermediate := aStream next: length
%

category: 'encoding/decoding'
method: RsrCharacterArrayReference
encode: aStream
using: anEncoder

	anEncoder
		encodeControlWord: anEncoder immediateOID
		onto: aStream.
	anEncoder
		encodeControlWord: self typeIdentifier
		onto: aStream.
	anEncoder
		encodeControlWord: intermediate size
		onto: aStream.
	aStream nextPutAll: intermediate
%

category: 'resolving'
method: RsrCharacterArrayReference
resolve: aConnection

	^self convertBytes: intermediate
%

! Class implementation for 'RsrStringReference'

!		Class methods for 'RsrStringReference'

category: 'accessing'
classmethod: RsrStringReference
typeIdentifier

	^2
%

! Class implementation for 'RsrSymbolReference'

!		Class methods for 'RsrSymbolReference'

category: 'accessing'
classmethod: RsrSymbolReference
typeIdentifier

	^1
%

!		Instance methods for 'RsrSymbolReference'

category: 'converting'
method: RsrSymbolReference
convertBytes: aByteArray

	^(super convertBytes: aByteArray) asSymbol
%

! Class implementation for 'RsrCharacterReference'

!		Class methods for 'RsrCharacterReference'

category: 'instance creation'
classmethod: RsrCharacterReference
from: aCharacter

	^self intermediate: aCharacter codePoint
%

category: 'accessing'
classmethod: RsrCharacterReference
typeIdentifier

	^5
%

!		Instance methods for 'RsrCharacterReference'

category: 'encoding/decoding'
method: RsrCharacterReference
decode: aStream
using: aDecoder

	intermediate := aDecoder decodeControlWord: aStream
%

category: 'encoding/decoding'
method: RsrCharacterReference
encode: aStream
using: anEncoder

	anEncoder
		encodeControlWord: anEncoder immediateOID
		onto: aStream.
	anEncoder
		encodeControlWord: self typeIdentifier
		onto: aStream.
	anEncoder
		encodeControlWord: intermediate
		onto: aStream
%

category: 'resolving'
method: RsrCharacterReference
resolve: aConnection

	^Character codePoint: intermediate
%

! Class implementation for 'RsrCollectionReference'

!		Class methods for 'RsrCollectionReference'

category: 'analyzing'
classmethod: RsrCollectionReference
analyze: aCollection
using: anAnalyzer

	^anAnalyzer analyzeCollection: aCollection
%

category: 'instance creation'
classmethod: RsrCollectionReference
from: aSequencedCollection

	| references |
	references := (1 to: aSequencedCollection size) collect: [:i | RsrReference from: (aSequencedCollection at: i)].
	^self intermediate: references
%

!		Instance methods for 'RsrCollectionReference'

category: 'encoding/decoding'
method: RsrCollectionReference
decode: aStream
using: aDecoder

	| size |
	size := aDecoder decodeControlWord: aStream.
	intermediate := (1 to: size) collect: [:i | aDecoder decodeReference: aStream]
%

category: 'encoding/decoding'
method: RsrCollectionReference
encode: aStream
using: anEncoder

	anEncoder
		encodeControlWord: anEncoder immediateOID
		onto: aStream.
	anEncoder
		encodeControlWord: self typeIdentifier
		onto: aStream.
	anEncoder
		encodeControlWord: intermediate size
		onto: aStream.
	intermediate
		do:
			[:each |
			each
				encode: aStream
				using: anEncoder]
%

! Class implementation for 'RsrArrayReference'

!		Class methods for 'RsrArrayReference'

category: 'accessing'
classmethod: RsrArrayReference
typeIdentifier

	^9
%

!		Instance methods for 'RsrArrayReference'

category: 'resolving'
method: RsrArrayReference
resolve: aConnection

	^intermediate collect: [:each | each resolve: aConnection]
%

! Class implementation for 'RsrDictionaryReference'

!		Class methods for 'RsrDictionaryReference'

category: 'analyzing'
classmethod: RsrDictionaryReference
analyze: aDictionary
using: anAnalyzer

	^anAnalyzer analyzeDictionary: aDictionary
%

category: 'instance creation'
classmethod: RsrDictionaryReference
from: aDictionary

	| referenceStream |
	referenceStream := WriteStream on: (Array new: aDictionary size * 2).
	aDictionary
		keysAndValuesDo:
			[:key :value |
			referenceStream
				nextPut: (RsrReference from: key);
				nextPut: (RsrReference from: value)].
	^self intermediate: referenceStream contents
%

category: 'accessing'
classmethod: RsrDictionaryReference
typeIdentifier

	^13
%

!		Instance methods for 'RsrDictionaryReference'

category: 'encoding/decoding'
method: RsrDictionaryReference
decode: aStream
using: aDecoder

	| size |
	size := aDecoder decodeControlWord: aStream.
	intermediate := (1 to: size * 2) collect: [:each | aDecoder decodeReference: aStream]
%

category: 'encoding/decoding'
method: RsrDictionaryReference
encode: aStream
using: anEncoder

	anEncoder
		encodeControlWord: anEncoder immediateOID
		onto: aStream.
	anEncoder
		encodeControlWord: self typeIdentifier
		onto: aStream.
	anEncoder
		encodeControlWord: intermediate size / 2
		onto: aStream.
	intermediate do: [:each | each encode: aStream using: anEncoder]
%

category: 'resolving'
method: RsrDictionaryReference
resolve: aConnection

	| stream numEntries dictionary |
	stream := ReadStream on: intermediate.
	numEntries := intermediate size / 2.
	dictionary := Dictionary new: numEntries.
	numEntries
		timesRepeat:
			[dictionary
				at: (stream next resolve: aConnection)
				put: (stream next resolve: aConnection)].
	^dictionary
%

! Class implementation for 'RsrOrderedCollectionReference'

!		Class methods for 'RsrOrderedCollectionReference'

category: 'accessing'
classmethod: RsrOrderedCollectionReference
typeIdentifier

	^12
%

!		Instance methods for 'RsrOrderedCollectionReference'

category: 'other'
method: RsrOrderedCollectionReference
resolve: aConnection

	| oc |
	oc := OrderedCollection new: intermediate size.
	intermediate do: [:each | oc add: (each resolve: aConnection)].
	^oc
%

! Class implementation for 'RsrSetReference'

!		Class methods for 'RsrSetReference'

category: 'instance creation'
classmethod: RsrSetReference
from: aSet

	| referenceStream |
	referenceStream := WriteStream on: (Array new: aSet size).
	aSet do:  [:each | referenceStream nextPut: (RsrReference from: each)].
	^self intermediate: referenceStream contents
%

category: 'accessing'
classmethod: RsrSetReference
typeIdentifier

	^11
%

!		Instance methods for 'RsrSetReference'

category: 'resolving'
method: RsrSetReference
resolve: aConnection

	| set |
	set := Set new: intermediate size * 2.
	intermediate do: [:each | set add: (each resolve: aConnection)].
	^set
%

! Class implementation for 'RsrDateAndTimeReference'

!		Class methods for 'RsrDateAndTimeReference'

category: 'instance creation'
classmethod: RsrDateAndTimeReference
from: aDateAndTime

	| intermediate |
	intermediate := RsrDateAndTime microsecondsSinceEpoch: aDateAndTime.
	^self intermediate: intermediate
%

category: 'accessing'
classmethod: RsrDateAndTimeReference
typeIdentifier

	^14
%

!		Instance methods for 'RsrDateAndTimeReference'

category: 'encoding/decoding'
method: RsrDateAndTimeReference
decode: aStream
using: aDecoder

	intermediate := aDecoder decodeControlWord: aStream
%

category: 'encoding/decoding'
method: RsrDateAndTimeReference
encode: aStream
using: anEncoder

	anEncoder
		encodeControlWord: anEncoder immediateOID
		onto: aStream.
	anEncoder
		encodeControlWord: self typeIdentifier
		onto: aStream.
	anEncoder
		encodeControlWord: intermediate
		onto: aStream
%

category: 'resolving'
method: RsrDateAndTimeReference
resolve: aConnection

	^RsrDateAndTime fromMicroseconds: intermediate
%

! Class implementation for 'RsrDoubleReference'

!		Class methods for 'RsrDoubleReference'

category: 'instance creation'
classmethod: RsrDoubleReference
from: aFloat

	| intermediate |
	intermediate := self convertToBytes: aFloat.
	^self intermediate: intermediate
%

category: 'accessing'
classmethod: RsrDoubleReference
typeIdentifier

	^15
%

!		Instance methods for 'RsrDoubleReference'

category: 'encoding/decoding'
method: RsrDoubleReference
decode: aStream
using: aDecoder

	intermediate := aStream next: 8
%

category: 'encoding/decoding'
method: RsrDoubleReference
encode: aStream
using: anEncoder

	anEncoder
		encodeControlWord: anEncoder immediateOID
		onto: aStream.
	anEncoder
		encodeControlWord: self typeIdentifier
		onto: aStream.
	aStream nextPutAll: intermediate
%

category: 'resolving'
method: RsrDoubleReference
resolve: aConnection

	^self convertBytes: intermediate
%

! Class implementation for 'RsrIntegerReference'

!		Class methods for 'RsrIntegerReference'

category: 'converting'
classmethod: RsrIntegerReference
convertToBytes: anInteger

	| stream int |
	anInteger <= 0
		ifTrue: [^#[0]].
	stream := WriteStream on: (ByteArray new: 8).
	int := anInteger.
	[int > 0]
		whileTrue:
			[stream nextPut: (int bitAnd: 16rFF).
			int := int bitShift: -8].
	^stream contents reverse
%

category: 'instance creation'
classmethod: RsrIntegerReference
from: anInteger

	| intermediate |
	intermediate := self convertToBytes: anInteger abs.
	^anInteger positive
		ifTrue: [RsrPositiveIntegerReference intermediate: intermediate]
		ifFalse: [RsrNegativeIntegerReference intermediate: intermediate]
%

!		Instance methods for 'RsrIntegerReference'

category: 'converting'
method: RsrIntegerReference
convertBytes: aByteArray

	^aByteArray
		inject: 0
		into: [:integer :byte | (integer bitShift: 8) bitOr: byte]
%

category: 'encoding/decoding'
method: RsrIntegerReference
decode: aStream
using: aDecoder

	| length |
	length := aDecoder decodeControlWord: aStream.
	intermediate := aStream next: length
%

category: 'encoding/decoding'
method: RsrIntegerReference
encode: aStream
using: anEncoder

	anEncoder
		encodeControlWord: anEncoder immediateOID
		onto: aStream.
	anEncoder
		encodeControlWord: self typeIdentifier
		onto: aStream.
	anEncoder
		encodeControlWord: intermediate size
		onto: aStream.
	aStream nextPutAll: intermediate
%

category: 'resolving'
method: RsrIntegerReference
resolve: aConnection

	^self convertBytes: intermediate
%

! Class implementation for 'RsrNegativeIntegerReference'

!		Class methods for 'RsrNegativeIntegerReference'

category: 'accessing'
classmethod: RsrNegativeIntegerReference
typeIdentifier

	^4
%

!		Instance methods for 'RsrNegativeIntegerReference'

category: 'converting'
method: RsrNegativeIntegerReference
convertBytes: aByteArray

	^(super convertBytes: aByteArray) negated
%

! Class implementation for 'RsrPositiveIntegerReference'

!		Class methods for 'RsrPositiveIntegerReference'

category: 'accessing'
classmethod: RsrPositiveIntegerReference
typeIdentifier

	^3
%

! Class implementation for 'RsrServiceReference'

!		Class methods for 'RsrServiceReference'

category: 'analyzing'
classmethod: RsrServiceReference
analyze: aService
using: anAnalyzer

	^anAnalyzer analyzeService: aService
%

category: 'instance creation'
classmethod: RsrServiceReference
from: aService

	^self sid: aService _id
%

category: 'instance creation'
classmethod: RsrServiceReference
sid: aServiceID

	^self new
		sid: aServiceID;
		yourself
%

!		Instance methods for 'RsrServiceReference'

category: 'encoding/decoding'
method: RsrServiceReference
encode: aStream
using: anEncoder

	anEncoder
		encodeControlWord: self sid
		onto: aStream
%

category: 'resolving'
method: RsrServiceReference
resolve: aConnection

	^aConnection serviceAt: self sid
%

category: 'accessing'
method: RsrServiceReference
sid

	^sid
%

category: 'accessing'
method: RsrServiceReference
sid: aServiceID

	sid := aServiceID
%

! Class implementation for 'RsrRegistryEntry'

!		Class methods for 'RsrRegistryEntry'

category: 'instance creation'
classmethod: RsrRegistryEntry
service: aService
onMourn: aBlock

	| ephemeron |
	ephemeron := RsrServiceEphemeron
		service: aService
		action: aBlock.
	^self new
		ephemeron: ephemeron;
		yourself
%

!		Instance methods for 'RsrRegistryEntry'

category: 'transitions'
method: RsrRegistryEntry
becomeStrong

	strongStorage := self service
%

category: 'transitions'
method: RsrRegistryEntry
becomeWeak

	strongStorage := nil
%

category: 'private-accessing'
method: RsrRegistryEntry
ephemeron: aServiceEphemeron

	ephemeron := aServiceEphemeron
%

category: 'accessing'
method: RsrRegistryEntry
service

	^ephemeron service
%

! Class implementation for 'RsrRemotePromiseResolver'

!		Class methods for 'RsrRemotePromiseResolver'

category: 'instance creation'
classmethod: RsrRemotePromiseResolver
for: aSendMessage
over: aConnection

	^self new
		sendMessage: aSendMessage;
		connection: aConnection;
		yourself
%

!		Instance methods for 'RsrRemotePromiseResolver'

category: 'accessing'
method: RsrRemotePromiseResolver
addRoot: aService

	mutex critical: [extraRoots add: aService]
%

category: 'private'
method: RsrRemotePromiseResolver
assertNotResolved

	self hasResolved
		ifTrue: [RsrAlreadyResolved signal]
%

category: 'resolving'
method: RsrRemotePromiseResolver
break: aReason
	"<aReason> can be any object supported by RSR."

	self resolution: (Array with: #break with: aReason)
%

category: 'accessing'
method: RsrRemotePromiseResolver
connection

	^connection
%

category: 'accessing'
method: RsrRemotePromiseResolver
connection: aConnection

	connection := aConnection
%

category: 'resolving'
method: RsrRemotePromiseResolver
fulfill: result
	"Fulfill the remote promise with a fulfilled value of <result>"

	self resolution: (Array with: #fulfill with: result)
%

category: 'testing'
method: RsrRemotePromiseResolver
hasResolved

	^hasResolved
%

category: 'private'
method: RsrRemotePromiseResolver
initialize

	super initialize.
	extraRoots := OrderedCollection new.
	hasResolved := false.
	mutex := Semaphore forMutualExclusion
%

category: 'resolving'
method: RsrRemotePromiseResolver
resolution: result
	"Process and dispatch the result"

	mutex
		critical:
			[self hasResolved ifTrue: [^self].
			[self
				sendResult: result
				closureRoots: (Array with: result), extraRoots]
				on: self sendMessage unhandledExceptionClass
				do:
					[:ex | | answer |
					answer := Array
						with: #break
						with: (RsrRemoteException from: ex exception).
					self
						sendResult: answer
						closureRoots: answer.
					ex return].
			hasResolved := true]
%

category: 'accessing'
method: RsrRemotePromiseResolver
sendMessage

	^sendMessage
%

category: 'accessing'
method: RsrRemotePromiseResolver
sendMessage: aSendMessage

	sendMessage := aSendMessage
%

category: 'resolving'
method: RsrRemotePromiseResolver
sendResult: result
closureRoots: roots

	| analysis resultReference |
	analysis := RsrSnapshotAnalysis
		roots: roots
		connection: self connection.
	analysis perform.
	resultReference := RsrReference from: result.
	self
		sendResultReference: resultReference
		snapshots: analysis snapshots
%

category: 'resolving'
method: RsrRemotePromiseResolver
sendResultReference: resultReference
snapshots: snapshots

	| response |
	response := RsrDeliverResponse
				transaction: self sendMessage transaction
				responseReference: resultReference
				snapshots: snapshots.
	self connection _sendCommand: response
%

! Class implementation for 'RsrScientist'

!		Instance methods for 'RsrScientist'

category: 'instrumenting'
method: RsrScientist
instrument: aBlock
label: aString

	^aBlock value
%

category: 'instrumenting'
method: RsrScientist
profile: aBlock
label: aString

	^aBlock value
%

category: 'instrumenting'
method: RsrScientist
profile: aBlock
label: aString
if: aCondition

	^aBlock value
%

! Class implementation for 'RsrServiceEphemeron'

!		Class methods for 'RsrServiceEphemeron'

category: 'instance creation'
classmethod: RsrServiceEphemeron
service: aService
action: aBlock

	^self new
		service: aService;
		action: aBlock;
		beEphemeron: true;
		yourself
%

!		Instance methods for 'RsrServiceEphemeron'

category: 'accessing'
method: RsrServiceEphemeron
action

	^action
%

category: 'accessing'
method: RsrServiceEphemeron
action: aBlock

	action := aBlock
%

category: 'mourning'
method: RsrServiceEphemeron
mourn

	action value.
	service := action := nil
%

category: 'accessing'
method: RsrServiceEphemeron
service

	^service
%

category: 'accessing'
method: RsrServiceEphemeron
service: aService

	service := aService
%

! Class implementation for 'RsrServiceSnapshot'

!		Class methods for 'RsrServiceSnapshot'

category: 'instance creation'
classmethod: RsrServiceSnapshot
from: aService

	^self new
		snapshot: aService;
		yourself
%

category: 'variable utilites'
classmethod: RsrServiceSnapshot
reflectedVariableIndicesFor: aService
do: aBlock

	| allVariables |
	allVariables := aService class allInstVarNames.
	(self reflectedVariablesFor: aService)
		do:
			[:varName | | index |
			index := allVariables indexOf: varName.
			aBlock value: index]
%

category: 'variable utilites'
classmethod: RsrServiceSnapshot
reflectedVariablesFor: aService

	| currentClass variables |
	variables := OrderedCollection new.
	currentClass := aService class templateClass.
	[currentClass == RsrService]
		whileFalse:
			[currentClass instVarNames reverseDo: [:each | variables addFirst: each].
			currentClass := currentClass superclass].
	^variables
%

category: 'variable utilites'
classmethod: RsrServiceSnapshot
reflectedVariablesFor: aService
do: aBlock

	self
		reflectedVariableIndicesFor: aService
		do: [:index | aBlock value: (aService instVarAt: index)]
%

!		Instance methods for 'RsrServiceSnapshot'

category: 'accessing'
method: RsrServiceSnapshot
createInstanceRegisteredIn: aConnection

	| instance |
	instance := self shouldCreateServer
		ifTrue: [self templateClass serverClass basicNew]
		ifFalse: [self templateClass clientClass basicNew].
	aConnection
		_register: instance
		as: self sid.
	^instance
%

category: 'encoding/decoding'
method: RsrServiceSnapshot
decode: aStream
using: aDecoder

	| species instVarCount |
	species := aDecoder decodeControlWord: aStream.
	sid := aDecoder decodeControlWord: aStream.
	instVarCount := aDecoder decodeControlWord: aStream.
	targetClassName := (aDecoder decodeReference: aStream) resolve: nil.
	slots := OrderedCollection new: instVarCount.
	instVarCount timesRepeat: [slots add: (aDecoder decodeReference: aStream)]
%

category: 'encoding/decoding'
method: RsrServiceSnapshot
encode: aStream
using: anEncoder

	anEncoder
		encodeControlWord: self snapshotIdentifier
		onto: aStream.
	anEncoder
		encodeControlWord: self sid
		onto: aStream.
	anEncoder
		encodeControlWord: self slots size
		onto: aStream.
	self targetClassNameReference
		encode: aStream
		using: anEncoder.
	self slots do: [:each | each encode: aStream using: anEncoder]
%

category: 'accessing'
method: RsrServiceSnapshot
instanceIn: aConnection

	| instance |
	instance := aConnection
		serviceAt: self sid
		ifAbsent: [self createInstanceRegisteredIn: aConnection].
	self shouldCreateServer
		ifTrue: [aConnection _stronglyRetain: instance].
	^instance
%

category: 'reifying'
method: RsrServiceSnapshot
reifyIn: aConnection

	| instance referenceStream |
	"Instance should already be registered"
	instance := self instanceIn: aConnection.
	(self class reflectedVariablesFor: instance) size = slots size 
		ifFalse: [ self error: 'Incorrectly encoded instance detected' ].
	referenceStream := ReadStream on: slots.
	self class reflectedVariableIndicesFor: instance do: [ :index | 
		instance
			instVarAt: index
			put: (referenceStream next resolve: aConnection) ].
	^ instance
%

category: 'testing'
method: RsrServiceSnapshot
shouldCreateServer

	^self targetServiceType == #server
%

category: 'accessing'
method: RsrServiceSnapshot
sid

	^sid
%

category: 'accessing'
method: RsrServiceSnapshot
sid: aServiceID

	sid := aServiceID
%

category: 'accessing'
method: RsrServiceSnapshot
slots

	^slots
%

category: 'accessing'
method: RsrServiceSnapshot
slots: anArrayOfReferences

	slots := anArrayOfReferences
%

category: 'snapshotting'
method: RsrServiceSnapshot
snapshot: aService

	sid := aService _id.
	targetClassName := aService class isClientClass
		ifTrue: [aService class serverClassName]
		ifFalse: [aService class clientClassName].
	slots := OrderedCollection new.
	RsrServiceSnapshot
		reflectedVariablesFor: aService
		do: [:each | slots add: (RsrReference from: each)]
%

category: 'accessing'
method: RsrServiceSnapshot
snapshotIdentifier

	^0
%

category: 'other'
method: RsrServiceSnapshot
targetClass

	^RsrClassResolver classNamed: self targetClassName
%

category: 'other'
method: RsrServiceSnapshot
targetClassName

	^targetClassName
%

category: 'other'
method: RsrServiceSnapshot
targetClassNameReference

	^RsrSymbolReference from: self targetClassName
%

category: 'accessing'
method: RsrServiceSnapshot
targetServiceType

	^self targetClass isClientClass
		ifTrue: [#client]
		ifFalse: [#server]
%

category: 'accessing'
method: RsrServiceSnapshot
templateClass

	^self targetClass templateClass
%

! Class implementation for 'RsrSnapshotAnalysis'

!		Class methods for 'RsrSnapshotAnalysis'

category: 'instance creation'
classmethod: RsrSnapshotAnalysis
roots: anArray
connection: aConnection

	^self new
		roots: anArray;
		connection: aConnection;
		yourself
%

!		Instance methods for 'RsrSnapshotAnalysis'

category: 'analyzing'
method: RsrSnapshotAnalysis
analyze: anObject

	(analyzedObjects includes: anObject) ifTrue: [ ^ self ].
	analyzedObjects add: anObject.
	^ (self referenceClassFor: anObject) analyze: anObject using: self
%

category: 'analyzing'
method: RsrSnapshotAnalysis
analyzeCollection: aCollection

	aCollection do: [ :each | self analyze: each ].
	^ aCollection
%

category: 'analyzing'
method: RsrSnapshotAnalysis
analyzeDictionary: aDictionary

	aDictionary keysAndValuesDo: [ :key :value | 
		self
			analyze: key;
			analyze: value ].
	^ aDictionary
%

category: 'accessing'
method: RsrSnapshotAnalysis
analyzedObjects

	^ analyzedObjects
%

category: 'analyzing'
method: RsrSnapshotAnalysis
analyzeImmediate: anImmediateObject

	^anImmediateObject
%

category: 'analyzing'
method: RsrSnapshotAnalysis
analyzeService: aService

	self ensureRegistered: aService.
	RsrServiceSnapshot
		reflectedVariablesFor: aService
		do: [ :each | self analyze: each ].
	snapshots add: (RsrServiceSnapshot from: aService)
%

category: 'accessing'
method: RsrSnapshotAnalysis
connection

	^connection
%

category: 'accessing'
method: RsrSnapshotAnalysis
connection: aConnection

	connection := aConnection
%

category: 'actions'
method: RsrSnapshotAnalysis
ensureRegistered: aService

	self connection _ensureRegistered: aService.
	aService isServer
		ifTrue: [self connection _stronglyRetain: aService]
%

category: 'initialization'
method: RsrSnapshotAnalysis
initialize

	super initialize.
	snapshots := OrderedCollection new.
	analyzedObjects := IdentitySet new
%

category: 'actions'
method: RsrSnapshotAnalysis
perform

	roots do: [:each | self analyze: each]
%

category: 'accessing'
method: RsrSnapshotAnalysis
referenceClassFor: anObject

	^RsrReference referenceClassFor: anObject
%

category: 'accessing'
method: RsrSnapshotAnalysis
roots

	^roots
%

category: 'accessing'
method: RsrSnapshotAnalysis
roots: anArray

	roots := anArray
%

category: 'actions'
method: RsrSnapshotAnalysis
snapshot: aService

	snapshots add: (RsrServiceSnapshot from: aService)
%

category: 'accessing'
method: RsrSnapshotAnalysis
snapshots

	^snapshots
%

category: 'accessing'
method: RsrSnapshotAnalysis
snapshots: anOrderedCollection

	snapshots := anOrderedCollection
%

! Class implementation for 'RsrSocket'

!		Class methods for 'RsrSocket'

category: 'private-instance creation'
classmethod: RsrSocket
_nativeSocket: aGsSignalingSocket
	"Private - Create a instance backed by the provided GsSignalingSocket"

	^self basicNew
		_nativeSocket: aGsSignalingSocket;
		yourself
%

!		Instance methods for 'RsrSocket'

category: 'accepting connections'
method: RsrSocket
accept
	"Return an RsrSocket which is connected to a peer. In the event that the socket is closed while waiting, signal RsrSocketClosed."

	^[self class _nativeSocket: nativeSocket accept]
		on: SocketError
		do: [:ex | ex resignalAs: (RsrSocketError new messageText: ex messageText)]
%

category: 'accepting connections'
method: RsrSocket
bindAddress: address
port: port
	"Bind the socket to the provided port and address. Signal RsrInvalidBind in the event the bind fails."

	[nativeSocket
		bindTo: port
		toAddress: address]
			on: SocketError, OutOfRange
			do: [:ex | ex resignalAs: (RsrInvalidBind new messageText: ex messageText)]
%

category: 'terminating connections'
method: RsrSocket
close
	"Ensure closure of the Socket and cleanup any associated resources."

	nativeSocket close
%

category: 'establishing connections'
method: RsrSocket
connectToHost: hostname
port: port
	"Establish a connect to the provided host and port. If the socket is unable to establish, signal RsrConnectFailed.
	If the socket is bound to an address/port, signal RsrInvalidConnect.
	<hostname> - The name or ip address of a machine which should accept a connection.
	<port> - An integer representing a valid TCP port."

	[nativeSocket
		connectTo: port
		on: hostname]
			on: SocketError, OutOfRange
			do: [:ex | ex resignalAs: (RsrConnectFailed new messageText: ex messageText)]
%

category: 'initialize'
method: RsrSocket
initialize

	super initialize.
	nativeSocket := GsSignalingSocket new
%

category: 'testing'
method: RsrSocket
isConnected
	"Return true if the socket is open and connected with a peer. Return false otherwise."

	^nativeSocket isConnected
%

category: 'accepting connections'
method: RsrSocket
listen: backlogLength
	"Starting listening for connections. <backlogLength> specifies the number of connections to allow in a pending state.
	The actual backlog may support fewer prending connections depending upon implementation."

	nativeSocket makeListener: backlogLength
%

category: 'accessing'
method: RsrSocket
port
	"Return the port associated with the socket."

	^nativeSocket port
%

category: 'read/write'
method: RsrSocket
read: count
into: bytes
startingAt: index
	"Read <count> number of bytes into <bytes> and place the first byte into slot <index>.
	<bytes> is assumed to be at least <count + index> bytes in size.
	Return the number of bytes successfully read. Signal RsrSocketClosed if the socket is closed before or during the call."

	| numRead |
	[numRead := nativeSocket
		read: count
		into: bytes
		startingAt: index]
			on: SocketError
			do: [:ex | ex resignalAs: (RsrSocketClosed new messageText: ex messageText)].
	^numRead > 0
		ifTrue: [numRead]
		ifFalse:
			[nativeSocket close.
			RsrSocketClosed signal]
%

category: 'read/write'
method: RsrSocket
write: count
from: bytes
startingAt: index
	"Write <count> number of bytes from <bytes> with <index> as the index of the first bytes.
	If <bytes> is smaller than <index + count> the behavior is undefined.
	If the socket is not connected, signal RsrSocketClosed."

	^[nativeSocket
		write: count
		from: bytes
		startingAt: index]
			on: SocketError
			do: [:ex | ex resignalAs: (RsrSocketClosed new messageText: ex messageText)]
%

category: 'private-accessing'
method: RsrSocket
_nativeSocket: aGsSignalingSocket
	"Private - Configure w/ a platform socket"

	nativeSocket := aGsSignalingSocket
%

! Class implementation for 'RsrStream'

!		Instance methods for 'RsrStream'

category: 'testing'
method: RsrStream
atEnd
	"Answers when the Stream cannot take or provide any additional bytes."

	^self subclassResponsibility
%

category: 'closing'
method: RsrStream
close
	"Close the Stream. The semantics of this are defined by the subclass."

	self subclassResponsibility
%

category: 'writing'
method: RsrStream
flush
	"Ensure any data cached by the receiver is pushed to its destination."
	"By default, do nothing."
%

category: 'reading'
method: RsrStream
next
	"Read and return exactly 1 byte."

	^self next: 1
%

category: 'reading'
method: RsrStream
next: count
	"Read and return exactly <count> bytes"

	^self subclassResponsibility
%

category: 'writing'
method: RsrStream
nextPutAll: aByteArray
	"Write <aByteArray>'s elements to the backing store."

	^self subclassResponsibility
%

! Class implementation for 'RsrSocketStream'

!		Class methods for 'RsrSocketStream'

category: 'instance creation'
classmethod: RsrSocketStream
on: anRsrSocket

	^self new
		socket: anRsrSocket;
		yourself
%

!		Instance methods for 'RsrSocketStream'

category: 'testing'
method: RsrSocketStream
atEnd
	"Return whether additional bytes could become available on the socket."

	^socket isConnected not
%

category: 'accessing'
method: RsrSocketStream
chunkSize
	"The largest size that should be read from or written to a Socket in each attempt."

	^4096
%

category: 'closing'
method: RsrSocketStream
close

	socket close
%

category: 'accessing'
method: RsrSocketStream
next
	"Return the next byte"

	^self next: 1
%

category: 'accessing'
method: RsrSocketStream
next: count
	"Return exactly <count> number of bytes.
	Signal RsrSocketClosed if the socket closes."

	| chunkSize bytes position numRead |
	chunkSize := self chunkSize.
	bytes := ByteArray new: count.
	position := 1.
	[position <= count]
		whileTrue:
			[numRead := socket
				read: (chunkSize min: count - position + 1)
				into: bytes
				startingAt: position.
			position := position + numRead].
	^bytes
%

category: 'adding'
method: RsrSocketStream
nextPutAll: bytes
	"Write <bytes> to the socket."

	| chunkSize position numBytes numWritten |
	chunkSize := self chunkSize.
	position := 1.
	numBytes := bytes size.
	[position <= numBytes]
		whileTrue:
			[numWritten := socket
				write: (chunkSize min: numBytes - position + 1)
				from: bytes
				startingAt: position.
			position := position + numWritten]
%

category: 'accessing'
method: RsrSocketStream
socket: anRsrSocket

	socket := anRsrSocket
%

! Class implementation for 'RsrStreamChannelLoop'

!		Class methods for 'RsrStreamChannelLoop'

category: 'instance creation'
classmethod: RsrStreamChannelLoop
on: aChannel

	^self new
		channel: aChannel;
		yourself
%

!		Instance methods for 'RsrStreamChannelLoop'

category: 'accessing'
method: RsrStreamChannelLoop
channel

	^channel
%

category: 'accessing'
method: RsrStreamChannelLoop
channel: aChannel

	channel := aChannel
%

category: 'running'
method: RsrStreamChannelLoop
executeCycle

	self subclassResponsibility
%

category: 'initialization'
method: RsrStreamChannelLoop
initialize

	super initialize.
	state := self stoppedState
%

category: 'testing'
method: RsrStreamChannelLoop
isActive

	^state == self runningState
%

category: 'testing'
method: RsrStreamChannelLoop
isProcessActive

	^process ~~ nil
%

category: 'running'
method: RsrStreamChannelLoop
log

	^RsrLogWithPrefix
		prefix: self class name asString
		log: self channel log
%

category: 'running'
method: RsrStreamChannelLoop
log: aString

	self log debug: aString
%

category: 'running'
method: RsrStreamChannelLoop
report: aCommand

	aCommand reportOn: self log
%

category: 'running'
method: RsrStreamChannelLoop
reportException: anException

	self log: anException description
%

category: 'running'
method: RsrStreamChannelLoop
runLoop

	[self isActive]
		whileTrue:
			[[self executeCycle]
				on: Error
				do:
					[:ex |
					self reportException: ex.
					self channel genericError: ex]]
%

category: 'accessing'
method: RsrStreamChannelLoop
runLoopName
	"Return the name of the associated run loop.
	This name is assigned to the Process used to execute the run loop."

	^self subclassResponsibility
%

category: 'accessing'
method: RsrStreamChannelLoop
runningState

	^#Running
%

category: 'commands'
method: RsrStreamChannelLoop
start

	state := self runningState.
	process := RsrProcessModel
		fork:
			[RsrProcessModel configureCommunicationsProcess.
			self runLoop.
			process := nil]
		named: self runLoopName
%

category: 'commands'
method: RsrStreamChannelLoop
stop

	self isActive ifFalse: [^self].
	state := self stoppedState
%

category: 'accessing'
method: RsrStreamChannelLoop
stoppedState

	^#Stop
%

! Class implementation for 'RsrCommandSink'

!		Instance methods for 'RsrCommandSink'

category: 'accessing'
method: RsrCommandSink
encoder

	^RsrCommandEncoder new
%

category: 'commands'
method: RsrCommandSink
enqueue: aCommand

	self isActive ifTrue: [queue nextPut: aCommand]
%

category: 'commands'
method: RsrCommandSink
executeCycle

	[| command |
	command := queue next.
	command == self stopToken
		ifTrue: [^self].
	self writeCommand: command.
	(queue size = 0) "Dolphin does not support #isEmpty"
		ifTrue: [self flush]]
		on: RsrSocketClosed
		do:
			[:ex |
			self reportException: ex.
			self channel channelDisconnected]
%

category: 'commands'
method: RsrCommandSink
flush

	self outStream flush
%

category: 'initialization'
method: RsrCommandSink
initialize

	super initialize.
	queue := SharedQueue new
%

category: 'accessing'
method: RsrCommandSink
outStream

	^self channel outStream
%

category: 'accessing'
method: RsrCommandSink
runLoopName

	^'Connection Writing'
%

category: 'commands'
method: RsrCommandSink
stop

	super stop.
	queue nextPut: self stopToken
%

category: 'accessing'
method: RsrCommandSink
stopToken

	^self stoppedState
%

category: 'writing'
method: RsrCommandSink
write: aByteArray

	self outStream nextPutAll: aByteArray
%

category: 'writing'
method: RsrCommandSink
writeCommand: aCommand

	self report: aCommand.
	aCommand
		encode: self outStream
		using: self encoder
%

! Class implementation for 'RsrCommandSource'

!		Instance methods for 'RsrCommandSource'

category: 'accessing'
method: RsrCommandSource
decoder

	^RsrCommandDecoder new
%

category: 'commands'
method: RsrCommandSource
executeCycle

	[| command |
	command := self nextCommand.
	self report: command.
	self channel received: command]
		on: RsrSocketClosed
		do:
			[:ex |
			self reportException: ex.
			self channel channelDisconnected]
%

category: 'accessing'
method: RsrCommandSource
inStream
	"Return the read stream associated w/ this channel."

	^self channel inStream
%

category: 'commands'
method: RsrCommandSource
nextCommand

	^self decoder decodeCommand: self inStream
%

category: 'accessing'
method: RsrCommandSource
runLoopName

	^'Connection Reading'
%

! Class implementation for 'RsrThreadSafeDictionary'

!		Instance methods for 'RsrThreadSafeDictionary'

category: 'accessing'
method: RsrThreadSafeDictionary
at: aKey
ifAbsent: aBlock

	| isPresent result |
	isPresent := true.
	result := mutex critical: [map at: aKey ifAbsent: [isPresent := false]].
	^isPresent
		ifTrue: [result]
		ifFalse: [aBlock value]
%

category: 'accessing'
method: RsrThreadSafeDictionary
at: aKey
put: aValue

	mutex critical: [map at: aKey put: aValue].
	^aValue
%

category: 'enumerating'
method: RsrThreadSafeDictionary
do: aBlock

	| values |
	values := mutex critical: [map values].
	values do: aBlock
%

category: 'initialization'
method: RsrThreadSafeDictionary
initialize

	super initialize.
	mutex := Semaphore forMutualExclusion.
	map := Dictionary new
%

category: 'removing'
method: RsrThreadSafeDictionary
removeKey: anRsrId

	^mutex critical: [map removeKey: anRsrId ifAbsent: [nil]]
%

category: 'removing'
method: RsrThreadSafeDictionary
removeKey: anRsrId
ifAbsent: aBlock

	| element wasRemoved |
	wasRemoved := true.
	element := mutex critical: [map removeKey: anRsrId ifAbsent: [wasRemoved := false]].
	^wasRemoved
		ifTrue: [element]
		ifFalse: [aBlock value]
%

! Class implementation for 'RsrTokenExchangeMessage'

!		Instance methods for 'RsrTokenExchangeMessage'

category: 'comparing'
method: RsrTokenExchangeMessage
= aTokenExchangeMessage

	^self class == aTokenExchangeMessage class
%

category: 'hashing'
method: RsrTokenExchangeMessage
hash

	^self class hash
%

! Class implementation for 'RsrToken'

!		Class methods for 'RsrToken'

category: 'instance creation'
classmethod: RsrToken
bytes: aByteArray

	^self new
		bytes: aByteArray;
		yourself
%

!		Instance methods for 'RsrToken'

category: 'comparing'
method: RsrToken
= aToken

	^self class == aToken class and: [self bytes = aToken bytes]
%

category: 'accessing'
method: RsrToken
bytes

	^bytes
%

category: 'accessing'
method: RsrToken
bytes: aByteArray

	bytes := aByteArray
%

category: 'hashing'
method: RsrToken
hash

	^self bytes hash
%

! Class implementation for 'RsrTokenAccepted'

!		Instance methods for 'RsrTokenAccepted'

category: 'testing'
method: RsrTokenAccepted
wasAccepted

	^true
%

! Class implementation for 'RsrTokenRejected'

!		Instance methods for 'RsrTokenRejected'

category: 'testing'
method: RsrTokenRejected
wasAccepted

	^false
%

! Class implementation for 'RsrPlatformInitializer'

!		Class methods for 'RsrPlatformInitializer'

category: 'class initialization'
classmethod: RsrPlatformInitializer
initialize

	RsrReference initializeReferenceMapping
%

! Class implementation for 'RsrProcessModel'

!		Class methods for 'RsrProcessModel'

category: 'configuring'
classmethod: RsrProcessModel
configureCommunicationsProcess
	"Apply framework configuration to the currently running communications process."

	^self current configureCommunicationsProcess
%

category: 'configuring'
classmethod: RsrProcessModel
configureFrameworkProcess
	"Apply framework configuration to the currently running process."

	^self current configureFrameworkProcess
%

category: 'configuring'
classmethod: RsrProcessModel
configureUnhandleExceptionProtection
	"Configure the process to ensure we are able to trap any unhandled exceptions."

	^self current configureUnhandleExceptionProtection
%

category: 'managing-concurrency'
classmethod: RsrProcessModel
currentStackDump

	^self current currentStackDump
%

category: 'managing-concurrency'
classmethod: RsrProcessModel
fork: aBlock
at: aPriority
named: aString

	^self current
		fork: aBlock
		at: aPriority
		named: aString
%

category: 'managing-concurrency'
classmethod: RsrProcessModel
fork: aBlock
named: aString

	^self current fork: aBlock named: aString
%

category: 'managing-concurrency'
classmethod: RsrProcessModel
renameProcess: aString
	"Rename the current process to the provided string"

	^self current renameProcess: aString
%

!		Instance methods for 'RsrProcessModel'

category: 'configuring'
method: RsrProcessModel
communicationsSchedulePriority
	"Returns the priority level used by communications processes."

	^Processor highIOPriority
%

category: 'configuring'
method: RsrProcessModel
configureCommunicationsProcess
	"Apply framework configuration to the currently running communications process."

	Processor activeProcess
		priority: self communicationsSchedulePriority
%

category: 'configuring'
method: RsrProcessModel
configureFrameworkProcess
	"Apply framework configuration to the currently running process."

	Processor activeProcess
		priority: self frameworkSchedulingPriority
%

category: 'managing-concurrency'
method: RsrProcessModel
fork: aBlock
at: aPriority
named: aString

	^[self renameProcess: aString.
	aBlock value] forkAt: aPriority
%

category: 'managing-concurrency'
method: RsrProcessModel
fork: aBlock
named: aString

	^[self renameProcess: aString.
	aBlock value] fork
%

category: 'configuring'
method: RsrProcessModel
frameworkSchedulingPriority
	"Returns the priority level used by normal framework processes."

	^Processor userInterruptPriority
%

category: 'renaming'
method: RsrProcessModel
renameProcess: aString

	Processor activeProcess name: aString
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
announcement
	^announcement
%

category: 'accessing'
method: SpkEvaluatorAction
announcement: object
	announcement := object
%

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
	^ target evaluateCodeAnnouncing: announcement
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

! Class implementation for 'SpkProcessFrameInfo'

!		Class methods for 'SpkProcessFrameInfo'

category: 'instance creation'
classmethod: SpkProcessFrameInfo
forProcess: aProcess level: aLevel
	^ self new initializeForProcess: aProcess level: aLevel
%

!		Instance methods for 'SpkProcessFrameInfo'

category: 'accessing'
method: SpkProcessFrameInfo
argAndTempNames
	^ frameContents at: 9
%

category: 'accessing'
method: SpkProcessFrameInfo
argAndTempValues
	^ frameContents copyFrom: 11 to: frameContents size
%

category: 'accessing'
method: SpkProcessFrameInfo
description
	^ description ifNil: [ 'Frame not yet initialized' ]
%

category: 'initialization'
method: SpkProcessFrameInfo
initializeDescription
	| method |
	method := self method.
	method == nil
		ifTrue: [ ^ description := '<no method>' ].
	description := method _descrForStackPadTo: 0 rcvr: self receiver.
	^ description
%

category: 'initialization'
method: SpkProcessFrameInfo
initializeForProcess: aProcess level: aLevel
	level := aLevel.
	isNativeStack := aProcess _nativeStack.
	calleeIsAsync := aProcess _calleeIsAsync: level.
	(frameContents := aProcess _frameContentsAt: level)
		ifNil: [ 
			self
				error: 'Internal error -- nil frame contents for frame ' , level printString ].
	self initializeDescription
%

category: 'private'
method: SpkProcessFrameInfo
isBinaryCharacter: aCharacter

	^ '+-\*~<>=|/&@%,?!' includes: aCharacter
%

category: 'private'
method: SpkProcessFrameInfo
isDecimalDigitCharacter: aCharacter

	^ '0123456789' includes: aCharacter
%

category: 'private'
method: SpkProcessFrameInfo
isKeywordCharacter: aCharacter
	^ (aCharacter = $: or: [ self isKeywordStartCharacter: aCharacter ])
		or: [ self isDecimalDigitCharacter: aCharacter ]
%

category: 'private'
method: SpkProcessFrameInfo
isKeywordStartCharacter: aCharacter

	^ '_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz' includes: aCharacter
%

category: 'private'
method: SpkProcessFrameInfo
lastBinaryCharacterIn: source startingAt: startPos
	"If source at: startPos is not a binary character, startPos - 1 will be returned"

	startPos to: source size do: [ :testPos | 
		(self isBinaryCharacter: (source at: testPos))
			ifFalse: [ ^ testPos - 1 ] ].
	^ source size
%

category: 'private'
method: SpkProcessFrameInfo
lastDecimalDigitCharacterIn: source startingAt: startPos
	"If source at: startPos is not a numeric character, startPos - 1 will be returned"

	startPos to: source size do: [ :testPos | 
		(self isDecimalDigitCharacter: (source at: testPos))
			ifFalse: [ ^ testPos - 1 ] ].
	^ source size
%

category: 'private'
method: SpkProcessFrameInfo
lastKeywordCharacterIn: source startingAt: startPos
	"If source at: startPos is not a keyword character, startPos - 1 will be returned"

	startPos to: source size do: [ :testPos | 
		(self isKeywordCharacter: (source at: testPos))
			ifFalse: [ ^ testPos - 1 ] ].
	"Reached the end of the method."
	^ source size
%

category: 'accessing'
method: SpkProcessFrameInfo
level
	^ level
%

category: 'accessing'
method: SpkProcessFrameInfo
method
	^ frameContents at: 1
%

category: 'accessing'
method: SpkProcessFrameInfo
receiver
	^ frameContents at: 10
%

category: 'accessing'
method: SpkProcessFrameInfo
source
	"Return the source code of the associated method.
	If there is no method, empty string."

	^self method
		ifNil: ['']
		ifNotNil: [:method | method sourceString]
%

category: 'accessing'
method: SpkProcessFrameInfo
sourceInterval
	| method stepPoint startPos startChar source |
	method := self method.
	stepPoint := self stepPoint.
	method == nil
		ifTrue: [ ^ 1 to: 0 ].
	source := self source.
	stepPoint == nil
		ifTrue: [ ^ 1 to: (1 min: source size) ].
	startPos := method _sourceOffsetsAt: stepPoint.
	startChar := source at: startPos.	"Point at the last character of the source if we are at the end of the method w/o explicit return."
	startPos > source size
		ifTrue: [ ^ source size to: source size ].	"Explicit return"
	startChar = $^
		ifTrue: [ ^ startPos to: startPos ].	"Assignment, assume = follows :"
	startChar = $:
		ifTrue: [ ^ startPos to: startPos + 1 ].	"Binary selector"
	(self isBinaryCharacter: startChar)
		ifTrue: [ ^ startPos to: (self lastBinaryCharacterIn: source startingAt: startPos) ].	"Unary or keyword selector"
	(self isKeywordStartCharacter: startChar)
		ifTrue: [ ^ startPos to: (self lastKeywordCharacterIn: source startingAt: startPos) ].	"Primitive number"
	(self isDecimalDigitCharacter: startChar)
		ifTrue: [ ^ startPos to: (self lastDecimalDigitCharacterIn: source startingAt: startPos) ].	"Should not get here, but just in case we've missed a possibility..."
	^ startPos to: startPos
%

category: 'accessing'
method: SpkProcessFrameInfo
stepPoint
	| ip method |
	method := self method.
	method ifNil: [ ^ nil ].
	ip := (frameContents at: 2) abs.
	^ method
		_stepPointForIp: ip
		level: level
		useNext: isNativeStack | calleeIsAsync
%

! Class implementation for 'SpkProcessManager'

!		Instance methods for 'SpkProcessManager'

category: 'accessing'
method: SpkProcessManager
debugAction

	^ [:ex | self debugException: ex. nil]
%

category: 'private'
method: SpkProcessManager
debugException: anException

	| processToDebug |
	processToDebug := Processor activeProcess.
	"Either the process is mine, or it was forked from mine and inherited the debug action and therefore sent me a message"
	processToDebug == process
		ifTrue: [ self debugMyProcessWithException: anException ]
		ifFalse: [ 
		self debugForeignProcess: processToDebug withException: anException ]
%

category: 'private'
method: SpkProcessManager
debugForeignProcess: processToDebug withException: anException

	"This process is not my problem, create another manager for it
	and pass the buck."

	SpkProcessManager new
		process: processToDebug;
		debugException: anException
%

category: 'accessing'
method: SpkProcessManager
debuggerDebugAction: aBlock

	"This is the debug action block that should handle any errors in the debugger process
	(which should generally not invoke the same debugger). A typical block is the one
	that RSR sets to just break the promise with the stack as the reason."

	debuggerDebugAction := aBlock
%

category: 'accessing'
method: SpkProcessManager
debuggerMustInitiate

	^ true
%

category: 'private'
method: SpkProcessManager
debuggerProcessForException: anException
	"Answer a new debugger process for a new or existing debugger,
	debugging process. Start by suspending the process."

	^ [ 
	process suspend.
	debuggerTool ifNil: [ self initializeDebuggerTool ].
	debuggerTool
		currentException: anException;
		refreshFromProcess;
		debug ] newProcess
%

category: 'private'
method: SpkProcessManager
debugMyProcessWithException: anException

	"process is the active process on empty. Set up a new higher-priority Process to debug it."

	| debuggerProcess originalPriority |
	originalPriority := process priority.
	self setDebugAction. "Debug action may not be correct the first exception for this process."
	debuggerProcess := self debuggerProcessForException: anException.

	self
		setPrioritiesOfDebugger: debuggerProcess
		relativeToDebugged: process.
	debuggerProcess
		debugActionBlock: debuggerDebugAction;
		"This resume preempts processToDebug, and the debuggerProcess takes over."
			resume.
	" If I get here, the debugger has decided to proceed my process.
	Its priority will have been changed if it was running at max priority, set it back before continuing."
	process priority: originalPriority
%

category: 'initialization'
method: SpkProcessManager
explorerTool
	self flag: 'Need to implement'.
	self
		halt:
			'Debugging forked processes with no explorer tool is not yet implemented.'
%

category: 'initialization'
method: SpkProcessManager
initializeDebuggerTool
	debuggerTool := SpkDebuggerTool new
		taskspaceTool: taskspaceTool;
		explorerTool: self explorerTool;
		process: process;
		processManager: self;
		mustInitiate: self debuggerMustInitiate;
		yourself
%

category: 'private'
method: SpkProcessManager
newTerminatedTool
	^ SpkProcessTerminatedTool forProcess: process
%

category: 'actions'
method: SpkProcessManager
proceedProcess
	"Non-evaluation process does not wait for an answer."

	self resumeProcess
%

category: 'accessing'
method: SpkProcessManager
process: anObject

	process := anObject
%

category: 'private'
method: SpkProcessManager
resumeProcess
	process _isTerminated
		ifTrue: [ ^ self newTerminatedTool ].	"

	Debug action might be right already, but simpler to always set it"
	self setDebugAction.
	process resume
%

category: 'initialization'
method: SpkProcessManager
setDebugAction

	process debugActionBlock: self debugAction
%

category: 'private'
method: SpkProcessManager
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

category: 'accessing'
method: SpkProcessManager
taskspaceTool: anObject

	taskspaceTool := anObject
%

category: 'actions'
method: SpkProcessManager
terminateProcess
	process _isTerminated
		ifTrue: [ ^ self newTerminatedTool ].
	"If the process has started terminating, don't terminate again,
	just proceed to let the unwind blocks run."
	process _terminationStarted ifTrue: [^ self resumeProcess ].
	[ process terminateTimeoutMs: SmallInteger maximumValue ]
		forkAt: (process priority - 1 max: 1)
%

! Class implementation for 'SpkProcessLauncherAndManager'

!		Instance methods for 'SpkProcessLauncherAndManager'

category: 'accessing'
method: SpkProcessLauncherAndManager
debuggerMustInitiate

	^ false
%

category: 'accessing'
method: SpkProcessLauncherAndManager
explorerTool

	^explorerTool
%

category: 'accessing'
method: SpkProcessLauncherAndManager
explorerTool: anExplorerTool

	explorerTool := anExplorerTool
%

category: 'initialization'
method: SpkProcessLauncherAndManager
initialize
	super initialize.
	resultReady := Semaphore new
%

category: 'actions'
method: SpkProcessLauncherAndManager
proceedProcess
	"Evaluation process waits for an answer and returns it"

	super proceedProcess.
	^ self waitForResult
%

category: 'accessing'
method: SpkProcessLauncherAndManager
processBody: aBlock
	process := [ self returnValue: aBlock value ] newProcess
%

category: 'accessing'
method: SpkProcessLauncherAndManager
processBreakpointLevel: anObject

	processBreakpointLevel := anObject
%

category: 'accessing'
method: SpkProcessLauncherAndManager
processName: object
	processName := object
%

category: 'accessing'
method: SpkProcessLauncherAndManager
processPriority: aPriority

	processPriority := aPriority
%

category: 'actions'
method: SpkProcessLauncherAndManager
returnValue: anObject
	result := anObject.
	resultReady signal
%

category: 'actions'
method: SpkProcessLauncherAndManager
runProcess

	process
		name: processName;
		priority: processPriority;
		breakpointLevel: processBreakpointLevel.
	self resumeProcess
%

category: 'actions'
method: SpkProcessLauncherAndManager
terminateProcess
	"Evaluation process waits for termination to be complete and returns the tool.
	processBody must send me #returnValue: on completion of termination or this will hang."

	super terminateProcess.
	^ self waitForResult
%

category: 'actions'
method: SpkProcessLauncherAndManager
waitForResult
	"Result may be a debugger"

	resultReady wait.
	^ result
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

	^ announcer 
%

category: 'initialization'
method: SpkTool
initialize

	super initialize.
	announcer := Announcer new
%

category: 'accessing'
method: SpkTool
taskspaceTool

	^ taskspaceTool
%

category: 'accessing'
method: SpkTool
taskspaceTool: anObject

	taskspaceTool := anObject
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
	taskspaceTool := anExplorerTool taskspaceTool.
	panes := anExplorerTool panes.
	coordinateInterval := 1.0 / (panes size + 1).	"Distance between coordinates"
	thisCoord := 0.0.
	panes
		do: [ :pane | 
			| paneLayout |
			thisCoord := thisCoord + coordinateInterval.
			paneLayout := SpkPaneLayoutTool new
				taskspaceTool: taskspaceTool;
				paneTool: pane;
				relativeHeight: 1;
				paneCoordinate: {thisCoord};
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
	tool := self newInspectorFieldTool.
	aCollection add: tool.
	tool
		referencedObject: (self argAndTempValues at: anIndex);
		columnAt: 1 put: (self argAndTempNames at: anIndex);
		columnAt: 2 put: (tool selfDescriptionOf: tool referencedObject)
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
	tool := self newInspectorFieldTool.
	aCollection add: tool.
	tool
		columnAt: 1 put: 'receiver';
		columnAt: 2 put: (tool selfDescriptionOf: self receiver);
		referencedObject: self receiver
%

category: 'private'
method: SpkDebuggerFrameTool
argAndTempNames
	^ currentState argAndTempNames
%

category: 'private'
method: SpkDebuggerFrameTool
argAndTempValues
	^ currentState argAndTempValues
%

category: 'other'
method: SpkDebuggerFrameTool
beInvalid
	isValid := false.
	taskspaceTool ifNotNil: [ taskspaceTool unsubscribe: self ]
%

category: 'other'
method: SpkDebuggerFrameTool
canStep
	"In the very bottom frames of a GsProcess, stepping will get you into trouble.
	The trouble spots *seem* to be the always-present three frames:
	1. GsNMethod class >> _gsReturnToC
	2. GsProcess >> _start
	3. ExecBlock >> valueWithArguments: "

	^ index > 3
%

category: 'accessing'
method: SpkDebuggerFrameTool
currentSourceInterval

	^ currentState sourceInterval
%

category: 'accessing'
method: SpkDebuggerFrameTool
debuggerTool: object
	debuggerTool := object
%

category: 'accessing'
method: SpkDebuggerFrameTool
description
	^ currentState description
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

category: 'other'
method: SpkDebuggerFrameTool
initialize
	super initialize.
	isValid := true
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

category: 'accessing'
method: SpkDebuggerFrameTool
method
	"Can answer nil if GCI or User Action, according to GsProcess>>_reportWithFrameContents:level:"

	^ currentState method
%

category: 'post-refresh'
method: SpkDebuggerFrameTool
methodHasChanged
	"Only valid after first initialization and at least one refresh."

	^ currentState method ~~ previousState method
%

category: 'private'
method: SpkDebuggerFrameTool
newInspectorFieldTool 

	^ SpkInspectorFieldTool new
		  taskspaceTool: taskspaceTool;
		  numberOfColumns: 2;
		  yourself
%

category: 'other'
method: SpkDebuggerFrameTool
newInspectorToolOn: anObject
	^ explorerTool newInspectorToolOn: anObject
%

category: 'printing'
method: SpkDebuggerFrameTool
printOn: aStream
	currentState isNil
		ifTrue: [ ^ super printOn: aStream ].
	aStream nextPutAll: self description
%

category: 'accessing'
method: SpkDebuggerFrameTool
process: aProcess
	process := aProcess
%

category: 'other'
method: SpkDebuggerFrameTool
receiveExecutionAnnouncement: anAnnouncement
	"I should have already been updated by the time I receive this announcement."

	"isValid
		ifTrue: [" self announce: anAnnouncement "]"
%

category: 'accessing'
method: SpkDebuggerFrameTool
receiver
	^ currentState receiver
%

category: 'post-refresh'
method: SpkDebuggerFrameTool
receiverHasChanged
	"Only valid after first initialization and at least one refresh."

	^ currentState receiver ~~ previousState receiver
%

category: 'other'
method: SpkDebuggerFrameTool
refreshAtLevel: aLevel
	"Note that if the stack depth of the process has changed, aLevel
	will be different from the previous level. It's up to the sender
	to determine the correct new level."

	previousState := currentState.
	currentState := SpkProcessFrameInfo forProcess: process level: aLevel
%

category: 'accessing'
method: SpkDebuggerFrameTool
source
	"Return the source code of the associated method.
	If there is no method, empty string."

	^ currentState source
%

category: 'other'
method: SpkDebuggerFrameTool
stepIntoAnnouncing: anAnnouncement
	| level |
	level := currentState level.
	process _isTerminated
		ifFalse: [ process stepIntoFromLevel: level ].
	"Resume is required whether process is terminated or not."
	^ debuggerTool resumeAnnouncing: anAnnouncement
%

category: 'other'
method: SpkDebuggerFrameTool
stepOverAnnouncing: anAnnouncement
	^ self canStep
		ifTrue: [ 
			| level |
			level := currentState level.
			process _isTerminated
				ifFalse: [ process stepOverFromLevel: level ].
			"Resume is required whether process is terminated or not."
			debuggerTool resumeAnnouncing: anAnnouncement ]
		ifFalse: [ debuggerTool proceedAnnouncing: anAnnouncement ]
%

category: 'accessing'
method: SpkDebuggerFrameTool
stepPoint
	^ currentState stepPoint
%

category: 'post-refresh'
method: SpkDebuggerFrameTool
stepPointHasChanged
	"Only valid after first initialization and at least one refresh."

	^ currentState stepPoint ~~ previousState stepPoint
%

category: 'other'
method: SpkDebuggerFrameTool
stepThroughAnnouncing: anAnnouncement
	| level |
	level := currentState level.
	process _isTerminated
		ifFalse: [ process stepThroughFromLevel: level ].
	"Resume is required whether process is terminated or not."
	^ debuggerTool resumeAnnouncing: anAnnouncement
%

category: 'other'
method: SpkDebuggerFrameTool
taskspaceTool: aTool

	super taskspaceTool: aTool.
	taskspaceTool
		when: SpkExecutionAnnouncement
		send: #receiveExecutionAnnouncement: 
		to: self
%

! Class implementation for 'SpkDebuggerTool'

!		Instance methods for 'SpkDebuggerTool'

category: 'accessing'
method: SpkDebuggerTool
currentException: anException
	"Stepping does not update the exceptionOfRecord, but
	must update currentException so that glue frame discarding will be accurate."

	currentException := anException.	
	"Proceed and terminate set to nil, so we will re-initialize."
	exceptionOfRecord ifNil: [ exceptionOfRecord := anException ]
%

category: 'private'
method: SpkDebuggerTool
debug
	mustInitiate
		ifFalse: [ processManager returnValue: self ]
		ifTrue: [ self error: 'Debugging forked processes not yet fully implemented.' ]
%

category: 'other'
method: SpkDebuggerTool
discardGlueFrames
	"At the end of frames (top frames of the stack) are some frameTools that
	are internal and not desirable for interaction in a debugger.
	Identify those and reduce the size of frames to discard them."

	| exceptionClass |
	exceptionClass := currentException class.
	exceptionClass == Breakpoint
		ifTrue: [ ^ self discardGlueFramesForBreakpoint ].
	exceptionClass == Halt
		ifTrue: [ ^ self discardGlueFramesForHalt ].
	self discardGlueFramesForGenericException
%

category: 'other'
method: SpkDebuggerTool
discardGlueFramesForBreakpoint
	| indexOfFirstDiscardedFrame |
	indexOfFirstDiscardedFrame := self
		indexOfFrameInLast: 20
		suchThat: [ :frame | 
			frame receiver == currentException
				and: [ frame method selector == #'_signalAsync' ] ].
	indexOfFirstDiscardedFrame
		ifNotNil: [ frames size: indexOfFirstDiscardedFrame - 1 ]
		ifNil: [ self discardGlueFramesForGenericException ]
%

category: 'other'
method: SpkDebuggerTool
discardGlueFramesForGenericException
	"Search for, in order of preference, this exception being sent #signal, being sent #_signalToDebugger,
	and if still not found, fall back to the process manager debugAction block. If *still* not found,
	this process is not under management and will not have any frames discarded."

	| indexOfFirstDiscardedFrame |
	indexOfFirstDiscardedFrame := self
		indexOfFrameInLast: 20
		suchThat: [ :frame | frame receiver == currentException and: [ frame method selector == #'signal' ] ].

	indexOfFirstDiscardedFrame
		ifNil: [ 
			indexOfFirstDiscardedFrame := self
				indexOfFrameInLast: 20
				suchThat: [ :frame | 
					frame receiver == currentException
						and: [ frame method selector == #'_signalToDebugger' ] ] ].

	indexOfFirstDiscardedFrame
		ifNil: [ 
			indexOfFirstDiscardedFrame := self
				indexOfFrameInLast: 20
				suchThat: [ :frame | 
					| homeMethod |
					homeMethod := frame method homeMethod.
					frame method ~~ homeMethod
						and: [ 
							homeMethod inClass == SpkProcessManager
								and: [ homeMethod selector == #'debugAction' ] ] ] ].

	indexOfFirstDiscardedFrame
		ifNotNil: [ frames size: indexOfFirstDiscardedFrame - 1 ]
%

category: 'other'
method: SpkDebuggerTool
discardGlueFramesForHalt
	| indexOfFirstDiscardedFrame |
	indexOfFirstDiscardedFrame := self
		indexOfFrameInLast: 20
		suchThat: [ :frame | 
			| method |
			method := frame method.
			method inClass == Object
				and: [ method selector == #'halt' or: [ method selector == #'pause' ] ] ].
	indexOfFirstDiscardedFrame
		ifNotNil: [ frames size: indexOfFirstDiscardedFrame - 1 ]
		ifNil: [ self discardGlueFramesForGenericException ]
%

category: 'accessing'
method: SpkDebuggerTool
exceptionDescription
	| string |
	string := String new.
	exceptionOfRecord
		ifNil: [ string add: 'Unknown' ]
		ifNotNil: [ 
			string
				add: exceptionOfRecord class name;
				add: self exceptionSpecificMessage ].
	^ string
%

category: 'private'
method: SpkDebuggerTool
exceptionSpecificMessage
	| fullMessage commaIndex latterPart |
	fullMessage := exceptionOfRecord buildMessageText.
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
	explorerTool := object.
	explorerTool addPane: self
%

category: 'accessing'
method: SpkDebuggerTool
frameAt: anInteger
	^ self frames at: anInteger
%

category: 'accessing'
method: SpkDebuggerTool
frames
	^ frames
%

category: 'other'
method: SpkDebuggerTool
indexOfFrameInLast: limit suchThat: aBlock
	"Search up to limit frames, starting at the end of my frames,
	and answer the index of the first to satisfy aBlock, or nil if none."

	frames size to: frames size - limit + 1 by: -1 do: [ :index | 
		| frame |
		frame := frames at: index.
		(aBlock value: frame)
			ifTrue: [ ^ index ] ].
	^ nil
%

category: 'initialization'
method: SpkDebuggerTool
initialize
	super initialize.
	frames := #().
	replacementTool := self
%

category: 'other'
method: SpkDebuggerTool
invalidateFramesAfter: numberOfValidFrames
	"Some existing frames (the bottom of the stack) are still valid.
	Let the frame tools that are no longer on the stack know they are 
	no longer valid."

	numberOfValidFrames + 1 to: frames size do: [ :index | (frames at: index) beInvalid ]
%

category: 'other'
method: SpkDebuggerTool
isValid
	^ self == replacementTool
		ifFalse: [ false ]
		ifTrue: [ 
			process _isTerminated
				ifFalse: [ true ]
				ifTrue: [ 
					replacementTool := SpkProcessTerminatedTool forProcess: process.
					false ] ]
%

category: 'accessing'
method: SpkDebuggerTool
mustInitiate: object
	mustInitiate := object
%

category: 'accessing'
method: SpkDebuggerTool
newDebuggerFrameTool
	"Create and initialize a new DebuggerFrameTool instance."

	^SpkDebuggerFrameTool new
		taskspaceTool: taskspaceTool;
		explorerTool: explorerTool;
		debuggerTool: self;
		process: process;
		yourself
%

category: 'actions'
method: SpkDebuggerTool
proceed
	"May wait for an answer, depending on whether the process is an evaluation process"
	self flag: 'Now used only by tests, which should be updated.'.
	^ self proceedAnnouncing: SpkExecutionAnnouncement new.
%

category: 'actions'
method: SpkDebuggerTool
proceedAnnouncing: anAnnouncement
	"May wait for an answer, depending on whether the process is an evaluation process.
	Announce the announcement when done."

	exceptionOfRecord := nil.	"If we hit another exception, we want the exception to be updated."
	^ self resumeAnnouncing: anAnnouncement
%

category: 'accessing'
method: SpkDebuggerTool
process

	^ process
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
processManager: object
	processManager := object
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

category: 'other'
method: SpkDebuggerTool
receiveExecutionAnnouncement: anAnnouncement
	"Execution has happened; if we are still debugging update my
	own state then let others (like my service) know."

	self isValid
		ifTrue: [ self refreshFromProcess ].
	self announce: anAnnouncement
%

category: 'initialization'
method: SpkDebuggerTool
refreshExistingFrames
	"Update any frames at the bottom of the stack that still
	represent the same frame. Answerthe number of frames
	that are still valid.
	For a new debugger, frames size is 0."

	| numberOfValidFrames newStackDepth |
	numberOfValidFrames := 0.
	newStackDepth := process stackDepth.
	1 to: (frames size min: newStackDepth) do: [ :index | 
		| level frame |
		level := newStackDepth - index + 1.
		frame := frames at: index.
		frame refreshAtLevel: level.
		(frame methodHasChanged or: [ frame receiverHasChanged ])
			ifTrue: [ ^ numberOfValidFrames ].
		numberOfValidFrames := numberOfValidFrames + 1.
		frame stepPointHasChanged
			ifTrue: [ ^ numberOfValidFrames ] ].
	^ numberOfValidFrames
%

category: 'initialization'
method: SpkDebuggerTool
refreshFromProcess
	"Keep the FrameTools for any still-valid bottom portion of the stack.
	The service layer uses identity of frame tools to determine what needs refreshing."

	| numberOfValidFrames newStackDepth newFrames |
	numberOfValidFrames := self refreshExistingFrames.
	self invalidateFramesAfter: numberOfValidFrames.
	newStackDepth := process stackDepth.
	newFrames := OrderedCollection new: newStackDepth.
	newFrames
		replaceFrom: 1
		to: numberOfValidFrames
		with: frames
		startingAt: 1.
	numberOfValidFrames + 1 to: newStackDepth do: [ :index | 
		| frame level |
		level := newStackDepth - index + 1.
		frame := self newDebuggerFrameTool.
		frame
			index: index;
			refreshAtLevel: level.
		newFrames at: index put: frame ].
	frames := newFrames.
	self discardGlueFrames.
	^ frames
%

category: 'actions'
method: SpkDebuggerTool
replacementTool
	^ replacementTool
%

category: 'actions'
method: SpkDebuggerTool
resumeAnnouncing: anAnnouncement
	"Resume the process, then make the announcement"

	"Used for both stepping and proceed."

	replacementTool := processManager proceedProcess.
	taskspaceTool announce: anAnnouncement.
	self flag: 'Return value only used only by tests, which should be updated.'.
	^ replacementTool
%

category: 'other'
method: SpkDebuggerTool
taskspaceTool: aTool
	super taskspaceTool: aTool.
	taskspaceTool
		when: SpkExecutionAnnouncement
		send: #'receiveExecutionAnnouncement:'
		to: self
%

category: 'actions'
method: SpkDebuggerTool
terminateAnnouncing: anAnnouncement
	"May wait for an answer, depending on whether the process is an evaluation process"

	exceptionOfRecord := nil.	"If we hit another exception, we want the exception to be updated."
	replacementTool := processManager terminateProcess.
	taskspaceTool announce: anAnnouncement.
	^ replacementTool
%

! Class implementation for 'SpkEvaluatorTool'

!		Instance methods for 'SpkEvaluatorTool'

category: 'public'
method: SpkEvaluatorTool
acceptAnnouncing: anAnnouncement
	"Evaluate newSourceCode through an undoable action. Answer a new Tool for the result."

	| action resultTool |
	action := SpkEvaluatorAcceptAction new
		target: self;
		oldSourceCode: oldSourceCode;
		newSourceCode: newSourceCode;
		announcement: anAnnouncement;
		yourself.
	resultTool := explorerTool performAction: action.
	^ resultTool
%

category: 'accessing'
method: SpkEvaluatorTool
evaluateCode
	self flag: 'Now used only by tests, which should be updated.'.
	^ self evaluateCodeAnnouncing: SpkExecutionAnnouncement new
%

category: 'accessing'
method: SpkEvaluatorTool
evaluateCodeAnnouncing: anAnnouncement
	"Evaluate the newSource and answer an appropriate tool for 
	whatever happens. This can be a syntax error, a runtime error, or an object.
	For an object, answer an InspectorTool on the object."

	| context method resultTool |
	context := inspectorTool inspectedObject.

	[ method := self compileNewSourceCodeInContext: context ]
		on: self compilationExceptionClass
		do: [ :ex | ^ self toolForCompilationError: ex ].

	resultTool := self evaluateMethod: method inContext: context.

	taskspaceTool announce: anAnnouncement.
	^ resultTool
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
	updatedServices := Set new.
	newSourceCode := oldSourceCode := ''
%

category: 'accessing'
method: SpkEvaluatorTool
inspectorTool: anObject

	inspectorTool := anObject
%

category: 'accessing'
method: SpkEvaluatorTool
newProcessLauncherAndManager

	^ SpkProcessLauncherAndManager new
		  taskspaceTool: taskspaceTool;
		  debuggerDebugAction: Processor activeProcess debugActionBlock;
		  processName: 'Evaluation';
		  processPriority: self evaluationPriority;
		  processBreakpointLevel: 1;
		  explorerTool: explorerTool;
		  yourself
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

	^ (SpkCompilationErrorTool forException: aCompilationException)
		  taskspaceTool: taskspaceTool;
		  yourself
%

category: 'other'
method: SpkEvaluatorTool
updatedServices
	^ updatedServices
%

! Class implementation for 'SpkExplorerLayoutTool'

!		Class methods for 'SpkExplorerLayoutTool'

category: 'other'
classmethod: SpkExplorerLayoutTool
defaultInTaskspace: aTaskspaceTool
	^ (self newInTaskspace: aTaskspaceTool)
		initializeForDefault;
		yourself
%

category: 'other'
classmethod: SpkExplorerLayoutTool
newInTaskspace: aTaskspaceTool
	^ self new
		taskspaceTool: aTaskspaceTool;
		yourself
%

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
initializeForDefault
	explorerTool := SpkExplorerTool defaultInTaskspace: taskspaceTool.
	self initializeForTool: explorerTool
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

category: 'other'
method: SpkInspectionTool
selfDescriptionOf: anObject

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
		to: anObject
		ifNotUnderstood: [  ].
	^ stream contents
%

! Class implementation for 'SpkInspectorFieldTool'

!		Instance methods for 'SpkInspectorFieldTool'

category: 'accessing'
method: SpkInspectorFieldTool
columnAt: anInteger

	^ columns at: anInteger
%

category: 'accessing'
method: SpkInspectorFieldTool
columnAt: anInteger put: aString

	columns at: anInteger put: aString
%

category: 'accessing'
method: SpkInspectorFieldTool
numberOfColumns

	^ columns size
%

category: 'accessing'
method: SpkInspectorFieldTool
numberOfColumns: anInteger

	columns := Array new: anInteger
%

category: 'accessing'
method: SpkInspectorFieldTool
referencedObject

	^ referencedObject
%

category: 'accessing'
method: SpkInspectorFieldTool
referencedObject: anObject

	referencedObject := anObject
%

! Class implementation for 'SpkInspectorTool'

!		Instance methods for 'SpkInspectorTool'

category: 'adding'
method: SpkInspectorTool
addEvaluator

	^ evaluatorTools add: (SpkEvaluatorTool new
			   inspectorTool: self;
			   explorerTool: explorerTool;
			   taskspaceTool: taskspaceTool;
			   yourself)
%

category: 'adding'
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

category: 'adding'
method: SpkInspectorTool
classOfInspectedObject

	"The class is guaranteed to be a Behavior, so we can send it messages that Behavior understands"

	^ SpkReflection classOf: inspectedObject
%

category: 'as yet unclassified'
method: SpkInspectorTool
defaultView

	^ views at: 'default'
%

category: 'adding'
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

	explorerTool := anObject.
	explorerTool addPane: self
%

category: 'accessing'
method: SpkInspectorTool
fieldTools

	^ currentView fieldTools
%

category: 'accessing'
method: SpkInspectorTool
initialize

	super initialize.
	evaluatorTools := OrderedCollection new.
	views := Dictionary new
%

category: 'accessing'
method: SpkInspectorTool
initializeForDefault

	self addEvaluator
%

category: 'initialization'
method: SpkInspectorTool
initializeViews

	"only raw view, for now"

	| rawView |
	rawView := SpkInspectorRawViewTool on: inspectedObject.
	rawView
		taskspaceTool: taskspaceTool;
		refreshFieldTools.
	views
		at: 'raw' put: rawView;
		at: 'default' put: rawView.
	currentView := rawView
%

category: 'accessing'
method: SpkInspectorTool
inspectedObject

	^ inspectedObject
%

category: 'accessing'
method: SpkInspectorTool
inspectedObject: anObject

	inspectedObject := anObject
%

category: 'instance creation'
method: SpkInspectorTool
newInspectorToolOn: anObject

	^ explorerTool newInspectorToolOn: anObject
%

category: 'accessing'
method: SpkInspectorTool
oop

	"In Pharo, this is the identity hash, or 0 if #identityHash is not understood."

	^ SpkReflection identifierOf: inspectedObject
%

category: 'accessing'
method: SpkInspectorTool
receiveExecutionAnnouncement: anAnnouncement

	self refreshFieldTools.
	self announce: anAnnouncement
%

category: 'accessing'
method: SpkInspectorTool
refreshFieldTools

	currentView refreshFieldTools
%

category: 'accessing'
method: SpkInspectorTool
selfDescription

	"Answer a string showing how the inspected object describes itself using printOn:.
        Objects that do not understand #printOn: will answer the empty string.
        Limit output size in case of very long or infinitely recursive implementation of #printOn:,
        but set a high limit."

	^ self selfDescriptionOf: inspectedObject
%

category: 'accessing'
method: SpkInspectorTool
taskspaceTool: aTool

	super taskspaceTool: aTool.
	taskspaceTool
		when: SpkExecutionAnnouncement
		send: #receiveExecutionAnnouncement: 
		to: self
%

! Class implementation for 'SpkInspectorViewTool'

!		Class methods for 'SpkInspectorViewTool'

category: 'instance creation'
classmethod: SpkInspectorViewTool
on: anObject

	^ self new
		  inspectedObject: anObject;
		  yourself
%

!		Instance methods for 'SpkInspectorViewTool'

category: 'private'
method: SpkInspectorViewTool
classOfInspectedObject

	"The class is guaranteed to be a Behavior, so we can send it messages that Behavior understands"

	^ SpkReflection classOf: inspectedObject
%

category: 'accessing'
method: SpkInspectorViewTool
fieldTools

	^ fieldTools
%

category: 'accessing'
method: SpkInspectorViewTool
inspectedObject: anObject

	inspectedObject := anObject
%

category: 'as yet unclassified'
method: SpkInspectorViewTool
newFieldTool

	^ SpkInspectorFieldTool new
		  taskspaceTool: taskspaceTool;
		  numberOfColumns: numberOfColumns;
		  yourself
%

category: 'as yet unclassified'
method: SpkInspectorViewTool
numberOfFields

	self subclassResponsibility
%

category: 'as yet unclassified'
method: SpkInspectorViewTool
refreshFieldToolContents

	self subclassResponsibility
%

category: 'accessing'
method: SpkInspectorViewTool
refreshFieldToolQuantity
	| numberOfFieldsInObject numberOfFieldsInView |
	numberOfFieldsInObject := self numberOfFields.
	numberOfFieldsInView := fieldTools size.
	numberOfFieldsInObject > numberOfFieldsInView
		ifTrue: [ 
			numberOfFieldsInObject - numberOfFieldsInView
				timesRepeat: [ fieldTools add: self newFieldTool ] ].
	numberOfFieldsInObject < numberOfFieldsInView
		ifTrue: [ 
			numberOfFieldsInView - numberOfFieldsInObject
				timesRepeat: [ fieldTools removeLast ] ]
%

category: 'as yet unclassified'
method: SpkInspectorViewTool
refreshFieldTools

	self
		refreshFieldToolQuantity;
		refreshFieldToolContents
%

! Class implementation for 'SpkInspectorRawViewTool'

!		Instance methods for 'SpkInspectorRawViewTool'

category: 'as yet unclassified'
method: SpkInspectorRawViewTool
indexedSize

	^ SpkReflection indexedSizeOf: inspectedObject
%

category: 'initialization'
method: SpkInspectorRawViewTool
initialize

	super initialize.
	fieldTools := OrderedCollection new.
	numberOfColumns := 2 "name and self description"
%

category: 'as yet unclassified'
method: SpkInspectorRawViewTool
instVarNames

	| class |
	class := self classOfInspectedObject.
	^ class allInstVarNames
%

category: 'as yet unclassified'
method: SpkInspectorRawViewTool
namedSize

	^ self instVarNames size
%

category: 'as yet unclassified'
method: SpkInspectorRawViewTool
numberOfFields

	^ self namedSize + self indexedSize
%

category: 'as yet unclassified'
method: SpkInspectorRawViewTool
refreshFieldToolContents

	self
		refreshNamedFieldTools;
		refreshIndexedFieldTools
%

category: 'as yet unclassified'
method: SpkInspectorRawViewTool
refreshIndexedFieldTools

	1 to: self indexedSize do: [ :index | 
		| fieldTool referencedObject |
		fieldTool := fieldTools at: index + self namedSize.

		referencedObject := SpkReflection
			                    fetchIndexedInstvarAt: index
			                    from: inspectedObject.
		(fieldTool referencedObject == referencedObject)
			ifFalse:
				[fieldTool := self newFieldTool.
				fieldTools at: index + self namedSize put: fieldTool].
		fieldTool
			referencedObject: referencedObject;
			columnAt: 1 put: index printString;
			columnAt: 2 put: (self selfDescriptionOf: referencedObject) ]
%

category: 'as yet unclassified'
method: SpkInspectorRawViewTool
refreshNamedFieldTools

	| names |
	names := self instVarNames.

	1 to: names size do: [ :index | 
		| fieldTool referencedObject |
		fieldTool := fieldTools at: index.
		referencedObject := SpkReflection
			                    fetchNamedInstvarAt: index
			                    from: inspectedObject.
		(fieldTool referencedObject == referencedObject)
			ifFalse:
				[fieldTool := self newFieldTool.
				fieldTools at: index put: fieldTool].
		fieldTool
			referencedObject: referencedObject;
			columnAt: 1 put: (names at: index);
			columnAt: 2 put: (self selfDescriptionOf: referencedObject) ]
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

! Class implementation for 'SpkProcessTerminatedTool'

!		Class methods for 'SpkProcessTerminatedTool'

category: 'other'
classmethod: SpkProcessTerminatedTool
forProcess: aGsProcess
	^ self new
		process: aGsProcess;
		yourself
%

!		Instance methods for 'SpkProcessTerminatedTool'

category: 'accessing'
method: SpkProcessTerminatedTool
process
	^process
%

category: 'accessing'
method: SpkProcessTerminatedTool
process: object
	process := object
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

category: 'other'
classmethod: SpkExplorerTool
defaultInTaskspace: aTaskspaceTool
	^ (self newInTaskspace: aTaskspaceTool)
		initializeForDefault;
		yourself
%

category: 'other'
classmethod: SpkExplorerTool
newInTaskspace: aTaskspaceTool
	^ self new
		taskspaceTool: aTaskspaceTool;
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
	panes := IdentitySet new
%

category: 'initialization'
method: SpkExplorerTool
initializeForDefault

	"A default explorer starts with an inspector pane on nil, with one evaluator"

	| inspector |
	inspector := (self newInspectorToolOn: nil)
		             initializeForDefault;
		             yourself.
	self addPane: inspector
%

category: 'instance creation'
method: SpkExplorerTool
newInspectorToolOn: anObject

	^ SpkInspectorTool new
		  explorerTool: self;
		  taskspaceTool: taskspaceTool;
		  inspectedObject: anObject;
		  initializeViews;
		  refreshFieldTools;
		  yourself
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

category: 'initialization'
method: SpkTaskspaceTool
addDefaultExplorer

	"The default initial taskspace has one default explorer."

	| explorer |
	explorer := self newExplorerTool
		            initializeForDefault;
		            yourself.

	self addExplorer: explorer.
	^ explorer
%

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

	self addDefaultExplorer
%

category: 'instance creation'
method: SpkTaskspaceTool
newExplorerTool

	^ SpkExplorerTool new
		  taskspaceTool: self;
		  yourself
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

! Class implementation for 'SpkServiceFactory'

!		Class methods for 'SpkServiceFactory'

category: 'class initialization'
classmethod: SpkServiceFactory
initialize
	self initializeServiceClassesForToolTypes
%

category: 'class initialization'
classmethod: SpkServiceFactory
initializeServiceClassesForToolTypes
	serviceClassesForToolTypes := IdentityDictionary new.
	^ serviceClassesForToolTypes
		at: SpkColumnLayoutTool put: SpkColumnLayoutServiceServer;
		at: SpkCompilationErrorTool put: SpkCompilationErrorServiceServer;
		at: SpkDebuggerTool put: SpkDebuggerServiceServer;
		at: SpkExplorerLayoutTool put: SpkExplorerLayoutServiceServer;
		at: SpkExplorerTool put: SpkExplorerServiceServer;
		at: SpkInspectorTool put: SpkInspectorServiceServer;
		at: SpkPaneLayoutTool put: SpkPaneLayoutServiceServer;
		at: SpkProcessTerminatedTool put: SpkProcessTerminatedServiceServer;
		at: SpkRuntimeErrorTool put: SpkRuntimeErrorServiceServer;
		at: SpkTaskspaceLayoutTool put: SpkTaskspaceLayoutServiceServer;
		at: SpkTaskspaceTool put: SpkTaskspaceServiceServer;
		yourself
%

category: 'accessing'
classmethod: SpkServiceFactory
serviceClassForToolClass: aToolClass

	^ serviceClassesForToolTypes
		  at: aToolClass
		  ifAbsent: [ self error: 'Unrecognized tool class ' , aToolClass name ]
%

category: 'accessing'
classmethod: SpkServiceFactory
serviceForTool: aTool
	| serviceClass |
	serviceClass := self serviceClassForToolClass: aTool class.
	^ serviceClass new
		initializeFromTool: aTool;
		yourself
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

! Class extensions for 'RsrCharacterArrayReference'

!		Class methods for 'RsrCharacterArrayReference'

category: '*remoteservicereplication-gemstone'
classmethod: RsrCharacterArrayReference
convertToBytes: aCharacterArray

	^aCharacterArray encodeAsUTF8
%

!		Instance methods for 'RsrCharacterArrayReference'

category: '*remoteservicereplication-gemstone'
method: RsrCharacterArrayReference
convertBytes: aByteArray

	^aByteArray decodeFromUTF8ToString
%

! Class extensions for 'RsrDateAndTime'

!		Class methods for 'RsrDateAndTime'

category: '*remoteservicereplication-gemstone'
classmethod: RsrDateAndTime
fromMicroseconds: anInteger

    ^DateAndTime
        posixSeconds: (anInteger / 1000000)
        offset: Duration zero
%

category: '*remoteservicereplication-gemstone'
classmethod: RsrDateAndTime
microsecondsSinceEpoch: aDateAndTime

	^((aDateAndTime asSeconds - self posixEpoch asSeconds) * 1000000) rounded
%

category: '*remoteservicereplication-gemstone'
classmethod: RsrDateAndTime
now

	^DateAndTime now
%

category: '*remoteservicereplication-gemstone'
classmethod: RsrDateAndTime
posixEpoch

	^DateAndTime
        posixSeconds: 0
        offset: Duration zero
%

! Class extensions for 'RsrDoubleReference'

!		Class methods for 'RsrDoubleReference'

category: '*remoteservicereplication-gemstone'
classmethod: RsrDoubleReference
convertToBytes: aFloat

	| bytes |
	bytes := ByteArray new: 8.
	bytes
		doubleAt: 1
		put: aFloat.
	^bytes
%

category: '*remoteservicereplication-gemstone'
classmethod: RsrDoubleReference
infinity

	^Float fromString: 'Infinity'
%

category: '*remoteservicereplication-gemstone'
classmethod: RsrDoubleReference
nan

	^Float fromString: '-NaN'
%

!		Instance methods for 'RsrDoubleReference'

category: '*remoteservicereplication-gemstone'
method: RsrDoubleReference
convertBytes: aByteArray

	^aByteArray doubleAt: 1
%

! Class extensions for 'RsrForwarder'

!		Class methods for 'RsrForwarder'

category: '*remoteservicereplication'
classmethod: RsrForwarder
on: anRsrObject

	| instance |
	instance := self new.
	instance _service: anRsrObject.
	^instance
%

!		Instance methods for 'RsrForwarder'

category: '*remoteservicereplication'
method: RsrForwarder
doesNotUnderstand: aMessage

	^_service _connection
		_sendMessage: aMessage
		to: _service
%

category: '*remoteservicereplication'
method: RsrForwarder
_service: aService

	_service := aService
%

! Class extensions for 'RsrObject'

!		Class methods for 'RsrObject'

category: '*remoteservicereplication-gemstone'
classmethod: RsrObject
new

	^super new initialize
%

!		Instance methods for 'RsrObject'

category: '*remoteservicereplication-gemstone'
method: RsrObject
initialize

	^self
%

! Class extensions for 'RsrProcessModel'

!		Class methods for 'RsrProcessModel'

category: '*remoteservicereplication-gemstone'
classmethod: RsrProcessModel
current
	^ SessionTemps current
		at: self keyForCurrent
		ifAbsent: [ self resetCurrent ]
%

category: '*remoteservicereplication-gemstone'
classmethod: RsrProcessModel
current: concurrency
	^ SessionTemps current at: self keyForCurrent put: concurrency
%

category: '*remoteservicereplication-gemstone'
classmethod: RsrProcessModel
keyForCurrent
	^ #'RsrCurrentProcessModel'
%

category: '*remoteservicereplication-gemstone'
classmethod: RsrProcessModel
resetCurrent
	^ self current: self new
%

category: '*remoteservicereplication-gemstone'
classmethod: RsrProcessModel
unhandledExceptionClass
	"Return the class which signals that an unhandled exception has been signaled."

	^RsrUnhandledException
%

!		Instance methods for 'RsrProcessModel'

category: '*remoteservicereplication-gemstone'
method: RsrProcessModel
configureUnhandleExceptionProtection

	Processor activeProcess
		breakpointLevel: 1;
		debugActionBlock:
			[:ex |
			({ClientForwarderSend. Halt. RsrUnhandledException.} includes: ex class)
				ifTrue: [ex _signalGciError]
				ifFalse: [RsrUnhandledException signal: ex]].
%

category: '*remoteservicereplication-gemstone'
method: RsrProcessModel
currentStackDump

	^GsProcess stackReportToLevel: 1000
%

! Class extensions for 'RsrReference'

!		Class methods for 'RsrReference'

category: '*remoteservicereplication-gemstone'
classmethod: RsrReference
initializeReferenceMapping
	"RsrReference initializeReferenceMapping"

	referenceMapping := Dictionary new.
	referenceMapping
		at: Symbol
		put: RsrSymbolReference.
	referenceMapping
		at: DoubleByteSymbol
		put: RsrSymbolReference.
	referenceMapping
		at: QuadByteSymbol
		put: RsrSymbolReference.
	referenceMapping
		at: String
		put: RsrStringReference.
    referenceMapping
        at: Unicode7
        put: RsrStringReference.
    referenceMapping
        at: DoubleByteString
        put: RsrStringReference.
    referenceMapping
        at: QuadByteString
        put: RsrStringReference.
	referenceMapping
		at: LargeInteger
		put: RsrIntegerReference.
	referenceMapping
		at: SmallInteger
		put: RsrIntegerReference.
	referenceMapping
		at: Character
		put: RsrCharacterReference.
	referenceMapping
		at: UndefinedObject
		put: RsrNilReference.
	referenceMapping
		at: Boolean
		put: RsrTrueReference.
	referenceMapping
		at: Array
		put: RsrArrayReference.
	referenceMapping
		at: ByteArray
		put: RsrByteArrayReference.
	referenceMapping
		at: Set
		put: RsrSetReference.
	referenceMapping
		at: OrderedCollection
		put: RsrOrderedCollectionReference.
	referenceMapping
		at: Dictionary
		put: RsrDictionaryReference.
	referenceMapping
		at: DateAndTime
		put: RsrDateAndTimeReference.
	referenceMapping
		at: SmallDateAndTime
		put: RsrDateAndTimeReference.
	referenceMapping
		at: SmallDouble
		put: RsrDoubleReference.
	referenceMapping
		at: Float
		put: RsrDoubleReference.
	^referenceMapping
%

category: '*remoteservicereplication'
classmethod: RsrReference
referenceClassFor: anObject

	(anObject isKindOf: RsrService)
		ifTrue: [^RsrServiceReference].
	^self referenceMapping
		at: anObject class
		ifAbsent: [RsrUnsupportedObject signal: anObject]
%

! Class extensions for 'RsrToken'

!		Class methods for 'RsrToken'

category: '*remoteservicereplication-gemstone'
classmethod: RsrToken
newRandom
	"Create a new Token with random bytes."

	| random bytes |
	random := HostRandom new.
	bytes := ByteArray new: 16.
	bytes unsigned32At: 1 put: random integer.
	bytes unsigned32At: 5 put: random integer.
	bytes unsigned32At: 9 put: random integer.
	bytes unsigned32At: 13 put: random integer.
	^self bytes: bytes
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
	| processBody processManager |
	processManager := self newProcessLauncherAndManager.
	processBody := [ 
	| resultObject |
	resultObject := [ method _executeInContext: context ]
		ifCurtailed: [ 
			processManager
				returnValue: (SpkProcessTerminatedTool forProcess: GsProcess current) ].
	explorerTool newInspectorToolOn: resultObject ].

	^ processManager
		processBody: processBody;
		runProcess;
		waitForResult
%

category: '*Sparkle-Tools-GemStone'
method: SpkEvaluatorTool
evaluationPriority
	^ Processor userSchedulingPriority
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
RsrPlatformInitializer initialize.
SpkExplorerServiceServer initialize.
SpkServiceFactory initialize.
true
%
