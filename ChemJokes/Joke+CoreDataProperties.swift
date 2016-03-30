//
//  Joke+CoreDataProperties.swift
//  ChemJokes
//
//  Created by Andrew Burns on 1/9/16.
//  Copyright © 2016 Andrew Burns. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Joke {

    @NSManaged var text: String?
    @NSManaged var date: NSDate?

}
