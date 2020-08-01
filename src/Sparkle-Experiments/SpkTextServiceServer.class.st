"
For this little demo of Pharo-to-Pharo, the server and client classes can have identical code, so this can be an empty subclass.
"
Class {
	#name : 'SpkTextServiceServer',
	#superclass : 'SpkTextServiceClient',
	#category : 'Sparkle-Experiments'
}

{ #category : 'initialization' }
SpkTextServiceServer >> initialize [
	super initialize.
	self openTextPresenter
]

{ #category : 'initialization' }
SpkTextServiceServer >> openTextPresenter [
	| presenter |
	presenter := SpkTextPresenter on: self.
	presenter openWithSpec
]
