//
//  ViewController.swift
//  CalcTip
//
//  Created by Griffin Davidson on 12/30/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Names app
        self.title = "CalcTip"
        
        //Automatically activates Text Field
        billAmountTextField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let defaults = UserDefaults.standard
        let defaultTipInt = defaults.double(forKey: "defaultTip")
        let defaultTipString = String(format: "%.2f", defaultTipInt / 100)
        
        //Did my best to try to strip the number down to two decimals only
        let defaultTip = Double(defaultTipString)!
        
        
        
        // Gets bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Gets total tip my multiplying tip x percentage
        let tipPercentages = [defaultTip, 0.15, 0.18, 0.20]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = tip + bill
        
        // Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
    }
    

}

