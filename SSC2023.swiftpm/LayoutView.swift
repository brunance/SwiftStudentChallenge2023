import SwiftUI
import SpriteKit

struct TextData {
    var text: String
    var emotion: String

    public static var all: [TextData] = [
        .init(text: "let's start with the basics, drag the blocks bellow to the respective empty spaces at the bottom of the screen.",
              emotion: "serious"),
        .init(text: "Second Text baby!",
              emotion: "happy"),
        .init(text: "Third Text baby!",
              emotion: "surprised"),
    ]
}

struct LayoutView: View {

    @State private var value = 0
    @State private var newBehavior = false
    @State private var currentTextIndex = 0
    @State private var currentTextCount = 0

    var scene1: SKScene {
        let scene1 = LayoutSpriteView()
        scene1.size = CGSize(width: 900, height: 800)
        scene1.scaleMode = .fill
        return scene1
    }

    var characterAnimation = CharacterAnimation()

    var body: some View {
        VStack {
            HStack {
                SpriteView(scene: characterAnimation)
                    .frame(width: 250, height: 250)
                    .padding(.trailing, 40)
                ZStack {
                    Image("textframe")
                        .resizable()
                        .frame(width: 600, height: 250)
                    Text(getCurrentText())
                        .font(CustomFont().getFont(size: 30))
                        .frame(width: 550, height: 250, alignment: .leading)
                        .onAppear {
                            let totalTime = 8.0
                            let charCount = Double(TextData.all[self.currentTextIndex].text.count)
                            let interval = totalTime / charCount
                            let timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
                                if self.currentTextCount < TextData.all[self.currentTextIndex].text.count {
                                    self.currentTextCount += 1
                                }
                            }
                            timer.fire()
                        }
                    Button("Próximo") {
                        self.currentTextIndex = (self.currentTextIndex + 1) % TextData.all.count
                        self.currentTextCount = 0
                        characterAnimation.runAnim(emotion: TextData.all[currentTextIndex].emotion)
                    }
                }
            }
            .padding(.bottom, 30)

            SpriteView(scene: scene1)
                .frame(width: 900, height: 800)
                .ignoresSafeArea()
                .navigationBarBackButtonHidden()
                .padding(.bottom, 30)

            // deactivate this button until the user finishes the lesson
            Button(action: { newBehavior = true }) {
                Image(systemName: "play.fill")
                    .frame(width: 100, height: 100)
                    .background(.black)
                    .cornerRadius(30)
            }

            NavigationLink("", destination:  MenuView(), isActive: $newBehavior)
        }
    }

    func getCurrentText() -> String {
        let currentText = TextData.all[self.currentTextIndex].text
        let endIndex = currentText.index(currentText.startIndex, offsetBy: self.currentTextCount)
        return String(currentText[..<endIndex])
    }
}


