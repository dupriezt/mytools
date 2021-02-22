Extension { #name : #Form }

{ #category : #'*MyTools' }
Form class >> importIcon: aFileName [
	| iconName encodedIcon |
	iconName := UIManager default request: 'Icon name? (capitalised: IconName)'.
	encodedIcon := (Base64MimeConverter mimeEncode: aFileName asFileReference binaryReadStream) contents.
	Clipboard clipboardText: 'get', iconName, 'Icon', Character cr asString, Character tab asString, '^ Form fromBinaryStream: (''', encodedIcon, ''')', ' base64Decoded asByteArray readStream'.

]

{ #category : #'*MyTools' }
Form class >> serviceImageAsBackground [
	"Answer a service for setting the desktop background from a given graphical file's contents"
	<formService>
	^ SimpleServiceEntry 
		provider: self 
		label: 'Use graphic as background'
		selector: #setBackgroundFromImageFileNamed:
		description: 'Use the graphic as the background for the desktop'
		buttonLabel: 'Background'
]

{ #category : #'*MyTools' }
Form class >> serviceImportIcon [

	<formService>
	^ SimpleServiceEntry 
		provider: self 
		label: 'Import icon'
		selector: #importIcon:
		description: 'Paste the code generated by this action to create a method that will return the image'
		buttonLabel: 'Background'
]

{ #category : #'*MyTools' }
Form class >> serviceOpenImageInWindow [
	"Answer a service for opening a graphic in a window"
	<formService>
	^ SimpleServiceEntry 
		provider: self 
		label: 'Open graphic in a window'
		selector: #openImageInWindow:
		description: 'Open a graphic file in a window'
		buttonLabel: 'Open'
]

{ #category : #'*MyTools' }
Form class >> services [

	| services |
	services := OrderedCollection new.
	(Pragma allNamed: #formService in: self class) do: [:pragma | 
		pragma method selector isUnary ifTrue: [  
			services add: (self perform: (pragma method selector))
		]
	].
	^ services asArray.
]