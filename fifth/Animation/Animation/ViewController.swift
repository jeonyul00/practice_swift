//
//  ViewController.swift
//  Animation
//
//  Created by 전율 on 10/9/24.
//

import UIKit

class ViewController: UIViewController {
    
    // 최초 값: CGRect(x: 0, y: 0, width: 100, height: 100)
    @IBOutlet weak var boxView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func moveBox(_ sender: Any) {
        // animation
        UIView.animate(withDuration: 1) {
            self.boxView.frame = CGRect(x: 200, y: 400, width: 100, height: 100)
        } completion: { isFinish in
            if isFinish {
                print("아 잘됨~")
            }
        }

    }
    
}

