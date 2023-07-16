//
//  AppViewModel.swift
//  Arty
//
//  Created by Cyboticx LLC on 09/07/2023.
//

import Foundation
import SwiftUI

class AppViewModel: ObservableObject {
    @Published var animation: Namespace.ID = Namespace().wrappedValue
    @Published var isCollectionViewOpen: Bool = false;
    @Published var nftCollections: [NFTCollection] = []
    
    init() {
        self.nftCollections = [
            .init(key: "0", name: "The Face Collection", image: "collection_background_1"),
            .init(key: "1", name: "3D Art Collection", image: "collection_background_2")
        ]
    }
}
