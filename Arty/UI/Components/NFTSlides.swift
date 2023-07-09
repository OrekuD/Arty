//
//  NFTSlides.swift
//  Arty
//
//  Created by David Opoku on 09/07/2023.
//

import SwiftUI

struct NFTSlides: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(0...10, id: \.self) {item in
                    NFTCard()
                        .frame(width: UIScreen.screenWidth * 0.415 )
                }
            }
            .padding(.bottom, 12)
            .padding(.leading, 24)
            .padding(.trailing, 20)
        }
        
    }
}

struct NFTSlides_Previews: PreviewProvider {
    static var previews: some View {
        NFTSlides()
            .frame(height: 300)
    }
}
