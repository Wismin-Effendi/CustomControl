//
//  ViewController.swift
//  Custom Control - Reusable Slider
//
//  Updated and improved from https://www.raywenderlich.com/76433/how-to-make-a-custom-control-swift
//  
//  ** We follow along the tutorial (originally written in Swift 2.0, iOS 6)
//
//  ** Modification were made to make the code run on iOS10, Swift 3.1
//  ** We also add improvement to make RangeSlider @IBInspectable, and the thumb now use custom image
//  **  instead of just simple circle / rectangle.
//
//  Created by Wismin Effendi on 6/7/17.
//  Copyright © 2017 iShinobi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var rangeSlider: RangeSlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rangeSlider.addTarget(self, action: #selector(rangeSliderValueChanged(_:)), for: .valueChanged)
        
    }
    
    override func viewDidLayoutSubviews() {
        let margin: CGFloat = 20.0
        let width = view.bounds.width - 2.0 * margin
        rangeSlider.frame = CGRect(x: margin, y: margin + topLayoutGuide.length, width: width, height: 31.0)
        
        print(rangeSlider.upperValue)
    }

    func rangeSliderValueChanged(_ rangeSlider: RangeSlider) {
        print("Range slider value changed: (\(rangeSlider.lowerValue) \(rangeSlider.upperValue))")
    }

}

