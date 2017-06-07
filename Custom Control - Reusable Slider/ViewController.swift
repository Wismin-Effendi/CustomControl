//
//  ViewController.swift
//  Custom Control - Reusable Slider
//
//  Created by Wismin Effendi on 6/7/17.
//  Copyright © 2017 iShinobi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let rangeSlider = RangeSlider(frame: CGRect.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(rangeSlider)
        
        rangeSlider.addTarget(self, action: #selector(rangeSliderValueChanged(_:)), for: .valueChanged)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.rangeSlider.trackHighlightTinColor = .red
            self.rangeSlider.curvaceousness = 0.0
        }
    }
    
    override func viewDidLayoutSubviews() {
        let margin: CGFloat = 20.0
        let width = view.bounds.width - 2.0 * margin
        rangeSlider.frame = CGRect(x: margin, y: margin + topLayoutGuide.length, width: width, height: 31.0)
    }

    func rangeSliderValueChanged(_ rangeSlider: RangeSlider) {
        print("Range slider value changed: (\(rangeSlider.lowerValue) \(rangeSlider.upperValue))")
    }

}

