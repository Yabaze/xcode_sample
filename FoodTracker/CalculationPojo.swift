//
//  CalculationPojo.swift
//  FoodTracker
//
//  Created by Yabaze T on 10/04/19.
//  Copyright © 2019 Yabaze T. All rights reserved.
//

import Foundation


class CalculationPojo {
    var principal:String
    var numberOfYears:String
    var rateOfInterest:String
    
    init?(principal:String,numberOfYears:String,rateOfInterest:String) {
        
        guard !principal.isEmpty else {
            return nil
        }
        
        guard !numberOfYears.isEmpty else {
            return nil
        }
        
        guard !rateOfInterest.isEmpty else {
            return nil
        }
        
        self.principal=principal
        self.numberOfYears=numberOfYears
        self.rateOfInterest=rateOfInterest
    }
    
}
