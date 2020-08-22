# flutter_to_airplay

Flutter plugin to play a video for given url and also with an option to airplay it on available apple devices.

## Getting Started

This plugin provides two widgets,

### 1- AirPlayRoutePickerView

Its tintColor, activeTintColor and backgroundColor, can be set to suit the overall theme of application.

```
AirPlayRoutePickerView(
                tintColor: Colors.white,
                activeTintColor: Colors.white,
                backgroundColor: Colors.transparent,
              )
```


### 2- FlutterAVPlayerView

For now it supports either local file added to flutter project, or a video url.

**To play a network video for given url:**

```
FlutterAVPlayerView(
              urlString:
                  'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
            ),
```

**To play a local video added to the flutter project:**

```
child: FlutterAVPlayerView(
              filePath: 'assets/videos/butterfly.mp4',
            ),
```

## Screenshots

Video iPhone | Airplay iPhone | Video iPad | Airplay iPad
------------ | -------------|--------------|--------------
![iPhoneVideo_Butterfly](https://github.com/MrJai/flutter_to_airplay/blob/master/example/screenshots/iPhoneVideo_Butterfly.png) | ![iPadVideo_Butterfly](https://github.com/MrJai/flutter_to_airplay/blob/master/example/screenshots/iPhoneAirplayView.png) | ![AirPlayiPhone](https://github.com/MrJai/flutter_to_airplay/blob/master/example/screenshots/iPadVideo_Butterfly.png) | ![AirPlayiPad](https://github.com/MrJai/flutter_to_airplay/blob/master/example/screenshots/iPadAirplayView.png)

## TODO: 

- [x] Allow videos add to the Flutter project.
- [ ] Allow videos from more sources, Youtube, etc.


## Disclaimers:

- *Please suggest if you want a feature added to this utility*
- *Please feel free to add any issues or open PRs, I will be actively looking to add to these utilities.*

# Credit: Inspired by Package 
## [FlutterAirplayPlugin](https://github.com/nksteven/FlutterAirplayPlugin)