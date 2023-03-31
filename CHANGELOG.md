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
