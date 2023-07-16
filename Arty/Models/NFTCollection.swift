//
//  Collection.swift
//  Arty
//
//  Created by Cyboticx LLC on 15/07/2023.
//

import Foundation

struct NFTCollection: Identifiable {
    let id: UUID = .init()
    var key: String
    var name: String
    var image: String
}
