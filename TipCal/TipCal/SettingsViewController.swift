//
//  SettingsViewController.swift
//  TipCal
//
//  Created by TK Nguyen on 6/10/17.
//  Copyright © 2017 TK Nguyen. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipDefaultControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        if UserDefaults.standard.object(forKey: "tipIndex") != nil {
            tipDefaultControl.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "tipIndex")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
   
    @IBAction func changeDefault(_ sender: Any) {
        
        let defaults = UserDefaults.standard
        
        defaults.set(tipDefaultControl.selectedSegmentIndex, forKey: "tipIndex")
        print(tipDefaultControl.selectedSegmentIndex)
        defaults.synchronize()
        
        let alert = UIAlertController(title: "Successful", message: "Save Default Tip Percentage Successfully", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
