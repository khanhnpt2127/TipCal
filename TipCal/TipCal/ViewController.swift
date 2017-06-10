//
//  ViewController.swift
//  TipCal
//
//  Created by TK Nguyen on 6/10/17.
//  Copyright © 2017 TK Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLable: UILabel!
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var totalLable: UILabel!
   
    @IBOutlet weak var tipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
   
    @IBAction func calculateTip(_ sender: Any) {
        let tipPercentages = [0.18,0.2,0.25]
        
        let bill = Double(billTextField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLable.text = String(format: "$%.2f", tip)
        totalLable.text = String(format: "$%.2f", total)
    }

}

