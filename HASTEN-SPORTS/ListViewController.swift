//
//  ListViewController.swift
//  HASTEN-SPORTS
//
//  Created by eloysn on 14/4/18.
//  Copyright © 2018 eloysn. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ListViewController: UIViewController {

    // MARK: - Private
    private let searchController = UISearchController(searchResultsController: nil)
    private let viewModel = ListSportsViewModel()
    let disposeBag = DisposeBag()
    private var dataModel = [Sports] ()
    
    // MARK: -Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupBinding()
       

    }
    
     // MARK: - Configure
    func setup()  {
    
        tableView.dataSource = self
        tableView.rowHeight = 100
        navigationItem.title = "Sports"
    }
    
    func setupBinding() {
        viewModel.sports.observeOn(MainScheduler.instance)
        .subscribe(onNext: {  self.dataModel = self.viewModel.sortedSport(sports: $0)
                             self.updateTable()
        },
                   onError: { _ in self.dataModel = []
                                   self.updateTable()
        }).disposed(by: disposeBag)
        
        
        
        tableView.rx.itemSelected.subscribe {
            guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailPlayerViewController") as? DetailPlayerViewController, let index = $0.element else {
                return
            }
            let players = self.viewModel.sortedPlayers(sports: self.dataModel[index.section].players)
            let player = players[index.row]
            vc.player = player
            self.navigationController?.pushViewController(vc, animated: true)
            
            
            }.disposed(by: disposeBag)
    }

    func updateTable() {
        tableView.reloadData()
    }
 
}

 // MARK: - UITableViewDataSource
extension ListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
    
        return self.dataModel.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.dataModel[section].sport
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.dataModel[section].players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SportCell", for: indexPath) as? ViewCellSport else {
            return UITableViewCell()
        }
        let players = viewModel.sortedPlayers(sports: dataModel[indexPath.section].players)
        let player = players[indexPath.row]
        cell.populateCell(player: player)
        
        return cell
    }


}
