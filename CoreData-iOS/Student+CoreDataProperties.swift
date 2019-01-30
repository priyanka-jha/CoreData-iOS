//
//  Student+CoreDataProperties.swift
//  CoreData-iOS
//
//  Created by Priyanka on 29/01/19.
//  Copyright © 2019 Priyanka. All rights reserved.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var stream: String?

}
