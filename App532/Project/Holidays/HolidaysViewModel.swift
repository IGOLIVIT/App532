//
//  HolidaysViewModel.swift
//  App532
//
//  Created by Вячеслав on 5/26/24.
//

import SwiftUI
import CoreData

final class HolidaysViewModel: ObservableObject {
    
    @Published var isAdd: Bool = false
    @Published var holidays: [HolidayModel] = []
    
    @Published var image: String = ""
    @Published var name: String = ""
    @Published var date: Date = Date()
    
    func addHoliday() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "HolidayModel", into: context) as! HolidayModel

        loan.image = image
        loan.name = name
        loan.date = date

        CoreDataStack.shared.saveContext()
    }
    
    func fetchHolidays() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<HolidayModel>(entityName: "HolidayModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.holidays = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.holidays = []
        }
    }
}
