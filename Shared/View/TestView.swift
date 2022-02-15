//
//  TestView.swift
//  MatrixRainEffect (iOS)
//
//  Created by kotomi tahkahashi on 2022/02/15.
import SwiftUI

struct TestView: View {
  @State private var toggle: Bool = true
  var body: some View {
    VStack {
      Text("Hello, world!")
        .offset(y: toggle ? 0 : -200)
        .padding()
      Button(action: {
        toggle.toggle()
      }, label: {
        Text("animate text")
      })
    }
  }
}
struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
