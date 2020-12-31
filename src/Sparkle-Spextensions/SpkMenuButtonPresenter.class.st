"
A MenuButtonPresenter that refuses to take keyboard focus.
"
Class {
	#name : 'SpkMenuButtonPresenter',
	#superclass : 'SpkIconButtonPresenter',
	#instVars : [
		'menu'
	],
	#category : 'Sparkle-Spextensions-Presenters'
}

{ #category : 'api' }
SpkMenuButtonPresenter >> action: aBlock [

	"A menu button's action is always to open its menu"

	self shouldNotImplement
]

{ #category : 'initialization' }
SpkMenuButtonPresenter >> initialize [

	super initialize.
	action := [ 
	          menu ifNotNil: [ :m | 
		          m openWithSpecAt: self currentHand position ] ]
]

{ #category : 'accessing' }
SpkMenuButtonPresenter >> menu [

	^ menu
]

{ #category : 'accessing' }
SpkMenuButtonPresenter >> menu: anObject [

	menu := anObject
]
