//
//  Header.swift
//  Arty
//
//  Created by Cyboticx LLC on 23/07/2023.
//

import SwiftUI

struct Header: View {
    var title: String;
    var onBackButtonPress: () -> Void;
    var hidePlusButton: Bool?
    var onPlusButtonPress: (() -> Void)?;
    
    var body: some View {
        HStack {
            Text(title)
                .font(Fonts.headline)
        }
        .padding(.vertical, 24)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .overlay {
            HStack {
                Button {
                    onBackButtonPress()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18)
                }
                Spacer()
                if hidePlusButton == nil {
                    Button {
                        if let onPlusButtonPress {
                            onPlusButtonPress()
                        }
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 18)
                    }
                }
            }
            .font(Fonts.headline)
            .foregroundColor(.primary)
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity)
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header(
            title: "Created",
            onBackButtonPress: {
                
            },
            hidePlusButton: true
        )
        .preferredColorScheme(.dark)
    }
}
