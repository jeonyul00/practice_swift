//
//  DetailViewController.swift
//  25.PassingData
//
//  Created by 전율 on 7/5/24.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func back(_ sender: Any) {
        // 데이터 뿌리기
        // 프롭스 순서 -> 등록된 이름, 오브젝트(전달할 데이터), 전달할 데이터
        let notiName = Notification.Name("changedName")
        NotificationCenter.default.post(name: notiName, object: nil, userInfo: ["name":"test"])
    }
}
