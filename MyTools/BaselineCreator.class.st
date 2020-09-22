Class {
	#name : #BaselineCreator,
	#superclass : #SpPresenter,
	#instVars : [
		'packageNameField',
		'createBaselineButton'
	],
	#category : #MyTools
}

{ #category : #root }
BaselineCreator class >> createBaseline [
	<script>
	self new openWithSpec 
]

{ #category : #specs }
BaselineCreator class >> defaultSpec [

	| heightConstraint |
	heightConstraint := [ :cstr | cstr height: 30 ].
	^ SpBoxLayout newVertical 
		add: #packageNameField withConstraints: heightConstraint;
		add: #createBaselineButton withConstraints: heightConstraint;
		yourself
]

{ #category : #specs }
BaselineCreator class >> title [
	^ 'Baseline Creator'
]

{ #category : #initialization }
BaselineCreator >> createBaselineButtonAction [
	| packageName baselineClass baselineMethodText baselineMethod |
	packageName := packageNameField input text.
	self inform: 'Creating baseline for package named ', packageName asString.
	baselineClass := BaselineOf subclass: ('BaselineOf', packageName) asSymbol instanceVariableNames: ''	classVariableNames: '' package: ('BaselineOf', packageName) asString.
	baselineMethodText := 'baseline: spec
	<baseline>
	spec for: #common do: [
		"Dependency on another baseline"
		"spec baseline: ''Sindarin'' with: [spec repository: ''github://dupriezt/ScriptableDebugger'']."
		spec package: ''', packageName, '''.
		spec package: ''', packageName, '-Tests''
	].'.
	baselineClass compile: baselineMethodText.
	baselineMethod := baselineClass methodNamed: #baseline:.
	baselineMethod protocol: 'baselines'; browse.
]

{ #category : #initialization }
BaselineCreator >> iconManager [
	^ Smalltalk ui icons
]

{ #category : #initialization }
BaselineCreator >> initializePresenter [
	| applicants entryCompletion |
	applicants := RPackageOrganizer default packages collect: [ :pkg | pkg name ].
	entryCompletion := EntryCompletion new
		dataSourceBlock: [ :currText | applicants ];
		filterBlock: [ :currApplicant :currText | currText size > 3 and: [ currApplicant asUppercase includesSubstring: currText asString asUppercase ] ].

	packageNameField := (SpLabelledPresenter label: 'Package Name' input: self newTextInput).
	packageNameField input entryCompletion: entryCompletion.
	createBaselineButton := self newButton label: 'Create Baseline'; action: [self createBaselineButtonAction]; yourself.
]

{ #category : #initialization }
BaselineCreator >> initializeWindow: aWindowPresenter [
	
	super initializeWindow: aWindowPresenter.
	aWindowPresenter
		title: self class title;
		initialExtent: 350@100; "initial width@height of the window"
		windowIcon: (self iconManager iconNamed: #home) "Icon that will be shown in the bottom windowbar for this window"
]
