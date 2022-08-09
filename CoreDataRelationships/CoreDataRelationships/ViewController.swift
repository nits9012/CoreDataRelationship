//
//  ViewController.swift
//  CoreDataRelationships
//
//  Created by Nitin Bhatt on 7/14/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let manager = PersonManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Single table for users
        Users.insertValues(id:1,name:"Test",city:"Atlanta",country:"USA")

        for index in 0..<(Users.fetchValues()!.count) {
            print(Users.fetchValues()?[index].name)
        }
        
        // Person and Vehicle relationship tables
        createPerson()
        getSavedPerson()
        
        // Database path
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        print(paths[0])
    }
    
    func createPerson(){
        let vehicle = Vehicle(_id: UUID(), _name: "Harley Davidson", _type: "Bike")
        let vehicle2 = Vehicle(_id: UUID(), _name: "Audi A8", _type: "Car")
      //  let vehicle3 = Vehicle(_id: UUID(), _name: "Audi Q7", _type: "Car")

        let person = Person(_id: UUID(), _name: "John", _vehicle: [vehicle,vehicle2])
        
       let result = manager.createPerson(record: person)
        
        if(result == true){
            debugPrint("record saved successfully")
        }else{
            debugPrint("Create failed")
        }
    }

    func getSavedPerson()
    {
        let person = manager.getAll()
        person?.forEach({ (savedPerson) in

            savedPerson.vehicles?.forEach({ (savedVehicle) in
                debugPrint("\(savedPerson.name) has \(savedVehicle.name) which is a \(savedVehicle.type)")
            })
        })
    }
    
    
    @IBAction func addSameEntryButtonAction(_ sender: Any) {
    }
    
    @IBAction func addDiffEntryButtonAction(_ sender: Any) {
    }
    

}

