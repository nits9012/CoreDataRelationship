//
//  PersonManager.swift
//  CoreDataRelationships
//
//  Created by Nitin Bhatt on 7/14/22.
//

import Foundation

struct PersonManager{
    private let _personDataRepository = PersonDataRepository()
    
    func createPerson(record: Person) -> Bool{
        guard record.vehicles != nil && record.vehicles!.count <= 2 else {return false}
        _personDataRepository.create(record: record)
        
        return true
    }

    func getAll() -> [Person]?{
        return _personDataRepository.getAll()
    }
}
