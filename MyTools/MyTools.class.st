Class {
	#name : #MyTools,
	#superclass : #Object,
	#category : #MyTools
}

{ #category : #'world menu' }
MyTools class >> buildMenuItemsOn: aBuilder [ 
	| cat protocolList parent |
"	cat := #root."
	protocolList := { #root. #'echo debugging' }.
	protocolList do: [ :protocol |
		parent := 'MyTools'.
		(protocol ~= #root) ifTrue: [
			parent := protocol asString.
			aBuilder item: protocol asString;
				order: 20;
				iconName: #glamorousFolder;
				with: [].	
		].
		(self methodsIn: protocol asLowercase)
		do: [ :method | 
			(aBuilder item: ((method pragmaAt: #name:) argumentAt: 1))
				parent: parent;
				action: [ self execute: method selector ];
				iconName: #smallDoIt ]
		
	]
	"(self methodsIn: cat asLowercase)
		do: [ :method | 
			(aBuilder item: ((method pragmaAt: #name:) argumentAt: 1))
				parent: 'MyTools';
				action: [ self execute: method selector ];
				iconName: #smallDoIt ]"
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

{ #category : #root }
MyTools class >> loadChest [
	<script>
	<name: 'Load Chest'>
	Metacello new
    	baseline: 'Chest';
    	repository: 'github://dupriezt/Chest';
    	load.
]

{ #category : #'echo debugging' }
MyTools class >> loadDebuggerCommunication [
	<script>
	<name: 'Load DebuggerCommunication'>
	Metacello new
    baseline: 'DebuggerCommunication';
    repository: 'github://dupriezt/DebuggerCommunication';
    load.
]

{ #category : #root }
MyTools class >> loadDebuggerSelector [
	<script>
	<name: 'Load DebuggerSelector'>
	Metacello new
   		baseline: 'DebuggerSelector';
   		repository: 'github://dupriezt/DebuggerSelector';
   		load.
]

{ #category : #root }
MyTools class >> loadEventGenerator [
	<script>
	<name: 'Load EventGenerator'>
	Metacello new
    baseline: 'EventGenerator';
    repository: 'github://dupriezt/EventGenerator';
    load.
	EventGenerator browse.
	
]

{ #category : #root }
MyTools class >> loadGloVar [
	<script>
	<name: 'Load GloVar'>
	Metacello new
	    baseline: 'GloVar';
	    repository: 'github://dupriezt/GloVar';
	    load.
]

{ #category : #root }
MyTools class >> loadInformantNetwork [
	<script>
	<name: 'Load Informant Network'>
	Metacello new
    baseline: 'InformantNetwork';
    repository: 'github://dupriezt/InformantNetwork';
    load.
]

{ #category : #root }
MyTools class >> loadMyPack [
	<script>
	<name: 'Load MyPack (dummy code)'>
	Metacello new
    baseline: 'MyPack';
    repository: 'github://dupriezt/MyPack';
    load.
	MyClass browse.
	
]

{ #category : #root }
MyTools class >> loadNewTools [
	<script>
	<name: 'Load NewTools'>
    Metacello new
    	baseline: 'NewTools';
    	repository: 'github://pharo-spec/NewTools';
    	load.
]

{ #category : #'echo debugging' }
MyTools class >> loadPillarConfigBugFailing [
	<script>
	<name: 'Load PillarConfigBug_Failing'>
	Metacello new
    baseline: 'PillarConfigBug_Failing';
    repository: 'github://dupriezt/PillarConfigBug_Failing';
    load.
]

{ #category : #'echo debugging' }
MyTools class >> loadPillarConfigBugWorking [
	<script>
	<name: 'Load PillarConfigBug_Working'>
	Metacello new
    baseline: 'PillarConfigBug_Working';
    repository: 'github://dupriezt/PillarConfigBug_Working';
    load.
]

{ #category : #root }
MyTools class >> loadSampleExecution [
	<script>
	<name: 'Load SampleExecution'>
	Metacello new
    	baseline: 'SampleExecution';
    	repository: 'github://dupriezt/SampleExecution';
    	load.
]

{ #category : #root }
MyTools class >> loadSindarin [
	<script>
	<name: 'Load Sindarin'>
	Metacello new
    baseline: 'Sindarin';
    repository: 'github://dupriezt/ScriptableDebugger';
    load.
]

{ #category : #root }
MyTools class >> loadSpecAppSkeleton [
	<script>
	<name: 'Load SpecAppSkeleton'>
	Metacello new
    	baseline: 'SpecAppSkeleton';
    	repository: 'github://dupriezt/SpecAppSkeleton';
    	load.
]

{ #category : #root }
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
MyTools class >> refreshTopMenuBar [
	<script>
	self inform: 'Save the MyTools class>>#worldMenu: method to trigger a rebuild of the world menu in the top bar'.
]

{ #category : #'world menu' }
MyTools class >> worldMenu: aBuilder [
	"Save this method to trigger a rebuild of the worldmenu in the top bar"
	<worldMenu>
	aBuilder item: 'MyTools';
		order: 20;
		iconName: #smallDoIt;
		with: [ self buildMenuItemsOn: aBuilder ].
]
