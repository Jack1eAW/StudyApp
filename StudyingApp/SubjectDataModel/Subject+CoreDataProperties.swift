//
//  Subject+CoreDataProperties.swift
//  StudyingApp
//
//  Created by Aleksandr Chebotarev on 11.06.2021.
//

import Foundation
import CoreData


extension Subject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Subject> {
        return NSFetchRequest<Subject>(entityName: "Subject")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var subjectType: String
    @NSManaged public var status: String
    @NSManaged public var typeofLesson: String
    @NSManaged public var cabinetNumber: String
    @NSManaged public var teacherName: String
    
    var subjectStatus: Status {
        set {
            status = newValue.rawValue
        }
        get {
            Status(rawValue: status) ?? .pending
        }
    }

}

extension Subject : Identifiable {

}

enum Status: String {
    case pending = "Pending"
    case preparing = "Preparing"
    case completed = "Completed"
}
