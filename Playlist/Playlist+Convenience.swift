//
//  Playlist+Convenience.swift
//  Playlist
//
//  Created by Collin Cannavo on 5/31/17.
//  Copyright © 2017 Collin Cannavo. All rights reserved.
//

import Foundation
import CoreData

extension Playlist {
    convenience init(name: String,
                     context: NSManagedObjectContext = CoreDataStack.context) {
        
        self.init(context: context)
        
        self.name = name
        
    }
    
}
