//
//  ViewController.swift
//  21.ARC
//
//  Created by 전율 on 2024/04/12.
//

import UIKit

class ViewController: UIViewController {
    var otherDetailViewCont: DetailViewController?
    
    weak var weakDetailViewCont: DetailViewController! {
        didSet {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                print(self.weakDetailViewCont) // nil -> 참조하는 원본 없어지면 자동으로 nil이 되는거지
            }
        }
    }
    
    unowned var unownedDetailViewCont: DetailViewController! {
        didSet {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                print(self.unownedDetailViewCont) // error -> 잠조하는 원본이 없어져도 nil이 되지 않음, 없는걸 참조하니까 에러가 터지지
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func release(_ sender: Any) {
        otherDetailViewCont = nil
    }
    
    @IBAction func moveToDetailVC(_ sender: Any) {
        let detailVC = DetailViewController() // reference count + 1
        // 만들어진 환경이 끝날 때까지 쓰지 않는다면 detailVC release - 1
        let detailVC2 = detailVC // reference count + 1
        // 만들어진 환경이 끝날 때까지 쓰지 않는다면 detailVC2 release - 1
        otherDetailViewCont = detailVC // reference count + 1
        //  ㄴ 클래스 자체를 없애거나, 해당 변수를 nil로 재할당하면 되겠지 뭐, 또는 weak로
        weakDetailViewCont = detailVC //  reference count + 0
        self.present(detailVC2, animated: true) // reference count + 1
        //  ㄴ 화면 내리면 - 1
    }
}

class DetailViewController: UIViewController {
    
    init(){
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = .orange
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("detailvc deinit")
    }
    
}
