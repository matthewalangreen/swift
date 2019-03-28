//
//  Utilities.swift
//  tapCircleDemo
//
//  Created by Matt Green on 3/26/19.
//  Copyright © 2019 Matt Green. All rights reserved.
//

import UIKit

func colorMixFunction(_ input: CGFloat) -> CGFloat {
    return sin(1.2*input)
}

func lerpColor(_ first: color, _ second: color, _ amount: CGFloat) -> UIColor {
    let r = (1.0 - amount) * first.red + amount * second.red
    let g = (1.0 - amount) * first.green + amount * second.green
    let b = (1.0 - amount) * first.blue + amount * second.blue
    return UIColor(red: r, green: g, blue: b, alpha: 1.0)
}

func map(val: CGFloat, minA: CGFloat, maxA: CGFloat, minB: CGFloat, maxB: CGFloat) -> CGFloat {
    return 1.0
}
