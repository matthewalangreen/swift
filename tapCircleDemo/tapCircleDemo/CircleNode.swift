//
//  CircleNode.swift
//  tapCircleDemo
//
//  Created by Matt Green on 3/27/19.
//  Copyright © 2019 Matt Green. All rights reserved.
//

import SpriteKit

class CircleNode : SKShapeNode {
    
    override init() {
        super.init()
    }
    
    convenience init(width: CGFloat, point: CGPoint) {
        self.init()
        self.init(circleOfRadius: width/2)
        // Do stuff
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
