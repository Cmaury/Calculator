//
//  ViewController.swift
//  Calculator
//
//  Created by Chris Maury on 1/8/16.
//  Copyright © 2016 Conversant Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var userIsTyping = false
    
    @IBOutlet weak var display: UILabel!

    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        print("digit = \(digit)" )
        if userIsTyping {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userIsTyping = true
        }
        
        
    }
    
    var operandStack = Array<Double>()

    @IBAction func enter() {
        userIsTyping = true
        operandStack.append(displayValue)
        print("operand Stack = \(operandStack)")
    }

    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
        }
    }
}

