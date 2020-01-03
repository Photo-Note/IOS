//
//  Model+Convenience.swift
//  PhotoNote
//
//  Created by Alex Shillingford on 1/2/20.
//  Copyright © 2020 brian vilchez. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension Photo {
    convenience init(name: String, photo: Data, collectionName: String, partner: String?, note: String?, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        self.init(context: context)
        
        self.name = name
        self.photo = photo
        self.collectionName = collectionName
        self.partner = partner
        self.note = note
    }
    
//    convenience init?(photoRepresentation: PhotoRepresentation, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
//
//        guard let partner = photoRepresentation.partner,
//            let note = photoRepresentation.note else { return }
//
//        self.init(name: photoRepresentation.name, photo: photoRepresentation.photo, partner: partner, note: note, context: context)
//    }
}
