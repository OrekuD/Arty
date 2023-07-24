//
//  ActivitySection.swift
//  Arty
//
//  Created by Cyboticx LLC on 23/07/2023.
//

import SwiftUI

struct ActivitySection: View {
    var title: String;
    var body: some View {
        VStack(spacing: 10) {
            Text(title)
                .font(Fonts.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ForEach(0...Int.random(in: 1..<5), id: \.self) {item in
                ActivityView(index: item)
            }
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 40)
    }
}

struct ActivitySection_Previews: PreviewProvider {
    static var previews: some View {
        ActivitySection(title: "Today")
            .preferredColorScheme(.dark)
    }
}
