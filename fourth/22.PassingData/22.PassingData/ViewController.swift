//
//  ViewController.swift
//  22.PassingData
//
//  Created by 전율 on 7/4/24.
//

import UIKit

// self instance
class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    var name = "lee"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameLabel.text = name
    }
    
    @IBAction func onPress(_ sender: Any) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            vc.mainVC = self // 참조함
            self.present(vc, animated: true)
        }
        
    }
    
}

