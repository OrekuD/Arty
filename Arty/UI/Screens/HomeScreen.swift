//
//  HomeScreen.swift
//  Arty
//
//  Created by David Opoku on 09/07/2023.
//

import SwiftUI

struct HomeScreen: View {
    @State private var searchText: String = "";
    @Environment(\.colorScheme) private var colorScheme;
    @EnvironmentObject private var viewModel: AppViewModel
    
    var isDarkMode: Bool {
        return colorScheme == .dark
    }
    
    
    var body: some View {
        layout
    }
    
    var layout: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 20) {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80)
                    
                    TextField("Find Arty", text: $searchText)
                        .padding(.horizontal, 16)
                        .frame(height: 44)
                        .font(Fonts.headline)
                        .background(Color("gray"))
                        .cornerRadius(22)
                }
                .padding(.bottom, 20)
                .padding(.horizontal, 20)
                .padding(.top, 64)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(0...10, id: \.self) {_ in
                            Button {
                                
                            } label: {
                                BidCard()
                                    .frame(
                                        width: UIScreen.screenWidth * 0.8
                                    )
                            }
                            
                        }
                    }
                    .padding(.horizontal, 20)
                }
                
                Text("Trending")
                    .font(Fonts.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 44)
                    .padding(.leading, 20)
                    .padding(.bottom, 12)
                
                Group {
                    NFTSlides()
                        .padding(.horizontal, 20)
                    
                    ForEach(viewModel.nftCollections) {nftCollection in
                        NFTCollectionCard(nftCollection: nftCollection)
                            .onTapGesture {
                                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                    viewModel.setSelectedNFTCollection(nftCollection: nftCollection)
                                    //                                    viewModel.isCollectionViewOpen.toggle()
                                }
                            }
                    }
                }
                .padding(.bottom, 20)
                
                
                Text("Most Artists")
                    .font(Fonts.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 20)
                    .padding(.leading, 20)
                    .padding(.bottom, 12)
                
                ForEach(0...2, id: \.self) {_ in
                    ArtistCard()
                        .padding(.horizontal, 20)
                        .padding(.bottom, 20)
                }
                
                Text("Newest")
                    .font(Fonts.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 44)
                    .padding(.leading, 20)
                    .padding(.bottom, 12)
                
                NFTSlides()
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
            .preferredColorScheme(.dark)
            .environmentObject(AppViewModel())
        
        //        HomeScreen()
        //            .preferredColorScheme(.light)
        
    }
}
