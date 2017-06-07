//
//  RangeSliderThumbLayer.swift
//  Custom Control - Reusable Slider
//
//  Created by Wismin Effendi on 6/7/17.
//  Copyright © 2017 iShinobi. All rights reserved.
//

import UIKit
import QuartzCore

class RangeSliderThumbLayer: CALayer {
    
    var normalThumbImage: UIImage?
    var highlightThumbImage: UIImage?
    
    var highlighted: Bool = false {
        didSet {
            setNeedsDisplay()
        }
    }
    
    weak var rangeSlider: RangeSlider?
    
    override func draw(in ctx: CGContext) {
        
        // Show Icon
        if let normalImage = normalThumbImage {
            ctx.setFillColor(UIColor.yellow.cgColor)
            ctx.draw(normalImage.cgImage!, in: self.bounds)
        }

        
        if highlighted {
            if let highlightImage = highlightThumbImage {
                ctx.clear(self.bounds)
                ctx.setFillColor(UIColor.red.cgColor)
                ctx.draw(highlightImage.cgImage!, in: self.bounds)
            }
        }
    }
    
    func maskImage(originalImage: UIImage, toPath path: UIBezierPath) -> UIImage? {
        UIGraphicsBeginImageContext(originalImage.size)
        path.addClip()
        originalImage.draw(at: CGPoint.zero)
        let maskedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return maskedImage
    }
    
}


