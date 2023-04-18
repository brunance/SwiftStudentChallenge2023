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
                Image("background2")

                VStack {
                    Text("Oi lindos")
                    Button(action: { newView = true }) {
                        Image("button")
                            .resizable()
                            .frame(width: 100, height: 100)
                    }
                    .padding(.top, 20)
                }
                NavigationLink("", destination:  AboutAssetView(), isActive: $newView)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    struct MenuView_Previews: PreviewProvider {
        static var previews: some View {
            MenuView()
        }
    }
}
