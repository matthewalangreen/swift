//
//  Shapes.swift
//  SceneKitIntro
//
//  Created by Matt Green on 3/23/19.
//  Copyright © 2019 Matt Green. All rights reserved.
//

import Foundation

enum ShapeType: Int {
    case cone
    case capsule
    case tube
    case sphere
    case torus
    case pyramid
    case cylinder
    case box
    
    static func random() -> ShapeType {
        let maxVal = tube.rawValue
        let rand = arc4random_uniform(UInt32(maxVal+1))
        return ShapeType(rawValue: Int(rand))!
    }
}
