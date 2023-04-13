import SwiftUI
import SpriteKit

struct ContentView: View {

    var scene: SKScene {
        let scene = GravityScene()
        scene.size = CGSize(width: 900, height: 900)
        scene.scaleMode = .fill
        return scene
    }

    var body: some View {
        VStack {
            HStack {
                Image("surprised1")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .padding(.trailing, 40)
                Text("amoooo")
                    .font(getFont(size: 30))
                    .frame(width: 600, height: 250)
                    .background(.cyan)
            }
            .padding(.bottom, 50)

            SpriteView(scene: scene)
                .frame(width: 900, height: 900, alignment: .bottom)
                .ignoresSafeArea()
                .navigationBarBackButtonHidden()
        } 
    }

    func getFont(size: CGFloat) -> Font {

        let cfURL = Bundle.main.url( forResource: "Silkscreen-Regular", withExtension:
        "ttf")! as CFURL

        CTFontManagerRegisterFontsForURL(cfURL,CTFontManagerScope.process,nil)

        let font = Font.custom("Silkscreen-Regular", size: size)

        return font
    }
}


