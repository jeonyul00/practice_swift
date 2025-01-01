//
//  UserViewModel.swift
//  27.MVVM
//
//  Created by 전율 on 7/5/24.
//

import Foundation
import Combine

class UserViewModel:ObservableObject {
    // @Published: 옵저버블같은건가 -> ㅇㅇ
    @Published var users = [
        User(name:"kim", age:1),
        User(name:"lee", age:2),
        User(name:"park", age:3),
        User(name:"choi", age:4)
    ]
    
    var cancellables: Set<AnyCancellable> = []

    
    // MARK: - read
    func user(idx:Int) -> User {
        return users[idx]
    }
    func userName(idx:Int) -> String {
        return users[idx].name
    }
    func userAge(idx:Int) -> String {
        return users[idx].age.description
    }
    
    func userAge2(idx:Int, completion:@escaping (String)->Void) {
        $users.sink { users in
            completion(users[idx].age.description)
        }.store(in: &cancellables)
    }
    
    func count() -> Int{
        return users.count
    }
    
    // MARK: - create
    func createUser(name:String, age:Int) {
        self.users.append(User(name: name, age: age))
    }
    
    // MARK: - delete
    func deleteUser(idx:UUID) {
        if let selectIndex = users.firstIndex(where: { user in
            user.idx == idx
        }) {
            users.remove(at: selectIndex)
        }
        
    }
    
    // MARK: - update
    func updateUser(idx:UUID, name:String, age:Int) {
        if let selectIndex = users.firstIndex(where: { user in
            user.idx == idx
        }) {
            users[selectIndex].name = name
            users[selectIndex].age = age
        }
    }
}
