import CoreMotion
import PlaygroundSupport

let motion = CMMotionManager()

/// will send roll, pitch and yaw to the handler on each device motion update
func startQueuedUpdates(_ handler: @escaping (Double, Double, Double) -> Void) {
    var temp: (Double, Double, Double) = (0,0,0)
    if motion.isDeviceMotionAvailable {
        motion.deviceMotionUpdateInterval = 1.0 / 60.0
        motion.showsDeviceMovementDisplay = true
        motion.startDeviceMotionUpdates(using: .xMagneticNorthZVertical,
                                             to: OperationQueue.main, withHandler: { (data, error) in
            // Make sure the data is valid before accessing it.
            if let validData = data {
                // Get the attitude relative to the magnetic north reference frame.
                let roll = validData.attitude.roll
                let pitch = validData.attitude.pitch
                let yaw = validData.attitude.yaw
                
                // pass the values to the closure to be used outside this async operation
                handler(roll, pitch, yaw)
            }
        })
    }
}


PlaygroundPage.current.needsIndefiniteExecution = true

// this is the closure being passed into the startQueuedUpdates() function
// we're using the closure to get data back out of the function that is being run async
startQueuedUpdates {
    (roll, pitch, yaw) in
    // do something
    roll
    pitch
    yaw
}




