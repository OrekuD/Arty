//
//  NFT.swift
//  Arty
//
//  Created by Cyboticx LLC on 21/07/2023.
//

import Foundation

struct NFT: Identifiable {
    let id: UUID = .init()
    var name: String
    var image: String
}
