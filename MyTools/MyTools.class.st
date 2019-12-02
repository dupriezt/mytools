Class {
	#name : #MyTools,
	#superclass : #Object,
	#category : #MyTools
}

{ #category : #load }
MyTools class >> loadChest [
	<script>
	Metacello new
    	baseline: 'Chest';
    	repository: 'github://dupriezt/Chest';
    	load.
]

{ #category : #load }
MyTools class >> loadDebuggerSelector [
	<script>
	Metacello new
   		baseline: 'DebuggerSelector';
   		repository: 'github://dupriezt/DebuggerSelector';
   		load.
]

{ #category : #load }
MyTools class >> loadNewTools [
	<script>
    Metacello new
    	baseline: 'NewTools';
    	repository: 'github://pharo-spec/NewTools';
    	load.
]

{ #category : #load }
MyTools class >> loadSindarin [
	<script>
	Metacello new
    baseline: 'Sindarin';
    repository: 'github://dupriezt/ScriptableDebugger';
    load.
]

{ #category : #load }
MyTools class >> loadSpecProperly [
	<script>
    Metacello new
        githubUser: 'pharo-spec' project: 'Spec' commitish: 'master' path: 'src';
        baseline: 'Spec2';
        onConflict: [ :e | e useIncoming ];
        onUpgrade: [ :e | e useIncoming ];
        ignoreImage;
        load
]
