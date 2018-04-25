
import Foundation
import PlaygroundSupport
import UIKit

PlaygroundPage.current.needsIndefiniteExecution = true

let config = URLSessionConfiguration.default
let session = URLSession(configuration: config)

let urlString = "https://farm1.staticflickr.com/924/40714938095_47f670cfdf_k.jpg"
let url = URL(string: urlString)!
let request = URLRequest(url: url)

let task = session.dataTask(with: request) { (data, response, error) in
    
    guard let imageData = data else {
        return // No Image, handle error
    }
    let image = UIImage(data: imageData)
}
task.resume()
