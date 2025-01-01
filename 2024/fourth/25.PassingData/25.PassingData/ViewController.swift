//
//  ViewController.swift
//  25.PassingData
//
//  Created by 전율 on 7/5/24.
//

import UIKit

// notification: 한 쪽에서 일방적으로 전달 => 목적지와 시작점이 연결점이 없을 때 사용하면 좋다 또는 한번에 여러군데 보낼 때 좋음
class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    let myName = "lee"

    override func viewDidLoad() {
        super.viewDidLoad()
        createObserver()
    }
    
    func createObserver() {
        let notiName = Notification.Name("changedName")
        // notification 등록
        // 프롭스 순서 -> 실행되는 곳, 실행할 함수, 노티피케이션을 등록하고 이를 구분할 이름, 오브젝트
        NotificationCenter.default.addObserver(self, selector: #selector(changedName), name: notiName, object: nil)
    }
    
    
    @objc func changedName(notification:Notification) {
        if let hasName =  notification.userInfo?["name"] as? String {
            nameLabel.text = hasName
        }
    }

    @IBAction func onPress(_ sender: Any) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            self.present(vc, animated: true)
        }
    }
}
