//
//  Task+Convenience.swift
//  Task25
//
//  Created by Hannah Hoff on 3/13/19.
//  Copyright © 2019 Hannah Hoff. All rights reserved.
//

import Foundation
import CoreData

extension Task {
    
    @discardableResult
    convenience init(name: String, notes: String? = nil, due: Date? = nil, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        
        self.name = name
        self.notes = notes
        self.due = due as Date?
//        self.isComplete = isComplete
        
    }
}
