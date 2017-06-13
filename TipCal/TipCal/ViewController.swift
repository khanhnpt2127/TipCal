//
//  ViewController.swift
//  TipCal
//
//  Created by TK Nguyen on 6/10/17.
//  Copyright © 2017 TK Nguyen. All rights reserved.
//

import UIKit


extension Date {
    var millisecondsSince1970:Int {
        return Int((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    init(milliseconds:Int) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds / 1000))
    }
}




class ViewController: UIViewController {

   
    @IBOutlet weak var tipLable: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var totalLable: UILabel!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        billTextField.becomeFirstResponder()
        
        if UserDefaults.standard.object(forKey: "tipIndex") != nil {
            tipControl.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "tipIndex")
        }
        
        if UserDefaults.standard.object(forKey: "lastMil") != nil{
            let mil = UserDefaults.standard.integer(forKey: "lastMil")
            let current = Date().millisecondsSince1970 - mil
            if current < 600000 {
                
                
                let lbill = (UserDefaults.standard.float(forKey: "lastVal"))
                let lper = (UserDefaults.standard.integer(forKey: "lastPer"))
                tipControl.selectedSegmentIndex = lper
                billTextField.text = "\(lbill)"
                switch lper {
                case 0:
                    let tip = Double(lbill) * 0.18
                    let total = Double(lbill) + tip
                    
                    tipLable.text = String(format: "$%.1f", tip)
                    totalLable.text = String(format: "$%.1f", total)
                    
                    break
                case 1:
                    let tip = Double(lbill) * 0.2
                    let total = Double(lbill) + tip
                    
                    tipLable.text = String(format: "$%.1f", tip)
                    totalLable.text = String(format: "$%.1f", total)
                    
                    break;
                case 2:
                    let tip = Double(lbill) * 0.25
                    let total = Double(lbill) + tip
                    
                    tipLable.text = String(format: "$%.1f", tip)
                    totalLable.text = String(format: "$%.1f", total)
                    
                    break;
                default:
                    break
                }
                
                
                
                
                
            }
        }
        
        
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
   
    @IBAction func calculateTip(_ sender: Any) {
        
        
        var uiColorArray = [UIColor]()
        uiColorArray.append(.red)
        uiColorArray.append(.blue)
        uiColorArray.append(.brown)
        uiColorArray.append(.black)
        
        let randomIndex = Int(arc4random_uniform(UInt32(uiColorArray.count)))
        
        
        UIView.animate(withDuration: 1, animations: {
            self.view.backgroundColor = uiColorArray[randomIndex]
        }, completion: nil)
        
        
        let bill = Double(billTextField.text!) ?? 0
        
        
        let tipPercentages = [0.18,0.2,0.25]
        
        
        
        
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLable.text = String(format: "$%.1f", tip)
        totalLable.text = String(format: "$%.1f", total)
        
        let defaults = UserDefaults.standard
        
        defaults.set(Date().millisecondsSince1970, forKey: "lastMil")
        defaults.set(bill, forKey: "lastVal")
        defaults.set(tipControl.selectedSegmentIndex, forKey: "lastPer")
        defaults.synchronize()
        
    }
    
    
    

}

