//
//  ViewController.swift
//  Tipcalc
//
//  Created by Jasmine Kaur Grewal on 8/6/17.
//  Copyright © 2017 Jasmine. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DestinationViewDelegate {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var one: UILabel!
    @IBOutlet weak var two2: UILabel!
    @IBOutlet weak var three1: UILabel!
    @IBOutlet weak var three2: UILabel!
    @IBOutlet weak var three3: UILabel!
    @IBOutlet weak var two1: UILabel!
    
    @IBOutlet weak var split2: UILabel!
    @IBOutlet weak var split3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        one.text = "\u{f007}"
        two1.text = "\u{f007}"
        two2.text = "\u{f007}"
        three1.text = "\u{f007}"
        three2.text = "\u{f007}"
        three3.text = "\u{f007}"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        billField.becomeFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "pickTip") {
            let destination = segue.destination as! SettingsViewController
            destination.delegate = self
            destination.selectTip=tipControl.selectedSegmentIndex
        }
    }
    
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
        @IBAction func calculateTip(_ sender: AnyObject) {
            self.setTip(tip: tipControl.selectedSegmentIndex)
    }
    
    func setTip(tip : Int){
        tipControl.selectedSegmentIndex=tip
        
        let percentages=[0.18, 0.2, 0.25]
        
        let tipP=Double(percentages[tip])
        let bill = Double(billField.text!) ?? 0
        let tips = bill*tipP
        let total = bill+tips
        
        tipLabel.text = String(format: "$%.2f", tips)
        totalLabel.text=String(format: "$%.2f", total)
        
        let splitin2 = Double(total/2.0)
        let splitin3 = Double(total/3.0)
        
        split2.text=String(format: "$%.2f",splitin2)
        split3.text=String(format: "$%.2f",splitin3)
        
    }
}

