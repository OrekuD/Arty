//
//  NFTCard.swift
//  Arty
//
//  Created by Cyboticx LLC on 09/07/2023.
//

import SwiftUI

struct NFTCard: View {
    @Environment(\.colorScheme) private var colorScheme;
    
    var isDarkTheme: Bool {
        return colorScheme == .dark
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image("artwork_1")
                .resizable()
                .frame(maxWidth: .infinity)
                .aspectRatio(1, contentMode: .fill)
            
            Group {
                Text("@sdjd")
                    .font(Fonts.headline)
                    .foregroundColor(Color("secondary"))
                    .padding(.top, 10)
                    .padding(.bottom, 6)
                
                Text("A Geisha - Memoirs of Nothing")
                    .font(Fonts.headline)
                    .lineLimit(2)
                
                HStack {
                    Image(isDarkTheme ? "etherium_white" : "etherium_black")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18)
                    
                    Text("0.025")
                        .font(Fonts.headline)
                    
                    Spacer()
                    
                    Image("avatar_1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 28, height: 28)
                        .clipShape(Circle())
                    
                }
                .padding(.bottom, 12)
                .padding(.top, 20)
            }
            .padding(.horizontal, 10)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity)
        .background(Color("nft_card_background"))
//        .shadow(color: .primary, radius: 1, x: -2, y: 2)
        .border(.primary, width: 1)
        .overlay {
            HStack {
                Rectangle()
                    .frame(width: 4)
                    .offset(x: -4, y: 4)
                Spacer()
            }
        }
        .overlay {
            VStack {
                Spacer()
                Rectangle()
                    .frame(height: 4)
                    .offset(x: -4, y: 4)
            }
        }
    }
}

struct NFTCard_Previews: PreviewProvider {
    static var previews: some View {
        NFTCard()
            .frame(width: 200, height: 300)
            .preferredColorScheme(.dark)
        
        NFTCard()
            .frame(width: 200, height: 300)
            .preferredColorScheme(.light)
    }
}
