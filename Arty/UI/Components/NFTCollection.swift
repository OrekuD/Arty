//
//  NFTCollection.swift
//  Arty
//
//  Created by Cyboticx LLC on 09/07/2023.
//

import SwiftUI

struct NFTCollection: View {
    var title: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text(title)
                    .font(Fonts.largeTitle)
                    .foregroundColor(.white)
                    .lineLimit(2)
                
                Spacer()
                
                HStack(spacing: 14) {
                    Image("avatar_1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading) {
                        Text("Created by")
                            .foregroundColor(.white.opacity(0.8))
                            .font(Fonts.caption2)
                        
                            Text("@0xD18656566756565543224")
                                .foregroundColor(.white)
                                .font(.custom(FontFamilies.bold, size: 11))
                                .lineLimit(1)
                                .truncationMode(.middle)
                    }
                    .padding(.trailing, 10)
                }
                .padding(.horizontal, 10)
                .frame(width: 160, height: 58)
                .background(.black)
                .cornerRadius(29)
            }
            .padding(.bottom, 24)
            .padding(.top, 12)
            .padding(.horizontal, 20)
            
            NFTSlides()
        }
        .padding(.vertical, 20)
        .background(
            Image(Bool.random() ? "collection_background_1" : "collection_background_2")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        )
        .frame(maxWidth: .infinity)
    }
}

struct NFTCollection_Previews: PreviewProvider {
    static var previews: some View {
        NFTCollection(title: "The Face Collection")
            .frame(height: 400)
            .preferredColorScheme(.dark)
    }
}
