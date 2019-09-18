//
//  ColorDetailVoewController.swift
//  RainbowPT3
//
//  Created by Joseph Rogers on 9/17/19.
//  Copyright © 2019 Joe Rogers. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var cellColor: MyColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let cellColor = cellColor {
            title = cellColor.name
            view.backgroundColor = cellColor.color
        }
        
    }
    
    
    
}
