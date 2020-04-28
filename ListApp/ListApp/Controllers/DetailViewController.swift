//
//  DetailViewController.swift
//  ListApp
//
//  Created by Isabella Lee on 4/22/20.
//  Copyright © 2020 Isabella Lee. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var parkImageViewBig: UIImageView!
    @IBOutlet weak var parkLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var visitorsPerYearLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var park: Park!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(park!)

        // Do any additional setup after loading the view.
        DispatchQueue.global(qos: .userInitiated).async {
            let parkImageData = NSData(contentsOf: URL(string: self.park!.imageUrl)!)
            DispatchQueue.main.async {
                self.parkImageViewBig.image = UIImage(data: parkImageData! as Data)
            }
        }
        self.parkLabel.text = park?.name
        self.rankLabel.text = String(park.rank)
        self.visitorsPerYearLabel.text = park?.visitorsPerYear
        self.descriptionLabel.text = park?.description
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
