//
//  DetailViewController.swift
//  20.PassingData
//
//  Created by 전율 on 7/3/24.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    var detailName = ""
    var detailAge = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameLabel.text = detailName
        self.ageLabel.text = detailAge.description
    }
        
}
