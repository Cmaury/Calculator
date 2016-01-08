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
        operandStack.append(displayValue)
        userIsTyping = false
        print("operand Stack = \(operandStack)")
    }

    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if userIsTyping {
            enter()
        }
        switch operation {
        case "x": perfornOperation {$0 * $1 }
        case "/": perfornOperation {$1 / $0 }
        case "+": perfornOperation {$0 + $1 }
        case "-": perfornOperation {$1 - $0 }
        case "": perfornSingleOperation {sqrt($0)}
        default: break
        }
    }
    func perfornOperation(option: (Double, Double) -> Double) {
        if operandStack.count >= 2{
            displayValue = operandStack.removeLast(); operandStack.removeLast()
            	enter()
        }
    }
  
    
    func perfornSingleOperation(option: ( Double) -> Double) {
        if operandStack.count >= 2{
            displayValue = operandStack.removeLast();
            enter()
        }
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

