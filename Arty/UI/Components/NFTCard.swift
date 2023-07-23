//
//  NFTCard.swift
//  Arty
//
//  Created by David Opoku on 09/07/2023.
//

import SwiftUI

struct NFTCard: View {
    var nft: NFT
    @Environment(\.colorScheme) private var colorScheme;
    @State private var isSheetVisible: Bool = false;
    
    var isDarkTheme: Bool {
        return colorScheme == .dark
    }
    
    var body: some View {
        Button {
            isSheetVisible.toggle()
        } label: {
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
                        .lineLimit(1)
                    
                    Text("A Geisha - Memoirs of Nothing")
                        .font(Fonts.headline)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.primary)
                    
                    HStack {
                        Image(isDarkTheme ? "ethereum_white" : "ethereum_black")
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
                .padding(.horizontal, 14)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity)
            .background(Color("card_background"))
            .border(.primary, width: 2)
            .overlay {
                HStack {
                    Rectangle()
                        .frame(width: 4)
                        .offset(x: -4, y: 4)
                        .foregroundColor(.primary)
                    Spacer()
                }
            }
            .overlay {
                VStack {
                    Spacer()
                    Rectangle()
                        .frame(height: 4)
                        .offset(x: -4, y: 4)
                        .foregroundColor(.primary)
                }
            }
            .foregroundColor(.primary)
        }
        .sheet(isPresented: $isSheetVisible) {
            NFTScreen(nft: .init(name: "Test", image: "artwork_1"), isSheetVisible: $isSheetVisible)
        }
    }
}

struct NFTCard_Previews: PreviewProvider {
    static var previews: some View {
        NFTCard(nft: .init(name: "Test", image: "artwork_1"))
            .frame(width: 200, height: 300)
            .preferredColorScheme(.dark)
        
        NFTCard(nft: .init(name: "Test", image: "artwork_1"))
            .frame(width: 200, height: 300)
            .preferredColorScheme(.light)
    }
}
