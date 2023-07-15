//
//  CollectionScreen.swift
//  Arty
//
//  Created by Cyboticx LLC on 09/07/2023.
//

import SwiftUI

struct CollectionScreen: View {
    var body: some View {
        VStack {
            NFTCollection(title: "The Face Collection")
                .frame(height: 400)
            Spacer()
        }
        .padding(.top, 56)
        .ignoresSafeArea()
    }
}

struct CollectionScreen_Previews: PreviewProvider {
    static var previews: some View {
        CollectionScreen()
    }
}
