//
//  CollectionScreen.swift
//  Arty
//
//  Created by Cyboticx LLC on 09/07/2023.
//

import SwiftUI

struct NFTCollectionScreen: View {
    @EnvironmentObject private var viewModel: AppViewModel;
    @Environment(\.colorScheme) private var colorScheme;
    @State private var selectedTabIndex: Int = 0;
    @State private var cornerRadius: CGFloat = 0.0
    
    struct Tab: Identifiable {
        let id: UUID = .init()
        var index: Int
        var label: String
    }
    
    var isDarkMode: Bool {
        colorScheme == .dark
    }
    
    var activeTabBackgroundColor: Color {
        isDarkMode ? .white : .black
    }
    
    var activeTabTextColor: Color {
        isDarkMode ? .black : .white
    }
    
    let tabs: [Tab] = [
        .init(index: 0, label: "All NFTs"),
        .init(index: 1, label: "See History"),
        .init(index: 2, label: "Description")
    ]
    
    let columns: [GridItem] = [
        .init(.fixed((UIScreen.screenWidth - 60) / 2), spacing: 20),
        .init(.fixed((UIScreen.screenWidth - 60) / 2), spacing: 20)
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Spacer()
                HStack {
                    Button {
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                            viewModel.resetSelectedNFTCollection()
                            //                            viewModel.isCollectionViewOpen.toggle()
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
                
                HStack {
                    Text(viewModel.selectedNFTCollection?.name ?? "The Face Collection")
                        .matchedGeometryEffect(id: "title-\(viewModel.selectedNFTCollection?.key ?? "0")", in: viewModel.animation)
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
                    .matchedGeometryEffect(id: "creator-view-\(viewModel.selectedNFTCollection?.key ?? "0")", in: viewModel.animation)
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
            .padding(.bottom, 30)
            .frame(height: 250)
            .background(
                Image(viewModel.selectedNFTCollection?.image ?? "collection_background_1")
                    .resizable()
                    .scaledToFill()
                    .frame(minHeight: 0, maxHeight: .infinity)
                    .clipped()
                    .matchedGeometryEffect(id: "background-\(viewModel.selectedNFTCollection?.key ?? "0")", in: viewModel.animation)
            )
            
            VStack(spacing: 0) {
                HStack(spacing: 5) {
                    ForEach(tabs) {tab in
                        Button {
                            selectedTabIndex = tab.index
                            let impactMed = UIImpactFeedbackGenerator(style: .medium)
                            impactMed.impactOccurred()
                        } label: {
                            Text(tab.label)
                                .font(Fonts.subhead)
                                .foregroundColor(
                                    tab.index == selectedTabIndex ? activeTabTextColor : activeTabBackgroundColor
                                )
                                .frame(width: (UIScreen.screenWidth - 40 - 10) / 3, height: 44)
                                .border(isDarkMode ? .white.opacity(0.2) : .black.opacity(0.1), width: 1)
                                .background(
                                    tab.index == selectedTabIndex ? activeTabBackgroundColor : activeTabTextColor
                                )
                        }
                    }
                }
                .padding(.bottom, 20)
            }
            .padding(.top, 10)
            .padding(.horizontal, 20)
            
            VStack {
                if selectedTabIndex == 0 {
                    allNFTsTab
                } else if selectedTabIndex == 1 {
                    seeHistoryTab
                } else {
                    descriptionTab
                }
            }
            .padding(.horizontal, 20)
            
        }
        .ignoresSafeArea()
    }
    
    var allNFTsTab: some View {
        VStack(spacing: 0) {
            BidCard().frame(width: UIScreen.screenWidth - 40)
            
            Text("297 NFTs")
                .font(Fonts.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 50)
                .padding(.bottom, 10)
            
            LazyVGrid(columns: columns) {
                ForEach(viewModel.nfts) { nft in
                    NFTCard(nft: nft)
                        .padding(.bottom, 10)
                }
            }
        }
    }
    
    var seeHistoryTab: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("NFTs")
                    .font(Fonts.subhead)
                    .foregroundColor(.primary.opacity(0.8))
                    .frame(width: (UIScreen.screenWidth - 40) * 0.5, alignment: .leading)
                
                Text("Date")
                    .font(Fonts.subhead)
                    .foregroundColor(.primary.opacity(0.8))
                
                Spacer()
                
                Text("Price")
                    .font(Fonts.subhead)
                    .foregroundColor(.primary.opacity(0.8))
            }
            
            ForEach(0...10, id: \.self) { _ in
                VStack(spacing: 10) {
                    HStack(spacing: 0) {
                        HStack(spacing: 0) {
                            Image("artwork_1")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 54, height: 54)
                            
                            Text("The Man, The Power & Fury")
                                .font(Fonts.headline)
                                .padding(.horizontal, 8)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .lineLimit(2)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .frame(width: (UIScreen.screenWidth - 40) * 0.5, alignment: .leading)
                        
                        Text("15 minutes")
                            .font(Fonts.headline)
                        Spacer()
                        HStack(spacing: 4) {
                            Image(isDarkMode ? "ethereum_white" : "ethereum_black")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20)
                            
                            Text("12.05")
                                .font(Fonts.headline)
                        }
                    }
                    HStack(spacing: 5) {
                        Text("owned by".uppercased())
                            .foregroundColor(.primary.opacity(0.8))
                            .font(.custom(FontFamilies.bold, size: 13))
                        
                        Text("@0xBH74GFJNJU6RVJ8644H")
                            .foregroundColor(Color("secondary"))
                            .font(.custom(FontFamilies.bold, size: 13))
                            .lineLimit(1)
                            .frame(width: 130)
                            .truncationMode(.middle)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.vertical, 20)
                .frame(maxWidth: .infinity)
                .overlay {
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.primary.opacity(0.2))
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                }
            }
        }
    }
    
    var descriptionTab: some View {
        Text("The Face is home to art and life, made up of 77  NFTs. The collection covers all seasons from winter to summer, with each drop adding another item to your closet.We created a collection that would go beyond the fourth dimension, away from a world where fashion narratives are lead by the top fashion houses.In our dimension, there are no rules, we are not inmates imprisoned by the rules of fashion.")
            .font(Fonts.body)
    }
    
    
    
}

struct NFTCollectionScreen_Previews: PreviewProvider {
    static var previews: some View {
        
        NFTCollectionScreen()
            .environmentObject(AppViewModel())
            .preferredColorScheme(.dark)
        
        NFTCollectionScreen()
            .environmentObject(AppViewModel())
            .preferredColorScheme(.light)
        
    }
}
