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

For now it takes only `urlString` and play a video from the network.

```
FlutterAVPlayerView(
              urlString:
                  'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
            ),
```

### Screenshots

Video iPhone | Video iPad | Airplay iPhone | Airplay iPad
------------ | -------------|--------------|--------------
![iPhoneVideo_Butterfly](https://github.com/MrJai/flutter_to_airplay/blob/master/example/screenshots/iPhoneVideo_Butterfly.png) | ![iPadVideo_Butterfly](https://github.com/MrJai/flutter_to_airplay/blob/master/example/screenshots/iPhoneAirplayView.png) | ![AirPlayiPhone](https://github.com/MrJai/flutter_to_airplay/blob/master/example/screenshots/iPadVideo_Butterfly.png) | ![AirPlayiPad](https://github.com/MrJai/flutter_to_airplay/blob/master/example/screenshots/iPadAirplayView.png)

## TODO: 

- [ ] Allow videos from different sources.


# Credit: Inspired by Package 
## [FlutterAirplayPlugin](https://github.com/nksteven/FlutterAirplayPlugin)