Extension { #name : 'SpkTaskspaceServiceServer' }

{ #category : '*Sparkle-TonelBrowser-Services-PharoServer' }
SpkTaskspaceServiceServer >> newBrowser: pathString [
	"Sent from client."

	| xTool pTool xService pService |
	xTool := tool newExplorerTool.
	pTool := SpkTonelDirectoryListTool
		         newOnPath: pathString
		         inExplorer: xTool.

	xService := SpkServiceFactory serviceForTool: xTool.
	pService := SpkServiceFactory serviceForTool: pTool.
	pService
		registerWith: self connection;
		initializeFileServices.
	^ SpkExplorerAndPaneServiceServer
		  newForPane: pService
		  inExplorer: xService
]
