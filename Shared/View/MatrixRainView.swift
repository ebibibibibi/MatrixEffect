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
            //Text(String("geometry: \(proxy.size.debugDescription)"))
            //.foregroundColor(Color.yellow)
            //print(_:)関数は、引数に与えられたオブジェクトの文字列表現(textual representation)を出力
            //debugDescriptionはプロパティ
            HStack(spacing: 15){
                //横に15ずつスペースを空けてViewGroupを作成
                ForEach(1...Int(size.width / 25),id: \.self){ _ in
                    MatrixRainCharacters(size: size)
                    //size.widthは320
                    //size.width / 25 -> 1...12
                    //size.width / 100 -> 1,2,3
                    //size.width / 250 -> 1
                    //size.width /Intの結果に応じて、画面をHStackとして分割しているということか？
                }
            }
            .padding(.horizontal)
        }
    }
}

struct MatrixRainCharacters: View{
    //MARK: Animation Properties
    var size: CGSize
    @State var startAnimation: Bool = false
    
    var body: some View{
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
        //Fade like Animation Using Mask
        .mask(alignment: .top){
            Rectangle()
                .fill(
                    
                    LinearGradient(colors: [
                        
                        .clear,
                        .black.opacity(0.1),
                        .black.opacity(0.2),
                        .black.opacity(0.3),
                        .black.opacity(0.5),
                        .black.opacity(0.7),
                        .black
                        //徐々に透明度を下げている。
                        //LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .leading, endPoint: .trailing)
                        
                    ], startPoint: .top, endPoint: .bottom)
                )
                .frame(height: size.height / 2)
            // Animating
            // To look like its coming from Top
                .offset(y: startAnimation ? size.height : -(size.height/2))
            /*ここまでmaskの配下。
             mask, LinearGradientで透明度の調整。
             offsetで動きを追加。
             */
        }
        .onAppear {
            //Moving Siowly down with linear Animation(線形のアニメーション)
            //Endless loop without re
            withAnimation(.linear(duration: 12).repeatForever(autoreverses: false)){
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
