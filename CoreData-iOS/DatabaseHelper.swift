//
//  DatabaseHelper.swift
//  CoreData-iOS
//
//  Created by Priyanka on 29/01/19.
//  Copyright © 2019 Priyanka. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DatabaseHelper {
 
  static var sharedInstance = DatabaseHelper()
  let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    //save data
    func save(object:[String:String]) {
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context!) as! Student
        student.name = object["name"]
        student.stream = object["stream"]
        
        do {
            try context?.save()
            print("data saved")
        }
        catch {
            print("data not saved")
        }
        }
    
    
    //fetch data
    func getData() -> [Student] {
        var student = [Student]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")
        do
        {
            student = try context?.fetch(fetchRequest) as! [Student]
        }
        catch {
            print("data not found")
        }
        return student
        
    }
    
    //delete data
    func deleteData(index:Int) -> [Student] {
        var student = getData()
        context?.delete(student[index])
        student.remove(at: index)
        
        do {
            try context?.save()
        }
        catch {
            print("data not deleted")
        }
        return student
    }

    
    //update data
    func editData(object:[String:String], i:Int) {
        var student = getData()
        student[i].name = object["name"]
        student[i].stream = object["stream"]
        do {
            try context?.save()
            
        }
        catch {
            print("data not updated")
        }
        
        
    }

}
    
    

