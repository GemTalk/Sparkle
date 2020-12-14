Extension { #name : 'TestAsserter' }

{ #category : 'Announcements-Extensions-GemStone' }
TestAsserter >> should: aBlock notTakeMoreThan: aDuration [
	"Throw an exception if aBlock should take longer than aDuration to run.
	 This is a toy implementation. It is should stop after the time limit.
	 Instead, it just sees how long it took and complains if it was too long."

	| msToRun actualDuration |
	msToRun := Time millisecondsElapsedTime: aBlock.
	actualDuration := Duration seconds: msToRun / 1000.
	self assert: actualDuration <= aDuration
		description: 'Block evaluation took more than the expected ', aDuration printString.
	^ actualDuration
]
