Class {
	#name : #ClyInspectNodeCommandCopy,
	#superclass : #ClyMyToolsSourceCodeCommand,
	#category : #MyTools
}

{ #category : #activation }
ClyInspectNodeCommandCopy class >> contextMenuOrder [
	^150
]

{ #category : #accessing }
ClyInspectNodeCommandCopy >> defaultMenuIconName [
	^#comments
]

{ #category : #accessing }
ClyInspectNodeCommandCopy >> defaultMenuItemName [
	^'Inspect node'
]

{ #category : #accessing }
ClyInspectNodeCommandCopy >> execute [
	sourceNode inspect
]
