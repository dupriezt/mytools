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
	protocolList := { #root. #'echo debugging'. #load. #workaround. #'pharo language server' }.
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

{ #category : #'pharo language server' }
MyTools class >> getInstructionsForVisualStudioCode [

	<script>
	<name: 'Get instructions'>
('1) Load the Pharo Language Server in this image
2) Open Visual Studio Code
3) ctrl-shift-P, Open Settings (JSON)
4) Copy paste:
    "pharo.pathToImage": "', (SmalltalkImage current imagePath asString copyReplaceAll: '\' with: '\\'), '",
    "pharo.pathToVM": "', (SmalltalkImage current vm fullPath asString copyReplaceAll: '\' with: '\\'), '",
5) Save and quit this image
6) In PharoLauncher, right-click on this image, Show in folder
7) Navigate to pharo-local/iceberg/
8) Drag and drop the iceberg repositories you want to edit onto Visual Studio code') inspect
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
MyTools class >> loadMyPharoFork [
	<script>
	<name: 'Load My Pharo Fork'>
	Metacello new
    baseline: 'Pharo';
    repository: 'github://dupriezt/pharo';
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

{ #category : #'pharo language server' }
MyTools class >> loadPharoLanguageServer [

	<script>
	<name: 'Load PharoLanguageServer'>
	Metacello new
		githubUser: 'badetitou' project: 'Pharo-LanguageServer' commitish: 'v1.0.0' path: 'src';
		baseline: 'PharoLanguageServer';
		load
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

{ #category : #workaround }
MyTools class >> workaroundCannotReclassifyMethods [

	<script>
	<name: 'Workaround: Cannot reclassify methods'>
	ListDialogWindow compile: 'buildSearchMorph
	^ searchMorph := SearchMorph new
			model: self;
			acceptSelector: #searchAccept:;
			updateSelector: #searchUpdate:;
			searchList: self class searchList;
			"keystrokeSelector: #searchKeystroke:"
			yourself.	'
]

{ #category : #workaround }
MyTools class >> workaroundCannotTypePipeCharacter [

	<script>
	<name: 'Workaround: Cannot type pipe | character'>
	RubTextEditor compile: 'changeEmphasis: aKeyboardEvent
	"Change the emphasis of the current selection or prepare to accept characters with the change in emphasis. Emphasis change amounts to a font change.  Keeps typeahead."

	"control 0..9 -> 0..9"

	| keyCode attribute oldAttributes index thisSel colors |
	keyCode := (''0123456789-='' indexOf: aKeyboardEvent keyCharacter ifAbsent: [1]) - 1.
	oldAttributes := self text attributesAt: self pointIndex.
	thisSel := self selection.

	"Decipher keyCodes for Command 0-9..."
	"
	(keyCode between: 1 and: 5) 
		ifTrue: [attribute := TextFontChange fontNumber: keyCode].
	"
	"keyCode = 6 
		ifTrue: [
			colors := #(#black #magenta #red #yellow #green #blue #cyan #white).
			index := UIManager default chooseFrom:  colors title: ''choose color...''.
			index = 0 ifTrue: [^true].
			index <= colors size 
				ifTrue: [attribute := TextColor color: (Color perform: (colors at: index))]
				ifFalse: [
					index := index - colors size - 1.	""Re-number!!!""
					index = 0 ifTrue: [attribute := self chooseColor].
					thisSel ifNil: [^true]	""Could not figure out what to link to""]]."
	(keyCode between: 7 and: 11) 
		ifTrue: [
			aKeyboardEvent shiftPressed 
				ifTrue: [
					keyCode = 10 ifTrue: [attribute := TextKern kern: -1].
					keyCode = 11 ifTrue: [attribute := TextKern kern: 1]]
				ifFalse: [
					attribute := TextEmphasis 
								perform: (#(#bold #italic #narrow #underlined #struckOut) at: keyCode - 6).
					oldAttributes 
						do: [:att | (att dominates: attribute) ifTrue: [attribute turnOff]]]].
	keyCode = 0 ifTrue: [ attribute := TextEmphasis normal ].
	attribute ifNotNil: [
		self applyAttribute: attribute].
	^true'
]

{ #category : #workaround }
MyTools class >> workaroundHomeKeyDoesNotWork [

	<script>
	<name: 'Workaround: Home key does not work'>
	OSKeySymbols class compile: 'data
	^ #(
		(16r0000 OSK_UNKNOWN null)
		(16r000D OSK_RETURN return)
		(16r001B OSK_ESCAPE escape)
		(16r0008 OSK_BACKSPACE backspace)
		(16r0009 OSK_TAB tab)
		(16r0020 OSK_SPACE space)
		(16r0021 OSK_EXCLAIM exclam)
		(16r0022 OSK_QUOTEDBL quotedbl)
		(16r0023 OSK_HASH numbersign)
		(16r0025 OSK_PERCENT percent)
		(16r0024 OSK_DOLLAR underscore)
		(16r0026 OSK_AMPERSAND ampersand)
		(16r0027 OSK_QUOTE apostrophe)
		(16r0028 OSK_LEFTPAREN parenleft)
		(16r0029 OSK_RIGHTPAREN parenright)
		(16r002A OSK_ASTERISK asterisk)
		(16r002B OSK_PLUS plus)
		(16r002C OSK_COMMA comma)	
		(16r002D OSK_MINUS minus)
		(16r002E OSK_PERIOD period)
		(16r002F OSK_SLASH slash)
		(16r0030 OSK_0 0)	
		(16r0031 OSK_1 1)
		(16r0032 OSK_2 2)
		(16r0033 OSK_3 3)
		(16r0034 OSK_4 4)
		(16r0035 OSK_5 5)
		(16r0036 OSK_6 6)
		(16r0037 OSK_7 7)
		(16r0038 OSK_8 8)
		(16r0039 OSK_9 9)
		(16r003A OSK_COLON colon)
		(16r003B OSK_SEMICOLON semicolon)
		(16r003C OSK_LESS less)
		(16r003D OSK_EQUALS equal)
		(16r003E OSK_GREATER greater)
		(16r003F OSK_QUESTION question)
		(16r0040 OSK_AT at)		
		(16r005B OSK_LEFTBRACKET bracketleft)
		(16r005C OSK_BACKSLASH backslash)
		(16r005D OSK_RIGHTBRACKET bracketright)
		(16r005E OSK_CARET asciicircum)
		(16r005F OSK_UNDERSCORE underscore)
		(16r0060 OSK_BACKQUOTE grave)
		(16r0061 OSK_a a)
		(16r0062 OSK_b b)
		(16r0063 OSK_c c)
		(16r0064 OSK_d d)
		(16r0065 OSK_e e)
		(16r0066 OSK_f f)
		(16r0067 OSK_g g)
		(16r0068 OSK_h h)
		(16r0069 OSK_i i)
		(16r006A OSK_j j)
		(16r006B OSK_k k)
		(16r006C OSK_l l)
		(16r006D OSK_m m)
		(16r006E OSK_n n)
		(16r006F OSK_o o)
		(16r0070 OSK_p p)
		(16r0071 OSK_q q)
		(16r0072 OSK_r r)
		(16r0073 OSK_s s)
		(16r0074 OSK_t t)
		(16r0075 OSK_u u)
		(16r0076 OSK_v v)
		(16r0077 OSK_w w)
		(16r0078 OSK_x x)
		(16r0079 OSK_y y)
		(16r007A OSK_z z)
		(16r40000039 OSK_CAPSLOCK Caps_Lock)
		(16r4000003A OSK_F1 f1)
		(16r4000003B OSK_F2 f2)
		(16r4000003C OSK_F3 f3)
		(16r4000003D OSK_F4 f4)
		(16r4000003E OSK_F5 f5)
		(16r4000003F OSK_F6 f6)
		(16r40000040 OSK_F7 f7)
		(16r40000041 OSK_F8 f8)
		(16r40000042 OSK_F9 f9)
		(16r40000043 OSK_F10 f10)
		(16r40000044 OSK_F11 f11)
		(16r40000045 OSK_F12 f12)
		(16r40000046 OSK_PRINTSCREEN printScreen)
		(16r40000047 OSK_SCROLLLOCK scroll_Lock)
		(16r40000048 OSK_PAUSE pause)
		(16r40000049 OSK_INSERT insert)
		(16r4000004A OSK_HOME HOME)
		(16r4000004B OSK_PAGEUP Page_Up)
		(16r007F OSK_DELETE delete)
		(16r4000004D OSK_END end)
		(16r4000004E OSK_PAGEDOWN Page_Down)
		(16r4000004F OSK_RIGHT right)
		(16r40000050 OSK_LEFT left)
		(16r40000051 OSK_DOWN down)
		(16r40000052 OSK_UP up)
		(16r40000053 OSK_NUMLOCKCLEAR num_lock)
		(16r40000054 OSK_KP_DIVIDE kp_divide)
		(16r40000055 OSK_KP_MULTIPLY kp_multiply)
		(16r40000056 OSK_KP_MINUS KP_Subtract)
		(16r40000057 OSK_KP_PLUS KP_Add)
		(16r40000058 OSK_KP_ENTER kp_enter)
		(16r40000059 OSK_KP_1 kp_1)
		(16r4000005A OSK_KP_2 kp_2)
		(16r4000005B OSK_KP_3 kp_3)
		(16r4000005C OSK_KP_4 kp_4)
		(16r4000005D OSK_KP_5 kp_5)
		(16r4000005E OSK_KP_6 kp_6)
		(16r4000005F OSK_KP_7 kp_7)
		(16r40000060 OSK_KP_8 kp_8)
		(16r40000061 OSK_KP_9 kp_9)
		(16r40000062 OSK_KP_0 kp_0)
		(16r40000063 OSK_KP_PERIOD KP_Decimal)
		"(16r40000065 OSK_APPLICATION application)
		(16r40000066 OSK_POWER power)"
		(16r40000067 OSK_KP_EQUALS kp_equal)
		(16r40000068 OSK_F13 f13)
		(16r40000069 OSK_F14 f14)
		(16r4000006A OSK_F15 f15)
		(16r4000006B OSK_F16 f16)
		(16r4000006C OSK_F17 f17)
		(16r4000006D OSK_F18 f18)
		(16r4000006E OSK_F19 f19)
		(16r4000006F OSK_F20 f20)
		(16r40000070 OSK_F21 f21)
		(16r40000071 OSK_F22 f22)
		(16r40000072 OSK_F23 f23)
		(16r40000073 OSK_F24 f24)
		(16r40000074 OSK_EXECUTE execute)
		(16r40000075 OSK_HELP help)
		(16r40000076 OSK_MENU menu)
		(16r40000077 OSK_SELECT select)
		(16r40000078 OSK_STOP break	)
		(16r40000079 OSK_AGAIN redo)
		(16r4000007A OSK_UNDO undo)
		(16r4000007B OSK_CUT cut)
		(16r4000007C OSK_COPY copy)
		(16r4000007D OSK_PASTE paste)
		(16r4000007E OSK_FIND find)
		"(16r4000007F OSK_MUTE mute)
		(16r40000080 OSK_VOLUMEUP volumeup)
		(16r40000081 OSK_VOLUMEDOWN volumedown)
		(16r40000085 OSK_KP_COMMA kp_comma)
		(16r40000086 OSK_KP_EQUALSAS400 kp_equalsas400)
		(16r40000099 OSK_ALTERASE altErase)"
		(16r4000009A OSK_SYSREQ Sys_Req)
		(16r4000009B OSK_CANCEL cancel)
		(16r4000009C OSK_CLEAR clear)
		(16r4000009D OSK_PRIOR prior)
		"(16r4000009E OSK_RETURN2 return2)
		(16r4000009F OSK_SEPARATOR separator)
		(16r400000A0 OSK_OUT out)
		(16r400000A1 OSK_OPER oper)
		(16r400000A2 OSK_CLEARAGAIN clearagain)
		(16r400000A3 OSK_CRSEL CursorSelect)
		(16r400000A4 OSK_EXSEL ExSelect)
		(16r400000B0 OSK_KP_00 kp_00)
		(16r400000B1 OSK_KP_000 kp_000)
		(16r400000B2 OSK_THOUSANDSSEPARATOR thousandsseparator)
		(16r400000B3 OSK_DECIMALSEPARATOR decimalseparator)
		(16r400000B4 OSK_CURRENCYUNIT currencyunit)
		(16r400000B5 OSK_CURRENCYSUBUNIT currencysubunit)
		(16r400000B6 OSK_KP_LEFTPAREN kp_leftparen)
		(16r400000B7 OSK_KP_RIGHTPAREN kp_rightparen)
		(16r400000B8 OSK_KP_LEFTBRACE kp_leftbrace)
		(16r400000B9 OSK_KP_RIGHTBRACE kp_rightbrace)
		(16r400000BA OSK_KP_TAB kp_tab)
		(16r400000BB OSK_KP_BACKSPACE kp_backspace)
		(16r400000BC OSK_KP_A kp_a)
		(16r400000BD OSK_KP_B kp_b)
		(16r400000BE OSK_KP_C kp_c)
		(16r400000BF OSK_KP_D kp_d)
		(16r400000C0 OSK_KP_E kp_e)
		(16r400000C1 OSK_KP_F kp_f)
		(16r400000C2 OSK_KP_XOR kp_xor)
		(16r400000C3 OSK_KP_POWER kp_power)
		(16r400000C4 OSK_KP_PERCENT kp_percent)
		(16r400000C5 OSK_KP_LESS kp_less)
		(16r400000C6 OSK_KP_GREATER kp_greater)
		(16r400000C7 OSK_KP_AMPERSAND kp_ampersand)
		(16r400000C8 OSK_KP_DBLAMPERSAND kp_dblampersand)
		(16r400000C9 OSK_KP_VERTICALBAR kp_verticalbar)
		(16r400000CA OSK_KP_DBLVERTICALBAR kp_dblverticalbar)
		(16r400000CB OSK_KP_COLON kp_colon)
		(16r400000CC OSK_KP_HASH kp_hash)
		(16r400000CD OSK_KP_SPACE kp_space)
		(16r400000CE OSK_KP_AT kp_at)
		(16r400000CF OSK_KP_EXCLAM kp_exclam)
		(16r400000D0 OSK_KP_MEMSTORE kp_memstore)
		(16r400000D1 OSK_KP_MEMRECALL kp_memrecall)
		(16r400000D2 OSK_KP_MEMCLEAR kp_memclear)
		(16r400000D3 OSK_KP_MEMADD kp_memadd)
		(16r400000D4 OSK_KP_MEMSUBTRACT kp_memsubtract)
		(16r400000D5 OSK_KP_MEMMULTIPLY kp_memmultiply)
		(16r400000D6 OSK_KP_MEMDIVIDE kp_memdivide)
		(16r400000D7 OSK_KP_PLUSMINUS kp_plusminus)
		(16r400000D8 OSK_KP_CLEAR kp_clear)
		(16r400000D9 OSK_KP_CLEARENTRY kp_clearentry)
		(16r400000DA OSK_KP_BINARY kp_binary)
		(16r400000DB OSK_KP_OCTAL kp_octal)
		(16r400000DC OSK_KP_DECIMAL kp_decimal)
		(16r400000DD OSK_KP_HEXADECIMAL kp_hexadecimal)"
		(16r400000E0 OSK_LCTRL Control_L)
		(16r400000E1 OSK_LSHIFT Shift_L)
		(16r400000E2 OSK_LALT Alt_L)
		(16r400000E3 OSK_LGUI Super_L)
		(16r400000E4 OSK_RCTRL Control_R)
		(16r400000E5 OSK_RSHIFT Shift_R)
		(16r400000E6 OSK_RALT Alt_R)
		(16r400000E7 OSK_RGUI Super_R)
		"(16r40000101 OSK_MODE mode)
		(16r40000102 OSK_AUDIONEXT audioNext)
		(16r40000103 OSK_AUDIOPREV audioPrev)
		(16r40000104 OSK_AUDIOSTOP audioStop)
		(16r40000105 OSK_AUDIOPLAY audioPlay)
		(16r40000106 OSK_AUDIOMUTE audioMute)
		(16r40000107 OSK_MEDIASELECT mediaSelect)
		(16r40000108 OSK_WWW www)
		(16r40000109 OSK_MAIL mail)
		(16r4000010A OSK_CALCULATOR calculator)
		(16r4000010B OSK_COMPUTER computer)
		(16r4000010C OSK_AC_SEARCH ac_search)
		(16r4000010D OSK_AC_HOME ac_home)
		(16r4000010E OSK_AC_BACK ac_back)
		(16r4000010F OSK_AC_FORWARD ac_forward)
		(16r40000110 OSK_AC_STOP ac_stop)
		(16r40000111 OSK_AC_REFRESH ac_refresh)
		(16r40000112 OSK_AC_BOOKMARKS ac_bookmarks)
		(16r40000113 OSK_BRIGHTNESSDOWN brightnessDown)
		(16r40000114 OSK_BRIGHTNESSUP brightnessUp)
		(16r40000115 OSK_DISPLAYSWITCH displaySwitch)
		(16r40000116 OSK_KBDILLUMTOGGLE kbdIllumToggle)
		(16r40000117 OSK_KBDILLUMDOWN kbdIllumDown)
		(16r40000118 OSK_KBDILLUMUP kbdIllumUp)
		(16r40000119 OSK_EJECT eject)
		(16r4000011A OSK_SLEEP sleep)"
	)'.
	OSKeySymbols initialize
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
