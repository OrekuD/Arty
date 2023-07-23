//
//  ActivityView.swift
//  Arty
//
//  Created by Cyboticx LLC on 23/07/2023.
//

import SwiftUI

struct ActivityView: View {
    var index: Int
    var body: some View {
        HStack(spacing: 20) {
            Image("avatar_1")
                .resizable()
                .scaledToFill()
                .frame(width: 42, height: 42)
                .clipShape(Circle())
            VStack(spacing: 2) {
                Group {
                    HStack(spacing: 5) {
                        Text("Owned by")
                            .font(Fonts.headline)
                            .lineLimit(1)
                        
                        Text("@Slade383")
                            .font(Fonts.headline)
                            .foregroundColor(Color("secondary"))
                            .lineLimit(1)
                    }
                    Text("23 May 2022 at 1:00pm")
                        .font(Fonts.subhead)
                        .foregroundColor(.primary.opacity(0.8))
                        .lineLimit(1)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity)
            
            HStack(spacing: 5) {
                Image("ethereum")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 20)
                Text("2.50")
                    .font(Fonts.title3)
                    .lineLimit(1)
            }
        }
        .padding(.vertical, 16)
        .overlay {
            if index != 0 {
                Rectangle()
                    .frame(height: 1)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .foregroundColor(.primary.opacity(0.2))
            }
            
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(index: 3)
            .padding(20)
            .preferredColorScheme(.dark)
    }
}
