//
//  LiveScreen.swift
//  Arty
//
//  Created by David Opoku on 09/07/2023.
//

import SwiftUI

struct LiveScreen: View {
    var body: some View {
//        ScrollView(.vertical, showsIndicators: false) {
            LiveView()
                .frame(
                    width: UIScreen.screenWidth
                )
                .frame(
                    maxHeight: UIScreen.screenHeight - Constants.tabBarHeight
                )
//        }
//        .background(.black)
    }
}

struct LiveScreen_Previews: PreviewProvider {
    static var previews: some View {
        LiveScreen()
    }
}
