//
//  ListSportsViewModel.swift
//  HASTEN-SPORTS
//
//  Created by eloysn on 14/4/18.
//  Copyright © 2018 eloysn. All rights reserved.
//

import Foundation
import RxSwift

class ListSportsViewModel {

     // MARK: - Private
    let session = SessionAPI()
    private lazy var _sports: Observable<[Sports]> = session.send(request: API.ListSports)
    
    // MARK: - Public
    private(set) lazy var sports: Observable<[Sports]> = self._sports
    .map(sortedSport)
    .catchErrorJustReturn([])
    
    func sortedSport(sports: [Sports]) -> [Sports] {
       return sports.sorted { $0.sport < $1.sport}
        
    }
    
    func sortedPlayers(sports: [Player]) -> [Player]  {
        return sports.sorted { $0.name < $1.name }
    
    }
    
}
    
    
   
    
    
    
        
    
 

