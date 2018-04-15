//
//  DetailPlayerViewController.swift
//  HASTEN-SPORTS
//
//  Created by eloysn on 15/4/18.
//  Copyright © 2018 eloysn. All rights reserved.
//

import UIKit
import Kingfisher

class DetailPlayerViewController: UIViewController {


    @IBOutlet weak var imaPlayer: UIImageView!
    @IBOutlet weak var lblPlayerName: UILabel!
    
    
    var player: Player? {
    
        didSet{
            populatePlayer()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imaPlayer.layer.cornerRadius = imaPlayer .frame.size.width / 2
        imaPlayer.clipsToBounds = true
        populatePlayer()

        
    }
    
    func populatePlayer()  {
        guard let player = player, let ima = imaPlayer, let lbl = lblPlayerName else {
            return
        }
        
        ima.kf.setImage(with: player.imageURL)
        lbl.text = "\(player.name)  \(player.surname)"
        
}

    
    

    

}
