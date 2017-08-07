//
//  Songs+Convenience.swift
//  Playlist
//
//  Created by Collin Cannavo on 5/31/17.
//  Copyright © 2017 Collin Cannavo. All rights reserved.
//

import Foundation
import CoreData

extension Song {
    convenience init(title: String, artistName: String, playlist: Playlist,
                     context: NSManagedObjectContext = CoreDataStack.context) {
        
        self.init(context: context)
        
        self.title = title
        self.artistName = artistName
        self.playlist = playlist
        
    }
}
