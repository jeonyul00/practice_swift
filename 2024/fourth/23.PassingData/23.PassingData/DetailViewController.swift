//
//  DetailViewController.swift
//  23.PassingData
//
//  Created by 전율 on 7/4/24.
//

import UIKit

// delegate
class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    weak var delegate: ViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
        delegate?.getString(str: "test")
        self.dismiss(animated: true)
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
