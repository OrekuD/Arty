//
//  ArtistCard.swift
//  Arty
//
//  Created by Cyboticx LLC on 09/07/2023.
//

import SwiftUI

struct ArtistCard: View {
    @Environment(\.colorScheme) private var colorScheme;
    
    var isDarkMode: Bool {
        return colorScheme == .dark
    }
    
    var imageWidth: CGFloat {
        return (UIScreen.screenWidth - 40 - 40 - 30) / 4
    }
    
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image("avatar_1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text("Marvin McKinney")
                        .font(Fonts.headline)
                        .lineLimit(1)
                    
                        Text("@0x8272B823837367")
                            .font(Fonts.headline)
                            .lineLimit(1)
                            .truncationMode(.middle)
                            .foregroundColor(Color("secondary"))
                            .padding(.trailing, 20)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Follow")
                        .foregroundColor(isDarkMode ? .black : .white)
                        .font(Fonts.headline)
                        .frame(width: 100, height: 44)
                        .background(isDarkMode ? .white : .black)
                }
            }
            .padding(.bottom, 16)
            
            HStack(spacing: 10) {
                ForEach(0...3, id: \.self) {item in
                    Image("artwork_1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: imageWidth, height: imageWidth)
                }
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
        .frame(maxWidth: .infinity)
        .background(Color("card_background"))
        .border(.primary, width: 2)
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

struct ArtistCard_Previews: PreviewProvider {
    static var previews: some View {
        ArtistCard()
            .padding(20)
    }
}
