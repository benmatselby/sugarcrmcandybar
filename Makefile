SCHEME ?= sugarcrmcandybar

explain:
	### Welcome
	#
	#
	### Testing
	#
	# -> $$ make test

test:
	xcodebuild test -project sugarcrmcandybar.xcodeproj -scheme "$(SCHEME)" CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO
