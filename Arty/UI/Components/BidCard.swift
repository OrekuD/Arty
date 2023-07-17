//
//  BidCard.swift
//  Arty
//
//  Created by Cyboticx LLC on 09/07/2023.
//

import SwiftUI

struct BidCard: View {
    var body: some View {
        VStack {
            ZStack {
                Image("artwork_1")
                    .resizable()
                    .scaledToFill()
                
                LinearGradient(
                    gradient:
                        Gradient(
                            colors:
                                [Color(red: 0, green: 0, blue: 0, opacity: 0),
                                 Color("gradient"),
                                 Color("gradient")
                                ]
                        ), startPoint: .top, endPoint: .bottom)
                
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
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                        
                        HStack(spacing: 34) {
                            VStack(alignment: .leading, spacing: 6) {
                                Text("Current Bid")
                                    .foregroundColor(.white)
                                    .font(Fonts.body)
                                
                                HStack(spacing: 2) {
                                    Image("ethereum_black")
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
            }
        }
        .aspectRatio(1 / 1, contentMode: .fit)
    }
}

struct BidCard_Previews: PreviewProvider {
    static var previews: some View {
        BidCard()
            .preferredColorScheme(.light)
        
        BidCard()
            .preferredColorScheme(.dark)
    }
}
