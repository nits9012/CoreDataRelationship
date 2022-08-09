//
//  BaseRepository.swift
//  CoreDataRelationships
//
//  Created by Nitin Bhatt on 7/14/22.
//

import Foundation


protocol BaseRepository{
    associatedtype T
    
    func create(record:T)
    func getAll()->[T]?
    func get(byIdentifier id:UUID) -> T?
    func update(record:T) -> Bool
    func delete(byIdentifier id: UUID) -> Bool
}
