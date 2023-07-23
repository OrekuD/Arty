//
//  PlaceBidView.swift
//  Arty
//
//  Created by Cyboticx LLC on 21/07/2023.
//

import SwiftUI

struct PlaceBidView: View {
    @Binding var isSheetVisible: Bool;
    @Environment(\.colorScheme) var colorScheme;
    @State private var bid: String = "";
    
    let maxLength = 8
    
    var isDarkMode: Bool {
        colorScheme == .dark
    }
    
    var buttonSize: CGFloat {
        (UIScreen.screenWidth - 160) / 3
    }
    
    var columns: [GridItem] = [
        .init(.fixed((UIScreen.screenWidth - 160) / 3), spacing: 15),
        .init(.fixed((UIScreen.screenWidth - 160) / 3), spacing: 15),
        .init(.fixed((UIScreen.screenWidth - 160) / 3), spacing: 15)
    ]
    
    func vibrate() {
        let impactMed = UIImpactFeedbackGenerator(style: .medium)
        impactMed.impactOccurred()
    }
    
    func selectNumber(value: Int) {
        if (bid.count == maxLength) {
            return
        }
        bid = "\(bid)\(value)"
        vibrate()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Button {
                isSheetVisible.toggle()
            } label: {
                Image(systemName: "xmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.primary)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            
            Text("Place a Bid")
                .font(Fonts.hero)
                .padding(.top, 10)
                .padding(.bottom, 4)
            
            HStack(spacing: 6) {
                Text("You must bit at least")
                    .font(Fonts.subhead)
                    .foregroundColor(.primary.opacity(0.8))
                
                Image(isDarkMode ? "ethereum_white" : "ethereum_black")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 16)
                
                Text("1.056")
                    .font(Fonts.subhead)
            }
            .padding(.bottom, 25)
            
            Text(bid.isEmpty ? "0.00" : bid)
                .font(Fonts.hero)
                .foregroundColor(bid.isEmpty ? .primary.opacity(0.3) : .primary)
                .padding(.vertical, 16)
                .frame(width: (UIScreen.screenWidth - 40) - 60)
                .background(.primary.opacity(0.15))
                .padding(.bottom, 25)
            
            Button {
                
            } label: {
                Text("Place Bid")
                    .foregroundColor(isDarkMode ? .black : .white)
                    .font(Fonts.title3)
                    .frame(height: 54)
                    .frame(maxWidth: .infinity)
                    .background(isDarkMode ? .white : .black)
            }
            
            Text("Once a bid is placed, it cannot be withdrawn.")
                .font(Fonts.caption1)
                .padding(.top, 8)
            
            Spacer()
            
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(1...9, id: \.self) {number in
                    Button {
                        selectNumber(value: number)
                    } label: {
                        Text("\(number)")
                            .font(Fonts.hero)
                            .frame(width: buttonSize, height: buttonSize)
                            .background(.primary.opacity(0.2))
                            .clipShape(Circle())
                            .foregroundColor(.primary)
                    }
                }
                Group {
                    Button {
                        vibrate()
                        if (bid.count == maxLength) {
                            return
                        }
                        bid = "\(bid)."
                    } label: {
                        Text(".")
                            .font(Fonts.hero)
                            .frame(width: buttonSize, height: buttonSize)
                            .background(.primary.opacity(0.2))
                            .clipShape(Circle())
                            .foregroundColor(.primary)
                    }
                    Button {
                        vibrate()
                        selectNumber(value: 0)
                    } label: {
                        Text("0")
                            .font(Fonts.hero)
                            .frame(width: buttonSize, height: buttonSize)
                            .background(.primary.opacity(0.2))
                            .clipShape(Circle())
                            .foregroundColor(.primary)
                    }
                    Button {
                        vibrate()
                        bid.popLast()
                    } label: {
                        Image(systemName: "delete.backward")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 32)
                            .font(Fonts.hero)
                            .frame(width: buttonSize, height: buttonSize)
                            .background(.primary.opacity(0.2))
                            .clipShape(Circle())
                            .foregroundColor(.primary)
                    }
                }
            }
            
        }
        .padding(20)
    }
}

struct PlaceBidView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceBidView(isSheetVisible: .constant(false))
            .preferredColorScheme(.dark)
    }
}
