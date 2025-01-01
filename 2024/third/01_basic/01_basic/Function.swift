//
//  Function.swift
//  01_basic
//
//  Created by 전율 on 2023/12/19.
//

import SwiftUI

struct Function: View {
    @State var num:Int = 0
    var body: some View {
        VStack{
            Text(num.description)
            Button {
                num = plusFive(num)
            } label: {
                Text("plus")
            }

        }
        
    }
    
    func plusFive(_ num:Int)->Int{
        return num + 5
    }
}

struct Function_Previews: PreviewProvider {
    static var previews: some View {
        Function()
    }
}
