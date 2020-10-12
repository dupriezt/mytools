Class {
	#name : #MyToolsMenuGroup,
	#superclass : #CmdMenuGroup,
	#category : #MyTools
}

{ #category : #parents }
MyToolsMenuGroup class >> parentGroup [
    ^ ClyDebuggingMenuGroup
]

{ #category : #accessing }
MyToolsMenuGroup >> iconName [
	^#bitbucket
]

{ #category : #testing }
MyToolsMenuGroup >> isInlined [
	^false
]

{ #category : #accessing }
MyToolsMenuGroup >> name [
	^ 'MyTools'
]

{ #category : #testing }
MyToolsMenuGroup >> order [
	^0.5
]
