//
//  SettingsViewController.swift
//  CalcTip
//
//  Created by Griffin Davidson on 1/1/22.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipSlider: UISlider!
    @IBOutlet weak var defaultTipLabel: UILabel!
    
    //Enables user defaults
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Names view as Settings
        self.title = "Settings"
        
        //Updates TextField as slider is changed
        defaultTipSlider.addTarget(self, action: #selector(updateTipLabel(slider:)), for: .valueChanged)
        
        //Saves the slider to its current position
        let defaultTip = defaults.float(forKey: "defaultTip")
        defaultTipSlider.setValue(defaultTip, animated: false)
        
        //Displays the last tip amount in the textbox
        defaultTipLabel.text = String(format: "%d", Int(defaultTip)) + "%"
    }
    
    //Saves the amount from the slider into User Defaults
    @IBAction func setDefaultTip(_ sender: UISlider) {
        defaults.set(defaultTipSlider.value, forKey: "defaultTip")
        
        //Saves changes
        defaults.synchronize()
    }
    
    //Function to update Textfield as slider is changed
    @objc
    func updateTipLabel(slider: UISlider) {
        defaultTipLabel.text = String(format: "%d", Int(defaultTipSlider.value)) + "%"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
