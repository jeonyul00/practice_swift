//
//  ViewController.swift
//  23.PassingData
//
//  Created by 전율 on 7/4/24.
//

import UIKit

// delegate
class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    var myName = "lee"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onPress(_ sender: Any) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            vc.delegate = self // 메모리 누수 주의 <- self가 뭐야? 클래스잖아 참조겠지?
            self.present(vc, animated: true)
        }
    }
}

extension ViewController:ViewControllerDelegate {
    func getString(str: String) {
        self.nameLabel.text = str
    }
}

protocol ViewControllerDelegate:AnyObject {
     func getString(str:String)
}
 
