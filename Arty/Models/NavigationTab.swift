//
//  NavigationTab.swift
//  Arty
//
//  Created by Cyboticx LLC on 09/07/2023.
//

import Foundation

struct NavigationTab: Identifiable {
    let id: UUID = .init()
    var name: String;
    var activeIconName: String;
    var inActiveIconName: String;
    var tag: Int;
}
