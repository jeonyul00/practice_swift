//
//  DetailViewController.swift
//  24.PassingData
//
//  Created by 전율 on 7/4/24.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var closure: ((String)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func back(_ sender: Any) {
        closure?("test")
        self.dismiss(animated: true)
    }
    
    func closureWithFunc(completion:(String)->Void) {
        completion("test")
    }
    
}
