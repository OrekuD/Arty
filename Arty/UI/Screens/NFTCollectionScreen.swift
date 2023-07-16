//
//  CollectionScreen.swift
//  Arty
//
//  Created by Cyboticx LLC on 09/07/2023.
//

import SwiftUI

struct NFTCollectionScreen: View {
    @EnvironmentObject private var viewModel: AppViewModel;
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Button {
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                            viewModel.isCollectionViewOpen.toggle()
                        }
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 32)
                            .foregroundColor(.white.opacity(0.3))
                    }
                    Spacer()
                }
                .padding(.top, 32)
                
                HStack {
                    Text("The Face Collection")
                        .matchedGeometryEffect(id: "title-0", in: viewModel.animation)
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
                    .matchedGeometryEffect(id: "creator-view-0", in: viewModel.animation)
                }
                .padding(.top, 12)
                
                HStack(spacing: 20) {
                    VStack(alignment: .leading) {
                        Text("50")
                            .font(Fonts.title2)
                            .foregroundColor(.white)
                        
                        Text("NFTs")
                            .font(Fonts.title3)
                            .foregroundColor(.white.opacity(0.7))
                    }
                    VStack(alignment: .leading) {
                        Text("13")
                            .font(Fonts.title2)
                            .foregroundColor(.white)
                        
                        Text("Owners")
                            .font(Fonts.title3)
                            .foregroundColor(.white.opacity(0.7))
                    }
                    VStack(alignment: .leading) {
                        Text("12.80 ETH")
                            .font(Fonts.title2)
                            .foregroundColor(.white)
                        
                        Text("Total Sale")
                            .font(Fonts.title3)
                            .foregroundColor(.white.opacity(0.7))
                    }
                    Spacer()
                }
                .padding(.top, 12)
            }
            .padding(.horizontal, 20)
            .frame(height: 300)
            //            .background(.blue)
            .background(
                Image("collection_background_1")
                    .resizable()
                    .scaledToFill()
                    .frame(minHeight: 0, maxHeight: .infinity)
                    .clipped()
                    .matchedGeometryEffect(id: "background-0", in: viewModel.animation)
            )
            
            Spacer()
        }
        .background(.red)
        .ignoresSafeArea()
    }
}

struct NFTCollectionScreen_Previews: PreviewProvider {
    static var previews: some View {
        NFTCollectionScreen()
            .environmentObject(AppViewModel())
    }
}
