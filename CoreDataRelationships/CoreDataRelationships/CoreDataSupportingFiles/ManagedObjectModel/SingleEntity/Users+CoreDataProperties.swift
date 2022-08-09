//
//  Users+CoreDataProperties.swift
//  CoreDataRelationships
//
//  Created by Nitin Bhatt on 7/14/22.
//
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var city: String?
    @NSManaged public var country: String?

}

extension Users : Identifiable {

}
