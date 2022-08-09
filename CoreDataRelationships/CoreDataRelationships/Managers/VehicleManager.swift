//
//  VehicleManager.swift
//  CoreDataRelationships
//
//  Created by Nitin Bhatt on 7/14/22.
//

import Foundation

struct VehicleManager
{
    private let _vehicleDataRepository = VehicleDataRepository()
    
    func createVehicle(record: Vehicle)
    {
        _vehicleDataRepository.create(record: record)
    }

    func getAll() -> [Vehicle]?
    {
        return _vehicleDataRepository.getAll()
    }
}
