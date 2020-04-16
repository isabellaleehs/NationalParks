//
//  ViewController.swift
//  ListApp
//
//  Created by Isabella Lee on 4/16/20.
//  Copyright © 2020 Isabella Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var parks: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.parks = ["Death Valley", "Yosemite", "Joshua Tree", "Death Valley", "Yosemite", "Joshua Tree", "Death Valley", "Yosemite", "Joshua Tree", "Death Valley", "Yosemite", "Joshua Tree", "Death Valley", "Yosemite", "Joshua Tree", "Death Valley", "Yosemite", "Joshua Tree"]
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    //MARK: DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.parks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "parkCell")!
        cell.textLabel?.text = self.parks[indexPath.row]
        return cell
    }
    

    
}

