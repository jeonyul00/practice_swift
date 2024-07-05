//
//  Model.swift
//  27.MVVM
//
//  Created by 전율 on 7/5/24.
//

import Foundation

// 받아온 데이터의 형태구조

struct User {
    var idx: UUID
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.idx = UUID()
        self.name = name
        self.age = age
    }
}

struct Users {
    var info: [(name:String, age:Int)] = [("kim", 28), ("jeon", 30), ("park", 35)]
}
