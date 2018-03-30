//
//  PhotosViewController.swift
//  Photorama
//
//  Created by Matt Green on 3/29/18.
//  Copyright © 2018 Matt Green. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var store: PhotoStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.fetchInterestingPhotos {
            (PhotosResult) -> Void in
            
            switch PhotosResult{
            case let .success(photos): print("Successfully found \(photos.count) photos.")
            case let .failure(error): print("Error fetching interesting photos \(error)")
            }
        }
    }
    
}
