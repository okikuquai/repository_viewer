.PHONY: build-runner
# run dart code generate with deleting conflicting outputs
build-runner:
	fvm flutter pub run build_runner build --delete-conflicting-outputs

.PHONY: ios-pod
# get ios cocoapods dependencies
ios-pod: pub
	fvm flutter precache --ios
	cd ios && pod install

.PHONY: ios-cert
# get ios code sign certifications
ios-cert: ios-bundle
	cd ios && SPACESHIP_SKIP_2FA_UPGRADE=1 rbenv exec bundle exec fastlane match development --readonly
	cd ios && SPACESHIP_SKIP_2FA_UPGRADE=1 rbenv exec bundle exec fastlane match enterprise --readonly