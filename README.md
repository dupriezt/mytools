# mytools

A repository I can load in my images to conveniently load my other tools.

```Smalltalk
Metacello new
    baseline: 'MyTools';
    repository: 'github://dupriezt/MyTools';
    load.
```


If you want this package to be automatically loaded in every new pharo image, create a `installMyTools.st` file located at `(FileLocator preferences / 'pharo') asFileReference` on your drive (run this expression in a pharo image on your device to get the path) and containing:
```Smalltalk
StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'Load Settings'
		code: [ 
			Metacello new
    		baseline: 'MyTools';
    		repository: 'github://dupriezt/MyTools';
    		load.
		]
		runOnce: true
}
```
