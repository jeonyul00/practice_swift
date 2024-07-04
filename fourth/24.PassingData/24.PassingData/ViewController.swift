//
//  ViewController.swift
//  24.PassingData
//
//  Created by 전율 on 7/4/24.
//

import UIKit

// closure
class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    var myName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onPress(_ sender: Any) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            //            vc.closure = { [weak self] str in self?.nameLabel.text = str }
            //            self.present(vc, animated: true)
            //        }
            
            // 클로저대신 함수를 넣어도 됨 => 클로저란 언네임드 펑션이니까
            /*
             Swift에서 클로저는 일급 객체로 취급됩니다. 이는 함수도 클로저로 간주되며 변수에 할당되거나 다른 함수에 인자로 전달될 수 있다는 의미입니다. 클로저를 변수에 할당하거나 인자로 전달할 때는 함수 이름만으로도 가능하며, 호출하는 것이 아니라 함수 자체를 전달하는 것입니다.
             */
            // 함수 자체를 전달한거지
            // vc.closure = tesFunc
            
            // 이렇게해도 됨
            vc.closureWithFunc(completion: tesFunc)
        }
        
        
        func tesFunc(str:String) {
            self.nameLabel.text = str
        }
    }
    
}
