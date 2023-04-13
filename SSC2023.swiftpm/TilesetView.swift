import SwiftUI
import SpriteKit

struct TilesetView: View {

    @State private var value = 0
    let message = "let's start with the basics, drag the blocks bellow to the respective empty spaces at the bottom of the screen."

    var scene1: SKScene {
        let scene1 = TilesetSpriteView()
        scene1.size = CGSize(width: 900, height: 800)
        scene1.scaleMode = .fill
        return scene1
    }

    var scene2: SKScene {
        let scene2 = CharacterAnimation()
        scene2.size = CGSize(width: 250, height: 250)
        scene2.scaleMode = .fill
        return scene2
    }

    var body: some View {
        VStack {
            HStack {
                SpriteView(scene: scene2)
                    .frame(width: 250, height: 250)
                    .padding(.trailing, 40)
//                Image("surprised1")
//                    .resizable()
//                    .frame(width: 250, height: 250)
//                    .padding(.trailing, 40)
                ZStack {
                    Image("textframe")
                        .resizable()
                        .frame(width: 600, height: 250)
                    TypewriterText(string: message, count: value)
                        .font(CustomFont().getFont(size: 30))
                        .frame(width: 550, height: 250, alignment: .leading)
                }
            }
            .onAppear {
                withAnimation(.linear(duration: 8)) {
                    value = message.count
                }
            }
            .padding(.bottom, 50)

            SpriteView(scene: scene1)
                .frame(width: 900, height: 800)
                .ignoresSafeArea()
                .navigationBarBackButtonHidden()

            NavigationLink(destination: MenuView()){
                Text("amo todos voces")
            }
        }
    }
}


