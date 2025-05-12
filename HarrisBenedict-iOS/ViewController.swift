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
       
            guard let weightText = weightLabel.text,
                  let heightText = heightLabel.text,
                  let ageText = ageLabel.text,
                  let weight = Double(weightText),
                  let height = Double(heightText),
                  let age = Double(ageText) else {
                resultLabel.text = "Introduce datos válidos"
                return
            }

            let isMale = genderControl.selectedSegmentIndex == 0 // 0 = Hombre, 1 = Mujer
            let tmb: Double

            if isMale {
                tmb = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age)
            } else {
                tmb = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age)
            }

            resultLabel.text = String(format: "Tu TMB es %.2f kcal/día", tmb)
        }

        
    }
    

