//
//  Users+CoreDataClass.swift
//  CoreDataRelationships
//
//  Created by Nitin Bhatt on 7/14/22.
//
//

import Foundation
import CoreData

@objc(Users)
public class Users: NSManagedObject {
    
    class func insertValues(id:Int,name:String,city:String,country:String)->Users?{
        let manageObjectContext = CoreDataManager.shared.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Users", in: manageObjectContext)
        let user = NSManagedObject(entity: entity!, insertInto: manageObjectContext)

        user.setValue(id, forKey: "id")
        user.setValue(name, forKey: "name")
        user.setValue(city, forKey: "city")
        user.setValue(country, forKey: "country")
        
        do{
            try manageObjectContext.save()
            return user as? Users
        }catch let error as NSError{
            print("Not saved \(error)")
            return nil
        }
    }
    
    class func fetchValues()->[Users]?{
            let manageObjectContext = CoreDataManager.shared.persistentContainer.viewContext
            let fetch = NSFetchRequest<NSManagedObject>(entityName: "Users")
            
            do{
                 let user = try manageObjectContext.fetch(fetch)
                 return user as? [Users]
            }catch let error as NSError{
                print("Error \(error)")
                return nil
            }
    }

}
