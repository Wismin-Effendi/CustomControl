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
            ctx.draw(flip(normalImage.cgImage!), in: self.bounds)
        }

        
        if highlighted {
            if let highlightImage = highlightThumbImage {
                ctx.clear(self.bounds)
                ctx.setFillColor(UIColor.red.cgColor)
                ctx.draw(flip(highlightImage.cgImage!), in: self.bounds)
            }
        }
    }
    
    func flip(_ im: CGImage) -> CGImage {
        let sz = CGSize(width: CGFloat(im.width), height: CGFloat(im.height))
        UIGraphicsBeginImageContextWithOptions(sz, false, 0)
        UIGraphicsGetCurrentContext()?.draw(im, in: CGRect(x: 0, y: 0, width: sz.width, height: sz.height))
        let result = UIGraphicsGetImageFromCurrentImageContext()?.cgImage
        UIGraphicsEndImageContext()
        return result!
    }
    
}


