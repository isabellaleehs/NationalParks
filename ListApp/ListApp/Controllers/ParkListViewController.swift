//
//  ViewController.swift
//  ListApp
//
//  Created by Isabella Lee on 4/16/20.
//  Copyright © 2020 Isabella Lee. All rights reserved.
//

import UIKit

class ParkListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var parks: [Park] = []
    var parkService: ParkService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.parkService = ParkService()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let confirmedService = self.parkService else { return }
        
        confirmedService.getParks(completion: { parks, error in
            guard let parks = parks, error == nil else {
                return
            }
            self.parks = parks
            self.tableView.reloadData()
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let destination = segue.destination as? DetailViewController,
            let selectedIndexPath = self.tableView.indexPathForSelectedRow,
            let confirmedCell = self.tableView.cellForRow(at: selectedIndexPath) as? ParkCell
            else { return }
        
        let confirmedPark = confirmedCell.park
        destination.park = confirmedPark
    }
}
    
extension ParkListViewController: UITableViewDataSource {
    //MARK: DataSource
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.parks.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "parkCell") as! ParkCell
        
        let currentPark = self.parks[indexPath.row]
        
        cell.park = currentPark
        
        return cell
    }
}

extension ParkListViewController: UITableViewDelegate {
    //MARK: Delegate
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if
//            let cell = self.tableView.cellForRow(at: indexPath) as? ParkCell,
//            let confirmedPark = cell.park
//        {
//            confirmedPark.confirmedVisit = true
//            cell.accessoryType = confirmedPark.confirmedVisit ? .checkmark : .none
//        }
//    }
    
}
    


