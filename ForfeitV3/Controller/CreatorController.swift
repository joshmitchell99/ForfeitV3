//
//  CreatorController.swift
//  ForfeitV3
//
//  Created by Josh Mitchell on 9/23/20.
//  Copyright © 2020 Ava Ford. All rights reserved.
//

import UIKit

class CreatorController: UIViewController {
    
    var tableController = TableController()
    
    let dateFormatter = DateFormatter()
    var brain = ForfeitBrain()
    
    @IBOutlet weak var textEntry: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var forfeitAmountLabel: UILabel!
    @IBOutlet weak var forfeitAmountStepper: UIStepper!
    
    var forfeitTitle = ""
    var completeBy = ""
    var forfeitAmount = 0
    
    
    // Runs when the program loads
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.timeStyle = .medium
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"

    }
    
    @IBAction func forfeitAmountStepperPressed(_ sender: UIStepper) {
        forfeitAmountLabel.text = String("£ \(Int(forfeitAmountStepper.value))")
    }
    
    
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        if textEntry.text == "" {
            textEntry.placeholder = "Put something in here!"
            return
        }
        
        let forfeitTitle = textEntry.text!
        let completeBy = dateFormatter.string(from: datePicker.date)
        let forfeitAmount = Int(forfeitAmountStepper.value)
        brain.addForfeit(title: forfeitTitle, date: completeBy, amount: forfeitAmount)
        
        navigationController?.popToRootViewController(animated: true)
    }
}
