//
//  Person.swift
//  CoreDataRelationships
//
//  Created by Nitin Bhatt on 7/14/22.
//

import Foundation

class Person
{
    let id: UUID
    let name: String
    var vehicles: [Vehicle]?

    init(_id: UUID, _name: String, _vehicle: [Vehicle]? = nil)
    {
        self.id = _id
        self.name = _name
        self.vehicles = _vehicle
    }
}
