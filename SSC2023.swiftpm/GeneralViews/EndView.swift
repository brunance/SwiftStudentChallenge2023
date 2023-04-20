//
//  EndView.swift
//  SSC2023
//
//  Created by Bruno França do Prado on 19/04/23.
//

import SwiftUI

struct EndView: View {

    @State private var newView = false

    var body: some View {
        ZStack {
            Image("background1")

            VStack {
                ZStack {
                    Image("instructionsframe")

                    VStack {
                        Text("thank you for being with me during this little adventure, i hope you liked it and learned something from this grand universe of game development. until next time!")
                            .font(CustomFont().getFont(size: 30))
                            .frame(width: 800)
                    }

                }

                Button(action: { newView = true }) {
                    Image("button")
                        .resizable()
                        .frame(width: 100, height: 100)
                }
                .padding(.top, 60)
            }
            NavigationLink("", destination:  MenuView(), isActive: $newView)
        }
        .navigationBarBackButtonHidden()
    }
}
