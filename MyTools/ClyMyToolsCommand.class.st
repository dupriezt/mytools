Class {
	#name : #ClyMyToolsCommand,
	#superclass : #SycSourceCodeCommand,
	#category : #MyTools
}

{ #category : #testing }
ClyMyToolsCommand class >> canBeExecutedInContext: aToolContext [
	^ super canBeExecutedInContext: aToolContext
]

{ #category : #activation }
ClyMyToolsCommand class >> contextMenuOrder [
	^ 100
]

{ #category : #testing }
ClyMyToolsCommand class >> isAbstract [
	^ self = ClyMyToolsCommand
]
