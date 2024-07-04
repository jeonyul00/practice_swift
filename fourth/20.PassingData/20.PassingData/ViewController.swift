//
//  ViewController.swift
//  20.PassingData
//
//  Created by 전율 on 7/3/24.
//

import UIKit

// property (instance)
class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    var myAge = 20
    var myName = "lee"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameLabel.text = myName
        
    }
    
    /*
     UIKit에서 뷰 컨트롤러의 뷰는 메모리 효율성을 위해 필요할 때까지 로드되지 않습니다. 뷰 컨트롤러가 인스턴스화되었더라도, 그 뷰와 서브뷰(예: UILabel)는 아직 메모리에 로드되지 않을 수 있습니다. 그래서 self.present(vc, animated: true)를 호출하기 전에 vc.nameLabel과 vc.ageLabel을 접근하려 하면 nil이 반환됩니다.
     
     UIViewController의 뷰 로딩 사이클
     초기화(Instantiation): 뷰 컨트롤러가 인스턴스화됩니다. 하지만 이 시점에서는 뷰와 서브뷰가 아직 메모리에 로드되지 않습니다.
     뷰 로드(View Load): viewDidLoad()가 호출될 때 뷰와 서브뷰가 메모리에 로드됩니다. 이때 인터페이스 빌더에서 설정한 아웃렛들도 연결됩니다.
     뷰가 나타나기 직전(View Will Appear): 뷰가 화면에 나타나기 직전에 호출됩니다.
     뷰가 나타남(View Did Appear): 뷰가 화면에 완전히 나타난 후 호출됩니다.
     */
    @IBAction func moveToDetail(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            // vc.nameLabel.text = nameLabel.text
            // vc.ageLabel.text = myAge.description
            // 위가 안되는 이유: 아직 vc.nameLabel랑 vc.ageLabel가 아직 메모리에 올라가지 않아서 nil인데 접근했기 떄문에
            // 인스턴스를 만들었는데 왜 nil이냐? => 뷰는 화면이 나올 준비가 되면 그 때 연결이 됨: self.present(vc, animated: true) 등
            // 일반 프로퍼티는 클래스가 인스턴스화될 때 메모리에 올라감
            
            // 그래서 이거는 인스턴스화 되는 즉시 접근됨
            vc.detailName = myName
            vc.detailAge = myAge
            
            self.present(vc, animated: true)
            vc.nameLabel.text = myName
            vc.ageLabel.text = myAge.description
        }
    }
    
}

