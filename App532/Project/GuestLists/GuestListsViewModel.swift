//
//  GuestListsViewModel.swift
//  App532
//
//  Created by Вячеслав on 5/26/24.
//

import SwiftUI
import CoreData

final class GuestListsViewModel: ObservableObject {
    
    @Published var isAdd: Bool = false
    @Published var guestlists: [GuestModel] = []
    
    @Published var name: String = ""
    @Published var phone: String = ""
    
    func addGuest() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "GuestModel", into: context) as! GuestModel
        
        loan.name = name
        loan.phone = phone

        CoreDataStack.shared.saveContext()
    }
    
    func fetchGuests() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<GuestModel>(entityName: "GuestModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.guestlists = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.guestlists = []
        }
    }
}
