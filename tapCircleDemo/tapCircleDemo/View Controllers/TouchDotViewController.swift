//
//  TouchDotViewController.swift
//  tapCircleDemo
//
//  Created by Matt Green on 3/11/19.
//  Copyright © 2019 Matt Green. All rights reserved.
//

import UIKit
import SpriteKit

class TouchDotViewController: UIViewController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeLeft
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screen = UIScreen.main.bounds
        //let scene = DotScene(size: CGSize(width: 1536, height: 2048))
        let scene = DotScene(size: CGSize(width: screen.width, height: screen.height))
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        //scene.scaleMode = .aspectFill
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
        
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

