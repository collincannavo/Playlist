//
//  PlaylistTableViewController.swift
//  Playlist
//
//  Created by Collin Cannavo on 5/24/17.
//  Copyright © 2017 Collin Cannavo. All rights reserved.
//

import UIKit

class PlaylistTableViewController: UITableViewController {

    
    @IBOutlet weak var playlistNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        self.tableView.reloadData()
    }

    @IBAction func addPlaylistButtonTapped(_ sender: Any) {
  
        // When the user hits the add playlist button, then we want the View controller to access the Playlist Controller and then used the shared variable to access the function createPlaylist. But we needed the name to fill in the parameters, so we created a variable in the addPlaylistButtonTapped  
        
        if let name = playlistNameTextField.text {
            
            PlaylistController.shared.createPlaylist(withName: name)
            self.playlistNameTextField.text = ""
            self.tableView.reloadData()
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  PlaylistController.shared.playlists.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaylistCell", for: indexPath)

        let playlist = PlaylistController.shared.playlists[indexPath.row]
        
        let songs = playlist.songs ?? []
        
        cell.textLabel?.text = playlist.name
        cell.detailTextLabel?.text = "\(songs.count)"

        return cell
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "toSongsVC" {
           
            if let indexPath = self.tableView.indexPathForSelectedRow {
     
                let destinationVC = segue.destination as? SongsTableViewController
                
                let playlist = PlaylistController.shared.playlists[indexPath.row]
                
                destinationVC?.playlist = playlist
                
                
            }
        }
    }
}
