SCHEME ?= sugarcrmcandybar

explain:
	### Welcome
	#
	#
	### Testing
	#
	# -> $$ make test

test:
	xcodebuild -workspace sugarcrmcandybar.xcodeproj/project.xcworkspace/ -scheme "$(SCHEME)" test
