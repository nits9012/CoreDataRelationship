//
//  VehicleExtension.swift
//  CoreDataRelationships
//
//  Created by Nitin Bhatt on 7/14/22.
//

import Foundation

extension CDVehicle{
    func convertToVehicle() -> Vehicle{
        return Vehicle(_id: self.id!, _name: self.name!, _type: self.type!)
    }
}
