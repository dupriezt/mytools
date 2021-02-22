Class {
	#name : #ClyCopyMethodAsTextCommand,
	#superclass : #ClyMyToolsSourceCodeAndMethodCommand,
	#category : #MyTools
}

{ #category : #accessing }
ClyCopyMethodAsTextCommand >> defaultMenuIconName [
	^#glamorousBrowse
]

{ #category : #accessing }
ClyCopyMethodAsTextCommand >> defaultMenuItemName [
	^'Copy method as markdown text'
]

{ #category : #execution }
ClyCopyMethodAsTextCommand >> execute [
	| methodAsMarkdownString |
	methodAsMarkdownString := (WriteStream on: String new)
		nextPut: $`;
		nextPutAll: (method methodClass asString);
		nextPutAll: '>>>#';
		nextPutAll: method selector;
		nextPut: $`; cr;
		nextPutAll: '```smalltalk'; cr;
		nextPutAll: method sourceCode; cr;
		nextPutAll: '```';
		contents.
	Clipboard clipboardText: methodAsMarkdownString.
	self inform: 'Copied to clipboard'
]
