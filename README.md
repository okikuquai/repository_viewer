# Repository Viewer

## About

This app was created for training Flutter and its code

## Requirement

- Dart 2.18.7
- Flutter 3.3.10

## How to setup development environment

<details>
<summary>Steps</summary>

1. Install [Dart](https://dart.dev/)
    - Follow the instruction described at [Get the Dart SDK](https://dart.dev/get-dart)
    - If you're on macOS, you can install Dart with [Homebrew](https://brew.sh/)
      ```
      brew tap dart-lang/dart
      brew install dart
      ```
2. Install [fvm](https://github.com/leoafarias/fvm)
   ```
   dart pub global activate fvm
   ```
3. Install Flutter
   ```
   fvm install
   ```
4. Run `graphql_codegen` plugin to generate code
   ```
   make build-runner
   ```
5. Install Dart packages
   ```
   fvm flutter pub get
   ```
6. Install [rbenv](https://github.com/rbenv/rbenv)
    - Follow the instruction described at https://github.com/rbenv/rbenv#installation
    - If you're on macOS, you can install rbenv with [Homebrew](https://brew.sh/)
      ```
      brew install rbenv
      ```
7. Install [Ruby](https://www.ruby-lang.org/)
   ```
   rbenv install
   ```
8. Install [CocoaPods](https://cocoapods.org/)
   ```
   rbenv exec gem install cocoapods
   ```
9. Install CocoaPods dependencies
   ```
   make ios-pod
   ```
10. Obtain certificates and provisioning profiles to sign iOS app for development
    ```
    make ios-cert
    ```
</details>

## Github token Setting
Please create Personal Access Token below scopes
- [x] : repo
    - [x] : repo:status
    - [x] : repo_deployment
    - [x] : public_repo
    - [x] : repo:invite
    - [x] : security_events
- [ ] : admin:org
    - [ ] : write:org
    - [x] : read:org
    - [ ] : manage_runners:org
## How to build
All you have to do is just type the following line on the directory with Terminal:
### for Android
```shell
fvm flutter build apk --release \
  --target lib/main.dart \
  --dart-define=Github_DefaultToken={Github token} \
  --dart-define=Github_DefaultOrganization={Default Github organization name}
```
### for iOS
```shell
fvm flutter build ios --release \
  --config-only \
  --target lib/main.dart \
  --dart-define=Github_DefaultToken={Github token} \
  --dart-define=Github_DefaultOrganization={Default Github organization name}
cd ios && bundle exec fastlane deploy
```

And you can build and run the app ☕️.