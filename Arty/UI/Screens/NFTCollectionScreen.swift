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
        .init(.fixed((UIScreen.screenWidth - 60) / 2), spacing: 10),
        .init(.fixed((UIScreen.screenWidth - 60) / 2), spacing: 10)
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
                            withAnimation {
                                selectedTabIndex = tab.index
                            }
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
                
                BidCard().frame(width: UIScreen.screenWidth - 40)
                
                Text("297 NFTs")
                    .font(Fonts.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 50)
                    .padding(.bottom, 10)
                
                LazyVGrid(columns: columns) {
                    ForEach(0...10, id: \.self) { tab in
                        NFTCard()
                            .padding(.bottom, 10)
                    }
                }
                
            }
            .padding(.top, 10)
            .padding(.horizontal, 20)
            
        }
        .ignoresSafeArea()
    }
}

struct NFTCollectionScreen_Previews: PreviewProvider {
    static var previews: some View {
        NFTCollectionScreen()
            .environmentObject(AppViewModel())
            .preferredColorScheme(.light)
        
        NFTCollectionScreen()
            .environmentObject(AppViewModel())
            .preferredColorScheme(.dark)
    }
}
