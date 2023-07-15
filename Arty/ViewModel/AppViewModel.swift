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
}
