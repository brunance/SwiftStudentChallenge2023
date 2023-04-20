//
//  MenuView.swift
//  SSC2023
//
//  Created by Bruno França do Prado on 10/04/23.
//

import SwiftUI

struct MenuView: View {

    @State private var newView = false

    var body: some View {
        NavigationView {

            ZStack {
                Image("background-menu")

                VStack {
                    Image("logo")
                        .resizable()
                        .frame(width: 1024, height: 924)

                    Button(action: { newView = true }) {
                        Image("menu-button")
                            .resizable()
                            .frame(width: 256, height: 128)
                    }
                }
                .padding(.bottom, 310)
                NavigationLink("", destination:  InstructionsView(), isActive: $newView)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden()
    }
}
