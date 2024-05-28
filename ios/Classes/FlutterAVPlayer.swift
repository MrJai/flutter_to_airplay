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

class FlutterAVPlayer: NSObject, FlutterPlatformView {
    private var _flutterAVPlayerViewController : AVPlayerViewController;
    
    init(frame:CGRect,
          viewIdentifier: CLongLong,
          arguments: Dictionary<String, Any>,
          binaryMessenger: FlutterBinaryMessenger) {
        _flutterAVPlayerViewController = AVPlayerViewController()
        _flutterAVPlayerViewController.viewDidLoad()
        if let urlString = arguments["url"] {
            let item = AVPlayerItem(url: URL(string: urlString as! String)!)
            _flutterAVPlayerViewController.player = AVPlayer(playerItem: item)
        } else if let filePath = arguments["file"] {
            let appDelegate = UIApplication.shared.delegate as! FlutterAppDelegate
            let vc = appDelegate.window.rootViewController as! FlutterViewController
            let lookUpKey = vc.lookupKey(forAsset: filePath as! String)
            if let path = Bundle.main.path(forResource: lookUpKey, ofType: nil) {
                let item = AVPlayerItem(url: URL(fileURLWithPath: path))
                _flutterAVPlayerViewController.player = AVPlayer(playerItem: item)
            }
    else { // Fixed Issue#29
                let item = AVPlayerItem(url: URL(fileURLWithPath: filePath as! String))
                _flutterAVPlayerViewController.player = AVPlayer(playerItem: item)
            }
        }
        _flutterAVPlayerViewController.player!.play()
    }
    func view() -> UIView {
        return _flutterAVPlayerViewController.view;
    }
    
}

