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
                Image("teste")
                    .padding(.trailing, 40)
                Text("amoooo")
                    .frame(width: 600, height: 250)
                    .background(.cyan)
            }
            .padding(.bottom, 50)

            SpriteView(scene: scene)
                .frame(width: 900, height: 900, alignment: .bottom)
                .ignoresSafeArea()
                .navigationBarBackButtonHidden()
        }
        //.padding(.top, 300)



    }
}
