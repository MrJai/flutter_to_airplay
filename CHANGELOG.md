## 2.4.0

- Added macOS support for `FlutterAVPlayerView`, backed by the native AppKit `AVPlayerView`. Video playback from a URL, file, or asset (including custom HTTP headers and `autoLoop`) now works on both iOS and macOS, completing macOS support alongside the AirPlay picker (issue#31).

## 2.3.0

- Fixed issue#33 - `FlutterAVPlayerView` now accepts an optional `headers` map so network videos that require custom HTTP headers (e.g. an `Authorization` bearer token) can be played and AirPlayed.

## 2.2.0

- Added macOS support for `AirPlayRoutePickerView` and `AirPlayIconButton`, backed by the native AppKit `AVRoutePickerView`. The widgets now render the native picker on both iOS and macOS.
- Added Swift Package Manager support for the iOS plugin, so apps no longer need CocoaPods just to use `flutter_to_airplay`. CocoaPods (via the podspec) is still supported for apps that haven't migrated to SwiftPM yet.
- Removed the unused `Mux-Stats-AVPlayer` CocoaPods dependency from the podspec.
- Upgraded example app dependencies (`cupertino_icons`, `path_provider`) and modernized the example iOS Runner project.
- Raised the minimum supported Flutter version to 3.24.0.

## 2.1.0

_Breaking Changes_:

`filePath` in `FlutterAVPlayerView` is used for files stored in the TemporaryDirectory and the new `assetPath` is used for assets stored in the `rootBundle` of your application.

iOS26 is fully suppported.

## 2.0.5

- Fixed issue#29 - Offline downloaded file not playing

## 2.0.4

- feat: Widget AirPlayRoutePickerView accept onShowPickerView and onClosePickerView callbacks to detect picker states
- feat: Widget AirPlayIconButton show AirPlayRoutePickerView. This button uses your app theme and IconButton style

## 2.0.3

- Update dependencies.

## 2.0.2

- fixed a use case where airplay_route_picker_view was causing a crash if not wrapped in a widget with size. now the widget will have predefined 44 x 44 size, but user can customise it to their use.

## 2.0.1

- Add some examples for frequently asked cases.
  - Example to show reading video from file.
  - Example to show reading video from URL.
  - Example to show how user can add any icon instead of default Airplay icon.

## 2.0.0

- Migrate to null safety.

## 1.0.4

- Fix a crash in AirPlayRoutePickerView when user opens it for the second time.

## 1.0.3

- Fix a crash in AVPlayer.

## 1.0.2

- Add Doc comments those can be used by DartDoc to generate beautiful documentation pages.

## 1.0.1

- Update the formatting as per pub.dev suggestions.
- Add proper comments to the API.

## 1.0.0

This version includes two widgets

**1- FlutterAVPlayerView:** to play a video for given url or file path using native AVPlayer.

**2- AirPlayRoutePickerView:** with an option to airplay it on available Apple devices.

Both of these widgets can be used in the same app or separately.
