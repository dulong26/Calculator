//
//  ViewController.swift
//  Calculator
//
//  Created by Vu Thanh Tung on 5/27/17.
//  Copyright © 2017 silverpear. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var distanceBetweenTextFieldAndResultLabel: NSLayoutConstraint!
    @IBOutlet weak var distanceBetweenResultLabelAndMiddleView: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        updateConstraints()
    }

    func updateConstraints() {
        let scale = UIScreen.main.bounds.size.height / 667
        distanceBetweenTextFieldAndResultLabel.constant *= scale
        distanceBetweenResultLabelAndMiddleView.constant *= scale
    }

}

