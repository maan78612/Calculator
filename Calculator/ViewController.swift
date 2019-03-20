//
//  ViewController.swift
//  Calculator
//
//  Created by maan on 3/13/19.
//  Copyright © 2019 maan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var value:Int=0;
    var functionValue:String!
    var isOperatorSet:Bool=false // to check operator is set or not (+,-,*,/ are operatorsse)
    var numberAfterOperator:Bool=false
    var prevalue:Int=0; // previous value is saved in it (i.e previous value is value before operator
    var isNextAnswer:Bool=false // check after answer if after answer we use operator then no issue but if we enter value or number it reset previous answer and clear text field
    
    @IBOutlet weak var result: UILabel!
    @IBOutlet var Buttons: [UIButton]!
    
    
    enum Actiontype : Int { // assign unique names against tags of buttons
        
        case digit0 = 0
        case digit1 = 1
        case digit2 = 2
        case digit3 = 3
        case digit4 = 4
        case digit5 = 5
        case digit6 = 6
        case digit7 = 7
        case digit8 = 8
        case digit9 = 9
        case dot = 11
        case equalsto = 12
        case add = 13
        case subtract = 14
        case multiply = 15
        case divide = 16
        case mode = 17
        case sigh = 18
        case clear = 19
        
        
    }
    
    
    @IBAction func fuctions(_ sender: UIButton) {
        
        
        
        var temp = "-1"
        
        if sender.tag != Actiontype.equalsto.rawValue && sender.tag != Actiontype.clear.rawValue
        { // if we donot use clear or equal function then we are using operator
            
           
            
         
            
            if sender.tag==Actiontype.add.rawValue
            {
                temp = "+"
            }
            else if sender.tag==Actiontype.subtract.rawValue
            {
                temp = "-"
            }
            else if sender.tag==Actiontype.multiply.rawValue
            {
                temp="*"
            }
            else if sender.tag==Actiontype.divide.rawValue
            {
                temp="/"
            }
            if isOperatorSet==false // if we donot enter operator yet we store text value to prevalue variable
            {
                prevalue=Int(result.text!)!
            }
           
            self.result.text=temp // we show operator on textfield
            functionValue = (result.text!) // store operator or text field value in variable functionValue
               isOperatorSet=true // it shows we enter operator and make this boolean  true
            
        }
        else  if sender.tag==Actiontype.equalsto.rawValue
        {
            var answer:Int = -1
            print(prevalue)
            print(functionValue)
            print(value)
            
            if(functionValue=="+")
            {
                answer = prevalue+value
               
            }
            else if(functionValue=="-")
            {
                answer = prevalue-value
                
            }
            else if(functionValue=="*")
            {
                answer = prevalue*value
              
            }
            else if(functionValue=="/")
            {
                answer = prevalue/value
                
            }
            self.result.text=String(answer)// show answer in textfield
            prevalue=answer // if we use operatore after answer we update prevalue wth answer to perform further calclations
            isOperatorSet=false // make is operator false because we want to do calculation after answer
            numberAfterOperator=false //make this false beacuse we make answer to prevalue and there is no number after operator
            isNextAnswer=true;// we make this true because we got our answer
            
        }
        else if sender.tag==Actiontype.clear.rawValue
        {
            self.result.text = "" // clear text field
            numberAfterOperator=false // make false or intialize to default value of numberAfterOperator boolean to false because after clear we want to add another value
            isOperatorSet=false // make false or intialize to default value of isOperatorSet boolean to false because after clear we want to add another value
            value = -1 // reset value
            prevalue = -1 // reset previous value
            functionValue = "" // reset operator
        }
        
        
    }
    
    
    @IBAction func numbersClick(_ sender: UIButton) {
        var temp = -1
        if isOperatorSet==true // if we enter operator
        {
            if numberAfterOperator==false // and we donot enter any number
            {
                self.result.text = "" // clear text field
                numberAfterOperator=true //make it true because we enter number after operator
            }
            
        }
        if isNextAnswer==true // if we enter digit after answer not operator we use this check to reset textField
        {
            self.isNextAnswer=false
            self.result.text=""
        }
        
        
        if sender.tag==Actiontype.digit0.rawValue // assinging values against number
        {
            temp=0
        }
        else if sender.tag==Actiontype.digit1.rawValue
        {
            temp=1
        }
        else if sender.tag==Actiontype.digit2.rawValue
        {
            temp=2
        }
        else if sender.tag==Actiontype.digit3.rawValue
        {
            temp=3
        }
        else if sender.tag==Actiontype.digit4.rawValue
        {
            temp=4
        }
        else if sender.tag==Actiontype.digit5.rawValue
        {
            temp=5
        }
        else if sender.tag==Actiontype.digit6.rawValue
        {
            temp=6
        }
        else if sender.tag==Actiontype.digit7.rawValue
        {
            temp=7
        }
        else if sender.tag==Actiontype.digit8.rawValue
        {
            temp=8
        }
        else if sender.tag==Actiontype.digit9.rawValue
        {
            temp=9
        }
        
        
        if let txt = result.text {
            
            self.result.text = txt + String(temp) // catinate to show numbers of two or more digits like 52 ,5222, 2525 etc
            
            if let value = Int(result.text ?? "")// tore concatinate value in variable
            {
                self.value = value
            }
            
        }
        
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        roundBtns()
        
    }
    
    
    
    func roundBtns()
    {
        self.view.layoutIfNeeded()
        
        for btns in Buttons
        {
            btns.layer.cornerRadius=btns.frame.size.height/2
            
            btns.layer.masksToBounds=true
        }
    }
    
}

