//
//  DestinationView.swift
//  Board-ing
//
//  Created by Byeol Kim on 6/18/24.
//

import SwiftUI

struct DestinationView: View {
    let passName: String
    
    var body: some View {
        Text("Destination View for \(passName)")
            .font(.largeTitle)
            .padding()
    }
}
    

//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
#Preview {
    DestinationView(passName: "MC1")
}
