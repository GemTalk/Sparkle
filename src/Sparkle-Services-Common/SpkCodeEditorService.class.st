"
Abstract. A service for editing code. Notable concrete subclasses edit workspace code (no method pattern) or methods (with method pattern).

    Instance Variables
	savedSource:		<String> The version of the source code previously accepted
	unsavedSource:		<String> Source code as it currently exists in the editor, accepted or not.


    Implementation Points

	We keep both saved and unsaved source so we can tell whether there are unsaved 
	changes through a simple comparison of these two strings.
	
	Saves and cancels are undo-able through the tool.
"
Class {
	#name : 'SpkCodeEditorService',
	#superclass : 'RsrService',
	#instVars : [
		'oldSourceCode',
		'newSourceCode'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'initialization' }
SpkCodeEditorService >> initialize [

	super initialize.
	oldSourceCode := newSourceCode := ''
]

{ #category : 'accessing' }
SpkCodeEditorService >> newSourceCode [

	^ newSourceCode
]

{ #category : 'accessing' }
SpkCodeEditorService >> newSourceCode: aString [

	newSourceCode := aString
]
