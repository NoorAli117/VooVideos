//
//  ViewController.swift
//  VooVideo
//
//  Created by Noor on 07/11/2023.
//

import UIKit

struct VideoModel {
    let caption: String
    let userName: String
    let audioTrackName: String
    let videoFileName: String
    let videoFileFormat: String
}

class ViewController: UIViewController {

    private var collectionView: UICollectionView?
    private var data = [VideoModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 0..<10{
            let model = VideoModel(caption: "What a beautifull day", userName: "noorali117", audioTrackName: "Janam Fida e Hydari", videoFileName: "video", videoFileFormat: "mp4")
            data.append(model)
        }
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.isPagingEnabled = true
        collectionView?.register(VideoCollectionViewCell.self, forCellWithReuseIdentifier: VideoCollectionViewCell.identifier)
        collectionView?.dataSource = self
        view.addSubview(collectionView!)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = view.bounds
    }


}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = data[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VideoCollectionViewCell.identifier, for: indexPath) as! VideoCollectionViewCell
        cell.configure(with: model)
        return cell
    }
}

