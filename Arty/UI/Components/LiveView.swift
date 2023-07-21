//
//  LiveView.swift
//  Arty
//
//  Created by Cyboticx LLC on 20/07/2023.
//

import SwiftUI

struct LiveView: View {
    @State var isSheetVisible: Bool = false;
    @Environment(\.colorScheme) private var colorScheme;
    
    var isDarkMode: Bool {
        colorScheme == .dark
    }
    
    let colors: [Color] = [
        Color(red: 0, green: 0, blue: 0, opacity: 1),
        Color(red: 0, green: 0, blue: 0, opacity: 0),
        Color(red: 0, green: 0, blue: 0, opacity: 0),
        Color(red: 0, green: 0, blue: 0, opacity: 0.5),
        Color(red: 0, green: 0, blue: 0, opacity: 1)
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Group {
                    Image("live_1")
                        .resizable()
                        .scaledToFill()
                    
                    LinearGradient(colors: colors, startPoint: .top, endPoint: .bottom)
                    
                    VStack(spacing: 0) {
                        header
                        Spacer()
                        footer
                        Rectangle()
                            .frame(height: 20)
                            .foregroundColor(.black)
                    }
                    .padding(.top, 64)
                    .frame(height: UIScreen.screenHeight - Constants.tabBarHeight - 30)
                }
                .frame(width: UIScreen.screenWidth)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .ignoresSafeArea()
        .sheet(isPresented: $isSheetVisible) {
            PlaceBidView(isSheetVisible: $isSheetVisible)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(isDarkMode ? .black : .white)
        }
    }
    
    var header: some View {
        HStack {
            VStack(spacing: 10) {
                Group {
                    Text("Created by @ocjhhjyu6")
                        .font(Fonts.subhead)
                        .foregroundColor(Color("secondary"))
                    
                    Text("Think of War")
                        .font(Fonts.hero)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            Spacer()
            
            Button {

            } label: {
                MenuIcon()
            }
            .frame(height: 30)
                    
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
    }
    
    var footer: some View {
        HStack {
            VStack(spacing: 10) {
                Group {
                    Text("Ends in")
                        .foregroundColor(.white.opacity(0.8))
                        .font(Fonts.body)
                    
                    HStack(spacing: 0) {
                        Group {
                            Text("17")
                                .foregroundColor(.white)
                            Text("h")
                                .foregroundColor(.white.opacity(0.8))
                                .padding(.trailing, 8)
                            
                            Text("21")
                                .foregroundColor(.white)
                            Text("m")
                                .foregroundColor(.white.opacity(0.8))
                                .padding(.trailing, 8)
                            
                            Text("49")
                                .foregroundColor(.white)
                            Text("s")
                                .foregroundColor(.white.opacity(0.8))
                        }
                        .font(Fonts.title2)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            Button {
                isSheetVisible.toggle()
            } label: {
                Text("Bid Now")
                    .font(Fonts.title3)
                    .foregroundColor(.black)
                    .padding(.horizontal, 15)
                    .frame(maxHeight: 60)
                    .background(.white)
            }
        }
        .padding(.horizontal, 20)
        .frame(width: UIScreen.screenWidth)
    }
}

struct LiveView_Previews: PreviewProvider {
    static var previews: some View {
        LiveView()
            .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight - Constants.tabBarHeight)
    }
}
