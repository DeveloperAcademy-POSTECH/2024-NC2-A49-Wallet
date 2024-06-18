//
//  mainView.swift
//  Board-ing
//
//  Created by Byeol Kim on 6/18/24.
//

import SwiftUI



struct mainView: View {
    
    @State private var isSplashScreenShown = true
    
    var body: some View {
        if isSplashScreenShown {
            SplashView()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            isSplashScreenShown = false
                        }
                    }
                }
        } else {
            onBoardingView()
        }
    }
}

#Preview {
    mainView()
}
