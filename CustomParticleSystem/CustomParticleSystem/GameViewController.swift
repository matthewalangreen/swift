//
//  GameViewController.swift
//  CustomParticleSystem
//
//  Created by Matt Green on 3/26/19.
//  Copyright © 2019 Matt Green. All rights reserved.
//

import UIKit
import SceneKit

var scnView: SCNView!
var scnScene: SCNScene!

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func setupView() {
        scnView = self.view as! SCNView
        scnView.allowsCameraControl = false
        scnView.autoenablesDefaultLighting = true
        scnView.isPlaying = true // don't let it autopause if nothing is on screen
    }
    
    func setupScene() {
        scnScene = SCNScene()
        scnView.scene = scnScene
    }
       
}
