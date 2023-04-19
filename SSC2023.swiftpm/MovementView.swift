//
//  MovementView.swift
//  SSC2023
//
//  Created by Bruno França do Prado on 17/04/23.
//

import SwiftUI
import SpriteKit

struct MovementView: View {

    @State private var newView = false
    @State private var currentTextIndex = 0
    @State private var currentTextCount = 0

    var scene: SKScene {
        let scene = MovementSpriteView()
        scene.size = CGSize(width: 900, height: 800)
        scene.scaleMode = .fill
        return scene
    }

    var characterAnimation = PlayerAnimation()

    var body: some View {
        ZStack {
            Image("background3")

            VStack {
                ZStack {
                    SpriteView(scene: characterAnimation, options: [.allowsTransparency])
                        .frame(width: 250, height: 250)
                        .padding(.trailing, 653)

                    Image("textframe")
                        .resizable()
                        .frame(width: 910, height: 250)

                    ZStack {
                        Text(getCurrentText())
                            .font(CustomFont().getFont(size: 20))
                            .onAppear {
                                let totalTime = 4.0
                                let charCount = Double(TextData.movementText[self.currentTextIndex].text.count)
                                let interval = totalTime / charCount
                                let timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
                                    if self.currentTextCount < TextData.movementText[self.currentTextIndex].text.count {
                                        self.currentTextCount += 1
                                    }
                                }
                                timer.fire()
                            }

                        HStack {
                            Button(action: {
                                self.currentTextIndex = (self.currentTextIndex + 1) % TextData.movementText.count
                                self.currentTextCount = 0
                                characterAnimation.runAnim(emotion: TextData.movementText[currentTextIndex].emotion)
                            }){
                                Image("textdone")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            }
                            .frame(width: 50, height: 50)
                        }
                        .padding(.leading, 535)
                        .padding(.top, 130)
                    }
                    .frame(width: 620, height: 200)
                    .padding(.leading, 250)
                    .padding(.top, 25)
                }
                .padding(.bottom, 20)

                SpriteView(scene: scene)
                    .frame(width: 900, height: 800)
                    .ignoresSafeArea()
                    .navigationBarBackButtonHidden()

                Button(action: { newView = true }) {
                    Image("button")
                        .resizable()
                        .frame(width: 100, height: 100)
                }
                .padding(.top, 20)

                NavigationLink("", destination:  MenuView(), isActive: $newView)
            }
        }
    }

    func getCurrentText() -> String {
        let currentText = TextData.movementText[self.currentTextIndex].text
        let endIndex = currentText.index(currentText.startIndex, offsetBy: self.currentTextCount)
        return String(currentText[..<endIndex])
    }
}
