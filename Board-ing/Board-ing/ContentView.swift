//
//  ContentView.swift
//  Board-ing
//
//  Created by Byeol Kim on 6/17/24.
//
import SwiftUI
import PassKit

struct ContentView: View {
    let passNames = ["PRELUDE", "MC1", "NC1", "MC2", "NC2", "MC3", "MACRO", "EPILOGUE"]
    let passBackNames = ["line1", "line2", "line3", "line4", "line5", "line6", "line7", "line8"]
    let buttonSizes: [CGSize] = [
        CGSize(width: 80, height: 80),
        CGSize(width: 80, height: 80),
        CGSize(width: 55, height: 55),
        CGSize(width: 80, height: 80),
        CGSize(width: 55, height: 55),
        CGSize(width: 80, height: 80),
        CGSize(width: 95, height: 95),
        CGSize(width: 80, height: 80)
    ]
    let buttonColors: [Color] = [
        Color(red: 1, green: 0.26, blue: 0.41),
        Color(red: 0.94, green: 0.56, blue: 0.14),
        Color(red: 1, green: 0.91, blue: 0.35),
        Color(red: 0.11, green: 0.83, blue: 0.64),
        Color(red: 0.28, green: 0.59, blue: 1),
        Color(red: 0.29, green: 0.35, blue: 0.84),
        Color(red: 0.52, green: 0.31, blue: 0.9),
        Color(red: 0.45, green: 0.45, blue: 0.45)
    ]
    let buttonCount = 8
    let radius: CGFloat = 250
    @Binding var learnerName: String
    @State private var showPassView = false
    @State private var selectedPassName: String?
    @State private var showingPassView = false

    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    
                    Color(.black)
                        .ignoresSafeArea()
                    Image("BR")
                        .resizable()
                        .frame(width: 16, height: 48)
                        .position(
                            x: geometry.size.width / 1.5 ,
                            y: geometry.size.height / 4
                        )
                    Image("BR")
                        .resizable()
                        .frame(width: 16, height: 48)
                        .position(
                            x: geometry.size.width / 1.08 ,
                            y: geometry.size.height / 1.7
                        )
                    Image("BR")
                        .resizable()
                        .frame(width: 16, height: 48)
                        .position(
                            x: geometry.size.width / 3.9 ,
                            y: geometry.size.height / 3
                        )
                    Image("BR")
                        .resizable()
                        .frame(width: 16, height: 48)
                        .position(
                            x: geometry.size.width / 1.8 ,
                            y: geometry.size.height / 2.2
                        )
                    Image("BR")
                        .resizable()
                        .frame(width: 16, height: 48)
                        .position(
                            x: geometry.size.width / 1.6 ,
                            y: geometry.size.height / 1.5
                        )
                    
                    ZStack{
                        Text(learnerName)
                            .font(Font.custom("NexaBold", size: 28)) // 폰트 적용
                            .foregroundColor(.white)
                        
                        Circle()
                            .stroke(Color(red: 0.21, green: 0.21, blue: 0.21), lineWidth: 2)
                            .frame(width: 220, height: 220)
                        
                        Circle()
                            .stroke(Color(red: 0.21, green: 0.21, blue: 0.21), lineWidth: 2)
                            .frame(width: 500, height: 500)
                        
                    }
                    .position(
                        x: geometry.size.width / 6 ,
                        y: geometry.size.height / 1.8
                    )
                    VStack {
                        HStack {
                            Text("Challenge")
                                .padding()
                                .foregroundColor(.white)
                                .font(Font.custom("NexaBold", size: 32))
                            Spacer()
                        }
                        //                        .padding(.top)
                        Spacer()
                    }
                    ForEach(0..<buttonCount, id: \.self) { i in
                        let angle = CGFloat(i) * .pi / CGFloat(buttonCount - 1)
                        let xOffset = radius * cos(angle - .pi / 2)
                        let yOffset = radius * sin(angle - .pi / 2)
                        ZStack {
                            
                            Image(passBackNames[i])
                                .resizable()
                                .frame(width: buttonSizes[i].width + 10, height: buttonSizes[i].height + 10)
                            
                            
                            Button(action: {
                                selectedPassName = passNames[i]
                                showPassView = true
                                showingPassView = true
                            }) {
                                VStack{
                                    Image(passNames[i])
                                        .resizable()
                                        .frame(width: buttonSizes[i].width, height: buttonSizes[i].height)
                                        .scaledToFit()
                                        .clipShape(Circle())
                                    Text(passNames[i])
                                        .foregroundColor(buttonColors[i])
                                        .font(Font.custom("NexaBold", size: 12))
                                        .background(Color.black.opacity(0.6))
                                }
                            }
                        }
                        .position(
                            x: geometry.size.width / 6 + xOffset,
                            y: geometry.size.height / 1.8 + yOffset
                        )
                    }

                }
                if showingPassView {
                    if let selectedPassName = selectedPassName {
                        
                        PassViewControllerWrapper(passName: selectedPassName, isActive: $showPassView, showingPassView: $showingPassView)
                    }
                }
            }
//            .fullScreenCover(isPresented: $showPassView) {
//                if let selectedPassName = selectedPassName {
//                    PassButtonView(passName: selectedPassName, isActive: $showPassView)
//                }
//            }
            
//            .navigationDestination(isPresented: $showPassView) {
//                if let selectedPassName = selectedPassName {
//                    PassButtonView(passName: selectedPassName, isActive: $showPassView)
//                }
//            }
        }
    }
}

#Preview {
    ContentView(learnerName: .constant("Bell"))
}
