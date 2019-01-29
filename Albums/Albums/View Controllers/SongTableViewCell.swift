//
//  SongTableViewCell.swift
//  Albums
//
//  Created by Madison Waters on 1/28/19.
//  Copyright © 2019 Jonah Bergevin. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {

    @IBOutlet weak var songTitleTextField: UITextField!
    @IBOutlet weak var durationTextField: UITextField!
    @IBOutlet weak var addSongButtonTitle: UIButton!
    
    @IBAction func addSong(_ sender: Any) {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
