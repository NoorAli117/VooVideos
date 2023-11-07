//
//  VideoCollectionViewCell.swift
//  VooVideo
//
//  Created by Noor on 07/11/2023.
//

import UIKit
import AVFoundation

class VideoCollectionViewCell: UICollectionViewCell {
    static let identifier = "VideoCollectionViewCell"
    var player: AVPlayer?
    private var model: VideoModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .red
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with model: VideoModel){
        self.model = model
        configureVideo()
    }
    
    private func configureVideo(){
        guard let model = model else{
            return
        }
        guard let path = Bundle.main.path(forResource: model.videoFileName, ofType: model.videoFileFormat)else{
            print("Faild to load the video \(model.videoFileName) and \( model.videoFileFormat)")
            return
        }
         player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerView = AVPlayerLayer()
        playerView.player = player
        contentView.layer.addSublayer(playerView)
        playerView.frame = contentView.bounds
        player?.volume = 0
        player?.play()
    }
}
