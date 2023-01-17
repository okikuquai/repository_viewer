.PHONY: build-runner
# run dart code generate with deleting conflicting outputs
build-runner:
	fvm flutter pub run build_runner build --delete-conflicting-outputs