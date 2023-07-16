//
//  NFTCollection.swift
//  Arty
//
//  Created by David Opoku on 09/07/2023.
//

import SwiftUI

struct NFTCollectionCard: View {
//    var title: String
    var nftCollection: NFTCollection;
    @EnvironmentObject private var viewModel: AppViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text(nftCollection.name)
                    .matchedGeometryEffect(id: "title-\(nftCollection.key)", in: viewModel.animation)
                    .font(Fonts.hero)
                    .foregroundColor(.white)
                    .lineLimit(2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                
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
                .background(
                    Color.black
                )
                .cornerRadius(29)
                .matchedGeometryEffect(id: "creator-view-\(nftCollection.key)", in: viewModel.animation)
            }
            .padding(.bottom, 24)
            .padding(.top, 12)
            .padding(.horizontal, 20)
            
            NFTSlides()
        }
        .padding(.vertical, 20)
        .background(
            Image(nftCollection.image)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .matchedGeometryEffect(id: "background-\(nftCollection.key)", in: viewModel.animation)
        )
        .frame(maxWidth: .infinity)
    }
}

struct NFTCollection_Previews: PreviewProvider {
    static var previews: some View {
        Button {
            
        } label: {
            NFTCollectionCard(nftCollection: .init(key: "0", name: "The Face Collection", image: "collection_background_1"))
                .frame(height: 400)
                .preferredColorScheme(.dark)
                .environmentObject(AppViewModel())
        }
    }
}
