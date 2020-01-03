"
I am a baseline to define the structure and dependencies of the MyTools project.
"
Class {
	#name : #BaselineOfMyTools,
	#superclass : #BaselineOf,
	#category : #BaselineOfMyTools
}

{ #category : #baseline }
BaselineOfMyTools >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			"Packages"
			spec
				package: 'MyTools']
]

{ #category : #accessing }
BaselineOfMyTools >> projectClass [
	^ MetacelloCypressBaselineProject
]
