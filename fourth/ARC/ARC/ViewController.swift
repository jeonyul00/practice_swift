//
//  ViewController.swift
//  ARC
//
//  Created by 전율 on 2024/03/04.
//

import UIKit
/*
 ARC: 자동으로 메모리 사용을 추적 관리 -> 레퍼런스 카운트가 0이 되면 메모리에서 내려감
 strong(강한 참조), weak(약한 참조), unowned(미소유 참조)
 weak, unowned => 애초에 카운트가 안 올라감
 strong만 카운트 올라감 (default)
 순환 참조 => 서로가 서로를 강한 참조하고 있는 상태 => 메모리에 계속 남아있겠지, 버그가 생길 수도 있다.
 */

class ViewController: UIViewController {
    
    var otherDetailVC: DetailViewController?
    weak var weakOtherDetailVC: DetailViewController? {
        didSet {
            print(weakOtherDetailVC) // 아직 값이 가지고 있다.
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                print(self.weakOtherDetailVC) // nil => 이게 무슨말이냐면 => weak의 경우 값이 없어지면 자동으로 nil로 바뀜
            }
        }
    }
    unowned var unownedDetailVC: DetailViewController? {
        didSet {
            print(unownedDetailVC) // 아직 값을 가지고 있다.
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                print(self.unownedDetailVC) // error => 참조하고 있는 값이 없어지면, nil로 바꾸는게 아니다, 카운트가 있든 없든 있는걸로 가정한다. 옵셔널이 아닌거지
            }
        }
    }
    
    
    override func viewDidLoad() { super.viewDidLoad() }
    
    @IBAction func moveToDetailVC(_ sender: Any) {
        // 카운트가 증가하는 환경이 끝나는 시점에 더 이상 사용하는 게 없으면 카운트를 자동으로 내림
        // 다시 : 이 만들어진 환경 자체가 끝나는 환경이 되면 컴파일러가 끝나는 환경까지 사용하지 않으면 레퍼런스 카운트 줄임
        let detailViewController = DetailViewController() // 카운트 +1
        // let vc2 = detailViewController // 카운트 +1 (원본 참조)
        // otherDetailVC = detailViewController // 카운트 +1: moveToDetailVC이 끝나는 시점에 otherDetailVC는 살아있기 때문에 해제 안됨
        // weakOtherDetailVC = detailViewController // weak: 카운트 +0
        unownedDetailVC = detailViewController // weak: 카운트 +0
        // self.present(detailViewController, animated: true) // 카운트 +1, 화면이 내려가면 해제됨
    }
    
}


class DetailViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = .yellow
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("메모리 해제!")
    }
    
    
}
