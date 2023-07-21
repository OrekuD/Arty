//
//  MenuIcon.swift
//  Arty
//
//  Created by Cyboticx LLC on 20/07/2023.
//

import SwiftUI

struct MenuIcon: View {
    var body: some View {
        HStack(spacing: 4) {
            Rectangle()
                .frame(width: 8, height: 8)
                .foregroundColor(.clear)
                .border(.white, width: 2)
            Rectangle()
                .frame(width: 8, height: 8)
                .foregroundColor(.clear)
                .border(.white, width: 2)
            Rectangle()
                .frame(width: 8, height: 8)
                .foregroundColor(.clear)
                .border(.white, width: 2)
        }
    }
}

struct MenuIcon_Previews: PreviewProvider {
    static var previews: some View {
        MenuIcon()
            .padding(100)
            .background(.red)
    }
}
