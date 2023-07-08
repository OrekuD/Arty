//
//  OnboardingScreen.swift
//  Arty
//
//  Created by David Opoku on 08/07/2023.
//

import SwiftUI

struct OnboardingScreen: View {
    @Environment(\.colorScheme) private var colorScheme: ColorScheme;
    
    private var isDarkTheme: Bool {
        return colorScheme == .dark
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .top, spacing: 0) {
                VStack(alignment: .trailing, spacing: 10) {
                    Image("onboarding_slide_1")
                        .resizable()
                        .frame(
                            width: UIScreen.screenWidth * 0.5 - 5,
                            height: (UIScreen.screenWidth * 0.5 - 5) * 1.5
                        )
                        .scaledToFill()
                    
                    Image("onboarding_slide_3")
                        .resizable()
                        .frame(
                            width: UIScreen.screenWidth * 0.3,
                            height: UIScreen.screenWidth * 0.3
                        )
                        .scaledToFill()
                }
                .frame(width: UIScreen.screenWidth * 0.5 - 5)
                
                Spacer()
                VStack(alignment: .leading, spacing: 10) {
                    Image("onboarding_slide_2")
                        .resizable()
                        .frame(
                            width: UIScreen.screenWidth * 0.5 - 5,
                            height: UIScreen.screenWidth * 0.5 - 5 + 10
                        )
                        .scaledToFill()
                    Image("onboarding_slide_4")
                        .resizable()
                        .frame(
                            width: UIScreen.screenWidth * 0.35,
                            height: (
                                ((UIScreen.screenWidth * 0.5 - 5) * 1.5 + 10 + UIScreen.screenWidth * 0.3) - UIScreen.screenWidth * 0.5 - 5 - 10
                            )
                        )
                        .scaledToFill()
                }
                .frame(width: UIScreen.screenWidth * 0.5 - 5)
            }
            
            Spacer()
            
            Group {
                Text("Playground of artists & collectors")
                    .font(Fonts.largeTitle)
                
                Text("Arty is the playground of creativity. You can buy or sell your artwork using the NFT")
                    .font(Fonts.callout)
                    .padding(.bottom, 46)
                
                Text("Go to Arty")
                    .foregroundColor(isDarkTheme ? .black : .white)
                    .font(Fonts.subhead)
                    .frame(height: 54)
                    .frame(maxWidth: .infinity)
                    .background(isDarkTheme ? .white : .black)
                
            }
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .padding(.bottom, 40)
        .ignoresSafeArea()
    }
}

struct OnboardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreen()
            .preferredColorScheme(.light)
        
        OnboardingScreen()
            .preferredColorScheme(.dark)
    }
}
