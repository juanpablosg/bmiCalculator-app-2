//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

final class CalculateViewController: UIViewController {
    
    private var calculatorBrain = CalculatorBrain()
    private var bmiValue = "0.0"
    
    @IBOutlet private weak var metersLabel: UILabel!
    @IBOutlet private weak var kilogramsLabel: UILabel!
    @IBOutlet private weak var heightSlider: UISlider!
    @IBOutlet private weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heightSlider.value = 1.5
        weightSlider.value = 100
    }

    @IBAction private func heightSliderChanged(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value )
        metersLabel.text = "\(height)m"
    }

    
    @IBAction private func weightSliderChanged(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value )
        kilogramsLabel.text = "\(weight)kg"
    }
    

    @IBAction private func calculatePressedButton(_ sender: UIButton) {
        
        calculatorBrain.calculateBmi(height: heightSlider.value, weight: weightSlider.value)
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResult" {
            let destinationViewController = segue.destination as! ResultViewController
            destinationViewController.bmiValue = calculatorBrain.getBMIValue()
            destinationViewController.advice = calculatorBrain.getAdvice()
            destinationViewController.color = calculatorBrain.getBackgroundColor()
        }
    }
    
}


