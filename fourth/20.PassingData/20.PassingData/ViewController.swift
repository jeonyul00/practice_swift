//
//  ViewController.swift
//  20.PassingData
//
//  Created by 전율 on 7/3/24.
//

import UIKit

// property (instance)
class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    var myAge = 20
    var myName = "lee"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameLabel.text = myName
        
    }
    
    @IBAction func moveToDetail(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            vc.nameLabel.text = nameLabel.text
            self.present(vc, animated: true)
        }
    }
    
}

