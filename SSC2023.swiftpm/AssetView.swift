import SwiftUI
import SpriteKit

struct AssetView: View {

    @State private var value = 0
    @State private var newView = false
    @State private var currentTextIndex = 0
    @State private var currentTextCount = 0

    var scene1: SKScene {
        let scene1 = AssetSpriteView()
        scene1.size = CGSize(width: 900, height: 800)
        scene1.scaleMode = .fill
        return scene1
    }

    var characterAnimation = CharacterAnimation()

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
                                let totalTime = 8.0
                                let charCount = Double(TextData.assetText[self.currentTextIndex].text.count)
                                let interval = totalTime / charCount
                                let timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
                                    if self.currentTextCount < TextData.assetText[self.currentTextIndex].text.count {
                                        self.currentTextCount += 1
                                    }
                                }
                                timer.fire()
                            }

                        HStack {
                            Button(action: {
                                self.currentTextIndex = (self.currentTextIndex + 1) % TextData.assetText.count
                                self.currentTextCount = 0
                                characterAnimation.runAnim(emotion: TextData.assetText[currentTextIndex].emotion)
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
                .padding(.bottom, 20)

                //            ZStack {
                SpriteView(scene: scene1)
                    .frame(width: 900, height: 800)
                    .ignoresSafeArea()
                    .navigationBarBackButtonHidden()
                //                Image("spriteviewframe")
                //                    .resizable()
                //                    .frame(width: 910, height: 800)
                //            }

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
        let currentText = TextData.assetText[self.currentTextIndex].text
        let endIndex = currentText.index(currentText.startIndex, offsetBy: self.currentTextCount)
        return String(currentText[..<endIndex])
    }
}

struct AssetView_Previews: PreviewProvider {
    static var previews: some View {
        AssetView()
    }
}
