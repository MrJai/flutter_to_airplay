//
//  FlutterAVPlayer.swift
//  flutter_to_airplay
//
//  Created by Junaid Rehmat on 22/08/2020.
//

import AppKit
import AVKit
import AVFoundation
import FlutterMacOS

class FlutterAVPlayer: NSView {
    private let _playerView: AVPlayerView
    private var looper: AVPlayerLooper?
    private var playerItem: AVPlayerItem?

    init(
        messenger: FlutterBinaryMessenger,
        viewId: Int64,
        arguments: Dictionary<String, Any>
    ) {
        let autoLoop = arguments["autoLoop"] as? Bool ?? false

        _playerView = AVPlayerView(frame: .zero)
        super.init(frame: .zero)

        let queuePlayer = AVQueuePlayer()

        if let urlString = arguments["url"] as? String, let url = URL(string: urlString) {
            if let headers = arguments["headers"] as? [String: String], !headers.isEmpty {
                let assetOptions: [String: Any] = ["AVURLAssetHTTPHeaderFieldsKey": headers]
                let asset = AVURLAsset(url: url, options: assetOptions)
                playerItem = AVPlayerItem(asset: asset)
            } else {
                playerItem = AVPlayerItem(url: url)
            }
        } else if let filePath = arguments["file"] as? String {
            playerItem = AVPlayerItem(url: URL(fileURLWithPath: filePath))
        } else if let assetPath = arguments["asset"] as? String {
            if let appDelegate = NSApplication.shared.delegate as? FlutterAppDelegate,
                let viewController = appDelegate.mainFlutterWindow?.contentViewController
                    as? FlutterViewController {
                let lookUpKey = viewController.lookupKey(forAsset: assetPath)
                if let path = Bundle.main.path(forResource: lookUpKey, ofType: nil) {
                    playerItem = AVPlayerItem(url: URL(fileURLWithPath: path))
                } else {
                    playerItem = AVPlayerItem(url: URL(fileURLWithPath: assetPath))
                }
            } else {
                playerItem = AVPlayerItem(url: URL(fileURLWithPath: assetPath))
            }
        }

        if let playerItem = playerItem {
            if autoLoop {
                looper = AVPlayerLooper(player: queuePlayer, templateItem: playerItem)
                _playerView.player = queuePlayer
            } else {
                _playerView.player = AVPlayer(playerItem: playerItem)
            }

            _playerView.player?.play()
        }

        _playerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(_playerView)
        NSLayoutConstraint.activate([
            _playerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            _playerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            _playerView.topAnchor.constraint(equalTo: topAnchor),
            _playerView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
