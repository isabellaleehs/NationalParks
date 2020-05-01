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
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        if #available(iOS 10.0, *) {
            self.tableView.refreshControl = refreshControl
        } else {
            self.tableView.backgroundView = refreshControl
        }
        
        self.parkService = ParkService()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    @objc func refresh(_ refreshControl: UIRefreshControl) {
        guard let confirmedVisit = self.parkService else { return }

        confirmedVisit.getParks(completion: { parks, error in
            guard let parks = parks, error == nil else {
                let alertController = UIAlertController(title: "Alert", message: error?.localizedDescription, preferredStyle: .alert)

                // Create OK button
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                    print("Ok");
                }
                alertController.addAction(OKAction)
                self.present(alertController, animated: true, completion:nil)
                return
            }

            self.parks = parks
            self.tableView.reloadData()
        })
        refreshControl.endRefreshing()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let confirmedVisit = self.parkService else { return }
        
        confirmedVisit.getParks(completion: { parks, error in
            guard let parks = parks, error == nil else {
                let alertController = UIAlertController(title: "Alert", message: error?.localizedDescription, preferredStyle: .alert)
                
                // Create OK button
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                    print("Ok");
                }
                alertController.addAction(OKAction)
                self.present(alertController, animated: true, completion:nil)
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
    


