//
//  onBoardingView.swift
//  Board-ing
//
//  Created by Byeol Kim on 6/18/24.
//

import SwiftUI

struct onBoardingView: View {
    var body: some View {
        NavigationView {
            ZStack{
                Image("onboarding")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    VStack {
                        Text("아카데미 러너들의")
                        Text("챌린지 여정 관리")
                    }
                    .padding()
                    .foregroundColor(.white)
                    .font(
                        Font.custom("SF Pro", size: 28)
                            .weight(.bold)
                    )
                    .padding(.top, 50)
                    Spacer()
                    NavigationLink(destination: ContentView())
                    {
                        Text("시작하기")
                            .foregroundColor(.white)
                            .font(
                                Font.custom("SF Pro", size: 20)
                                    .weight(.bold)
                            )
                            .frame(width: 361, height: 55)
                            .background(Color(red: 0.34, green: 0.36, blue: 1))
                            .cornerRadius(12)
                    }
                }
            }
        }
    }
}

#Preview {
    onBoardingView()
}
