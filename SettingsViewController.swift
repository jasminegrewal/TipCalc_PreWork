//
//  SettingsViewController.swift
//  Tipcalc
//
//  Created by Jasmine Kaur Grewal on 8/8/17.
//  Copyright © 2017 Jasmine. All rights reserved.
//

import UIKit

protocol DestinationViewDelegate {
    func setTip(tip: Int);
}

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTip: UISegmentedControl!
    
    var delegate : DestinationViewDelegate!
    var selectTip : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        defaultTip.selectedSegmentIndex=selectTip
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onSelect(_ sender: AnyObject) {
        //let tipPercentages=[0.18, 0.2, 0.25]
        
        
        let dtip = defaultTip.selectedSegmentIndex
         delegate.setTip(tip: dtip)
        
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
