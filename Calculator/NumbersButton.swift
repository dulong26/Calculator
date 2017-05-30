//
//  NumbersButton.swift
//  Calculator
//
//  Created by Vu Thanh Tung on 5/29/17.
//  Copyright © 2017 silverpear. All rights reserved.
//

import UIKit

class NumbersButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupNumberButton()
    }
    
    func setupNumberButton() {
        backgroundColor = UIColor.init(red: 110/255, green: 180/255, blue: 230/255, alpha: 1.0)
        layer.cornerRadius = 8.0
        titleLabel?.font = UIFont.systemFont(ofSize: 20)
        self.setTitleColor(UIColor.white, for: .normal)
    }
}
