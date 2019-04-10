//
//  CalculationTable.swift
//  FoodTracker
//
//  Created by Yabaze T on 09/04/19.
//  Copyright © 2019 Yabaze T. All rights reserved.
//

import Foundation

class CalculationTable {

    var TABLE_NAME : String
    var ID : String
    var PRINCIPAL : String
    var NUMBER_OF_YEARS : String
    var RATE_OF_INTEREST : String
    
    var CREATE_TABLE : String
    var RETRIVE_ALL : String
    
    init() {
        
        self.TABLE_NAME = "calculation_history"
        self.ID = "id"
        self.PRINCIPAL = "principal"
        self.NUMBER_OF_YEARS = "number_of_years"
        self.RATE_OF_INTEREST = "interest"
        self.RETRIVE_ALL = "SELECT * FROM " + self.TABLE_NAME
        
        self.CREATE_TABLE =  "CREATE TABLE IF NOT EXISTS " + TABLE_NAME + "(" + ID + " INTEGER PRIMARY KEY AUTOINCREMENT," + PRINCIPAL + " TEXT," + NUMBER_OF_YEARS + " TEXT," + RATE_OF_INTEREST + " TEXT NOT NULL)";
    }
    
}
