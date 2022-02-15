//
//  MatrixRainView.swift
//  MatrixRainEffect (iOS)
//
//  Created by kotomi tahkahashi on 2022/02/11.
//

import SwiftUI

struct MatrixRainView: View {
    @State var startAnimation: Bool = false
    var body: some View {
    
        GeometryReader{proxy in
            let size = proxy.size
            //ここの
            //            Text(String("geometry: \(proxy.size.debugDescription)"))
            //                .foregroundColor(Color.yellow)
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
                        //constantをArrayと見做す。
                        //characterでArrayのインデックスを入れる。
                        Text(String(character))
                            .font(.custom("Matrix Code NFI", size: 25))
                            .foregroundColor(Color("Green"))
                        //.font
                    }
                }
                .offset(y: startAnimation ? 0: -600)
//  -size.heightをduration (秒)で移動するということ？
                 //startAnimationはBool
            }
            .padding(.horizontal)
       
        }
        .onAppear {
            //Moving Siowly down with linear Animation(線形のアニメーション)
            withAnimation(.linear(duration: 12)){
                // withAnimation(.linearで等速で移動。
                startAnimation = true
                //startAnimationがtureだったらアニメーションが始まる。
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
