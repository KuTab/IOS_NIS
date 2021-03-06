//
//  Task+CoreDataProperties.swift
//  TaskTracker
//
//  Created by Egor Dadugin on 06.03.2021.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var date: Date
    @NSManaged public var isDone: Bool
    @NSManaged public var name: String
    @NSManaged public var note: String

}

extension Task : Identifiable {

}
