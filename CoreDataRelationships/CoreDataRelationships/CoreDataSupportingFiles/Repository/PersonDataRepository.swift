//
//  PersonDataRepository.swift
//  CoreDataRelationships
//
//  Created by Nitin Bhatt on 7/14/22.
//

import Foundation
import CoreData


import Foundation
import CoreData

protocol PersonRepository : BaseRepository {

}

struct PersonDataRepository : PersonRepository {

    func create(record: Person) {

        let cdPerson = CDPerson(context: CoreDataManager.shared.context)
        cdPerson.id = record.id
        cdPerson.name = record.name

        if(record.vehicles != nil && record.vehicles?.count != 0)
        {
            var vehicleSet = Set<CDVehicle>()
            record.vehicles?.forEach({ (vehicle) in

                let cdVehicle = CDVehicle(context: CoreDataManager.shared.context)
                cdVehicle.id = vehicle.id
                cdVehicle.type = vehicle.type
                cdVehicle.name = vehicle.name

                vehicleSet.insert(cdVehicle)
            })

            cdPerson.toVehicle = vehicleSet
        }

        CoreDataManager.shared.saveContext()

    }

    func getAll() -> [Person]? {

        let records = CoreDataManager.shared.fetchManagedObject(managedObject: CDPerson.self)
        guard records != nil && records?.count != 0 else {return nil}

        var results: [Person] = []
        records!.forEach({ (cdPerson) in
            results.append(cdPerson.convertToPerson())
        })

        return results
    }

    func get(byIdentifier id: UUID) -> Person? {

        let person = getCdPerson(byId: id)
        guard person != nil else {return nil}

        return (person?.convertToPerson())!
    }

    func update(record: Person) -> Bool {

        let person = getCdPerson(byId: record.id)
        guard person != nil else {return false}
        person?.name = record.name

        CoreDataManager.shared.saveContext()
        return true
    }

    func delete(byIdentifier id: UUID) -> Bool {

        let person = getCdPerson(byId: id)
        guard person != nil else {return false}

        CoreDataManager.shared.context.delete(person!)
        CoreDataManager.shared.saveContext()

        return true
    }

    private func getCdPerson(byId id: UUID) -> CDPerson?
    {
        let fetchRequest = NSFetchRequest<CDPerson>(entityName: "CDPerson")
        let fetchById = NSPredicate(format: "id==%@", id as CVarArg)
        fetchRequest.predicate = fetchById

        let result = try! CoreDataManager.shared.context.fetch(fetchRequest)
        guard result.count != 0 else {return nil}

        return result.first
    }

    typealias T = Person
}
