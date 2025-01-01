//
//  MenuListViewModel.swift
//  RxSwift+MVVM
//
//  Created by 전율 on 7/7/24.
//  Copyright © 2024 iamchiwon. All rights reserved.
//

import Foundation
import RxSwift

// subject: 옵저버블이면서 옵저버

class MenuListViewModel {
    
    init() {
        var menus: [Menu] = [
            Menu(name: "메뉴1", price: 100, count: 10),
            Menu(name: "메뉴2", price: 200, count: 2),
            Menu(name: "메뉴3", price: 300, count: 4),
        ]
        menuObserverble.onNext(menus)
    }
    
    // 옵저버블 등록 <- 얘가 메인이네
    var menuObserverble = BehaviorSubject<[Menu]>(value: [])
    
    // 구독
    lazy var itemsCount = menuObserverble.map {
        $0.map {$0.count * $0.count }.reduce(0,+)
    }
    
    // 구독
    lazy var totalPrice = menuObserverble.map {
        $0.map {$0.price * $0.count }.reduce(0,+)
    }
    
    func clearAll() {
        menuObserverble.map { menus in
            return menus.map { m in
                Menu(name: m.name, price: m.price, count: 0)
            }
        }.take(1).subscribe(onNext: {
            self.menuObserverble.onNext($0)
        })
    }
    
}
