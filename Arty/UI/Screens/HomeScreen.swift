//
//  HomeScreen.swift
//  Arty
//
//  Created by Cyboticx LLC on 09/07/2023.
//

import SwiftUI

struct HomeScreen: View {
    @State private var searchText: String = "";
    @Environment(\.colorScheme) private var colorScheme;
    
    var isDarkMode: Bool {
        return colorScheme == .dark
    }
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 20) {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80)
                    
                    TextField("Find Arty", text: $searchText)
                        .padding(.horizontal, 16)
                        .frame(height: 44)
                        .font(Fonts.headline)
                        .background(Color("gray"))
                        .cornerRadius(22)
                }
                .padding(.bottom, 20)
                .padding(.horizontal, 20)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(0...10, id: \.self) {item in
                            VStack {
                                Image("artwork_1")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: UIScreen.screenWidth * 0.75)
                                Spacer()
                            }
                            .frame(
                                width: UIScreen.screenWidth * 0.75,
                                height: UIScreen.screenWidth * 0.75 * 1.266
                            )
                            .overlay {
                                VStack {
                                    
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(
                                    LinearGradient(
                                        gradient:
                                            Gradient(
                                                colors:
                                                    [Color(red: 0, green: 0, blue: 0, opacity: 0),
                                                     Color("gradient"),
                                                     Color("gradient")
                                                    ]
                                            ), startPoint: .top, endPoint: .bottom)
                                )
                            }
                            .overlay {
                                VStack {
                                    Spacer()
                                    Group {
                                        Text("Created by @name_test")
                                            .font(Fonts.headline)
                                            .padding(.bottom, 1)
                                            .foregroundColor(Color("secondary"))
                                        
                                        Text("A Geisha - Memoirs of Nothing")
                                            .font(Fonts.title1)
                                            .foregroundColor(.white)
                                        
                                        HStack(spacing: 34) {
                                            VStack(alignment: .leading, spacing: 6) {
                                                Text("Current Bid")
                                                    .foregroundColor(.white)
                                                    .font(Fonts.body)
                                                
                                                HStack(spacing: 2) {
                                                    Image("etherium_black")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(width: 20, height: 20)
                                                    Text("2.00")
                                                        .font(Fonts.title2)
                                                        .foregroundColor(.black)
                                                }
                                                .padding(.horizontal, 12)
                                                .frame(height: 44)
                                                .background(.white)
                                                .cornerRadius(22)
                                            }
                                            
                                            VStack(alignment: .leading, spacing: 6) {
                                                Text("Ends in")
                                                    .foregroundColor(.white)
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
                                                    }
                                                    .font(Fonts.title2)
                                                }
                                                .frame(height: 44)
                                            }
                                        }
                                        .padding(.top, 6)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .padding(.horizontal, 20)
                                .padding(.bottom, 20)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                }
                
                Text("Trending")
                    .font(Fonts.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 44)
                    .padding(.leading, 20)
                    .padding(.bottom, 12)
                
                NFTSlides()
                
                Spacer()
                
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
            .preferredColorScheme(.dark)
        
        HomeScreen()
            .preferredColorScheme(.light)
        
    }
}
