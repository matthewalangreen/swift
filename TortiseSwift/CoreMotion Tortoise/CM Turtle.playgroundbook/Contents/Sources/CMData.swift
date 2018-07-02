//
//  GetAccelData.swift
//  
//
//  Created by Matt Green on 6/18/18.
//

import CoreMotion
let motion = CMMotionManager()

/// will send roll, pitch and yaw to the handler on each device motion update
public func getMotionData(_ handler: @escaping (Double, Double) -> Void) {
    var temp: (Double, Double, Double) = (0,0,0)
    var refresh: Double = 5
    if motion.isDeviceMotionAvailable {
        motion.deviceMotionUpdateInterval = 1.0 / refresh
        motion.showsDeviceMovementDisplay = true
        motion.startDeviceMotionUpdates(using: .xMagneticNorthZVertical,
                                        to: OperationQueue.main, withHandler: { (data, error) in
                                            // Make sure the data is valid before accessing it.
                                            if let validData = data {
                                                // Get the attitude relative to the magnetic north reference frame.
                                                let roll = validData.attitude.roll
                                                let pitch = validData.attitude.pitch
                                                //let yaw = validData.attitude.yaw
                                                
                                                // pass the values to the closure to be used outside this async operation
                                                let c: Double = 10
                                                handler(c*roll, c*pitch)
                                            }
        })
    }
}






