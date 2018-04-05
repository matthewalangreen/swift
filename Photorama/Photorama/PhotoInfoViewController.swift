//
//  PhotoInfoViewController.swift
//  Photorama
//
//  Created by Matt Green on 4/5/18.
//  Copyright © 2018 Matt Green. All rights reserved.
//

import UIKit

class PhotoInfoViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    var photo: Photo! {
        didSet {
            navigationItem.title = photo.title
        }
    }
    
    var store: PhotoStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.fetchImage(for: photo) { (result) -> Void in
            switch result {
            case let .success(image):
                self.imageView.image = image
            case let .failure(error):
                print("error fetching the image for photo: \(error)")
            }
        }
    }
    
}
