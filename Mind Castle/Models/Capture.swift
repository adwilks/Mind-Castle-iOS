//
//  Capture.swift
//  Mind Castle
//
//  Created by Adrien Wilkins on 2020/02/01.
//  Copyright © 2020 Adrien Wilkins. All rights reserved.
//

import Foundation
import CoreData

public class Capture:NSManagedObject, Identifiable {
    @NSManaged public var createdOn:Date?
    @NSManaged public var tags:String?
    @NSManaged public var title:String? //Is this necessary, one of the points is to not need this sort of thing...
    @NSManaged public var content:String?
}

extension Capture {
    static func getAllCaptures() -> NSFetchRequest<Capture> {
        let request:NSFetchRequest<Capture> = Capture.fetchRequest() as! NSFetchRequest<Capture>
        let sortDescriptor = NSSortDescriptor(key: "createdOn", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
