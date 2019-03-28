//
//  DotScene.swift
//  tapCircleDemo
//
//  Created by Matt Green on 3/11/19.
//  Copyright © 2019 Matt Green. All rights reserved.
//

import SpriteKit

// 16 colors
let palette: [color] = [
    (194/255,86/255,119/255),
    (199/255,122/255,159/255),
    (178/255,116/255,158/255),
    (157/255,111/255,156/255),
    (139/255,108/255,155/255),
    (125/255,110/255,160/255),
    (117/255,114/255,163/255),
    (81/255,90/255,157/255),
    (118/255,145/255,199/255),
    (101/255,174/255,208/255),
    (92/255,153/255,169/255),
    (99/255,172/255,171/255),
    (255/255,131/255,0/255),
    (100/255,170/255,154/255),
    (105/255,166/255,142/255),
    (106/255,166/255,130/255)
    ]
let colorMixer: ColorMixer = ColorMixer.init(colors: palette)

class DotScene: SKScene {
    
    //let cameraNode = SKCameraNode()
    
    let colors = [SKColor.yellow, SKColor.red, SKColor.blue, SKColor.purple]

    var dots: [Dot] = []
    
    func testColors() {
        for i in 0...15 {
            let loc = CGPoint(x: 400, y: 1800 - 90*i)
            let temp = palette[i]
            addDot(point: loc, color: UIColor(red: temp.red, green: temp.green, blue: temp.blue, alpha: 1.0))
        }
    }
    
   
   
    func addDotObject(point: CGPoint) {
        let nextColor = colorMixer.mixColors(delta: 0.05)
        let dotObject = Dot.init(firstPoint: point, dotColor: nextColor)
        dotObject.fillColor = nextColor
        dotObject.position = point
        dotObject.lineWidth = 0
        dots.append(dotObject)
        addChild(dotObject)
        print("new dot at \(dotObject.position)")
    }

    
    func addDot(point: CGPoint){
        let dot = SKShapeNode(circleOfRadius: 40)
        dot.fillColor = colorMixer.mixColors(delta: 0.05)
        //dot.fillColor = .blue
        dot.position = point
        dot.lineWidth = 0
        dots.append(dot as! Dot)
        addChild(dot)
    }
    
    func addDot(point: CGPoint, color: UIColor){
        let dot = SKShapeNode(ellipseOf: CGSize(width: 80, height: 80))
        dot.fillColor = color
        dot.position = point
        dot.lineWidth = 0
        dots.append(dot as! Dot)
        addChild(dot)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self)
        //addDot(point: location)
        addDotObject(point: location)
       // testColors()
    }
    
    override func update(_ currentTime: TimeInterval) {
        for dot in dots {
            dot.pulse()
            dot.age()
            cleanUp(dot)
            print("alpha: \(dot.alpha)")
        }
    }
    
    
    // MARK:- TODO
    // Fix this... it doesn't make sense in new context
    func cleanUp(_ dot: Dot) {
        if(dot.alpha < 0) {
            dot.removeFromParent()
        }
    }
//            let displaySize: CGRect = UIScreen.main.bounds
//            let displayWidth = displaySize.width
//
//        // remove dot if its too big...
//            if(dot.xScale * dot.radius > displayWidth * 2) {
//                dot.removeFromParent()
//                print("dot removed")
//            }
//        }
    }
    



