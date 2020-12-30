"
Pharo adds Manifest* classes (subclass of PackageManifest), so for now 
we have to have this class present in the GemStone package, so that we
can load packages shared between GemStone and Pharo
"
Class {
	#name : 'PackageManifest',
	#superclass : 'Object',
	#category : 'Sparkle-GemStone'
}
