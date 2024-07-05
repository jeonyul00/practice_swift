//
//  ViewController.swift
//  27.MVVM
//
//  Created by 전율 on 7/5/24.
//

import UIKit

/* MVVM
    바인딩 (closure, notification, combine, rxSwift) -> 옵저버 패턴 구현 -> 어떤 데이터가 변경되었을 때 구독한 쪽에서 인지함
 */
import Combine

class ViewController: UIViewController {
    
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var viewModel = UserViewModel()
    var selectedUUID = UUID()
    var cancellables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
    }
    
    
    @IBAction func create(_ sender: Any) {
        let name = nameField.text ?? ""
        let age = Int(ageField.text ?? "") ?? 0
        viewModel.createUser(name: name, age: age)
        tableView.reloadData()
    }
    
    @IBAction func edit(_ sender: Any) {
        let name = nameField.text ?? ""
        let age = Int(ageField.text ?? "") ?? 0
        viewModel.updateUser(idx: selectedUUID, name: name, age: age)
//        tableView.reloadData()
    }
    
    @IBAction func deleteUser(_ sender: Any) {
        viewModel.deleteUser(idx: selectedUUID)
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
        // cell.nameLabel.text = viewModel.userName(idx: indexPath.row)
        // cell.ageLabel.text = viewModel.userAge(idx: indexPath.row)
        
        // 옵저버 등록인가? -> $users값이 변경되면 클로저 실행
        // 메모리에서 해제될 수 있도록 cancellables을 해야함 -> rx의 디스포저
        viewModel.$users.sink { users in
            cell.nameLabel.text = users[indexPath.row].name
        }.store(in: &cancellables)
        
        viewModel.userAge2(idx: indexPath.row) { ageStr in
            cell.ageLabel.text = ageStr
        }
                        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedUUID = viewModel.user(idx: indexPath.row).idx
    }
}
