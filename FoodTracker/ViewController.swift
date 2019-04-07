//
//  ViewController.swift
//  FoodTracker
//
//  Created by Yabaze T on 07/04/19.
//  Copyright © 2019 Yabaze T. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITextFieldDelegate {

    @IBOutlet weak var principal: UITextField!
    @IBOutlet weak var numberOfYears: UITextField!
    @IBOutlet weak var rateOfInterest: UITextField!
    @IBOutlet weak var interestResult: UILabel!
    
    @IBAction func calculate(_ sender: UIButton) {
        
        guard let principalAmount  = Double(principal.text!)
            else {
                
                showToast(controller: self, message: "Enter Valid Principal Amount", seconds: 1.5)
                
                return
            
        }
        guard let numberOfYears  = Double(numberOfYears.text!)
            else {
                
                showToast(controller: self, message: "Enter Valid Years / Month", seconds: 1.5)
                
                return
                
        }
        guard let rateOfInterest  = Double(rateOfInterest.text!)
            else {
                
                showToast(controller: self, message: "Enter Valid Interest Rate", seconds: 1.5)
                
                return
                
        }
        
        let result = principalAmount * numberOfYears * rateOfInterest / 100
        
        interestResult.text = "Result \(result)"
        
        clearTextFields()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        principal.delegate = self
    }
    
    func showToast(controller: UIViewController, message : String, seconds: Double){
        
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .actionSheet)
        
        alert.view.backgroundColor = .black
        alert.view.alpha = 5
        alert.view.layer.cornerRadius = 15
    
        controller.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            
            alert.dismiss(animated: true)
            
        }
    }
    
    func clearTextFields() {
        principal.text = ""
        numberOfYears.text = ""
        rateOfInterest.text = ""
    }

}

