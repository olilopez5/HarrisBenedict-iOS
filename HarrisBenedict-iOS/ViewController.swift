//
//  ViewController.swift
//  HarrisBenedict-iOS
//
//  Created by Mañanas on 8/5/25.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    

    @IBOutlet weak var genderControl: UISegmentedControl!
    @IBOutlet weak var ageLabel: UITextField!
    @IBOutlet weak var weightLabel: UITextField!
    @IBOutlet weak var heightLabel: UITextField!
    @IBOutlet weak var activityPicker: UIPickerView!
    
    @IBOutlet weak var objective: UISegmentedControl!
    
    var tdee: Double = 0.0
    
    
    let activityLevels = [
        ("Sedentario", 1.2),
        ("Ligera (1-3 días)", 1.375),
        ("Moderada (3-5 días)", 1.55),
        ("Intensa (6-7 días)", 1.725),
        ("Muy intensa (2x/día)", 1.9)
    ]
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        activityPicker.dataSource = self
        activityPicker.delegate = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return activityLevels.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return activityLevels[row].0
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
        //resultLabel.text = String(format: "Tu TMB es %.2f kcal/día", tmb)
        
        let selectedIndex = activityPicker.selectedRow(inComponent: 0)
            let activityFactor = activityLevels[selectedIndex].1
        print("Actividad seleccionada: \(activityLevels[selectedIndex].0), factor: \(activityFactor)")
            tdee = tmb * activityFactor

            resultLabel.text = String(format: "TMB : %.0f kcal\n\nTDEE : %.0f kcal", tmb, tdee)
        resultLabel.backgroundColor = .hBsecundary
    }
    
    @IBAction func showExplanation(_ sender: Any) {
        let alert = UIAlertController(
            title: "Resultado explicado",
            message: """
            🔹 **TMB (Tasa Metabólica Basal):** Es la cantidad de calorías que tu cuerpo necesita diariamente para mantener sus funciones vitales si estuvieras en reposo absoluto (sin moverte en todo el día).

            🔹 **TDEE (Gasto Energético Diario Total):** Es el total de calorías que quemas al día, incluyendo tu nivel de actividad física. Se calcula multiplicando la TMB por un factor según tu estilo de vida.

            👉 Usa el TDEE como referencia para ajustar tu dieta:
            - Para mantener tu peso: consume aproximadamente ese número de calorías.
            - Para perder peso: reduce entre 300 y 500 kcal al día.
            - Para ganar masa muscular: aumenta entre 200 y 400 kcal al día.
            """,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Cerrar", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    /*@IBAction func showGoalOptions(_ sender: Any) {
        
        let selected = objective.selectedSegmentIndex
           if selected == 1 {
               performSegue(withIdentifier: "showSurplusOptions", sender: self)
           } else if selected == 2 {
               performSegue(withIdentifier: "showDeficitOptions", sender: self)
           } else {
               let alert = UIAlertController(title: "Selecciona un objetivo", message: "Elige si quieres ganar masa muscular o perder grasa", preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "Ok", style: .default))
               present(alert, animated: true)
           }
    }*/
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let goalOptionsVC = segue.destination as! GoalOptionsViewController
        goalOptionsVC.tdee = tdee
        goalOptionsVC.goal = objective.selectedSegmentIndex
    }
    
}
    

