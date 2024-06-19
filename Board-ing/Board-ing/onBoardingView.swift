//
//  onBoardingView.swift
//  Board-ing
//
//  Created by Byeol Kim on 6/18/24.
//

import SwiftUI

struct onBoardingView: View {
    
    @Binding var learnerName: String
    
    var body: some View {
        NavigationStack {
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
                    .font(.system(size: 28, weight: .bold))
                    .padding(.top, 50)
                    Spacer()
                    Text("닉네임을 입력해주세요🚀")
                    TextField("닉네임 입력", text: $learnerName)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .frame(width: 187, height: 48)
                        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                        .cornerRadius(19)
                        .padding()
                    NavigationLink(destination: ContentView(learnerName: $learnerName)) {
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
    onBoardingView(learnerName: .constant("Bell"))
}
