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
    
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    //Variables
    var operation: String = ""
    var firstNumber: Double = 0
    var secondNumber: Double = 0
    var isNewNumber: Bool = true
    var insertDot: Bool = false
    var isEndOperation: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        textField.isUserInteractionEnabled = false
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
    
    //Actions
    @IBAction func numberAct(_ sender: UIButton) {
        let num = sender.currentTitle
        
        if isNewNumber {
            if num != "." {
                textField.text = num
                isNewNumber = false
            }
        } else {
            switch num! {
            case ".":
                if (!insertDot) {
                    textField.text = textField.text! + num!
                    insertDot = true
                }
            default:
                textField.text = textField.text! + num!
            }
        }
    }
    
    @IBAction func operatorAct(_ sender: UIButton) {
        operation = sender.currentTitle!
        
        if let rightInput = Double(textField.text!) {
            
            if isEndOperation {
                firstNumber = rightInput;
                isEndOperation = false
            } else {
                firstNumber = Double(lbResult.text!)!
                textField.text = "\(firstNumber)"
            }
        
        } else {
            firstNumber = Double(lbResult.text!)!
            textField.text = "\(firstNumber)"
        }
        
        isNewNumber = true
        
        if (operation == "%")||(operation == "+/-") {
            equalAct(sender)
        }
    }
    
    @IBAction func equalAct(_ sender: UIButton) {
        isNewNumber = true
        
        var result: Double = 0
        
        secondNumber = Double(textField.text!)!
        
        switch operation {
        case "+":
            result = firstNumber + secondNumber
        case "-":
            result = firstNumber - secondNumber
        case "*":
            result = firstNumber * secondNumber
        case "/":
            result = firstNumber / secondNumber
        case "%":
            result = firstNumber / 100
        case "+/-":
            if firstNumber < 0 {
                firstNumber = fabs(firstNumber)
            } else {
                firstNumber = -1 * firstNumber
            }
            
            result = firstNumber
            textField.text = "\(result)"
        default:
            print("Error operation")
        }
        
        lbResult.text = "\(result)"
        isEndOperation = true
        textField.text = ""
    }

    @IBAction func ACAct(_ sender: UIButton) {
        firstNumber = 0
        secondNumber = 0
        textField.text = ""
        lbResult.text = "0"
        isEndOperation = true
    }
    
}
