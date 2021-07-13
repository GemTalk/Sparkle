! Copyright (C) GemTalk Systems 1986-2021.  All Rights Reserved.
! Class Declarations
! Generated file, do not Edit

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
	subclass: 'BreakpointHandling'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-GemStone-Test';
		comment: 'Used by BreakpointHandlingTest';
		immediateInvariant.
true.
%

removeallmethods BreakpointHandling
removeallclassmethods BreakpointHandling

doit
(Object
	subclass: 'GsCounter'
	instVarNames: #( current )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-GemStone-Test';
		comment: 'GsCounter is a first class replacement for idioms like:
| counter |
counter := Array with: 0.
...
counter at: 1 put: (counter at: 1) + 1

GsCounter currently counts integers and increments by one. 
It can easily be expanded to include decementing, arbitrary increments/decrements as well as non-integer values.';
		immediateInvariant.
true.
%

removeallmethods GsCounter
removeallclassmethods GsCounter

doit
(Object
	subclass: 'SpkTestClassForDebugging'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-GemStone-Test';
		comment: 'Various methods for breakpointing, stepping, and the like by the debugger tool.';
		immediateInvariant.
true.
%

removeallmethods SpkTestClassForDebugging
removeallclassmethods SpkTestClassForDebugging

doit
(RsrChannel
	subclass: 'RsrNullChannel'
	instVarNames: #( lastCommand )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrNullChannel
removeallclassmethods RsrNullChannel

doit
(RsrObject
	subclass: 'RsrSignalErrorInAsString'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrSignalErrorInAsString
removeallclassmethods RsrSignalErrorInAsString

doit
(RsrObject
	subclass: 'RsrSocketPair'
	instVarNames: #( firstSocket secondSocket )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Platform-Test';
		immediateInvariant.
true.
%

removeallmethods RsrSocketPair
removeallclassmethods RsrSocketPair

doit
(RsrProcessModel
	subclass: 'RsrTestingProcessModel'
	instVarNames: #( forkedException )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Platform-Test';
		immediateInvariant.
true.
%

removeallmethods RsrTestingProcessModel
removeallclassmethods RsrTestingProcessModel

doit
(RsrService
	subclass: 'RsrConcurrentTestService'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrConcurrentTestService
removeallclassmethods RsrConcurrentTestService

doit
(RsrConcurrentTestService
	subclass: 'RsrConcurrentTestClient'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrConcurrentTestClient
removeallclassmethods RsrConcurrentTestClient

doit
(RsrConcurrentTestService
	subclass: 'RsrConcurrentTestServer'
	instVarNames: #( counter semaphore stashedProcess )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrConcurrentTestServer
removeallclassmethods RsrConcurrentTestServer

doit
(RsrService
	subclass: 'RsrInstrumentedService'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		comment: 'No class-specific documentation for RsrInstrumentedService, hierarchy is:
Object
  RsrObject
    RsrAbstractService
      RsrService( _id _connection remoteSelf)
        RsrInstrumentedService( sharedVariable preUpdateAction postUpdateAction)
';
		immediateInvariant.
true.
%

removeallmethods RsrInstrumentedService
removeallclassmethods RsrInstrumentedService

doit
(RsrInstrumentedService
	subclass: 'RsrInstrumentedClient'
	instVarNames: #( preUpdateCount postUpdateCount )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		comment: 'No class-specific documentation for RsrInstrumentedClient, hierarchy is:
Object
  RsrObject
    RsrAbstractService
      RsrService( _id _connection remoteSelf)
        RsrInstrumentedService
          RsrInstrumentedClient( preUpdateAction postUpdateAction)
';
		immediateInvariant.
true.
%

removeallmethods RsrInstrumentedClient
removeallclassmethods RsrInstrumentedClient

doit
(RsrInstrumentedService
	subclass: 'RsrInstrumentedServer'
	instVarNames: #( preUpdateCount postUpdateCount action )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		comment: 'No class-specific documentation for RsrInstrumentedServer, hierarchy is:
Object
  RsrObject
    RsrAbstractService
      RsrService( _id _connection remoteSelf)
        RsrInstrumentedService
          RsrInstrumentedServer( preUpdateAction postUpdateAction)
';
		immediateInvariant.
true.
%

removeallmethods RsrInstrumentedServer
removeallclassmethods RsrInstrumentedServer

doit
(RsrService
	subclass: 'RsrMockService'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Platform-Test';
		immediateInvariant.
true.
%

removeallmethods RsrMockService
removeallclassmethods RsrMockService

doit
(RsrMockService
	subclass: 'RsrMockClient'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Platform-Test';
		immediateInvariant.
true.
%

removeallmethods RsrMockClient
removeallclassmethods RsrMockClient

doit
(RsrMockService
	subclass: 'RsrMockServer'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Platform-Test';
		immediateInvariant.
true.
%

removeallmethods RsrMockServer
removeallclassmethods RsrMockServer

doit
(RsrService
	subclass: 'RsrReflectedVariableTestServiceA'
	instVarNames: #( varA )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrReflectedVariableTestServiceA
removeallclassmethods RsrReflectedVariableTestServiceA

doit
(RsrReflectedVariableTestServiceA
	subclass: 'RsrReflectedVariableTestServiceB'
	instVarNames: #( varB )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrReflectedVariableTestServiceB
removeallclassmethods RsrReflectedVariableTestServiceB

doit
(RsrReflectedVariableTestServiceB
	subclass: 'RsrReflectedVariableTestClient'
	instVarNames: #( private )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrReflectedVariableTestClient
removeallclassmethods RsrReflectedVariableTestClient

doit
(RsrReflectedVariableTestServiceB
	subclass: 'RsrReflectedVariableTestServer'
	instVarNames: #( private )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrReflectedVariableTestServer
removeallclassmethods RsrReflectedVariableTestServer

doit
(RsrService
	subclass: 'RsrRemoteAction'
	instVarNames: #( sharedVariable )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrRemoteAction
removeallclassmethods RsrRemoteAction

doit
(RsrRemoteAction
	subclass: 'RsrRemoteActionClient'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrRemoteActionClient
removeallclassmethods RsrRemoteActionClient

doit
(RsrRemoteAction
	subclass: 'RsrRemoteActionServer'
	instVarNames: #( action debugHandler preUpdateHandler postUpdateHandler )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrRemoteActionServer
removeallclassmethods RsrRemoteActionServer

doit
(RsrService
	subclass: 'RsrReturnUnknownService'
	instVarNames: #( sharedVariable )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrReturnUnknownService
removeallclassmethods RsrReturnUnknownService

doit
(RsrReturnUnknownService
	subclass: 'RsrKnownServer'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrKnownServer
removeallclassmethods RsrKnownServer

doit
(RsrService
	subclass: 'RsrSendUnknownService'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrSendUnknownService
removeallclassmethods RsrSendUnknownService

doit
(RsrSendUnknownService
	subclass: 'RsrKnownClient'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrKnownClient
removeallclassmethods RsrKnownClient

doit
(RsrService
	subclass: 'RsrServiceNoInstVars'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrServiceNoInstVars
removeallclassmethods RsrServiceNoInstVars

doit
(RsrServiceNoInstVars
	subclass: 'RsrClientNoInstVars'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrClientNoInstVars
removeallclassmethods RsrClientNoInstVars

doit
(RsrServiceNoInstVars
	subclass: 'RsrServerNoInstVars'
	instVarNames: #( marker )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrServerNoInstVars
removeallclassmethods RsrServerNoInstVars

doit
(RsrService
	subclass: 'RsrServiceReferenceService'
	instVarNames: #( service )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrServiceReferenceService
removeallclassmethods RsrServiceReferenceService

doit
(RsrServiceReferenceService
	subclass: 'RsrClientReferenceService'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrClientReferenceService
removeallclassmethods RsrClientReferenceService

doit
(RsrServiceReferenceService
	subclass: 'RsrServerReferenceService'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrServerReferenceService
removeallclassmethods RsrServerReferenceService

doit
(RsrService
	subclass: 'RsrTestService'
	instVarNames: #( sharedVariable )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrTestService
removeallclassmethods RsrTestService

doit
(RsrTestService
	subclass: 'RsrClientTestService'
	instVarNames: #( privateVariable )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrClientTestService
removeallclassmethods RsrClientTestService

doit
(RsrTestService
	subclass: 'RsrServerTestService'
	instVarNames: #( privateVariable )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrServerTestService
removeallclassmethods RsrServerTestService

doit
(RsrService
	subclass: 'RsrValueHolder'
	instVarNames: #( value )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrValueHolder
removeallclassmethods RsrValueHolder

doit
(RsrValueHolder
	subclass: 'RsrValueHolderClient'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrValueHolderClient
removeallclassmethods RsrValueHolderClient

doit
(RsrValueHolder
	subclass: 'RsrValueHolderServer'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrValueHolderServer
removeallclassmethods RsrValueHolderServer

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
(AnnouncerTest
	subclass: 'WeakAnnouncerTest'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Announcements-Core-GemStone-Test';
		comment: 'SUnit tests for weak announcements';
		immediateInvariant.
true.
%

removeallmethods WeakAnnouncerTest
removeallclassmethods WeakAnnouncerTest

doit
(TestCase
	subclass: 'BreakpointHandlingTest'
	instVarNames: #( utility defaultProcess processes trace priority log )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-GemStone-Test';
		comment: 'These tests are actually independent of Sparkle, and test base debugging functionality.
They are (with minor exceptions) replicared in ernie0.

Most tests require only a single process. These tests can use the ''default process'' API which is simpler and more readable. 
Use #processBlock: to establish a default process for the test.

When tests require multiple processes, each process needs to be identified. These tests use the ''specific process'' API.
Use #processBlock:forID: to establish each such processes.

The ''IDed process'' API is expected to go away as unnecessary.

The processes created using #processBlock: and #processBlock:forID: record a trace of ControlInterrupts encountered during execution.
Each trace entry is an association of the process'' ID with the exception encountered. These trace entries can be examined during the test.

The logging API and instance variable can be used to record diagnostic information that would be helpful debugging tests.';
		immediateInvariant.
true.
%

removeallmethods BreakpointHandlingTest
removeallclassmethods BreakpointHandlingTest

doit
(TestCase
	subclass: 'GsCounterTest'
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

removeallmethods GsCounterTest
removeallclassmethods GsCounterTest

doit
(TestCase
	subclass: 'RsrTestCase'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Platform-Test';
		comment: 'An abstract test class which contains utility methods';
		immediateInvariant.
true.
%

removeallmethods RsrTestCase
removeallclassmethods RsrTestCase

doit
(RsrTestCase
	subclass: 'RsrAsyncMournHandlerTestCase'
	instVarNames: #( handler )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-GemStone-Test';
		immediateInvariant.
true.
%

removeallmethods RsrAsyncMournHandlerTestCase
removeallclassmethods RsrAsyncMournHandlerTestCase

doit
(RsrTestCase
	subclass: 'RsrClassResolverTestCase'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Platform-Test';
		immediateInvariant.
true.
%

removeallmethods RsrClassResolverTestCase
removeallclassmethods RsrClassResolverTestCase

doit
(RsrTestCase
	subclass: 'RsrCommandCodecTest'
	instVarNames: #( connection )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrCommandCodecTest
removeallclassmethods RsrCommandCodecTest

doit
(RsrCommandCodecTest
	subclass: 'RsrCommandDecoderTest'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		comment: 'No class-specific documentation for RsrDecoderTest, hierarchy is:
Object
  TestAsserter
    TestCase( testSelector)
      RsrTestCase
        RsrCodecTest( registry decoder)
          RsrDecoderTest
';
		immediateInvariant.
true.
%

removeallmethods RsrCommandDecoderTest
removeallclassmethods RsrCommandDecoderTest

doit
(RsrCommandCodecTest
	subclass: 'RsrCommandEncoderTest'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		comment: 'No class-specific documentation for RsrEncoderTest, hierarchy is:
Object
  TestAsserter
    TestCase( testSelector)
      RsrTestCase
        RsrCodecTest( registry decoder)
          RsrEncoderTest( connection)
';
		immediateInvariant.
true.
%

removeallmethods RsrCommandEncoderTest
removeallclassmethods RsrCommandEncoderTest

doit
(RsrTestCase
	subclass: 'RsrConnectionSpecificationTestCase'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrConnectionSpecificationTestCase
removeallclassmethods RsrConnectionSpecificationTestCase

doit
(RsrTestCase
	subclass: 'RsrForwarderTest'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrForwarderTest
removeallclassmethods RsrForwarderTest

doit
(RsrTestCase
	subclass: 'RsrGarbageCollectorTestCase'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Platform-Test';
		immediateInvariant.
true.
%

removeallmethods RsrGarbageCollectorTestCase
removeallclassmethods RsrGarbageCollectorTestCase

doit
(RsrTestCase
	subclass: 'RsrNumericSpigotTest'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrNumericSpigotTest
removeallclassmethods RsrNumericSpigotTest

doit
(RsrNumericSpigotTest
	subclass: 'RsrThreadSafeNumericSpigotTest'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrThreadSafeNumericSpigotTest
removeallclassmethods RsrThreadSafeNumericSpigotTest

doit
(RsrTestCase
	subclass: 'RsrPromiseTest'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrPromiseTest
removeallclassmethods RsrPromiseTest

doit
(RsrTestCase
	subclass: 'RsrProtocolVersionNegotiationCodecTestCase'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrProtocolVersionNegotiationCodecTestCase
removeallclassmethods RsrProtocolVersionNegotiationCodecTestCase

doit
(RsrTestCase
	subclass: 'RsrSnapshotAnalysisTest'
	instVarNames: #( connection )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		comment: 'No class-specific documentation for RsrSnapshotAnalysisTest, hierarchy is:
Object
  TestAsserter
    TestCase( testSelector)
      RsrTestCase
        RsrSnapshotAnalysisTest
';
		immediateInvariant.
true.
%

removeallmethods RsrSnapshotAnalysisTest
removeallclassmethods RsrSnapshotAnalysisTest

doit
(RsrTestCase
	subclass: 'RsrSocketStreamTestCase'
	instVarNames: #( aStream bStream )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrSocketStreamTestCase
removeallclassmethods RsrSocketStreamTestCase

doit
(RsrTestCase
	subclass: 'RsrSocketTestCase'
	instVarNames: #( sockets )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Platform-Test';
		immediateInvariant.
true.
%

removeallmethods RsrSocketTestCase
removeallclassmethods RsrSocketTestCase

doit
(RsrTestCase
	subclass: 'RsrSystemTestCase'
	instVarNames: #( connectionA connectionB )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrSystemTestCase
removeallclassmethods RsrSystemTestCase

doit
(RsrSystemTestCase
	subclass: 'RsrConnectionTestCase'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrConnectionTestCase
removeallclassmethods RsrConnectionTestCase

doit
(RsrConnectionTestCase
	subclass: 'RsrInMemoryConnectionTestCase'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrInMemoryConnectionTestCase
removeallclassmethods RsrInMemoryConnectionTestCase

doit
(RsrConnectionTestCase
	subclass: 'RsrSocketConnectionTestCase'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrSocketConnectionTestCase
removeallclassmethods RsrSocketConnectionTestCase

doit
(RsrSystemTestCase
	subclass: 'RsrEphemeronMourningDeadlock'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-GemStone-Test';
		immediateInvariant.
true.
%

removeallmethods RsrEphemeronMourningDeadlock
removeallclassmethods RsrEphemeronMourningDeadlock

doit
(RsrSystemTestCase
	subclass: 'RsrLifetimeTest'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrLifetimeTest
removeallclassmethods RsrLifetimeTest

doit
(RsrLifetimeTest
	subclass: 'RsrInMemoryLifetimeTest'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrInMemoryLifetimeTest
removeallclassmethods RsrInMemoryLifetimeTest

doit
(RsrLifetimeTest
	subclass: 'RsrSocketLifetimeTest'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrSocketLifetimeTest
removeallclassmethods RsrSocketLifetimeTest

doit
(RsrSystemTestCase
	subclass: 'RsrMessageSendingTest'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrMessageSendingTest
removeallclassmethods RsrMessageSendingTest

doit
(RsrMessageSendingTest
	subclass: 'RsrInMemoryMessageSendingTest'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrInMemoryMessageSendingTest
removeallclassmethods RsrInMemoryMessageSendingTest

doit
(RsrMessageSendingTest
	subclass: 'RsrSocketMessageSendingTest'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrSocketMessageSendingTest
removeallclassmethods RsrSocketMessageSendingTest

doit
(RsrSystemTestCase
	subclass: 'RsrServiceTest'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrServiceTest
removeallclassmethods RsrServiceTest

doit
(RsrServiceTest
	subclass: 'RsrInMemoryServiceTest'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrInMemoryServiceTest
removeallclassmethods RsrInMemoryServiceTest

doit
(RsrServiceTest
	subclass: 'RsrSocketServiceTest'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrSocketServiceTest
removeallclassmethods RsrSocketServiceTest

doit
(RsrSystemTestCase
	subclass: 'RsrSpeciesEquality'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrSpeciesEquality
removeallclassmethods RsrSpeciesEquality

doit
(RsrSpeciesEquality
	subclass: 'RsrInMemorySpeciesEquality'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrInMemorySpeciesEquality
removeallclassmethods RsrInMemorySpeciesEquality

doit
(RsrSpeciesEquality
	subclass: 'RsrSocketSpeciesEquality'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrSocketSpeciesEquality
removeallclassmethods RsrSocketSpeciesEquality

doit
(RsrSystemTestCase
	subclass: 'RsrStressTest'
	instVarNames: #( client server )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrStressTest
removeallclassmethods RsrStressTest

doit
(RsrStressTest
	subclass: 'RsrInMemoryStressTest'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrInMemoryStressTest
removeallclassmethods RsrInMemoryStressTest

doit
(RsrStressTest
	subclass: 'RsrSocketStressTest'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrSocketStressTest
removeallclassmethods RsrSocketStressTest

doit
(RsrTestCase
	subclass: 'RsrTestingProcessModelTestCase'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Platform-Test';
		immediateInvariant.
true.
%

removeallmethods RsrTestingProcessModelTestCase
removeallclassmethods RsrTestingProcessModelTestCase

doit
(RsrTestCase
	subclass: 'RsrTokenExchangeCodecTestCase'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'RemoteServiceReplication-Test';
		immediateInvariant.
true.
%

removeallmethods RsrTokenExchangeCodecTestCase
removeallclassmethods RsrTokenExchangeCodecTestCase

doit
(TestCase
	subclass: 'SpkTestCase'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #()
)
		category: 'Sparkle-Tools-Common-Test';
		comment: 'A common abstract superclass for all Sparkle tests, which makes it easier to build a suite in GemStone.';
		immediateInvariant.
true.
%

removeallmethods SpkTestCase
removeallclassmethods SpkTestCase

doit
(SpkTestCase
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
(SpkTestCase
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
(SpkTestCase
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
(SpkTestCase
	subclass: 'SpkToolTest'
	instVarNames: #( tool )
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

removeallmethods SpkToolTest
removeallclassmethods SpkToolTest

doit
(SpkToolTest
	subclass: 'SpkEvaluationTest'
	instVarNames: #( inspectorTool evaluatorTool taskspaceTool explorerTool )
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
(SpkToolTest
	subclass: 'SpkInspectorToolTest'
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

removeallmethods SpkInspectorToolTest
removeallclassmethods SpkInspectorToolTest

doit
(SpkTestCase
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

! Class implementation for 'BreakpointHandling'

!		Instance methods for 'BreakpointHandling'

category: 'other'
method: BreakpointHandling
factorialOf: anInteger afterWaitingMS: milliseconds
	"First factorial is so that we get a halt before the wait."

	self factorialOf: 1 stopAt: 1.
	self waitMS: milliseconds.
	^ self factorialOf: anInteger stopAt: 0
%

category: 'other'
method: BreakpointHandling
factorialOf: factInt stopAt: stopInt
	factInt = stopInt
		ifTrue: [ self halt ].
	factInt = 1
		ifTrue: [ ^ 1 ].
	^ factInt * (self factorialOf: factInt - 1 stopAt: stopInt)
%

category: 'other'
method: BreakpointHandling
fibonacciGenerations: genInt stopAt: stopInt
	| fNumbers howMany |
	fNumbers := OrderedCollection with: 0 with: 1.
	[ (howMany := fNumbers size) < genInt ]
		whileTrue: [ 
			howMany = stopInt
				ifTrue: [ self halt ].
			fNumbers add: (fNumbers at: howMany) + (fNumbers at: howMany - 1) ].
	^ fNumbers at: genInt	"Can''t use #last in case genInt = 1"
%

category: 'other'
method: BreakpointHandling
nlr1

| dict |
self halt.
dict := KeyValueDictionary new.
dict
     at: #notPresent
     ifAbsent: [3 + 4. 
	^self].
^75
%

category: 'other'
method: BreakpointHandling
nlr2
	| block |
	block := [ ^ 42 ].
	self halt.
	block value.
	^ 42 printString
%

category: 'other'
method: BreakpointHandling
runHotForSeconds: anInteger
shouldHalt: shouldHalt
counter: aCounter

	| endTime |
	endTime := DateAndTime now + (Duration seconds: anInteger).
	[ DateAndTime now < endTime ]
		whileTrue: [ 
			shouldHalt
				ifTrue: [ self halt ].
			"Processor yield."
			aCounter increment]
%

category: 'other'
method: BreakpointHandling
waitMS: milliseconds
	(Delay forMilliseconds: milliseconds) wait
%

! Class implementation for 'GsCounter'

!		Class methods for 'GsCounter'

category: 'instance creation'
classmethod: GsCounter
new
	^ super new
		initialize;
		yourself
%

!		Instance methods for 'GsCounter'

category: 'accessing'
method: GsCounter
current
	^ current
%

category: 'updating'
method: GsCounter
increment
	"Currently there is only a requirement to increment by 1. In future, this may need to support arbitrary increments."

	current := current + 1
%

category: 'initializing - private'
method: GsCounter
initialize
	super initialize.
	current := 0.
%

! Class implementation for 'SpkTestClassForDebugging'

!		Instance methods for 'SpkTestClassForDebugging'

category: 'breakpointing'
method: SpkTestClassForDebugging
twelve
	^ 3 + 4 + 5

	"Despite having no obvious senders, this method is
	 referenced both in an explicit method lookup
	 and in evaluated strings.
	 Note that tests check for source intervals while stepping
	 so this comment follows the code."
%

! Class implementation for 'RsrNullChannel'

!		Instance methods for 'RsrNullChannel'

category: 'lifecycle'
method: RsrNullChannel
close

	"NOP"
%

category: 'testing'
method: RsrNullChannel
isConnected

	^true
%

category: 'accessing'
method: RsrNullChannel
lastCommand

	^lastCommand
%

category: 'lifecycle'
method: RsrNullChannel
open

	"NOP"
%

category: 'events'
method: RsrNullChannel
received: aCommand

	lastCommand := aCommand
%

category: 'events'
method: RsrNullChannel
send: aCommand

	lastCommand := aCommand
%

! Class implementation for 'RsrSignalErrorInAsString'

!		Instance methods for 'RsrSignalErrorInAsString'

category: 'converting'
method: RsrSignalErrorInAsString
asString

	^Error signal
%

! Class implementation for 'RsrSocketPair'

!		Class methods for 'RsrSocketPair'

category: 'instance creation'
classmethod: RsrSocketPair
firstSocket: firstSocket
secondSocket: secondSocket

	^super new
		firstSocket: firstSocket;
		secondSocket: secondSocket;
		yourself
%

category: 'accessing'
classmethod: RsrSocketPair
listenPort

	^64455
%

category: 'instance creation'
classmethod: RsrSocketPair
new

	| localhost port listener firstSocket secondSocket |
	localhost := '127.0.0.1'.
	port := 8765.
	listener := self socketClass new.
	secondSocket := self socketClass new.
	listener
		bindAddress: localhost
		port: port.
	listener listen: 1.
	secondSocket
		connectToHost: localhost
		port: port.
	firstSocket := listener accept.
	listener close.
	(firstSocket isConnected and: [secondSocket isConnected])
		ifFalse: [self error: 'Failed to create socket pair'].
	^self
		firstSocket: firstSocket
		secondSocket: secondSocket
%

category: 'accessing'
classmethod: RsrSocketPair
socketClass

	^RsrSocket
%

!		Instance methods for 'RsrSocketPair'

category: 'closing'
method: RsrSocketPair
close

	firstSocket close.
	secondSocket close
%

category: 'accessing'
method: RsrSocketPair
firstSocket

	^firstSocket
%

category: 'accessing'
method: RsrSocketPair
firstSocket: anObject

	firstSocket := anObject
%

category: 'accessing'
method: RsrSocketPair
firstStream

	^self socketStreamClass on: firstSocket
%

category: 'accessing'
method: RsrSocketPair
secondSocket

	^secondSocket
%

category: 'accessing'
method: RsrSocketPair
secondSocket: anObject

	secondSocket := anObject
%

category: 'accessing'
method: RsrSocketPair
secondStream

	^self socketStreamClass on: secondSocket
%

category: 'accessing'
method: RsrSocketPair
socketStreamClass

	^(RsrClassResolver classNamed: #RsrSocketStream)
%

! Class implementation for 'RsrTestingProcessModel'

!		Instance methods for 'RsrTestingProcessModel'

category: 'managing-concurrency'
method: RsrTestingProcessModel
fork: aBlock
at: aPriority
named: aString

	^super
		fork: (self protect: aBlock)
		at: aPriority
		named: aString
%

category: 'managing-concurrency'
method: RsrTestingProcessModel
fork: aBlock
named: aString

	^super
		fork: (self protect: aBlock)
		named: aString
%

category: 'accessing'
method: RsrTestingProcessModel
forkedException

	^forkedException
%

category: 'accessing'
method: RsrTestingProcessModel
protect: aBlock

	^[aBlock on: self class unhandledExceptionClass do: [:ue | forkedException := ue exception copy. ue return]]
%

! Class implementation for 'RsrConcurrentTestService'

!		Class methods for 'RsrConcurrentTestService'

category: 'accessing'
classmethod: RsrConcurrentTestService
clientClassName

	^#RsrConcurrentTestClient
%

category: 'accessing'
classmethod: RsrConcurrentTestService
serverClassName

	^#RsrConcurrentTestServer
%

category: 'accessing'
classmethod: RsrConcurrentTestService
templateClassName

	^#RsrConcurrentTestService
%

! Class implementation for 'RsrConcurrentTestClient'

!		Instance methods for 'RsrConcurrentTestClient'

category: 'accessing'
method: RsrConcurrentTestClient
counterWithIncrement

	^remoteSelf counterWithIncrement wait
%

category: 'accessing'
method: RsrConcurrentTestClient
delayedCounter

	^remoteSelf delayedCounter wait
%

category: 'actions'
method: RsrConcurrentTestClient
stashProcess

	remoteSelf stashProcess wait
%

! Class implementation for 'RsrConcurrentTestServer'

!		Class methods for 'RsrConcurrentTestServer'

category: 'accessing'
classmethod: RsrConcurrentTestServer
initialCounter

	^0
%

!		Instance methods for 'RsrConcurrentTestServer'

category: 'accessing'
method: RsrConcurrentTestServer
counter: anArray

	counter := anArray
%

category: 'accessing'
method: RsrConcurrentTestServer
counterWithIncrement

	^[counter at: 1] ensure: [counter at: 1 put: (counter at: 1) + 1]
%

category: 'accessing'
method: RsrConcurrentTestServer
delayedCounter

	semaphore signal.
	(Delay forSeconds: 2) wait.
	^counter at: 1
%

category: 'accessing'
method: RsrConcurrentTestServer
semaphore: aSemaphore

	semaphore := aSemaphore
%

category: 'accessing'
method: RsrConcurrentTestServer
stashedProcess

	^stashedProcess
%

category: 'actions'
method: RsrConcurrentTestServer
stashProcess

	stashedProcess := Processor activeProcess
%

! Class implementation for 'RsrInstrumentedService'

!		Class methods for 'RsrInstrumentedService'

category: 'accessing'
classmethod: RsrInstrumentedService
clientClassName

	^#RsrInstrumentedClient
%

category: 'accessing'
classmethod: RsrInstrumentedService
serverClassName

	^#RsrInstrumentedServer
%

category: 'accessing'
classmethod: RsrInstrumentedService
templateClassName

	^#RsrInstrumentedService
%

!		Instance methods for 'RsrInstrumentedService'

category: 'events'
method: RsrInstrumentedService
postUpdate

	self postUpdateCount: self postUpdateCount + 1
%

category: 'events'
method: RsrInstrumentedService
preUpdate

	self preUpdateCount: self preUpdateCount + 1
%

! Class implementation for 'RsrInstrumentedClient'

!		Instance methods for 'RsrInstrumentedClient'

category: 'accessing'
method: RsrInstrumentedClient
postUpdateCount

	^postUpdateCount ifNil: [0]
%

category: 'accessing'
method: RsrInstrumentedClient
postUpdateCount: anInteger

	postUpdateCount := anInteger
%

category: 'accessing'
method: RsrInstrumentedClient
preUpdateCount

	^preUpdateCount ifNil: [0]
%

category: 'accessing'
method: RsrInstrumentedClient
preUpdateCount: anInteger

	preUpdateCount := anInteger
%

category: 'evaluating'
method: RsrInstrumentedClient
return: anObject

	^(remoteSelf return: anObject) wait
%

category: 'evaluating'
method: RsrInstrumentedClient
value

	^remoteSelf value wait
%

! Class implementation for 'RsrInstrumentedServer'

!		Instance methods for 'RsrInstrumentedServer'

category: 'accessing'
method: RsrInstrumentedServer
action

	^action
%

category: 'accessing'
method: RsrInstrumentedServer
action: aBlock

	action := aBlock
%

category: 'accessing'
method: RsrInstrumentedServer
postUpdateCount

	^postUpdateCount ifNil: [0]
%

category: 'accessing'
method: RsrInstrumentedServer
postUpdateCount: anInteger

	postUpdateCount := anInteger
%

category: 'accessing'
method: RsrInstrumentedServer
preUpdateCount

	^preUpdateCount ifNil: [0]
%

category: 'accessing'
method: RsrInstrumentedServer
preUpdateCount: anInteger

	preUpdateCount := anInteger
%

category: 'evaluating'
method: RsrInstrumentedServer
return: anObject

	^anObject
%

category: 'evaluating'
method: RsrInstrumentedServer
value

	^self action value
%

! Class implementation for 'RsrMockService'

!		Class methods for 'RsrMockService'

category: 'accessing'
classmethod: RsrMockService
clientClassName

	^#RsrMockClient
%

category: 'accessing'
classmethod: RsrMockService
serverClassName

	^#RsrMockServer
%

!		Instance methods for 'RsrMockService'

category: 'initialize'
method: RsrMockService
initialize

	super initialize.
	_id := 1
%

category: 'testing'
method: RsrMockService
isClient

	^self class == RsrMockClient
%

category: 'testing'
method: RsrMockService
isServer

	^self class == RsrMockServer
%

category: 'accessing'
method: RsrMockService
service

	^self
%

! Class implementation for 'RsrReflectedVariableTestServiceA'

!		Instance methods for 'RsrReflectedVariableTestServiceA'

category: 'accessing'
method: RsrReflectedVariableTestServiceA
varA

	^varA
%

! Class implementation for 'RsrReflectedVariableTestServiceB'

!		Class methods for 'RsrReflectedVariableTestServiceB'

category: 'accessing'
classmethod: RsrReflectedVariableTestServiceB
clientClassName

	^#RsrReflectedVariableTestClient
%

category: 'accessing'
classmethod: RsrReflectedVariableTestServiceB
serverClassName

	^#RsrReflectedVariableTestServer
%

category: 'accessing'
classmethod: RsrReflectedVariableTestServiceB
templateClassName

	^#RsrReflectedVariableTestServiceB
%

!		Instance methods for 'RsrReflectedVariableTestServiceB'

category: 'accessing'
method: RsrReflectedVariableTestServiceB
varB

	^varB
%

! Class implementation for 'RsrReflectedVariableTestClient'

!		Instance methods for 'RsrReflectedVariableTestClient'

category: 'accessing'
method: RsrReflectedVariableTestClient
setVarsToAndReturn: anObject

	^(remoteSelf setVarsToAndReturn: anObject) wait
%

! Class implementation for 'RsrReflectedVariableTestServer'

!		Instance methods for 'RsrReflectedVariableTestServer'

category: 'accessing'
method: RsrReflectedVariableTestServer
setVarsToAndReturn: anObject

	^varA := varB := anObject
%

! Class implementation for 'RsrRemoteAction'

!		Class methods for 'RsrRemoteAction'

category: 'instance creation'
classmethod: RsrRemoteAction
sharedVariable: anObject

	^self new
		sharedVariable: anObject;
		yourself
%

category: 'accessing'
classmethod: RsrRemoteAction
templateClassName

	^#RsrRemoteAction
%

!		Instance methods for 'RsrRemoteAction'

category: 'accessing'
method: RsrRemoteAction
sharedVariable

	^sharedVariable
%

category: 'accessing'
method: RsrRemoteAction
sharedVariable: anObject

	sharedVariable := anObject
%

! Class implementation for 'RsrRemoteActionClient'

!		Instance methods for 'RsrRemoteActionClient'

category: 'evaluating'
method: RsrRemoteActionClient
asyncValue

	^remoteSelf evaluateAction
%

category: 'evaluating'
method: RsrRemoteActionClient
asyncValue: anObject

	^remoteSelf evaluateAction: anObject
%

category: 'evaluating'
method: RsrRemoteActionClient
value

	^self asyncValue wait
%

category: 'evaluating'
method: RsrRemoteActionClient
value: anObject

	^(self asyncValue: anObject) wait
%

! Class implementation for 'RsrRemoteActionServer'

!		Instance methods for 'RsrRemoteActionServer'

category: 'accessing'
method: RsrRemoteActionServer
action

	^action
%

category: 'accessing'
method: RsrRemoteActionServer
action: aBlock

	action := aBlock
%

category: 'debugging'
method: RsrRemoteActionServer
debug: anException
raisedDuring: aMessageSend
answerUsing: aResolver

	^self debugHandler
		value: anException
		value: aMessageSend
		value: aResolver
%

category: 'accessing'
method: RsrRemoteActionServer
debugHandler

	^debugHandler ifNil: [[:x :y :z | nil]]
%

category: 'accessing'
method: RsrRemoteActionServer
debugHandler: aBlock

	debugHandler := aBlock
%

category: 'evaluating'
method: RsrRemoteActionServer
evaluateAction

	^self action value
%

category: 'evaluating'
method: RsrRemoteActionServer
evaluateAction: anObject

	^self action value: anObject
%

category: 'processing'
method: RsrRemoteActionServer
postUpdate

	self postUpdateHandler value
%

category: 'accessing'
method: RsrRemoteActionServer
postUpdateHandler

	^postUpdateHandler ifNil: [[]]
%

category: 'accessing'
method: RsrRemoteActionServer
postUpdateHandler: aBlock

	postUpdateHandler := aBlock
%

category: 'processing'
method: RsrRemoteActionServer
preUpdate

	self preUpdateHandler value
%

category: 'accessing'
method: RsrRemoteActionServer
preUpdateHandler

	^preUpdateHandler ifNil: [[]]
%

category: 'accessing'
method: RsrRemoteActionServer
preUpdateHandler: aBlock

	preUpdateHandler := aBlock
%

! Class implementation for 'RsrReturnUnknownService'

!		Class methods for 'RsrReturnUnknownService'

category: 'accessing'
classmethod: RsrReturnUnknownService
clientClassName

	^#RsrDoNotCreateThisClass
%

category: 'accessing'
classmethod: RsrReturnUnknownService
serverClassName

	^#RsrKnownServer
%

category: 'accessing'
classmethod: RsrReturnUnknownService
templateClassName

	^#RsrReturnUnknownService
%

! Class implementation for 'RsrSendUnknownService'

!		Class methods for 'RsrSendUnknownService'

category: 'accessing'
classmethod: RsrSendUnknownService
clientClassName

	^#RsrKnownClient
%

category: 'accessing'
classmethod: RsrSendUnknownService
serverClassName

	^#RsrDoNotCreateThisClass
%

category: 'accessing'
classmethod: RsrSendUnknownService
templateClassName

	^#RsrSendUnknownService
%

! Class implementation for 'RsrServiceNoInstVars'

!		Class methods for 'RsrServiceNoInstVars'

category: 'accessing'
classmethod: RsrServiceNoInstVars
clientClassName

	^#RsrClientNoInstVars
%

category: 'accessing'
classmethod: RsrServiceNoInstVars
serverClassName

	^#RsrServerNoInstVars
%

category: 'accessing'
classmethod: RsrServiceNoInstVars
templateClassName

	^#RsrServiceNoInstVars
%

!		Instance methods for 'RsrServiceNoInstVars'

category: 'accessing'
method: RsrServiceNoInstVars
returnArgument: anObject

	^anObject
%

category: 'testing-methods'
method: RsrServiceNoInstVars
sendReturnArgument: anObject

	^(remoteSelf returnArgument: anObject) wait
%

! Class implementation for 'RsrClientNoInstVars'

!		Instance methods for 'RsrClientNoInstVars'

category: 'test selectors'
method: RsrClientNoInstVars
unimplementedRemoteSend
	"Send a selector which is not implemented remotely resuling in a DNU."

	^remoteSelf doNotImplementThisSelectorOrYouWillBreakATest
%

! Class implementation for 'RsrServiceReferenceService'

!		Class methods for 'RsrServiceReferenceService'

category: 'accessing'
classmethod: RsrServiceReferenceService
clientClassName

	^#RsrClientReferenceService
%

category: 'accessing'
classmethod: RsrServiceReferenceService
serverClassName

	^#RsrServerReferenceService
%

category: 'instance creation'
classmethod: RsrServiceReferenceService
service: aService

	^self new
		service: aService;
		yourself
%

category: 'accessing'
classmethod: RsrServiceReferenceService
templateClassName

	^#RsrServiceReferenceService
%

!		Instance methods for 'RsrServiceReferenceService'

category: 'accessing'
method: RsrServiceReferenceService
service
	^ service
%

category: 'accessing'
method: RsrServiceReferenceService
service: anObject
	service := anObject
%

! Class implementation for 'RsrTestService'

!		Class methods for 'RsrTestService'

category: 'accessing'
classmethod: RsrTestService
clientClassName

	^#RsrClientTestService
%

category: 'accessing'
classmethod: RsrTestService
serverClassName

	^#RsrServerTestService
%

category: 'accessing'
classmethod: RsrTestService
templateClassName

	^#RsrTestService
%

!		Instance methods for 'RsrTestService'

category: 'accessing'
method: RsrTestService
remoteSelf

	^remoteSelf
%

category: 'accessing'
method: RsrTestService
sharedVariable

	^sharedVariable
%

category: 'accessing'
method: RsrTestService
sharedVariable: anObject

	sharedVariable := anObject
%

! Class implementation for 'RsrClientTestService'

!		Instance methods for 'RsrClientTestService'

category: 'accessing'
method: RsrClientTestService
privateVariable

	^privateVariable
%

category: 'accessing'
method: RsrClientTestService
privateVariable: anObject

	privateVariable := anObject
%

! Class implementation for 'RsrServerTestService'

!		Instance methods for 'RsrServerTestService'

category: 'accessing'
method: RsrServerTestService
privateVariable

	^privateVariable
%

category: 'accessing'
method: RsrServerTestService
privateVariable: anObject

	privateVariable := anObject
%

! Class implementation for 'RsrValueHolder'

!		Class methods for 'RsrValueHolder'

category: 'accessing'
classmethod: RsrValueHolder
clientClassName

	^#RsrValueHolderClient
%

category: 'accessing'
classmethod: RsrValueHolder
serverClassName

	^#RsrValueHolderServer
%

category: 'accessing'
classmethod: RsrValueHolder
templateClassName

	^#RsrValueHolder
%

category: 'instance creation'
classmethod: RsrValueHolder
value: anRsrObject

	^self new
		value: anRsrObject;
		yourself
%

!		Instance methods for 'RsrValueHolder'

category: 'accessing'
method: RsrValueHolder
value

	^value
%

category: 'accessing'
method: RsrValueHolder
value: anObject

	value := anObject.
	self synchronize
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

! Class implementation for 'WeakAnnouncerTest'

!		Instance methods for 'WeakAnnouncerTest'

category: 'asserting'
method: WeakAnnouncerTest
assert: anObject
identicalTo: bObject

	^self assert: anObject == bObject
%

category: 'utilities'
method: WeakAnnouncerTest
maximumReclamation

	System _generationScavenge_vmMarkSweep.
	System _generationScavenge_vmMarkSweep.
	(Delay forMilliseconds: 10) wait.
%

category: 'tests'
method: WeakAnnouncerTest
testMakeStrong

	| counter collector forwarder subscription |
	counter := 0.
	collector := [ counter := counter + 1 ].
	forwarder := MessageSend receiver: collector selector: #value.
	subscription := announcer weak when: AnnouncementMockA send: #value to: forwarder.
	
	" shouldn't go away, we are still holding a reference to 'forwarder': "
	self maximumReclamation.
	announcer announce: AnnouncementMockA.
	self assert: counter equals: 1.
	
	"Shouldn't go away since we converted to a strong sub"
	subscription := subscription makeStrong.
	forwarder := nil.
	self maximumReclamation.
	announcer announce: AnnouncementMockA.
	self assert: counter equals: 2
%

category: 'tests'
method: WeakAnnouncerTest
testNoDeadWeakSubscriptions

	self maximumReclamation.
	self assert: (WeakAnnouncementSubscription allInstancesInMemory select: [ :sub | sub subscriber isNil ]) isEmpty.
	self assert: (WeakAnnouncementSubscription allInstancesInMemory select: [ :sub | sub subscriber isNil ]) isEmpty
%

category: 'tests'
method: WeakAnnouncerTest
testWeakBlockUnsupported
	"We support weak blocks though they aren't all that useful."

	| counter |
	counter := 0.
	self
		should: [announcer weak when: AnnouncementMockA send: #value to: []]
		raise: WeakBlockUnsupported.
	self
		should: [(announcer when: AnnouncementMockA do: [ :ann | counter := counter + 1 ] for: self) makeWeak]
		raise: WeakBlockUnsupported
%

category: 'tests'
method: WeakAnnouncerTest
testWeakDoubleAnnouncer

	| a1 a2 o |
	a1 := Announcer new.
	a2 := Announcer new.
	o := Object new.
	self 
		assert: a1 subscriptions numberOfSubscriptions
		equals: 0.
	self
		assert: a2 subscriptions numberOfSubscriptions
		equals: 0.
	
	a1 weak
		when: Announcement
		send: #abcdef
		to: o.
	a2 weak
		when: Announcement
		send: #abcdef
		to: o.	
	self 
		assert: a1 subscriptions numberOfSubscriptions
		equals: 1.
	self
		assert: a2 subscriptions numberOfSubscriptions
		equals: 1.
	
	self maximumReclamation.
	self 
		assert: a1 subscriptions numberOfSubscriptions
		equals: 1.
	self
		assert: a2 subscriptions numberOfSubscriptions
		equals: 1.	

	o := nil.
	self maximumReclamation.
	self 
		assert: a1 subscriptions numberOfSubscriptions
		equals: 0.
	self
		assert: a2 subscriptions numberOfSubscriptions
		equals: 0.
%

category: 'tests'
method: WeakAnnouncerTest
testWeakObject

	| counter collector forwarder |
	counter := 0.
	collector := [ counter := counter + 1 ].
	forwarder := MessageSend receiver: collector selector: #value.
	(announcer when: AnnouncementMockA send: #value to: forwarder) makeWeak.
	
	" shouldn't go away, we are still holding a reference to 'forwarder': "
	self maximumReclamation.
	announcer announce: AnnouncementMockA.
	self assert: counter equals: 1.
	
	" should go away as we let the only reference to 'forwarder' go: "
	forwarder := nil.
	self maximumReclamation.
	announcer announce: AnnouncementMockA.
	self assert: counter equals: 1
%

category: 'tests'
method: WeakAnnouncerTest
testWeakSubscription

	| obj subscription |
	obj := Object new.
	subscription := (announcer when: AnnouncementMockA send: #value to: obj) makeWeak.
	self assert: obj identicalTo: subscription subscriber
%

! Class implementation for 'BreakpointHandlingTest'

!		Instance methods for 'BreakpointHandlingTest'

category: 'support - default process'
method: BreakpointHandlingTest
advanceToBreakpoint
	self advanceToBreakpointIn: defaultProcess
%

category: 'support - specific process'
method: BreakpointHandlingTest
advanceToBreakpointIn: aProcess
	self
		advanceToControlInterruptIn: aProcess;
		assertOneTraceEntry;
		assertNextTraceValueClass: Breakpoint
%

category: 'support - IDed process'
method: BreakpointHandlingTest
advanceToBreakpointInProcessID: anID
	self advanceToBreakpointIn: (self processWithID: anID)
%

category: 'support - default process'
method: BreakpointHandlingTest
advanceToControlInterrupt
	self advanceToControlInterruptIn: defaultProcess
%

category: 'support - specific process'
method: BreakpointHandlingTest
advanceToControlInterruptIn: aProcess
	aProcess resume.
	(self waitMS: 100).
	self assertSuspended: aProcess
%

category: 'support - IDed process'
method: BreakpointHandlingTest
advanceToControlInterruptInProcessNamed: aName
	self advanceToControlInterruptIn: (self processNamed: aName)
%

category: 'support - default process'
method: BreakpointHandlingTest
advanceToEnd
	self advanceToEndIn: defaultProcess
%

category: 'support - specific process'
method: BreakpointHandlingTest
advanceToEndIn: aProcess
	aProcess resume.
	(self waitMS: 100).
	self
		denySuspended: aProcess;
		assert: aProcess _isTerminated;
		assertNoTraceEntries
%

category: 'support - IDed process'
method: BreakpointHandlingTest
advanceToEndInProcessID: anID
	self advanceToEndIn: (self processWithID: anID)
%

category: 'support - default process'
method: BreakpointHandlingTest
advanceToHalt
	self advanceToHaltIn: defaultProcess
%

category: 'support - specific process'
method: BreakpointHandlingTest
advanceToHaltIn: aProcess
	self
		advanceToControlInterruptIn: aProcess;
		assertOneTraceEntry;
		assertNextTraceValueClass: Halt
%

category: 'support - IDed process'
method: BreakpointHandlingTest
advanceToHaltInProcessID: anID
	self advanceToHaltIn: (self processWithID: anID)
%

category: 'asserting'
method: BreakpointHandlingTest
assertNextTraceKey: anID valueClass: aBehavior
	| nextTrace |
	nextTrace := trace next.
	self assert: nextTrace key equals: anID.
	self assert: nextTrace value class equals: aBehavior
%

category: 'asserting'
method: BreakpointHandlingTest
assertNextTraceValueClass: aBehavior
	| nextTrace |
	nextTrace := trace next.
	self assert: nextTrace value class equals: aBehavior
%

category: 'asserting'
method: BreakpointHandlingTest
assertNoTraceEntries
	self assert: trace size equals: 0
%

category: 'asserting'
method: BreakpointHandlingTest
assertOneTraceEntry
	self assert: trace size equals: 1
%

category: 'support - default process'
method: BreakpointHandlingTest
assertSuspended
	self assertSuspended: defaultProcess
%

category: 'asserting'
method: BreakpointHandlingTest
assertSuspended: aProcess
	self
		assert: (self isSuspended: aProcess)
		description: 'Process should have been suspended'
%

category: 'support'
method: BreakpointHandlingTest
defaultProcessID
	^#DefaultProcess
%

category: 'support - default process'
method: BreakpointHandlingTest
denySuspended
	self denySuspended: defaultProcess
%

category: 'asserting'
method: BreakpointHandlingTest
denySuspended: aProcess
	self
		deny: (self isSuspended: aProcess)
		description: 'Process should not have been suspended'
%

category: 'support'
method: BreakpointHandlingTest
firstFrameBelowHalt
	"Answer the number of the frame below a #halt, considering all the overhead of signalling the exception."

	^ 10
%

category: 'support - specific process'
method: BreakpointHandlingTest
isSuspended: aProcess

	^ProcessorScheduler scheduler _isSuspended: aProcess
%

category: 'support - default process'
method: BreakpointHandlingTest
levelsSelect: aBlock
	"Answer an array of levels for which the block answers true.
	The argument to the block is the frame contents array."

	^ self levelsSelect: aBlock inProcess: defaultProcess
%

category: 'support - specific process'
method: BreakpointHandlingTest
levelsSelect: aBlock inProcess: aProcess
	"Answer an array of levels for which the block answers true.
	The argument to the block is the frame contents array."

	| result |
	result := {}.

	1 to: aProcess stackDepth do: [ :level | 
		(aBlock value: (aProcess _frameContentsAt: level))
			ifTrue: [ result add: level ] ].
	^ result
%

category: 'support - default process'
method: BreakpointHandlingTest
levelsWithSelector: selector
	^ self levelsWithSelector: selector inProcess: defaultProcess
%

category: 'support - specific process'
method: BreakpointHandlingTest
levelsWithSelector: selector inProcess: aProcess
	^ self
		levelsSelect: [ :fc | fc first selector == selector ]
		inProcess: aProcess
%

category: 'support - logging'
method: BreakpointHandlingTest
log: aString
	log
		addAll: aString;
		lf
%

category: 'support - logging'
method: BreakpointHandlingTest
log: aString processEssentials: aProcess frameLevel: levelInteger
	| frameAtLevel frameAtNextHigherLevel methodAtLevel ipOffsetAtLevel stepPointAtLevel |
	aProcess _isTerminated
		ifTrue: [ self log: aString with: aProcess ]
		ifFalse: [ 
			frameAtLevel := aProcess _frameContentsAt: levelInteger.
			frameAtNextHigherLevel := aProcess _frameContentsAt: levelInteger - 1.
			methodAtLevel := frameAtLevel first.
			ipOffsetAtLevel := frameAtLevel second.
			stepPointAtLevel := aProcess _stepPointAt: levelInteger.

			self log: aString with: aProcess.
			self log: #'level' with: levelInteger.
			self log: #'frameAtLevel' with: frameAtLevel.
			self log: #'frameAtNextHigherLevel' with: frameAtNextHigherLevel.
			self log: #'stepPointAtLevel' with: stepPointAtLevel ].
	self logGroupSeparator
%

category: 'support - logging'
method: BreakpointHandlingTest
log: aString with: anObject

	self log: aString, ': ', anObject printString.
%

category: 'support - logging'
method: BreakpointHandlingTest
logGroupSeparator
	self
		log: '= = = = = = = = = =';
		log: ''.
%

category: 'support - default process'
method: BreakpointHandlingTest
processBlock: aBlock
	defaultProcess := self processBlock: aBlock forID: self defaultProcessID
%

category: 'support - IDed process'
method: BreakpointHandlingTest
processBlock: aBlock forID: anID
	| thisProcess |
	(processes includesKey: anID)
		ifTrue: [ self error: 'Process with ID ' , anID printString , ' already exists' ].
	thisProcess := [ 
	aBlock
		on: ControlInterrupt
		do: [ :ex | 
			self traceID: anID value: ex.
			thisProcess suspend.
			ex resume ] ] newProcess.
	thisProcess
		priority: priority;
		breakpointLevel: 1.
	processes at: anID put: thisProcess.
	^ thisProcess
%

category: 'support - IDed process'
method: BreakpointHandlingTest
processWithID: anID
	processes
		at: anID
		ifAbsent: [ self error: 'No process found for id ' , anID printString ]
%

category: 'support - breaking'
method: BreakpointHandlingTest
setAllStepBreaksIn: aMethod
	^ self setAllStepBreaksIn: aMethod forProcess: defaultProcess
%

category: 'support - breaking'
method: BreakpointHandlingTest
setAllStepBreaksIn: aMethod forProcess: aProcess
	aProcess convertToPortableStack.
	^ aMethod
		_setBreakAtIp: -1
		operation: 1
		frame: nil
		process: aProcess
		breakpointLevel: 1
%

category: 'support - breaking'
method: BreakpointHandlingTest
setMethodBreakAtStepPoint: aStepPoint inMethod: aMethod
	^ self
		setMethodBreakAtStepPoint: aStepPoint
		inMethod: aMethod
		forProcess: defaultProcess
%

category: 'support - breaking'
method: BreakpointHandlingTest
setMethodBreakAtStepPoint: aStepPoint inMethod: aMethod forProcess: aProcess
	| info |
	aProcess convertToPortableStack.
	info := aMethod _meth_ip_ForStepPoint: aStepPoint abs.
	self assert: info notNil description: 'Could not find ip for step point'.

	(info at: 1)
		_setBreakAtIp: (info at: 2)
		operation: 0
		frame: nil
		process: aProcess
		breakpointLevel: 1
%

category: 'support - breaking'
method: BreakpointHandlingTest
setStepBreakAtStepPoint: aStepPoint inMethod: aMethod
	^ self
		setStepBreakAtStepPoint: aStepPoint
		inMethod: aMethod
		forProcess: defaultProcess
%

category: 'support - breaking'
method: BreakpointHandlingTest
setStepBreakAtStepPoint: aStepPoint inMethod: aMethod forProcess: aProcess
	| result |
	aProcess convertToPortableStack.
	result := aMethod
		_breakOperation: 1
		forStepPoint: aStepPoint
		breakpointLevel: 1.
	self
		assert: result notNil
		description: 'Failed to set step point at step ' , aStepPoint printString.
	^ result
%

category: 'support'
method: BreakpointHandlingTest
setUp

	super setUp.
	GsNMethod clearAllBreaks.
	utility := BreakpointHandling new.
	trace := SharedQueue new.
	priority := Processor activePriority - 1.
	processes := Dictionary new.
	log := AppendableString new.
%

category: 'support - default process'
method: BreakpointHandlingTest
stepOverInLevel: aLevel
	self stepOverInLevel: aLevel inProcess: defaultProcess
%

category: 'support - specific process'
method: BreakpointHandlingTest
stepOverInLevel: aLevel inProcess: aProcess
	aProcess stepOverFromLevel: aLevel.
	self advanceToBreakpointIn: aProcess
%

category: 'support - IDed process'
method: BreakpointHandlingTest
stepOverInLevel: aLevel inProcessID: anID
	self stepOverInLevel: aLevel inProcess: (self processWithID: anID)
%

category: 'support'
method: BreakpointHandlingTest
tearDown
	GsNMethod clearAllBreaks.
	defaultProcess := nil.
	processes copy
		keysAndValuesDo: [ :eachName :eachProcess | 
			eachProcess terminate.
			processes removeKey: eachName ]
%

category: 'tests'
method: BreakpointHandlingTest
testMethodSteppingIsLocalToOneProcess
	"This test ensures that when you have a debugger on a process and #step, the step action applies
	to the specific process. The step shouldn't apply to other processes executing the same method."

	| haltingProcess independentProcess level haltingMethod haltingCounter independentCounter independentCounterCache |
	haltingCounter := GsCounter new.
	independentCounter := GsCounter new.
	haltingProcess := self
		processBlock: [ utility runHotForSeconds: 6 shouldHalt: true counter: haltingCounter ]
		forID: #'HaltingProcess'.
	independentProcess := self
		processBlock: [ utility runHotForSeconds: 6 shouldHalt: false counter: independentCounter ]
		forID: #'RunningProcess'.
	independentProcess
		convertToPortableStack.
	self advanceToControlInterruptIn: haltingProcess.
	independentCounterCache := independentCounter current.
	level := self firstFrameBelowHalt.
	haltingMethod := (haltingProcess _frameContentsAt: level) first.
	self
		assert: haltingMethod selector
		equals: #'runHotForSeconds:shouldHalt:counter:'.
	self assertOneTraceEntry.
	self assertNextTraceKey: #'HaltingProcess' valueClass: Halt.

	independentProcess resume.
	(self waitMS: 100).
	independentProcess convertToPortableStack.

	haltingProcess stepOverFromLevel: level.
	(self waitMS: 100).

	self assertSuspended: haltingProcess.
	self denySuspended: independentProcess.
	self assertNoTraceEntries.
	self assert: independentCounter current > independentCounterCache.
	independentProcess terminate.
	self assert: independentProcess _isTerminated.

	self advanceToControlInterruptIn: haltingProcess.
	self assertOneTraceEntry.
	self assertNextTraceKey: #'HaltingProcess' valueClass: Breakpoint
%

category: 'tests expected to fail for now'
method: BreakpointHandlingTest
testMultiProcessBreakpointHandlingInSameMethod
	"This test ensures that two processes debugging the same method don't interfere with each other's breakpoints."

	| firstResult firstProcess firstProcessMethod secondResult secondProcess secondProcessMethod level frameAtLevel |
	firstProcess := self
		processBlock: [ firstResult := utility factorialOf: 10 stopAt: 6 ]
		forID: #'FirstProcess'.
	secondProcess := self
		processBlock: [ secondResult := utility factorialOf: 10 stopAt: 4 ]
		forID: #'SecondProcess'.

	"Set the breakpoint for the second process."
	self
		setMethodBreakAtStepPoint: 10
		inMethod: (BreakpointHandling compiledMethodAt: #factorialOf:stopAt:)
		forProcess: secondProcess.

	self log: 'Set up first process'.
	self advanceToControlInterruptIn: firstProcess.
	level := self firstFrameBelowHalt.
	self log: #firstProcess processEssentials: firstProcess frameLevel: level.
	frameAtLevel := firstProcess _frameContentsAt: level.
	firstProcessMethod := frameAtLevel first.
	self assert: firstProcessMethod selector equals: #'factorialOf:stopAt:'.
	self assertOneTraceEntry.
	self assertNextTraceKey: #'FirstProcess' valueClass: Halt.

	self log: 'Set up second process'.
	self advanceToControlInterruptIn: secondProcess.
	self log: #secondProcess processEssentials: secondProcess frameLevel: level.
	frameAtLevel := secondProcess _frameContentsAt: level.
	secondProcessMethod := frameAtLevel first.
	self assert: secondProcessMethod selector equals: #'factorialOf:stopAt:'.
	self assertOneTraceEntry.
	self assertNextTraceKey: #'SecondProcess' valueClass: Halt.

	"Set the breakpoint for the second process."
"	self setMethodBreakAtStepPoint: 10 inMethod: secondProcessMethod forProcess: secondProcess."

	"Finish the first process. It should not encounter the second process' breakpoint."
	self log: 'Finish first process'.
	self advanceToEndIn: firstProcess.
	self log: #firstProcess processEssentials: firstProcess frameLevel: level.

	"Run the second process to its breakpoint."
	self log: 'Advance second process to breakpoint'.
	self advanceToBreakpointIn: secondProcess.
	self log: #secondProcess processEssentials: secondProcess frameLevel: level.

	"Run the second process to its breakpoint again, to ensure it sticks around."
	self log: 'Advance second process to breakpoint'.
	self advanceToBreakpointIn: secondProcess.
	self log: #secondProcess processEssentials: secondProcess frameLevel: level.
%

category: 'tests'
method: BreakpointHandlingTest
testMultiProcessBreakpointHandlingInSameMethodAfterHalting
	"This test ensures that two processes debugging the same method don't interfere with each other's breakpoints."

	| firstResult firstProcess firstProcessMethod secondResult secondProcess secondProcessMethod level frameAtLevel |
	firstProcess := self
		processBlock: [ firstResult := utility factorialOf: 10 stopAt: 6 ]
		forID: #'FirstProcess'.
	secondProcess := self
		processBlock: [ secondResult := utility factorialOf: 10 stopAt: 4 ]
		forID: #'SecondProcess'.

	self log: 'Set up first process'.
	self advanceToControlInterruptIn: firstProcess.
	level := self firstFrameBelowHalt.
	self log: #firstProcess processEssentials: firstProcess frameLevel: level.
	frameAtLevel := firstProcess _frameContentsAt: level.
	firstProcessMethod := frameAtLevel first.
	self assert: firstProcessMethod selector equals: #'factorialOf:stopAt:'.
	self assertOneTraceEntry.
	self assertNextTraceKey: #'FirstProcess' valueClass: Halt.

	self log: 'Set up second process'.
	self advanceToControlInterruptIn: secondProcess.
	self log: #secondProcess processEssentials: secondProcess frameLevel: level.
	frameAtLevel := secondProcess _frameContentsAt: level.
	secondProcessMethod := frameAtLevel first.
	self assert: secondProcessMethod selector equals: #'factorialOf:stopAt:'.
	self assertOneTraceEntry.
	self assertNextTraceKey: #'SecondProcess' valueClass: Halt.

	"Set the breakpoint for the second process."
	self
		setMethodBreakAtStepPoint: 10
		inMethod: (BreakpointHandling compiledMethodAt: #factorialOf:stopAt:)
		forProcess: secondProcess.

	"Finish the first process. It should not encounter the second process' breakpoint."
	self log: 'Finish first process'.
	self advanceToEndIn: firstProcess.
	self log: #firstProcess processEssentials: firstProcess frameLevel: level.

	"Run the second process to its breakpoint."
	self log: 'Advance second process to breakpoint'.
	self advanceToBreakpointIn: secondProcess.
	self log: #secondProcess processEssentials: secondProcess frameLevel: level.

	"Run the second process to its breakpoint again, to ensure it sticks around."
	self log: 'Advance second process to breakpoint'.
	self advanceToBreakpointIn: secondProcess.
	self log: #secondProcess processEssentials: secondProcess frameLevel: level.
%

category: 'tests expected to fail for now'
method: BreakpointHandlingTest
testMultiProcessBreakpointHandlingInSameMethodBeforeHalting
	"This test ensures that two processes debugging the same method don't interfere with each other's breakpoints."

	| firstResult firstProcess firstProcessMethod secondResult secondProcess secondProcessMethod level frameAtLevel |
	firstProcess := self
		processBlock: [ firstResult := utility factorialOf: 10 stopAt: 6 ]
		forID: #'FirstProcess'.
	secondProcess := self
		processBlock: [ secondResult := utility factorialOf: 10 stopAt: 4 ]
		forID: #'SecondProcess'.

	"Set the breakpoint for the second process."
	self
		setMethodBreakAtStepPoint: 10
		inMethod: (BreakpointHandling compiledMethodAt: #factorialOf:stopAt:)
		forProcess: secondProcess.

	self log: 'Set up first process'.
	self advanceToControlInterruptIn: firstProcess.
	level := self firstFrameBelowHalt.
	self log: #firstProcess processEssentials: firstProcess frameLevel: level.
	frameAtLevel := firstProcess _frameContentsAt: level.
	firstProcessMethod := frameAtLevel first.
	self assert: firstProcessMethod selector equals: #'factorialOf:stopAt:'.
	self assertOneTraceEntry.
	self assertNextTraceKey: #'FirstProcess' valueClass: Halt.

	self log: 'Set up second process'.
	self advanceToControlInterruptIn: secondProcess.
	self log: #secondProcess processEssentials: secondProcess frameLevel: level.
	frameAtLevel := secondProcess _frameContentsAt: level.
	secondProcessMethod := frameAtLevel first.
	self assert: secondProcessMethod selector equals: #'factorialOf:stopAt:'.
	self assertOneTraceEntry.
	self assertNextTraceKey: #'SecondProcess' valueClass: Halt.

	"Finish the first process. It should not encounter the second process' breakpoint."
	self log: 'Finish first process'.
	self advanceToEndIn: firstProcess.
	self log: #firstProcess processEssentials: firstProcess frameLevel: level.

	"Run the second process to its breakpoint."
	self log: 'Advance second process to breakpoint'.
	self advanceToBreakpointIn: secondProcess.
	self log: #secondProcess processEssentials: secondProcess frameLevel: level.

	"Run the second process to its breakpoint again, to ensure it sticks around."
	self log: 'Advance second process to breakpoint'.
	self advanceToBreakpointIn: secondProcess.
	self log: #secondProcess processEssentials: secondProcess frameLevel: level.
%

category: 'tests expected to fail for now'
method: BreakpointHandlingTest
testMultiProcessSteppingInDifferentMethods
	"This test ensures that debugging multiple processes will faithfully honor step points in both processes."

	| factorial factorialProcess factorialMethod fibonacci fibonacciProcess fibonacciMethod level |
	factorialProcess := self
		processBlock: [ factorial := utility factorialOf: 10 stopAt: 5 ]
		forID: #'FactorialProcess'.
	fibonacciProcess := self
		processBlock: [ fibonacci := utility fibonacciGenerations: 10 stopAt: 4 ]
		forID: #'FibonacciProcess'.

	self advanceToControlInterruptIn: factorialProcess.
	level := self firstFrameBelowHalt.
	factorialMethod := (factorialProcess _frameContentsAt: level) first.
	self assert: factorialMethod selector equals: #'factorialOf:stopAt:'.
	self assertOneTraceEntry.
	self assertNextTraceKey: #'FactorialProcess' valueClass: Halt.

	self advanceToControlInterruptIn: fibonacciProcess.
	fibonacciMethod := (fibonacciProcess _frameContentsAt: level) first.
	self assert: fibonacciMethod selector equals: #'fibonacciGenerations:stopAt:'.
	self assertOneTraceEntry.
	self assertNextTraceKey: #'FibonacciProcess' valueClass: Halt.

"	self setAllStepBreaksIn: factorialMethod forProcess: factorialProcess.
	self setAllStepBreaksIn: fibonacciMethod forProcess: fibonacciProcess."
	self setStepBreakAtStepPoint: 11 inMethod: factorialMethod forProcess: factorialProcess.		"Last step point in method"
	self setStepBreakAtStepPoint: 17 inMethod: fibonacciMethod forProcess: fibonacciProcess.	"Last step point in method"

	self advanceToControlInterruptIn: factorialProcess.
	self assertOneTraceEntry.
	self assertNextTraceKey: #'FactorialProcess' valueClass: Breakpoint.

	"This next test is currently expected to fail, as the previous process cleared all step points in the gem.
	 It would work if the step points were reset here. But we want it to fail until the server is changed."
"	self setAllStepBreaksIn: fibonacciMethod forProcess: fibonacciProcess."
"	self setStepBreakAtStepPoint: 17 inMethod: fibonacciMethod forProcess: fibonacciProcess."	"Last step point in method"
	self advanceToControlInterruptIn: fibonacciProcess.
	self assertOneTraceEntry.
	self assertNextTraceKey: #'FibonacciProcess' valueClass: Breakpoint.

	self assertSuspended: factorialProcess.
	self assertSuspended: fibonacciProcess
%

category: 'tests expected to fail for now'
method: BreakpointHandlingTest
testMultiProcessSteppingInSameMethod
	"This test ensures that debugging multiple processes will faithfully honor step points in both processes."

	| firstResult firstProcess firstProcessMethod secondResult secondProcess secondProcessMethod level frameAtLevel |
	firstProcess := self
		processBlock: [ firstResult := utility factorialOf: 10 afterWaitingMS: 3000 ]
		forID: #'FirstProcess'.
	secondProcess := self
		processBlock: [ secondResult := utility factorialOf: 10 afterWaitingMS: 10 ]
		forID: #'SecondProcess'.

	self log: 'Set up first process'.
	self advanceToControlInterruptIn: firstProcess.
	level := self firstFrameBelowHalt + 1.
	self log: #firstProcess processEssentials: firstProcess frameLevel: level.
	frameAtLevel := firstProcess _frameContentsAt: level.
	firstProcessMethod := frameAtLevel first.
	self assert: firstProcessMethod selector equals: #'factorialOf:afterWaitingMS:'.
	self assertOneTraceEntry.
	self assertNextTraceKey: #'FirstProcess' valueClass: Halt.

	"Advance to the #waitMS: send."
	self stepOverInLevel: level inProcess: firstProcess.
	self log: #firstProcess processEssentials: firstProcess frameLevel: level.


	self log: 'Set up second process'.
	self advanceToControlInterruptIn: secondProcess.
	self log: #secondProcess processEssentials: secondProcess frameLevel: level.
	frameAtLevel := secondProcess _frameContentsAt: level.
	secondProcessMethod := frameAtLevel first.
	self assert: secondProcessMethod selector equals: #'factorialOf:afterWaitingMS:'.
	self assertOneTraceEntry.
	self assertNextTraceKey: #'SecondProcess' valueClass: Halt.

	"Advance to the #waitMS: send."
	self stepOverInLevel: level inProcess: secondProcess.
	self log: #secondProcess processEssentials: secondProcess frameLevel: level.

	"Start the first process stepping over the #waitMS: send (long)."
	self log: 'Step first process over #waitMS: send'.
	firstProcess
		stepOverFromLevel: level;
		resume.
	self log: #firstProcess processEssentials: firstProcess frameLevel: level.

	"Step the second process over the #waitMS: send and the second #factorialOf:stopAt: send."
	self log: 'Step second process over #waitMS: send'.
	self stepOverInLevel: level inProcess: secondProcess.
	self log: #secondProcess processEssentials: secondProcess frameLevel: level.
	self log: 'Step second process over second #factorialOf:stopAt: send'.
	self stepOverInLevel: level inProcess: secondProcess.
	self log: #secondProcess processEssentials: secondProcess frameLevel: level.

	self assert: firstResult isNil description: 'First process yielded result too soon'.
	self assert: secondResult isNil description: 'Second process yielded result too soon'.
	"Finish the second process"
	self advanceToEndIn: secondProcess.

	"Wait for the first process to finish the step (expected to fail currently)"
	self log: 'Wait for first process to finish #waitMS: send'.
	(self waitMS: 200).	"Second process used up 2x100ms waits stepping."
	self assertSuspended: firstProcess.
	self log: #firstProcess processEssentials: firstProcess frameLevel: level.

	self assert: firstResult isNil description: 'First process should not have finished to produce a result'.
	self deny: secondResult isNil description: 'Second process failed to yield a result'.
%

category: 'tests'
method: BreakpointHandlingTest
testRecursionStepOutOfFrame
	"This test ensures that debugging a recursive processes will allow stepping out of a frame to the next lower one.
	Bug 49574"

	| result processMethod level frameAtLevel initialNumberOfRecursiveFrames finalNumberOfRecursiveFrames |
	self processBlock: [ result := utility factorialOf: 10 stopAt: 4 ].

	self advanceToControlInterrupt.
	initialNumberOfRecursiveFrames := (self
		levelsWithSelector: #'factorialOf:stopAt:') size.
	level := self firstFrameBelowHalt.
	self log: #'defaultProcess' processEssentials: defaultProcess frameLevel: level.
	frameAtLevel := defaultProcess _frameContentsAt: level.
	processMethod := frameAtLevel first.
	self assert: processMethod selector equals: #'factorialOf:stopAt:'.
	self assertOneTraceEntry.
	self assertNextTraceKey: #'DefaultProcess' valueClass: Halt.	"Server bug: stepping off the end of a recursive method does not stop in the next lower frame. Process will run to completion."
	7
		timesRepeat: [ 
			self stepOverInLevel: level.
			level := self firstFrameBelowHalt + 1.
			self
				log: #'defaultProcess'
				processEssentials: defaultProcess
				frameLevel: level ].

	self assertSuspended.
	finalNumberOfRecursiveFrames := (self
		levelsWithSelector: #'factorialOf:stopAt:') size.
	self
		assert: finalNumberOfRecursiveFrames
		equals: initialNumberOfRecursiveFrames - 1
%

category: 'tests expected to fail for now'
method: BreakpointHandlingTest
testRecursionStepPointOddity
"An earlier version of testMultiProcessSteppingInSameMethod used the GsProcess for 'stepOver...' which
 doesn't actually step, just sets the step breakpoint. But it also messed up how the stack frame reported
 itself - reverted @9 line 6 to @1 line 1.
Need to recreate that specific scenario."
	"This test ensures that debugging multiple processes will faithfully honor step points in both processes."

	| result processMethod level frameAtLevel |
	self processBlock: [ result := utility factorialOf: 10 stopAt: 4 ].

	self advanceToControlInterrupt.
	level := self firstFrameBelowHalt.
	self log: #defaultProcess processEssentials: defaultProcess frameLevel: level.
	frameAtLevel := defaultProcess _frameContentsAt: level.
	processMethod := frameAtLevel first.
	self assert: processMethod selector equals: #'factorialOf:stopAt:'.
	self assertOneTraceEntry.
	self assertNextTraceKey: #'DefaultProcess' valueClass: Halt.


	"The ipOffset of deeper recursive frames should be the same."
	self assert: (defaultProcess _frameContentsAt: level+1) second equals: (defaultProcess _frameContentsAt: level+2) second.

	defaultProcess stepOverFromLevel: level.
	(self waitMS: 100).
	self assertSuspended.

	"The ipOffset shouldn't change just from setting a step point."
	self assert: (defaultProcess _frameContentsAt: level+1) second equals: (defaultProcess _frameContentsAt: level+2) second.
%

category: 'tests'
method: BreakpointHandlingTest
testStepNonLocalReturn
	"This test ensures that a step through a non-local return ends up in a reasonable place."

	| result levels numberOfLevels |
	self processBlock: [ result := utility nlr2 ].
	self advanceToHalt.
	levels := self levelsWithSelector: #'nlr2'.
	numberOfLevels := levels size.
	self assert: numberOfLevels equals: 1.
	self stepOverInLevel: levels first.	"Advance to block value"
	levels := self levelsWithSelector: #'nlr2'.
	numberOfLevels := levels size.
	self assert: numberOfLevels equals: 1.
	self stepOverInLevel: levels first.	"Advance into block, just before non-local return"
	levels := self levelsWithSelector: #'nlr2'.
	numberOfLevels := levels size.
	self assert: numberOfLevels equals: 1.
	levels := self
		levelsSelect: [ :fc | 
			| method |
			method := fc first.
			method isMethodForBlock and: [ method homeMethod selector == #'nlr2' ] ].
	numberOfLevels := levels size.
	self assert: numberOfLevels equals: 1.
	self stepOverInLevel: levels first.	"Step over non-local return"
	levels := self levelsWithSelector: #'nlr2'.
	numberOfLevels := levels size.
	self assert: numberOfLevels equals: 0. "Should have returned from home method."	
	self advanceToEnd.
	self assert: result equals: 42
%

category: 'tests'
method: BreakpointHandlingTest
testStepOverInRecursion
	"This test ensures that when you step over in a method that is on the stack multiple times (recursion)
	the step stops in the level of the step, not the topmost occuurrence of the method."

	| result factorialLevels numberOfLevels |
	self processBlock: [ result := utility factorialOf: 10 stopAt: 5 ].
	self advanceToHalt.
	factorialLevels := self levelsWithSelector: #'factorialOf:stopAt:'.
	numberOfLevels := factorialLevels size.
	self assert: numberOfLevels equals: 6.
	self stepOverInLevel: (factorialLevels at: 5).
	factorialLevels := self levelsWithSelector: #'factorialOf:stopAt:'.
	numberOfLevels := factorialLevels size.
	self assert: numberOfLevels equals: 2.
	self advanceToEnd.
	self assert: result equals: 10 factorial
%

category: 'support'
method: BreakpointHandlingTest
traceID: anID value: anObject
	trace nextPut: anID -> anObject
%

category: 'support'
method: BreakpointHandlingTest
waitMS: milliseconds
	(Delay forMilliseconds: milliseconds) wait
%

! Class implementation for 'GsCounterTest'

!		Instance methods for 'GsCounterTest'

category: 'tests'
method: GsCounterTest
testIncrementing

	| counter |
	counter := GsCounter new.
	counter increment.
	self assert: counter current equals: 1.
	counter increment.
	self assert: counter current equals: 2.
%

category: 'tests'
method: GsCounterTest
testInstanceCreation

	| counter |
	counter := GsCounter new.
	self assert: counter current equals: 0.
%

! Class implementation for 'RsrTestCase'

!		Class methods for 'RsrTestCase'

category: 'accessing'
classmethod: RsrTestCase
defaultTimeLimit
	"This is needed for Pharo"

	^5 seconds
%

category: 'testing'
classmethod: RsrTestCase
isAbstract

	^self == RsrTestCase
%

!		Instance methods for 'RsrTestCase'

category: 'asserting'
method: RsrTestCase
assert: anObject
identicalTo: bObject

	self assert: anObject == bObject
%

category: 'utilities'
method: RsrTestCase
assumption: aString
	"This method serves as a marker for assumptions made in the tests.
	Perhaps some of the senders can be removed in the future."
%

category: 'asserting'
method: RsrTestCase
deny: anObject
identicalTo: bObject

	self assert: anObject ~~ bObject
%

category: 'utilities'
method: RsrTestCase
hack: aString
	"Placeholder for things that need to be fixed"
%

category: 'utilities'
method: RsrTestCase
maximumReclamation

	self assert: RsrGarbageCollector maximumReclamation
%

category: 'running'
method: RsrTestCase
runCase

	| pm |
	pm := RsrTestingProcessModel new.
	RsrProcessModel current: pm.
	[super runCase]
		ensure:
			[RsrProcessModel resetCurrent].
	pm forkedException ifNotNil: [:ex | ex signal]
%

category: 'utilities'
method: RsrTestCase
shortWait

	(Delay forMilliseconds: 100) wait
%

! Class implementation for 'RsrAsyncMournHandlerTestCase'

!		Instance methods for 'RsrAsyncMournHandlerTestCase'

category: 'utilities'
method: RsrAsyncMournHandlerTestCase
finalizationProcess

	| proc |
	self finalizeEphemeronWithAction: [proc := Processor activeProcess].
	^proc
%

category: 'utilities'
method: RsrAsyncMournHandlerTestCase
finalizeEphemeronWithAction: aBlock

	| semaphore ephemeron |
	semaphore := Semaphore new.
	ephemeron := RsrEphemeron
		on: Object new
		mournAction:
			[aBlock value.
			semaphore signal].
	RsrGarbageCollector maximumReclamation.
	self assert: (semaphore waitForSeconds: 1)
%

category: 'initializing'
method: RsrAsyncMournHandlerTestCase
setUp

	super setUp.
	handler := RsrAsyncMournHandler current.
	handler start
%

category: 'initializing'
method: RsrAsyncMournHandlerTestCase
tearDown

	handler stop.
	super tearDown
%

category: 'running'
method: RsrAsyncMournHandlerTestCase
testAnotherAsyncHandlerExists

	| notifier |
	handler stop.
	[notifier := GsSignalingSocket newForAsyncExceptions: {GcFinalizeNotification }.
	self
		should: [handler start]
		raise: RsrNotification] ensure: [GsSignalingSocket disableAsyncExceptions].
	self
		shouldnt: [handler start]
		raise: RsrNotification
%

category: 'running'
method: RsrAsyncMournHandlerTestCase
testEnsureSingletonWhileActive

	| duplicateHandler |
	duplicateHandler := RsrAsyncMournHandler current.
	self
		assert: duplicateHandler
		identicalTo: handler
%

category: 'running'
method: RsrAsyncMournHandlerTestCase
testEnsureStarted

	| nonHandlerFinalizeProcess handlerFinalizeProcess1 handlerFinalizeProcess2 |
	handler stop.
	nonHandlerFinalizeProcess := self finalizationProcess.
	self deny: handler isActive.
	handler ensureStarted.
	self assert: handler isActive.
	handlerFinalizeProcess1 := self finalizationProcess.
	handler ensureStarted.
	self assert: handler isActive.
	handlerFinalizeProcess2 := self finalizationProcess.
	self
		deny: nonHandlerFinalizeProcess
		identicalTo: handlerFinalizeProcess1.
	self
		assert: handlerFinalizeProcess1
		identicalTo: handlerFinalizeProcess2
%

category: 'running'
method: RsrAsyncMournHandlerTestCase
testHandlerStops

	| handlerProcess mournProcess |
	handlerProcess := handler process.
	handler stop.
	mournProcess := self finalizationProcess.
	self
		deny: mournProcess
		equals: handlerProcess.
	self deny: handlerProcess isNil
%

category: 'running'
method: RsrAsyncMournHandlerTestCase
testMournEphemeron

	| mournProcess |
	mournProcess := self finalizationProcess.
	self
		assert: mournProcess
		equals: handler process
%

category: 'running'
method: RsrAsyncMournHandlerTestCase
testNewRaisesError

	self
		should: [RsrAsyncMournHandler new]
		raise: RsrError
%

! Class implementation for 'RsrClassResolverTestCase'

!		Instance methods for 'RsrClassResolverTestCase'

category: 'asserting'
method: RsrClassResolverTestCase
assert: aClassName
resolvesTo: expectedClass

	| actualClass |
	actualClass := RsrClassResolver classNamed: aClassName.
	self
		assert: actualClass
		identicalTo: expectedClass
%

category: 'running'
method: RsrClassResolverTestCase
testFailedResolution

	| actual marker |
	self
		should: [RsrClassResolver classNamed: #Xlerb]
		raise: RsrUnknownClass.
	marker := Object new.
	actual := RsrClassResolver
		classNamed: #Xlerb
		ifAbsent: [marker].
	self
		assert: actual
		identicalTo: marker
%

category: 'running'
method: RsrClassResolverTestCase
testSuccessfulResolution

	| actual |
	actual := RsrClassResolver classNamed: #Object.
	self
		assert: actual
		identicalTo: Object.
	actual := RsrClassResolver
		classNamed: #Object
		ifAbsent: [self assert: false].
	self
		assert: actual
		identicalTo: Object
%

! Class implementation for 'RsrCommandCodecTest'

!		Class methods for 'RsrCommandCodecTest'

category: 'testing'
classmethod: RsrCommandCodecTest
isAbstract

	^self == RsrCommandCodecTest
%

!		Instance methods for 'RsrCommandCodecTest'

category: 'accessing'
method: RsrCommandCodecTest
connection

	^connection
%

category: 'other'
method: RsrCommandCodecTest
decoder

	^RsrCommandDecoder new
%

category: 'accessing'
method: RsrCommandCodecTest
encoder

	^RsrCommandEncoder new
%

category: 'encode/decode'
method: RsrCommandCodecTest
encodeReferenceOf: anObject

	| reference |
	reference := RsrReference from: anObject.
	^ByteArray streamContents: [:stream | self encoder encodeReference: reference onto: stream]
%

category: 'running-symbol'
method: RsrCommandCodecTest
genericSymbol

	^#genericSymbol
%

category: 'running-symbol'
method: RsrCommandCodecTest
genericSymbolEncoding

	^#[0 0 0 0 0 0 0 0], "OID = 0"
	#[0 0 0 0 0 0 0 1], "Immediate Type = 1"
	#[0 0 0 0 0 0 0 13], "Length of UTF-8 data"
	#[103 101 110 101 114 105 99 83 121 109 98 111 108]	"#genericSymbol"
%

category: 'accessing-objects'
method: RsrCommandCodecTest
referencedServiceEncoding

	^#[0 0 0 0 0 0 0 0], "type"
	#[0 0 0 0 0 0 0 2], "referencedService's OID = 2"
	#[0 0 0 0 0 0 0 0], "Inst Var Count"
	#[0 0 0 0 0 0 0 0], "Start of service name. OID = 0"
	#[0 0 0 0 0 0 0 1], "Service name = 1 -> Symbol"
	#[0 0 0 0 0 0 0 19], "Length of UTF-8 encoded bytes"
	#[82 115 114 83 101 114 118 101 114 78 111 73 110 115 116 86 97 114 115]. "#RsrServerNoInstVars"
%

category: 'accessing-objects'
method: RsrCommandCodecTest
rootServiceEncoding

	^#[0 0 0 0 0 0 0 0], "type"
	#[0 0 0 0 0 0 0 1], "rootService's OID = 1"
	#[0 0 0 0 0 0 0 1], "Inst Var Count"
	#[0 0 0 0 0 0 0 0], "Start of service name. OID = 0"
	#[0 0 0 0 0 0 0 1], "Service name = 1 -> Symbol"
	#[0 0 0 0 0 0 0 25], "Length of UTF-8 encoded bytes"
	#[82 115 114 83 101 114 118 101 114 82 101 102 101 114 101 110 99 101 83 101 114 118 105 99 101],
	#[0 0 0 0 0 0 0 2]. "#RsrServerReferenceService"
%

category: 'running'
method: RsrCommandCodecTest
serviceNoInstVarsEncoding

	^#[0 0 0 0 0 0 0 0], "type"
	#[0 0 0 0 0 0 0 1], "rootService's OID = 1"
	#[0 0 0 0 0 0 0 0], "Inst Var Count"
	#[0 0 0 0 0 0 0 0], "Start of service name. OID = 0"
	#[0 0 0 0 0 0 0 1], "Service name = 1 -> Symbol"
	#[0 0 0 0 0 0 0 19], "Length of UTF-8 encoded bytes"
	#[82 115 114 83 101 114 118 101 114 78 111 73 110 115 116 86 97 114 115] "#RsrServerNoInstVars"
%

category: 'other'
method: RsrCommandCodecTest
setUp

	super setUp.
	connection := RsrConnection
		channel: RsrNullChannel new
		transactionSpigot: RsrThreadSafeNumericSpigot naturals
		oidSpigot: RsrThreadSafeNumericSpigot naturals.
	connection open
%

category: 'other'
method: RsrCommandCodecTest
tearDown

	connection close.
	connection := nil.
	super tearDown
%

category: 'running-immediates'
method: RsrCommandCodecTest
testArray

	| array encoding |
	array := Array
		with: self genericSymbol
		with: 5
		with: nil.
	encoding :=
		#[0 0 0 0 0 0 0 0], "Immediate Object OID"
		#[0 0 0 0 0 0 0 9], "Array type"
		#[0 0 0 0 0 0 0 3], "3 elements"
		self genericSymbolEncoding, "Generic Symbol"
		#[0 0 0 0 0 0 0 0], "Immediate OID"
		#[0 0 0 0 0 0 0 3], "Positive Integer"
		#[0 0 0 0 0 0 0 1], "num bytes"
		#[5], "5"
		#[0 0 0 0 0 0 0 0], "Immediate OID"
		#[0 0 0 0 0 0 0 6].
	self
		verifyImmediate: array
		encoding: encoding.
	array := Array new.
	encoding :=
		#[0 0 0 0 0 0 0 0], "Immediate OID"
		#[0 0 0 0 0 0 0 9], "Array type"
		#[0 0 0 0 0 0 0 0].
	self
		verifyImmediate: array
		encoding: encoding
%

category: 'running-immediates'
method: RsrCommandCodecTest
testBoolean

	| encoding |
	encoding :=
		#[0 0 0 0 0 0 0 0],
		#[0 0 0 0 0 0 0 7].
	self
		verifyImmediate: true
		encoding: encoding.
	encoding :=
		#[0 0 0 0 0 0 0 0],
		#[0 0 0 0 0 0 0 8].
	self
		verifyImmediate: false
		encoding: encoding.
%

category: 'running-immediates'
method: RsrCommandCodecTest
testByteArray

	| bytes encoding |
	bytes := #[].
	encoding :=
		#[0 0 0 0 0 0 0 0], "Immediate Object OID"
		#[0 0 0 0 0 0 0 10], "ByteArray type"
		#[0 0 0 0 0 0 0 0], "size"
		bytes.
	self
		verifyImmediate: bytes
		encoding: encoding.
	bytes := #[1 2 3 4 5].
	encoding :=
		#[0 0 0 0 0 0 0 0],
		#[0 0 0 0 0 0 0 10],
		#[0 0 0 0 0 0 0 5],
		bytes.
	self
		verifyImmediate: bytes
		encoding: encoding
%

category: 'running-immediates'
method: RsrCommandCodecTest
testCharacter

	| encoding |
	encoding :=
		#[0 0 0 0 0 0 0 0],
		#[0 0 0 0 0 0 0 5],
		#[0 0 0 0 0 0 0 0].
	self
		verifyImmediate: (Character codePoint: 0)
		encoding: encoding.
	encoding :=
		#[0 0 0 0 0 0 0 0],
		#[0 0 0 0 0 0 0 5],
		#[0 0 0 0 0 0 0 65].
	self
		verifyImmediate: (Character codePoint: 65)
		encoding: encoding.
	encoding :=
		#[0 0 0 0 0 0 0 0],
		#[0 0 0 0 0 0 0 5],
		#[0 0 0 0 0 0 0 65].
	self
		verifyImmediate: $A
		encoding: encoding.
	encoding :=
		#[0 0 0 0 0 0 0 0],
		#[0 0 0 0 0 0 0 5],
		#[0 0 0 0 0 0 1 212].
	self
		verifyImmediate: (Character codePoint: 16r01D4)
		encoding: encoding.
	encoding :=
		#[0 0 0 0 0 0 0 0],
		#[0 0 0 0 0 0 0 5],
		#[0 0 0 0 0 0 131 52].
	self
		verifyImmediate: (Character codePoint: 16r8334)
		encoding: encoding.
%

category: 'running-control words'
method: RsrCommandCodecTest
testControlWord
	
	self
		verifyControlWord: 0
		encoding: #[0 0 0 0 0 0 0 0].
	self
		verifyControlWord: 1
		encoding: #[0 0 0 0 0 0 0 1].
	self
		verifyControlWord: -1
		encoding: #[255 255 255 255 255 255 255 255].
	self
		verifyControlWord: (2 raisedTo: 63) - 1
		encoding: #[127 255 255 255 255 255 255 255].
	self
		verifyControlWord: (2 raisedTo: 63) negated
		encoding: #[128 0 0 0 0 0 0 0]
%

category: 'running-immediates'
method: RsrCommandCodecTest
testDateTime

	| dt encoding |
	dt := RsrDateAndTime posixEpoch.
	encoding :=
		#[0 0 0 0 0 0 0 0],
		#[0 0 0 0 0 0 0 14],
		#[0 0 0 0 0 0 0 0].
	self
		verifyImmediate: dt
		encoding: encoding.
	dt := RsrDateAndTime fromMicroseconds: 1562692562657612. "2019-07-09T10:16:02.657612-07:00"
	encoding :=
		#[0 0 0 0 0 0 0 0],
		#[0 0 0 0 0 0 0 14],
		#[0 5 141 66 183 23 33 76].
	self
		verifyImmediate: dt
		encoding: encoding.
	dt := RsrDateAndTime fromMicroseconds: -1000000. "1969-12-31T23:59:59-00:00"
	encoding :=
		#[0 0 0 0 0 0 0 0],
		#[0 0 0 0 0 0 0 14],
		#[255 255 255 255 255 240 189 192].
	self
		verifyImmediate: dt
		encoding: encoding.
	dt := RsrDateAndTime fromMicroseconds: -491277642567488. "1954-06-07T14:59:17.432512-07:00"
	encoding :=
		#[0 0 0 0 0 0 0 0],
		#[0 0 0 0 0 0 0 14],
		#[255 254 65 47 130 160 240 192].
	self
		verifyImmediate: dt
		encoding: encoding
%

category: 'running-immediates'
method: RsrCommandCodecTest
testDictionary

	| dictionary encoding result |
	dictionary := Dictionary new.
	encoding :=
		#[0 0 0 0 0 0 0 0], "Immediate Object OID"
		#[0 0 0 0 0 0 0 13], "Dictionary type"
		#[0 0 0 0 0 0 0 0]. "0 associations"
	self
		verifyImmediate: dictionary
		encoding: encoding.
	dictionary := Dictionary new
		at: 1 put: self genericSymbol;
		at: false put: true;
		yourself.
	encoding := self encodeReferenceOf: dictionary.
	result := (self decoder decodeReference: encoding readStream) resolve: self connection.
	self
		assert: result
		equals: dictionary.
	self
		deny: result
		identicalTo: dictionary.
	"self hack: 'Order is not guaranteed in a dictionary'.
	encoding :=
		#[0 0 0 0 0 0 0 0], ""Immediate OID""
		#[0 0 0 0 0 0 0 13], ""Dictionary Type""
		#[0 0 0 0 0 0 0 2], ""Two assocs""
		#[0 0 0 0 0 0 0 0], ""nil""
		#[0 0 0 0 0 0 0 6],
		#[0 0 0 0 0 0 0 0], ""true""
		#[0 0 0 0 0 0 0 7],
		#[0 0 0 0 0 0 0 0], ""Integer 1""
		#[0 0 0 0 0 0 0 3],
		#[0 0 0 0 0 0 0 1],
		#[1],
		self genericSymbolEncoding.
	self
		verifyImmediate: dictionary
		encoding: encoding"
%

category: 'running-immediates'
method: RsrCommandCodecTest
testDouble

	| encoding |
	encoding :=
		#[0 0 0 0 0 0 0 0],
		#[0 0 0 0 0 0 0 15],
		#[128 0 0 0 0 0 0 0].
	self
		verifyImmediate: -0.0
		encoding: encoding.
	encoding :=
		#[0 0 0 0 0 0 0 0],
		#[0 0 0 0 0 0 0 15],
		#[0 0 0 0 0 0 0 0].
	self
		verifyImmediate: 0.0
		encoding: encoding.
	encoding :=
		#[0 0 0 0 0 0 0 0],
		#[0 0 0 0 0 0 0 15],
		#[191 240 0 0 0 0 0 0].
	self
		verifyImmediate: -1.0
		encoding: encoding.
	encoding :=
		#[0 0 0 0 0 0 0 0],
		#[0 0 0 0 0 0 0 15],
		#[63 240 0 0 0 0 0 0].
	self
		verifyImmediate: 1.0
		encoding: encoding.
	encoding :=
		#[0 0 0 0 0 0 0 0],
		#[0 0 0 0 0 0 0 15],
		#[63 185 153 153 153 153 153 154].
	self
		verifyImmediate: 0.1
		encoding: encoding.
	encoding :=
		#[0 0 0 0 0 0 0 0],
		#[0 0 0 0 0 0 0 15],
		#[191 185 153 153 153 153 153 154].
	self
		verifyImmediate: -0.1
		encoding: encoding.
	encoding :=
		#[0 0 0 0 0 0 0 0],
		#[0 0 0 0 0 0 0 15],
		#[127 240 0 0 0 0 0 0].
	self
		verifyImmediate: RsrDoubleReference infinity
		encoding: encoding
%

category: 'running-immediates'
method: RsrCommandCodecTest
testInteger

	| encoding |
	encoding :=
		#[0 0 0 0 0 0 0 0],
		#[0 0 0 0 0 0 0 3],
		#[0 0 0 0 0 0 0 1],
		#[0].
	self
		verifyImmediate: 0
		encoding: encoding.
	encoding :=
		#[0 0 0 0 0 0 0 0],
		#[0 0 0 0 0 0 0 3],
		#[0 0 0 0 0 0 0 1],
		#[4].
	self
		verifyImmediate: 4
		encoding: encoding.
	encoding :=
		#[0 0 0 0 0 0 0 0],
		#[0 0 0 0 0 0 0 3],
		#[0 0 0 0 0 0 0 5],
		#[1 15 248 235 121].
	self
		verifyImmediate: 4562938745
		encoding: encoding.
	encoding :=
		#[0 0 0 0 0 0 0 0],
		#[0 0 0 0 0 0 0 4],
		#[0 0 0 0 0 0 0 5],
		#[1 15 248 235 121].
	self
		verifyImmediate: -4562938745
		encoding: encoding.
	encoding :=
		#[0 0 0 0 0 0 0 0],
		#[0 0 0 0 0 0 0 3],
		#[0 0 0 0 0 0 0 13],
		#[10 101 181 177 179 46 128 92 96 64 190 76 107].
	self
		verifyImmediate: 823759265872134912569713249387
		encoding: encoding.
	encoding :=
		#[0 0 0 0 0 0 0 0],
		#[0 0 0 0 0 0 0 4],
		#[0 0 0 0 0 0 0 13],
		#[10 101 181 177 179 46 128 92 96 64 190 76 107].
	self
		verifyImmediate: -823759265872134912569713249387
		encoding: encoding.
%

category: 'running-immediates'
method: RsrCommandCodecTest
testNil

	| encoding |
	encoding :=
		#[0 0 0 0 0 0 0 0],
		#[0 0 0 0 0 0 0 6].
	self
		verifyImmediate: nil
		encoding: encoding
%

category: 'running-immediates'
method: RsrCommandCodecTest
testOrderedCollection

	| oc encoding |
	oc := OrderedCollection new.
	encoding :=
		#[0 0 0 0 0 0 0 0], "Immediate OID"
		#[0 0 0 0 0 0 0 12], "OrderedCollection type"
		#[0 0 0 0 0 0 0 0].
	self
		verifyImmediate: oc
		encoding: encoding.
	oc := OrderedCollection
		with: self genericSymbol
		with: 5
		with: nil.
	encoding :=
		#[0 0 0 0 0 0 0 0], "Immediate Object OID"
		#[0 0 0 0 0 0 0 12], "OrderedCollection type"
		#[0 0 0 0 0 0 0 3], "3 elements"
		self genericSymbolEncoding, "Generic Symbol"
		#[0 0 0 0 0 0 0 0], "Immediate OID"
		#[0 0 0 0 0 0 0 3], "Positive Integer"
		#[0 0 0 0 0 0 0 1], "num bytes"
		#[5], "5"
		#[0 0 0 0 0 0 0 0], "Immediate OID"
		#[0 0 0 0 0 0 0 6].
	self
		verifyImmediate: oc
		encoding: encoding
%

category: 'running-immediates'
method: RsrCommandCodecTest
testSet

	| set encoding result |
	set := Set new.
	encoding :=
		#[0 0 0 0 0 0 0 0], "OID"
		#[0 0 0 0 0 0 0 11], "Set"
		#[0 0 0 0 0 0 0 0]. "0 elements"
	self
		verifyImmediate: set
		encoding: encoding.
	set := Set
		with: true
		with: nil.
	encoding := self encodeReferenceOf: set.
	result := (self decoder decodeReference: encoding readStream) resolve: self connection.
	self
		assert: result
		equals: set.
	self
		deny: result
		identicalTo: set.
	"self hack: 'Hashed collections do not have an ordering'.
	encoding :=
		#[0 0 0 0 0 0 0 0], ""OID""
		#[0 0 0 0 0 0 0 11], ""Set""
		#[0 0 0 0 0 0 0 2], ""2 elements""
		#[0 0 0 0 0 0 0 0], ""true""
		#[0 0 0 0 0 0 0 7],
		#[0 0 0 0 0 0 0 0], ""nil""
		#[0 0 0 0 0 0 0 6].
	self
		verifyImmediate: set
		encoding: encoding"
%

category: 'running-symbol'
method: RsrCommandCodecTest
testString

	| encoding |
	encoding :=
		#[0 0 0 0 0 0 0 0], "OID = 0"
		#[0 0 0 0 0 0 0 2], "Immediate Type = 2"
		#[0 0 0 0 0 0 0 0], "length"
		#[].	 "empty string"
	self
		verifyImmediate: ''
		encoding: encoding.
	encoding :=
		#[0 0 0 0 0 0 0 0], "OID = 0"
		#[0 0 0 0 0 0 0 2], "Immediate Type = 2"
		#[0 0 0 0 0 0 0 13], "length"
		#[103 101 110 101 114 105 99 83 116 114 105 110 103].	 "genericString"
	self
		verifyImmediate: 'genericString'
		encoding: encoding
%

category: 'running-symbol'
method: RsrCommandCodecTest
testSymbol

	self
		verifyImmediate: self genericSymbol
		encoding: self genericSymbolEncoding
%

category: 'asserting'
method: RsrCommandCodecTest
verifyControlWord: anInteger
encoding: bytes

	self subclassResponsibility
%

category: 'asserting'
method: RsrCommandCodecTest
verifyImmediate: anImmediateObject
encoding: encoding

	self subclassResponsibility
%

! Class implementation for 'RsrCommandDecoderTest'

!		Instance methods for 'RsrCommandDecoderTest'

category: 'asserting'
method: RsrCommandDecoderTest
assertReference: bytes
decodesTo: expected

	| actual |
	actual := self decodeReference: bytes.
	self
		assert: actual
		equals: expected
%

category: 'decoding'
method: RsrCommandDecoderTest
decodeReference: bytes

	^(self decoder decodeReference: bytes readStream) resolve: self connection
%

category: 'decoding'
method: RsrCommandDecoderTest
decodeService: anObjectBytes

	^(self decoder decodeServiceSnapshot: anObjectBytes readStream) reifyIn: self connection
%

category: 'running'
method: RsrCommandDecoderTest
testDeliverResponse

	| service response encoding command decodedService |
	service := RsrServerNoInstVars new.
	self connection _ensureRegistered: service.
	response := #responseSymbol.
	encoding :=
		#[0 0 0 0 0 0 0 2], "DeliverResponse Command"
		#[0 0 0 0 0 0 0 1], "Transaction Id"
		#[0 0 0 0 0 0 0 1], "Number of services"
		self serviceNoInstVarsEncoding,
		#[0 0 0 0 0 0 0 0], "Service Name Symbol Reference"
		#[0 0 0 0 0 0 0 1], "Object Type for Symbol"
		#[0 0 0 0 0 0 0 14], "Length of UTF-8 bytes"
		#[114 101 115 112 111 110 115 101 83 121 109 98 111 108]. "#responseSymbol"
	command := self decoder decodeCommand: encoding readStream.
	self
		assert: command class
		equals: RsrDeliverResponse.
	self
		assert: command transaction
		equals: 1.
	self
		assert: command snapshots size
		equals: 1.
	decodedService := command snapshots first reifyIn: self connection.
	self
		assert: decodedService
		equals: service.
	self
		assert: (command response resolve: self connection)
		equals: response
%

category: 'running'
method: RsrCommandDecoderTest
testReleaseServices

	| command encoding |
	encoding :=
		#[0 0 0 0 0 0 0 3], "ReleaseObjects Command"
		#[0 0 0 0 0 0 0 5], "Num OIDS"
		#[0 0 0 0 0 0 0 1], "First OID"
		#[0 0 0 0 0 0 0 2],
		#[0 0 0 0 0 0 0 3],
		#[0 0 0 0 0 0 0 4],
		#[0 0 0 0 0 0 0 5]. "Last OID"
	command := self decoder decodeCommand: encoding readStream.
	self
		assert: command sids
		equals: #(1 2 3 4 5)
%

category: 'running'
method: RsrCommandDecoderTest
testSendMessage

	| service encoding command |
	service := RsrServerNoInstVars new.
	self connection _ensureRegistered: service.
	encoding :=
		#[0 0 0 0 0 0 0 1], "SendMessage Command"
		#[0 0 0 0 0 0 0 1], "Transaction ID"
		#[0 0 0 0 0 0 0 1], "One service is part of this message"
		self serviceNoInstVarsEncoding,
		#[0 0 0 0 0 0 0 1], "Receiver OID"
		#[0 0 0 0 0 0 0 0], "Selector Reference"
		#[0 0 0 0 0 0 0 1], "Object Type for Symbol"
		#[0 0 0 0 0 0 0 8], "Length of UTF-8 bytes"
		#[114 101 116 117 114 110 52 50], "#return42"
		#[0 0 0 0 0 0 0 0]. "Argument Count"
	command := self decoder decodeCommand: encoding readStream.
	self
		assert: command class
		equals: RsrSendMessage.
	self
		assert: command transaction
		equals: 1.
	self
		assert: (command receiverReference resolve: self connection)
		identicalTo: service.
	self
		assert: (command selectorReference resolve: self connection)
		identicalTo: #return42.
	self
		assert: command argumentReferences
		equals: #().
	self
		assert: command snapshots size
		equals: 1
%

category: 'running'
method: RsrCommandDecoderTest
testServiceDecodeIdentity
	"Ensure that decoding an object multiple times results in
	a single object getting created."

	| firstService secondService |
	firstService := self decodeService: self serviceNoInstVarsEncoding.
	secondService := self decodeService: self serviceNoInstVarsEncoding.
	self
		assert: firstService
		identicalTo: secondService
%

category: 'running'
method: RsrCommandDecoderTest
testServiceNoInstVars

	| decodedService |
	decodedService := self decodeService: self serviceNoInstVarsEncoding.
	self
		assert: decodedService class
		equals: RsrServerNoInstVars.
	self
		assert: decodedService _id
		equals: 1
%

category: 'running'
method: RsrCommandDecoderTest
testServiceReferenceService

	| rootService referencedService |
	referencedService := self decodeService: self referencedServiceEncoding.
	self
		assert: referencedService class
		equals: RsrServerNoInstVars.
	self
		assert: referencedService _id
		equals: 2.
	rootService := self decodeService: self rootServiceEncoding.
	self
		assert: rootService class
		equals: RsrServerReferenceService.
	self
		assert: rootService service
		equals: referencedService
%

category: 'asserting'
method: RsrCommandDecoderTest
verifyControlWord: expected
encoding: bytes

	| actual |
	actual := self decoder decodeControlWord: bytes readStream.
	self
		assert: actual
		equals: expected
%

category: 'asserting'
method: RsrCommandDecoderTest
verifyImmediate: expected
encoding: encoding

	| actual |
	actual := (self decoder decodeReference: encoding readStream) resolve: self connection.
	self
		assert: actual
		equals: expected
%

! Class implementation for 'RsrCommandEncoderTest'

!		Instance methods for 'RsrCommandEncoderTest'

category: 'other'
method: RsrCommandEncoderTest
register: aService

	self connection _ensureRegistered: aService
%

category: 'running-immediates'
method: RsrCommandEncoderTest
testDeliverResponse

	| service response command result expectedEncoding |
	service := RsrClientNoInstVars new.
	self register: service.
	response := #responseSymbol.
	command := RsrDeliverResponse
		transaction: 1
		responseReference: (RsrReference from: response)
		snapshots: (Array with: (RsrServiceSnapshot from: service)).
	result := self encoder encodeDeliverResponse: command.
	expectedEncoding :=
		#[0 0 0 0 0 0 0 2], "DeliverResponse Command"
		#[0 0 0 0 0 0 0 1], "Transaction Id"
		#[0 0 0 0 0 0 0 1], "One service is part of this response"
		self serviceNoInstVarsEncoding,
		#[0 0 0 0 0 0 0 0], "Service Name Symbol Reference"
		#[0 0 0 0 0 0 0 1], "Object Type for Symbol"
		#[0 0 0 0 0 0 0 14], "Length of UTF-8 bytes"
		#[114 101 115 112 111 110 115 101 83 121 109 98 111 108]. "#responseSymbol"
	self
		assert: result
		equals: expectedEncoding
%

category: 'running'
method: RsrCommandEncoderTest
testNaN

	| encoding |
	"Signaling NaN is not tested.
	Negative NaN is not tested."
	encoding :=
		#[0 0 0 0 0 0 0 0],
		#[0 0 0 0 0 0 0 15],
		#[255 248 0 0 0 0 0 0].
	self
		verifyImmediate: RsrDoubleReference nan
		encoding: encoding.
%

category: 'running-immediates'
method: RsrCommandEncoderTest
testReleaseServices

	| command result expectedEncoding |
	command := RsrReleaseServices sids: #(1 2 3 4 5).
	result := self encoder encodeReleaseServices: command.
	expectedEncoding :=
		#[0 0 0 0 0 0 0 3], "ReleaseObjects Command"
		#[0 0 0 0 0 0 0 5], "Num OIDS"
		#[0 0 0 0 0 0 0 1], "First OID"
		#[0 0 0 0 0 0 0 2],
		#[0 0 0 0 0 0 0 3],
		#[0 0 0 0 0 0 0 4],
		#[0 0 0 0 0 0 0 5]. "Last OID"
	self
		assert: result
		equals: expectedEncoding
%

category: 'running-immediates'
method: RsrCommandEncoderTest
testSendMessage

	| service analysis command result expectedEncoding |
	service := RsrClientNoInstVars new.
	self register: service.
	analysis := RsrSnapshotAnalysis
		roots: (Array with: service)
		connection: self connection.
	analysis perform.
	command := RsrSendMessage
		transaction: 1
		receiverReference: (RsrReference from: service)
		selectorReference: (RsrSymbolReference from: #return42)
		argumentReferences: #().
	command snapshots: analysis snapshots.
	result := self encoder encodeSendMessage: command.
	expectedEncoding :=
		#[0 0 0 0 0 0 0 1], "SendMessage Command"
		#[0 0 0 0 0 0 0 1], "Transaction ID"
		#[0 0 0 0 0 0 0 1], "One service is part of this message"
		self serviceNoInstVarsEncoding,
		#[0 0 0 0 0 0 0 1], "Receiver OID"
		#[0 0 0 0 0 0 0 0], "Selector Reference"
		#[0 0 0 0 0 0 0 1], "Object Type for Symbol"
		#[0 0 0 0 0 0 0 8], "Length of UTF-8 bytes"
		#[114 101 116 117 114 110 52 50], "#return42"
		#[0 0 0 0 0 0 0 0]. "Argument Count"
	self
		assert: result
		equals: expectedEncoding
%

category: 'running'
method: RsrCommandEncoderTest
testServiceNoInstVars

	| rootService encodedBytes expectedEncoding |
	rootService := RsrClientNoInstVars new.
	self register: rootService.
	encodedBytes := self encoder encodeServiceSnapshot: (RsrServiceSnapshot from: rootService).
	expectedEncoding := self serviceNoInstVarsEncoding.
	self
		assert: encodedBytes
		equals: expectedEncoding
%

category: 'running'
method: RsrCommandEncoderTest
testServiceReferenceService

	| rootService referencedService encodedObject expectedEncoding |
	referencedService := RsrClientNoInstVars new.
	rootService := RsrClientReferenceService service: referencedService.
	self
		register: rootService;
		register: referencedService.
	encodedObject := self encoder encodeServiceSnapshot: (RsrServiceSnapshot from: rootService).
	expectedEncoding :=
		#[0 0 0 0 0 0 0 0], "type"
		#[0 0 0 0 0 0 0 1], "rootService's OID = 1"
		#[0 0 0 0 0 0 0 1], "Inst Var Count"
		#[0 0 0 0 0 0 0 0], "Start of service name. OID = 0"
		#[0 0 0 0 0 0 0 1], "Service name = 1 -> Symbol"
		#[0 0 0 0 0 0 0 25], "Length of UTF-8 encoded bytes"
		#[82 115 114 83 101 114 118 101 114 82 101 102 101 114 101 110 99 101 83 101 114 118 105 99 101],
		#[0 0 0 0 0 0 0 2]. "#RsrServerReferenceService"
	self
		assert: encodedObject
		equals: expectedEncoding.
	encodedObject := self encoder encodeServiceSnapshot: (RsrServiceSnapshot from: referencedService).
	expectedEncoding :=
		#[0 0 0 0 0 0 0 0], "type"
		#[0 0 0 0 0 0 0 2], "referencedService's OID = 2"
		#[0 0 0 0 0 0 0 0], "Inst Var Count"
		#[0 0 0 0 0 0 0 0], "Start of service name. OID = 0"
		#[0 0 0 0 0 0 0 1], "Service name = 1 -> Symbol"
		#[0 0 0 0 0 0 0 19], "Length of UTF-8 encoded bytes"
		#[82 115 114 83 101 114 118 101 114 78 111 73 110 115 116 86 97 114 115]. "#RsrServerNoInstVars"
	self
		assert: encodedObject
		equals: expectedEncoding
%

category: 'running'
method: RsrCommandEncoderTest
testUnsupportedObject

	self
		should: [self encoder encodeReference: (RsrReference from: Object new) onto: (WriteStream on: ByteArray new)]
		raise: RsrUnsupportedObject
%

category: 'running-immediates'
method: RsrCommandEncoderTest
verifyControlWord: anInteger
encoding: expected

	| actual |
	actual := ByteArray streamContents: [:stream | self encoder encodeControlWord: anInteger onto: stream].
	self
		assert: actual
		equals: expected
%

category: 'running-immediates'
method: RsrCommandEncoderTest
verifyImmediate: anObject
encoding: expected

	| actual |
	actual := ByteArray streamContents: [:stream | self encoder encodeReference: (RsrReference from: anObject) onto: stream].
	self
		assert: actual
		equals: expected
%

! Class implementation for 'RsrConnectionSpecificationTestCase'

!		Instance methods for 'RsrConnectionSpecificationTestCase'

category: 'accessing'
method: RsrConnectionSpecificationTestCase
alternativeLocalhost

	^'127.0.1.1'
%

category: 'accessing'
method: RsrConnectionSpecificationTestCase
localhost

	^'127.0.0.1'
%

category: 'accessing'
method: RsrConnectionSpecificationTestCase
port

	^47652
%

category: 'running'
method: RsrConnectionSpecificationTestCase
testAcceptOnLocalhost

	| acceptor initiator semaphore connectionA connectionB |
	acceptor := RsrAcceptConnection
		host: self localhost 
		port: self port.
	initiator := RsrInitiateConnection
		host: self localhost
		port: self port.
	semaphore := Semaphore new.
	RsrProcessModel
		fork: [[connectionA := acceptor waitForConnection] ensure: [semaphore signal]] named: 'Pending AcceptConnection';
		fork: [[connectionB := initiator connect] ensure: [semaphore signal]] named: 'Pending InitiateConnection'.
	semaphore wait; wait.
	self
		assert: connectionA isOpen;
		assert: connectionB isOpen.
	connectionA close.
	connectionB close
%

category: 'running'
method: RsrConnectionSpecificationTestCase
testBindToWildcardPort

	| acceptor initiator semaphore connectionA connectionB |
	acceptor := RsrAcceptConnection
		host: self localhost
		port: RsrAcceptConnection wildcardPort.
	acceptor ensureListening.
	self assert: acceptor listeningPort > 0.
	initiator := RsrInitiateConnection
		host: self localhost
		port: acceptor listeningPort.
	semaphore := Semaphore new.
	RsrProcessModel
		fork: [[connectionA := acceptor waitForConnection] ensure: [semaphore signal]] named: 'Pending AcceptConnection';
		fork: [[connectionB := initiator connect] ensure: [semaphore signal]] named: 'Pending InitiateConnection'.
	semaphore wait; wait.
	self
		assert: connectionA isOpen;
		assert: connectionB isOpen.
	connectionA close.
	connectionB close
%

category: 'running'
method: RsrConnectionSpecificationTestCase
testCancelWaitForConnection

	| acceptor |
	acceptor := RsrAcceptConnection port: self port.
	RsrProcessModel
		fork: [(Delay forSeconds: 1) wait. acceptor cancelWaitForConnection]
		named: 'Canceling AcceptConnection'.
	self
		should: [acceptor waitForConnection]
		raise: RsrWaitForConnectionCancelled
%

category: 'running'
method: RsrConnectionSpecificationTestCase
testEstablishConnection

	| acceptor initiator semaphore connectionA connectionB |
	acceptor := RsrAcceptConnection port: self port.
	initiator := RsrInitiateConnection
		host: self localhost
		port: self port.
	semaphore := Semaphore new.
	RsrProcessModel
		fork: [[connectionA := acceptor waitForConnection] ensure: [semaphore signal]] named: 'Pending AcceptConnection';
		fork: [[connectionB := initiator connect] ensure: [semaphore signal]] named: 'Pending InitiateConnection'.
	semaphore wait; wait.
	self
		assert: connectionA isOpen;
		assert: connectionB isOpen.
	connectionA close.
	connectionB close
%

category: 'running'
method: RsrConnectionSpecificationTestCase
testFailedAcceptOnAlternativeLocalhost

	| acceptor initiator semaphore |
	acceptor := RsrAcceptConnection
		host: self alternativeLocalhost
		port: self port.
	initiator := RsrInitiateConnection
		host: self localhost
		port: self port.
	semaphore := Semaphore new.
	RsrProcessModel
		fork: [[semaphore signal. acceptor waitForConnection] on: RsrWaitForConnectionCancelled do: [:ex | ex return]]
		named: 'Pending WaitForConnectionCancelled'.
	[semaphore wait.
	self
		should: [initiator connect]
		raise: RsrSocketError]
			ensure: [acceptor cancelWaitForConnection]
%

category: 'running'
method: RsrConnectionSpecificationTestCase
testInternalConnectionSpecificationConnectReturnsConnection
	"Ensure that sending #connect to an InternalConnectionSpecification
	results in returning one of the created Connections."

	| spec connection |
	spec := RsrInMemoryConnectionSpecification new.
	connection := spec connect.
	self assert: connection isOpen.
	connection close.
	spec := RsrInternalSocketConnectionSpecification new.
	connection := spec connect.
	self assert: connection isOpen.
	connection close
%

category: 'running'
method: RsrConnectionSpecificationTestCase
testListenThenLaterAccept

	| acceptor initiator semaphore connectionA connectionB |
	acceptor := RsrAcceptConnection
		host: self localhost 
		port: self port.
	initiator := RsrInitiateConnection
		host: self localhost
		port: self port.
	semaphore := Semaphore new.
	acceptor ensureListening.
	RsrProcessModel
		fork: [semaphore signal. [connectionB := initiator connect] ensure: [semaphore signal]]
		named: 'Pending InitiateConnection'.
	semaphore wait.
	connectionA := acceptor waitForConnection.
	semaphore wait.
	self
		assert: connectionA isOpen;
		assert: connectionB isOpen.
	connectionA close.
	connectionB close
%

! Class implementation for 'RsrForwarderTest'

!		Instance methods for 'RsrForwarderTest'

category: 'running'
method: RsrForwarderTest
testForwarding
	"This test needs to be improved. It is out of sync."

	| service id connection forwarder sendMessage |
	service := RsrTestService clientClass new.
	id := 1.
	connection := RsrConnection
		channel: RsrNullChannel new
		transactionSpigot: RsrThreadSafeNumericSpigot naturals
		oidSpigot: RsrThreadSafeNumericSpigot naturals.
	connection open.
	service registerWith: connection.
	forwarder := service remoteSelf.
	forwarder
		arg1: 15
		arg2: 42.
	sendMessage := connection channel lastCommand.
	self
		assert: sendMessage transaction
		equals: 1.
	self
		assert: (sendMessage receiverReference resolve: connection)
		equals: service.
	self
		assert: (sendMessage selectorReference resolve: connection)
		equals: #arg1:arg2:.
	self
		assert: (sendMessage argumentReferences collect: [:each | each resolve: connection])
		equals: #(15 42).
%

! Class implementation for 'RsrGarbageCollectorTestCase'

!		Instance methods for 'RsrGarbageCollectorTestCase'

category: 'running'
method: RsrGarbageCollectorTestCase
testMaximumReclamation

	self assert: RsrGarbageCollector maximumReclamation
%

! Class implementation for 'RsrNumericSpigotTest'

!		Instance methods for 'RsrNumericSpigotTest'

category: 'accessing'
method: RsrNumericSpigotTest
spigotClass

	^RsrNumericSpigot
%

category: 'running'
method: RsrNumericSpigotTest
testDefault

	| spigot |
	spigot := self spigotClass new.
	self
		assert: spigot next
		equals: 0.
	self
		assert: spigot next
		equals: 1
%

category: 'running'
method: RsrNumericSpigotTest
testFloat

	| spigot |
	spigot := self spigotClass
		start: 0
		step: 0.5.
	self
		assert: spigot next
		equals: 0.
	self
		assert: spigot next
		equals: 0.5.
	self
		assert: spigot next
		equals: 1.0.
%

category: 'running'
method: RsrNumericSpigotTest
testNaturals

	| spigot |
	spigot := self spigotClass naturals.
	self
		assert: spigot next
		equals: 1.
	self
		assert: spigot next
		equals: 2
%

category: 'running'
method: RsrNumericSpigotTest
testNegativeStep

	| spigot |
	spigot := self spigotClass
		start: 0
		step: -1.
	self
		assert: spigot next
		equals: 0.
	self
		assert: spigot next
		equals: -1.
	self
		assert: spigot next
		equals: -2
%

category: 'running'
method: RsrNumericSpigotTest
testNext

	| spigot |
	spigot := self spigotClass naturals.
	self
		assert: (Array with: 1 with: 2 with: 3)
		equals: (spigot next: 3)
%

! Class implementation for 'RsrThreadSafeNumericSpigotTest'

!		Instance methods for 'RsrThreadSafeNumericSpigotTest'

category: 'accessing'
method: RsrThreadSafeNumericSpigotTest
spigotClass

	^RsrThreadSafeNumericSpigot
%

! Class implementation for 'RsrPromiseTest'

!		Instance methods for 'RsrPromiseTest'

category: 'running'
method: RsrPromiseTest
testAsyncBreak

	| promise semaphore expected whenRan first second third |
	promise := RsrPromise new.
	semaphore := Semaphore new.
	expected := Object new.
	whenRan := false.
	promise
		when: [:object | whenRan := true. semaphore signal]
		catch: [:reason | first := reason. semaphore signal].
	promise
		when: [:object | whenRan := true. semaphore signal]
		catch: [:reason | second := reason. semaphore signal].
	self
		deny: promise isResolved;
		deny: promise isBroken;
		deny: promise isFulfilled.
	promise break: expected.
	self
		assert: promise isResolved;
		assert: promise isBroken;
		deny: promise isFulfilled.
	semaphore wait; wait.
	self shortWait. "Ensure any when blocks run if they are going to schedule."
	self deny: whenRan.
	self
		assert: first
		identicalTo: expected.
	self
		assert: second
		identicalTo: expected.
	promise
		when: [:object | whenRan := true. semaphore signal]
		catch: [:reason | third := reason. semaphore signal].
	semaphore wait.
	self shortWait.
	self deny: whenRan.
	self
		assert: third
		identicalTo: expected
%

category: 'running'
method: RsrPromiseTest
testAsyncFulfill

	| promise semaphore expected catchRan first second third |
	promise := RsrPromise new.
	semaphore := Semaphore new.
	expected := Object new.
	catchRan := false.
	promise
		when: [:object | first := object. semaphore signal]
		catch: [:reason | catchRan := true. semaphore signal].
	promise
		when: [:object | second := object. semaphore signal]
		catch: [:reason | catchRan := true. semaphore signal].
	self
		deny: promise isResolved;
		deny: promise isBroken;
		deny: promise isFulfilled.
	promise fulfill: expected.
	self
		assert: promise isResolved;
		deny: promise isBroken;
		assert: promise isFulfilled.
	semaphore wait; wait.
	self shortWait. "Ensure any catch blocks run if they are going to schedule."
	self deny: catchRan.
	self
		assert: first
		identicalTo: expected.
	self
		assert: second
		identicalTo: expected.
	promise
		when: [:object | third := object. semaphore signal]
		catch: [:reason | catchRan := true. semaphore signal].
	semaphore wait.
	self shortWait.
	self deny: catchRan.
	self
		assert: third
		identicalTo: expected
%

category: 'running'
method: RsrPromiseTest
testSyncBreak

	| promise expected exceptionRaised first second third |
	promise := RsrPromise new.
	expected := Object new.
	exceptionRaised := false.
	RsrProcessModel
		fork: [[promise wait] on: RsrBrokenPromise do: [:ex | exceptionRaised := true. first := ex reason. ex return]]
		named: 'Pending BrokenPromise'.
	RsrProcessModel
		fork: [[promise wait] on: RsrBrokenPromise do: [:ex | exceptionRaised := true. second := ex reason. ex return]]
		named: 'Pending BrokenPromise'.
	promise break: expected.
	self shortWait. "Allow results to process."
	self assert: exceptionRaised.
	self
		assert: first
		identicalTo: expected.
	self
		assert: second
		identicalTo: expected.
	self
		should: [promise wait]
		raise: RsrBrokenPromise.
	third := [promise wait]
		on: RsrBrokenPromise
		do: [:ex | ex return: ex reason].
	self
		assert: third
		identicalTo: expected
%

category: 'running'
method: RsrPromiseTest
testSyncFulfill

	| promise expected exceptionRaised first second |
	promise := RsrPromise new.
	expected := Object new.
	exceptionRaised := false.
	RsrProcessModel
		fork: [[first := promise wait] on: RsrBrokenPromise do: [:ex | exceptionRaised := true. ex return]]
		named: 'Pending BrokenPromise'.
	RsrProcessModel
		fork: [[second := promise wait] on: RsrBrokenPromise do: [:ex | exceptionRaised := true. ex return]]
		named: 'Pending BrokenPromise'.
	promise fulfill: expected.
	self shortWait. "Allow results to process."
	self deny: exceptionRaised.
	self
		assert: first
		identicalTo: expected.
	self
		assert: second
		identicalTo: expected.
	self
		assert: promise wait
		identicalTo: expected
%

! Class implementation for 'RsrProtocolVersionNegotiationCodecTestCase'

!		Instance methods for 'RsrProtocolVersionNegotiationCodecTestCase'

category: 'accessing'
method: RsrProtocolVersionNegotiationCodecTestCase
codec

	^RsrProtocolVersionNegotiationCodec new
%

category: 'utilities'
method: RsrProtocolVersionNegotiationCodecTestCase
stream: aBlock

	^ByteArray streamContents: [:stream | aBlock value: stream]
%

category: 'running'
method: RsrProtocolVersionNegotiationCodecTestCase
testChosenVersion

	| chosenVersion encoding result |
	chosenVersion := RsrChosenVersion version: 7.
	encoding :=
		#[0 0 0 0 0 0 0 1], "Type"
		#[0 0 0 0 0 0 0 7]. "Version"
	result := self stream: [:stream | self codec encodeChosenVersion: chosenVersion onto: stream].
	self
		assert: result
		equals: encoding.
	result := self codec decode: encoding readStream.
	self
		assert: result
		equals: chosenVersion
%

category: 'running'
method: RsrProtocolVersionNegotiationCodecTestCase
testNoVersionOverlap

	| noVersionOverlap encoding result |
	noVersionOverlap := RsrNoVersionOverlap new.
	encoding := #[0 0 0 0 0 0 0 2]. "Type"
	result := self stream: [:stream | self codec encodeNoVersionOverlap: noVersionOverlap onto: stream].
	self
		assert: result
		equals: encoding.
	result := self codec decode: encoding readStream.
	self
		assert: result
		equals: noVersionOverlap
%

category: 'running'
method: RsrProtocolVersionNegotiationCodecTestCase
testSupportedVersions

	| supportedVersions encoding result |
	supportedVersions := RsrSupportedVersions versions: #(0 1 2 7).
	encoding :=
		#[0 0 0 0 0 0 0 0], "Type"
		#[0 0 0 0 0 0 0 4], "4 versions supported"
		#[0 0 0 0 0 0 0 0],
		#[0 0 0 0 0 0 0 1],
		#[0 0 0 0 0 0 0 2],
		#[0 0 0 0 0 0 0 7].
	result := self stream: [:stream | self codec encodeSupportedVersions: supportedVersions onto: stream].
	self
		assert: result
		equals: encoding.
	result := self codec decode: encoding readStream.
	self
		assert: result
		equals: supportedVersions
%

! Class implementation for 'RsrSnapshotAnalysisTest'

!		Instance methods for 'RsrSnapshotAnalysisTest'

category: 'utilites'
method: RsrSnapshotAnalysisTest
analyze: anObject

	| analysis |
	analysis := RsrSnapshotAnalysis
		roots: (Array with: anObject)
		connection: connection.
	analysis perform.
	^analysis
%

category: 'running'
method: RsrSnapshotAnalysisTest
setUp

	super setUp.
	connection := RsrConnection
		channel: RsrNullChannel new
		transactionSpigot: RsrThreadSafeNumericSpigot naturals
		oidSpigot: RsrThreadSafeNumericSpigot naturals.
	connection open
%

category: 'running'
method: RsrSnapshotAnalysisTest
tearDown

	connection close.
	connection := nil.
	super tearDown
%

category: 'running'
method: RsrSnapshotAnalysisTest
testArrayCycle

	| array analysis |
	array := Array new: 1.
	array at: 1 put: array.
	analysis := self analyze: array.
	self
		assert: analysis snapshots size equals: 0;
		assert: analysis analyzedObjects size equals: 1.
	array at: 1 put: { array }.
	analysis := self analyze: array.
	self
		assert: analysis snapshots size equals: 0;
		assert: analysis analyzedObjects size equals: 2.
%

category: 'running'
method: RsrSnapshotAnalysisTest
testDictionaryCycle

	| dictionary analysis |
	dictionary := Dictionary new.
	dictionary at: 1 put: dictionary.
	analysis := self analyze: dictionary.
	self
		assert: analysis snapshots size equals: 0;
		assert: analysis analyzedObjects size equals: 2.

	dictionary removeKey: 1.
	dictionary at: dictionary put: 1.
	analysis := self analyze: dictionary.
	self
		assert: analysis snapshots size equals: 0;
		assert: analysis analyzedObjects size equals: 2
%

category: 'running'
method: RsrSnapshotAnalysisTest
testMultiPathsToSameService

	"Tests issue 76, Unnecessary duplicate snapshots being sent."

	| childService parentService orderedCollection analysis |
	childService := RsrRemoteAction clientClass new.
	parentService := RsrRemoteAction clientClass sharedVariable:
		                 childService.
	orderedCollection := OrderedCollection
		                     with: childService
		                     with: parentService.
	analysis := self analyze: orderedCollection.
	self assert: analysis snapshots size equals: 2.
	self
		assert: parentService isMirrored;
		assert: childService isMirrored
%

category: 'running'
method: RsrSnapshotAnalysisTest
testNewServiceInArray
	"Ensure a new service in a collection is properly tagged"

	| service analysis expected |
	service := RsrServerNoInstVars new.
	analysis := self analyze: (Array with: service).
	expected := OrderedCollection with: service.
	self
		assert: analysis snapshots size
		equals: 1.
	self assert: service isMirrored
%

category: 'running'
method: RsrSnapshotAnalysisTest
testNewServicesInDictionary
	"Ensure a new service in a collection is properly tagged"

	| key value dictionary analysis |
	key := RsrServerNoInstVars new.
	value := RsrServerNoInstVars new.
	dictionary := Dictionary new
		at: key put: value;
		yourself.
	analysis := self analyze: dictionary.
	self
		assert: analysis snapshots size
		equals: 2.
	self
		assert: key isMirrored;
		assert: value isMirrored
%

category: 'running'
method: RsrSnapshotAnalysisTest
testOrderedCollectionCycle

	| oc analysis |
	oc := OrderedCollection new.
	oc add: oc.
	analysis := self analyze: oc.
	self
		assert: analysis snapshots size equals: 0;
		assert: analysis analyzedObjects size equals: 1.

	oc := OrderedCollection with: (Array with: oc).
	analysis := self analyze: oc.
	self
		assert: analysis snapshots size equals: 0;
		assert: analysis analyzedObjects size equals: 3
%

category: 'running'
method: RsrSnapshotAnalysisTest
testServiceAllDataObjects
	"While this code is structurally similar to #testClientNoInstVars, it ensures
	that Data Objects are actually encoded in-line."

	| client analysis expected |
	client := RsrRemoteAction clientClass new.
	analysis := self analyze: client.
	expected := OrderedCollection with: client.
	self
		assert: analysis snapshots size
		equals: 1.
	self assert: client isMirrored
%

category: 'running'
method: RsrSnapshotAnalysisTest
testServiceNoInstVars

	| client analysis expected snapshot |
	client := RsrClientNoInstVars new.
	analysis := self analyze: client.
	expected := OrderedCollection with: client.
	self assert: client isMirrored.
	self
		assert: analysis snapshots size
		equals: 1.
	snapshot := analysis snapshots first.
	self
		assert: snapshot slots size
		equals: 0.
	self assert: snapshot shouldCreateServer.
	self
		assert: snapshot templateClass
		equals: client class templateClass
%

category: 'running'
method: RsrSnapshotAnalysisTest
testServiceReferencingAnotherService
	"While this code is structurally similar to #testClientNoInstVars, it ensures
	that Data Objects are actually encoded in-line."

	| referencedService client analysis |
	referencedService := RsrRemoteAction clientClass new.
	client := RsrRemoteAction clientClass sharedVariable: referencedService.
	analysis := self analyze: client.
	self
		assert: analysis snapshots size
		equals: 2.
	self
		assert: client isMirrored;
		assert: referencedService isMirrored
%

category: 'running'
method: RsrSnapshotAnalysisTest
testServiceWithCycle

	| rootClient referencedClient analysis |
	rootClient := RsrRemoteAction new.
	referencedClient := RsrRemoteAction sharedVariable: rootClient.
	rootClient sharedVariable: referencedClient.
	analysis := self analyze: rootClient.
	self
		assert: analysis snapshots size equals: 2;
		assert: analysis analyzedObjects size equals: 2
%

category: 'running'
method: RsrSnapshotAnalysisTest
testSetCycle

	| set analysis |
	set := Set new.
	set add: set.
	analysis := self analyze: set.
	self
		assert: analysis snapshots size equals: 0;
		assert: analysis analyzedObjects size equals: 1.

	set := Set new.
	set add: (Array with: set).
	analysis := self analyze: set.
	self
		assert: analysis snapshots size equals: 0;
		assert: analysis analyzedObjects size equals: 2
%

! Class implementation for 'RsrSocketStreamTestCase'

!		Instance methods for 'RsrSocketStreamTestCase'

category: 'initializing'
method: RsrSocketStreamTestCase
initializeStreams

	| socketPair |
	socketPair := RsrSocketPair new.
	aStream := socketPair firstStream.
	bStream := socketPair secondStream
%

category: 'initializing'
method: RsrSocketStreamTestCase
setUp

	super setUp.
	self initializeStreams
%

category: 'initializing'
method: RsrSocketStreamTestCase
tearDown

	aStream close.
	bStream close.
	super tearDown
%

category: 'running'
method: RsrSocketStreamTestCase
testNextAfterClose

	aStream close.
	self
		should: [aStream next]
		raise: RsrSocketClosed.
	self
		should: [bStream next]
		raise: RsrSocketClosed
%

category: 'running'
method: RsrSocketStreamTestCase
testNextPutAllAfterClose

	self deny: aStream atEnd.
	aStream close.
	self assert: aStream atEnd.
	self
		should: [aStream nextPutAll: #[1 2 3]]
		raise: RsrSocketClosed
%

category: 'running'
method: RsrSocketStreamTestCase
testSendReceive

	| count bytes |
	count := 1024.
	bytes := ByteArray new: count.
	aStream
		nextPutAll: bytes;
		flush.
	self
		assert: (bStream next: count)
		equals: bytes
%

! Class implementation for 'RsrSocketTestCase'

!		Class methods for 'RsrSocketTestCase'

category: 'accessing'
classmethod: RsrSocketTestCase
defaultTimeLimit

	^20 seconds
%

!		Instance methods for 'RsrSocketTestCase'

category: 'accessing'
method: RsrSocketTestCase
createPair: aBlock

	| address port listener peerA peerB semaphore |
	address := '127.0.0.1'.
	port := 45301.
	listener := self newSocket.
	listener
		bindAddress: address
		port: port.
	listener listen: 1.
	peerB := self newSocket.
	semaphore := Semaphore new.
	RsrProcessModel
		fork: [[peerA := self deferClose: listener accept] ensure: [semaphore signal]]
		named: 'Pending Socket Accept'.
	RsrProcessModel
		fork: [[peerB connectToHost: address port: port] ensure: [semaphore signal]]
		named: 'Pending Socket Connect'.
	semaphore wait; wait.
	listener close.
	((peerA notNil and: [peerA isConnected]) and: [peerB isConnected])
		ifTrue: [aBlock value: peerA value: peerB]
		ifFalse: [self error: 'Unable to create Socket Pair']
%

category: 'cleanup'
method: RsrSocketTestCase
deferClose: aSocket

	sockets nextPut: aSocket.
	^aSocket
%

category: 'accessing'
method: RsrSocketTestCase
newSocket

	^self deferClose: RsrSocket new
%

category: 'running'
method: RsrSocketTestCase
setUp

	super setUp.
	sockets := SharedQueue new.
%

category: 'running'
method: RsrSocketTestCase
tearDown

	[sockets isEmpty]
		whileFalse: [sockets next close].
	super tearDown
%

category: 'running-server'
method: RsrSocketTestCase
testAcceptConnects

	| listener client server |
	listener := self newSocket.
	listener
		bindAddress: '127.0.0.1'
		port: 45300.
	self
		assert: listener port
		equals: 45300.
	listener listen: 1.
	client := self newSocket.
	self
		deny: client isConnected;
		deny: listener isConnected.
	client connectToHost: '127.0.0.1' port: 45300.
	server := self deferClose: listener accept.
	self
		assert: server port
		equals: 45300.
	self assert: (client port > 1023).
	self
		assert: client isConnected;
		assert: server isConnected;
		deny: listener isConnected
%

category: 'running-server'
method: RsrSocketTestCase
testAcceptOnAlreadyClosedSocket

	| listener |
	listener := self newSocket.
	listener
		bindAddress: '127.0.0.1'
		port: 45300.
	listener listen: 1.
	listener close.
	self
		should: [listener accept]
		raise: RsrSocketError
%

category: 'running-server'
method: RsrSocketTestCase
testCloseDuringAccept

	| listener |
	listener := self newSocket.
	listener
		bindAddress: '127.0.0.1'
		port: 45300.
	listener listen: 1.
	RsrProcessModel
		fork: [(Delay forSeconds: 1) wait. listener close]
		named: 'Pending Socket Close'.
	self
		should: [listener accept]
		raise: RsrSocketError
%

category: 'running-client'
method: RsrSocketTestCase
testConnectBoundSocket

	| listener |
	listener := self newSocket.
	listener
		bindAddress: '127.0.0.1'
		port: 45300.
	self
		should:
			[listener
				connectToHost: 'gemtalksystems.com'
				port: 80]
		raise: RsrSocketError
%

category: 'running-client'
method: RsrSocketTestCase
testFailedConnects

	| socket |
	socket := self newSocket.
	self deny: socket isConnected.
	self
		should:
			[socket
				connectToHost: 'do.no.create.used.for.testing.gemtalksystems.com'
				port: 80]
		raise: RsrConnectFailed.
	socket := self newSocket.
	self
		should:
			[socket
				connectToHost: 'gemtalksystems.com'
				port: 70000]
		raise: RsrConnectFailed.
	socket := self newSocket.
	self
		should:
			[socket
				connectToHost: '127.0.0.1'
				port: 79]
		raise: RsrConnectFailed.
	socket close
%

category: 'running-server'
method: RsrSocketTestCase
testInvalidBind

	| listener |
	listener := self newSocket.
	self "This IP is publicly routable and owned by Cloudflare. Should be invalid on all testing hosts."
		should: [listener bindAddress: '1.1.1.1' port: 45300]
		raise: RsrInvalidBind.
	listener := self newSocket.
	self
		should: [listener bindAddress: '127.0.0.1' port: 98765432]
		raise: RsrInvalidBind
%

category: 'running-server'
method: RsrSocketTestCase
testListenWithoutBind

	| listener |
	listener := self newSocket.
	listener listen: 1.
	self assert: (listener port > 1023)
%

category: 'running-read/write'
method: RsrSocketTestCase
testPartialRead

	| peerA peerB writeBuffer readBuffer count numRead |
	self
		createPair:
			[:a :b |
			peerA := a.
			peerB := b].
	count := 1024.
	writeBuffer := ByteArray new: count.
	1
		to: count
		do: [:i | writeBuffer at: i put: (i \\ 256)].
	readBuffer := ByteArray withAll: writeBuffer.
	peerA
		write: count - 1
		from: writeBuffer
		startingAt: 1.
	numRead := peerB
		read: count
		into: readBuffer
		startingAt: 1.
	self
		assert: numRead
		equals: count - 1.
	self
		assert: readBuffer
		equals: writeBuffer
%

category: 'running'
method: RsrSocketTestCase
testPort

	| socket |
	socket := self newSocket.
	self
		assert: socket port
		equals: 0
%

category: 'running-read/write'
method: RsrSocketTestCase
testReadAfterPeerClose

	| peerA peerB readBuffer count numRead |
	self
		createPair:
			[:a :b |
			peerA := a.
			peerB := b].
	count := 1024.
	readBuffer := ByteArray new: count.
	peerA close.
	self
		should:
			[numRead := peerB
				read: count
				into: readBuffer
				startingAt: 1]
		raise: RsrSocketClosed
%

category: 'running-read/write'
method: RsrSocketTestCase
testReadWrite

	| peerA peerB writeBuffer readBuffer count numWritten numRead |
	self
		createPair:
			[:a :b |
			peerA := a.
			peerB := b].
	count := 1024.
	writeBuffer := ByteArray new: count.
	1
		to: count
		do: [:i | writeBuffer at: i put: (i \\ 256)].
	readBuffer := ByteArray withAll: writeBuffer.
	numWritten := peerA
		write: count
		from: writeBuffer
		startingAt: 1.
	self
		assert: numWritten
		equals: count.
	numRead := peerB
		read: count
		into: readBuffer
		startingAt: 1.
	self
		assert: numRead
		equals: count.
	self
		assert: readBuffer
		equals: writeBuffer
%

category: 'running-client'
method: RsrSocketTestCase
testSuccessfulConnect

	| socket |
	socket := self newSocket.
	self deny: socket isConnected.
	socket
		connectToHost: 'gemtalksystems.com'
		port: 80.
	self assert: socket isConnected.
	socket close.
	self deny: socket isConnected
%

category: 'running-read/write'
method: RsrSocketTestCase
testUnconnectedReadWrite

	| socket count bytes |
	socket := self newSocket.
	count := 1024.
	bytes := ByteArray new: 1024.
	self
		should:
			[socket
				read: count
				into: bytes
				startingAt: 1]
		raise: RsrSocketClosed.
	self
		should:
			[socket
				write: count
				from: bytes
				startingAt: 1]
		raise: RsrSocketClosed
%

! Class implementation for 'RsrSystemTestCase'

!		Class methods for 'RsrSystemTestCase'

category: 'testing'
classmethod: RsrSystemTestCase
isAbstract

	^self == RsrSystemTestCase
%

!		Instance methods for 'RsrSystemTestCase'

category: 'expecting'
method: RsrSystemTestCase
expectCatch: aPromise

	| semaphore wasFulfilled result whenValue |
	semaphore := Semaphore new.
	wasFulfilled := false.
	aPromise
		when: [:value | whenValue := value. wasFulfilled := true. semaphore signal]
		catch: [:reason | result := reason. semaphore signal].
	semaphore wait.
	self deny: wasFulfilled.
	^result
%

category: 'expecting'
method: RsrSystemTestCase
expectWhen: aPromise

	| semaphore wasBroken result |
	semaphore := Semaphore new.
	wasBroken := false.
	aPromise
		when: [:value | result := value. semaphore signal]
		catch: [:r | wasBroken := true. semaphore signal].
	semaphore wait.
	self deny: wasBroken.
	^result
%

category: 'initialization'
method: RsrSystemTestCase
initializeInMemoryConnections

	| spec |
	spec := RsrInMemoryConnectionSpecification new.
	spec connect.
	connectionA := spec connectionA.
	connectionB := spec connectionB.
	self
		assert: connectionA isOpen;
		assert: connectionB isOpen
%

category: 'initialization'
method: RsrSystemTestCase
initializeSocketConnections

	| spec |
	spec := RsrInternalSocketConnectionSpecification new.
	spec connect.
	connectionA := spec connectionA.
	connectionB := spec connectionB.
	self
		assert: connectionA isOpen;
		assert: connectionB isOpen
%

category: 'initialization'
method: RsrSystemTestCase
setUp
	"Subclasses need to start their connections by calling
	#initializeInMemoryConnections or #initializeSocketConnections.
	#tearDown will close connections."

	super setUp
%

category: 'initialization'
method: RsrSystemTestCase
tearDown

	connectionA ifNotNil: [:conn | conn close].
	connectionB ifNotNil: [:conn | conn close].
	connectionA := connectionB := nil.
	super tearDown
%

! Class implementation for 'RsrConnectionTestCase'

!		Class methods for 'RsrConnectionTestCase'

category: 'testing'
classmethod: RsrConnectionTestCase
isAbstract

	^self == RsrConnectionTestCase
%

!		Instance methods for 'RsrConnectionTestCase'

category: 'running'
method: RsrConnectionTestCase
testWaitUntilClose

	| semaphore marker |
	semaphore := Semaphore new.
	marker := false.
	RsrProcessModel
		fork:
			[semaphore signal.
			[connectionB waitUntilClose.
			marker := true]
				ensure: [semaphore signal]]
		named: 'Pending Connection Closure'.
	semaphore wait.
	self deny: marker.
	connectionA close.
	semaphore wait.
	self assert: marker
%

! Class implementation for 'RsrInMemoryConnectionTestCase'

!		Instance methods for 'RsrInMemoryConnectionTestCase'

category: 'running'
method: RsrInMemoryConnectionTestCase
setUp

	super setUp.
	self initializeInMemoryConnections
%

! Class implementation for 'RsrSocketConnectionTestCase'

!		Instance methods for 'RsrSocketConnectionTestCase'

category: 'running'
method: RsrSocketConnectionTestCase
setUp

	super setUp.
	self initializeSocketConnections
%

! Class implementation for 'RsrEphemeronMourningDeadlock'

!		Instance methods for 'RsrEphemeronMourningDeadlock'

category: 'running'
method: RsrEphemeronMourningDeadlock
setUp

	super setUp.
	self initializeSocketConnections
%

category: 'running'
method: RsrEphemeronMourningDeadlock
testEphemeronMourningDoesNotDeadlock
	"The RsrRegistry protects its backing datastructure using a mutex.
	When returning a large number of new Services, the data structure
	can grow triggering a garbage collection. Any services which are 
	collected need to be removed from the registry.
	The ephemeron mourning by default happens on the currently active
	thread. This can result in attempting to access the critical section in
	the registry twice. It isn't safe to use a recursive lock.
	This test is intended to recreate this case ensuring that RSR properly
	activates a background mourning process preventing the deadlock.

	We lock the registry by waiting in a critical section. Then, we mourn an ephemeron.
	This should force the mourning process to wait until the test exits the critical section."

	| service semaphore isRunning |
	"Ensure we are processing #mourn async"
	self assert: RsrAsyncMournHandler current isActive.
	"We now have an ephemeron setup for this service."
	service := RsrClientNoInstVars new
		registerWith: connectionA;
		yourself.
	semaphore := Semaphore new.
	isRunning := true.
	RsrProcessModel
		fork:
			[connectionA _privateRegistryOnlyForTests critical: [semaphore signal; wait]]
		named: 'Lock registry'.
	[semaphore wait.
	service := nil.
	RsrGarbageCollector maximumReclamation.
	self
		assert: RsrAsyncMournHandler current process waitingOn class
		equals: Semaphore]
		ensure: [semaphore signal]
%

! Class implementation for 'RsrLifetimeTest'

!		Class methods for 'RsrLifetimeTest'

category: 'testing'
classmethod: RsrLifetimeTest
isAbstract

	^self == RsrLifetimeTest
%

!		Instance methods for 'RsrLifetimeTest'

category: 'utilities'
method: RsrLifetimeTest
evaluateAsRemoteAction: aBlock
	"Evaluate the block and return the result through RSR."

	| client server |
	client := RsrRemoteActionClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	server action: aBlock.
	^client value
%

category: 'running'
method: RsrLifetimeTest
testEnsurePushedClientServerLifetime
	"This test is designed to ensure that a Server created via a 'pushed' Client
	exhibit the correct lifetime properties."

	| client sid server actual |
	client := RsrClientNoInstVars new
		registerWith: connectionA;
		synchronize.
	sid := client _id.
	self maximumReclamation. "Ensure the Server is strongly referenced in connectionB."
	server := connectionB
		serviceAt: sid
		ifAbsent: [self assert: false].
	client := nil.
	self maximumReclamation. "Ensure the Client is garbage collected."
	(Delay forSeconds: 1) wait. "Ensure the ReleaseServices Command is propogated and processed by connectionB."
	self maximumReclamation. "Ensure the Server is still referenced even after a garbage collect."
	actual := connectionA
		serviceAt: sid
		ifAbsent: [nil].
	self
		assert: actual
		equals: nil.
	actual := connectionB
		serviceAt: sid
		ifAbsent: [self assert: false].
	self
		assert: actual
		identicalTo: server.
	actual := nil. "Ensure we do not retain an extra reference to the Server."
	server := nil.
	self maximumReclamation. "Ensure Server is removed."
	actual := connectionB
		serviceAt: sid
		ifAbsent: [nil].
	self
		assert: actual
		equals: nil
%

category: 'running'
method: RsrLifetimeTest
testEnsureReturnedServerLifetime
	"Return a newly created Server (that is not registered.) It should persist in the framework until 
	both the associated Client is garbage collected and local references are dropped.

	If you change this method -- change #testEnsureReturnRegisteredServerLifetime as well."

	| client sid server result |
	client := self evaluateAsRemoteAction: [RsrServerNoInstVars new].
	sid := client _id.
	self maximumReclamation. "Ensure the Server instance is referenced."
	server := connectionB
		serviceAt: sid
		ifAbsent: [self assert: false].
	client := nil.
	self maximumReclamation.
	(Delay forSeconds: 1) wait. "Release Client."
	self maximumReclamation.
	"Ensure Client is released."
	result := connectionA
		serviceAt: sid
		ifAbsent: [nil].
	self
		assert: result
		equals: nil.
	"Ensure Server is still registered."
	result := connectionB
		serviceAt: sid
		ifAbsent: [self assert: false].
	self
		assert: result
		equals: server.
	result := server := nil.
	self maximumReclamation.
	result := connectionB
		serviceAt: sid
		ifAbsent: [nil].
	self
		assert: result
		equals: nil
%

category: 'running'
method: RsrLifetimeTest
testEnsureReturnRegisteredServerLifetime
	"Return a newly created Server (that is registered.) It should persist in the framework until 
	both the associated Client is garbage collected and local references are dropped.

	If you change this method -- change #testEnsureReturnedServerLifetime as well."

	| client sid server result |
	client := self evaluateAsRemoteAction: [RsrServerNoInstVars new registerWith: connectionB].
	sid := client _id.
	self maximumReclamation. "Ensure the Server instance is referenced."
	server := connectionB
		serviceAt: sid
		ifAbsent: [self assert: false].
	client := nil.
	self maximumReclamation.
	(Delay forSeconds: 1) wait. "Release Client."
	self maximumReclamation.
	"Ensure Client is released."
	result := connectionA
		serviceAt: sid
		ifAbsent: [nil].
	self
		assert: result
		equals: nil.
	"Ensure Server is still registered."
	result := connectionB
		serviceAt: sid
		ifAbsent: [self assert: false].
	self
		assert: result
		equals: server.
	result := server := nil.
	self maximumReclamation.
	result := connectionB
		serviceAt: sid
		ifAbsent: [nil].
	self
		assert: result
		equals: nil
%

! Class implementation for 'RsrInMemoryLifetimeTest'

!		Instance methods for 'RsrInMemoryLifetimeTest'

category: 'running'
method: RsrInMemoryLifetimeTest
setUp

	super setUp.
	self initializeInMemoryConnections
%

! Class implementation for 'RsrSocketLifetimeTest'

!		Instance methods for 'RsrSocketLifetimeTest'

category: 'running'
method: RsrSocketLifetimeTest
setUp

	super setUp.
	self initializeSocketConnections
%

! Class implementation for 'RsrMessageSendingTest'

!		Class methods for 'RsrMessageSendingTest'

category: 'testing'
classmethod: RsrMessageSendingTest
isAbstract

	^self == RsrMessageSendingTest
%

!		Instance methods for 'RsrMessageSendingTest'

category: 'utilities'
method: RsrMessageSendingTest
terminateCurrentProcess

	Processor activeProcess terminate
%

category: 'running-errors'
method: RsrMessageSendingTest
testAsyncRemoteError

	| client server reason |
	client := RsrRemoteActionClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	server action: [Error new tag: 'tag'; messageText: 'messageText'; signal].
	reason := self expectCatch: client asyncValue.
	self assert: reason isRemoteException.
	self
		assert: reason exceptionClassName
		equals: #Error.
	self
		assert: reason tag
		equals: 'tag'.
	self
		assert: reason messageText
		equals: 'messageText'.
	self
		assert: reason stack isString;
		assert: reason stack size > 0
%

category: 'running'
method: RsrMessageSendingTest
testAsyncReturnArgument

	| client server promise result |
	client := RsrRemoteActionClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	server action: [:arg | arg].
	promise := client asyncValue: client.
	result := self expectWhen: promise.
	self
		assert: result
		identicalTo: client
%

category: 'running'
method: RsrMessageSendingTest
testAsyncReturnService

	| client server service |
	client := RsrRemoteActionClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	server action: [RsrValueHolderServer new].
	service := self expectWhen: client asyncValue.
	self
		assert: service class
		equals: RsrValueHolderClient
%

category: 'running'
method: RsrMessageSendingTest
testChangeRemoteState

	| marker client server |
	marker := false.
	client := RsrRemoteActionClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	server action: [marker := true].
	client value.
	self assert: marker
%

category: 'running-close during message'
method: RsrMessageSendingTest
testCloseConnectionDuringMessageSend

	| client server promise reason |
	client := RsrRemoteActionClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	server action: [(Delay forSeconds: 10) wait].
	promise := client asyncValue.
	connectionA close.
	reason := self expectCatch: promise.
	self
		assert: reason class
		equals: RsrConnectionClosedBeforeReceivingResponse
%

category: 'running-errors'
method: RsrMessageSendingTest
testDebugHandlerBreak
	"Ensure that if a debug handler resolves the message,
	that the correct reason is received remotely."

	| marker client server reason |
	marker := #testMarker.
	client := RsrRemoteActionClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	server action: [RsrResumableError signal. 42 "ensure we do not return the marker"].
	server debugHandler: [:exception :messageSend :resolver | resolver break: marker. nil "ensure we do not return the marker"].
	reason := self expectCatch: client asyncValue.
	self
		assert: reason
		equals: marker.
	server action: [RsrNonresumableError signal. 42 "ensure we do not return the marker"].
	reason := self expectCatch: client asyncValue.
	self
		assert: reason
		equals: marker
%

category: 'running-errors'
method: RsrMessageSendingTest
testDebugHandlerException
	"Ensure that an exception that occurs in the debug handler
	is reported back as the reason for Promise breaking."

	| marker client server reason |
	marker := #testMarker.
	client := RsrRemoteActionClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	server action: [RsrResumableError signal].
	server debugHandler: [:exception :messageSend :resolver | Error signal].
	reason := self expectCatch: client asyncValue.
	self
		assert: reason exceptionClassName
		equals: #Error.
	server action: [RsrNonresumableError signal].
	reason := self expectCatch: client asyncValue.
	self
		assert: reason exceptionClassName
		equals: #Error.
%

category: 'running-errors'
method: RsrMessageSendingTest
testDebugHandlerFulfill
	"Ensure that if a debug handler resolves the message,
	that the fulfillment value is received remotely."

	| marker client server |
	marker := #testMarker.
	client := RsrRemoteActionClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	server action: [RsrResumableError signal. 42 "ensure we do not return the marker"].
	server debugHandler: [:exception :messageSend :resolver | resolver fulfill: marker. nil "ensure we do not return the marker"].
	self
		assert: client value
		equals: marker.
	server action: [RsrNonresumableError signal. 42 "ensure we do not return the marker"].
	self
		assert: client value
		equals: marker
%

category: 'running-errors'
method: RsrMessageSendingTest
testDebugHandlerNoResolutionWithNonresumableException
	"Ensure that if the debug handler does not resolve the exception
	and the exception is nonresumable, that we Break the Promise
	reporting on the unresolved exception."

	| marker client server reason |
	marker := #testMarker.
	client := RsrRemoteActionClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	server action: [RsrNonresumableError signal].
	server debugHandler: [:exception :messageSend :resolver | marker].
	reason := self expectCatch: client asyncValue.
	self
		assert: reason exceptionClassName
		equals: #RsrNonresumableError
%

category: 'running-errors'
method: RsrMessageSendingTest
testDebugHandlerNoResolutionWithResumableException
	"Ensure that if the debug handler does not resolve the exception
	and the exception is resumable, we resume with the evaluation
	result of the debug handler."

	| marker client server |
	marker := #testMarker.
	client := RsrRemoteActionClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	server action: [RsrResumableError signal].
	server debugHandler: [:exception :messageSend :resolver | marker].
	self
		assert: client value
		equals: marker
%

category: 'running'
method: RsrMessageSendingTest
testPrePostUpdate

	| client server pre post |
	client := RsrRemoteActionClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	pre := post := false.
	server
		preUpdateHandler: [pre := true];
		postUpdateHandler: [post := true];
		action: [].
	client value.
	self
		assert: pre;
		assert: post
%

category: 'running-errors'
method: RsrMessageSendingTest
testPrePostUpdateError

	| client server reason |
	client := RsrRemoteActionClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	server action: [true].
	self assert: client value.
	server
		preUpdateHandler: [Error signal: 'preUpdate'];
		postUpdateHandler: [].
	reason := self expectCatch: client asyncValue.
	self
		assert: reason exceptionClassName
		equals: #Error.
	self
		assert: reason messageText
		equals: 'preUpdate'.
	server
		preUpdateHandler: [];
		postUpdateHandler:  [Error signal: 'postUpdate'].
	reason := self expectCatch: client asyncValue.
	self
		assert: reason exceptionClassName
		equals: #Error.
	self
		assert: reason messageText
		equals: 'postUpdate'.
%

category: 'running-errors'
method: RsrMessageSendingTest
testRemoteError

	| client server reason |
	client := RsrRemoteActionClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	server action: [Error new tag: 'tag'; messageText: 'messageText'; signal].
	[client value]
		on: RsrBrokenPromise
		do: [:ex | reason := ex reason. ex return].
	self assert: reason isRemoteException.
	self
		assert: reason exceptionClassName
		equals: #Error.
	self
		assert: reason tag
		equals: 'tag'.
	self
		assert: reason messageText
		equals: 'messageText'.
	self
		assert: reason stack isString;
		assert: reason stack size > 0
%

category: 'running-errors'
method: RsrMessageSendingTest
testRemoteErrorWithTag

	| client server tag messageText reason |
	client := RsrRemoteActionClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	tag := nil.
	messageText := 'messageText'.
	server action: [Error new tag: tag; messageText: messageText; signal].
	reason := [client value]
		on: RsrBrokenPromise
		do: [:ex | ex return: ex reason].
	self assert: reason isRemoteException.
	self
		assert: reason tag
		equals: 'messageText'.
	self
		assert: reason messageText
		equals: 'messageText'.
	self
		assert: reason stack isString;
		assert: reason stack size > 0.
	tag := 42.
	reason := [client value]
		on: RsrBrokenPromise
		do: [:ex | ex return: ex reason].
	self
		assert: reason tag
		equals: '42'.
	tag := RsrSignalErrorInAsString new.
	reason := [client value]
		on: RsrBrokenPromise
		do: [:ex | ex return: ex reason].
	self
		assert: reason tag
		equals: 'Unable to pack #tag containing an instance of RsrSignalErrorInAsString'
%

category: 'running-termination'
method: RsrMessageSendingTest
testRemoteProcessTerminationDuringDebugHandler

	| client server reason |
	client := RsrRemoteActionClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	server
		action: [Error signal];
		debugHandler: [:ex :message :resolver | self terminateCurrentProcess].
	reason := self expectCatch: client asyncValue.
	self
		assert: reason
		equals: 'Message send terminated without a result'
%

category: 'running-termination'
method: RsrMessageSendingTest
testRemoteProcessTerminationDuringMessageSend

	| client server reason |
	client := RsrRemoteActionClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	server action: [self terminateCurrentProcess].
	reason := self expectCatch: client asyncValue.
	self
		assert: reason
		equals: 'Message send terminated without a result'
%

category: 'running-termination'
method: RsrMessageSendingTest
testRemoteProcessTerminationDuringPrePostUpdate

	| client server reason |
	client := RsrRemoteActionClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	server
		preUpdateHandler: [self terminateCurrentProcess];
		postUpdateHandler: [];
		action: [].
	reason := self expectCatch: client asyncValue.
	self
		assert: reason
		equals: 'Message send terminated without a result'
%

category: 'running'
method: RsrMessageSendingTest
testReturnAlsoUpdatesLocalService
	"Ensure that when the remote peer service returns a value,
	that it is also sent to update the local service."

	| client server value response |
	client := RsrReflectedVariableTestClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	value := 42.
	self
		deny: client varA
		equals: value.
	self
		deny: client varB
		equals: value.
	response := client setVarsToAndReturn: value.
	self
		assert: response
		equals: value.
	self
		assert: server varA
		equals: value.
	self
		assert: server varB
		equals: value.
	self
		assert: client varA
		equals: value.
	self
		assert: client varB
		equals: value
%

category: 'running'
method: RsrMessageSendingTest
testReturnArgument

	| client server arguments dt response |
	client := RsrRemoteActionClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	server action: [:object | object].
	arguments := OrderedCollection new
		addAll: #( '' #symbol 'string' $h 0 -14 14 18446744073709551616 -18446744073709551616 nil true false );
 		add: (Character codePoint: 16r259F);
		add: (Dictionary new at: 1 put: 2; yourself);
		add: (Set with: 14);
		add: #[1 2 3 4];
		add: (OrderedCollection with: 42 with: 43);
		add: #(1 2 #(nil));
		yourself.
	dt := RsrDateAndTime now.
	response := client value: dt.
	self
		assert: (dt asSeconds * 1000000) rounded
		equals: (response asSeconds * 1000000) rounded.
	arguments
		do:
			[:each | | result |
			result := client value: each.
			self
				assert: result
				equals: each].
	arguments
		do:
			[:each | | result |
			result := server evaluateAction: each.
			self
				assert: result
				equals: each].
	self
		assert: (client value: arguments)
		equals: arguments.
	self
		assert: (server evaluateAction: arguments)
		equals: arguments.
	self
		assert: (client value: client)
		identicalTo: client
%

category: 'running-errors'
method: RsrMessageSendingTest
testReturnInvalidObject

	| client server reason |
	client := RsrRemoteActionClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	server action: [Object new].
	self
		should: [client value]
		raise: RsrBrokenPromise.
	reason := [client value]
		on: RsrBrokenPromise
		do: [:ex | ex return: ex reason].
	self assert: reason isRemoteException.
	self
		assert: reason exceptionClassName
		equals: #RsrUnsupportedObject.
	self
		assert: reason tag
		equals: 'Instances of #Object do not support replication.'.
	self
		assert: reason messageText
		equals: 'Instances of #Object do not support replication.'.
	self
		assert: reason stack isString;
		assert: reason stack size > 0
%

category: 'running'
method: RsrMessageSendingTest
testReturnNewService

	| client server returnedService |
	client := RsrRemoteActionClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	server action: [RsrValueHolderServer new].
	returnedService := client value.
	self
		assert: returnedService class
		equals: RsrValueHolderClient
%

category: 'running'
method: RsrMessageSendingTest
testReturnNewServiceInArray

	| client server array returnedService |
	client := RsrRemoteActionClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	server action: [Array with: RsrValueHolderServer new].
	array := client value.
	returnedService := array first.
	self
		assert: returnedService class
		equals: RsrValueHolderClient
%

category: 'running'
method: RsrMessageSendingTest
testReturnSymbol

	| client server symbol result |
	client := RsrRemoteActionClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	symbol := #testSymbol.
	server action: [symbol].
	result := client value.
	self
		assert: result
		equals: symbol
%

category: 'running-errors'
method: RsrMessageSendingTest
testSendInvalidObject

	| client server |
	client := RsrRemoteActionClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	server action: [:arg | arg].
	self
		should: [client value: Object new]
		raise: RsrUnsupportedObject
%

category: 'running-errors'
method: RsrMessageSendingTest
testUnimplementedRemoteSend
	"Ensure a remote DNU is reported back to the sender."

	| marker client reason |
	marker := #testMarker.
	client := RsrClientNoInstVars new
		registerWith: connectionA;
		synchronize.
	reason := self expectCatch: client unimplementedRemoteSend.
	self
		assert: reason class
		equals: RsrRemoteExceptionServer.
	self
		assert: reason exceptionClassName
		equals: #MessageNotUnderstood
%

! Class implementation for 'RsrInMemoryMessageSendingTest'

!		Instance methods for 'RsrInMemoryMessageSendingTest'

category: 'running'
method: RsrInMemoryMessageSendingTest
setUp

	super setUp.
	self initializeInMemoryConnections
%

! Class implementation for 'RsrSocketMessageSendingTest'

!		Instance methods for 'RsrSocketMessageSendingTest'

category: 'running'
method: RsrSocketMessageSendingTest
setUp

	super setUp.
	self initializeSocketConnections
%

! Class implementation for 'RsrServiceTest'

!		Class methods for 'RsrServiceTest'

category: 'testing'
classmethod: RsrServiceTest
isAbstract

	^self == RsrServiceTest
%

!		Instance methods for 'RsrServiceTest'

category: 'running-utilities'
method: RsrServiceTest
mirror: aService

	| client |
	client := RsrClientNoInstVars new
		registerWith: connectionA;
		yourself.
	^client sendReturnArgument: aService
%

category: 'running'
method: RsrServiceTest
testAnalyzeServiceRegisteredWithDifferentConnection

	| instance analysis |
	instance := RsrRemoteAction clientClass new.
	analysis := RsrSnapshotAnalysis
		roots: (Array with: instance)
		connection: connectionA.
	analysis perform.
	self assert: instance isMirrored.
	analysis := RsrSnapshotAnalysis
		roots: (Array with: instance)
		connection: connectionB.
	self
		should: [analysis perform]
		raise: RsrAlreadyRegistered
%

category: 'running'
method: RsrServiceTest
testEnsureServersAreCachedAndReused

	| client service1 service2 |
	client := RsrRemoteActionClient new
		registerWith: connectionA;
		synchronize.
	service1 := connectionB serviceAt: client _id.
	self mirror: client.
	service2 := connectionB serviceAt: client _id.
	self
		assert: service1
		identicalTo: service2
%

category: 'running'
method: RsrServiceTest
testHasRemoteSelf

	| service |
	service := RsrTestService clientClass new.
	self mirror: service.
	self deny: nil == service remoteSelf
%

category: 'running'
method: RsrServiceTest
testInitialization

	| instance |
	instance := RsrRemoteAction clientClass new.
	self
		assert: instance isMirrored
		equals: false.
	self
		assert: instance _id
		equals: nil.
	self
		assert: instance _connection
		equals: nil
%

category: 'running'
method: RsrServiceTest
testIsMirrored

	| instance |
	instance := RsrRemoteAction clientClass new.
	self deny: instance isMirrored.
	self mirror: instance.
	self assert: instance isMirrored
%

category: 'running'
method: RsrServiceTest
testMessageDispatchedConcurrentlyToSingleService
	"Ensure all messages are sent concurrently (including those sent to a single service)"

	| client server counter promise1 promise2 |
	client := RsrRemoteActionClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	counter := 0.
	server action: [counter := counter + 1. self shortWait. counter].
	promise1 := client asyncValue.
	promise2 := client asyncValue.
	self
		assert: promise1 wait
		equals: 2. "The #shortWait will cause the second counter increment before the counter is returned."
	self
		assert: promise2 wait
		equals: 2
%

category: 'running'
method: RsrServiceTest
testMessagesDispactchedConcurrentlyForMultipleServices
	"Ensure messages are dispatched concurrently"

	| client1 server1 client2 server2 semaphore expected1 expected2 promise1 promise2 |
	client1 := RsrRemoteActionClient new
		registerWith: connectionA;
		synchronize.
	client2 := RsrRemoteActionClient new
		registerWith: connectionA;
		synchronize.
	server1 := connectionB serviceAt: client1 _id.
	server2 := connectionB serviceAt: client2 _id.
	semaphore := Semaphore new.
	expected1 := #expected1.
	expected2 := #expected2.
	server1 action: [semaphore wait. expected1].
	server2 action: [semaphore signal. expected2].
	promise1 := client1 asyncValue.
	promise2 := client2 asyncValue.
	self shortWait.
	self
		assert: promise1 isResolved;
		assert: promise2 isResolved.
	self
		assert: promise1 value
		equals: expected1.
	self
		assert: promise2 value
		equals: expected2
%

category: 'running'
method: RsrServiceTest
testPrePostUpdate

	| client server | 
	client := RsrInstrumentedClient new
		registerWith: connectionA;
		yourself.
	self
		assert: client preUpdateCount
		equals: 0.
	self
		assert: client postUpdateCount
		equals: 0.
	client return: nil.
	server := connectionB serviceAt: client _id.
	self
		assert: client preUpdateCount
		equals: 1.
	self
		assert: client postUpdateCount
		equals: 1.
	self
		assert: server preUpdateCount
		equals: 1.
	self
		assert: server postUpdateCount
		equals: 1.
	client return: nil.
	self
		assert: client preUpdateCount
		equals: 2.
	self
		assert: client postUpdateCount
		equals: 2.
	self
		assert: server preUpdateCount
		equals: 2.
	self
		assert: server postUpdateCount
		equals: 2.
%

category: 'running'
method: RsrServiceTest
testReflectedVariableNames

	| client server clientNames serverNames |
	client := RsrClientTestService new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	clientNames := RsrServiceSnapshot reflectedVariablesFor: client.
	serverNames := RsrServiceSnapshot reflectedVariablesFor: server.
	self
		assert: clientNames
		equals: serverNames.
	self
		assert: clientNames size
		equals: 1.
	self
		assert: (clientNames at: 1) asSymbol
		equals: #sharedVariable.
	client := RsrReflectedVariableTestClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	clientNames := RsrServiceSnapshot reflectedVariablesFor: client.
	serverNames := RsrServiceSnapshot reflectedVariablesFor: server.
	self
		assert: clientNames
		equals: serverNames.
	self
		assert: clientNames size
		equals: 2.
	self
		assert: (clientNames at: 1) asSymbol
		equals: #varA.
	self
		assert: (clientNames at: 2) asSymbol
		equals: #varB
%

category: 'running'
method: RsrServiceTest
testRegisterWith

	| instance |
	instance := RsrRemoteAction clientClass new.
	self deny: instance isMirrored.
	instance registerWith: connectionA.
	self assert: instance isMirrored.
	self
		should: [instance registerWith: connectionB]
		raise: RsrAlreadyRegistered
%

category: 'running'
method: RsrServiceTest
testReturnServerWithoutAssociatedClient

	| client server reason |
	client := RsrRemoteActionClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	server action: [RsrKnownServer new].
	reason := self expectCatch: client asyncValue.
	self
		assert: reason class
		equals: RsrDecodingRaisedException
%

category: 'running'
method: RsrServiceTest
testSendClientWithoutAssociatedServer

	| client server reason |
	client := RsrRemoteActionClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	server action: [:x | x].
	reason := self expectCatch: (client asyncValue: RsrKnownClient new).
	self
		assert: reason class
		equals: RsrRemoteExceptionServer.
	self
		assert: reason exceptionClassName
		equals: #RsrUnknownClass
%

category: 'running'
method: RsrServiceTest
testVariableReflection

	| localService remoteService |
	localService := RsrTestService clientClass new
		sharedVariable: #shared;
		privateVariable: #private;
		yourself.
	self mirror: localService.
	remoteService := connectionB serviceAt: localService _id.
	self
		assert: localService sharedVariable
		identicalTo: remoteService sharedVariable.
	self
		assert: localService privateVariable
		identicalTo: #private.
	self
		assert: remoteService privateVariable
		identicalTo: nil
%

! Class implementation for 'RsrInMemoryServiceTest'

!		Instance methods for 'RsrInMemoryServiceTest'

category: 'running'
method: RsrInMemoryServiceTest
setUp

	super setUp.
	self initializeInMemoryConnections
%

! Class implementation for 'RsrSocketServiceTest'

!		Instance methods for 'RsrSocketServiceTest'

category: 'running'
method: RsrSocketServiceTest
setUp

	super setUp.
	self initializeSocketConnections
%

! Class implementation for 'RsrSpeciesEquality'

!		Class methods for 'RsrSpeciesEquality'

category: 'testing'
classmethod: RsrSpeciesEquality
isAbstract

	^self == RsrSpeciesEquality
%

!		Instance methods for 'RsrSpeciesEquality'

category: 'accessing'
method: RsrSpeciesEquality
basicExamples
	"Give a samples of each species to ensure Collection classes are able to encode each type successfully."

	^{RsrClientNoInstVars new.
	#h.
	#''.
	'h'.
	''.
	0.
	234.
	-97.
	$s.
	nil.
	true.
	false.
	{}.
	{RsrClientNoInstVars new. {}.}.
	#[].
	#[123].
	Set new.
	Set with: 42.
	OrderedCollection new.
	OrderedCollection with: #x.
	Dictionary new.
	Dictionary new at: #key put: #value; yourself.
	RsrDateAndTime posixEpoch.
	RsrDateAndTime fromMicroseconds: -1000000. "1969-12-31T23:59:59-00:00"}
%

category: 'running'
method: RsrSpeciesEquality
testArray

	self
		verify: #();
		verify: (Array withAll: self basicExamples)
%

category: 'running'
method: RsrSpeciesEquality
testBoolean

	self
		verify: true;
		verify: false
%

category: 'running'
method: RsrSpeciesEquality
testByteArray

	self
		verify: #[];
		verify: (ByteArray withAll: (0 to: 255));
		verify: (ByteArray new: 1024)
%

category: 'running'
method: RsrSpeciesEquality
testCharacter

	self
		verify: (Character codePoint: 0);
		verify: (Character codePoint: 65);
		verify: $A;
		verify: (Character codePoint: 16r01D4);
		verify: (Character codePoint: 16r8334)
%

category: 'running'
method: RsrSpeciesEquality
testDateAndTime

	self
		verify: (RsrDateAndTime fromMicroseconds: -491277642567488); "1954-06-07T14:59:17.432512-07:00"
		verify: (RsrDateAndTime fromMicroseconds: 1562692562657612). "2019-07-09T10:16:02.657612-07:00"
%

category: 'running'
method: RsrSpeciesEquality
testDictionary

	| example |
	example := Dictionary new.
	self verify: example.
	self basicExamples do: [:each | each ifNotNil: [example at: each put: each]].
	example at: #testDictionaryPrivateKey put: nil.
	self verify: example
%

category: 'running'
method: RsrSpeciesEquality
testInteger

	self
		verify: 0;
		verify: -1;
		verify: 1;
		verify: (2 raisedTo: 32);
		verify: (2 raisedTo: 32) negated;
		verify: (2 raisedTo: 64);
		verify: (2 raisedTo: 64) negated;
		verify: 4598754392654025898794;
		verify: -13750198234577893465
%

category: 'running'
method: RsrSpeciesEquality
testOrderedCollection

	self
		verify: OrderedCollection new;
		verify: (OrderedCollection withAll: self basicExamples)
%

category: 'running'
method: RsrSpeciesEquality
testService

	| clientClass serverClass |
	clientClass := RsrRemoteAction clientClass.
	serverClass := RsrRemoteAction serverClass.
	self
		verify: clientClass new;
		verify: (clientClass sharedVariable: clientClass new);
		verify: (serverClass sharedVariable: clientClass new)
%

category: 'running'
method: RsrSpeciesEquality
testServiceWithUnsupportedObject

	| service |
	service := RsrClientNoInstVars new
		registerWith: connectionA;
		yourself.
	self
		should: [service sendReturnArgument: (RsrValueHolderClient value: Object new)]
		raise: RsrUnsupportedObject
%

category: 'running'
method: RsrSpeciesEquality
testSet

	self
		verify: Set new;
		verify: (Set withAll: self basicExamples)
%

category: 'running'
method: RsrSpeciesEquality
testString

	self
		verify: '';
		verify: 'string'
%

category: 'running'
method: RsrSpeciesEquality
testSymbol

	self
		verify: #'';
		verify: #symbol
%

category: 'running'
method: RsrSpeciesEquality
testUndefinedObject

	self verify: nil
%

category: 'running'
method: RsrSpeciesEquality
testUnicodeString

	self verify: self unicodeString
%

category: 'running'
method: RsrSpeciesEquality
testUnicodeSymbol

	self verify: self unicodeString asSymbol
%

category: 'running'
method: RsrSpeciesEquality
unicodeString

	^String
		with: $a
		with: (Character codePoint: 16r8349)
		with: (Character codePoint: 16r10E60)
%

category: 'asserting'
method: RsrSpeciesEquality
verify: anObject
	"Send <anObject> through RSR and have it returned. Assert it is equivalent."

	| client server |
	client := RsrRemoteActionClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	server action: [:object | server sharedVariable: object. object].
	self
		assert: (client value: anObject)
		equals: anObject.
	self
		assert: client sharedVariable
		equals: anObject
%

! Class implementation for 'RsrInMemorySpeciesEquality'

!		Instance methods for 'RsrInMemorySpeciesEquality'

category: 'running'
method: RsrInMemorySpeciesEquality
setUp

	super setUp.
	self initializeInMemoryConnections
%

! Class implementation for 'RsrSocketSpeciesEquality'

!		Instance methods for 'RsrSocketSpeciesEquality'

category: 'running'
method: RsrSocketSpeciesEquality
setUp

	super setUp.
	self initializeSocketConnections
%

! Class implementation for 'RsrStressTest'

!		Class methods for 'RsrStressTest'

category: 'accessing'
classmethod: RsrStressTest
defaultTimeLimit

	^30 seconds
%

category: 'testing'
classmethod: RsrStressTest
isAbstract

	^self == RsrStressTest
%

!		Instance methods for 'RsrStressTest'

category: 'initialize/release'
method: RsrStressTest
cleanupServices

	client := server := nil
%

category: 'accessing'
method: RsrStressTest
client

	^client
%

category: 'running-utilities'
method: RsrStressTest
concurrentlyRun: aBlock

	| anyCurtailed semaphores |
	anyCurtailed := false.
	semaphores := (1 to: self numThreads) collect: [:each | Semaphore new].
	semaphores do: [:semaphore | RsrProcessModel fork: [[self repeatedlyRun: aBlock. semaphore signal] ifCurtailed: [anyCurtailed := true. semaphore signal]] named: 'Concurrent Test Thread'].
	semaphores do: [:semaphore | semaphore wait].
	self deny: anyCurtailed
%

category: 'initialize/release'
method: RsrStressTest
initializeServices

	client := RsrRemoteActionClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	server action: [:x | x]
%

category: 'accessing'
method: RsrStressTest
numThreads

	^15
%

category: 'running-utilities'
method: RsrStressTest
repeatedlyRun: aBlock

	self repetitions timesRepeat: aBlock
%

category: 'running-utilities'
method: RsrStressTest
repeatedlySend: anObject

	self repeatedlyRun: [self send: anObject]
%

category: 'accessing'
method: RsrStressTest
repetitions

	^1000
%

category: 'running-utilities'
method: RsrStressTest
send: anObject

	self client value: anObject
%

category: 'accessing'
method: RsrStressTest
server

	^server
%

category: 'initialize/release'
method: RsrStressTest
setUp

	super setUp.
	self
		initializeConnections;
		initializeServices
%

category: 'initialize/release'
method: RsrStressTest
tearDown

	self cleanupServices.
	super tearDown
%

category: 'running'
method: RsrStressTest
test10MBytes

	| bytes |
	bytes := ByteArray new: 1024 * 1024 * 10.
	50 timesRepeat: [self send: bytes]
%

category: 'running'
method: RsrStressTest
test1KBytes

	self repeatedlySend: (ByteArray new: 1024)
%

category: 'running'
method: RsrStressTest
test1MBytes

	self repeatedlySend: (ByteArray new: 1024 squared)
%

category: 'running'
method: RsrStressTest
test2KBytes

	self repeatedlySend: (ByteArray new: 1024 *2)
%

category: 'running'
method: RsrStressTest
testBasicSends

	self repeatedlySend: nil
%

category: 'running'
method: RsrStressTest
testConcurrent1KBytes

	self concurrentlyRun: [self client value: (ByteArray new: 1024)]
%

category: 'running'
method: RsrStressTest
testConcurrent2KBytes

	self concurrentlyRun: [self client value: (ByteArray new: 2 * 1024)]
%

category: 'running'
method: RsrStressTest
testConcurrentBasicSends

	self concurrentlyRun: [self client value: nil]
%

! Class implementation for 'RsrInMemoryStressTest'

!		Instance methods for 'RsrInMemoryStressTest'

category: 'initializing'
method: RsrInMemoryStressTest
initializeConnections

	self initializeInMemoryConnections
%

! Class implementation for 'RsrSocketStressTest'

!		Instance methods for 'RsrSocketStressTest'

category: 'initializing'
method: RsrSocketStressTest
initializeConnections

	self initializeSocketConnections
%

! Class implementation for 'RsrTestingProcessModelTestCase'

!		Instance methods for 'RsrTestingProcessModelTestCase'

category: 'running'
method: RsrTestingProcessModelTestCase
exceptionCase

	| sema |
	sema := Semaphore new.
	RsrProcessModel fork: [[Error signal] ensure: [sema signal]] ensure: 'Ensure w/ signal'.
	sema wait
%

category: 'running'
method: RsrTestingProcessModelTestCase
noExceptionCase

	| sema |
	sema := Semaphore new.
	RsrProcessModel fork: [sema signal] named: 'Signal Semaphore'.
	sema wait
%

category: 'running'
method: RsrTestingProcessModelTestCase
testCurrentStackDump

	| stack |
	stack := RsrProcessModel currentStackDump.
	self
		assert: stack isString;
		assert: stack size > 0
%

category: 'running'
method: RsrTestingProcessModelTestCase
testException

	| testCase |
	testCase := self class selector: #exceptionCase.
	self
		should: [testCase runCase]
		raise: Exception
%

category: 'running'
method: RsrTestingProcessModelTestCase
testNoException

	| testCase |
	testCase := self class selector: #noExceptionCase.
	self
		shouldnt: [testCase runCase]
		raise: Exception
%

! Class implementation for 'RsrTokenExchangeCodecTestCase'

!		Instance methods for 'RsrTokenExchangeCodecTestCase'

category: 'accessing'
method: RsrTokenExchangeCodecTestCase
codec

	^RsrTokenExchangeCodec new
%

category: 'utilities'
method: RsrTokenExchangeCodecTestCase
stream: aBlock

	^ByteArray streamContents: aBlock
%

category: 'running'
method: RsrTokenExchangeCodecTestCase
testToken

	| tokenBytes expected token result |
	tokenBytes := #[16r58 16r18 16rE8 16rA2 16rB6 16rA6 16r91 16r39 16rD2 16rA6 16rC1 16r13 16r15 16r65 16r0F 16r6A].
	expected := 
		#[0 0 0 0 0 0 0 0], "Type"
		#[0 0 0 0 0 0 0 16], "token byte length"
		tokenBytes.
	token := RsrToken bytes: tokenBytes.
	result := self stream: [:stream | self codec encodeToken: token onto: stream].
	self
		assert: result
		equals: expected.
	result := self codec decode: expected readStream.
	self
		assert: result
		equals: token
%

category: 'running'
method: RsrTokenExchangeCodecTestCase
testTokenAccepted

	| expected tokenAccepted result |
	expected := #[0 0 0 0 0 0 0 1]. "Type"
	tokenAccepted := RsrTokenAccepted new.
	result := self stream: [:stream | self codec encodeTokenAccepted: tokenAccepted onto: stream].
	self
		assert: result
		equals: expected.
	result := self codec decode: expected readStream.
	self
		assert: result
		equals: tokenAccepted
%

category: 'running'
method: RsrTokenExchangeCodecTestCase
testTokenRejected

	| expected tokenRejected result |
	expected := #[0 0 0 0 0 0 0 2]. "Type"
	tokenRejected := RsrTokenRejected new.
	result := self stream: [:stream | self codec encodeTokenRejected: tokenRejected onto: stream].
	self
		assert: result
		equals: expected.
	result := self codec decode: expected readStream.
	self
		assert: result
		equals: tokenRejected
%

! Class implementation for 'SpkTestCase'

!		Class methods for 'SpkTestCase'

category: 'testing'
classmethod: SpkTestCase
isAbstract

	"Override to true if a TestCase subclass is Abstract and should not have
	TestCase instances built from it"

	^ self == SpkTestCase
%

!		Instance methods for 'SpkTestCase'

category: 'asserting'
method: SpkTestCase
assert: anObject
identicalTo: bObject

	self assert: anObject == bObject
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

! Class implementation for 'SpkToolTest'

!		Instance methods for 'SpkToolTest'

category: 'running'
method: SpkToolTest
newInspectorToolOn: anObject

	| taskspaceTool explorerTool |
	taskspaceTool := SpkTaskspaceTool new.
	explorerTool := taskspaceTool newExplorerTool.
	^ tool := SpkInspectorTool new
		          inspectedObject: anObject;
		          taskspaceTool: taskspaceTool;
		          initializeViews;
		          explorerTool: explorerTool;
		          yourself
%

! Class implementation for 'SpkEvaluationTest'

!		Instance methods for 'SpkEvaluationTest'

category: 'other'
method: SpkEvaluationTest
newInspectorToolOn: anObject
	taskspaceTool := SpkTaskspaceTool new.
	explorerTool := taskspaceTool newExplorerTool.
	^ tool := explorerTool newInspectorToolOn: anObject
%

category: 'other'
method: SpkEvaluationTest
setUp
	super setUp.
	inspectorTool := self newInspectorToolOn: nil.
	evaluatorTool := inspectorTool addEvaluator
%

! Class implementation for 'SpkDebuggerServiceTest'

!		Instance methods for 'SpkDebuggerServiceTest'

category: 'support'
method: SpkDebuggerServiceTest
divideByZeroAfterProceed
	| debuggerTool |
	evaluatorTool newSourceCode: '3 pause + 4 / 0'.
	debuggerTool := evaluatorTool evaluateCode.
	debuggerService := SpkServiceFactory serviceForTool: debuggerTool
%

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
		assert: (frames size between: 10 and: 15)
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

category: 'tests'
method: SpkDebuggerServiceTest
testUpdateAfterExecution

	| frames matchingFrames executedCodeFrameDescription frameService newDebuggerService |
	self divideByZeroAfterProceed.
	"Should now be stopped on the pause."
	frames := debuggerService frames.
	matchingFrames := frames select: [:each | each description = 'Executed Code '].
	self assert: matchingFrames size equals: 1.
	executedCodeFrameDescription := matchingFrames first.
	self assert: executedCodeFrameDescription class equals: SpkDebuggerFrameDescriptionServiceServer.
	frameService := executedCodeFrameDescription createFrameService.
	self assert: frameService class equals: SpkDebuggerFrameServiceServer;
	assert: frameService currentStartPosition equals: 3;
	assert: frameService currentEndPosition equals: 7.
	newDebuggerService := debuggerService proceed.
	"Should no be stopped on the division by zero, and the frame service should have updated itself."
	self assert: newDebuggerService == debuggerService;
	assert: frameService currentStartPosition equals: 13;
	assert: frameService currentEndPosition equals: 13.
%

category: 'support'
method: SpkDebuggerServiceTest
zork3
	| debuggerTool |
	evaluatorTool newSourceCode: '3 zork'.
	debuggerTool := evaluatorTool evaluateCode.
	debuggerService := SpkServiceFactory serviceForTool: debuggerTool
%

! Class implementation for 'SpkDebuggerToolTest'

!		Instance methods for 'SpkDebuggerToolTest'

category: 'support'
method: SpkDebuggerToolTest
executedCodeFrameInDebugger: debugger
	| doitFrames |
	self assert: debugger class equals: SpkDebuggerTool.

	doitFrames := debugger frames
		select: [ :frame | 
			self assert: frame class equals: SpkDebuggerFrameTool.
			frame description = 'Executed Code ' ].
	self assert: doitFrames size equals: 1.
	^ doitFrames first
%

category: 'tests'
method: SpkDebuggerToolTest
testBreakpoint01
	| method debugger frames frame localVariables variable inspector |
	method := SpkTestClassForDebugging compiledMethodAt: #'twelve'.
	self assert: method class equals: GsNMethod.
	[ 
	method setBreakAtStepPoint: 3 breakpointLevel: 1.
	evaluatorTool newSourceCode: 'SpkTestClassForDebugging new twelve'.
	debugger := evaluatorTool evaluateCode.
	frames := debugger frames.
	frame := frames
		detect: [ :each | each description includesString: 'SpkTestClassForDebugging' ].	"
	Have we properly omitted the glue frames following a breakpoint?"
	self assert: frame equals: frames last.
	self assert: (frame description includesString: 'twelve').
	self assert: frame stepPoint equals: 3.
	localVariables := frame localVariables.
	variable := localVariables at: 1.
	self assert: (variable columnAt: 1) equals: 'receiver'.
	variable := localVariables at: 2.
	self assert: (variable columnAt: 2) equals: '7'.
	variable := localVariables at: 3.
	self assert: (variable columnAt: 2) equals: '5'.
	inspector := debugger proceed.
	self assert: inspector class equals: SpkInspectorTool.
	self assert: inspector inspectedObject equals: 12 ]
		ensure: [ method clearAllBreaks ]
%

category: 'tests'
method: SpkDebuggerToolTest
testClearAllBreaks
	| method debugger frames frame inspector |
	method := SpkTestClassForDebugging compiledMethodAt: #'twelve'.
	self assert: method class equals: GsNMethod.
	[ 
	self assert: method _allBreakpoints size equals: 0.
	method setBreakAtStepPoint: 3 breakpointLevel: 1.
	self assert: method _allBreakpoints size equals: 4.
	evaluatorTool newSourceCode: 'SpkTestClassForDebugging new twelve'.
	debugger := evaluatorTool evaluateCode.
	self assert: debugger class equals: SpkDebuggerTool.
	frames := debugger frames.
	frame := frames
		detect: [ :each | each description includesString: 'SpkTestClassForDebugging' ].
	self assert: frame stepPoint equals: 3.
	inspector := debugger proceed.
	self assert: inspector class equals: SpkInspectorTool.
	self assert: inspector inspectedObject equals: 12.
	self assert: method _allBreakpoints size equals: 4.
	method clearAllBreaks.
	self assert: method _allBreakpoints size equals: 0.
	inspector := evaluatorTool evaluateCode.
	self assert: inspector class equals: SpkInspectorTool.
	self assert: inspector inspectedObject equals: 12 ]
		ensure: [ method clearAllBreaks ].
	self assert: method _allBreakpoints size equals: 0
%

category: 'tests'
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

category: 'tests'
method: SpkDebuggerToolTest
testFrameDescription
	"Is a frame's description reasonable?"

	| debugger frame |
	evaluatorTool newSourceCode: '3 zork'.
	debugger := evaluatorTool evaluateCode.

	frame := self executedCodeFrameInDebugger: debugger.
	self assert: frame index equals: 11
%

category: 'tests'
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

category: 'tests'
method: SpkDebuggerToolTest
testHaltGlueTrimming
	"A halt should trim all top glue down through Object>>halt."

	| debugger numberOfFrames execCodeFrame topFrame |
	evaluatorTool newSourceCode: '3 halt + 4'.
	debugger := evaluatorTool evaluateCode.
	numberOfFrames := debugger frames size.
	topFrame := debugger frames at: numberOfFrames.
	self assert: topFrame index equals: numberOfFrames.
	execCodeFrame := self executedCodeFrameInDebugger: debugger.
	self assert: execCodeFrame index equals: numberOfFrames.
%

category: 'tests'
method: SpkDebuggerToolTest
testNumberOfFrames
	"Can the debugger get frames from the process?"

	| debugger |
	evaluatorTool newSourceCode: '3 zork'.
	debugger := evaluatorTool evaluateCode.
	self assert: debugger class equals: SpkDebuggerTool.
	self assert: debugger frames size > 6
%

category: 'tests'
method: SpkDebuggerToolTest
testProceedChangedDepth
	"Get a debugger, proceed, get the same debugger with different stack depth."

	| debugger1 debugger2 frame depth1 depth2 index1 index2 |
	evaluatorTool newSourceCode: '3 pause + 4 / 0'.
	debugger1 := evaluatorTool evaluateCode.
	self assert: debugger1 class equals: SpkDebuggerTool.
	depth1 := debugger1 frames size.
	frame := self executedCodeFrameInDebugger: debugger1.
	index1 := frame index.
	self assert: frame currentSourceInterval equals: (3 to: 7).
	debugger2 := debugger1 proceed.
	self assert: debugger1 == debugger2.
	depth2 := debugger2 frames size.
	self assert: depth1 < depth2.
	self assert: frame == (self executedCodeFrameInDebugger: debugger1).
	index2 := frame index.
	self assert: index1 equals: index2.
	self assert: frame currentSourceInterval equals: (13 to: 13)
%

category: 'tests'
method: SpkDebuggerToolTest
testProceedOnce
	"Get a debugger, proceed, get an inspector"

	| debugger inspector |
	evaluatorTool newSourceCode: '3 pause + 4'.
	debugger := evaluatorTool evaluateCode.
	self assert: debugger class equals: SpkDebuggerTool.
	inspector := debugger proceed.
	self
		assert: inspector class equals: SpkInspectorTool;
		assert: inspector inspectedObject equals: 7
%

category: 'tests'
method: SpkDebuggerToolTest
testProceedTwice
	"Get a debugger, proceed, get the same debugger, proceed, get inspector"

	| debugger1 debugger2 inspector frame |
	evaluatorTool newSourceCode: '(3 pause + 4) pause + 5'.
	debugger1 := evaluatorTool evaluateCode.
	self assert: debugger1 class equals: SpkDebuggerTool.
	frame := self executedCodeFrameInDebugger: debugger1.
	self assert: frame currentSourceInterval equals: (4 to: 8).
	debugger2 := debugger1 proceed.
	self assert: debugger1 == debugger2.
	self assert: (frame == (self executedCodeFrameInDebugger: debugger1)).
	self assert: frame currentSourceInterval equals: (15 to: 19).
	inspector := debugger2 proceed.
	self
		assert: inspector class equals: SpkInspectorTool;
		assert: inspector inspectedObject equals: 12
%

category: 'tests'
method: SpkDebuggerToolTest
testStepOver01
	| method debugger debugger2 frames frame localVariables variable inspector |
	method := SpkTestClassForDebugging compiledMethodAt: #'twelve'.
	self assert: method class equals: GsNMethod.
	[ 
	method setBreakAtStepPoint: 1 breakpointLevel: 1.
	evaluatorTool newSourceCode: 'SpkTestClassForDebugging new twelve'.
	debugger := evaluatorTool evaluateCode.
	frames := debugger frames.
	frame := frames
		detect: [ :each | each description includesString: 'SpkTestClassForDebugging' ].	
	"Have we properly omitted the glue frames following a breakpoint?"
	self assert: frame equals: frames last.
	self assert: (frame description includesString: 'twelve').
	self assert: frame stepPoint equals: 1.
	localVariables := frame localVariables.
	self assert: localVariables size equals: 1.
	variable := localVariables at: 1.
	self
		assert: (variable columnAt: 1) equals: 'receiver';
		assert: frame currentSourceInterval equals: (1 to: 6).
	debugger2 := frame stepOverAnnouncing: SpkExecutionAnnouncement new.
	self
		assert: debugger2 == debugger;
		assert: frame == frames last;
		assert: frame currentSourceInterval equals: (13 to: 13).
	frame stepOverAnnouncing: SpkExecutionAnnouncement new.
	self assert: frame currentSourceInterval equals: (17 to: 17).
	frame stepOverAnnouncing: SpkExecutionAnnouncement new.
	self assert: frame currentSourceInterval equals: (9 to: 9).
	frame stepOverAnnouncing: SpkExecutionAnnouncement new.
	self assert: debugger frames size equals: frames size - 1.
	inspector := debugger proceed.
	self assert: inspector class equals: SpkInspectorTool.
	self assert: inspector inspectedObject equals: 12 ]
		ensure: [ method clearAllBreaks ]
%

category: 'tests'
method: SpkDebuggerToolTest
testTerminate
	"Get a debugger, terminate, verify termination"

	| debugger process |
	evaluatorTool newSourceCode: '3 pause + 4'.
	debugger := evaluatorTool evaluateCode.
	self assert: debugger class equals: SpkDebuggerTool.
	process := debugger process.

	self deny: process _isTerminated.
	debugger terminateAnnouncing: SpkExecutionAnnouncement new.
	self assert: process _isTerminated
%

category: 'tests'
method: SpkDebuggerToolTest
testTerminate01
	"Get a debugger, terminate, get the same debugger with the 
	same executedCode frame, proceed, get inspector"

	| debugger1 debugger2 inspector execCodeFrame bottomFrame topFrame |
	evaluatorTool newSourceCode: '[3 pause + 4] ifCurtailed: [12 pause]'.
	debugger1 := evaluatorTool evaluateCode.
	self assert: debugger1 class equals: SpkDebuggerTool.
	bottomFrame := debugger1 frames at: 1.
	topFrame := debugger1 frames at: debugger1 frames size.
	execCodeFrame := self executedCodeFrameInDebugger: debugger1.	"Should be on ifCurtailed:"
	self assert: execCodeFrame currentSourceInterval equals: (15 to: 26).
	debugger2 := debugger1 terminateAnnouncing: SpkExecutionAnnouncement new.
	self
		assert: debugger1 == debugger2;
		assert: bottomFrame == (debugger2 frames at: 1);
		assert: execCodeFrame == (self executedCodeFrameInDebugger: debugger1);
		deny: topFrame == (debugger2 frames at: debugger2 frames size);
		assert: execCodeFrame currentSourceInterval equals: (15 to: 26).	"Should still be on ifCurtailed:"
	inspector := debugger2 proceed.
	self assert: inspector class equals: SpkProcessTerminatedTool
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

	self newInspectorToolOn: nil.
	self
		assert: tool classMembershipDescription
		equals: 'an UndefinedObject'.

	self newInspectorToolOn: nil class.
	self
		assert: tool classMembershipDescription
		equals: 'UndefinedObject'.

	self newInspectorToolOn: 42.
	self assert: tool classMembershipDescription equals: 'a SmallInteger'.

	self newInspectorToolOn: 'Hi!'.
	self assert: tool classMembershipDescription equals: 'a ' , '' class name asString.

	self newInspectorToolOn: Object new.
	self assert: tool classMembershipDescription equals: 'an Object'.

	self newInspectorToolOn: SpkTestSubclassOfNil basicNew.
	self
		assert: tool classMembershipDescription
		equals: 'a SpkTestSubclassOfNil'
%

category: 'tests'
method: SpkInspectorToolTest
testFieldToolsSize

	"Here, just testing that we get the right number of FieldTools back."

	self newInspectorToolOn: nil.
	self assert: tool fieldTools size equals: 0.

	self newInspectorToolOn: nil class.
	self assert: tool fieldTools size equals: 19.

	self newInspectorToolOn: 42.
	self assert: tool fieldTools size equals: 0.

	self newInspectorToolOn: 'Hi!'.
	self assert: tool fieldTools size equals: 3.

	self newInspectorToolOn: Object new.
	self assert: tool fieldTools size equals: 0.

	self newInspectorToolOn: SpkTestSubclassOfNil basicNew.
	self assert: tool fieldTools size equals: 2.

	self newInspectorToolOn: SpkTestClassWithInfinitePrintOn new.
	self assert: tool fieldTools size equals: 0.

	"ZeroDivide has both inherited and declared named instvars"
	self newInspectorToolOn: ZeroDivide new.
	self assert: tool fieldTools size equals: 11.

	"Class with both named and indexed instvars."
	self newInspectorToolOn:
		        (SpkTestClassWithNamedAndIndexedInstvars new: 5).
	self assert: tool fieldTools size equals: 8
%

category: 'tests'
method: SpkInspectorToolTest
testOop
	| object |
	self newInspectorToolOn: nil.
	self assert: tool oop equals: 16r14.
	self newInspectorToolOn: 42.
	self assert: tool oop equals: 42 * 8 + 2.
	object := Object new.
	self newInspectorToolOn: object.
	self assert: tool oop equals: object asOop.
	object := SpkTestSubclassOfNil basicNew.
	self newInspectorToolOn: object.
	self assert: tool oop equals: (Reflection oopOf: object)
%

category: 'tests'
method: SpkInspectorToolTest
testSelfDescription

	| description |
	self newInspectorToolOn: nil.
	self assert: tool selfDescription equals: 'nil'.

	self newInspectorToolOn: nil class.
	self assert: tool selfDescription equals: 'UndefinedObject'.

	self newInspectorToolOn: 42.
	self assert: tool selfDescription equals: '42'.

	self newInspectorToolOn: 'Hi!'.
	self assert: tool selfDescription equals: '''Hi!'''.

	self newInspectorToolOn: Object new.
	self assert: tool selfDescription equals: 'anObject'.

	self newInspectorToolOn: SpkTestSubclassOfNil basicNew.
	self assert: tool selfDescription equals: ''.

	self newInspectorToolOn: SpkTestClassWithInfinitePrintOn new.
	description := tool selfDescription.
	self
		assert: description size equals: 250000;
		assert: (description beginsWith: 'done yet? done yet? ');
		assert: (description endsWith: 'done yet? done yet? ')
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

! Class extensions for 'RsrConnection'

!		Instance methods for 'RsrConnection'

category: '*remoteservicereplication-gemstone-test'
method: RsrConnection
_privateRegistryOnlyForTests

	^registry
%

