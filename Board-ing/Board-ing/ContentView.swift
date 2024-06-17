//
//  ContentView.swift
//  Board-ing
//
//  Created by Byeol Kim on 6/17/24.
//
import SwiftUI
import PassKit

struct ContentView: View {
    let passNames = ["PRELUDE", "MC1", "NC1", "MC2", "NC2", "MC3", "MACRO"]
    
    var body: some View {
        VStack {
            Text("Add Pass to Wallet")
                .font(.largeTitle)
                .padding()

            ForEach(passNames, id: \.self) { passName in
                PassButtonView(passName: passName)
                    .frame(width: 200, height: 50)
                    .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
