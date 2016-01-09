//
//  ViewController.swift
//  Calculator
//
//  Created by Chris Maury on 1/8/16.
//  Copyright © 2016 Conversant Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var brain = CalculatorBrain()
    var userIsTyping = false
    
    @IBOutlet weak var display: UILabel!

    @IBOutlet weak var history: UILabel!
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        print("digit = \(digit)" )
        history.text = history.text! + digit
        print("command history =" + history.text!)
        
        if userIsTyping {
            if digit == "." {
                if display.text!.containsString(".") {
                }
                else {
                    display.text = display.text! + digit
                }
            }
            else {
               display.text = display.text! + digit
            }

        } else {
            display.text = digit
            userIsTyping = true
        }
        
        
    }
    
    @IBAction func spcialCharacter(sender: UIButton) {
        if sender.currentTitle! == "π" {
            if userIsTyping {
                enter()
                displayValue = M_PI
                enter()
                userIsTyping = false
                
            }
            else {
                displayValue = M_PI
                enter()
            }
        }

    }
        
    
    @IBAction func clearAll(sender: UIButton) {
        if sender.currentTitle! == "clr" {
            brain.clear()
            display.text = "0"
            userIsTyping = false
            history.text = ""
        }
    }

    @IBAction func enter() {
        userIsTyping = false
        if let result = brain.pushOperand(displayValue) {
            displayValue = result
            history.text = history.text! + " "
        }
        else {
            displayValue = 0
        }

    }
    
    @IBAction func operate(sender: UIButton) {
        if userIsTyping {
            enter()
        }
        if let operation = sender.currentTitle {
            if let result = brain.performOperation(operation) {
                displayValue = result
                history.text = history.text! + operation + " "
            }
            else {
                displayValue = 0
            }
            
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

