//
//  VariableType.swift
//  01_basic
//
//  Created by 전율 on 2023/12/19.
//

import SwiftUI

struct VariableType: View {
    
    let name:String = "jeonyul"
    let age:Int = 30
    let height:Float = 165.3
    let havePet:Bool = false

    var body: some View {
        VStack {
            Text("name \(name)")
            Text("age \(age)")
            Text("height \(height)")
            Text("havePet \(havePet.description)")
        }
    }
}

struct VariableType_Previews: PreviewProvider {
    static var previews: some View {
        VariableType()
    }
}
