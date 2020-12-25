//
//  EPdata+CoreDataProperties.swift
//  EndPoint
//
//  Created by David on 12/25/20.
//
//

import Foundation
import CoreData


extension EPdata {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EPdata> {
        return NSFetchRequest<EPdata>(entityName: "EPdata")
    }

    @NSManaged public var jsonData: Data?
    @NSManaged public var timeInterval: Double

}

extension EPdata : Identifiable {
    public var wrappedTimeInterval: String {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return df.string(from: Date(timeIntervalSince1970: timeInterval))
    }
    
    public var wrappedJSONData: Data? {
        jsonData
    }
}
