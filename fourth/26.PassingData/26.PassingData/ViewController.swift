//
//  ViewController.swift
//  26.PassingData
//
//  Created by 전율 on 7/5/24.
//

import UIKit


// closure -> async await
class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func onPress(_ sender: Any) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            
            Task{
                self.nameLabel.text = await vc.closureFunc()
            }
            
            self.present(vc, animated: true)
        }
    }
}

