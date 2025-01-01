//
//  Elevator.swift
//  02_Structure
//
//  Created by 전율 on 2023/12/20.
//

import SwiftUI

struct Elevator: View {
    @State var myStruct = ElevatorStruct(level: 1)
    
    var body: some View {
        VStack{
            Text("층 수 : \(myStruct.level)")
            HStack {
                Button {
                    myStruct.down()
                } label: {
                    Text("아래로")
                }
                Button {
                    myStruct.up()
                } label: {
                    Text("위로")
                }
            }
        }
    }
}

struct ElevatorStruct {
    var level:Int
    mutating func up() {
        level += 1
    }
    mutating func down() {
        level -= 1
    }
}

struct Elevator_Previews: PreviewProvider {
    static var previews: some View {
        Elevator()
    }
}
