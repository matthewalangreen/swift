//
//  Dot.swift
//  tapCircleDemo
//
//  Created by Matt Green on 3/26/19.
//  Copyright © 2019 Matt Green. All rights reserved.
//

import UIKit
import SpriteKit

class Dot: SKShapeNode {
    // Data
    
    // inherited
    // self.location
    // self.xScale
    // self.yScale
    // self.fillColor
    // self.fillTexture
    // self.lineWidth
    // self.isAntialiased: Bool
    // ... others
    
    // set in default
    var velocity: CGVector = CGVector(dx: -11, dy: -11)
    var acceleration: CGVector = CGVector(dx: -11, dy: -11)
    var radius: CGFloat = CGFloat(Int.random(in: 10 ..< 50))
    var lifespan: CGFloat = CGFloat(Int.random(in: 300 ..< 500))
    var maxForce: CGFloat = 1.2 // 0.4 is default
    var maxSpeed: CGFloat = 16 // 7 is default
    var radiusChange: CGFloat = 0.1 // 0.04 is default
    var deathRate: CGFloat = 0.4 // 0.8 is default
    var counter: Int = 0
    var growing: Bool = true
    
    // overwritten in convenience init
    var firstPoint: CGPoint = CGPoint.init(x: -11, y: -11)
    var location: CGVector = CGVector(dx: -11, dy: -11)
    var newLocation: CGVector = CGVector(dx: -11, dy: -11)
    var dotColor: UIColor = .orange
    
    override init() {
        super.init()
    }
    
    convenience init(firstPoint: CGPoint, dotColor: UIColor) {
        self.init()
        self.init(circleOfRadius: self.radius)
        self.firstPoint = firstPoint
        self.location = CGVector(dx: firstPoint.x, dy: firstPoint.y)
        self.position = firstPoint
        self.newLocation = location
        self.dotColor = dotColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    
    // Methods
    func pulse() {
        counter += 1
        if(counter > 40) {
            counter = 0
            growing = !growing
            radiusChange = -1*radiusChange
        }
        self.xScale += radiusChange * 0.1
        self.yScale += radiusChange * 0.1
    }
    
    func getMaxSpeed() -> CGFloat {
        return maxSpeed
    }
    
    func getMaxForce() -> CGFloat {
        return maxForce
    }
    
    func increaseMaxSpeed() {
        maxSpeed += 0.25
    }
    
    func decreaseMaxSpeed() {
        maxSpeed -= 0.25
    }
    
    func increaseMaxForce() {
        maxForce += 0.25
    }
    
    func decreaseMaxForce() {
        maxForce -= 0.25
    }
    
    func getNewLocation() -> CGVector {
        return newLocation
    }
    
    func setNewLocation(x: CGFloat, y: CGFloat) {
        newLocation = CGVector(dx: x, dy: y)
    }
    
    func getFirstPoint() -> CGPoint {
        return firstPoint
    }
    
    func getRadius() -> CGFloat {
        return self.radius
    }

    func update() {
        //velocity = velocity.sum(acceleration)
        // velocity.limit(maxSpeed) // I may need this but I haven't impelemented yet
        //location = location.sum(velocity)
       // acceleration = acceleration.multiply(0)
        lifespan -= deathRate
        //pulse()
    }
    
    func applyForce(_ force: CGVector) {
        acceleration = acceleration.sum(force)
    }
    
    func seek(target: CGVector) {
        var desired: CGVector = target.difference(location)
        desired = desired.normalize()
        desired = desired.multiply(maxSpeed)
        let steer: CGVector = desired.difference(velocity)
        // steer.limit(maxForce)
        applyForce(steer)
    }
    
    func arrive(_ target: CGVector) {
        var desired: CGVector = target.difference(location)
        let d = desired.length()
        desired = desired.normalize()
        
        if(d < 100) {
            let m: CGFloat = map(val: d, minA: 0, maxA: 100, minB: 0, maxB: maxSpeed)
            desired = desired.multiply(m)
        } else {
            desired = desired.multiply(maxSpeed)
        }
        
        let steer: CGVector = desired.difference(velocity)
        // steer.limit(maxForce)
        applyForce(steer)
    }
    
    func display() {
        // change size, color and location
    }
    
    func isDead() -> Bool {
        if(lifespan < 0.0) {
            return true
        } else {
            return false
        }
    }
       
}

