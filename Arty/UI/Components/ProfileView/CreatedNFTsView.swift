//
//  CreatedNFTsView.swift
//  Arty
//
//  Created by Cyboticx LLC on 23/07/2023.
//

import SwiftUI

struct CreatedNFTsView: View {
    @EnvironmentObject private var viewModel: AppViewModel;
    @Binding var isCreatedNFTsModalOpen: Bool
    
    let columns: [GridItem] = [
        .init(.fixed((UIScreen.screenWidth - 60) / 2), spacing: 20),
        .init(.fixed((UIScreen.screenWidth - 60) / 2), spacing: 20)
    ]

    
    var body: some View {
        VStack(spacing: 0) {
            Header(title: "Created", onBackButtonPress: ({
                isCreatedNFTsModalOpen.toggle()
            }), onPlusButtonPress: ({
                
            }))
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.nfts) { nft in
                        NFTCard(nft: nft)
                            .padding(.bottom, 10)
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct CreatedNFTsView_Previews: PreviewProvider {
    static var previews: some View {
        CreatedNFTsView(isCreatedNFTsModalOpen: .constant(false))
            .environmentObject(AppViewModel())
            .preferredColorScheme(.dark)
            .padding(.top, 2)
    }
}
