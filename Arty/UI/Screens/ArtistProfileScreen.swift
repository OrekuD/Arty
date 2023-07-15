//
//  ArtistProfileScreen.swift
//  Arty
//
//  Created by Cyboticx LLC on 09/07/2023.
//

import SwiftUI

struct ArtistProfileScreen: View {
    @EnvironmentObject private var appViewModel: AppViewModel
    
    var body: some View {
        Text("Marvin McKinney")
            .matchedGeometryEffect(id: "name", in: appViewModel.animation)
            .foregroundColor(.primary)
            .font(Fonts.headline)
    }
}

struct ArtistProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ArtistProfileScreen()
            .environmentObject(AppViewModel())
    }
}
