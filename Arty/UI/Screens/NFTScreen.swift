//
//  NFTDetailScreen.swift
//  Arty
//
//  Created by Cyboticx LLC on 09/07/2023.
//

import SwiftUI
import WrappingHStack

struct NFTScreen: View {
    var nft: NFT;
    @Binding var isSheetVisible: Bool
    @Environment(\.colorScheme) private var colorScheme;
    
    var isDarkMode: Bool {
        colorScheme == .dark
    }
    
    let details: [String] = [
        "Colors", "Illustration", "2D", "Women", "The face", "Digital art", "Ghostblade"
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(.vertical, showsIndicators: true) {
                VStack(spacing: 0) {
                    Group {
                        Image("artwork_1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.screenWidth - 40, height: UIScreen.screenWidth - 40)
                            .overlay {
                                Button {
                                    isSheetVisible.toggle()
                                } label: {
                                    Image(systemName: "xmark.circle.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 24, height: 24)
                                        .foregroundColor(.primary.opacity(0.8))
                                        .frame(width: 44, height: 44)
                                        .background(.ultraThinMaterial)
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                            }
                        
                        HStack {
                            VStack {
                                Group {
                                    Text("Inside Out a Girl")
                                        .font(Fonts.hero)
                                    
                                    Text("Exhibition on 23 May 2022")
                                        .font(Fonts.body)
                                        .foregroundColor(.primary.opacity(0.8))
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            Image(systemName: "return")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 22, height: 22)
                                .font(Fonts.hero)
                        }
                        .padding(.top, 15)
                        
                        HStack(spacing: 10) {
                            VStack(spacing: 2) {
                                Group {
                                    Text("Collection")
                                        .font(Fonts.body)
                                        .foregroundColor(.primary.opacity(0.8))
                                    
                                    Text("The Face")
                                        .font(Fonts.title3)
                                        .lineLimit(1)
                                        .truncationMode(.middle)
                                }
                                .frame(width: 120, alignment: .leading)
                            }
                            
                            VStack(spacing: 2) {
                                Group {
                                    Text("Artist")
                                        .font(Fonts.body)
                                        .foregroundColor(.primary.opacity(0.8))
                                    
                                    Text("@0xC1289832")
                                        .font(Fonts.title3)
                                        .lineLimit(1)
                                        .truncationMode(.middle)
                                }
                                .frame(width: 140, alignment: .leading)
                            }
                            Spacer()
                        }
                        .padding(.top, 20)
                        
                        Text("Activities")
                            .font(Fonts.title2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 34)
                        
                        ForEach(0...5, id: \.self) {item in
                            ActivityView(index: item)
                        }
                        
                        Text("Detail")
                            .font(Fonts.title2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 34)
                            .padding(.bottom, 12)
                        
                        
                        Text("Personal resilience develops as interpersonal safety and connection grows. Listening is the key. A boy speaks from his heart. A mother listens. A mother listens lovingly and a boy's heart opens. Who will you offer your mettle of listening to, today?")
                            .font(Fonts.body)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 20)
                        
                        WrappingHStack(alignment: .leading) {
                            ForEach(details, id: \.self) {detail in
                                Text(detail)
                                    .font(Fonts.subhead)
                                    .padding(.horizontal, 14)
                                    .frame(height: 40)
                                    .background(.primary.opacity(0.15))
                                    .cornerRadius(20)
                                    .padding(.bottom, 4)
                            }
                        }
                        
                        Group {
                            Text("More like this")
                                .font(Fonts.title2)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top, 34)
                                .padding(.bottom, 12)
                            
                            NFTSlides()
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    NFTCollectionCard(
                        nftCollection: .init(key: "9", name: "The Face Collection", image: "collection_background_2")
                    )
                    .padding(.top, 30)
                    
                }
                .padding(.top, 20)
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
                .clipped()
            }
            
            HStack {
                VStack {
                    Group {
                        Text("Price".uppercased())
                            .font(Fonts.subhead)
                            .foregroundColor(.primary.opacity(0.8))
                        
                        Text("12.08 ETH")
                            .font(Fonts.title1)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(maxWidth: .infinity)
                
                Button {
                    
                } label: {
                    Text("Place Bid")
                        .foregroundColor(isDarkMode ? .black : .white)
                        .font(Fonts.title3)
                        .frame(width: UIScreen.screenWidth * 0.4, height: 54)
                        .background(isDarkMode ? .white : .black)
                }
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 20)
            .overlay {
                Rectangle()
                    .frame(height: 1)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .foregroundColor(.primary.opacity(0.2))
            }
        }
    }
}

struct NFTDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        NFTScreen(nft: .init(name: "Test", image: "artwork_1"), isSheetVisible: .constant(false))
            .preferredColorScheme(.dark)
            .environmentObject(AppViewModel())
    }
}
