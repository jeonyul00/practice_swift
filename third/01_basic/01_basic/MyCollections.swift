//
//  MyCollections.swift
//  01_basic
//
//  Created by 전율 on 2023/12/19.
//

import SwiftUI

struct MyCollections: View {
    var foods: Array<String> = ["eggs", "bananas", "beans"]
    var jazzs: Set<String> = ["bibidudu", "labdap", "didididudu"]
    var hiphop: Set<String> = ["rap","wow","labdap"]
    var koEngDic:[String:String] = ["사과":"apple"]
    
    var body: some View {
        VStack{
            Text(hiphop.intersection(jazzs).description)
            Button {
                let intersectionMusic = hiphop.intersection(jazzs)
                print(intersectionMusic.description)
            } label: {
                Text("hit!")
            }
            Text(foods[1])
            Text(koEngDic["사과"]!)
        }
        
    }
}

struct MyCollections_Previews: PreviewProvider {
    static var previews: some View {
        MyCollections()
    }
}
