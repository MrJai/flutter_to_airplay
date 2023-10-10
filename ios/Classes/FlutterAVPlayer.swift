//
//  FlutterAVPlayer.swift
//  flutter_to_airplay
//
//  Created by Junaid Rehmat on 22/08/2020.
//

import AVKit
import Flutter
import Foundation
import MediaPlayer
import UIKit

class FlutterAVPlayer: NSObject, FlutterPlatformView {
  private var _flutterAVPlayerViewController: AVPlayerViewController

  init(
    frame: CGRect,
    viewIdentifier: CLongLong,
    arguments: [String: Any],
    binaryMessenger: FlutterBinaryMessenger
  ) {
    _flutterAVPlayerViewController = CustomAVPlayerViewController()
    _flutterAVPlayerViewController.viewDidLoad()

    if let urlString = arguments["url"] {
      let item = AVPlayerItem(url: URL(string: urlString as! String)!)
      _flutterAVPlayerViewController.player = AVPlayer(playerItem: item)
    } else if let assetPath = arguments["asset"] {
      let appDelegate = UIApplication.shared.delegate as! FlutterAppDelegate
      let vc = appDelegate.window.rootViewController as! FlutterViewController
      let lookUpKey = vc.lookupKey(forAsset: assetPath as! String)
      if let path = Bundle.main.path(forResource: lookUpKey, ofType: nil) {
        let item = AVPlayerItem(url: URL(fileURLWithPath: path))
        _flutterAVPlayerViewController.player = AVPlayer(playerItem: item)
      }
    } else if let filePath = arguments["file"] {
      let item = AVPlayerItem(url: URL(fileURLWithPath: filePath as! String))
      _flutterAVPlayerViewController.player = AVPlayer(playerItem: item)
    }
    _flutterAVPlayerViewController.player!.play()
  }
  func view() -> UIView {
    return _flutterAVPlayerViewController.view
  }
  func dispose() {
    _flutterAVPlayerViewController.player!.pause()
  }

}

class CustomAVPlayerViewController: AVPlayerViewController {
  var activityIndicator: UIActivityIndicatorView?

  override func viewDidLoad() {
    super.viewDidLoad()
    if player != nil {
      player!.addObserver(
        self, forKeyPath: "timeControlStatus", options: [.old, .new], context: nil)
      activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
      self.contentOverlayView?.addSubview(activityIndicator!)
      activityIndicator?.center = self.view.center
      activityIndicator?.startAnimating()
    }
  }

  override public func observeValue(
    forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?,
    context: UnsafeMutableRawPointer?
  ) {
    if keyPath == "timeControlStatus", let change = change,
      let newValue = change[NSKeyValueChangeKey.newKey] as? Int,
      let oldValue = change[NSKeyValueChangeKey.oldKey] as? Int
    {
      if #available(iOS 10.0, *) {
        let oldStatus = AVPlayer.TimeControlStatus(rawValue: oldValue)
        let newStatus = AVPlayer.TimeControlStatus(rawValue: newValue)

        if newStatus != oldStatus {
          if newStatus == .playing || newStatus == .paused {
            print("stopAnimating")
            activityIndicator?.stopAnimating()
          }
        }
      } else {
        // Fallback on earlier versions
        self.activityIndicator?.stopAnimating()
      }
    }
  }
}
