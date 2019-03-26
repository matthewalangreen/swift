//
//  DotScene.swift
//  tapCircleDemo
//
//  Created by Matt Green on 3/11/19.
//  Copyright © 2019 Matt Green. All rights reserved.
//

import SpriteKit

let palette: [color] = [
    (194,86,119),
    (199,122,159),
    (178,116,158),
    (157,111,156),
    (139,108,155),
    (125,110,160),
    (117,114,163),
    (81,90,157),
    (118,145,199),
    (101,174,208),
    (92,153,169),
    (99,172,171),
    (255,131,0),
    (100,170,154),
    (105,166,142),
    (106,166,130)
    ]

let colorMixer: ColorMixer = ColorMixer.init(colors: palette)

class DotScene: SKScene {
    
    let cameraNode = SKCameraNode()
    
    let colors = [SKColor.yellow, SKColor.red, SKColor.blue, SKColor.purple]

    var dots: [SKNode] = []
    
  
    func addDot(point: CGPoint){
        let dot = SKShapeNode(circleOfRadius: 40)
        dot.fillColor = colorMixer.mixColors(delta: 0.05)
        dot.position = point
        dots.append(dot)
        addChild(dot)
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self)
        addDot(point: location)
    }
        
    
   
    
}


