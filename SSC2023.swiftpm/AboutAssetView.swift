//
//  InstructionsLayout.swift
//  SSC2023
//
//  Created by Bruno França do Prado on 13/04/23.
//

import SwiftUI
import SpriteKit

struct AboutAssetView: View {

    @State private var currentTextIndex = 0
    @State private var currentTextCount = 0
    @State private var newView = false
    
    var characterAnimation = PlayerAnimation()
    
    var body: some View {
        ZStack {
            Image("background1")

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
                                let totalTime = 5.0
                                let charCount = Double(TextData.aboutAssetText[self.currentTextIndex].text.count)
                                let interval = totalTime / charCount
                                let timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
                                    if self.currentTextCount < TextData.aboutAssetText[self.currentTextIndex].text.count {
                                        self.currentTextCount += 1
                                    }
                                }
                                timer.fire()
                            }

                        HStack {
                            Button(action: {
                                self.currentTextIndex = (self.currentTextIndex + 1) % TextData.aboutAssetText.count
                                self.currentTextCount = 0
                                characterAnimation.runAnim(emotion: TextData.aboutAssetText[currentTextIndex].emotion)
                            }){
                                Image("textdone")
                                    .resizable()
                                    .frame(width: 25, height: 25)
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

                Button(action: { newView = true }) {
                    Image("button")
                        .resizable()
                        .frame(width: 100, height: 100)
                }
                .padding(.top, 50)
                .navigationBarBackButtonHidden()

                NavigationLink("", destination:  AssetView(), isActive: $newView)
            }
        }
    }

    func getCurrentText() -> String {
        let currentText = TextData.aboutAssetText[self.currentTextIndex].text
        let endIndex = currentText.index(currentText.startIndex, offsetBy: self.currentTextCount)
        return String(currentText[..<endIndex])
    }
}
