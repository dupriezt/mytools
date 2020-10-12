Class {
	#name : #ClyMyToolsSourceCodeCommand,
	#superclass : #ClyMyToolsCommand,
	#category : #MyTools
}

{ #category : #activation }
ClyMyToolsSourceCodeCommand class >> contextMenuOrder [
	^ 150
]

{ #category : #testing }
ClyMyToolsSourceCodeCommand class >> isAbstract [
	^ self = ClyMyToolsSourceCodeCommand  
]

{ #category : #activation }
ClyMyToolsSourceCodeCommand class >> sourceCodeMenuActivation [
    <classAnnotation>
	"Right-click in the source code pane of calypso"
    ^SycDebuggingMenuActivation 
        byItemOf: MyToolsMenuGroup order: self contextMenuOrder for: ClyMethodSourceCodeContext
]
