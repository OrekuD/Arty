//
//  ContentView.swift
//  Arty
//
//  Created by David Opoku on 08/07/2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            OnboardingScreen()
                .navigationBarBackButtonHidden()
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
