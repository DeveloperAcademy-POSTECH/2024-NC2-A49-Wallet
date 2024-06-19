//
//  SplashView.swift
//  Board-ing
//
//  Created by Byeol Kim on 6/18/24.
//

import SwiftUI

struct SplashView: View {
    @Binding var learnerName: String
    
    var body: some View {
        ZStack {
            Image("Splash")
                .resizable()
                .ignoresSafeArea()
        }
    }
}

#Preview {
    SplashView(learnerName: .constant("Bell"))
}
