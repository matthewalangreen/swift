//#-hidden-code
import UIKit
import PlaygroundSupport

let liveView = PlaygroundLiveViewController()
PlaygroundPage.current.liveView = liveView

liveView.canvas.drawing { 🐢 in
//#-code-completion(identifier, hide, Canvas, ImageCanvas, GraphicsCanvas PlaygroundCanvas, View, Tortoise, PlaygroundLiveViewController, liveView, canvas. tortoises)
//#-end-hidden-code
//: # CoreMotion Turtle (separate file) 🐢
    🐢.penColor(.red)
    🐢.penDown()
    //🐢.fillColor(.orange)
    
   // 🐢.repeat(100) {
        getMotionData
            { (roll,pitch) in
                roll
                pitch
                🐢.forward(roll)
                if pitch < -2 {
                    🐢.left(5)
                } else if pitch > 2 {
                     🐢.right(5)
                }
                //🐢.left(20)
            }
  //  }
    

  
//#-hidden-code
}
