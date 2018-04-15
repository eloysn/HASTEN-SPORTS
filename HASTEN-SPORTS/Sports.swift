//
//  Sports.swift
//  HASTEN-SPORTS
//
//  Created by eloysn on 14/4/18.
//  Copyright © 2018 eloysn. All rights reserved.
//

import Foundation

struct Sports: Codable {
    
    let type: String
    let sport: String
    let players:[Player]
    
    enum CodingKeys: String, CodingKey
    {
        case type
        case sport = "title"
        case players
       
    }
    
}


struct Player: Codable {
    
    let name: String
    let surname: String
    let imageURL: URL
    
    
    enum CodingKeys: String, CodingKey
    {
        case name
        case surname
        case imageURL = "image"
        
        
    }
}
