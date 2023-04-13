//
//  MenuView.swift
//  SSC2023
//
//  Created by Bruno França do Prado on 10/04/23.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Oi lindos")
                NavigationLink(destination: TilesetView()) {
                    Text("Hey")
                }
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
