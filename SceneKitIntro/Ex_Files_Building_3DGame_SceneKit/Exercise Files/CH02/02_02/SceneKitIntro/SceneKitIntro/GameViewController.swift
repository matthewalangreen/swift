//
//  GameViewController.swift
//  SceneKitIntro
//
//  Created by Mike Wong on 6/5/17.
//  Copyright © 2017 Mike Wong. All rights reserved.
//

import UIKit
import SceneKit

var scnView: SCNView!
var scnScene: SCNScene!

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupScene()
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func setupView() {
        scnView = self.view as! SCNView
    }
    
    func setupScene() {
        scnScene = SCNScene()
        scnView.scene = scnScene
    }

}














