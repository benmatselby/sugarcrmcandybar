SCHEME ?= sugarcrmcandybar

explain:
	### Welcome
	#
	#
	### Testing
	#
	# -> $$ make test

test:
	xcodebuild test -project sugarcrmcandybar.xcodeproj -scheme "$(SCHEME)"
