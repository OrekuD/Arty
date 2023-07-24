//
//  ActivitiesView.swift
//  Arty
//
//  Created by Cyboticx LLC on 23/07/2023.
//

import SwiftUI

struct ActivitiesView: View {
    @EnvironmentObject private var viewModel: AppViewModel;
    @Binding var isActivitiesModalOpen: Bool;
    
    let columns: [GridItem] = [
        .init(.fixed((UIScreen.screenWidth - 60) / 2), spacing: 20),
        .init(.fixed((UIScreen.screenWidth - 60) / 2), spacing: 20)
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            Header(
                title: "Activities",
                onBackButtonPress: {
                    isActivitiesModalOpen.toggle()
                },
                hidePlusButton: true)
            ScrollView {
                ActivitySection(title: "Today")
                ActivitySection(title: "Yesterday")
                ActivitySection(title: "2 Days Ago")
            }
        }
    }
}

struct ActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesView(isActivitiesModalOpen: .constant(false))
            .environmentObject(AppViewModel())
            .preferredColorScheme(.dark)
    }
}
