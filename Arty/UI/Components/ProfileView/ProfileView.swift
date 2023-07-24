//
//  ProfileView.swift
//  Arty
//
//  Created by Cyboticx LLC on 23/07/2023.
//

import SwiftUI

struct MenuOption: Identifiable {
    let id = UUID()
    var label: String
    var onPress: () -> Void
}

struct ProfileView: View {
    var isCurrentUserProfile: Bool;
    @Environment(\.colorScheme) private var colorScheme;
    @State private var isMenuOpen: Bool = false;
    @State private var isCreatedNFTsModalOpen: Bool = false;
    @State private var isActivitiesModalOpen: Bool = false;
    
    var isDarkMode: Bool {
        colorScheme == .dark
    }
    
    var menuOptions: [MenuOption] {
        [
            .init(label: "Update Profile", onPress: {
                isMenuOpen.toggle()
            }),
            .init(label: "Hide Profile", onPress: {
                isMenuOpen.toggle()
            }),
            .init(label: "Logout", onPress: {
                isMenuOpen.toggle()
            })
        ]
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                VStack(spacing: 20) {
                    Image("avatar_1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 64)
                    
                    Group {
                        Text("Darrell Steward")
                            .font(Fonts.hero)
                            .foregroundColor(.white)
                        
                        Text("0x8383737373833")
                            .font(Fonts.subhead)
                            .padding(.horizontal, 15)
                            .frame(height: 38)
                            .background(.primary.opacity(isDarkMode ? 0.1 : 0.2))
                            .cornerRadius(19)
                            .foregroundColor(.white)
                        
                        Text("Hi! I'm Darrell Steward - A Digital Artist. I want to share my vision on nature, climate change.")
                            .font(Fonts.body)
                            .foregroundColor(.white.opacity(0.8))
                        
                        HStack(spacing: 0) {
                            VStack(spacing: 6) {
                                Group {
                                    Text("178 k")
                                        .font(Fonts.title2)
                                        .foregroundColor(.white)
                                    
                                    Text("Followers")
                                        .font(Fonts.subhead)
                                        .foregroundColor(.white.opacity(0.8))
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .frame(width: 110)
                            
                            VStack(spacing: 6) {
                                Group {
                                    Text("6.2 k")
                                        .font(Fonts.title2)
                                        .foregroundColor(.white)
                                    
                                    Text("Followers")
                                        .font(Fonts.subhead)
                                        .foregroundColor(.white.opacity(0.8))
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .frame(width: 110)
                            
                            VStack(spacing: 6) {
                                Group {
                                    Text("1.380")
                                        .font(Fonts.title2)
                                        .foregroundColor(.white)
                                    
                                    Text("Artworks")
                                        .font(Fonts.subhead)
                                        .foregroundColor(.white.opacity(0.8))
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .frame(width: 110)
                        }
                        .padding(.top, 20)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
                .frame(maxWidth: .infinity)
                .background(isDarkMode ? Color("card_background") : .black)
                .overlay {
                    Button {
                        isMenuOpen.toggle()
                    } label: {
                        MenuIcon()
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                    }
                    .padding(.trailing, 20)
                    .padding(.top, 64)
                }
                Spacer()
                VStack(spacing: 0) {
                    VStack {
                        HStack(spacing: 10) {
                            Text("Collections")
                                .font(Fonts.title2)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Button {
                                print("fff")
                                isCreatedNFTsModalOpen.toggle()
                            } label: {
                                Text("8")
                                    .font(Fonts.headline)
                                
                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 14, height: 14)
                                    .font(Fonts.headline)
                            }
                            .foregroundColor(Color("sky_blue"))
                        }
                        .padding(.top, 34)
                        .padding(.horizontal, 20)
                        .frame(maxWidth: .infinity)
                        
                    }
                    
                    VStack {
                        HStack(spacing: 10) {
                            Text("Created")
                                .font(Fonts.title2)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Button {
                                print("fff")
                                isCreatedNFTsModalOpen.toggle()
                            } label: {
                                Text("892")
                                    .font(Fonts.headline)
                                
                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 14, height: 14)
                                    .font(Fonts.headline)
                            }
                            .foregroundColor(Color("sky_blue"))
                        }
                        .padding(.top, 34)
                        .padding(.horizontal, 20)
                        .frame(maxWidth: .infinity)
                        
                        NFTSlides()
                    }
                    
                    VStack {
                        HStack(spacing: 10) {
                            Text("New Activities")
                                .font(Fonts.title2)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Button {
                                isActivitiesModalOpen.toggle()
                            } label: {
                                Text("See all")
                                    .font(Fonts.headline)
                                
                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 14, height: 14)
                                    .font(Fonts.headline)
                            }
                            .foregroundColor(Color("sky_blue"))
                        }
                        .padding(.top, 34)
                        .frame(maxWidth: .infinity)
                        
                        ForEach(0...5, id: \.self) {item in
                            ActivityView(index: item)
                        }
                    }
                    .padding(.horizontal, 20)
                }
            }
        }
        .ignoresSafeArea()
        .sheet(isPresented: $isMenuOpen) {
            VStack {
                ForEach(menuOptions) { option in
                    Button {
                        option.onPress()
                    } label: {
                        Text(option.label)
                            .font(Fonts.headline)
                            .foregroundColor(.primary)
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay {
                Rectangle()
                    .frame(width: 48, height: 4)
                    .foregroundColor(Color("knob"))
                    .padding(.top, 12)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
            .background(Color("card_background"))
            .presentationDetents([.height(180)])
        }
        .sheet(isPresented: $isCreatedNFTsModalOpen) {
            CreatedNFTsView(isCreatedNFTsModalOpen: $isCreatedNFTsModalOpen)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(isDarkMode ? .black : .white)
        }
        .sheet(isPresented: $isActivitiesModalOpen) {
            ActivitiesView(isActivitiesModalOpen: $isActivitiesModalOpen)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(isDarkMode ? .black : .white)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(isCurrentUserProfile: true)
            .preferredColorScheme(.dark)
            .environmentObject(AppViewModel())
        
        ProfileView(isCurrentUserProfile: true)
            .preferredColorScheme(.light)
            .environmentObject(AppViewModel())
    }
}
