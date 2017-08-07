//
//  PlaylistController.swift
//  Playlist
//
//  Created by Collin Cannavo on 5/24/17.
//  Copyright © 2017 Collin Cannavo. All rights reserved.
//

import Foundation
import CoreData

class PlaylistController {
    
    static let shared = PlaylistController()
    
    private let playlistKey = "playlists"
    
    var playlists: [Playlist] {
        
        let request: NSFetchRequest<Playlist> = Playlist.fetchRequest()
        
        return (try? CoreDataStack.context.fetch(request)) ?? []
    }
    
    //CRUD
    //Model controllers hold your data and creates your functions
    
    func createPlaylist(withName name: String) {
        
        _ = Playlist(name: name)
    
        saveToPersistentStore()
    }
    
    func deletePlaylist(playlist: Playlist) {
        
        saveToPersistentStore()
    }
    
    
    func saveToPersistentStore() {
        
        // Turn the array of Playlist objects into an array of dictionaryRepresentations that can be stores into UserDefaults
        
        let moc = CoreDataStack.context
        
        do {
            try moc.save()
        } catch {
            print("There was an error saving: \(error.localizedDescription)")
        }

        
    }
}
