//
//  ImageGridViewController.swift
//  FancyFlickr
//
//  Created by Roman Osadchuk on 2/5/17.
//  Copyright © 2017 Osadchuk. All rights reserved.
//

import UIKit

import Alamofire
import ObjectMapper
import Kingfisher

class ImageGridViewController: UIViewController {
    
    @IBOutlet weak var imageGridCollectionView: UICollectionView!
    
    var imagesRequestArray = [GetSinglePhotoRequest]()
    
//MARK: - LifeCycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Alamofire.request(GetPhotosRequest().flickrGetPhotosRequest()).responseJSON { response in
            if (response.error != nil) {
                print(response.error!)
                return
            }
            
            guard let JSON = response.result.value as? [String : Any] else {
                return
            }
            
            guard let photos = JSON["photos"] as? [String : Any] else {
                return
            }
            
            guard let photoArray = photos["photo"] as? [[String : Any]] else {
                return
            }
            
            self.imagesRequestArray = Mapper<GetSinglePhotoRequest>().mapArray(JSONArray: photoArray)!
            self.imageGridCollectionView.reloadData()
        }
    }
}

extension ImageGridViewController: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imagesRequestArray.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageGridCollectionViewCell", for: indexPath) as! ImageGridCollectionViewCell
        
        let request = self.imagesRequestArray[indexPath.row].getSinglePhotoRequest()
        
        if let url = request?.url {
            cell.gridImageView.kf.setImage(with: url)
        }
        return cell
    }
    
}
