buildReleaseApk:
	flutter build apk --release

buildDebugApk:
	flutter build apk --debug

buildDebugIos:
	flutter build ios --debug

buildReleaseIos:
	flutter build ios --release

buildAppBundle:
	flutter build appbundle

genCode:
	flutter packages pub run build_runner build --delete-conflicting-outputs
run:
	flutter run

.PHONY: buildReleaseApk buildDebugApk buildDebugIos buildReleaseIos buildAppBundle genCode run