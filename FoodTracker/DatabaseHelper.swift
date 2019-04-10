//
//  DatabaseHelper.swift
//  FoodTracker
//
//  Created by Yabaze T on 09/04/19.
//  Copyright © 2019 Yabaze T. All rights reserved.
//

import Foundation

import Foundation
import SQLite3

class DatabaseHelper{
    var db: OpaquePointer?
    
    var calculationTable : CalculationTable
    let DB_NAME : String = "sample.sqlite"
    
    init() {
        calculationTable = CalculationTable.init()
        db=createDatabase()
        createTable()
    }
    
    
    public func createDatabase()->OpaquePointer{
        let fileURL=try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(DB_NAME)
        print(fileURL)
        let result=sqlite3_open(fileURL.path, &db)
        if result == SQLITE_OK {
            print("Successfully connected to database. ")
            return db!
        } else {
            print("Unable to open database. Verify that you created the directory described in the Getting Started section.")
            return nil!
        }
    }
    
    public func createTable() {
        
        var createTableStatement: OpaquePointer?
        
        let userTable=sqlite3_prepare_v2(db, calculationTable.CREATE_TABLE, -1, &createTableStatement, nil)
        if  userTable == SQLITE_OK {
        
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("User table created.")
            } else {
                print("User table could not be created.")
            }
        
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        
        sqlite3_finalize(createTableStatement)
    }
    
    public func insertCalculation(calculation : Calculation){
        var insertStatement: OpaquePointer?
        
        let insertStatementString = "INSERT INTO " + calculationTable.TABLE_NAME + " (" +  calculationTable.PRINCIPAL + "," + calculationTable.NUMBER_OF_YEARS + "," + calculationTable.RATE_OF_INTEREST + ") VALUES (?,?,?);"
        
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            
            sqlite3_bind_text(insertStatement, 1, calculation.principal.utf8String,-1,nil)
            sqlite3_bind_text(insertStatement, 2, calculation.numberOfYears.utf8String,-1,nil)
            sqlite3_bind_text(insertStatement, 3, calculation.rateOfInterest.utf8String,-1,nil)
            
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                
                print("Successfully inserted row.")
            
            } else {
            
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure inserting User: \(errmsg)")
                print("Could not insert row.")
                return
            
            }
        } else {
            print("INSERT statement could not be prepared.")
        }
        sqlite3_finalize(insertStatement)
    }
    
    func retrieveCalculation() -> Array<CalculationPojo> {
        var queryStatement: OpaquePointer? = nil

        var calculationsArray : Array<CalculationPojo> = Array()

        if sqlite3_prepare_v2(db, calculationTable.RETRIVE_ALL , -1, &queryStatement, nil) == SQLITE_OK {
            
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                
                let id = sqlite3_column_int(queryStatement, 0)
                
                let principal = String(cString: sqlite3_column_text(queryStatement, 1)!)
                
                let numberOfYears = String(cString: sqlite3_column_text(queryStatement, 2)!)
                
                let rateOfInterest = String(cString: sqlite3_column_text(queryStatement, 3)!)
                
                let interest = Double(principal)! * Double(numberOfYears)! * Double(rateOfInterest)! / 100
                
            
                calculationsArray.append(CalculationPojo.init(principal: principal, numberOfYears: numberOfYears, rateOfInterest: rateOfInterest)!)
                
                print("\(id)| \(String(describing: principal)) | \(String(describing: numberOfYears)) | \(String(describing: rateOfInterest)) | \(String(describing: interest)) ")
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return calculationsArray
    }
}
