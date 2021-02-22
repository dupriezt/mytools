Class {
	#name : #ClyInspectCompiledMethodCommand,
	#superclass : #ClyMyToolsSourceCodeAndMethodCommand,
	#category : #MyTools
}

{ #category : #accessing }
ClyInspectCompiledMethodCommand >> defaultMenuIconName [
	^#glamorousInspect
]

{ #category : #accessing }
ClyInspectCompiledMethodCommand >> defaultMenuItemName [
	^'Inspect Compiled Method'
]

{ #category : #execution }
ClyInspectCompiledMethodCommand >> execute [
	method inspect
]
