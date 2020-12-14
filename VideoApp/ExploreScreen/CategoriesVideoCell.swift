//
//  CategoriesVideoCell.swift
//  VideoApp
//
//  Created by Shubham Tunwal on 12/12/20.
//

import UIKit
import AVFoundation


class CategoriesVideoCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    @IBOutlet weak var categoryTitle: UILabel!
    var videos:[Node]?
    var position:Int!
    
    var sceneContext:UIViewController?
    
    @IBOutlet weak var videosCollectionView: UICollectionView!
    
    

    override func awakeFromNib() {
        self.videosCollectionView.dataSource = self
        self.videosCollectionView.delegate = self
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return videos!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "videoCell", for:indexPath) as! VideoCVCell

        
        if let thumbnailImage = getThumbnailImage(forUrl: URL(string:  videos![indexPath.row].video.encodeURL)!) {


            cell.imgThumbnail.image = thumbnailImage
           
            }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "PlayerScreenVC") as! PlayerScreenVC
        
        destination.category = categoryTitle.text
        destination.videos = videos
        destination.position = indexPath.row
        sceneContext?.present(destination, animated: true, completion: nil)
        
    }
    
    
    func getThumbnailImage(forUrl url: URL) -> UIImage? {
        let asset: AVAsset = AVAsset(url: url)
        let imageGenerator = AVAssetImageGenerator(asset: asset)

        do {
            let thumbnailImage = try imageGenerator.copyCGImage(at: CMTimeMake(value: 1, timescale: 60) , actualTime: nil)
            
            return UIImage(cgImage: thumbnailImage)
        } catch let error {
            print(error)
        }

        return nil
    }
    
    

}
