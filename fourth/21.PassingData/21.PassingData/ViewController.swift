//
//  ViewController.swift
//  21.PassingData
//
//  Created by 전율 on 7/4/24.
//

import UIKit

// segue
class ViewController: UIViewController {
    
    @IBOutlet weak var callbackDataLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    var myAge = 20
    var myName = "lee"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = myName
    }
    
    // 세그웨이가 호출되면(세그웨이로 다음화면으로 넘어갈 때) 이 함수가 호출됨
    // 세그웨이로 설정한 모든 세그웨이들은 다 이 prepare가 호출됨 그래서 함수 내부에서 분기처리 필
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueDetail" {
            // 목적지 정보
            if let detailViewController = segue.destination as? DetailViewController {
                detailViewController.detailName = myName
            }
        }
    }
    
    // unWindSegue: 되돌아왔을 때 데이터를 넘겨받는 법 (몇 뎁스에서도 올 수 있음 -> 분기처리 필)
    @IBAction func testUnWind(segue: UIStoryboardSegue) {
        if let detailViewController =  segue.source as? DetailViewController {
            self.callbackDataLabel.text = detailViewController.detailName
        }
    }
    
}


