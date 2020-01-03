Class {
	#name : #MyTools,
	#superclass : #Object,
	#category : #MyTools
}

{ #category : #'world menu' }
MyTools class >> buildMenuItemsOn: aBuilder [ 
	| cat |
	cat := #load.
	(self methodsIn: cat asLowercase)
		do: [ :method | 
			(aBuilder item: ((method pragmaAt: #name:) argumentAt: 1))
				parent: 'MyTools';
				action: [ self execute: method selector ];
				iconName: #smallDoIt ]
]

{ #category : #'world menu' }
MyTools class >> execute: aSelector [
	[ self perform: aSelector.
	self inform: 'Executed with success: ' , aSelector ]
		on: Error
		do: [ :ex | 
			self
				inform:
					'Error during execution.
' , ex asString ]
]

{ #category : #load }
MyTools class >> loadChest [
	<script>
	<name: 'Load Chest'>
	Metacello new
    	baseline: 'Chest';
    	repository: 'github://dupriezt/Chest';
    	load.
]

{ #category : #load }
MyTools class >> loadDebuggerSelector [
	<script>
	<name: 'Load DebuggerSelector'>
	Metacello new
   		baseline: 'DebuggerSelector';
   		repository: 'github://dupriezt/DebuggerSelector';
   		load.
]

{ #category : #load }
MyTools class >> loadInformantNetwork [
	<script>
	<name: 'Load Informant Network'>
	Metacello new
    baseline: 'InformantNetwork';
    repository: 'github://dupriezt/InformantNetwork';
    load.
]

{ #category : #load }
MyTools class >> loadNewTools [
	<script>
	<name: 'Load NewTools'>
    Metacello new
    	baseline: 'NewTools';
    	repository: 'github://pharo-spec/NewTools';
    	load.
]

{ #category : #load }
MyTools class >> loadSindarin [
	<script>
	<name: 'Load Sindarin'>
	Metacello new
    baseline: 'Sindarin';
    repository: 'github://dupriezt/ScriptableDebugger';
    load.
]

{ #category : #load }
MyTools class >> loadSpecProperly [
	<script>
	<name: 'Load Spec Properly'>
    Metacello new
        githubUser: 'pharo-spec' project: 'Spec' commitish: 'master' path: 'src';
        baseline: 'Spec2';
        onConflict: [ :e | e useIncoming ];
        onUpgrade: [ :e | e useIncoming ];
        ignoreImage;
        load
]

{ #category : #'world menu' }
MyTools class >> methodsIn: aProtocol [
	^ (self class methods select: [ :method | method protocol = aProtocol ]) sort: #selector ascending
]

{ #category : #'world menu' }
MyTools class >> worldMenu: aBuilder [
	<worldMenu>
	aBuilder item: 'MyTools';
		order: 20;
		iconName: #smallDoIt;
		with: [ self buildMenuItemsOn: aBuilder ].
]
