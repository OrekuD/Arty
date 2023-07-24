//
//  ProfileScreen.swift
//  Arty
//
//  Created by David Opoku on 09/07/2023.
//

import SwiftUI

struct ProfileScreen: View {
    var body: some View {
        ProfileView(isCurrentUserProfile: true)
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
            .preferredColorScheme(.dark)
    }
}
