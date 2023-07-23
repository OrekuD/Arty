//
//  NFTSlides.swift
//  Arty
//
//  Created by David Opoku on 09/07/2023.
//

import SwiftUI

struct NFTSlides: View {
    @EnvironmentObject private var viewModel: AppViewModel;
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(viewModel.nfts) {nft in
                    NFTCard(nft: nft)
                        .frame(width: UIScreen.screenWidth * 0.415 )
                }
            }
            .padding(.bottom, 12)
//            .padding(.leading, 24)
//            .padding(.trailing, 20)
        }
        
    }
}

struct NFTSlides_Previews: PreviewProvider {
    static var previews: some View {
        NFTSlides()
            .frame(height: 300)
            .environmentObject(AppViewModel())
            .preferredColorScheme(.dark)
    }
}
