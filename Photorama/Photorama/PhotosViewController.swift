//
//  PhotosViewController.swift
//  Photorama
//
//  Created by Matt Green on 3/29/18.
//  Copyright © 2018 Matt Green. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, UICollectionViewDelegate {
    @IBOutlet var collectionView: UICollectionView!
    
    var store: PhotoStore!
    let photoDataSource = PhotoDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = photoDataSource
        collectionView.delegate = self
        
        store.fetchInterestingPhotos {
            (PhotosResult) -> Void in
            
            switch PhotosResult{
            case let .success(photos): print("Successfully found \(photos.count) photos.")
                self.photoDataSource.photos = photos
            case let .failure(error): print("Error fetching interesting photos \(error)")
                self.photoDataSource.photos.removeAll()
            }
            self.collectionView.reloadSections(IndexSet(integer: 0))
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        let photo = photoDataSource.photos[indexPath.row]
        
        //Donwload the image data, which could take some time
        store.fetchImage(for: photo) {(result) -> Void in
        
            // the index path for the photo might have changed
            // between the start and finish time of the reqest so
            // find the most recent index path
            
            // (Note: You will have an error on the next line; you will fix it soon)
            guard let photoIndex = self.photoDataSource.photos.index(of: photo),
                case let .success(image) = result else {
                    return
            }
            let photoIndexPath = IndexPath(item: photoIndex, section: 0)
            
            // when the request finishes, only update the cell if its still visible
            if let cell = self.collectionView.cellForItem(at: photoIndex) as? PhotoCollectionViewCell {
                cell.update(with: image)
            }
        
        }
    }
    
}












