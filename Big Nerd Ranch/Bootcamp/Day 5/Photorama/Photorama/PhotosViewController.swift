//
//  PhotosViewController.swift
//  Photorama
//
//  Created by Matt Green on 6/21/18.
//  Copyright © 2018 Matt Green. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    
    @IBOutlet var inmageView: UIImageView!
    var store: PhotoStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.fetInterestingPhotos()
    }
}
