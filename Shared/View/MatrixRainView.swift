//
//  MatrixRainView.swift
//  MatrixRainEffect (iOS)
//
//  Created by kotomi tahkahashi on 2022/02/11.
//

import SwiftUI

struct MatrixRainView: View {
    var body: some View {
        
        GeometryReader{proxy in
            let size = proxy.size
            //ここの
            Text(String("geometry: \(proxy.size.debugDescription)"))
            //print(_:)関数は、引数に与えられたオブジェクトの文字列表現(textual representation)を出力
            //debugDescriptionはプロパティ
            HStack(spacing: 15){
                //横に15ずつスペースを空けてViewGroupを作成
                VStack{
                    //縦のViewGroup
                    //MARK: Iterating String
                    ForEach(0..<constant.count,id: \.self){index in
                        //文字列の数だけForEachを回す。
                        //Retriving Character at String
                        let character = Array(constant)[index]
                        //characterでArrayのインデックスを入れる。
                        Text(String(character))
                    }
                }
            }
        }
    }
}

struct MatrixRainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: Random Characters
// Your Own
let constant = "abcdefghijklmnopqrstuvwxyzabcquepaje123jdj09"
