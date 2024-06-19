//
//  mainView.swift
//  Board-ing
//
//  Created by Byeol Kim on 6/18/24.
//

import SwiftUI


struct mainView: View {
    
    @State private var isSplashScreenShown = true
    @AppStorage("learnerName") var learnerName: String = ""
    
    var body: some View {
        if isSplashScreenShown {
            SplashView(learnerName: $learnerName)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            isSplashScreenShown = false
                        }
                    }
                }
        } else {
            if learnerName.isEmpty {
                onBoardingView(learnerName: $learnerName)
            } else {
                ContentView(learnerName: $learnerName)
            }
        }
    }
}


//
//#Preview {
//    mainView(learnerName: $learnerName)
//}
