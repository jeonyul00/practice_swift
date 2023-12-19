//
//  Condition.swift
//  01_basic
//
//  Created by 전율 on 2023/12/19.
//

import SwiftUI

struct Condition: View {
    var count = 4
    
    var body: some View {
                        
        if count != 4 {
            Text("count is not 4")
        } else {
            Text("count is 4")
        }
    }
}

struct Condition_Previews: PreviewProvider {
    static var previews: some View {
        Condition()
    }
}
