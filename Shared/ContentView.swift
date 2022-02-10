//
//  ContentView.swift
//  Shared
//
//  Created by kotomi tahkahashi on 2022/02/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack{
            
            Color.black
            
            MatrixRainView()
        }
        .ignoresSafeArea()
        ///SwiftUI の View はデフォルトでは SafeArea の中に配置される
        ///.ignoresSafeAreaを使うと、SafeAreaを超えてViewを配置することができるようになる。
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
