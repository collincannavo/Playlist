//
//  SongsTableViewController.swift
//  Playlist
//
//  Created by Collin Cannavo on 5/24/17.
//  Copyright © 2017 Collin Cannavo. All rights reserved.
//

import UIKit

class SongsTableViewController: UITableViewController {

    var playlist: Playlist? 
    
    @IBOutlet weak var songNameTextField: UITextField!

    @IBOutlet weak var artistNameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    @IBAction func addSongButtonTapped(_ sender: Any) {
        
        guard let name = songNameTextField.text,
            let artist = artistNameTextField.text,
            let playlist = self.playlist else { return }
        
        SongController.createSong(withName: name, artist: artist, playlist: playlist)
        songNameTextField.text = ""
        artistNameTextField.text = ""
        self.tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return playlist?.songs?.count ?? 0
        
        // ??  is the nil coalescent which basically says "if the left side is nil, then return the right side"
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath)

        guard let song = playlist?.songs?[indexPath.row] as? Song else { return UITableViewCell() }
            
        cell.textLabel?.text = song.title
        cell.textLabel?.text = song.artistName
        
        return cell
    }
}
