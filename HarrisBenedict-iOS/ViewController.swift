//
//  ViewController.swift
//  HarrisBenedict-iOS
//
//  Created by Mañanas on 8/5/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var genderControl: UISegmentedControl!
    @IBOutlet weak var ageLabel: UITextField!
    
    @IBOutlet weak var weightLabel: UITextField!
    @IBOutlet weak var heightLabel: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculate(_ sender: Any) {
    }
    
}

