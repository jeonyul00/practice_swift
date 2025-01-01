//
//  DetailViewController.swift
//  26.PassingData
//
//  Created by 전율 on 7/5/24.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var closure: ((String)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func back(_ sender: Any) { }
    
    
    func closureFun(completion:(String)->Void) {
        completion("test")
    }
    
    func closureFunc() async -> String {
        // 클로저 내용을 withCheckedContinuation로 감싸고, 리턴할 값을 continuation.resume하면 비동기로 됨
        await withCheckedContinuation { continuation in
            closureFun { str in
                continuation.resume(returning: str)
            }
        }
    }
    
}
