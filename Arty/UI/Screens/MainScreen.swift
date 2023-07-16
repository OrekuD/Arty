//
//  MainScreen.swift
//  Arty
//
//  Created by David Opoku on 09/07/2023.
//

import SwiftUI

struct MainScreen: View {
    @State private var activeTab: Int = 0;
    @EnvironmentObject private var viewModel: AppViewModel
    
    init() {
        let transparentAppearence = UITabBarAppearance()
        transparentAppearence.configureWithTransparentBackground()
        UITabBar.appearance().standardAppearance = transparentAppearence
    }
    
    let navigationItems: [NavigationTab] = [
        .init(
            name: "Explore",
            activeIconName: "explore_active",
            inActiveIconName: "explore_inactive",
            tag: 0
        ),
        .init(
            name: "Live",
            activeIconName: "live_active",
            inActiveIconName: "live_inactive",
            tag: 1
        ),
        .init(
            name: "Stats",
            activeIconName: "stats_active",
            inActiveIconName: "stats_inactive",
            tag: 2
        ),
        .init(
            name: "Profile",
            activeIconName: "profile_active",
            inActiveIconName: "profile_inactive",
            tag: 3
        ),
    ]
    
    var tabWidth: CGFloat {
        return (UIScreen.screenWidth - 40 - 30) / 4
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                TabView(selection: $activeTab) {
                    Group {
                        HomeScreen()
                            .tag(0)
                        LiveScreen()
                            .tag(1)
                        StatsScreen()
                            .tag(2)
                        ProfileScreen()
                            .tag(3)
                    }
                    .ignoresSafeArea()
                }
                HStack(spacing: 10) {
                    ForEach(navigationItems) {navigationItem in
                        Button {
                            activeTab = navigationItem.tag
                            let impactMed = UIImpactFeedbackGenerator(style: .medium)
                            impactMed.impactOccurred()
                        } label: {
                            VStack(spacing: 5) {
                                Image(activeTab == navigationItem.tag ? navigationItem.activeIconName : navigationItem.inActiveIconName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 28, height: 28)
                                Text(navigationItem.name)
                                    .foregroundColor(.primary)
                                    .font(.custom(FontFamilies.medium, size: 12))
                            }
                            .padding(.top, 12)
                            .frame(width: tabWidth)
                        }
                    }
                }
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity)
                .overlay {
                    VStack {
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(Color("gray"))
                        Spacer()
                    }
                }
            }
            
            if viewModel.isCollectionViewOpen {
                NFTCollectionScreen()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.red)
                
            }
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
            .environmentObject(AppViewModel())
    }
}
