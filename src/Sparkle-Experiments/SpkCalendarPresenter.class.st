"
Try to get this dynamic concept working better than the existing demo.

Currently, the dynamic row and column layout classes are very confused -- rows are columns and columns are rows.

But I hear these things are obsolete anyway...

"
Class {
	#name : 'SpkCalendarPresenter',
	#superclass : 'SpCalendarPresenter',
	#category : 'Sparkle-Experiments'
}

{ #category : 'examples' }
SpkCalendarPresenter class >> exampleSimple [
	SpkCalendarPresenter new
		adaptToDate: Date today;
		whenDaySelectedBlock: [ :aDate | UIManager default inform: aDate ];
		openWithSpec
]

{ #category : 'private' }
SpkCalendarPresenter >> daysAfterMonthOf: aDate [
	^ self daysToDisplayCount - aDate month daysInMonth
	  - (self dayBeforeMonthOf: aDate) \\ 7
]

{ #category : 'private' }
SpkCalendarPresenter >> daysButtonsBuilderFrom: aDate [
	^ SpDynamicPresentersListBuilder new
		modelObjects: (self datesToDisplayFor: aDate);
		presenter: SpButtonPresenter
		configuredAs: [ :button :date | 
			button
				label: date dayOfMonth asString;
				enabled: aDate monthIndex = date monthIndex;
				action: [ self dayClicked: date ].
			"Add icon next to current date."
			date julianDayNumber = Date today julianDayNumber
				ifTrue: [ button icon: (self iconNamed: #glamorousGrayCircle) ] ];
		layoutBuilder: (SpDynamicTopToBottomRowsLayout rows: self daysInAWeek);
		yourself
]

{ #category : 'private' }
SpkCalendarPresenter >> daysLabelsBuilder [
	^ SpDynamicPresentersListBuilder new
		  modelObjects: self dayNames;
		  presenter: SpLabelPresenter
		  configuredAs: [ :label :str | label label: str ];
		  layoutBuilder:
			  (SpDynamicTopToBottomRowsLayout rows: self daysInAWeek);
		  yourself
]
