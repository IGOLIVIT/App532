//
//  GiftsViewModel.swift
//  App532
//
//  Created by Вячеслав on 5/26/24.
//

import SwiftUI
import CoreData

final class GiftsViewModel: ObservableObject {
    
    @Published var isAdd: Bool = false
    @Published var gifts: [GiftModel] = []
    
    @Published var name: String = ""
    @Published var name_surname: String = ""
    @Published var tag: String = ""
    @Published var text: String = ""
    @Published var image: String = ""
    
    func addGift() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "GiftModel", into: context) as! GiftModel
        
        loan.name = name
        loan.name_surname = name_surname
        loan.tag = tag
        loan.text = text
        loan.image = image

        CoreDataStack.shared.saveContext()
    }
    
    func fetchGifts() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<GiftModel>(entityName: "GiftModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.gifts = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.gifts = []
        }
    }
}
