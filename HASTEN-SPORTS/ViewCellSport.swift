//
//  ViewCellSport.swift
//  HASTEN-SPORTS
//
//  Created by eloysn on 14/4/18.
//  Copyright © 2018 eloysn. All rights reserved.
//

import UIKit
import Kingfisher


class ViewCellSport: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet weak var imaPlayer: UIImageView!
    @IBOutlet weak var lblNamePlayer: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imaPlayer.layer.cornerRadius = imaPlayer.frame.size.width / 2
        imaPlayer.clipsToBounds = true
        
    }

    
    func populateCell(player: Player)  {
    
        lblNamePlayer.text = "\(player.name)  \(player.surname)"
        imaPlayer.kf.setImage(with: player.imageURL)
        
        
        
    }

}
