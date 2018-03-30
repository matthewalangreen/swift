//
//  PhotoStore.swift
//  Photorama
//
//  Created by Matt Green on 3/29/18.
//  Copyright © 2018 Matt Green. All rights reserved.
//

import Foundation

enum PhotosResult {
    case success([Photo])
    case failure(Error)
}

class PhotoStore {
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    
    
    func fetchInterestingPhotos() {
        
        let url  = FlickrAPI.interestingPhotosURL
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
            
            if let jsonData = data {
//                if let jsonString = String(data: jsonData, encoding: .utf8) {
//                    print(jsonString)
//                }
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
                    print(jsonObject)
                } catch let error {
                    print("Error creating JSON object: \(error)")
                }
            } else if let requestError = error {
                print("error fetching interesting photos: \(requestError)")
            } else {
                print("unexpected error with the request")
            }
        }
        task.resume()
    }
}
