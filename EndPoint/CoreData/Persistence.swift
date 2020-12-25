//
//  Persistence.swift
//  EndPoint
//
//  Created by David on 12/25/20.
//

import Foundation
import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "EndPoint")
        container.loadPersistentStores { (storeDescription, err) in
            if let err = err as Error? {
                print(err.localizedDescription)
            }
        }
    }
    
}
