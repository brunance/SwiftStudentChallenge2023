//
//  InstructionsView.swift
//  SSC2023
//
//  Created by Bruno França do Prado on 15/04/23.
//

import SwiftUI

struct InstructionsView: View {
    
    @State private var newView = false

    var body: some View {
        ZStack {
            Image("background1")

            VStack {
                ZStack {

                    Image("instructionsframe")
                    VStack {
                        Text("Hey there! my name is bruno and i'm here to talk about my passion for game development. in this little journey you will know more about sprites, some game mechanics and how a character is created. In each step, my little avatar will explain what will need to be done - just press the little back arrow next to the explanation to hear the rest of my speech.")
                            .font(CustomFont().getFont(size: 30))
                            .frame(width: 800)
                            .padding(.bottom, 20)

                        Text("i really hope you enjoy the experience! Press the button below to start.")
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
            NavigationLink("", destination:  AboutStepOne(), isActive: $newView)
        }
        .navigationBarBackButtonHidden()
    }
}
