//
//  FlutterAVPlayer.swift
//  flutter_to_airplay
//
//  Created by Junaid Rehmat on 22/08/2020.
//

import Foundation
import AVKit
import MediaPlayer
import Flutter
//import MUXSDKStats

class FlutterAVPlayer: NSObject, FlutterPlatformView {
    private var _flutterAVPlayerViewController : AVPlayerViewController;
    
    init(frame:CGRect,
          viewIdentifier: CLongLong,
          arguments: Dictionary<String, Any>,
          binaryMessenger: FlutterBinaryMessenger) {
        _flutterAVPlayerViewController = AVPlayerViewController()
        _flutterAVPlayerViewController.viewDidLoad()
        let urlString = arguments["url"] as! String
        let item = AVPlayerItem(url: URL(string: urlString)!)
        _flutterAVPlayerViewController.player = AVPlayer(playerItem: item)
//        let playerData = MUXSDKCustomerPlayerData(environmentKey: "ENV_KEY");
//        playerData?.playerName = "AVPlayer"
//        let videoData = MUXSDKCustomerVideoData();
//        videoData.videoIsLive = false;
//        videoData.videoTitle = "Title1"
//        _ = MUXSDKStats.monitorAVPlayerViewController(self, withPlayerName: playName, playerData: playerData!, videoData: videoData);
        _flutterAVPlayerViewController.player!.play()
    }
    func view() -> UIView {
        return _flutterAVPlayerViewController.view;
    }
    
}

