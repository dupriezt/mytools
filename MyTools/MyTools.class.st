Class {
	#name : #MyTools,
	#superclass : #Object,
	#classVars : [
		'stDebuggerMetaLink'
	],
	#category : #MyTools
}

{ #category : #'world menu' }
MyTools class >> buildMenuItemsOn: aBuilder [ 
	| cat protocolList parent |
"	cat := #root."
	protocolList := { #root. #'echo debugging'. #load }.
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

{ #category : #root }
MyTools class >> createBaseline [ 
	<script>
	<name: 'Create Baseline'>
	BaselineCreator createBaseline
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

{ #category : #'echo debugging' }
MyTools class >> loadDebuggerCommunication [
	<script>
	<name: 'Load DebuggerCommunication'>
	Metacello new
    baseline: 'DebuggerCommunication';
    repository: 'github://dupriezt/DebuggerCommunication';
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

{ #category : #load }
MyTools class >> loadInformantNetwork [
	<script>
	<name: 'Load Informant Network'>
	Metacello new
    baseline: 'InformantNetwork';
    repository: 'github://dupriezt/InformantNetwork';
    load.
]

{ #category : #root }
MyTools class >> loadInquisitor [
	<script>
	<name: 'Load Inquisitor'>
	Metacello new
    baseline: 'Inquisitor';
    repository: 'github://dupriezt/inquisitor';
    load.
]

{ #category : #load }
MyTools class >> loadMyPack [
	<script>
	<name: 'Load MyPack (dummy code)'>
	Metacello new
    baseline: 'MyPack';
    repository: 'github://dupriezt/MyPack';
    load.
	MyClass browse.
	
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

{ #category : #load }
MyTools class >> loadSampleExecution [
	<script>
	<name: 'Load SampleExecution'>
	Metacello new
    	baseline: 'SampleExecution';
    	repository: 'github://dupriezt/SampleExecution';
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
MyTools class >> loadSpecAppSkeleton [
	<script>
	<name: 'Load SpecAppSkeleton'>
	Metacello new
    	baseline: 'SpecAppSkeleton';
    	repository: 'github://dupriezt/SpecAppSkeleton';
    	load.
	SpecAppSkeleton browse
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

{ #category : #adding }
MyTools class >> pharoPackagesNameList [
	"List of names of packages considered as part of base pharo"
	^ #('AST-Core'
'AST-Core-Tests'
'AST-Core-Traits'
'Alien-Core'
'Announcements-Core'
'Announcements-Core-Tests'
'Announcements-Help'
'Athens-Balloon'
'Athens-Cairo'
'Athens-Cairo-Tests'
'Athens-Core'
'Athens-Core-Tests'
'Athens-Examples'
'Athens-Morphic'
'Athens-Text'
'BaselineOfAthens'
'BaselineOfBaseLibraries'
'BaselineOfBasicTools'
'BaselineOfBeacon'
'BaselineOfCalypso'
'BaselineOfCatalog'
'BaselineOfClap'
'BaselineOfClassAnnotation'
'BaselineOfClassParser'
'BaselineOfCommander'
'BaselineOfCommander2'
'BaselineOfDependencyAnalyzer'
'BaselineOfDisplay'
'BaselineOfDrTests'
'BaselineOfEnlumineurFormatter'
'BaselineOfEpicea'
'BaselineOfFlashback'
'BaselineOfFuel'
'BaselineOfFuzzyMatcher'
'BaselineOfGeneralHelp'
'BaselineOfGeneralTests'
'BaselineOfGeometry'
'BaselineOfHeuristicCompletion'
'BaselineOfIDE'
'BaselineOfIceberg'
'BaselineOfKernelTests'
'BaselineOfLibGit'
'BaselineOfManifest'
'BaselineOfMenuRegistration'
'BaselineOfMetacello'
'BaselineOfMicrodown'
'BaselineOfMisc'
'BaselineOfMonticello'
'BaselineOfMorphic'
'BaselineOfMorphicCore'
'BaselineOfNewTools'
'BaselineOfNumericScales'
'BaselineOfOSWindow'
'BaselineOfParametrizedTests'
'BaselineOfPharo'
'BaselineOfPharoBootstrap'
'BaselineOfPharoGT'
'BaselineOfPharoGlamour'
'BaselineOfPillar'
'BaselineOfQA'
'BaselineOfQualityAssistant'
'BaselineOfRefactoring'
'BaselineOfRefactoring2'
'BaselineOfReferenceFinder'
'BaselineOfReflectionMirrors'
'BaselineOfReflectivity'
'BaselineOfRing'
'BaselineOfRoassal3'
'BaselineOfSUnit'
'BaselineOfShift'
'BaselineOfShout'
'BaselineOfSindarin'
'BaselineOfSlot'
'BaselineOfSortFunctions'
'BaselineOfSpec'
'BaselineOfSpec2'
'BaselineOfSpecCore'
'BaselineOfSystemCommands'
'BaselineOfTaskIt'
'BaselineOfTelePharoSupport'
'BaselineOfTonel'
'BaselineOfTraits'
'BaselineOfUI'
'BaselineOfUnifiedFFI'
'BaselineOfZodiac'
'Beacon-Core'
'Beacon-Core-Tests'
'Calypso-Browser'
'Calypso-NavigationModel'
'Calypso-NavigationModel-Tests'
'Calypso-Ring'
'Calypso-SystemPlugins-ClassScripts-Browser'
'Calypso-SystemPlugins-ClassScripts-Queries'
'Calypso-SystemPlugins-ClassScripts-Queries-Tests'
'Calypso-SystemPlugins-Critic-Browser'
'Calypso-SystemPlugins-Critic-Queries'
'Calypso-SystemPlugins-Critic-Queries-Tests'
'Calypso-SystemPlugins-DependencyAnalyser-Browser'
'Calypso-SystemPlugins-Deprecation-Browser'
'Calypso-SystemPlugins-Deprecation-Queries'
'Calypso-SystemPlugins-Deprecation-Queries-Tests'
'Calypso-SystemPlugins-FFI-Browser'
'Calypso-SystemPlugins-FFI-Queries'
'Calypso-SystemPlugins-FFI-Queries-Tests'
'Calypso-SystemPlugins-FileOut-Browser'
'Calypso-SystemPlugins-FileOut-Queries'
'Calypso-SystemPlugins-Flags-Browser'
'Calypso-SystemPlugins-Flags-Queries'
'Calypso-SystemPlugins-Flags-Queries-Tests'
'Calypso-SystemPlugins-InheritanceAnalysis-Browser'
'Calypso-SystemPlugins-InheritanceAnalysis-Queries'
'Calypso-SystemPlugins-InheritanceAnalysis-Queries-Tests'
'Calypso-SystemPlugins-MethodDiffTool'
'Calypso-SystemPlugins-Monticello-Browser'
'Calypso-SystemPlugins-Monticello-Queries'
'Calypso-SystemPlugins-Reflectivity-Browser'
'Calypso-SystemPlugins-Reflectivity-Browser-Tests'
'Calypso-SystemPlugins-Reflectivity-Queries'
'Calypso-SystemPlugins-Reflectivity-Queries-Tests'
'Calypso-SystemPlugins-SUnit-Browser'
'Calypso-SystemPlugins-SUnit-Queries'
'Calypso-SystemPlugins-SUnit-Queries-Tests'
'Calypso-SystemPlugins-Spotter'
'Calypso-SystemPlugins-Traits-Browser'
'Calypso-SystemPlugins-Traits-Queries'
'Calypso-SystemPlugins-Traits-Queries-Tests'
'Calypso-SystemPlugins-Traits-Queries-Tests-PExtendingTrait'
'Calypso-SystemPlugins-Traits-Queries-Tests-PWithTraits'
'Calypso-SystemPlugins-Undeclared-Browser'
'Calypso-SystemPlugins-Undeclared-Queries'
'Calypso-SystemPlugins-Undeclared-Queries-Tests'
'Calypso-SystemQueries'
'Calypso-SystemQueries-Tests'
'Calypso-SystemQueries-Tests-P1WithHierarchy'
'Calypso-SystemQueries-Tests-P2WithSubclassFromP1'
'Calypso-SystemQueries-Tests-P3WithSubclassFromP2'
'Calypso-SystemQueries-Tests-P5WithTags'
'Calypso-SystemQueries-Tests-PExtendedByP1'
'Calypso-SystemQueries-Tests-PExtendedByP5'
'Calypso-SystemQueries-Tests-PWithSingleClass'
'Calypso-SystemTools-Core'
'Calypso-SystemTools-FullBrowser'
'Calypso-SystemTools-FullBrowser-Tests'
'Calypso-SystemTools-OldToolCompatibillity'
'Calypso-SystemTools-QueryBrowser'
'Calypso-SystemTools-QueryBrowser-Tests'
'Clap-CommandLine'
'Clap-Commands-Pharo'
'Clap-Core'
'Clap-Examples'
'Clap-Tests'
'ClassAnnotation'
'ClassAnnotation-Tests'
'ClassParser'
'ClassParser-Tests'
'CodeExport'
'CodeExport-Traits'
'CodeImport'
'CodeImport-Tests'
'CodeImport-Traits'
'CodeImportCommandLineHandlers'
'Collections-Abstract'
'Collections-Abstract-Tests'
'Collections-Abstract-Traits'
'Collections-Arithmetic'
'Collections-Arithmetic-Tests'
'Collections-Atomic'
'Collections-Atomic-Tests'
'Collections-DoubleLinkedList'
'Collections-DoubleLinkedList-Tests'
'Collections-Native'
'Collections-Sequenceable'
'Collections-Sequenceable-Tests'
'Collections-Stack'
'Collections-Stack-Tests'
'Collections-Streams'
'Collections-Streams-Tests'
'Collections-Strings'
'Collections-Strings-Tests'
'Collections-Support'
'Collections-Support-Tests'
'Collections-Tests'
'Collections-Unordered'
'Collections-Unordered-Tests'
'Collections-Weak'
'Collections-Weak-Tests'
'Colors'
'Commander-Activators-ContextMenu'
'Commander-Activators-DragAndDrop'
'Commander-Activators-Mouse'
'Commander-Activators-Shortcut'
'Commander-Activators-TextView'
'Commander-Activators-WorldMenu'
'Commander-Core'
'Commander-Core-Tests'
'Commander-Spec2-Compatibility'
'Commander-SpecSupport'
'Commander2'
'Commander2-Deprecations'
'Commander2-Tests'
'Commander2-UI'
'Commander2-UI-Tests'
'Compression'
'Compression-Tests'
'ConfigurationCommandLineHandler-Core'
'ConfigurationCommandLineHandler-Tests'
'Debugger-Actions'
'Debugger-Model'
'Debugger-Model-Tests'
'Debugger-Oups'
'Debugger-Oups-Tests'
'Debugging-Core'
'Debugging-Utils-Tests'
'Deprecated90'
'DrTests'
'DrTests-CommentsToTests'
'DrTests-CommentsToTests-Tests'
'DrTests-TestCoverage'
'DrTests-TestCoverage-Tests'
'DrTests-TestCoverage-Tests-Mocks'
'DrTests-Tests'
'DrTests-TestsProfiling'
'DrTests-TestsProfiling-Tests'
'DrTests-TestsRunner'
'EmbeddedFreeType'
'EmbeddedFreeType-Tests'
'EmergencyDebugger'
'EmergencyDebugger-Tests'
'EnlumineurFormatter'
'EnlumineurFormatter-Tests'
'Epicea'
'Epicea-Tests'
'EpiceaBrowsers'
'EpiceaBrowsers-Tests'
'EyeInspector'
'FFI-Kernel'
'FFI-OldFFIBackend'
'FFI-Pools'
'FileSystem-Core'
'FileSystem-Disk'
'FileSystem-Memory'
'FileSystem-Path'
'FileSystem-Tests-Attributes'
'FileSystem-Tests-Core'
'FileSystem-Tests-Disk'
'FileSystem-Tests-Memory'
'FileSystem-Zip'
'Files'
'Files-Prompt'
'Files-Tests'
'Flashback-Decompiler'
'Flashback-Decompiler-Tests'
'FluidClassBuilder'
'FluidClassBuilder-Tests'
'Fonts-Abstract'
'Fonts-Chooser'
'Fonts-Infrastructure'
'Fonts-Infrastructure-Tests'
'FormCanvas-Core'
'FormCanvas-Tests'
'Formatter-Settings'
'FreeType'
'FreeType-Help'
'FreeType-Morphic'
'FreeType-Tests'
'Fuel-Core'
'Fuel-Platform-Core'
'Fuel-Platform-Pharo-07'
'Fuel-Platform-Pharo-Core'
'Fuel-Platform-Pharo-Core-Tests'
'Fuel-Tests-Core'
'Fuel-Tools-Pharo'
'FuzzyMatcher'
'FuzzyMatcher-Tests'
'GT-BytecodeDebugger'
'GT-Debugger'
'GT-Inspector'
'GT-InspectorExtensions-Core'
'GT-Playground'
'GT-SUnitDebugger'
'GT-Spotter'
'GT-Spotter-Processors'
'GT-Spotter-UI'
'GT-SpotterExtensions-Core'
'GT-Tests-Debugger'
'GT-Tests-Inspector'
'GT-Tests-Playground'
'GT-Tests-Spotter'
'GT-Tests-Spotter-Processors'
'GeneralRules'
'GeneralRules-Tests'
'Geometry'
'Geometry-Tests'
'Glamour-Announcements'
'Glamour-Browsers'
'Glamour-Core'
'Glamour-FastTable'
'Glamour-Helpers'
'Glamour-Morphic-Brick'
'Glamour-Morphic-Brick-Tests'
'Glamour-Morphic-Pager'
'Glamour-Morphic-Renderer'
'Glamour-Morphic-Theme'
'Glamour-Morphic-Widgets'
'Glamour-PagerModel'
'Glamour-Presentations'
'Glamour-Rubric-Presentations'
'Glamour-SpecIntegration'
'Glamour-Tasks'
'Glamour-Tests-Core'
'Glamour-Tests-Morphic'
'Glamour-Tests-Resources'
'Glamour-Tests-Rubric'
'Gofer-Core'
'Gofer-Tests'
'Graphics-Canvas'
'Graphics-Display Objects'
'Graphics-Files'
'Graphics-Fonts'
'Graphics-Primitives'
'Graphics-Shapes'
'Graphics-Tests'
'Graphics-Transformations'
'Growl'
'HelpSystem-Core'
'HelpSystem-Tests'
'Hermes'
'Hermes-Extensions'
'HeuristicCompletion-Model'
'HeuristicCompletion-Morphic'
'HeuristicCompletion-Tests'
'Hiedra'
'Hiedra-Examples'
'Hiedra-Tests'
'Iceberg'
'Iceberg-Libgit'
'Iceberg-Libgit-Filetree'
'Iceberg-Libgit-Tonel'
'Iceberg-Metacello-Integration'
'Iceberg-Plugin'
'Iceberg-Plugin-GitHub'
'Iceberg-Plugin-Metacello'
'Iceberg-Plugin-Migration'
'Iceberg-Plugin-Pharo'
'Iceberg-TipUI'
'Images-Animated'
'InitializePackagesCommandLineHandler'
'JenkinsTools-Core'
'JenkinsTools-ExtraReports'
'Jobs'
'Jobs-Tests'
'Kernel'
'Kernel-BytecodeEncoders'
'Kernel-Chronology-Extras'
'Kernel-ExtraUtils'
'Kernel-Rules'
'Kernel-Tests'
'Kernel-Tests-Extended'
'Kernel-Tests-Rules'
'Kernel-Tests-WithCompiler'
'Kernel-Traits'
'Keymapping-Core'
'Keymapping-KeyCombinations'
'Keymapping-Pragmas'
'Keymapping-Settings'
'Keymapping-Tests'
'Keymapping-Tools-Spec'
'LibGit-Core'
'LibGit-FileSystem'
'Manifest-Core'
'Manifest-Resources-Tests'
'Manifest-Tests'
'Math-Operations-Extensions'
'MenuRegistration'
'Metacello-Base'
'Metacello-Bitbucket'
'Metacello-Core'
'Metacello-Cypress'
'Metacello-FileTree'
'Metacello-GitBasedRepository'
'Metacello-GitHub'
'Metacello-Gitlab'
'Metacello-Gitlab-Tests'
'Metacello-MC'
'Metacello-PharoCommonPlatform'
'Metacello-PharoExtensions'
'Metacello-Platform'
'Metacello-Reference'
'Metacello-TestsCommonMC'
'Metacello-TestsCore'
'Metacello-TestsMC'
'Metacello-TestsMCCore'
'Metacello-TestsMCResources'
'Metacello-TestsPlatform'
'Metacello-TestsReference'
'Metacello-ToolBox'
'Metacello-Tutorial'
'MetacelloCommandLineHandler-Core'
'MetacelloCommandLineHandler-Tests'
'Microdown'
'Microdown-Calypso'
'Microdown-Pillar'
'Microdown-Pillar-Tests'
'Microdown-RichTextComposer'
'Microdown-Tests'
'Monticello'
'Monticello-OldDataStreamCompatibility'
'Monticello-Tests'
'MonticelloConfigurations'
'MonticelloFileServices'
'MonticelloFileTree-Core'
'MonticelloFileTree-FileSystem-Utilities'
'MonticelloGUI'
'MonticelloGUI-Tests'
'MonticelloMocks'
'MonticelloRemoteRepositories'
'MonticelloTonel-Core'
'MonticelloTonel-FileSystem'
'MonticelloTonel-Tests'
'Moose-Algos-Graph'
'Moose-Algos-Graph-Tests'
'Morphic-Base'
'Morphic-Core'
'Morphic-Examples'
'Morphic-Tests'
'Morphic-Widgets-Basic'
'Morphic-Widgets-ColorPicker'
'Morphic-Widgets-Extra'
'Morphic-Widgets-FastTable'
'Morphic-Widgets-FastTable-Tests'
'Morphic-Widgets-List'
'Morphic-Widgets-Menubar'
'Morphic-Widgets-Pluggable'
'Morphic-Widgets-PolyTabs'
'Morphic-Widgets-Scrolling'
'Morphic-Widgets-Tabs'
'Morphic-Widgets-Taskbar'
'Morphic-Widgets-Taskbar-Tests'
'Morphic-Widgets-TickList'
'Morphic-Widgets-Tree'
'Morphic-Widgets-Windows'
'Multilingual-Encodings'
'NECompletion'
'NECompletion-Morphic'
'NECompletion-Preferences'
'NECompletion-Tests'
'Native-Browser'
'NautilusRefactoring'
'NautilusRefactoring-Tests'
'Network-Kernel'
'Network-MIME'
'Network-Mail'
'Network-Mail-Tests'
'Network-Protocols'
'Network-Tests'
'Network-UUID'
'NewTools-ChangeSorter'
'NewTools-Core'
'NewTools-Debugger'
'NewTools-Debugger-Breakpoints-Tools'
'NewTools-Debugger-Commands'
'NewTools-Debugger-Extensions'
'NewTools-Inspector'
'NewTools-Inspector-Extensions'
'NewTools-MethodBrowsers'
'NewTools-Morphic'
'NewTools-ObjectCentricBreakpoints'
'NewTools-Playground'
'NewTools-Sindarin-Commands'
'NewTools-Sindarin-Tools'
'NewTools-SpTextPresenterDecorators'
'NewTools-SystemReporter'
'NewValueHolder-Core'
'NewValueHolder-Tests'
'NumberParser'
'NumericInterpolator'
'NumericInterpolator-Tests'
'NumericNoise'
'OSWindow-Core'
'OSWindow-SDL2'
'OSWindow-SDL2-Examples'
'OSWindow-Tests'
'OSWindow-VM'
'Ombu'
'Ombu-Tests'
'OpalCompiler-Core'
'OpalCompiler-Tests'
'OpalCompiler-Tools'
'ParametrizedTests'
'PerformMessageCommandLineHandler'
'Pharo-Help'
'Pharo-WelcomeHelp'
'PharoBootstrap-Initialization'
'PharoDocComment'
'PharoDocComment-Tests'
'Pillar-Core'
'Pillar-ExporterRichText'
'Polymorph-Widgets'
'Polymorph-Widgets-Rules'
'PragmaCollector'
'ProfStef-Core'
'ProfStef-Help'
'ProfStef-Tests'
'RPackage-Core'
'RPackage-Tests'
'Random-Core'
'Random-Tests'
'Refactoring-Changes'
'Refactoring-Core'
'Refactoring-Critics'
'Refactoring-Environment'
'Refactoring-Help'
'Refactoring-Tests-Changes'
'Refactoring-Tests-Core'
'Refactoring-Tests-Critics'
'Refactoring-Tests-Environment'
'Refactoring2-Core'
'Refactoring2-Transformations'
'Refactoring2-Transformations-Tests'
'ReferenceFinder-Core'
'ReflectionMirrors-Primitives'
'ReflectionMirrors-Primitives-Tests'
'Reflectivity'
'Reflectivity-Examples'
'Reflectivity-Tests'
'Reflectivity-Tools'
'Reflectivity-Tools-Tests'
'Regex-Core'
'Regex-Core-Tests'
'Regex-Help'
'ReleaseTests'
'Renraku'
'Renraku-Help'
'Renraku-Tests'
'Ring-ChunkImporter'
'Ring-Core'
'Ring-Definitions-Containers'
'Ring-Definitions-Core'
'Ring-Definitions-Monticello'
'Ring-Definitions-Tests-Containers'
'Ring-Definitions-Tests-Core'
'Ring-Definitions-Tests-Monticello'
'Ring-Monticello'
'Ring-OldChunkImporter'
'Ring-RuntimeSupport'
'Ring-Tests-ChunkImporter'
'Ring-Tests-Core'
'Ring-Tests-Monticello'
'Ring-TraitsV2Support'
'Roassal3'
'Roassal3-Animation'
'Roassal3-Animation-Tests'
'Roassal3-Builders'
'Roassal3-Chart'
'Roassal3-Chart-Tests'
'Roassal3-Colors'
'Roassal3-Global-Tests'
'Roassal3-Inspector'
'Roassal3-Interaction'
'Roassal3-Interaction-Tests'
'Roassal3-Layouts'
'Roassal3-Layouts-Tests'
'Roassal3-Legend'
'Roassal3-Menu'
'Roassal3-Pie'
'Roassal3-Shapes'
'Roassal3-Shapes-Tests'
'Roassal3-Spec'
'Roassal3-Spec-Tests'
'Roassal3-Sunburst'
'Roassal3-UML'
'Roassal3-UML-Tests'
'Rubric'
'Rubric-Rules'
'Rubric-SpecFindReplaceDialog'
'Rubric-Styling'
'Rubric-Tests'
'STON-Core'
'STON-Tests'
'STON-Text support'
'SUnit-Core'
'SUnit-Core-Traits'
'SUnit-Help'
'SUnit-Rules'
'SUnit-Support-UITesting'
'SUnit-Support-UITesting-Tests'
'SUnit-Tests'
'SUnit-UI'
'SUnit-Visitor'
'SUnit-Visitor-Tests'
'ScriptingExtensions'
'ScriptingExtensions-Tests'
'Settings-Graphics'
'Settings-Polymorph'
'Settings-System'
'Shift-Changes'
'Shift-ClassBuilder'
'Shift-ClassBuilder-Tests'
'Shift-ClassInstaller'
'Shift-ClassInstaller-Tests'
'Shout'
'Shout-Tests'
'Sindarin'
'Sindarin-Tests'
'Slot-Core'
'Slot-Examples'
'Slot-Tests'
'SortFunctions-Core'
'SortFunctions-Tests'
'Spec-Core'
'Spec-Deprecated'
'Spec-Examples'
'Spec-Layout'
'Spec-MorphicAdapters'
'Spec-PolyWidgets'
'Spec-StubAdapter'
'Spec-Tests'
'Spec2-Adapters-Morphic'
'Spec2-Adapters-Morphic-Tests'
'Spec2-Adapters-Stub'
'Spec2-Backend-Tests'
'Spec2-Code'
'Spec2-Code-Backend-Tests'
'Spec2-Code-Commands'
'Spec2-Code-Morphic'
'Spec2-Code-Tests'
'Spec2-CommandLine'
'Spec2-Commander2'
'Spec2-Commands'
'Spec2-Core'
'Spec2-Examples'
'Spec2-Help'
'Spec2-Interactions'
'Spec2-Layout'
'Spec2-Morphic'
'Spec2-Morphic-Backend-Tests'
'Spec2-Morphic-Examples'
'Spec2-Morphic-Tests'
'Spec2-ObservableSlot'
'Spec2-Tests'
'Spec2-Transmission'
'StartupPreferences'
'System-Announcements'
'System-BasicCommandLineHandler'
'System-BasicCommandLineHandler-Tests'
'System-Caching'
'System-Caching-Tests'
'System-Changes'
'System-Changes-FileServices'
'System-Clipboard'
'System-CommandLine'
'System-CommandLine-TextSupport'
'System-CommandLineHandler'
'System-DependenciesTests'
'System-FileRegistry'
'System-Finalization'
'System-Hashing'
'System-Hashing-Tests'
'System-History'
'System-History-Tests'
'System-Identification'
'System-Identification-Tests'
'System-Installers'
'System-Installers-Tests'
'System-Localization'
'System-Localization-Tests'
'System-Model'
'System-OSEnvironments'
'System-OSEnvironments-Tests'
'System-Object Events'
'System-Object Events-Tests'
'System-Platforms'
'System-Platforms-Tests'
'System-Serial Port'
'System-SessionManager'
'System-SessionManager-Tests'
'System-Settings-Browser'
'System-Settings-Core'
'System-Settings-Rules'
'System-Settings-Tests'
'System-Sound'
'System-Sources'
'System-SourcesCondenser'
'System-Support'
'System-Support-Tests'
'System-VMEvents'
'SystemCommands-ClassCommands'
'SystemCommands-MessageCommands'
'SystemCommands-MethodCommands'
'SystemCommands-PackageCommands'
'SystemCommands-RefactoringSupport'
'SystemCommands-RefactoringSupport-Tests'
'SystemCommands-SourceCodeCommands'
'SystemCommands-VariableCommands'
'TaskIt'
'TaskIt-Tests'
'Tests'
'Text-Core'
'Text-Diff'
'Text-Diff-Tests'
'Text-Edition'
'Text-Edition-Tests'
'Text-Scanning'
'Text-Tests'
'Tool-Base'
'Tool-Catalog'
'Tool-CriticBrowser'
'Tool-DependencyAnalyser'
'Tool-DependencyAnalyser-Tests'
'Tool-DependencyAnalyser-Tests-Data'
'Tool-DependencyAnalyser-UI'
'Tool-Diff'
'Tool-ExternalBrowser'
'Tool-ExternalBrowser-Tests'
'Tool-FileList'
'Tool-FileList-Tests'
'Tool-Finder'
'Tool-Finder-Tests'
'Tool-ImageCleaner'
'Tool-ProcessBrowser'
'Tool-Profilers'
'Tool-Profilers-Tests'
'Tool-Registry'
'Tool-Workspace'
'Tool-Workspace-Tests'
'Tools'
'Tools-CodeNavigation'
'Tools-CodeNavigation-Tests'
'Tools-Test'
'TraitsV2'
'TraitsV2-Compatibility'
'TraitsV2-Tests'
'Transcript-Core'
'Transcript-Core-Traits'
'Transcript-NonInteractive'
'Transcript-NonInteractive-Tests'
'Transcript-Tool'
'UIManager'
'UndefinedClasses'
'UndefinedClasses-Tests'
'Unicode-Initialization'
'UnifiedFFI'
'UnifiedFFI-Legacy'
'UnifiedFFI-Tests'
'VariablesLibrary'
'VariablesLibrary-Tests'
'WebBrowser-Core'
'Zinc-Character-Encoding-Core'
'Zinc-Character-Encoding-Tests'
'Zinc-FileSystem'
'Zinc-HTTP'
'Zinc-HTTP-Examples'
'Zinc-Resource-Meta-Core'
'Zinc-Resource-Meta-FileSystem'
'Zinc-Resource-Meta-Tests'
'Zinc-Tests'
'Zinc-Zodiac'
'Zodiac-Core'
'Zodiac-Extra'
'Zodiac-Tests'
'_UnpackagedPackage')
]

{ #category : #'world menu' }
MyTools class >> refreshTopMenuBar [
	<script>
	self inform: 'Save the MyTools class>>#worldMenu: method to trigger a rebuild of the world menu in the top bar'.
]

{ #category : #root }
MyTools class >> showIcons [
	<script>
	<name: 'Show Icons'>
	Smalltalk ui icons inspect.
	self inform: 'Smalltalk ui icons inspect.
	Smalltalk ui iconNamed: #glamorousOk'
]

{ #category : #adding }
MyTools class >> stDebuggerAddColourToStack: aSpTablePresenter [
	| pharoPackageColour nonPharoPackageColour |
	"Colour used if the package appears in #pharoPackagesNameList, and the selector is not DoIt"
	pharoPackageColour := Color veryVeryLightGray.
	"Colour used if the package does not appear in #pharoPackagesNameList, or the selector if DoIt"
	nonPharoPackageColour := Color paleGreen.
	(aSpTablePresenter columns detect: [ :col | col title = 'Package']) displayBackgroundColor: [ :ctx |
		((self pharoPackagesNameList includes: (ctx method methodClass package name asString)) and: [ ctx method selector ~= #DoIt ]) ifTrue: [ pharoPackageColour ] ifFalse: [nonPharoPackageColour].].
]

{ #category : #root }
MyTools class >> stDebuggerChangeColourInStack [
	<script>
	<name: 'Colour StDebugger Stack'>
	| targetNode |
	stDebuggerMetaLink ifNotNil: [ stDebuggerMetaLink uninstall ].
	stDebuggerMetaLink := MetaLink new
		arguments: #(#receiver);
		control: #after;
		metaObject: self;
		selector: #stDebuggerAddColourToStack:;
		yourself.
	targetNode := ((StDebugger>>#initializeStack) ast body allChildren select: [ :node | node isMessage and: [ node selector = #addColumn: ] ]) last.
"	((StDebugger>>#initializeStack) ast body) link: stDebuggerMetaLink."
	targetNode link: stDebuggerMetaLink.
]

{ #category : #'world menu' }
MyTools class >> worldMenu: aBuilder [
	"Save this method to trigger a rebuild of the worldmenu in the top bar"
	<worldMenu>
	aBuilder item: 'MyTools';
		order: 20;
		iconName: #bitbucket;
		with: [ self buildMenuItemsOn: aBuilder ].
]
