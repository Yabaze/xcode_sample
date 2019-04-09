//
//  Calculation.swift
//  FoodTracker
//
//  Created by Yabaze T on 09/04/19.
//  Copyright © 2019 Yabaze T. All rights reserved.
//

import Foundation

class Calculation {
    var principal:NSString!
    var numberOfYears:NSString!
    var rateOfInterest:NSString!
    
    init(principal:String,numberOfYears:String,rateOfInterest:String) {
        self.principal=principal as NSString
        self.numberOfYears=numberOfYears as NSString
        self.rateOfInterest=rateOfInterest as NSString
    }
    
}
