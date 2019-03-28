//
//  DotScene.swift
//  tapCircleDemo
//
//  Created by Matt Green on 3/11/19.
//  Copyright © 2019 Matt Green. All rights reserved.
//

import SpriteKit

let colorMixer: ColorMixer = ColorMixer.init(colors: palette)
let myGraph: PolarGraph = PolarGraph.init(aVals[2])

let bounds = UIScreen.main.bounds
let width = bounds.width
let height = bounds.height
let midX = width / 2
let midY = height / 2

var moving: Bool = true

class DotScene: SKScene {
    
    //let cameraNode = SKCameraNode()
    
    
    
    let colors = [SKColor.yellow, SKColor.red, SKColor.blue, SKColor.purple]

    var dots: [Dot] = []
    
    func addDot(point: CGPoint) {
        let nextColor = colorMixer.mixColors(delta: 0.05)
        let dot = Dot.init(firstPoint: point, dotColor: nextColor)
        dot.fillColor = nextColor
        dot.position = point
        dot.lineWidth = 0
        dot.newLocation = myGraph.getNextVector()
        dots.append(dot)
        addChild(dot)
        //print("new dot at \(dotObject.position)")
    }
    
    func cleanUp(_ dot: Dot) {
        if(dot.alpha < 0) {
            dot.removeFromParent()
        }
    }
    
//    override func sceneDidLoad() {
//        let firstDot = Dot.init(firstPoint: CGPoint.init(x: midX, y: midY), dotColor: .white)
//        addChild(firstDot)
//    }

    //MARK:- Touches
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        //print(touches.count)
        let location = touch.location(in: self)
        for _ in 0...3 { addDot(point: location) }
       
    }
    
    //MARK:- Override
    override func update(_ currentTime: TimeInterval) {
       // let bounds = UIScreen.m
        //let centerPointVector = CGVector.init(dx: midX, dy: midY)
        
        for dot in dots {
            if(moving) {
                dot.arrive(dot.newLocation)
            }
            dot.applyPhysics()
            dot.pulse()
            dot.age()
            cleanUp(dot)
            //print("alpha: \(dot.alpha)")
        }
    }
   
    }
    



