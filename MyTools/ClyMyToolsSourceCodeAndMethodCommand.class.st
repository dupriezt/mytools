Class {
	#name : #ClyMyToolsSourceCodeAndMethodCommand,
	#superclass : #ClyMyToolsSourceCodeCommand,
	#category : #MyTools
}

{ #category : #activation }
ClyMyToolsSourceCodeAndMethodCommand class >> contextMenuOrder [
	^ 100
]

{ #category : #testing }
ClyMyToolsSourceCodeAndMethodCommand class >> isAbstract [
	^ self = ClyMyToolsSourceCodeAndMethodCommand 
]

{ #category : #activation }
ClyMyToolsSourceCodeAndMethodCommand class >> methodMenuActivation [
	"Right click on a method in the rightmost pane of calypso"
	<classAnnotation>
	^ CmdContextMenuActivation byItemOf: MyToolsMenuGroup order: self contextMenuOrder for: ClyMethod asCalypsoItemContext
]
