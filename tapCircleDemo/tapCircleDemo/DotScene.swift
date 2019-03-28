//
//  DotScene.swift
//  tapCircleDemo
//
//  Created by Matt Green on 3/11/19.
//  Copyright © 2019 Matt Green. All rights reserved.
//

import SpriteKit

let colorMixer: ColorMixer = ColorMixer.init(colors: palette)
var moving: Bool = true

class DotScene: SKScene {
    
    //let cameraNode = SKCameraNode()
    
    
    
    let colors = [SKColor.yellow, SKColor.red, SKColor.blue, SKColor.purple]

    var dots: [Dot] = []
    
    func addDot(point: CGPoint) {
        let nextColor = colorMixer.mixColors(delta: 0.05)
        let dotObject = Dot.init(firstPoint: point, dotColor: nextColor)
        dotObject.fillColor = nextColor
        dotObject.position = point
        dotObject.lineWidth = 0
        dots.append(dotObject)
        addChild(dotObject)
        print("new dot at \(dotObject.position)")
    }
    
    func cleanUp(_ dot: Dot) {
        if(dot.alpha < 0) {
            dot.removeFromParent()
        }
    }
    
    override func sceneDidLoad() {
        let bounds = UIScreen.main.bounds
        let width = bounds.width
        let height = bounds.height
        let midX = width / 2
        let midY = height / 2
        let firstDot = Dot.init(firstPoint: CGPoint.init(x: midX, y: midY), dotColor: .white)        
        addChild(firstDot)
    }

    //MARK:- Touches
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self)
        addDot(point: location)
    }
    
    //MARK:- Override
    override func update(_ currentTime: TimeInterval) {
       // let bounds = UIScreen.m
        let centerPointVector = CGVector.init(dx: 0, dy: 0)
        
        for dot in dots {
            if(moving) {
                dot.arrive(centerPointVector)
            }
            dot.applyPhysics()
            dot.pulse()
            dot.age()
            cleanUp(dot)
            //print("alpha: \(dot.alpha)")
        }
    }
   
    }
    



