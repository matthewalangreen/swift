//
//  PhotosViewController.swift
//  Photorama
//
//  Created by Matt Green on 3/29/18.
//  Copyright © 2018 Matt Green. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    
    var store: PhotoStore!
    let photoDataSource = PhotoDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = photoDataSource
        
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
    
}
