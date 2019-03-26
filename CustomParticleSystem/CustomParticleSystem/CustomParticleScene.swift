//
//  CustomParticle.swift
//  CustomParticleSystem
//
//  Created by Matt Green on 3/26/19.
//  Copyright © 2019 Matt Green. All rights reserved.
//

import SceneKit

struct Settings {
    
    static var numberOfParticles = 30
    static var particleBirthRate:CGFloat = 5   //Means 5 particles per second, 0.2 means one particle in 5 seconds etc.
}

class CustomParticleScene: SCNScene {
    
    var positions = [CGPoint]()
    var colors = [UIColor]()
    
    var emitterNode: SCNNode?
    
    var currentPosition = 0
    
    override func didMove(to view: SCNView) {
        
        backgroundColor = UIColor.black
        
        
        emitterNode = SKEmitterNode(fileNamed: "rain.sks")
        
        if let emitter = emitterNode {
            
            emitter.position = CGPoint(x: frame.midX, y: frame.midY)
            emitter.particleBirthRate = Settings.particleBirthRate
            addChild(emitter)
            
            
            let radius = 50.0
            let center = CGPoint.zero
            
            for var i in 0...Settings.numberOfParticles {
                
                //Randomize color
                colors.append(SKColor(red: 0.78, green: CGFloat(i * 8) / 255.0, blue: 0.38, alpha: 1))
                
                //Create some points on a perimeter of a given circle (radius = 40)
                let angle = Double(i) * 2.0 * Double.pi / Double(Settings.numberOfParticles)
                let x = radius * cos(angle)
                let y = radius * sin(angle)
                
                
                let currentParticlePosition = CGPoint.init(x: CGFloat(x) + center.x, y: CGFloat(y) + center.y)
                
                positions.append(currentParticlePosition)
                
                if i == 1 {
                    /*
                     Set start position for the first particle.
                     particlePosition is starting position for each particle in the emitter's coordinate space. Defaults to (0.0, 0,0).
                     */
                    emitter.particlePosition = positions[0]
                    emitter.particleColor = colors[0]
                    
                    self.currentPosition += 1
                }
                
            }
            
            // Added just for debugging purposes to show positions for every particle.
            for particlePosition in positions {
                
                let sprite = SKSpriteNode(color: SKColor.orange, size: CGSize(width: 1, height: 1))
                sprite.position = convert(particlePosition, from: emitter)
                sprite.zPosition = 2
                addChild(sprite)
            }
            
            
            let block = SKAction.run({
                
                // Prevent strong reference cycles.
                [unowned self] in
                
                if self.currentPosition < self.positions.count {
                    
                    // Set color for the next particle
                    emitter.particleColor = self.colors[self.currentPosition]
                    
                    // Set position for the next particle. Keep in mind that particlePosition is a point in the emitter's coordinate space.
                    emitter.particlePosition = self.positions[self.currentPosition]
                    
                    self.currentPosition += 1
                    
                } else {
                    
                    //Stop the action
                    self.removeAction(forKey: "emitting")
                    emitter.particleBirthRate = 0
                }
                
            })
            
            
            // particleBirthRate is a rate at which new particles are generated, in particles per second. Defaults to 0.0.
            
            let rate = TimeInterval(CGFloat(1.0) / Settings.particleBirthRate)
            
            let sequence = SKAction.sequence([SKAction.wait(forDuration: rate), block])
            
            let repeatAction = SKAction.repeatForever(sequence)
            
            
            run(repeatAction, withKey: "emitting")
        }
        
    }
}
