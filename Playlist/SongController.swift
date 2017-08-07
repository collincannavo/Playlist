//
//  SongController.swift
//  Playlist
//
//  Created by Collin Cannavo on 5/24/17.
//  Copyright © 2017 Collin Cannavo. All rights reserved.
//

import Foundation

class SongController {

    static func createSong(withName name: String, artist: String, playlist: Playlist) {
        
        _ = Song(title: name, artistName: artist, playlist: playlist)
        
        PlaylistController.shared.saveToPersistentStore()
    }
}
