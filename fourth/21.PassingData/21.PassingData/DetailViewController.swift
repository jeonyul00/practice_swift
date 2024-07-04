//
//  DetailViewController.swift
//  21.PassingData
//
//  Created by 전율 on 7/4/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    var detailName: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let detailName {
            self.nameLabel.text = detailName
        }
        
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
